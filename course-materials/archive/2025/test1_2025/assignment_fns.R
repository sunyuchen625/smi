flush_right  <- function(x){
  outputFormat = knitr::opts_knit$get("rmarkdown.pandoc.to")
  if(outputFormat=="html"){
    return(x)
  }
  text <- str_c("\\begin{flushright}", 
                x, 
                "\\end{flushright}")
  return(text)
}

add_marks <- function(x){
  if(x > 1){
    mark <- str_c("[", x, " marks]")
  } else {
    mark <- str_c("[", x, " mark]")
  }
  Q_total  <<- Q_total + x
  q_mark <<- x # I have added this in to use for rubric functions.
  mark  <- flush_right(mark)
  return(mark)
}
add_Q_total  <- function(){
  A_total <<- A_total + Q_total
  mark <- str_c("[Question total: ", Q_total, "]")
  Q_total <<- 0
  return(flush_right(mark))
}
add_A_total  <- function(){
  mark <- str_c("[[Assignment total: ", A_total, "]]")
  Q_total <<- 0
  return(flush_right(mark))
}

ms  <- function(x){
  outputFormat = knitr::opts_knit$get("rmarkdown.pandoc.to")
  if(outputFormat == 'latex'){
    x  <- str_c("\\textcolor{red}{{\\bf Mark Scheme:} ",x,"}  ")
  }
  else if(outputFormat == 'html'){
    x  <- str_c("<font color='red'>Mark Scheme: ",x,"</font>  ")
  }
  cat(x)
}

am  <- function(x){
  outputFormat = knitr::opts_knit$get("rmarkdown.pandoc.to")
  if(outputFormat == 'latex'){
    x  <- str_c("\\textcolor{red}{[",x,"]}  ")
  }
  else if(outputFormat == 'html'){
    x  <- str_c("[",x,"]")
  }
  if(!params$ms){
    return("")
  }
  return(x)
}


### Matt Ryan
## Below are functions to automatically generate your marking rubric.
#' add_rubric_part
#' This function is to be placed after the add_mark function.  This will create the 
#' corresponding marking rubric for the question to import into MyUni.
#'
#' @param part - Character. This is the question part, i.e. part (a)
#' @param comments - Character vector. This is if you want to add meaningful comments to your marking scheme.  Note, each mark must have a comment.
#'
#' @return NA
add_rubric_part <- function(part, comments = NULL){
  # Make part a character, as this is a label
  part <- as.character(part)
  
  # If the user has input their own comments for the marking scheme, use those
  if(!is.null(comments)){
    # Ensure each mark has a comment
    if(length(comments) != (q_mark  + 1)){
      stop("Each mark in the rubric needs a comment")
    }
    tmp <- tibble(Criteria = part,
                  mark = 0:q_mark,
                  comment = comments) 
  }else{ # Otherwise use generic comments
    tmp <- tibble(Criteria = part,
                  mark = 0:q_mark) %>% 
      mutate(comment = case_when(mark == 0 ~ "No marks",
                                 mark == max(mark) ~ "Full marks",
                                 TRUE ~ "Partial marks")) 
  }
  # Update the question rubric
  question_rubric <<- question_rubric %>% 
    bind_rows(tmp)
  
  # Reset the mark counter
  q_mark <<- 0
}


#' add_rubric_question
#' This will finalise a question rubric with all the parts.
#' This should be placed after the question in the main .Rmd file.
#' 
#' @param q_num - Character or numeric. The number the question is.  This allows you to chop and change easily.
#' @param write - Logical. Should you write a rubric for each question
#' @param title - Character. The file name you want to write to if write = TRUE
#'
add_rubric_question <- function(q_num, write = FALSE, title = NULL){
  # If question is numeric, change to character
  if(is.numeric(q_num)){
    q_num <- str_c("Q", q_num)
  }
  # Append the question number to the parts
  question_rubric <<- question_rubric %>% 
    mutate(Criteria = str_c(q_num, Criteria))
  
  # Append question rubric to full rubric
  full_rubric <<- full_rubric %>% 
    bind_rows(question_rubric)
  
  if(write){ # Write out the individual question rubric
    write_rubric(title, question = TRUE)
  }
  
  # Reset the question rubric for the next question
  question_rubric <<- tibble(Criteria = character(),
                             mark = numeric(),
                             comment = character())
}


#' write_rubric
#' This will write out a rubric, making sure it is in the write .tsv format.
#'
#'
#' @param title - Character. What do you want to call your rubric
#' @param question - Logical.  This is used by add_rubric_question.
#' @param dir - Character.  Optional to specify the directory to save to.
#'
#' @return
#' @export
#'
#' @examples
write_rubric <- function(title, question = FALSE, dir = NULL){
  # If given a directory, use that file path.
  if(is.null(dir)){
    file_path <- str_c("../rubrics/", title, ".tsv")
  }else{
    file_path <- str_c(dir, title, ".tsv")
  }
  
  if(question){ # If saving a question, rearrange and write out question rubric
    max_mark <- as.character(max(question_rubric$mark))
    min_mark <- as.character(min(question_rubric$mark))
    question_rubric <<- question_rubric %>% 
      pivot_wider(names_from = mark, 
                  values_from = comment,
                  values_fill = "") %>% 
      select(Criteria, all_of(max_mark):all_of(min_mark))
    
    write_tsv(question_rubric, file_path)
  }else{ # Otherwise write out full rubric.
    max_mark <- as.character(max(full_rubric$mark))
    min_mark <- as.character(min(full_rubric$mark))
    full_rubric <<- full_rubric %>% 
      pivot_wider(names_from = mark, 
                  values_from = comment,
                  values_fill = "")  %>% 
      select(Criteria, all_of(max_mark):all_of(min_mark))
    
    
    write_tsv(full_rubric, file_path)
  }
}










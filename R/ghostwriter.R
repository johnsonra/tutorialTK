#' Write an Apple script to type some text into RStudio
#' 
#' @description This is used to write an Apple Script that will type some text into RStudio. It's primary purpose is for use in recording videos when I want to show live "typing" without any typos or delays while live typing.
#' 
#' @param file A file with the desired text to write
#' @param lines A numeric vector specifying which lines to type. If unspecified, the entire file will be typed out.
#' @param speed A number parameterizing the speed at which the script will type.
#' @param script A path to the location where the script will be written.
#' @param application The application where the keyboard input should go.
#' 
#' @note This currently only allows hard returns as special characters. Any other characters will be entered exactly as they appear in the file.
#' 
#' @return Returns the script invisibly.
#' 
#' @import magrittr
#' @import purrr
ghostwriter <- function(file, lines = NULL, speed = 0.1, script = 'ghostwrite.scpt', application = 'RStudio')
{
    l <- readLines(file)
    
    if(!is.null(lines))
        l <- l[lines]
    
    text <- paste(l, collapse = '\n') %>%
            strsplit('') %>%
            unlist() %>%
            map(~ ifelse(.x == '\n', 'return', paste0('"', .x, '"'))) %>%
            unlist()
    
    text <- paste0("    delay ", round(abs(rnorm(length(text), mean = speed, sd = speed/3)), 2), "\n",
                   '    tell application "System Events" to keystroke ', text , collapse = '\n')
    
    out <- paste('tell application "RStudio"',
                 '    activate', 
                 text,
                 'end tell', sep = '\n')

    cat(out, file = script)                    

    invisible(out)    
}

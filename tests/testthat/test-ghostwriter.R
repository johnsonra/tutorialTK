context("test-ghostwriter")

test_that("sanity checks",
{
    # sample input file
    f <- "https://raw.githubusercontent.com/johnsonra/tutorialTK/master/code.txt"
    
    fin <- readLines(f)
    fout <- ghostwriter(f, script = NULL)
    
    # should get the same number of hard returns as the number of lines in f
    expect_equal(length(strsplit(fout, 'return')[[1]]), length(fin))
    
    # number of lines should be two times the number of characters in f + number of hard returns * 2 + 1
    expect_equal(length(strsplit(fout, '\n')[[1]]), 2*sum(nchar(fin)) + 2*length(fin) + 1)
})

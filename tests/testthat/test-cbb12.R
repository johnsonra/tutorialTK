context("test-cbb12")

test_that("trit works",
{
    expect_equal(length(CBB12()), 9)
    
    expect_equal(length(CBB12(trit = FALSE)), 12)
})

test_that("order works",
{
    expect_equal(CBB12(1), "#016E82")
    expect_equal(CBB12(1, 'l2d'), "#A1FA82")
    expect_equal(CBB12(2, 'c'), "#F978FA")
})
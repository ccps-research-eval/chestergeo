x <- get_geo_data("MiddleSchoolBoundary")
y <- get_school_boundaries("middle")

test_that("consistency between functions", {
  expect_equal(x, y)
})

test_that("error for out of bounds level", {
  expect_error(get_school_boundaries("a"))
})

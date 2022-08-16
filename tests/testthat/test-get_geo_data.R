x <- get_geo_data("MiddleSchoolBoundary")

#x should return an sf obj
test_that("return an sf object", {
  expect_s3_class(x, "sf")
})

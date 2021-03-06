% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/ImageMath.R
\name{ImageMath}
\alias{ImageMath}
\title{ImageMath}
\usage{
ImageMath(...)
}
\arguments{
\item{...}{all parameters}
}
\description{
Perform math-operations on the given image.  The first argument should
be dimensionality, the 2nd the output image, the third a string
describing the operation.  The fourth should be in the input image.
Additional parameters should be specific for each function.  See the
the ImageMath help in ANTs.
}
\examples{
fi<-antsImageRead( getANTsRData("r16") ,2)
mask<-getMask(fi)
ImageMath( 2 , fi , "GD", fi , 1 )  # gray matter dilation
ImageMath( 2 , mask , "Neg", mask )  # negate
ImageMath( 2 , mask , "D", mask )  # distance transform
plot(mask)
}
\author{
Shrinidhi KL
}


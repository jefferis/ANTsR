% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/antsImageClone.R
\name{antsImageClone}
\alias{antsImageClone}
\title{Image Clone}
\usage{
antsImageClone(in_image, out_pixeltype = in_image@pixeltype)
}
\arguments{
\item{in_image}{Image object of S4 class 'antsImage' to be cloned.}

\item{out_pixeltype}{C++ datatype to be used to represent the pixels in the
output image. Allowed values: 'double', 'float', 'unsigned int', 'unsigned
char'.}
}
\value{
S4 object of Class 'antsImage' -- Success\cr 1 -- Failure
}
\description{
Clone an image object of S4 class 'antsImage'.
}
\examples{
\dontrun{
# clone an image 'img' of class 'antsImage' to an image of pixeltype 'double'
antsImageCone( img , 'double' )
}
}
\author{
Shrinidhi KL
}


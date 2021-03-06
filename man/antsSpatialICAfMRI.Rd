% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/antsSpatialICAfMRI.R
\name{antsSpatialICAfMRI}
\alias{antsSpatialICAfMRI}
\title{Perform spatial ICA on fMRI bold data.}
\usage{
antsSpatialICAfMRI(boldImages, maskImage = NA, numberOfICAComponents = 20,
  normalizeComponentImages = TRUE)
}
\arguments{
\item{boldImages}{a list of 4-D ANTs image fMRI data.}

\item{maskImage}{A 3-D ANTs image defining the region of interest.  This
must be specified.}

\item{numberOfICAComponents}{Number of estimated observers (components).}

\item{normalizeComponentImages}{Boolean to specify whether each component
vector element is normalized to its z-score.}
}
\value{
Output list includes standard ICA matrices from the fastICA
algorithm:

X = pre-processed data matrix

K = pre-whitening matrix that projects data onto the first n.comp principal
components

W = estimated un-mixing matrix (see definition in details)

A = estimated mixing matrix

S = estimated source matrix

and the component images.
}
\description{
Perform spatial ICA on group or individual fMRI data.  Preprocessing should
be performed prior to calling this function (cf antsPreprocessfMRI.R).
}
\examples{
\dontrun{
boldImages <- list()
boldImages[[1]] <- antsImageRead( "subject1.nii.gz", dim = 4, pixeltype = 'float' )
boldImages[[2]] <- antsImageRead( "subject2.nii.gz", dim = 4, pixeltype = 'float' )
boldImages[[3]] <- antsImageRead( "subject3.nii.gz", dim = 4, pixeltype = 'float' )
boldImages[[4]] <- antsImageRead( "subject4.nii.gz", dim = 4, pixeltype = 'float' )

maskImage <- NA

cleanBoldImages <- list()
for( i in 1:length( boldImages[[1]] ) )
  {
  fmri <- antsPreprocessfMRI( boldImages[[i]] )
  if( i == 1 )
    {
    maskImage <- fmri$maskImage
    }
  cleanBoldImages[[i]] <- fmri$cleanBoldImage
  }

icaResults <- antsSpatialICAfMRI( cleanBoldImages,
  numberOfICAComponents = 20, cleanBoldImages[[i]] )
componentImages <- icaResults$componentImages

# write out the component images
for( i in 1:length( icaResults$componentImages ) )
  {
  componentFileName <- paste0( 'componentImage', i, '.nii.gz' )
  cat( 'Writing ', componentFileName, '.\\n' )
  antsImageWrite( componentImages[[i]], componentFileName )
  }
}
}
\author{
Tustison NJ
}


\name{rbind}
\alias{rbind.Spectra}
\alias{rbind.SpectraDataFrame}

\title{Stacking \code{Spectra} objects together}

\usage{
  rbind.Spectra(..., create_new_ids = FALSE, new_ids = NULL)
  rbind.SpectraDataFrame(..., create_new_ids = FALSE, new_ids = NULL)
}
\arguments{
  \item{\dots}{The \code{Spectra} objects to be combined.}

  \item{create_new_ids}{allows creation of new ids if the ids of the \code{Spectra*} objects you are trying to stack are redondant}

  \item{new_ids}{vector of new ids to be given to the new object}
}
\value{
  a \code{Spectra*} object.
}

\description{
This method stacks two or more \code{Spectra*} objects together. 
}

\examples{
# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

s <- rbind(australia, australia, create_new_ids = TRUE)
summary(s)

l <- separate(australia, calibration = 0.6)
s <- rbind(l$validation, l$calibration)
summary(s)
}

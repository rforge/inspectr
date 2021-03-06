\name{split}
\docType{methods}
\alias{split}
\alias{split.Spectra}
\alias{split,Spectra-method}

\title{Split a Spectra* object using factors}

\usage{
split(x, f, drop = FALSE, ...)
}

\description{Splits a Spectra* object into groups using a factor, either a provided as a vector or as an attribute in the features of the object.}

\details{
This is an adaptation of the \code{split} function in the base package.
}

\value{A list of objects of same class as \code{x}.}

\arguments{
  \item{x}{Spectra object}
  \item{f}{either a vector of factors (for objects inheriting from \code{Spectra}), or the name or indice of an attribute in the data slot of an object inheriting from \code{SpectraDataFrame}}
  \item{drop}{ignored}
  \item{...}{further potential arguments passed to methods.}
}

\author{Pierre Roudier \url{pierre.roudier@gmail.com}}

\seealso{\code{\link{separate}}, \code{\link{melt_spectra}}, \code{\link{lapply}}, and the \code{l*pply} family of function inthe plyr package.}

\examples{
# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# On a Spectra object, we need to provide a vector of factors
# to split the object
s <- as(australia, 'Spectra')
# We make up some kind of factor to split the data. 
idx <- sample(letters[1:5], replace = TRUE, size = nrow(s)) # This is a vector
r <- split(s, idx)
str(r)

# On a SpectradataFrame object, we can also provide the name or index 
# of an attribute
australia$fact <- sample(LETTERS[1:3], size = nrow(australia), replace = TRUE) # Generate some kind of factor
summary(australia)
r <- split(australia, 'fact')
str(r)

# A list is returned, and is thus ready for use with lapply, or any
# of the l*ply functions from the plyr package
lapply(r, nrow)
}
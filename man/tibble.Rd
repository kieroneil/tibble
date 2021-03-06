% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataframe.R
\name{tibble}
\alias{tibble}
\alias{tibble_}
\alias{data_frame}
\alias{data_frame_}
\alias{lst}
\alias{lst_}
\title{Build a data frame or list.}
\usage{
tibble(...)

tibble_(xs)

data_frame(...)

data_frame_(xs)

lst(...)

lst_(xs)
}
\arguments{
\item{...}{A set of name-value pairs. Arguments are evaluated sequentially,
so you can refer to previously created variables.}

\item{xs}{A list of unevaluated expressions created with \code{~},
\code{quote()}, or \code{\link[lazyeval]{lazy}}.}
}
\description{
\code{tibble} is a trimmed down version of \code{\link{data.frame}} that:
\enumerate{
\item Never coerces inputs (i.e. strings stay as strings!).
\item Never adds \code{row.names}.
\item Never munges column names.
\item Only recycles length 1 inputs.
\item Evaluates its arguments lazily and in order.
\item Adds \code{tbl_df} class to output.
\item Automatically adds column names.
}
}
\details{
\code{lst} is similar to \code{\link{list}}, but like \code{tibble}, it
evaluates its arguments lazily and in order, and automatically adds names.

\code{data_frame} is an alias to \code{tibble}.
}
\examples{
a <- 1:5
tibble(a, b = a * 2)
tibble(a, b = a * 2, c = 1)
tibble(x = runif(10), y = x * 2)

lst(n = 5, x = runif(n))

# tibble never coerces its inputs
str(tibble(letters))
str(tibble(x = list(diag(1), diag(2))))

# or munges column names
tibble(`a + b` = 1:5)

# With the SE version, you give it a list of formulas/expressions
tibble_(list(x = ~1:10, y = quote(x * 2)))

# data frames can only contain 1d atomic vectors and lists
# and can not contain POSIXlt
\dontrun{
tibble(x = tibble(1, 2, 3))
tibble(y = strptime("2000/01/01", "\%x"))
}
}
\seealso{
\code{\link{as_tibble}} to turn an existing list into
  a data frame.
}


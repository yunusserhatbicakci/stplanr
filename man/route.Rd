% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/route.R
\name{route}
\alias{route}
\title{Plan routes on the transport network}
\usage{
route(
  from = NULL,
  to = NULL,
  l = NULL,
  route_fun = cyclestreets::journey,
  n_print = 10,
  list_output = FALSE,
  cl = NULL,
  ...
)
}
\arguments{
\item{from}{An object representing origins
(if lines are provided as the first argument, from is assigned to \code{l})}

\item{to}{An object representing destinations}

\item{l}{Only needed if from and to are empty, in which case this
should be a spatial object representing desire lines}

\item{route_fun}{A routing function to be used for converting the straight lines to routes
\code{\link[=od2line]{od2line()}}}

\item{n_print}{A number specifying how frequently progress updates
should be shown}

\item{list_output}{If FALSE (default) assumes spatial (linestring) object output. Set to TRUE to save output as a list.}

\item{cl}{Cluster}

\item{...}{Arguments passed to the routing function, e.g. \code{\link[=route_cyclestreets]{route_cyclestreets()}}}
}
\description{
Takes origins and destinations, finds the optimal routes between them
and returns the result as a spatial (sf or sp) object.
The definition of optimal depends on the routing function used
}
\examples{
r <- overline(routes_fast_sf[2:5, ], "length")
l <- od2line(od_data_sample[2:5, 1:3], cents_sf)
sln <- stplanr::SpatialLinesNetwork(r)
# calculate shortest paths
plot(sln)
plot(l$geometry, add = TRUE)
sp <- stplanr::route(
  l = l,
  route_fun = stplanr::route_local,
  sln = sln
)
plot(sp["all"], add = TRUE, lwd = 5)
}
\seealso{
Other routes: 
\code{\link{line2routeRetry}()},
\code{\link{line2route}()},
\code{\link{route_dodgr}()},
\code{\link{route_graphhopper}()},
\code{\link{route_local}()},
\code{\link{route_transportapi_public}()}
}
\concept{routes}

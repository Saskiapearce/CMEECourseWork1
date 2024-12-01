library(terra)     # core raster GIS package
library(sf)        # core vector GIS package
library(units)     # used for precise unit conversion

library(geodata)   # Download and load functions for core datasets
library(openxlsx)  # Reading data from Excel files

######## making vectors ########
pop_dens <- data.frame(
  n_km2 = c(260, 67,151, 4500, 133), 
  country = c('England','Scotland', 'Wales', 'London', 'Northern Ireland')
)
print(pop_dens)

# Create coordinates  for each country 
# - this creates a matrix of pairs of coordinates forming the edge of the polygon. 
# - note that they have to _close_: the first and last coordinate must be the same.
scotland <- rbind(c(-5, 58.6), c(-3, 58.6), c(-4, 57.6), 
                  c(-1.5, 57.6), c(-2, 55.8), c(-3, 55), 
                  c(-5, 55), c(-6, 56), c(-5, 58.6))
england <- rbind(c(-2,55.8),c(0.5, 52.8), c(1.6, 52.8), 
                 c(0.7, 50.7), c(-5.7,50), c(-2.7, 51.5), 
                 c(-3, 53.4),c(-3, 55), c(-2,55.8))
wales <- rbind(c(-2.5, 51.3), c(-5.3,51.8), c(-4.5, 53.4),
               c(-2.8, 53.4),  c(-2.5, 51.3))
ireland <- rbind(c(-10,51.5), c(-10, 54.2), c(-7.5, 55.3),
                 c(-5.9, 55.3), c(-5.9, 52.2), c(-10,51.5))

# Convert these coordinates into feature geometries
# - these are simple coordinate sets with no projection information
scotland <- st_polygon(list(scotland))
england <- st_polygon(list(england))
wales <- st_polygon(list(wales))
ireland <- st_polygon(list(ireland))

# Combine geometries into a simple feature column
# aka make these features into one list using st_sfc
uk_eire_sfc <- st_sfc(wales, england, scotland, ireland, crs=4326)
plot(uk_eire_sfc, asp=1)

# plot the list

# Using log and lan in a dataframe for future plotting 
uk_eire_capitals <- data.frame(
  long= c(-0.1, -3.2, -3.2, -6.0, -6.25),
  lat=c(51.5, 51.5, 55.8, 54.6, 53.30),
  name=c('London', 'Cardiff', 'Edinburgh', 'Belfast', 'Dublin')
)

# plot the capital cites base don logitide and latitdue
# Indicate which fields in the data frame contain the coordinates
uk_eire_capitals <- st_as_sf(uk_eire_capitals, coords=c('long','lat'), crs=4326)
print(uk_eire_capitals)

# adding an individual point to london using the lat and log 
# st_point - add a point 
st_pauls <- st_point(x=c(-0.098056, 51.513611))
london <- st_buffer(st_pauls, 0.25)

england_no_london <- st_difference(england, london)
lengths(scotland)
# distance between england, london and scotland 

lengths(england_no_london)

wales <- st_difference(wales, england)

# A rough polygon that includes Northern Ireland and surrounding sea.
# - not the alternative way of providing the coordinates
nothern_island_area <- st_polygon(list(cbind(x=c(-8.1, -6, -5, -6, -8.1), y=c(54.4, 56, 55, 54, 54.4))))
# cbind binds to append

northern_ireland <- st_intersection(ireland, nothern_island_area)
eire <- st_difference(ireland, nothern_island_area)

# Combine the final geometries
uk_eire_sfc <- st_sfc(wales, england_no_london, scotland, london, northern_ireland, eire, crs=4326)
# compare six Polygon features with one Multipolygon feature
print(uk_eire_sfc)
# make the UK into a single feature
uk_country <- st_union(uk_eire_sfc[-6])
print(uk_country)

# Plot them - potting the dataframe of lat and long for polygons 
par(mfrow=c(1, 2), mar=c(3,3,1,1))
plot(uk_eire_sfc, asp=1, col=rainbow(6))
plot(st_geometry(uk_eire_capitals), add=TRUE)
plot(uk_country, asp=1, col='lightblue')

uk_eire_sf <- st_sf(name=c('Wales', 'England','Scotland', 'London', 
                           'Northern Ireland', 'Eire'),
                    geometry=uk_eire_sfc)

print(uk_eire_sf)
plot(uk_eire_sf['name'], asp=1)

uk_eire_sf$capital <- c('Cardiff', 'London', 'Edinburgh', 
                        NA, 'Belfast','Dublin')
print(uk_eire_sf)

uk_eire_centroids <- st_centroid(uk_eire_sf)
st_coordinates(uk_eire_centroids)

uk_eire_sf$area <- st_area(uk_eire_sf)

# To calculate a 'length' of a polygon, you have to convert it to a LINESTRING or a 
# MULTILINESTRING. Using MULTILINESTRING will automatically include all perimeter of a 
# polygon (including holes).
uk_eire_sf$length <- st_length(st_cast(uk_eire_sf, 'MULTILINESTRING'))

# Look at the result
print(uk_eire_sf)

# You can change units in a neat way
uk_eire_sf$area <- set_units(uk_eire_sf$area, 'km^2')
uk_eire_sf$length <- set_units(uk_eire_sf$length, 'km')
print(uk_eire_sf)

# Or you can simply convert the `units` version to simple numbers
uk_eire_sf$length <- as.numeric(uk_eire_sf$length)

# And it won't let you make silly error like turning a length into weight
uk_eire_sf$area <- set_units(uk_eire_sf$area, 'kg')
st_distance(uk_eire_sf)
st_distance(uk_eire_centroids)
plot(uk_eire_sf['n_km2'], asp=1)


# Next pic

# British National Grid (EPSG:27700)
uk_eire_BNG <- st_transform(uk_eire_sf, 27700)
# UTM50N (EPSG:32650)
uk_eire_UTM50N <- st_transform(uk_eire_sf, 32650)
# The bounding boxes of the data shows the change in units
st_bbox(uk_eire_sf)

# Plot the results
par(mfrow=c(1, 3), mar=c(3,3,1,1))
plot(st_geometry(uk_eire_sf), asp=1, axes=TRUE, main='WGS 84')
plot(st_geometry(uk_eire_BNG), axes=TRUE, main='OSGB 1936 / BNG')
plot(st_geometry(uk_eire_UTM50N), axes=TRUE, main='UTM 50N')

# Set up some points separated by 1 degree latitude and longitude from St. Pauls
st_pauls <- st_sfc(st_pauls, crs=4326)
one_deg_west_pt <- st_sfc(st_pauls - c(1, 0), crs=4326) # near Goring
one_deg_north_pt <-  st_sfc(st_pauls + c(0, 1), crs=4326) # near Peterborough
# Calculate the distance between St Pauls and each point
st_distance(st_pauls, one_deg_west_pt)
st_distance(st_pauls, one_deg_north_pt)

st_distance(st_transform(st_pauls, 27700), 
            st_transform(one_deg_west_pt, 27700))


########Rasta's########

# Create an empty raster object covering UK and Eire
uk_raster_WGS84 <- rast(xmin=-11,  xmax=2,  ymin=49.5, ymax=59, 
                        res=0.5, crs="EPSG:4326")
hasValues(uk_raster_WGS84)

# Add data to the raster - just use the cell numbers
values(uk_raster_WGS84) <- cells(uk_raster_WGS84)
print(uk_raster_WGS84)

plot(uk_raster_WGS84)
plot(st_geometry(uk_eire_sf), add=TRUE, border='black', lwd=2, col='#FFFFFF44')

# Define a simple 4 x 4 square raster
m <- matrix(c(1, 1, 3, 3,
              1, 2, 4, 3,
              5, 5, 7, 8,
              6, 6, 7, 7), ncol=4, byrow=TRUE)
square <- rast(m)

plot(square, legend=NULL)
text(square, digits=2)

# Average values
square_agg_mean <- aggregate(square, fact=2, fun=mean)
plot(square_agg_mean, legend=NULL)
text(square_agg_mean, digits=2)

# Maximum values
square_agg_max <- aggregate(square, fact=2, fun=max)
plot(square_agg_max, legend=NULL)
text(square_agg_max, digits=2)

# Simply duplicate the nearest parent value
square_disagg <- disagg(square, fact=2, method='near')
plot(square_disagg, legend=NULL)
text(square_disagg, digits=2)

# Use bilinear interpolation
square_interp <- disagg(square, fact=2, method='bilinear')
plot(square_interp, legend=NULL)
text(square_interp, digits=1)

# make two simple `sfc` objects containing points in  the
# lower left and top right of the two grids
uk_pts_WGS84 <- st_sfc(st_point(c(-11, 49.5)), st_point(c(2, 59)), crs=4326)
uk_pts_BNG <- st_sfc(st_point(c(-2e5, 0)), st_point(c(7e5, 1e6)), crs=27700)

#  Use st_make_grid to quickly create a polygon grid with the right cellsize
uk_grid_WGS84 <- st_make_grid(uk_pts_WGS84, cellsize=0.5)
uk_grid_BNG <- st_make_grid(uk_pts_BNG, cellsize=1e5)

# Reproject BNG grid into WGS84
uk_grid_BNG_as_WGS84 <- st_transform(uk_grid_BNG, 4326)

# Plot the features
par(mar=c(0,0,0,0))
plot(uk_grid_WGS84, asp=1, border='grey', xlim=c(-13,4))
plot(st_geometry(uk_eire_sf), add=TRUE, border='darkgreen', lwd=2)
plot(uk_grid_BNG_as_WGS84, border='red', add=TRUE)

# Create the target raster
uk_raster_BNG <- rast(xmin=-200000, xmax=700000, ymin=0, ymax=1000000,
                      res=100000, crs='+init=EPSG:27700')
uk_raster_BNG_interp <- project(uk_raster_WGS84, uk_raster_BNG, method='bilinear')
uk_raster_BNG_near <- project(uk_raster_WGS84, uk_raster_BNG, method='near')


par(mfrow=c(1,2), mar=c(0,0,0,0))
plot(uk_raster_BNG_interp, main='Interpolated', axes=FALSE, legend=FALSE)
text(uk_raster_BNG_interp, digit=1)
plot(uk_raster_BNG_near, main='Nearest Neighbour',axes=FALSE, legend=FALSE)
text(uk_raster_BNG_near)

# Create the target raster 
uk_20km <- rast(xmin=-200000, xmax=650000, ymin=0, ymax=1000000, 
                res=20000, crs='+init=EPSG:27700')

# Rasterizing polygons
uk_eire_poly_20km  <- rasterize(uk_eire_BNG, uk_20km, field='name')

plot(uk_eire_poly_20km)


uk_eire_BNG$name <- as.factor(uk_eire_BNG$name)
st_agr(uk_eire_BNG) <- 'constant'

# Rasterizing lines.
uk_eire_BNG_line <- st_cast(uk_eire_BNG, 'LINESTRING')
uk_eire_line_20km <- rasterize(uk_eire_BNG_line, uk_20km, field='name')

# Rasterizing points 
# - This isn't quite as neat as there are two steps in the casting process:
#   Polygon -> Multipoint -> Point
uk_eire_BNG_point <- st_cast(st_cast(uk_eire_BNG, 'MULTIPOINT'), 'POINT')
uk_eire_point_20km <- rasterize(uk_eire_BNG_point, uk_20km, field='name')

# Plotting those different outcomes
# - Use the hcl.colors function to create a nice plotting palette
color_palette <- hcl.colors(6, palette='viridis', alpha=0.5)

# - Plot each raster
par(mfrow=c(1,3), mar=c(1,1,1,1))
plot(uk_eire_poly_20km, col=color_palette, legend=FALSE, axes=FALSE)
plot(st_geometry(uk_eire_BNG), add=TRUE, border='red')

plot(uk_eire_line_20km, col=color_palette, legend=FALSE, axes=FALSE)
plot(st_geometry(uk_eire_BNG), add=TRUE, border='red')

plot(uk_eire_point_20km, col=color_palette, legend=FALSE, axes=FALSE)
plot(st_geometry(uk_eire_BNG), add=TRUE, border='red')

# for polygones, cells are only in luded if the centre falls in the polygon 
# cells are included if the line touches the cell at all 
# reverse - raster to vector

# Get a set of dissolved polygons (the default) including NA cells
poly_from_rast <- as.polygons(uk_eire_poly_20km, na.rm=FALSE)

# Get individual cells (no dissolving)
cells_from_rast <- as.polygons(uk_eire_poly_20km, dissolve=FALSE)

# Get individual points
points_from_rast <- as.points(uk_eire_poly_20km)

print(st_as_sf(poly_from_rast))
print(st_as_sf(cells_from_rast))
print(st_as_sf(points_from_rast))
# Plot the outputs - using key.pos=NULL to suppress the key
par(mfrow=c(1,3), mar=c(1,1,1,1))
plot(poly_from_rast, key.pos = NULL)
plot(cells_from_rast, key.pos = NULL)
plot(points_from_rast, key.pos = NULL, pch=4)

# saving the vector datd 
st_write(uk_eire_sf, 'practical_data/uk/uk_eire_WGS84.shp') 
st_write(uk_eire_BNG, 'practical_data/uk/uk_eire_BNG.shp')

# saving rasta data useing GeoTIFF file format which is one of the most common GIS raster data formats 
# Save a GeoTiff
writeRaster(uk_raster_BNG_interp, 'practical_data/uk/uk_raster_BNG_interp.tif')
# Save an ASCII format file: human readable text. 
# Note that this format also creates an aux.xml and .prj file!
writeRaster(uk_raster_BNG_near, 'practical_data/uk/uk_raster_BNG_ngb.asc', filetype='AAIGrid')

# loading Vector / rasta data 
# Load a vector shapefile
ne_110 <- st_read('practical_data/ne_110m_admin_0_countries/ne_110m_admin_0_countries.shp')
# Also load some WHO data on 2016 life expectancy
# see: http://apps.who.int/gho/athena/api/GHO/WHOSIS_000001?filter=YEAR:2016;SEX:BTSX&format=csv
life_exp <- read.csv(file = "practical_data/WHOSIS_000001.csv")

##### world topographcial image #####

etopo_25 <- rast('practical_data/etopo_25.tif')
# Look at the data content
print(etopo_25)
# Plot it 
plot(etopo_25, plg=list(ext=c(190, 210, -90, 90)))

# Define a sequence of 65 breakpoints along an elevation gradient from -10 km to 6 km.
# There are 64 intervals between these breaks and each interval will be assigned a 
# colour
breaks <- seq(-10000, 6000, by=250)

# Define 24 land colours for use above sea level (0m)
land_cols  <- terrain.colors(24)

# Generate a colour palette function for sea colours
sea_pal <- colorRampPalette(c('darkslateblue', 'steelblue', 'paleturquoise'))

# Create 40 sea colours for use below sea level
sea_cols <- sea_pal(40)

# Plot the raster providing the breaks and combining the two colour sequences to give 
# 64 colours that switch from sea to land colour schems at 0m.
plot(etopo_25, axes=FALSE, breaks=breaks,
     col=c(sea_cols, land_cols), type='continuous',
     plg=list(ext=c(190, 200, -90, 90))
)

# Download bioclim data: global maximum temperature at 10 arc minute resolution
tmax <- worldclim_global(var='tmax', res=10, path='practical_data')
# The data has 12 layers, one for each month
print(tmax)

# Extract  January and July data and the annual maximum by location.
tmax_jan <- tmax[[1]]
tmax_jul <- tmax[[7]]
tmax_max <- max(tmax)

# Plot those maps
par(mfrow=c(2,2), mar=c(2,2,1,1))
bks <- seq(-50, 50, length=101)
pal <- colorRampPalette(c('lightblue','grey', 'firebrick'))
cols <- pal(100)
plg <- list(ext=c(190, 200, -90, 90))

# plotting some really cool temperature infomraiton
plot(tmax_jan, col=cols, breaks=bks, 
     main='January maximum temperature', type='continuous', plg=plg)
plot(tmax_jul, col=cols, breaks=bks, 
     main='July maximum temperature', type='continuous', plg=plg)
plot(tmax_max, col=cols, breaks=bks, 
     main='Annual maximum temperature', type='continuous', plg=plg)

# cropping data cause maybe you dont want the whole world in there: 
so_extent <- ext(-60, -20, -65, -45)

# The crop function for raster data...
so_topo <- crop(etopo_25, so_extent)

# ... and the st_crop function to reduce some higher resolution coastline data
ne_10 <- st_read('practical_data/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp')
st_agr(ne_10) <- 'constant'
so_ne_10 <- st_crop(ne_10, so_extent)

sea_pal <- colorRampPalette(c('grey30', 'grey50', 'grey70'))

# Plot the underlying sea bathymetry
plot(so_topo, col=sea_pal(100), asp=1, legend=FALSE)
contour(so_topo, levels=c(-2000, -4000, -6000), add=TRUE, col='grey80')

# Add the land
plot(st_geometry(so_ne_10), add=TRUE, col='khaki', border='grey40')

# Show the sampling sites
plot(st_geometry(so_data), add=TRUE, pch=4, cex=2, col='white', lwd=3)

##### alien invasion practical #####

# map the world
# map which contries have more less then 1000 people per alien
#load alien data and human population data 
# Load a vector shapefile
humanpop <- st_read('practical_data/ne_110m_admin_0_countries/ne_110m_admin_0_countries.shp')
humanpop
aliens <- st_read('practical_data/aliens.csv')
# convert from dataframe into st file type
aliens <- st_as_sf(aliens, coords=c('long','lat'), crs=4326)

# Add country information and find the total number of aliens per country
aliens <- st_join(aliens, humanpop['ADMIN']) # joins the name of the country "admin" based on the long and lat of aliens dataset 


aliens_by_country <- aggregate(n_aliens ~ ADMIN, data=aliens, FUN=sum)

# Add the alien counts into the country data 
humanpop <- merge(humanpop, aliens_by_country, all.x=TRUE)
humanpop$people_per_alien <- with(humanpop,  POP_EST / n_aliens )

# Find which countries are in danger
humanpop$in_danger <- humanpop$people_per_alien < 1000

# Plot the danger map
plot(humanpop['in_danger'], pal=c('grey', 'red'), key.pos=4)

# main fucntions to use 
st_polygon(list()) # Makes a polygon from the points 
st_sfc() # Combines polygones into a simple feature column 
st_sf() #  
st_buffer() # 
st_difference(england, london) #remove London from the England polygon
st_intersection(ireland, ni_area) # intersection operation to separate Northern Ireland from the island of Ireland.
st_union() #combines things into a single polygon
st_geometry() #
merge() 
st_centroid()
st_coordinates()
st_area()
st_length()
st_cast()
st_write() # save data
writeRaster()
st_as_sf()
st_read('data/..')
# rasta's
rast()
aggregate()
disagg()
rasterize()
as.polygons()
as.points()


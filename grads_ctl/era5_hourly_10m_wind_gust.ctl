* ERA5 hourly 10m wind gust since previous post-processing (NetCDF, template)
* Grid: 0.25 x 0.25 deg global, surface only
* Files: one per month, e.g. era5_hourly_10m_wind_gust_since_previous_post_processing_YYYYMM.nc
* Real path (no symlinks) for Slurm compatibility
*
DSET /lustre/soge1/data/analysis/era5/0.28125x0.28125/hourly/10m_wind_gust_since_previous_post_processing/nc/era5_hourly_10m_wind_gust_since_previous_post_processing_%y4%m2.nc
DTYPE netcdf
OPTIONS template yrev
TITLE ERA5 hourly 10m wind gust since previous post-processing
UNDEF -32767
XDEF 1440 LINEAR 0 0.25
YDEF 721 LINEAR -90 0.25
ZDEF 1 LINEAR 1 1
TDEF 840000 LINEAR 00Z01jan1940 1hr
VARS 1
fg10 0 t,y,x 10 metre wind gust since previous post-processing [m s**-1]
ENDVARS

* ERA5 daily 2-metre temperature (NetCDF, template)
* Grid: 0.25 x 0.25 deg global, surface only
* Files: one per year, e.g. era5_daily_2m_temperature_YYYY.nc
* Real path (no symlinks) for Slurm compatibility
*
DSET /lustre/soge1/data/analysis/era5/0.28125x0.28125/daily/2m_temperature/nc/era5_daily_2m_temperature_%y4.nc
DTYPE netcdf
OPTIONS template yrev
TITLE ERA5 daily 2-metre temperature
UNDEF -32767
XDEF 1440 LINEAR 0 0.25
YDEF 721 LINEAR -90 0.25
ZDEF 1 LINEAR 1 1
TDEF 35000 LINEAR 01jan1940 1dy
VARS 1
t2m 0 t,y,x 2 metre temperature [K]
ENDVARS

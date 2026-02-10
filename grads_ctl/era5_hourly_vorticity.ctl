* ERA5 hourly vorticity (relative) (NetCDF, template)
* Grid: 0.25 x 0.25 deg global, 37 pressure levels
* Files: one per month, e.g. era5_hourly_vorticity_YYYY_MM.nc
* NOTE: this variable uses underscore between year and month (YYYY_MM)
* Real path (no symlinks) for Slurm compatibility
*
DSET /lustre/soge1/data/analysis/era5/0.28125x0.28125/hourly/vorticity/nc/era5_hourly_vorticity_%y4_%m2.nc
DTYPE netcdf
OPTIONS template yrev
TITLE ERA5 hourly vorticity (relative)
UNDEF -32767
XDEF 1440 LINEAR 0 0.25
YDEF 721 LINEAR -90 0.25
ZDEF 37 LEVELS 1 2 3 5 7 10 20 30 50 70 100 125 150 175 200 225 250 300 350 400 450 500 550 600 650 700 750 775 800 825 850 875 900 925 950 975 1000
TDEF 840000 LINEAR 00Z01jan1940 1hr
VARS 1
vo 37 t,z,y,x Vorticity (relative) [s**-1]
ENDVARS

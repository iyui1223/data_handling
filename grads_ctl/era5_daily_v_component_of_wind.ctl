* ERA5 daily V component of wind (NetCDF, template)
* Grid: 0.25 x 0.25 deg global, 37 pressure levels
* Files: one per year, e.g. era5_daily_v_component_of_wind_YYYY.nc
* Real path (no symlinks) for Slurm compatibility
*
DSET /lustre/soge1/data/analysis/era5/0.28125x0.28125/daily/v_component_of_wind/nc/era5_daily_v_component_of_wind_%y4.nc
DTYPE netcdf
OPTIONS template yrev
TITLE ERA5 daily V component of wind
UNDEF -32767
XDEF 1440 LINEAR 0 0.25
YDEF 721 LINEAR -90 0.25
ZDEF 37 LEVELS 1 2 3 5 7 10 20 30 50 70 100 125 150 175 200 225 250 300 350 400 450 500 550 600 650 700 750 775 800 825 850 875 900 925 950 975 1000
TDEF 35000 LINEAR 01jan1940 1dy
VARS 1
v 37 t,z,y,x V component of wind [m s**-1]
ENDVARS

* Climatology: U wind at 200 hPa, daily (366 days), 1991-2020 mean
* Grid: 0.25 x 0.25 deg global, single level (200 hPa)
* Single file, no template
*
DSET /lustre/soge1/projects/andante/cenv1201/scripts/kotesaki_tools/climatology/climatology/clim_U200_1991-2020.nc
DTYPE netcdf
OPTIONS yrev
TITLE Climatological daily mean U wind at 200 hPa (1991-2020)
UNDEF 9.999e20
XDEF 1440 LINEAR 0 0.25
YDEF 721 LINEAR -90 0.25
ZDEF 1 LINEAR 1 1
TDEF 366 LINEAR 01jan2000 1dy
VARS 1
u 0 t,y,x U component of wind at 200 hPa [m s**-1]
ENDVARS

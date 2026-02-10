# GrADS Control Files for ERA5 Data Access

Central repository of `.ctl` files for accessing ERA5 reanalysis data
(0.25 x 0.25 deg global) via GrADS, with template-based multi-file access.

**Data root (real path, no symlinks):**
`/lustre/soge1/data/analysis/era5/0.28125x0.28125/`

**Note on symlinks:** `/soge-home/data` is a symlink to `/lustre/soge1/data`.
All `.ctl` files use the real `/lustre/soge1/` path to avoid confusion in
Slurm batch jobs.

---

## Quick Start

```grads
* In GrADS, open a control file:
open /path/to/grads_data_handling/era5_daily_temperature.ctl

* Set time and level, then display:
set t 1
set lev 500
d t
```

Or from a Slurm batch script:
```bash
grads -blc "open /path/to/grads_data_handling/era5_daily_temperature.ctl ; ..."
```

---

## Control File Catalog

### Daily NetCDF -- Surface Variables (one file per year: `_YYYY.nc`)

| .ctl file                                | NetCDF var | Description                    | Units       |
|------------------------------------------|------------|--------------------------------|-------------|
| `era5_daily_2m_temperature.ctl`          | t2m        | 2-metre temperature            | K           |
| `era5_daily_2m_dewpoint_temperature.ctl` | d2m        | 2-metre dewpoint temperature   | K           |
| `era5_daily_mean_sea_level_pressure.ctl` | msl        | Mean sea level pressure        | Pa          |
| `era5_daily_surface_pressure.ctl`        | sp         | Surface pressure               | Pa          |

### Daily NetCDF -- Pressure-Level Variables

**Yearly files** (`_YYYY.nc`):

| .ctl file                                | NetCDF var | Description          | Levels | Units       |
|------------------------------------------|------------|----------------------|--------|-------------|
| `era5_daily_u_component_of_wind.ctl`     | u          | U component of wind  | 37     | m s**-1     |
| `era5_daily_v_component_of_wind.ctl`     | v          | V component of wind  | 37     | m s**-1     |
| `era5_daily_vertical_velocity.ctl`       | w          | Vertical velocity    | 37     | Pa s**-1    |

**Monthly files** (`_YYYY_MM.nc`):

| .ctl file                                | NetCDF var | Description          | Levels | Units       |
|------------------------------------------|------------|----------------------|--------|-------------|
| `era5_daily_geopotential.ctl`            | z          | Geopotential         | 37     | m**2 s**-2  |
| `era5_daily_temperature.ctl`             | t          | Temperature          | 37     | K           |

### Hourly NetCDF -- Pressure-Level Variables (one file per month: `_YYYYMM.nc`)

| .ctl file                                | NetCDF var | Description                 | Levels | Units       |
|------------------------------------------|------------|-----------------------------|--------|-------------|
| `era5_hourly_geopotential.ctl`           | z          | Geopotential                | 37     | m**2 s**-2  |
| `era5_hourly_temperature.ctl`            | t          | Temperature                 | 37     | K           |
| `era5_hourly_specific_humidity.ctl`      | q          | Specific humidity           | 37     | kg kg**-1   |
| `era5_hourly_u_component_of_wind.ctl`    | u          | U component of wind         | 37     | m s**-1     |
| `era5_hourly_v_component_of_wind.ctl`    | v          | V component of wind         | 37     | m s**-1     |
| `era5_hourly_vertical_velocity.ctl`      | w          | Vertical velocity           | 37     | Pa s**-1    |
| `era5_hourly_vorticity.ctl`              | vo         | Vorticity (relative)        | 37     | s**-1       |

Note: vorticity files use `_YYYY_MM.nc` (underscore between year and month).

### Hourly NetCDF -- Surface Variables (one file per month: `_YYYYMM.nc`)

| .ctl file                                | NetCDF var | Description                                      | Units     |
|------------------------------------------|------------|--------------------------------------------------|-----------|
| `era5_hourly_10m_wind_gust.ctl`          | fg10       | 10m wind gust since previous post-processing     | m s**-1   |

---

## Common Grid Specification

All files share the same global grid:
- **Resolution:** 0.25 x 0.25 degrees
- **Longitude:** 1440 points, 0 to 359.75 E
- **Latitude:** 721 points, 90 N to 90 S (stored N-to-S; `OPTIONS yrev` applied)
- **Pressure levels** (37, where applicable):
  1, 2, 3, 5, 7, 10, 20, 30, 50, 70, 100, 125, 150, 175, 200, 225, 250,
  300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 775, 800, 825, 850,
  875, 900, 925, 950, 975, 1000 hPa

## Time Coverage

All `.ctl` files define TDEF starting from **01jan1940**, matching the full
ERA5 reanalysis period. Data may not be locally available for all years --
if a requested date returns undefined values, the corresponding NetCDF file
has not yet been downloaded. Contact the data admin to request downloads.

---

## Variables NOT Covered by .ctl Files

### Daily -- non-standard naming (cannot template)
- **total_precipitation (tp):** files named by decade (`_1970s.nc`, `_1980s.nc`, ...);
  use `sdfopen` directly.
- **schwendike_overturning:** custom naming convention (`sl.YYYYMM.daymean.nc`);
  use `sdfopen` directly.

### Hourly -- non-standard naming
- **universal_thermal_climate_index:** files named `ECMWF_utci_YYYY_v1.1_con.nc`;
  use `sdfopen` directly.
- **z (geopotential subset at 700 hPa):** files named with hour suffix;
  use `sdfopen` directly.

### Invariant fields (single-file, no time series)
Located at `.../invariant/<variable>/nc/era5_invariant_<variable>_20000101.nc`.
Open directly with `sdfopen`:
- geopotential, land-sea_mask, soil_type, lake_cover, lake_depth,
  high/low_vegetation_cover, type_of_high/low_vegetation,
  orography statistics, etc.

---

## GRIB Files

Many hourly and most monthly variables are stored in **GRIB format only**
(no NetCDF available). GrADS can open GRIB files, but it requires:

1. A `.ctl` file with `DTYPE grib` (or `grib2`) and GRIB parameter codes
   in the VARS section instead of NetCDF variable names.
2. An index file generated by running `gribmap -i <file>.ctl`.

### GRIB-only variables (not covered here)

**Hourly (GRIB):** 2m_temperature, 2m_dewpoint_temperature,
10m_u/v_component_of_wind, mean_sea_level_pressure, surface_pressure,
total_precipitation, convective_available_potential_energy,
snow_depth, snowfall, surface heat fluxes, radiation fields,
moisture flux/divergence, instantaneous_10m_wind_gust, etc.

**Monthly (GRIB, all variables):** 2m_temperature, geopotential,
temperature, u/v_component_of_wind, vertical_velocity, MSLP,
specific_humidity, relative_humidity, sea_surface_temperature,
precipitation fields, soil moisture layers, divergence, etc.

Creating `.ctl` + `.idx` files for GRIB data is a future task.
For immediate access to GRIB files, consider using CDO or eccodes
(`cdo sinfon file.grb`, `grib_ls file.grb`) to inspect contents.

---

## Technical Notes

- All DSET paths use `/lustre/soge1/...` (the real filesystem path),
  **not** `/soge-home/data/...` (which is a symlink), to avoid issues
  in Slurm batch jobs.
- `OPTIONS yrev` is set because ERA5 NetCDF latitude runs north-to-south
  while GrADS YDEF runs south-to-north.
- `UNDEF -32767` matches the `_FillValue` / `missing_value` in the NetCDF files.
- Multi-variable `.ctl` files are not possible here because each variable
  is stored in a separate directory tree. Each variable gets its own `.ctl`.

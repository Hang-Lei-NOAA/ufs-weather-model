help([[
Load environment to compile ufs-weather-model inside an HPC-ME container
built from Dockerfile-ufs-rockylinux9-intel2025.3 (Intel oneAPI 2025.3 + Intel MPI).

All UFS libraries are installed under /opt/ufs-env by Spack.
]])

-- Spack view provides all UFS libraries
local view = "/opt/ufs-env"
prepend_path("PATH",            pathJoin(view, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(view, "lib"))
prepend_path("LD_LIBRARY_PATH", pathJoin(view, "lib64"))
prepend_path("PKG_CONFIG_PATH", pathJoin(view, "lib/pkgconfig"))
prepend_path("CMAKE_PREFIX_PATH", view)

-- Intel MPI wrappers
local impi = "/opt/intel/oneapi/mpi/2021.13"
prepend_path("PATH",            pathJoin(impi, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(impi, "lib"))

setenv("CC",  "mpiicx")
setenv("CXX", "mpiicpx")
setenv("FC",  "mpiifort")
setenv("I_MPI_CC",  "icx")
setenv("I_MPI_CXX", "icpx")
setenv("I_MPI_F90", "ifx")

setenv("CMAKE_Platform", "container.intel")
setenv("CMAKE_PREFIX_PATH", view)

-- Library version hints (matches ufs_common.lua defaults)
setenv("jasper_ver",         "2.0.32")
setenv("libpng_ver",         "1.6.37")
setenv("hdf5_ver",           "1.14.3")
setenv("netcdf_c_ver",       "4.9.2")
setenv("netcdf_fortran_ver", "4.6.1")
setenv("parallelio_ver",     "2.6.2")
setenv("esmf_ver",           "8.8.0")
setenv("fms_ver",            "2024.02")
setenv("bacio_ver",          "2.4.1")
setenv("crtm_ver",           "2.4.0.1")
setenv("g2_ver",             "3.5.1")
setenv("g2tmpl_ver",         "1.13.0")
setenv("ip_ver",             "5.1.0")
setenv("sp_ver",             "2.5.0")
setenv("w3emc_ver",          "2.10.0")
setenv("gftl_shared_ver",    "1.9.0")
setenv("scotch_ver",         "7.0.4")

whatis("Description: UFS build environment — HPC-ME Intel oneAPI 2025.3 container")

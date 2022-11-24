if(HPX_WITH_SYCL)
  hpx_add_config_define(HPX_HAVE_SYCL)
  # TODO do we really have compute? What does that define implicate?
  hpx_add_config_define(HPX_HAVE_COMPUTE)

  if(HPX_WITH_HIPSYCL)
    hpx_add_config_define(HPX_HAVE_HIPSYCL) 
    find_package(hipSYCL REQUIRED) # for hipsycl: use cmake integration
  else()
    add_compile_options(-fno-sycl) # by default: no sycl except in files where
                                   # we allow it
  endif()
else()
  if(HPX_WITH_HIPSYCL)
    hpx_error("HPX_WITH_HIPSYCL=ON requires HPX_WITH_SYCL=ON")
  endif()
endif()

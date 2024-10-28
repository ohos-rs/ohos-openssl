if(NOT OPENSSL_ROOT_PATH)
    message(FATAL_ERROR "-- [OPENSSL_ROOT_PATH]: OPENSSL_ROOT_PATH must be set up first.")
endif()

if(NOT OHOS_ARCH)
    message(FATAL_ERROR "-- [OHOS_ARCH]: OHOS_ARCH must be set up first.")
endif()

set(OPENSSL_SEARCH_PATH ${OPENSSL_ROOT_PATH}/prelude/${OHOS_ARCH})

file(GLOB_RECURSE OPENSSL_HEADER_LIST 
    "${OPENSSL_SEARCH_PATH}/include/openssl/*.h"
)

# collect all OpenSSL header files
if(NOT OPENSSL_HEADER_LIST)
    message(FATAL_ERROR "No OpenSSL headers found in ${OPENSSL_SEARCH_PATH}/include/openssl/")
endif()

set(OPENSSL_HEADER_NAMES)
foreach(header ${OPENSSL_HEADER_LIST})
    get_filename_component(header_name ${header} NAME)
    list(APPEND OPENSSL_HEADER_NAMES "openssl/${header_name}")
endforeach()

find_path(OPENSSL_INCLUDE_DIR
    NAMES ${OPENSSL_HEADER_NAMES}
    PATHS
        ${OPENSSL_SEARCH_PATH}/include
    CMAKE_FIND_ROOT_PATH_BOTH
)

find_library(OPENSSL_SSL_LIBRARY
    NAMES ssl
    PATHS ${OPENSSL_SEARCH_PATH}/lib
    CMAKE_FIND_ROOT_PATH_BOTH
)

find_library(OPENSSL_CRYPTO_LIBRARY
    NAMES crypto
    PATHS ${OPENSSL_SEARCH_PATH}/lib
    CMAKE_FIND_ROOT_PATH_BOTH
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OpenSSL DEFAULT_MSG 
    OPENSSL_INCLUDE_DIR 
    OPENSSL_SSL_LIBRARY 
    OPENSSL_CRYPTO_LIBRARY
)

if(OpenSSL_FOUND)
    set(OPENSSL_INCLUDE_DIRS ${OPENSSL_INCLUDE_DIR})
    set(OPENSSL_LIBRARIES ${OPENSSL_SSL_LIBRARY} ${OPENSSL_CRYPTO_LIBRARY})
    if(NOT TARGET OpenSSL::SSL)
        add_library(OpenSSL::SSL UNKNOWN IMPORTED)
        set_target_properties(OpenSSL::SSL PROPERTIES
            IMPORTED_LOCATION "${OPENSSL_SSL_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES "${OPENSSL_INCLUDE_DIRS}"
        )
    endif()
    if(NOT TARGET OpenSSL::Crypto)
        add_library(OpenSSL::Crypto UNKNOWN IMPORTED)
        set_target_properties(OpenSSL::Crypto PROPERTIES
            IMPORTED_LOCATION "${OPENSSL_CRYPTO_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES "${OPENSSL_INCLUDE_DIRS}"
        )
    endif()
endif()

mark_as_advanced(OPENSSL_INCLUDE_DIR OPENSSL_SSL_LIBRARY OPENSSL_CRYPTO_LIBRARY)

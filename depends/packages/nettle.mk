package=nettle
$(package)_version=3.3
$(package)_download_path=https://ftp.gnu.org/gnu/nettle/nettle-$($(package)_version).tar.gz
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=46942627d5d0ca11720fec18d81fc38f7ef837ea4197c1f630e71ce0d470b11e

# default settings
$(package)_config_env_default=PKG_CONFIG_LIBDIR="$(PREFIX_DIR)/lib/pkgconfig" CFLAGS="-I$(PREFIX_DIR)include -L$(PREFIX_DIR)lib"
$(package)_config_opts_default=

# mingw specific settings
$(package)_config_env_mingw32=PKG_CONFIG_LIBDIR="$(PREFIX_DIR)/lib/pkgconfig" CFLAGS="-I$(PREFIX_DIR)include -L$(PREFIX_DIR)lib -static"
$(package)_config_env_x86_64-w64-mingw32=$($(package)_config_env_mingw32)
$(package)_config_env_i686-w64-mingw32=$($(package)_config_env_mingw32)

# darwin specific settings
$(package)_config_env_darwin=PKG_CONFIG_LIBDIR="$(PREFIX_DIR)/lib/pkgconfig"
$(package)_config_env_x86_64-apple-darwin11=$($(package)_config_env_darwin)

# 32bit linux specific settings
$(package)_config_env_i686-pc-linux-gnu=PKG_CONFIG_LIBDIR="$(PREFIX_DIR)/lib/pkgconfig" CFLAGS="-I$(PREFIX_DIR)include -L$(PREFIX_DIR)lib -m32" LDFLAGS="-m32"

# set settings based on host
$(package)_config_env = $(if $($(package)_config_env_$(HOST)), $($(package)_config_env_$(HOST)), $($(package)_config_env_default))
$(package)_config_opts = $(if $($(package)_config_opts_$(HOST)), $($(package)_config_opts_$(HOST)), $($(package)_config_opts_default))

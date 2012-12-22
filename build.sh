#!/bin/bash


#export CPU_VER='8.30.a'
# USE_HW_MUL can be 0, 1, or 2, defining a hierarchy of HW Mul support.
#CPUFLAGS-$(subst 1,,$(CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL)) += -mxl-multiply-high
#CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL) += -mno-xl-soft-mul
#CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_DIV) += -mno-xl-soft-div
#CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_BARREL) += -mxl-barrel-shift
#CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR) += -mxl-pattern-compare

#CPUFLAGS-1 += $(call cc-option,-mcpu=v$(CPU_VER)
#KBUILD_CFLAGS += -ffixed-r31 $(CPUFLAGS-1) $(CPUFLAGS-2)

rm -r objs

#export NGX_SYS_NERR=132

export CROSS_COMPILE=microblaze-unknown-linux-gnu-

./configure \
	--with-debug \
        --without-http_rewrite_module \
        --without-http_gzip_module \
	    --without-http_charset_module \
        --without-http_ssi_module \
        --without-http_userid_module \
        --without-http_access_module \
        --without-http_auth_basic_module \
        --without-http_autoindex_module \
        --without-http_status_module \
        --without-http_geo_module \
        --without-http_map_module \
        --without-http_split_clients_module \
        --without-http_referer_module \
        --without-http_proxy_module \
        --without-http_fastcgi_module \
        --without-http_uwsgi_module \
        --without-http_scgi_module \
        --without-http_memcached_module \
        --without-http_limit_conn_module \
        --without-http_limit_req_module \
        --without-http_empty_gif_module \
        --without-http_browser_module \
        --without-http_upstream_ip_hash_module \
        --without-http_upstream_least_conn_module \
        --without-http_upstream_keepalive_module \
	--without-pcre \
	--without-select_module \
	--without-poll_module \
	--with-endian=big \
	--with-sys-nerr=132 \
	--with-int=4 \
	--with-long=4 \
	--with-long-long=8 \
	--with-ptr-size=4 \
	--with-sig-atomic-t=4 \
	--with-size-t=4 \
	--with-off-t=4 \
	--with-time-t=4 \
	--with-min-free-mem=10240 \
	--with-cc-opt="-mxl-multiply-high -mno-xl-soft-mul -mno-xl-soft-div -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.30.a --static --sysroot=/home/peschuster/project/microblaze-unknown-linux-gnu/microblaze-unknown-linux-gnu/sys-root -g" > configure.log

# --sysroot=/home/peschuster/project/microblaze-unknown-linux-gnu/microblaze-unknown-linux-gnu/sys-root
#/home/peschuster/project/customfs/complete

make -f objs/Makefile
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

./configure \
	--without-http_rewrite_module \
	--without-http_gzip_module \
	--with-cc-opt="--static"

make -f objs/Makefile 

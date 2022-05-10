Content-Type: multipart/mixed; boundary="===============3558678871631887066=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9264/10661] mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/char/hw_random/cn10k-rng.o' being placed in section `.ctors.65436'
Date: Wed, 11 May 2022 00:17:02 +0800
Message-ID: <202205110014.XnnvJARa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3558678871631887066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

Hi Herbert,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3bf222d317a20170ee17f082626c1e0f83537e13
commit: 25dfae684031f292034a0f42155090df6309f152 [9264/10661] hwrng: cn10k =
- Enable compile testing
:::::: branch date: 3 hours ago
:::::: commit date: 4 days ago
config: mips-randconfig-s032-20220509 (https://download.01.org/0day-ci/arch=
ive/20220511/202205110014.XnnvJARa-lkp(a)intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D25dfae684031f292034a0f42155090df6309f152
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 25dfae684031f292034a0f42155090df6309f152
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
ips SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/rtq2134-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/rtq6752-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/s2mpa01.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/s5m8767.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/slg51000-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/stm32-vrefbuf.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/stm32-pwr.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/stw481x-vmmc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/sy7636a-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/sy8824x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/tps65023-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/tps6507x-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/tps68470-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/wm831x-dcdc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/wm831x-isink.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/wm831x-ldo.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/wm8350-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/wm8400-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
gulator/wm8994-regulator.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/hisilicon/hi6220_reset.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/hisilicon/reset-hi3660.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-ath79.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-bcm6345.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-berlin.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-brcmstb.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-brcmstb-rescal.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-hsdk.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-imx7.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-lantiq.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-microchip-sparx5.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-meson.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-meson-audio-arb.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-qcom-aoss.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-qcom-pdc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-simple.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-socfpga.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-starfive-jh7100.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-sunxi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-ti-syscon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/re=
set/reset-zynq.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/tty_io.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/n_tty.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/tty_ioctl.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/tty_ldisc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/tty_buffer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/tty_port.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/tty_mutex.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/tty_ldsem.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/tty_baudrate.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/tty_jobctrl.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/n_null.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/hvc/hvc_console.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/serial_core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/earlycon.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/amba-pl010.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/samsung_tty.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/sh-sci.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/imx.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/icom.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/meson_uart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/atmel_serial.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/uartlite.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/msm_serial.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/qcom_geni_serial.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/altera_uart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/st-asc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/timbuart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/altera_jtaguart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/vt8500_serial.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/pch_uart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/mxs-auart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/serial-tegra.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/tegra-tcu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/arc_uart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/fsl_lpuart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/sprd_serial.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/stm32-usart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/rda-uart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/sunplus-uart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/serial/serial_mctrl_gpio.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/moxa.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/nozomi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/synclink_gt.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/tt=
y/rpmsg_tty.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/mem.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/random.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/misc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/virtio_console.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/ba431-rng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/exynos-trng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/omap-rng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/virtio-rng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/imx-rngc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/nomadik-rng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/bcm2835-rng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/iproc-rng200.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/meson-rng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/xiphera-trng.o' being placed in section `.ctors.65436'
>> mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/hw_random/cn10k-rng.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-chip.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-dev-common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-dev.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-interface.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm1-cmd.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm2-cmd.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpmrm-dev.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm2-space.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/tpm1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/tpm2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_tis_core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_tis_synquacer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_tis_spi_main.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_tis_spi_cr50.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_tis_i2c_cr50.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_i2c_nuvoton.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_atmel.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/st33zp24/st33zp24.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/st33zp24/i2c.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/st33zp24/spi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/xillybus/xillybus_class.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/xillybus/xillybus_core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/xillybus/xillybus_pcie.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/arm/arm-smmu/qcom_iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/arm/arm-smmu/arm-smmu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/arm/arm-smmu/arm-smmu-impl.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/arm/arm-smmu/arm-smmu-nvidia.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/iommu-traces.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/iommu-sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/iommu-debugfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/io-pgtable.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/io-pgtable-arm-v7s.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/io-pgtable-arm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/mtk_iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/omap-iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/rockchip-iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/sprd-iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/apple-dart.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_nomodeset.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_cma_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_fb_cma_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_shmem_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_buddy.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_ttm_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_bridge_connector.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_crtc_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_dsc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_encoder_slave.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_flip_work.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_hdcp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_probe_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_plane_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_kms_helper_common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_simple_kms_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_modeset_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_scdc_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_atomic_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_framebuffer_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic_state_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_damage_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_format_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_self_refresh_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_rect.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/panel.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/selftests/test-drm_mm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/selftests/test-drm_modeset_common.o' being placed in section `.ctors.=
65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/selftests/test-drm_plane_helper.o' being placed in section `.ctors.65=
436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/selftests/test-drm_format.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/selftests/test-drm_framebuffer.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/selftests/test-drm_damage_helper.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/selftests/test-drm_dp_mst_helper.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/selftests/test-drm_rect.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/selftests/test-drm_cmdline_parser.o' being placed in section `.ctors.=
65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/selftests/test-drm_buddy.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_aperture.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_auth.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_cache.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_file.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_ioctl.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_mm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_crtc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_fourcc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_modes.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_edid.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_displayid.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_trace_points.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_prime.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_vma_manager.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_modeset_lock.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_bridge.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_framebuffer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_connector.o' being placed in section `.ctors.65436'

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3558678871631887066==--


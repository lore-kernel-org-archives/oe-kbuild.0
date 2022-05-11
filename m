Content-Type: multipart/mixed; boundary="===============0258772056512989518=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10450/11094] mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/clk/samsung/clk-exynosautov9.o' being placed in section `.ctors.65436'
Date: Thu, 12 May 2022 03:31:48 +0800
Message-ID: <202205120351.jHslrdT7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0258772056512989518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Chanho Park <chanho61.park@samsung.com>
CC: Sylwester Nawrocki <s.nawrocki@samsung.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

Hi Chanho,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6107040c99d5dfc920721c198d45ed2d639b113a
commit: 6587c62f69dc11ca80ca746854626bf0394e1088 [10450/11094] clk: samsung=
: add top clock support for Exynos Auto v9 SoC
:::::: branch date: 9 hours ago
:::::: commit date: 26 hours ago
config: mips-randconfig-s032-20220509 (https://download.01.org/0day-ci/arch=
ive/20220512/202205120351.jHslrdT7-lkp(a)intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6587c62f69dc11ca80ca746854626bf0394e1088
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6587c62f69dc11ca80ca746854626bf0394e1088
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
ips SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/bcm/clk-sr.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imgtec/clk-boston.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-busy.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-composite-7ulp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-composite-8m.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-composite-93.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-fracn-gppll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-cpu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-divider-gate.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-fixup-div.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-fixup-mux.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-frac-pll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-gate2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-gate-exclusive.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-pfd.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-pfdv2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-pllv1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-pllv2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-pllv3.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-pllv4.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-pll14xx.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-sscg-pll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-imx8mm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-imx8mp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/imx/clk-imx93.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/ingenic/cgu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/ingenic/pm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/ingenic/jz4760-cgu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/ingenic/jz4780-cgu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/ingenic/x1830-cgu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mtk.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-pll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-gate.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-apmixed.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-cpumux.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/reset.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mux.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt6765.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt6765-cam.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt6765-mm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt6765-vcodec.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt6797.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt2701.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt2701-aud.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt2701-img.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt2701-mm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt2701-vdec.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt2712.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt2712-bdp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt2712-jpgdec.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt2712-mfg.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt2712-venc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8135.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8173.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8192.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8192-cam.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8192-imp_iic_wrap.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8192-mdp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8192-mm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8192-scp_adsp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8192-venc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-apmixedsys.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-topckgen.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-peri_ao.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-infra_ao.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-cam.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-ccu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-img.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-ipe.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-mfg.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-scp_adsp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-vdec.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-vdo0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-vdo1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-venc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-vpp0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-vpp1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-wpe.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-imp_iic_wrap.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mediatek/clk-mt8195-apusys_pll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/microchip/clk-mpfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/mstar/clk-msc313-mpll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/pistachio/clk.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/pistachio/clk-pll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/pistachio/clk-pistachio.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/ralink/clk-mt7621.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-pll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-cpu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynos3250.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynos5260.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynos5410.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynos5433.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynos-audss.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynos-clkout.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynos-arm64.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynos7.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynos7885.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynos850.o' being placed in section `.ctors.65436'
>> mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-exynosautov9.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-s3c64xx.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-s5pv210.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-s5pv210-audss.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/samsung/clk-fsd.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sifive/sifive-prci.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/socfpga/clk-s10.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/socfpga/clk-pll-s10.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/socfpga/clk-periph-s10.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/socfpga/clk-gate-s10.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/socfpga/clk-agilex.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sprd/common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sprd/gate.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sprd/mux.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sprd/div.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sprd/composite.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sprd/pll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sprd/sc9860-clk.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_mmc_timing.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_reset.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_div.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_frac.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_gate.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_mux.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_mult.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_phase.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_sdm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_nk.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_nkm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_nkmp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_nm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu_mp.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun20i-d1-r.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun50i-a64.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun50i-a100.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun50i-a100-r.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun50i-h6.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun50i-h6-r.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun50i-h616.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun4i-a10.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun6i-rtc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun8i-a23.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun8i-h3.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun8i-r40.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/sunxi-ng/ccu-sun8i-de2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/ti/adpll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/cl=
k/xilinx/xlnx_vcu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/dmaengine.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/virt-dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/sa11x0-dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/dw/core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/dw/dw.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/dw/idma32.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/dw/platform.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/ep93xx_dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/mcf-edma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/fsl-edma-common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/hisi_dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/idma64.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/k3dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/mmp_pdma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/mmp_tdma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/mxs-dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/nbpfaxi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/pch_dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/sh/shdma-base.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/sh/shdmac.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/sh/rcar-dmac.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/sh/usb-dmac.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/sh/rz-dmac.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/sf-pdma/sf-pdma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/stm32-dmamux.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/sprd-dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/tegra20-apb-dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/tegra210-adma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/timb_dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/xgene-dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/mediatek/mtk-hsdma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/qcom/hidma_ll.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/qcom/hidma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/qcom/hidma_dbg.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/ti/omap-dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/ti/dma-crossbar.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/dm=
a/xilinx/zynqmp_dma.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/aspeed/aspeed-lpc-ctrl.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/aspeed/aspeed-uart-routing.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/aspeed/aspeed-p2a-ctrl.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/aspeed/aspeed-socinfo.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/imx/soc-imx8m.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/imx/imx8m-blk-ctrl.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/ixp4xx/ixp4xx-qmgr.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/ixp4xx/ixp4xx-npe.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/mediatek/mtk-cmdq-helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/mediatek/mtk-devapc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/mediatek/mtk-infracfg.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/mediatek/mtk-pmic-wrap.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/mediatek/mtk-mmsys.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/mediatek/mtk-mutex.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/amlogic/meson-clk-measure.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/so=
c/amlogic/meson-gx-socinfo.o' being placed in section `.ctors.65436'

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0258772056512989518==--


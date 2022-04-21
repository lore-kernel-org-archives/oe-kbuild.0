Content-Type: multipart/mixed; boundary="===============9128521614923756037=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/7] clk: mediatek: reset: Merge and revise reset register function
Date: Thu, 21 Apr 2022 14:41:45 +0800
Message-ID: <202204210107.zeGBZsr1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9128521614923756037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220418132154.7401-4-rex-bc.chen@mediatek.com>
References: <20220418132154.7401-4-rex-bc.chen@mediatek.com>
TO: "Rex-BC Chen" <rex-bc.chen@mediatek.com>
TO: mturquette(a)baylibre.com
TO: sboyd(a)kernel.org
CC: matthias.bgg(a)gmail.com
CC: p.zabel(a)pengutronix.de
CC: angelogioacchino.delregno(a)collabora.com
CC: chun-jie.chen(a)mediatek.com
CC: wenst(a)chromium.org
CC: yong.liang(a)mediatek.com
CC: runyang.chen(a)mediatek.com
CC: linux-kernel(a)vger.kernel.org
CC: allen-kh.cheng(a)mediatek.com
CC: linux-clk(a)vger.kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-mediatek(a)lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group(a)mediatek.com
CC: "Rex-BC Chen" <rex-bc.chen@mediatek.com>

Hi Rex-BC,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.18-rc3 next-20220420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Rex-BC-Chen/Cleanup-=
MediaTek-clk-reset-drivers/20220418-223139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220420 (https://download.01.org/0day-ci/archi=
ve/20220421/202204210107.zeGBZsr1-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd=
5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/52d97559ba77d8eb304=
19528d80d37d8f0dd09cf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rex-BC-Chen/Cleanup-MediaTek-clk-r=
eset-drivers/20220418-223139
        git checkout 52d97559ba77d8eb30419528d80d37d8f0dd09cf
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/pinctrl/pinctrl-single.c:1856:2: note: Calling 'platform_set_drv=
data'
           platform_set_drvdata(pdev, pcs);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:243:2: note: Calling 'dev_set_drvdata'
           dev_set_drvdata(&pdev->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:699:1: note: Returning without writing to 'data->=
bits_per_mux', which participates in a condition later
   }
   ^
   include/linux/device.h:699:1: note: Returning without writing to 'data->=
bits_per_pin'
   include/linux/platform_device.h:243:2: note: Returning from 'dev_set_drv=
data'
           dev_set_drvdata(&pdev->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:244:1: note: Returning without writing t=
o 'data->bits_per_mux', which participates in a condition later
   }
   ^
   include/linux/platform_device.h:244:1: note: Returning without writing t=
o 'data->bits_per_pin'
   drivers/pinctrl/pinctrl-single.c:1856:2: note: Returning from 'platform_=
set_drvdata'
           platform_set_drvdata(pdev, pcs);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1858:2: note: Control jumps to the 'def=
ault' case at line 1871
           switch (pcs->width) {
           ^
   drivers/pinctrl/pinctrl-single.c:1872:3: note:  Execution continues on l=
ine 1875
                   break;
                   ^
   drivers/pinctrl/pinctrl-single.c:1878:6: note: Assuming the condition is=
 false
           if (PCS_HAS_PINCONF)
               ^
   drivers/pinctrl/pinctrl-single.c:212:27: note: expanded from macro 'PCS_=
HAS_PINCONF'
   #define PCS_HAS_PINCONF         (pcs->flags & PCS_FEAT_PINCONF)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1878:2: note: Taking false branch
           if (PCS_HAS_PINCONF)
           ^
   drivers/pinctrl/pinctrl-single.c:1882:8: note: Calling 'pcs_allocate_pin=
_table'
           ret =3D pcs_allocate_pin_table(pcs);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:730:11: note: Field 'bits_per_mux' is t=
rue
           if (pcs->bits_per_mux) {
                    ^
   drivers/pinctrl/pinctrl-single.c:730:2: note: Taking true branch
           if (pcs->bits_per_mux) {
           ^
   drivers/pinctrl/pinctrl-single.c:731:23: note: Calling 'fls'
                   pcs->bits_per_pin =3D fls(pcs->fmask);
                                       ^~~~~~~~~~~~~~~
   include/asm-generic/bitops/builtin-fls.h:14:9: note: Assuming 'x' is 0
           return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
                  ^
   include/asm-generic/bitops/builtin-fls.h:14:9: note: '?' condition is fa=
lse
   include/asm-generic/bitops/builtin-fls.h:14:2: note: Returning zero
           return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:731:23: note: Returning from 'fls'
                   pcs->bits_per_pin =3D fls(pcs->fmask);
                                       ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:731:3: note: The value 0 is assigned to=
 field 'bits_per_pin'
                   pcs->bits_per_pin =3D fls(pcs->fmask);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:732:41: note: Division by zero
                   nr_pins =3D (pcs->size * BITS_PER_BYTE) / pcs->bits_per_=
pin;
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1417:3: warning: Value stored to 'mask'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   mask =3D pcs->read(pcswi->reg);
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1417:3: note: Value stored to 'mask' is=
 never read
                   mask =3D pcs->read(pcswi->reg);
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/clk/mediatek/clk-mt8173.c:887:2: warning: Value stored to 'r' is=
 never read [clang-analyzer-deadcode.DeadStores]
           r =3D mtk_clk_register_rst_ctrl(node, 2, 0x30, MTK_RST_V1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8173.c:887:2: note: Value stored to 'r' is ne=
ver read
           r =3D mtk_clk_register_rst_ctrl(node, 2, 0x30, MTK_RST_V1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8173.c:917:2: warning: Value stored to 'r' is=
 never read [clang-analyzer-deadcode.DeadStores]
           r =3D mtk_clk_register_rst_ctrl(node, 2, 0, MTK_RST_V1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8173.c:917:2: note: Value stored to 'r' is ne=
ver read
           r =3D mtk_clk_register_rst_ctrl(node, 2, 0, MTK_RST_V1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   arch/arm/kernel/setup.c:1121:17: warning: Access to field 'name' results=
 in a dereference of a null pointer (loaded from variable 'mdesc') [clang-a=
nalyzer-core.NullDereference]
           machine_name =3D mdesc->name;
                          ^~~~~
   arch/arm/kernel/setup.c:1099:6: note: Assuming '__atags_pointer' is 0
           if (__atags_pointer)
               ^~~~~~~~~~~~~~~
   arch/arm/kernel/setup.c:1099:2: note: Taking false branch
           if (__atags_pointer)
           ^
   arch/arm/kernel/setup.c:1103:6: note: 'atags_vaddr' is null
           if (atags_vaddr) {

vim +/r +887 drivers/clk/mediatek/clk-mt8173.c

c1e81a3bef36cb James Liao  2015-04-23  865  =

c1e81a3bef36cb James Liao  2015-04-23  866  static void __init mtk_infrasys=
_init(struct device_node *node)
c1e81a3bef36cb James Liao  2015-04-23  867  {
c1e81a3bef36cb James Liao  2015-04-23  868  	struct clk_onecell_data *clk_d=
ata;
c1e81a3bef36cb James Liao  2015-04-23  869  	int r;
c1e81a3bef36cb James Liao  2015-04-23  870  =

c1e81a3bef36cb James Liao  2015-04-23  871  	clk_data =3D mtk_alloc_clk_dat=
a(CLK_INFRA_NR_CLK);
c1e81a3bef36cb James Liao  2015-04-23  872  =

c1e81a3bef36cb James Liao  2015-04-23  873  	mtk_clk_register_gates(node, i=
nfra_clks, ARRAY_SIZE(infra_clks),
c1e81a3bef36cb James Liao  2015-04-23  874  						clk_data);
2d61fe0fc7f0a8 Joe.C       2015-07-13  875  	mtk_clk_register_factors(infra=
_divs, ARRAY_SIZE(infra_divs), clk_data);
c1e81a3bef36cb James Liao  2015-04-23  876  =

567bf2ed86d13a Sean Wang   2017-05-05  877  	mtk_clk_register_cpumuxes(node=
, cpu_muxes, ARRAY_SIZE(cpu_muxes),
567bf2ed86d13a Sean Wang   2017-05-05  878  				  clk_data);
567bf2ed86d13a Sean Wang   2017-05-05  879  =

c1e81a3bef36cb James Liao  2015-04-23  880  	r =3D of_clk_add_provider(node=
, of_clk_src_onecell_get, clk_data);
52d97559ba77d8 Rex-BC Chen 2022-04-18  881  	if (r) {
c1e81a3bef36cb James Liao  2015-04-23  882  		pr_err("%s(): could not regis=
ter clock provider: %d\n",
c1e81a3bef36cb James Liao  2015-04-23  883  			__func__, r);
52d97559ba77d8 Rex-BC Chen 2022-04-18  884  		return;
52d97559ba77d8 Rex-BC Chen 2022-04-18  885  	}
c1e81a3bef36cb James Liao  2015-04-23  886  =

52d97559ba77d8 Rex-BC Chen 2022-04-18 @887  	r =3D mtk_clk_register_rst_ctr=
l(node, 2, 0x30, MTK_RST_V1);
c1e81a3bef36cb James Liao  2015-04-23  888  }
c1e81a3bef36cb James Liao  2015-04-23  889  CLK_OF_DECLARE(mtk_infrasys, "m=
ediatek,mt8173-infracfg", mtk_infrasys_init);
c1e81a3bef36cb James Liao  2015-04-23  890  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9128521614923756037==--


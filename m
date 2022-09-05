Content-Type: multipart/mixed; boundary="===============8529196943259847016=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/4] clk: mediatek: Add new clock driver to handle FHCTL hardware
Date: Mon, 05 Sep 2022 09:33:51 +0800
Message-ID: <202209050918.rCRzJ3kr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8529196943259847016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/c=
lk/mediatek/clk-fhctl.c:60:36: warning: shift by negative count ('-1') [-Wa=
nalyzer-shift-count-negative]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220831124850.7748-4-johnson.wang@mediatek.com>
References: <20220831124850.7748-4-johnson.wang@mediatek.com>
TO: Johnson Wang <johnson.wang@mediatek.com>
TO: robh+dt(a)kernel.org
TO: krzysztof.kozlowski+dt(a)linaro.org
TO: angelogioacchino.delregno(a)collabora.com
TO: sboyd(a)kernel.org
CC: linux-clk(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-mediatek(a)lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group(a)mediatek.com
CC: Johnson Wang <johnson.wang@mediatek.com>
CC: "Edward-JW Yang" <edward-jw.yang@mediatek.com>

Hi Johnson,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v6.0-rc4 next-202209=
01]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johnson-Wang/Introdu=
ce-MediaTek-frequency-hopping-driver/20220831-205023
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220904 (https://download.01.org/0day-ci/archi=
ve/20220905/202209050918.rCRzJ3kr-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/85fd747a5f938792929=
2c6a031dcab4922d35f62
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Johnson-Wang/Introduce-MediaTek-fr=
equency-hopping-driver/20220831-205023
        git checkout 85fd747a5f9387929292c6a031dcab4922d35f62
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/clk/mediatek/clk-fhctl.c: In function 'fhctl_set_ssc_regs':
>> drivers/clk/mediatek/clk-fhctl.c:60:36: warning: shift by negative count=
 ('-1') [-Wanalyzer-shift-count-negative]
      60 |                 r |=3D (data->df_val << (ffs(data->msk_frddsx_dy=
s) - 1));
         |                      ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
     'fhctl_set_ssc_regs': event 1
       |
       |   56 |         if (rate > 0) {
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch (when 'rate !=3D 0')=
...
       |
     'fhctl_set_ssc_regs': event 2
       |
       |arch/arm/include/asm/io.h:113:9:
       |  113 |         asm volatile("ldr %0, %1"
       |      |         ^~~
       |      |         |
       |      |         (2) ...to here
       |
     'fhctl_set_ssc_regs': event 3
       |
       |include/asm-generic/bitops/ffs.h:17:12:
       |   17 |         if (!x)
       |      |            ^
       |      |            |
       |      |            (3) following 'true' branch...
       |
     'fhctl_set_ssc_regs': events 4-5
       |
       |drivers/clk/mediatek/clk-fhctl.c:60:66:
       |   60 |                 r |=3D (data->df_val << (ffs(data->msk_frdd=
sx_dys) - 1));
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~^~~~~
       |      |                                    |                       =
      |
       |      |                                    |                       =
      (4) ...to here
       |      |                                    (5) shift by negative am=
ount here ('-1')
       |

vim +60 drivers/clk/mediatek/clk-fhctl.c

85fd747a5f9387 Johnson Wang 2022-08-31  46  =

85fd747a5f9387 Johnson Wang 2022-08-31  47  static int fhctl_set_ssc_regs(s=
truct mtk_clk_pll *pll, struct fh_pll_regs *regs,
85fd747a5f9387 Johnson Wang 2022-08-31  48  			      const struct fh_pll_da=
ta *data, u32 rate)
85fd747a5f9387 Johnson Wang 2022-08-31  49  {
85fd747a5f9387 Johnson Wang 2022-08-31  50  	u32 updnlmt_val, r;
85fd747a5f9387 Johnson Wang 2022-08-31  51  =

85fd747a5f9387 Johnson Wang 2022-08-31  52  	writel((readl(regs->reg_cfg) &=
 ~(data->frddsx_en)), regs->reg_cfg);
85fd747a5f9387 Johnson Wang 2022-08-31  53  	writel((readl(regs->reg_cfg) &=
 ~(data->sfstrx_en)), regs->reg_cfg);
85fd747a5f9387 Johnson Wang 2022-08-31  54  	writel((readl(regs->reg_cfg) &=
 ~(data->fhctlx_en)), regs->reg_cfg);
85fd747a5f9387 Johnson Wang 2022-08-31  55  =

85fd747a5f9387 Johnson Wang 2022-08-31  56  	if (rate > 0) {
85fd747a5f9387 Johnson Wang 2022-08-31  57  		/* Set the relative parameter=
 registers (dt/df/upbnd/downbnd) */
85fd747a5f9387 Johnson Wang 2022-08-31  58  		r =3D readl(regs->reg_cfg);
85fd747a5f9387 Johnson Wang 2022-08-31  59  		r &=3D ~(data->msk_frddsx_dys=
);
85fd747a5f9387 Johnson Wang 2022-08-31 @60  		r |=3D (data->df_val << (ffs(=
data->msk_frddsx_dys) - 1));
85fd747a5f9387 Johnson Wang 2022-08-31  61  		writel(r, regs->reg_cfg);
85fd747a5f9387 Johnson Wang 2022-08-31  62  =

85fd747a5f9387 Johnson Wang 2022-08-31  63  		r =3D readl(regs->reg_cfg);
85fd747a5f9387 Johnson Wang 2022-08-31  64  		r &=3D ~(data->msk_frddsx_dts=
);
85fd747a5f9387 Johnson Wang 2022-08-31  65  		r |=3D (data->dt_val << (ffs(=
data->msk_frddsx_dts) - 1));
85fd747a5f9387 Johnson Wang 2022-08-31  66  		writel(r, regs->reg_cfg);
85fd747a5f9387 Johnson Wang 2022-08-31  67  =

85fd747a5f9387 Johnson Wang 2022-08-31  68  		writel((readl(pll->pcw_addr) =
& data->dds_mask) | data->tgl_org,
85fd747a5f9387 Johnson Wang 2022-08-31  69  			regs->reg_dds);
85fd747a5f9387 Johnson Wang 2022-08-31  70  =

85fd747a5f9387 Johnson Wang 2022-08-31  71  		/* Calculate UPDNLMT */
85fd747a5f9387 Johnson Wang 2022-08-31  72  		updnlmt_val =3D PERCENT_TO_DD=
SLMT((readl(regs->reg_dds) &
85fd747a5f9387 Johnson Wang 2022-08-31  73  						 data->dds_mask), rate) <<
85fd747a5f9387 Johnson Wang 2022-08-31  74  						 data->updnlmt_shft;
85fd747a5f9387 Johnson Wang 2022-08-31  75  =

85fd747a5f9387 Johnson Wang 2022-08-31  76  		writel(updnlmt_val, regs->reg=
_updnlmt);
85fd747a5f9387 Johnson Wang 2022-08-31  77  		writel(readl(regs->reg_hp_en)=
 | BIT(data->fh_id),
85fd747a5f9387 Johnson Wang 2022-08-31  78  		       regs->reg_hp_en);
85fd747a5f9387 Johnson Wang 2022-08-31  79  		/* Enable SSC */
85fd747a5f9387 Johnson Wang 2022-08-31  80  		writel(readl(regs->reg_cfg) |=
 data->frddsx_en, regs->reg_cfg);
85fd747a5f9387 Johnson Wang 2022-08-31  81  		/* Enable Hopping control */
85fd747a5f9387 Johnson Wang 2022-08-31  82  		writel(readl(regs->reg_cfg) |=
 data->fhctlx_en, regs->reg_cfg);
85fd747a5f9387 Johnson Wang 2022-08-31  83  =

85fd747a5f9387 Johnson Wang 2022-08-31  84  	} else {
85fd747a5f9387 Johnson Wang 2022-08-31  85  		/* Switch to APMIXEDSYS contr=
ol */
85fd747a5f9387 Johnson Wang 2022-08-31  86  		writel(readl(regs->reg_hp_en)=
 & ~BIT(data->fh_id),
85fd747a5f9387 Johnson Wang 2022-08-31  87  		       regs->reg_hp_en);
85fd747a5f9387 Johnson Wang 2022-08-31  88  		/* Wait for DDS to be stable =
*/
85fd747a5f9387 Johnson Wang 2022-08-31  89  		udelay(30);
85fd747a5f9387 Johnson Wang 2022-08-31  90  	}
85fd747a5f9387 Johnson Wang 2022-08-31  91  =

85fd747a5f9387 Johnson Wang 2022-08-31  92  	return 0;
85fd747a5f9387 Johnson Wang 2022-08-31  93  }
85fd747a5f9387 Johnson Wang 2022-08-31  94  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8529196943259847016==--


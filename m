Content-Type: multipart/mixed; boundary="===============4084568382417028490=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 1094/1181] drivers/clk/clk-xlnx-clock-wizard-v.c:230:41: sparse: sparse: decimal constant 2160000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
Date: Sun, 19 Jun 2022 18:51:49 +0800
Message-ID: <202206191810.jdMHDmcb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4084568382417028490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/c=
lk/clk-xlnx-clock-wizard-v.c:230:41: sparse: sparse: decimal constant 21600=
00000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 =
compilers are very likely to produce unsigned long (and a warning) here"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Wilken Gottwalt <wilken.gottwalt@posteo.net>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: d511c6ae9508a42b632fb261a3dd48d0593bfe5e [1094/1181] clk: clk-xlnx-=
clock-wizard-v: fix missing bitfield include
:::::: branch date: 4 days ago
:::::: commit date: 8 weeks ago
config: h8300-randconfig-s032-20220619 (https://download.01.org/0day-ci/arc=
hive/20220619/202206191810.jdMHDmcb-lkp(a)intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/Xilinx/linux-xlnx/commit/d511c6ae9508a42b632fb=
261a3dd48d0593bfe5e
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout d511c6ae9508a42b632fb261a3dd48d0593bfe5e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dh=
8300 SHELL=3D/bin/bash drivers/clk/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/clk/clk-xlnx-clock-wizard-v.c:230:41: sparse: sparse: decimal co=
nstant 2160000000 is between LONG_MAX and ULONG_MAX. For C99 that means lon=
g long, C90 compilers are very likely to produce unsigned long (and a warni=
ng) here
>> drivers/clk/clk-xlnx-clock-wizard-v.c:343:43: sparse: sparse: cast remov=
es address space '__iomem' of expression
   drivers/clk/clk-xlnx-clock-wizard-v.c:376:43: sparse: sparse: cast remov=
es address space '__iomem' of expression
   drivers/clk/clk-xlnx-clock-wizard-v.c: note: in included file (through i=
nclude/linux/io.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression

vim +230 drivers/clk/clk-xlnx-clock-wizard-v.c

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  219  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  220  static int clk_wzrd_get_=
divisors(struct clk_hw *hw, unsigned long rate,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  221  				 unsigned long paren=
t_rate)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  222  {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  223  	struct clk_wzrd_divider=
 *divider =3D to_clk_wzrd_divider(hw);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  224  	u64 vco_freq, freq, dif=
f;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  225  	u32 m, d, o;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  226  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  227  	for (m =3D WZRD_M_MIN; =
m <=3D WZRD_M_MAX; m++) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  228  		for (d =3D WZRD_D_MIN;=
 d <=3D WZRD_D_MAX; d++) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  229  			vco_freq =3D DIV_ROUN=
D_CLOSEST((parent_rate * m), d);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31 @230  			if (vco_freq >=3D WZR=
D_VCO_MIN && vco_freq <=3D WZRD_VCO_MAX) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  231  				for (o =3D WZRD_O_MI=
N; o <=3D WZRD_O_MAX; o++) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  232  					freq =3D DIV_ROUND_=
CLOSEST(vco_freq, o);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  233  					diff =3D abs(freq -=
 rate);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  234  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  235  					if (diff < WZRD_MIN=
_ERR) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  236  						divider->valuem =
=3D m;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  237  						divider->valued =
=3D d;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  238  						divider->valueo =
=3D o;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  239  						return 0;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  240  					}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  241  				}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  242  			}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  243  		}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  244  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  245  	return -EBUSY;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  246  }
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  247  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  248  static int clk_wzrd_dyna=
mic_all_nolock(struct clk_hw *hw, unsigned long rate,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  249  				       unsigned long=
 parent_rate)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  250  {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  251  	struct clk_wzrd_divider=
 *divider =3D to_clk_wzrd_divider(hw);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  252  	u32 value, regh, edged,=
 p5en, p5fedge, value2, m, regval, regval1;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  253  	int err;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  254  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  255  	err =3D clk_wzrd_get_di=
visors(hw, rate, parent_rate);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  256  	if (err)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  257  		return err;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  258  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  259  	writel(0, divider->base=
 + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_4));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  260  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  261  	m =3D divider->valuem;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  262  	edged =3D m % WZRD_DUTY=
_CYCLE;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  263  	regh =3D m / WZRD_DUTY_=
CYCLE;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  264  	regval1 =3D readl(divid=
er->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_1));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  265  	regval1 |=3D WZRD_MULT_=
PREDIV2;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  266  	if (edged)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  267  		regval1 =3D regval1 | =
WZRD_CLKFBOUT_EDGE;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  268  	else
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  269  		regval1 =3D regval1 & =
~WZRD_CLKFBOUT_EDGE;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  270  	writel(regval1, divider=
->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_1));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  271  	regval1 =3D regh | regh=
 << WZRD_CLKFBOUT_H_SHIFT;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  272  	writel(regval1, divider=
->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_2));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  273  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  274  	value2 =3D divider->val=
ued;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  275  	edged =3D value2 % WZRD=
_DUTY_CYCLE;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  276  	regh =3D (value2 / WZRD=
_DUTY_CYCLE);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  277  	regval1 =3D FIELD_PREP(=
WZRD_DIVCLK_EDGE, edged);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  278  	writel(regval1, divider=
->base + WZRD_CLK_CFG_REG(WZRD_DESKEW_2));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  279  	regval1 =3D regh | regh=
 << WZRD_CLKFBOUT_H_SHIFT;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  280  	writel(regval1, divider=
->base + WZRD_CLK_CFG_REG(WZRD_DIVCLK));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  281  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  282  	value =3D divider->valu=
eo;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  283  	regh =3D value / WZRD_O=
_DIV;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  284  	regval1 =3D readl(divid=
er->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_1));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  285  	regval1 |=3D WZRD_CLKFB=
OUT_PREDIV2;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  286  	regval1 =3D regval1 & ~=
(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  287  	if (value % WZRD_O_DIV =
> 1) {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  288  		edged =3D 1;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  289  		regval1 |=3D edged << =
WZRD_CLKFBOUT_H_SHIFT;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  290  	}
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  291  	p5fedge =3D value % WZR=
D_DUTY_CYCLE;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  292  	p5en =3D value % WZRD_D=
UTY_CYCLE;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  293  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  294  	regval1 =3D regval1 | F=
IELD_PREP(WZRD_P5EN, p5en) | FIELD_PREP(WZRD_P5FEDGE, p5fedge);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  295  	writel(regval1, divider=
->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_1));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  296  	regval =3D regh | regh =
<< WZRD_CLKFBOUT_H_SHIFT;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  297  	writel(regval, divider-=
>base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_2));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  298  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  299  	/* Check status registe=
r */
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  300  	err =3D readl_poll_time=
out(divider->base + WZRD_DR_STATUS_REG_OFFSET,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  301  				 value, value & WZRD=
_DR_LOCK_BIT_MASK,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  302  				 WZRD_USEC_POLL, WZR=
D_TIMEOUT_POLL);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  303  	if (err)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  304  		return err;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  305  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  306  	/* Initiate reconfigura=
tion */
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  307  	writel(WZRD_DR_BEGIN_DY=
NA_RECONF,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  308  	       divider->base + =
WZRD_DR_INIT_REG_OFFSET);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  309  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  310  	/* Check status registe=
r */
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  311  	return  readl_poll_time=
out(divider->base + WZRD_DR_STATUS_REG_OFFSET,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  312  				 value, value & WZRD=
_DR_LOCK_BIT_MASK,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  313  				 WZRD_USEC_POLL, WZR=
D_TIMEOUT_POLL);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  314  }
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  315  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  316  static int clk_wzrd_dyna=
mic_all(struct clk_hw *hw, unsigned long rate,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  317  				unsigned long parent=
_rate)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  318  {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  319  	struct clk_wzrd_divider=
 *divider =3D to_clk_wzrd_divider(hw);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  320  	unsigned long flags =3D=
 0;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  321  	int ret;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  322  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  323  	if (divider->lock)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  324  		spin_lock_irqsave(divi=
der->lock, flags);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  325  	else
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  326  		__acquire(divider->loc=
k);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  327  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  328  	ret =3D clk_wzrd_dynami=
c_all_nolock(hw, rate, parent_rate);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  329  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  330  	if (divider->lock)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  331  		spin_unlock_irqrestore=
(divider->lock, flags);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  332  	else
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  333  		__release(divider->loc=
k);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  334  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  335  	return ret;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  336  }
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  337  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  338  static unsigned long clk=
_wzrd_recalc_rate(struct clk_hw *hw,
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  339  					  unsigned long par=
ent_rate)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  340  {
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  341  	struct clk_wzrd_divider=
 *divider =3D to_clk_wzrd_divider(hw);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  342  	void __iomem *div_addr =
=3D
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31 @343  			(void __iomem *)((u64=
)divider->base + divider->offset);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  344  	unsigned int vall, valh;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  345  	u32 div;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  346  	u32 p5en, edge, prediv2;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  347  	u32 all;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  348  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  349  	edge =3D !!(readl(div_a=
ddr) & BIT(8));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  350  	p5en =3D !!(readl(div_a=
ddr) & BIT(13));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  351  	prediv2 =3D !!(readl(di=
v_addr) & BIT(11));
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  352  	vall =3D readl(div_addr=
 + 4) & 0xff;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  353  	valh =3D readl(div_addr=
 + 4) >> 8;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  354  	all =3D valh + vall + e=
dge;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  355  	if (!all)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  356  		all =3D 1;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  357  	if (prediv2)
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  358  		div =3D  (2 * all + pr=
ediv2 * p5en);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  359  	else
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  360  		div =3D all;
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  361  =

8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  362  	return DIV_ROUND_UP_ULL=
((u64)parent_rate, div);
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  363  }
8b5383767cb4c8 Shubhrajyoti Datta 2020-03-31  364  =


:::::: The code at line 230 was first introduced by commit
:::::: 8b5383767cb4c856283824baee568f4286ecc0db clocking-wizard: Add versal=
 clocking wizard support

:::::: TO: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4084568382417028490==--


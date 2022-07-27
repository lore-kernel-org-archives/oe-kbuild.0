Content-Type: multipart/mixed; boundary="===============0862213584829243807=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/versatile/clk-icst.c:65:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Wed, 27 Jul 2022 14:54:07 +0800
Message-ID: <202207271400.H0Ijrgr6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0862213584829243807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "commit no functional change"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/clk/versatile/clk-icst.c:65:13: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jean Delvare <jdelvare@suse.de>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>

Hi Jean,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5de64d44968e4ae66ebdb0a2d08b443f189d3651
commit: 323fd5955f844d1b6acf1a1af488da460f657ff2 clk: versatile: Rename ICS=
T to CLK_ICST
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220724 (https://download.01.org/0day-ci/archi=
ve/20220727/202207271400.H0Ijrgr6-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D323fd5955f844d1b6acf1a1af488da460f657ff2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 323fd5955f844d1b6acf1a1af488da460f657ff2
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from drivers/clk/versatile/clk-icst.c:14:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always eval=
uate as 'true' for the address of 'mem_section' will never be NULL [-Waddre=
ss]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS=
_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/clk/versatile/clk-icst.c: In function 'vco_get':
>> drivers/clk/versatile/clk-icst.c:65:13: warning: use of uninitialized va=
lue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      65 |         u32 val;
         |             ^~~
     'vco_get': event 1
       |
       |   65 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +65 drivers/clk/versatile/clk-icst.c

91b87a4795c42b Linus Walleij 2012-06-11   57  =

7a9ad671ac0a0e Linus Walleij 2012-11-20   58  /**
179c8fb3c2a6cc Linus Walleij 2015-10-12   59   * vco_get() - get ICST VCO s=
ettings from a certain ICST
179c8fb3c2a6cc Linus Walleij 2015-10-12   60   * @icst: the ICST clock to g=
et
179c8fb3c2a6cc Linus Walleij 2015-10-12   61   * @vco: the VCO struct to re=
turn the value in
7a9ad671ac0a0e Linus Walleij 2012-11-20   62   */
179c8fb3c2a6cc Linus Walleij 2015-10-12   63  static int vco_get(struct clk=
_icst *icst, struct icst_vco *vco)
7a9ad671ac0a0e Linus Walleij 2012-11-20   64  {
7a9ad671ac0a0e Linus Walleij 2012-11-20  @65  	u32 val;
179c8fb3c2a6cc Linus Walleij 2015-10-12   66  	int ret;
179c8fb3c2a6cc Linus Walleij 2015-10-12   67  =

179c8fb3c2a6cc Linus Walleij 2015-10-12   68  	ret =3D regmap_read(icst->ma=
p, icst->vcoreg_off, &val);
179c8fb3c2a6cc Linus Walleij 2015-10-12   69  	if (ret)
179c8fb3c2a6cc Linus Walleij 2015-10-12   70  		return ret;
5e23c593057520 Linus Walleij 2016-08-22   71  =

5e23c593057520 Linus Walleij 2016-08-22   72  	/*
5e23c593057520 Linus Walleij 2016-08-22   73  	 * The Integrator/AP core cl=
ock can only access the low eight
5e23c593057520 Linus Walleij 2016-08-22   74  	 * bits of the v PLL divider=
. Bit 8 is tied low and always zero,
5e23c593057520 Linus Walleij 2016-08-22   75  	 * r is hardwired to 22 and =
output divider s is hardwired to 1
5e23c593057520 Linus Walleij 2016-08-22   76  	 * (divide by 2) according t=
o the document
5e23c593057520 Linus Walleij 2016-08-22   77  	 * "Integrator CM926EJ-S, CM=
946E-S, CM966E-S, CM1026EJ-S and
5e23c593057520 Linus Walleij 2016-08-22   78  	 * CM1136JF-S User Guide" AR=
M DUI 0138E, page 3-13 thru 3-14.
5e23c593057520 Linus Walleij 2016-08-22   79  	 */
5e23c593057520 Linus Walleij 2016-08-22   80  	if (icst->ctype =3D=3D ICST_=
INTEGRATOR_AP_CM) {
5e23c593057520 Linus Walleij 2016-08-22   81  		vco->v =3D val & INTEGRATOR=
_AP_CM_BITS;
5e23c593057520 Linus Walleij 2016-08-22   82  		vco->r =3D 22;
5e23c593057520 Linus Walleij 2016-08-22   83  		vco->s =3D 1;
5e23c593057520 Linus Walleij 2016-08-22   84  		return 0;
5e23c593057520 Linus Walleij 2016-08-22   85  	}
5e23c593057520 Linus Walleij 2016-08-22   86  =

fa62e10d2613b9 Linus Walleij 2016-08-27   87  	/*
fa62e10d2613b9 Linus Walleij 2016-08-27   88  	 * The Integrator/AP system =
clock on the base board can only
fa62e10d2613b9 Linus Walleij 2016-08-27   89  	 * access the low eight bits=
 of the v PLL divider. Bit 8 is tied low
fa62e10d2613b9 Linus Walleij 2016-08-27   90  	 * and always zero, r is har=
dwired to 46, and the output divider is
fa62e10d2613b9 Linus Walleij 2016-08-27   91  	 * hardwired to 3 (divide by=
 4) according to the document
fa62e10d2613b9 Linus Walleij 2016-08-27   92  	 * "Integrator AP ASIC Devel=
opment Motherboard" ARM DUI 0098B,
fa62e10d2613b9 Linus Walleij 2016-08-27   93  	 * page 3-16.
fa62e10d2613b9 Linus Walleij 2016-08-27   94  	 */
fa62e10d2613b9 Linus Walleij 2016-08-27   95  	if (icst->ctype =3D=3D ICST_=
INTEGRATOR_AP_SYS) {
fa62e10d2613b9 Linus Walleij 2016-08-27   96  		vco->v =3D val & INTEGRATOR=
_AP_SYS_BITS;
fa62e10d2613b9 Linus Walleij 2016-08-27   97  		vco->r =3D 46;
fa62e10d2613b9 Linus Walleij 2016-08-27   98  		vco->s =3D 3;
fa62e10d2613b9 Linus Walleij 2016-08-27   99  		return 0;
fa62e10d2613b9 Linus Walleij 2016-08-27  100  	}
fa62e10d2613b9 Linus Walleij 2016-08-27  101  =

fa62e10d2613b9 Linus Walleij 2016-08-27  102  	/*
fa62e10d2613b9 Linus Walleij 2016-08-27  103  	 * The Integrator/AP PCI clo=
ck is using an odd pattern to create
fa62e10d2613b9 Linus Walleij 2016-08-27  104  	 * the child clock, basicall=
y a single bit called DIVX/Y is used
fa62e10d2613b9 Linus Walleij 2016-08-27  105  	 * to select between two dif=
ferent hardwired values: setting the
fa62e10d2613b9 Linus Walleij 2016-08-27  106  	 * bit to 0 yields v =3D 17,=
 r =3D 22 and OD =3D 1, whereas setting the
fa62e10d2613b9 Linus Walleij 2016-08-27  107  	 * bit to 1 yields v =3D 14,=
 r =3D 14 and OD =3D 1 giving the frequencies
fa62e10d2613b9 Linus Walleij 2016-08-27  108  	 * 33 or 25 MHz respectively.
fa62e10d2613b9 Linus Walleij 2016-08-27  109  	 */
fa62e10d2613b9 Linus Walleij 2016-08-27  110  	if (icst->ctype =3D=3D ICST_=
INTEGRATOR_AP_PCI) {
fa62e10d2613b9 Linus Walleij 2016-08-27  111  		bool divxy =3D !!(val & INT=
EGRATOR_AP_PCI_25_33_MHZ);
fa62e10d2613b9 Linus Walleij 2016-08-27  112  =

fa62e10d2613b9 Linus Walleij 2016-08-27  113  		vco->v =3D divxy ? 17 : 14;
fa62e10d2613b9 Linus Walleij 2016-08-27  114  		vco->r =3D divxy ? 22 : 14;
fa62e10d2613b9 Linus Walleij 2016-08-27  115  		vco->s =3D 1;
fa62e10d2613b9 Linus Walleij 2016-08-27  116  		return 0;
fa62e10d2613b9 Linus Walleij 2016-08-27  117  	}
fa62e10d2613b9 Linus Walleij 2016-08-27  118  =

5e23c593057520 Linus Walleij 2016-08-22  119  	/*
5e23c593057520 Linus Walleij 2016-08-22  120  	 * The Integrator/CP core cl=
ock can access the low eight bits
5e23c593057520 Linus Walleij 2016-08-22  121  	 * of the v PLL divider. Bit=
 8 is tied low and always zero,
5e23c593057520 Linus Walleij 2016-08-22  122  	 * r is hardwired to 22 and =
the output divider s is accessible
5e23c593057520 Linus Walleij 2016-08-22  123  	 * in bits 8 thru 10 accordi=
ng to the document
5e23c593057520 Linus Walleij 2016-08-22  124  	 * "Integrator/CM940T, CM920=
T, CM740T, and CM720T User Guide"
5e23c593057520 Linus Walleij 2016-08-22  125  	 * ARM DUI 0157A, page 3-20 =
thru 3-23 and 4-10.
5e23c593057520 Linus Walleij 2016-08-22  126  	 */
5e23c593057520 Linus Walleij 2016-08-22  127  	if (icst->ctype =3D=3D ICST_=
INTEGRATOR_CP_CM_CORE) {
5e23c593057520 Linus Walleij 2016-08-22  128  		vco->v =3D val & 0xFF;
5e23c593057520 Linus Walleij 2016-08-22  129  		vco->r =3D 22;
5e23c593057520 Linus Walleij 2016-08-22  130  		vco->s =3D (val >> 8) & 7;
5e23c593057520 Linus Walleij 2016-08-22  131  		return 0;
5e23c593057520 Linus Walleij 2016-08-22  132  	}
5e23c593057520 Linus Walleij 2016-08-22  133  =

5e23c593057520 Linus Walleij 2016-08-22  134  	if (icst->ctype =3D=3D ICST_=
INTEGRATOR_CP_CM_MEM) {
5e23c593057520 Linus Walleij 2016-08-22  135  		vco->v =3D (val >> 12) & 0x=
FF;
5e23c593057520 Linus Walleij 2016-08-22  136  		vco->r =3D 22;
5e23c593057520 Linus Walleij 2016-08-22  137  		vco->s =3D (val >> 20) & 7;
5e23c593057520 Linus Walleij 2016-08-22  138  		return 0;
5e23c593057520 Linus Walleij 2016-08-22  139  	}
5e23c593057520 Linus Walleij 2016-08-22  140  =

179c8fb3c2a6cc Linus Walleij 2015-10-12  141  	vco->v =3D val & 0x1ff;
179c8fb3c2a6cc Linus Walleij 2015-10-12  142  	vco->r =3D (val >> 9) & 0x7f;
179c8fb3c2a6cc Linus Walleij 2015-10-12  143  	vco->s =3D (val >> 16) & 03;
179c8fb3c2a6cc Linus Walleij 2015-10-12  144  	return 0;
7a9ad671ac0a0e Linus Walleij 2012-11-20  145  }
7a9ad671ac0a0e Linus Walleij 2012-11-20  146  =


:::::: The code at line 65 was first introduced by commit
:::::: 7a9ad671ac0a0ec2fc86887a9416f837c0cfb801 clk: make ICST driver handl=
e the VCO registers

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Mike Turquette <mturquette@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0862213584829243807==--


Content-Type: multipart/mixed; boundary="===============5538385616485381961=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/tlv320adc3xxx.c:416:8: warning: Excessive padding in 'struct adc3xxx_rate_divs' (4 padding bytes, where 0 is optimal).
Date: Mon, 21 Mar 2022 07:38:39 +0800
Message-ID: <202203210713.lxJOxt1Q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5538385616485381961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ricard Wanderlof <ricardw@axis.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   14702b3b2438e2f2d07ae93b5d695c166e5c83d1
commit: e9a3b57efd28fe889a98171bdc1e9e0dd7eb9a50 ASoC: codec: tlv320adc3xxx=
: New codec driver
date:   3 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220316 (https://download.01.org/0day-ci/arc=
hive/20220321/202203210713.lxJOxt1Q-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De9a3b57efd28fe889a98171bdc1e9e0dd7eb9a50
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e9a3b57efd28fe889a98171bdc1e9e0dd7eb9a50
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   sound/soc/codecs/ak4642.c:410:2: warning: Value stored to 'data' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           data =3D 0;
           ^      ~
   sound/soc/codecs/ak4642.c:410:2: note: Value stored to 'data' is never r=
ead
           data =3D 0;
           ^      ~
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   sound/soc/codecs/cs35l33.c:1161:3: warning: Value stored to 'pdata' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   pdata =3D &cs35l33->pdata;
                   ^       ~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l33.c:1161:3: note: Value stored to 'pdata' is neve=
r read
                   pdata =3D &cs35l33->pdata;
                   ^       ~~~~~~~~~~~~~~~
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   kernel/sched/rt.c:2292:6: warning: Value stored to 'this_cpu' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           int this_cpu =3D this_rq->cpu, cpu;
               ^~~~~~~~   ~~~~~~~~~~~~
   kernel/sched/rt.c:2292:6: note: Value stored to 'this_cpu' during its in=
itialization is never read
           int this_cpu =3D this_rq->cpu, cpu;
               ^~~~~~~~   ~~~~~~~~~~~~
   Suppressed 20 warnings (12 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> sound/soc/codecs/tlv320adc3xxx.c:416:8: warning: Excessive padding in 's=
truct adc3xxx_rate_divs' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   mclk, =

   rate, =

   pll_d, =

   pll_p, =

   pll_r, =

   pll_j, =

   nadc, =

   madc, =

   aosr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adc3xxx_rate_divs {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tlv320adc3xxx.c:416:8: note: Excessive padding in 'stru=
ct adc3xxx_rate_divs' (4 padding bytes, where 0 is optimal). Optimal fields=
 order: mclk, rate, pll_d, pll_p, pll_r, pll_j, nadc, madc, aosr, consider =
reordering the fields or adding explicit padding members
   struct adc3xxx_rate_divs {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/leds/leds-lp5523.c:811:2: warning: Undefined or garbage value re=
turned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/leds/leds-lp5523.c:798:2: note: 'ret' declared without an initia=
l value
           int ret;
           ^~~~~~~
   drivers/leds/leds-lp5523.c:802:14: note: Assuming 'i' is >=3D field 'num=
_colors'
           for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-lp5523.c:802:2: note: Loop condition is false. Executi=
on continues on line 810
           for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
           ^
   drivers/leds/leds-lp5523.c:811:2: note: Undefined or garbage value retur=
ned to caller
           return ret;
           ^      ~~~
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.

vim +416 sound/soc/codecs/tlv320adc3xxx.c

e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  415  =

e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15 @416  struct adc3xxx_rate_divs {
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  417  	u32 mclk;
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  418  	u32 rate;
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  419  	u8 pll_p;
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  420  	u8 pll_r;
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  421  	u8 pll_j;
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  422  	u16 pll_d;
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  423  	u8 nadc;
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  424  	u8 madc;
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  425  	u8 aosr;
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  426  };
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  427  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5538385616485381961==--


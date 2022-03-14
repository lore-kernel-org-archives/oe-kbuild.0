Content-Type: multipart/mixed; boundary="===============8887182921715516309=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/ahci_da850.c:57:22: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Mon, 14 Mar 2022 22:45:01 +0800
Message-ID: <202203142201.17wfQJh3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8887182921715516309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: e73d737894dc4a59f232e1a1b16d968569fa0ffd ata: ahci_da850: add compi=
le test support
date:   10 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 weeks ago
config: arm-randconfig-c002-20220312 (https://download.01.org/0day-ci/archi=
ve/20220314/202203142201.17wfQJh3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De73d737894dc4a59f232e1a1b16d968569fa0ffd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e73d737894dc4a59f232e1a1b16d968569fa0ffd
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (nopan) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:1917:2: note: Calling 'matrox=
fb_check_var'
           matroxfb_check_var(&vesafb_defined, &minfo->fbcon);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:739:6: note: Assuming field '=
dead' is 0
           if (minfo->dead) {
               ^~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:739:2: note: Taking false bra=
nch
           if (minfo->dead) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:742:13: note: Calling 'matrox=
fb_decode_var'
           if ((err =3D matroxfb_decode_var(minfo, var, &visual, &cmap_len,=
 &ydstorg)) !=3D 0)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:557:2: note: Control jumps to=
 'case 32:'  at line 563
           switch (bpp) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:563:12: note:  Execution cont=
inues on line 566
                   case 32: break;
                            ^
   drivers/video/fbdev/matrox/matroxfb_base.c:568:6: note: Assuming field '=
yres_virtual' is >=3D field 'yres'
           if (var->yres_virtual < var->yres)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:568:2: note: Taking false bra=
nch
           if (var->yres_virtual < var->yres)
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:570:11: note: Field 'xres_vir=
tual' is >=3D field 'xres'
           if (var->xres_virtual < var->xres)
                    ^
   drivers/video/fbdev/matrox/matroxfb_base.c:570:2: note: Taking false bra=
nch
           if (var->xres_virtual < var->xres)
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:575:6: note: Assuming 'memlen=
' is <=3D 'vramlen'
           if (memlen > vramlen) {
               ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:575:2: note: Taking false bra=
nch
           if (memlen > vramlen) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:582:6: note: Assuming field '=
cross4MB' is 0
           if (!minfo->capable.cross4MB && (memlen > 0x400000)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:582:6: note: Left side of '&&=
' is true
   drivers/video/fbdev/matrox/matroxfb_base.c:582:35: note: Assuming 'memle=
n' is > 4194304
           if (!minfo->capable.cross4MB && (memlen > 0x400000)) {
                                            ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:582:2: note: Taking true bran=
ch
           if (!minfo->capable.cross4MB && (memlen > 0x400000)) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:583:7: note: 'bpp' is not equ=
al to 24
                   if (bpp =3D=3D 24) {
                       ^~~
   drivers/video/fbdev/matrox/matroxfb_base.c:583:3: note: Taking false bra=
nch
                   if (bpp =3D=3D 24) {
                   ^
   drivers/video/fbdev/matrox/matroxfb_base.c:591:4: note: Loop condition i=
s false. Execution continues on line 595
                           while (m1) {
                           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:595:4: note: The value 0 is a=
ssigned to 'm2'
                           m2 =3D linelen * PAGE_SIZE / m2;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:596:29: note: Division by zero
                           *ydstorg =3D m2 =3D 0x400000 % m2;
                                           ~~~~~~~~~^~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/bus/mhi/core/boot.c:143:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx=
_status);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/bus/mhi/core/boot.c:143:2: note: Value stored to 'ret' is never =
read
           ret =3D mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx=
_status);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: warning: Value stored to =
'value' is never read [clang-analyzer-deadcode.DeadStores]
           value |=3D RXDET_IN_P3_32KHZ;
           ^
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: note: Value stored to 'va=
lue' is never read
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/ata/ahci_da850.c:57:22: warning: Division by zero [clang-analyze=
r-core.DivideZero]
           needed =3D pll_output / (refclk_rate / 10);
                               ^
   drivers/ata/ahci_da850.c:171:6: note: Calling 'IS_ERR'
           if (IS_ERR(hpriv))
               ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_da850.c:171:6: note: Returning from 'IS_ERR'
           if (IS_ERR(hpriv))
               ^~~~~~~~~~~~~
   drivers/ata/ahci_da850.c:171:2: note: Taking false branch
           if (IS_ERR(hpriv))
           ^
   drivers/ata/ahci_da850.c:181:6: note: Assuming the condition is false
           if (!hpriv->clks[0]) {
               ^~~~~~~~~~~~~~~
   drivers/ata/ahci_da850.c:181:2: note: Taking false branch
           if (!hpriv->clks[0]) {
           ^
   drivers/ata/ahci_da850.c:194:6: note: Assuming the condition is false
           if (!hpriv->clks[1]) {
               ^~~~~~~~~~~~~~~
   drivers/ata/ahci_da850.c:194:2: note: Taking false branch
           if (!hpriv->clks[1]) {
           ^
   drivers/ata/ahci_da850.c:204:33: note: Calling 'clk_get_rate'
           mpy =3D ahci_da850_calculate_mpy(clk_get_rate(hpriv->clks[1]));
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ata/ahci_da850.c:204:33: note: Returning from 'clk_get_rate'
           mpy =3D ahci_da850_calculate_mpy(clk_get_rate(hpriv->clks[1]));
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_da850.c:204:33: note: Passing the value 0 via 1st param=
eter 'refclk_rate'
           mpy =3D ahci_da850_calculate_mpy(clk_get_rate(hpriv->clks[1]));
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_da850.c:204:8: note: Calling 'ahci_da850_calculate_mpy'
           mpy =3D ahci_da850_calculate_mpy(clk_get_rate(hpriv->clks[1]));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_da850.c:56:2: note: Taking false branch
           WARN((refclk_rate % 10) !=3D 0, "refclk must be divisible by 10"=
);
           ^
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/ata/ahci_da850.c:57:22: note: Division by zero
           needed =3D pll_output / (refclk_rate / 10);
                    ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/misc/fastrpc.c:410:25: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
                   ctx->olaps[i].start =3D ctx->args[i].ptr;
                                         ^
   drivers/misc/fastrpc.c:1494:2: note: Control jumps to 'case 3222295043:'=
  at line 1495
           switch (cmd) {
           ^
   drivers/misc/fastrpc.c:1496:9: note: Calling 'fastrpc_invoke'
                   err =3D fastrpc_invoke(fl, argp);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/fastrpc.c:1317:2: note: 'args' initialized to a null pointe=
r value
           struct fastrpc_invoke_args *args =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/fastrpc.c:1322:6: note: Calling 'copy_from_user'
           if (copy_from_user(&inv, argp, sizeof(inv)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))

vim +57 drivers/ata/ahci_da850.c

ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  43  =

cdf0ead3747200 Bartosz Golaszewski       2017-01-30  44  static u32 ahci_da=
850_calculate_mpy(unsigned long refclk_rate)
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  45  {
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  46  	u32 pll_output =
=3D 1500000000, needed;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  47  =

cdf0ead3747200 Bartosz Golaszewski       2017-01-30  48  	/*
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  49  	 * We need to det=
ermine the value of the multiplier (MPY) bits.
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  50  	 * In order to in=
clude the 12.5 multiplier we need to first divide
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  51  	 * the refclk rat=
e by ten.
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  52  	 *
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  53  	 * __div64_32() t=
urned out to be unreliable, sometimes returning
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  54  	 * false results.
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  55  	 */
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  56  	WARN((refclk_rate=
 % 10) !=3D 0, "refclk must be divisible by 10");
cdf0ead3747200 Bartosz Golaszewski       2017-01-30 @57  	needed =3D pll_ou=
tput / (refclk_rate / 10);
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  58  =

cdf0ead3747200 Bartosz Golaszewski       2017-01-30  59  	/*
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  60  	 * What we have n=
ow is (multiplier * 10).
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  61  	 *
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  62  	 * Let's determin=
e the actual register value we need to write.
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  63  	 */
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  64  =

cdf0ead3747200 Bartosz Golaszewski       2017-01-30  65  	switch (needed) {
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  66  	case 50:
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  67  		return 0x1;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  68  	case 60:
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  69  		return 0x2;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  70  	case 80:
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  71  		return 0x4;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  72  	case 100:
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  73  		return 0x5;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  74  	case 120:
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  75  		return 0x6;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  76  	case 125:
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  77  		return 0x7;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  78  	case 150:
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  79  		return 0x8;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  80  	case 200:
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  81  		return 0x9;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  82  	case 250:
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  83  		return 0xa;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  84  	default:
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  85  		/*
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  86  		 * We should hav=
e divided evenly - if not, return an invalid
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  87  		 * value.
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  88  		 */
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  89  		return 0;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  90  	}
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  91  }
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  92  =


:::::: The code at line 57 was first introduced by commit
:::::: cdf0ead3747200d527f37170d3fdd41e368f88b0 sata: ahci-da850: un-hardco=
de the MPY bits

:::::: TO: Bartosz Golaszewski <bgolaszewski@baylibre.com>
:::::: CC: Sekhar Nori <nsekhar@ti.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8887182921715516309==--


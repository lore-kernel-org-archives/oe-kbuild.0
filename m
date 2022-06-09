Content-Type: multipart/mixed; boundary="===============4963204092150822474=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spi-omap-uwire.c:121:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 09 Jun 2022 22:43:55 +0800
Message-ID: <202206092247.S9f5vzXr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4963204092150822474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/s=
pi/spi-omap-uwire.c:121:3: warning: Value stored to 'val' is never read [cl=
ang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6bfb56e93bcef41859c2d5ab234ffd80b691be35
commit: 58d37dc1dfd8900892d73da1f26ac1cefca52e6e ARM: omap1: move perseus s=
pi pinconf to board file
date:   7 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20220608 (https://download.01.org/0day-ci/archi=
ve/20220609/202206092247.S9f5vzXr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436=
efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D58d37dc1dfd8900892d73da1f26ac1cefca52e6e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 58d37dc1dfd8900892d73da1f26ac1cefca52e6e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwmon/lm75.h:29:12: note: 'ntemp' is < 0
           ntemp +=3D (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
   drivers/hwmon/w83627ehf.c:881:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   show_tol_temp(tolerance)
   ^
   drivers/hwmon/w83627ehf.c:878:9: note: expanded from macro 'show_tol_tem=
p'
           return sprintf(buf, "%d\n", data->reg[nr] * 1000); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:881:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   show_tol_temp(tolerance)
   ^
   drivers/hwmon/w83627ehf.c:878:9: note: expanded from macro 'show_tol_tem=
p'
           return sprintf(buf, "%d\n", data->reg[nr] * 1000); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:882:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   show_tol_temp(target_temp)
   ^
   drivers/hwmon/w83627ehf.c:878:9: note: expanded from macro 'show_tol_tem=
p'
           return sprintf(buf, "%d\n", data->reg[nr] * 1000); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:882:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   show_tol_temp(target_temp)
   ^
   drivers/hwmon/w83627ehf.c:878:9: note: expanded from macro 'show_tol_tem=
p'
           return sprintf(buf, "%d\n", data->reg[nr] * 1000); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:988:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   fan_functions(fan_start_output, W83627EHF_REG_FAN_START_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:988:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   fan_functions(fan_start_output, W83627EHF_REG_FAN_START_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:989:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   fan_functions(fan_stop_output, W83627EHF_REG_FAN_STOP_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:989:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   fan_functions(fan_stop_output, W83627EHF_REG_FAN_STOP_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:990:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   fan_functions(fan_max_output, data->REG_FAN_MAX_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:990:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   fan_functions(fan_max_output, data->REG_FAN_MAX_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:991:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   fan_functions(fan_step_output, data->REG_FAN_STEP_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:991:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   fan_functions(fan_step_output, data->REG_FAN_STEP_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:1027:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   fan_time_functions(fan_stop_time, W83627EHF_REG_FAN_STOP_TIME)
   ^
   drivers/hwmon/w83627ehf.c:1001:9: note: expanded from macro 'fan_time_fu=
nctions'
           return sprintf(buf, "%d\n", \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:1027:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   fan_time_functions(fan_stop_time, W83627EHF_REG_FAN_STOP_TIME)
   ^
   drivers/hwmon/w83627ehf.c:1001:9: note: expanded from macro 'fan_time_fu=
nctions'
           return sprintf(buf, "%d\n", \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:1082:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:1082:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
>> drivers/spi/spi-omap-uwire.c:121:3: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   val ^=3D 0x03;
                   ^      ~~~~
   drivers/spi/spi-omap-uwire.c:121:3: note: Value stored to 'val' is never=
 read
                   val ^=3D 0x03;
                   ^      ~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/spi/spi-omap2-mcspi.c:610:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cfg, 0, sizeof(cfg));
           ^~~~~~
   drivers/spi/spi-omap2-mcspi.c:610:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&cfg, 0, sizeof(cfg));
           ^~~~~~
   drivers/spi/spi-omap2-mcspi.c:1232:3: warning: Value stored to 'par_over=
ride' is never read [clang-analyzer-deadcode.DeadStores]
                   par_override =3D 0;
                   ^              ~
   drivers/spi/spi-omap2-mcspi.c:1232:3: note: Value stored to 'par_overrid=
e' is never read
                   par_override =3D 0;
                   ^              ~
   drivers/spi/spi-omap2-mcspi.c:1501:3: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(mcspi->dma_channels[i].dma_rx_ch_name, "rx%d", i=
);
                   ^~~~~~~
   drivers/spi/spi-omap2-mcspi.c:1501:3: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(mcspi->dma_channels[i].dma_rx_ch_name, "rx%d", i=
);
                   ^~~~~~~
   drivers/spi/spi-omap2-mcspi.c:1502:3: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(mcspi->dma_channels[i].dma_tx_ch_name, "tx%d", i=
);
                   ^~~~~~~
   drivers/spi/spi-omap2-mcspi.c:1502:3: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(mcspi->dma_channels[i].dma_tx_ch_name, "tx%d", i=
);
                   ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   lib/xarray.c:2033:18: warning: Value stored to 'node' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   lib/xarray.c:2033:18: note: Value stored to 'node' during its initializa=
tion is never read
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/irqchip/irq-renesas-intc-irqpin.c:408:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(io, 0, sizeof(io));
           ^~~~~~
   drivers/irqchip/irq-renesas-intc-irqpin.c:408:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(io, 0, sizeof(io));
           ^~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/clocksource/timer-stm32.c:282:9: warning: The result of the left=
 shift is undefined due to shifting by '32', which is greater or equal to t=
he width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                           (1 <<  bits) - 1);
                                              ^
   drivers/clocksource/timer-stm32.c:295:6: note: Assuming 'to' is non-null
           if (!to)
               ^~~
   drivers/clocksource/timer-stm32.c:295:2: note: Taking false branch
           if (!to)
           ^
   drivers/clocksource/timer-stm32.c:302:6: note: Assuming 'ret' is 0
           if (ret)

vim +/val +121 drivers/spi/spi-omap-uwire.c

fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  114  =

fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  115  sta=
tic inline void omap_uwire_configure_mode(u8 cs, unsigned long flags)
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  116  {
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  117  	u1=
6	w, val =3D 0;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  118  	in=
t	shift, reg;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  119  =

fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  120  	if=
 (flags & UWIRE_CLK_INVERTED)
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12 @121  		v=
al ^=3D 0x03;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  122  	va=
l =3D flags & 0x3f;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  123  	if=
 (cs & 1)
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  124  		s=
hift =3D 6;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  125  	el=
se
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  126  		s=
hift =3D 0;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  127  	if=
 (cs <=3D 1)
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  128  		r=
eg =3D UWIRE_SR1;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  129  	el=
se
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  130  		r=
eg =3D UWIRE_SR2;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  131  =

fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  132  	w =
=3D uwire_read_reg(reg);
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  133  	w =
&=3D ~(0x3f << shift);
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  134  	w =
|=3D val << shift;
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  135  	uw=
ire_write_reg(reg, w);
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  136  }
fdb3c18d639311 drivers/spi/omap_uwire.c David Brownell 2007-02-12  137  =


:::::: The code@line 121 was first introduced by commit
:::::: fdb3c18d639311287dc4675abe743847a1aa62a8 [PATCH] SPI controller driv=
er for OMAP Microwire

:::::: TO: David Brownell <david-b@pacbell.net>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4963204092150822474==--


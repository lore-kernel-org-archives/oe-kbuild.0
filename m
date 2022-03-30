Content-Type: multipart/mixed; boundary="===============7167347654474749974=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mmc/host/litex_mmc.c:436:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 30 Mar 2022 13:50:35 +0800
Message-ID: <202203301336.WANXPoBa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7167347654474749974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gabriel Somlo <gsomlo@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Kamil Rakoczy <krakoczy@antmicro.com>
CC: Maciej Dudek <mdudek@internships.antmicro.com>
CC: Paul Mackerras <paulus@ozlabs.org>
CC: Joel Stanley <joel@jms.id.au>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1c24a186398f59c80adb9a967486b65c1423a59d
commit: 92e099104729d7284d37bc0f49f8a9d30f3e0521 mmc: Add driver for LiteX'=
s LiteSDCard interface
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220328 (https://download.01.org/0day-ci/archi=
ve/20220330/202203301336.WANXPoBa-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D92e099104729d7284d37bc0f49f8a9d30f3e0521
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 92e099104729d7284d37bc0f49f8a9d30f3e0521
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/phy/cadence/phy-cadence-torrent.c:1352:25: warning: The result o=
f the left shift is undefined because the left operand is negative [clang-a=
nalyzer-core.UndefinedBinaryOperatorResult]
           value |=3D ((~lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) &
                                  ^
   drivers/phy/cadence/phy-cadence-torrent.c:1476:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/phy/cadence/phy-cadence-torrent.c:1476:2: note: Taking false bra=
nch
           if (ret) {
           ^
   drivers/phy/cadence/phy-cadence-torrent.c:1481:6: note: Assuming field '=
set_lanes' is not equal to 0
           if (opts->dp.set_lanes) {
               ^~~~~~~~~~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1481:2: note: Taking true bran=
ch
           if (opts->dp.set_lanes) {
           ^
   drivers/phy/cadence/phy-cadence-torrent.c:1482:9: note: Calling 'cdns_to=
rrent_dp_set_lanes'
                   ret =3D cdns_torrent_dp_set_lanes(cdns_phy, &opts->dp);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1352:25: note: The result of t=
he left shift is undefined because the left operand is negative
           value |=3D ((~lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) &
                     ~~~~~~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/mmc/host/mmc_spi.c:354:4: warning: Value stored to 'end' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           end =3D cp+1;
                           ^     ~~~~
   drivers/mmc/host/mmc_spi.c:354:4: note: Value stored to 'end' is never r=
ead
                           end =3D cp+1;
                           ^     ~~~~
   drivers/mmc/host/mmc_spi.c:866:15: warning: Value stored to 'write_or_re=
ad' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           const char              *write_or_read =3D (direction =3D=3D DMA=
_TO_DEVICE) ? "write" : "read";
                                    ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:866:15: note: Value stored to 'write_or_read'=
 during its initialization is never read
           const char              *write_or_read =3D (direction =3D=3D DMA=
_TO_DEVICE) ? "write" : "read";
                                    ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:1076:4: warning: Value stored to 'status' is =
never read [clang-analyzer-deadcode.DeadStores]
                           status =3D mmc_spi_command_send(host, mrq, &stop=
, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/mmc/host/mmc_spi.c:1076:4: note: Value stored to 'status' is nev=
er read
                           status =3D mmc_spi_command_send(host, mrq, &stop=
, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/mmc/host/mmc_spi.c:1083:4: warning: Value stored to 'status' is =
never read [clang-analyzer-deadcode.DeadStores]
                           status =3D mmc_spi_command_send(host, mrq, mrq->=
stop, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/mmc/host/mmc_spi.c:1083:4: note: Value stored to 'status' is nev=
er read
                           status =3D mmc_spi_command_send(host, mrq, mrq->=
stop, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/mmc/host/mmc_spi.c:1238:3: warning: Value stored to 'status' is =
never read [clang-analyzer-deadcode.DeadStores]
                   status =3D spi_setup(host->spi);
                   ^        ~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:1238:3: note: Value stored to 'status' is nev=
er read
                   status =3D spi_setup(host->spi);
                   ^        ~~~~~~~~~~~~~~~~~~~~
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
   8 warnings generated.
>> drivers/mmc/host/litex_mmc.c:436:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mmc_dev(host->mmc);
                          ^~~
   drivers/mmc/host/litex_mmc.c:436:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D mmc_dev(host->mmc);
                          ^~~
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
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/tegra/sor.c:809:7: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           for (value =3D 0, i =3D 0; i < link->lanes; i++) {
                ^       ~
   drivers/gpu/drm/tegra/sor.c:809:7: note: Value stored to 'value' is neve=
r read
           for (value =3D 0, i =3D 0; i < link->lanes; i++) {
                ^       ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/tegra/dpaux.c:755:14: warning: The left operand of '!=3D=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (status !=3D connector_status_connected)
                       ~~~~~~ ^
   drivers/gpu/drm/tegra/dpaux.c:729:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/gpu/drm/tegra/dpaux.c:729:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/gpu/drm/tegra/dpaux.c:735:6: note: Assuming field 'panel' is non=
-null
           if (output->panel) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dpaux.c:735:2: note: Taking true branch
           if (output->panel) {
           ^
   drivers/gpu/drm/tegra/dpaux.c:736:3: note: 'status' declared without an =
initial value
                   enum drm_connector_status status;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dpaux.c:738:7: note: Assuming field 'vdd' is null
                   if (dpaux->vdd) {
                       ^~~~~~~~~~
   drivers/gpu/drm/tegra/dpaux.c:738:3: note: Taking false branch
                   if (dpaux->vdd) {
                   ^
   drivers/gpu/drm/tegra/dpaux.c:746:10: note: Left side of '&&' is true
                   while (time_before(jiffies, timeout)) {
                          ^
   include/linux/jiffies.h:108:26: note: expanded from macro 'time_before'
   #define time_before(a,b)        time_after(b,a)
                                   ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
           (typecheck(unsigned long, a) && \
            ^
   include/linux/typecheck.h:9:27: note: expanded from macro 'typecheck'
   #define typecheck(type,x) \
                             ^
   drivers/gpu/drm/tegra/dpaux.c:746:10: note: Left side of '&&' is true
                   while (time_before(jiffies, timeout)) {
                          ^
   include/linux/jiffies.h:108:26: note: expanded from macro 'time_before'
   #define time_before(a,b)        time_after(b,a)
                                   ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
           (typecheck(unsigned long, a) && \

vim +/dev +436 drivers/mmc/host/litex_mmc.c

92e099104729d72 Gabriel Somlo 2022-01-13  433  =

92e099104729d72 Gabriel Somlo 2022-01-13  434  static void litex_mmc_setclk=
(struct litex_mmc_host *host, unsigned int freq)
92e099104729d72 Gabriel Somlo 2022-01-13  435  {
92e099104729d72 Gabriel Somlo 2022-01-13 @436  	struct device *dev =3D mmc_=
dev(host->mmc);
92e099104729d72 Gabriel Somlo 2022-01-13  437  	u32 div;
92e099104729d72 Gabriel Somlo 2022-01-13  438  =

92e099104729d72 Gabriel Somlo 2022-01-13  439  	div =3D freq ? host->ref_cl=
k / freq : 256U;
92e099104729d72 Gabriel Somlo 2022-01-13  440  	div =3D roundup_pow_of_two(=
div);
92e099104729d72 Gabriel Somlo 2022-01-13  441  	div =3D clamp(div, 2U, 256U=
);
92e099104729d72 Gabriel Somlo 2022-01-13  442  	dev_dbg(dev, "sd_clk_freq=
=3D%d: set to %d via div=3D%d\n",
92e099104729d72 Gabriel Somlo 2022-01-13  443  		freq, host->ref_clk / div,=
 div);
92e099104729d72 Gabriel Somlo 2022-01-13  444  	litex_write16(host->sdphy +=
 LITEX_PHY_CLOCKERDIV, div);
92e099104729d72 Gabriel Somlo 2022-01-13  445  	host->sd_clk =3D freq;
92e099104729d72 Gabriel Somlo 2022-01-13  446  }
92e099104729d72 Gabriel Somlo 2022-01-13  447  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7167347654474749974==--


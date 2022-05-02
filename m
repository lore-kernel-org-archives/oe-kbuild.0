Content-Type: multipart/mixed; boundary="===============7152515505928870521=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stored to 'isc_clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 02 May 2022 18:04:54 +0800
Message-ID: <202205021839.CChYnU0X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7152515505928870521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Eugen Hristev <eugen.hristev@microchip.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Jacopo Mondi <jacopo+renesas@jmondi.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0 media: atmel: atmel-isc: s=
plit the clock code into separate source file
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220502/202205021839.CChYnU0X-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (ctlr->dma_rx) {
           ^
   drivers/spi/spi-bcm2835.c:1263:6: note: Assuming the condition is false
           if (spi->mode & SPI_NO_CS)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1263:2: note: Taking false branch
           if (spi->mode & SPI_NO_CS)
           ^
   drivers/spi/spi-bcm2835.c:1269:6: note: Assuming field 'cs_gpiod' is null
           if (spi->cs_gpiod)
               ^~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1269:2: note: Taking false branch
           if (spi->cs_gpiod)
           ^
   drivers/spi/spi-bcm2835.c:1271:6: note: Assuming field 'chip_select' is =
<=3D 1
           if (spi->chip_select > 1) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1271:2: note: Taking false branch
           if (spi->chip_select > 1) {
           ^
   drivers/spi/spi-bcm2835.c:1293:6: note: Assuming 'chip' is non-null
           if (!chip)
               ^~~~~
   drivers/spi/spi-bcm2835.c:1293:2: note: Taking false branch
           if (!chip)
           ^
   drivers/spi/spi-bcm2835.c:1300:2: note: Taking true branch
           if (IS_ERR(spi->cs_gpiod)) {
           ^
   drivers/spi/spi-bcm2835.c:1302:3: note: Control jumps to line 1312
                   goto err_cleanup;
                   ^
   drivers/spi/spi-bcm2835.c:1312:2: note: Calling 'bcm2835_spi_cleanup'
           bcm2835_spi_cleanup(spi);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1161:6: note: Assuming field 'clear_rx_desc' i=
s null
           if (slv->clear_rx_desc)
               ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1161:2: note: Taking false branch
           if (slv->clear_rx_desc)
           ^
   drivers/spi/spi-bcm2835.c:1164:6: note: Assuming field 'clear_rx_addr' i=
s not equal to 0
           if (slv->clear_rx_addr)
               ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1164:2: note: Taking true branch
           if (slv->clear_rx_addr)
           ^
   drivers/spi/spi-bcm2835.c:1165:20: note: Access to field 'device' result=
s in a dereference of a null pointer (loaded from field 'dma_rx')
                   dma_unmap_single(ctlr->dma_rx->device->dev,
                                    ^
   include/linux/dma-mapping.h:407:61: note: expanded from macro 'dma_unmap=
_single'
   #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, =
0)
                                                               ^
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/mfd/sm501.c:513:16: warning: Value stored to 'mode' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long mode =3D smc501_readl(sm->regs + SM501_POWER_MODE_=
CONTROL);
                         ^~~~
   drivers/mfd/sm501.c:513:16: note: Value stored to 'mode' during its init=
ialization is never read
           unsigned long mode =3D smc501_readl(sm->regs + SM501_POWER_MODE_=
CONTROL);
                         ^~~~
   drivers/mfd/sm501.c:514:16: warning: Value stored to 'gate' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long gate =3D smc501_readl(sm->regs + SM501_CURRENT_GAT=
E);
                         ^~~~
   drivers/mfd/sm501.c:514:16: note: Value stored to 'gate' during its init=
ialization is never read
           unsigned long gate =3D smc501_readl(sm->regs + SM501_CURRENT_GAT=
E);
                         ^~~~
   drivers/mfd/sm501.c:515:16: warning: Value stored to 'clock' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long clock =3D smc501_readl(sm->regs + SM501_CURRENT_CL=
OCK);
                         ^~~~~
   drivers/mfd/sm501.c:515:16: note: Value stored to 'clock' during its ini=
tialization is never read
           unsigned long clock =3D smc501_readl(sm->regs + SM501_CURRENT_CL=
OCK);
                         ^~~~~
   8 warnings generated.
   Suppressed 8 warnings (1 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stor=
ed to 'isc_clk' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   drivers/media/platform/atmel/atmel-isc-clk.c:125:18: note: Value stored =
to 'isc_clk' during its initialization is never read
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   fs/btrfs/free-space-cache.c:755:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D -1;
           ^     ~~
   fs/btrfs/free-space-cache.c:755:2: note: Value stored to 'ret' is never =
read
           ret =3D -1;
           ^     ~~
   1 warning generated.
   fs/btrfs/zlib.c:227:13: warning: The left operand of '!=3D' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           while (ret !=3D Z_STREAM_END) {
                  ~~~ ^
   fs/btrfs/zlib.c:99:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   fs/btrfs/zlib.c:115:6: note: Assuming the condition is false
           if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace->leve=
l)) {
               ^
   include/linux/zlib.h:148:25: note: expanded from macro 'Z_OK'
   #define Z_OK            0
                           ^
   fs/btrfs/zlib.c:115:2: note: Taking false branch
           if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace->leve=
l)) {
           ^
   fs/btrfs/zlib.c:125:6: note: Assuming 'out_page' is not equal to NULL
           if (out_page =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~
   fs/btrfs/zlib.c:125:2: note: Taking false branch
           if (out_page =3D=3D NULL) {
           ^
   fs/btrfs/zlib.c:138:9: note: Assuming 'len' is <=3D field 'total_in'
           while (workspace->strm.total_in < len) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zlib.c:138:2: note: Loop condition is false. Execution continue=
s on line 222
           while (workspace->strm.total_in < len) {
           ^
   fs/btrfs/zlib.c:227:13: note: The left operand of '!=3D' is a garbage va=
lue
           while (ret !=3D Z_STREAM_END) {
                  ~~~ ^
   4 warnings generated.
   drivers/gpu/drm/tegra/dc.c:2283:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2283:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2287:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2287:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2376:2: warning: Value stored to 'old_state' =
is never read [clang-analyzer-deadcode.DeadStores]
           old_state =3D drm_atomic_get_old_crtc_state(state, crtc);
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2376:2: note: Value stored to 'old_state' is =
never read
           old_state =3D drm_atomic_get_old_crtc_state(state, crtc);
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/gpu/drm/tegra/sor.c:809:7: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           for (value =3D 0, i =3D 0; i < link->lanes; i++) {
                ^       ~
   drivers/gpu/drm/tegra/sor.c:809:7: note: Value stored to 'value' is neve=
r read
           for (value =3D 0, i =3D 0; i < link->lanes; i++) {
                ^       ~
   1 warning generated.
   drivers/comedi/drivers/pcmmio.c:577:2: warning: Value stored to 'val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           val |=3D inb(iobase + PCMMIO_AI_MSB_REG) << 8;
           ^
   drivers/comedi/drivers/pcmmio.c:577:2: note: Value stored to 'val' is ne=
ver read
   1 warning generated.
   drivers/iio/gyro/adis16080.c:43:8: warning: Excessive padding in 'struct=
 adis16080_state' (42 padding bytes, where 10 is optimal). =

   Optimal fields order: =

   buf, =

   us, =

   info, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adis16080_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/gyro/adis16080.c:43:8: note: Excessive padding in 'struct ad=
is16080_state' (42 padding bytes, where 10 is optimal). Optimal fields orde=
r: buf, us, info, lock, consider reordering the fields or adding explicit p=
adding members
   struct adis16080_state {

vim +/isc_clk +125 drivers/media/platform/atmel/atmel-isc-clk.c

118bf76a35bc2e Eugen Hristev 2021-12-13  121  =

118bf76a35bc2e Eugen Hristev 2021-12-13  122  static int isc_clk_determine_=
rate(struct clk_hw *hw,
118bf76a35bc2e Eugen Hristev 2021-12-13  123  				  struct clk_rate_request=
 *req)
118bf76a35bc2e Eugen Hristev 2021-12-13  124  {
118bf76a35bc2e Eugen Hristev 2021-12-13 @125  	struct isc_clk *isc_clk =3D =
to_isc_clk(hw);
118bf76a35bc2e Eugen Hristev 2021-12-13  126  	long best_rate =3D -EINVAL;
118bf76a35bc2e Eugen Hristev 2021-12-13  127  	int best_diff =3D -1;
118bf76a35bc2e Eugen Hristev 2021-12-13  128  	unsigned int i, div;
118bf76a35bc2e Eugen Hristev 2021-12-13  129  =

118bf76a35bc2e Eugen Hristev 2021-12-13  130  	for (i =3D 0; i < clk_hw_get=
_num_parents(hw); i++) {
118bf76a35bc2e Eugen Hristev 2021-12-13  131  		struct clk_hw *parent;
118bf76a35bc2e Eugen Hristev 2021-12-13  132  		unsigned long parent_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  133  =

118bf76a35bc2e Eugen Hristev 2021-12-13  134  		parent =3D clk_hw_get_paren=
t_by_index(hw, i);
118bf76a35bc2e Eugen Hristev 2021-12-13  135  		if (!parent)
118bf76a35bc2e Eugen Hristev 2021-12-13  136  			continue;
118bf76a35bc2e Eugen Hristev 2021-12-13  137  =

118bf76a35bc2e Eugen Hristev 2021-12-13  138  		parent_rate =3D clk_hw_get_=
rate(parent);
118bf76a35bc2e Eugen Hristev 2021-12-13  139  		if (!parent_rate)
118bf76a35bc2e Eugen Hristev 2021-12-13  140  			continue;
118bf76a35bc2e Eugen Hristev 2021-12-13  141  =

118bf76a35bc2e Eugen Hristev 2021-12-13  142  		for (div =3D 1; div < ISC_C=
LK_MAX_DIV + 2; div++) {
118bf76a35bc2e Eugen Hristev 2021-12-13  143  			unsigned long rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  144  			int diff;
118bf76a35bc2e Eugen Hristev 2021-12-13  145  =

118bf76a35bc2e Eugen Hristev 2021-12-13  146  			rate =3D DIV_ROUND_CLOSEST=
(parent_rate, div);
118bf76a35bc2e Eugen Hristev 2021-12-13  147  			diff =3D abs(req->rate - r=
ate);
118bf76a35bc2e Eugen Hristev 2021-12-13  148  =

118bf76a35bc2e Eugen Hristev 2021-12-13  149  			if (best_diff < 0 || best_=
diff > diff) {
118bf76a35bc2e Eugen Hristev 2021-12-13  150  				best_rate =3D rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  151  				best_diff =3D diff;
118bf76a35bc2e Eugen Hristev 2021-12-13  152  				req->best_parent_rate =3D=
 parent_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  153  				req->best_parent_hw =3D p=
arent;
118bf76a35bc2e Eugen Hristev 2021-12-13  154  			}
118bf76a35bc2e Eugen Hristev 2021-12-13  155  =

118bf76a35bc2e Eugen Hristev 2021-12-13  156  			if (!best_diff || rate < r=
eq->rate)
118bf76a35bc2e Eugen Hristev 2021-12-13  157  				break;
118bf76a35bc2e Eugen Hristev 2021-12-13  158  		}
118bf76a35bc2e Eugen Hristev 2021-12-13  159  =

118bf76a35bc2e Eugen Hristev 2021-12-13  160  		if (!best_diff)
118bf76a35bc2e Eugen Hristev 2021-12-13  161  			break;
118bf76a35bc2e Eugen Hristev 2021-12-13  162  	}
118bf76a35bc2e Eugen Hristev 2021-12-13  163  =

118bf76a35bc2e Eugen Hristev 2021-12-13  164  	dev_dbg(isc_clk->dev,
118bf76a35bc2e Eugen Hristev 2021-12-13  165  		"ISC CLK: %s, best_rate =3D=
 %ld, parent clk: %s @ %ld\n",
118bf76a35bc2e Eugen Hristev 2021-12-13  166  		__func__, best_rate,
118bf76a35bc2e Eugen Hristev 2021-12-13  167  		__clk_get_name((req->best_p=
arent_hw)->clk),
118bf76a35bc2e Eugen Hristev 2021-12-13  168  		req->best_parent_rate);
118bf76a35bc2e Eugen Hristev 2021-12-13  169  =

118bf76a35bc2e Eugen Hristev 2021-12-13  170  	if (best_rate < 0)
118bf76a35bc2e Eugen Hristev 2021-12-13  171  		return best_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  172  =

118bf76a35bc2e Eugen Hristev 2021-12-13  173  	req->rate =3D best_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  174  =

118bf76a35bc2e Eugen Hristev 2021-12-13  175  	return 0;
118bf76a35bc2e Eugen Hristev 2021-12-13  176  }
118bf76a35bc2e Eugen Hristev 2021-12-13  177  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7152515505928870521==--


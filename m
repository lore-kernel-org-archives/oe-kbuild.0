Content-Type: multipart/mixed; boundary="===============6117751164919193981=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stored to 'isc_clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 30 Apr 2022 11:50:07 +0800
Message-ID: <202204301105.B7JN1INB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6117751164919193981==
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
head:   8013d1d3d2e33236dee13a133fba49ad55045e79
commit: 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0 media: atmel: atmel-isc: s=
plit the clock code into separate source file
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220430/202204301105.B7JN1INB-lkp(a)intel.com/config)
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
           if (lpuart_is_32(sport))
           ^
   drivers/tty/serial/fsl_lpuart.c:2876:6: note: Assuming field 'lpuart_dma=
_rx_use' is true
           if (sport->lpuart_dma_rx_use) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2876:2: note: Taking true branch
           if (sport->lpuart_dma_rx_use) {
           ^
   drivers/tty/serial/fsl_lpuart.c:2877:7: note: Assuming 'irq_wake' is true
                   if (irq_wake) {
                       ^~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2877:3: note: Taking true branch
                   if (irq_wake) {
                   ^
   drivers/tty/serial/fsl_lpuart.c:2878:9: note: Calling 'lpuart_start_rx_d=
ma'
                           if (!lpuart_start_rx_dma(sport))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1274:9: note: Assuming the condition is =
false
           bits =3D (termios->c_cflag & CSIZE) =3D=3D CS7 ? 9 : 10;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1274:9: note: '?' condition is false
   drivers/tty/serial/fsl_lpuart.c:1275:6: note: Assuming the condition is =
false
           if (termios->c_cflag & PARENB)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1275:2: note: Taking false branch
           if (termios->c_cflag & PARENB)
           ^
   drivers/tty/serial/fsl_lpuart.c:1283:33: note: The result of the left sh=
ift is undefined because the right operand is negative
           sport->rx_dma_rng_buf_len =3D (1 << (fls(sport->rx_dma_rng_buf_l=
en) - 1));
                                          ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
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
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:479:2: warning: Valu=
e stored to 'cif_id' is never read [clang-analyzer-deadcode.DeadStores]
           cif_id =3D rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:479:2: note: Value s=
tored to 'cif_id' is never read
           cif_id =3D rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:910:24: warning: Val=
ue stored to 'rkisp1' during its initialization is never read [clang-analyz=
er-deadcode.DeadStores]
           struct rkisp1_device *rkisp1 =3D
                                 ^~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:910:24: note: Value =
stored to 'rkisp1' during its initialization is never read
           struct rkisp1_device *rkisp1 =3D
                                 ^~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/media/platform/am437x/am437x-vpfe.c:819:2: warning: Value stored=
 to 'vpfe_int_status' is never read [clang-analyzer-deadcode.DeadStores]
           vpfe_int_status =3D vpfe_reg_read(ccdc, VPFE_IRQ_STS);
           ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/am437x/am437x-vpfe.c:819:2: note: Value stored to=
 'vpfe_int_status' is never read
           vpfe_int_status =3D vpfe_reg_read(ccdc, VPFE_IRQ_STS);
           ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/am437x/am437x-vpfe.c:1411:2: warning: Value store=
d to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/media/platform/am437x/am437x-vpfe.c:1411:2: note: Value stored t=
o 'ret' is never read
           ret =3D 0;
           ^     ~
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
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 with check filters).
   1 warning generated.
   drivers/mmc/core/core.c:1940:19: warning: Value stored to 'host' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mmc_host *host =3D card->host;
                            ^~~~   ~~~~~~~~~~
   drivers/mmc/core/core.c:1940:19: note: Value stored to 'host' during its=
 initialization is never read
           struct mmc_host *host =3D card->host;
                            ^~~~   ~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/iio/addac/ad74413r.c:51:8: warning: Excessive padding in 'struct=
 ad74413r_state' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   adc_samples_buf, =

   num_gpo_gpios, =

   num_comparator_gpios, =

   sense_resistor_ohms, =

   chip_info, =

   spi, =

   refin_reg, =

   regmap, =

   dev, =

   trig, =

   adc_active_channels, =

   adc_data_completion, =

   lock, =

   gpo_gpio_offsets, =

   comp_gpio_offsets, =

   channel_configs, =

   adc_samples_msg, =

   gpo_gpiochip, =

   comp_gpiochip, =

   adc_samples_xfer, =

   reg_tx_buf, =

   reg_rx_buf, =

   adc_samples_tx_buf, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad74413r_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/iio/addac/ad74413r.c:51:8: note: Excessive padding in 'struct ad=
74413r_state' (32 padding bytes, where 0 is optimal). Optimal fields order:=
 adc_samples_buf, num_gpo_gpios, num_comparator_gpios, sense_resistor_ohms,=
 chip_info, spi, refin_reg, regmap, dev, trig, adc_active_channels, adc_dat=
a_completion, lock, gpo_gpio_offsets, comp_gpio_offsets, channel_configs, a=
dc_samples_msg, gpo_gpiochip, comp_gpiochip, adc_samples_xfer, reg_tx_buf, =
reg_rx_buf, adc_samples_tx_buf, consider reordering the fields or adding ex=
plicit padding members
   struct ad74413r_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c:74:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c:74:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   1 warning generated.
   drivers/input/rmi4/rmi_f11.c:1129:2: warning: Value stored to 'query_off=
set' is never read [clang-analyzer-deadcode.DeadStores]
           query_offset +=3D rc;
           ^               ~~
   drivers/input/rmi4/rmi_f11.c:1129:2: note: Value stored to 'query_offset=
' is never read
           query_offset +=3D rc;
           ^               ~~
   3 warnings generated.
   drivers/input/rmi4/rmi_f12.c:133:3: warning: Value stored to 'offset' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:133:3: note: Value stored to 'offset' is ne=
ver read
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:401:2: warning: Value stored to 'query_addr=
' is never read [clang-analyzer-deadcode.DeadStores]
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:401:2: note: Value stored to 'query_addr' i=
s never read
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:520:3: warning: Value stored to 'data_offse=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f12.c:520:3: note: Value stored to 'data_offset' =
is never read
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   4 warnings generated.
   drivers/greybus/svc.c:1144:2: warning: Value stored to 'reset' is never =
read [clang-analyzer-deadcode.DeadStores]
           reset =3D request->payload;
           ^       ~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1144:2: note: Value stored to 'reset' is never read
           reset =3D request->payload;
           ^       ~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1162:2: warning: Value stored to 'request' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1162:2: note: Value stored to 'request' is never r=
ead
           request =3D op->request->payload;

vim +/isc_clk +125 drivers/media/platform/atmel/atmel-isc-clk.c

118bf76a35bc2ed Eugen Hristev 2021-12-13  121  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  122  static int isc_clk_determine=
_rate(struct clk_hw *hw,
118bf76a35bc2ed Eugen Hristev 2021-12-13  123  				  struct clk_rate_reques=
t *req)
118bf76a35bc2ed Eugen Hristev 2021-12-13  124  {
118bf76a35bc2ed Eugen Hristev 2021-12-13 @125  	struct isc_clk *isc_clk =3D=
 to_isc_clk(hw);
118bf76a35bc2ed Eugen Hristev 2021-12-13  126  	long best_rate =3D -EINVAL;
118bf76a35bc2ed Eugen Hristev 2021-12-13  127  	int best_diff =3D -1;
118bf76a35bc2ed Eugen Hristev 2021-12-13  128  	unsigned int i, div;
118bf76a35bc2ed Eugen Hristev 2021-12-13  129  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  130  	for (i =3D 0; i < clk_hw_ge=
t_num_parents(hw); i++) {
118bf76a35bc2ed Eugen Hristev 2021-12-13  131  		struct clk_hw *parent;
118bf76a35bc2ed Eugen Hristev 2021-12-13  132  		unsigned long parent_rate;
118bf76a35bc2ed Eugen Hristev 2021-12-13  133  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  134  		parent =3D clk_hw_get_pare=
nt_by_index(hw, i);
118bf76a35bc2ed Eugen Hristev 2021-12-13  135  		if (!parent)
118bf76a35bc2ed Eugen Hristev 2021-12-13  136  			continue;
118bf76a35bc2ed Eugen Hristev 2021-12-13  137  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  138  		parent_rate =3D clk_hw_get=
_rate(parent);
118bf76a35bc2ed Eugen Hristev 2021-12-13  139  		if (!parent_rate)
118bf76a35bc2ed Eugen Hristev 2021-12-13  140  			continue;
118bf76a35bc2ed Eugen Hristev 2021-12-13  141  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  142  		for (div =3D 1; div < ISC_=
CLK_MAX_DIV + 2; div++) {
118bf76a35bc2ed Eugen Hristev 2021-12-13  143  			unsigned long rate;
118bf76a35bc2ed Eugen Hristev 2021-12-13  144  			int diff;
118bf76a35bc2ed Eugen Hristev 2021-12-13  145  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  146  			rate =3D DIV_ROUND_CLOSES=
T(parent_rate, div);
118bf76a35bc2ed Eugen Hristev 2021-12-13  147  			diff =3D abs(req->rate - =
rate);
118bf76a35bc2ed Eugen Hristev 2021-12-13  148  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  149  			if (best_diff < 0 || best=
_diff > diff) {
118bf76a35bc2ed Eugen Hristev 2021-12-13  150  				best_rate =3D rate;
118bf76a35bc2ed Eugen Hristev 2021-12-13  151  				best_diff =3D diff;
118bf76a35bc2ed Eugen Hristev 2021-12-13  152  				req->best_parent_rate =
=3D parent_rate;
118bf76a35bc2ed Eugen Hristev 2021-12-13  153  				req->best_parent_hw =3D =
parent;
118bf76a35bc2ed Eugen Hristev 2021-12-13  154  			}
118bf76a35bc2ed Eugen Hristev 2021-12-13  155  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  156  			if (!best_diff || rate < =
req->rate)
118bf76a35bc2ed Eugen Hristev 2021-12-13  157  				break;
118bf76a35bc2ed Eugen Hristev 2021-12-13  158  		}
118bf76a35bc2ed Eugen Hristev 2021-12-13  159  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  160  		if (!best_diff)
118bf76a35bc2ed Eugen Hristev 2021-12-13  161  			break;
118bf76a35bc2ed Eugen Hristev 2021-12-13  162  	}
118bf76a35bc2ed Eugen Hristev 2021-12-13  163  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  164  	dev_dbg(isc_clk->dev,
118bf76a35bc2ed Eugen Hristev 2021-12-13  165  		"ISC CLK: %s, best_rate =
=3D %ld, parent clk: %s @ %ld\n",
118bf76a35bc2ed Eugen Hristev 2021-12-13  166  		__func__, best_rate,
118bf76a35bc2ed Eugen Hristev 2021-12-13  167  		__clk_get_name((req->best_=
parent_hw)->clk),
118bf76a35bc2ed Eugen Hristev 2021-12-13  168  		req->best_parent_rate);
118bf76a35bc2ed Eugen Hristev 2021-12-13  169  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  170  	if (best_rate < 0)
118bf76a35bc2ed Eugen Hristev 2021-12-13  171  		return best_rate;
118bf76a35bc2ed Eugen Hristev 2021-12-13  172  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  173  	req->rate =3D best_rate;
118bf76a35bc2ed Eugen Hristev 2021-12-13  174  =

118bf76a35bc2ed Eugen Hristev 2021-12-13  175  	return 0;
118bf76a35bc2ed Eugen Hristev 2021-12-13  176  }
118bf76a35bc2ed Eugen Hristev 2021-12-13  177  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6117751164919193981==--


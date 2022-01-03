Content-Type: multipart/mixed; boundary="===============1405737715213232055=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/atmel/atmel-isc-base.c:214:18: warning: Value stored to 'isc_clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 03 Jan 2022 14:30:57 +0800
Message-ID: <202201031438.EFFHHzn4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1405737715213232055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eugen Hristev <eugen.hristev@microchip.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: c9aa973884a163ecb6d5d4d3be9137058adcaf8c media: atmel: atmel-isc: a=
dd microchip-xisc driver
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20211227 (https://download.01.org/0day-ci/arc=
hive/20220103/202201031438.EFFHHzn4-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726=
c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc9aa973884a163ecb6d5d4d3be9137058adcaf8c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c9aa973884a163ecb6d5d4d3be9137058adcaf8c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/extcon/extcon-fsa9480.c:207:3: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
                   u64 cables =3D cable_types[dev];
                   ^
   drivers/extcon/extcon-fsa9480.c:266:6: note: Assuming field 'irq' is not=
 equal to 0
           if (!client->irq) {
               ^~~~~~~~~~~~
   drivers/extcon/extcon-fsa9480.c:266:2: note: Taking false branch
           if (!client->irq) {
           ^
   drivers/extcon/extcon-fsa9480.c:272:6: note: Assuming 'info' is non-null
           if (!info)
               ^~~~~
   drivers/extcon/extcon-fsa9480.c:272:2: note: Taking false branch
           if (!info)
           ^
   drivers/extcon/extcon-fsa9480.c:281:2: note: Taking false branch
           if (IS_ERR(info->edev)) {
           ^
   drivers/extcon/extcon-fsa9480.c:288:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/extcon/extcon-fsa9480.c:288:2: note: Taking false branch
           if (ret) {
           ^
   drivers/extcon/extcon-fsa9480.c:294:2: note: Taking false branch
           if (IS_ERR(info->regmap)) {
           ^
   drivers/extcon/extcon-fsa9480.c:316:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/extcon/extcon-fsa9480.c:316:2: note: Taking false branch
           if (ret) {
           ^
   drivers/extcon/extcon-fsa9480.c:322:2: note: Calling 'fsa9480_detect_dev'
           fsa9480_detect_dev(info);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:6: note: Assuming 'val1' is >=3D 0
           if (val1 < 0 || val2 < 0) {
               ^~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:6: note: Left side of '||' is false
   drivers/extcon/extcon-fsa9480.c:227:18: note: Assuming 'val2' is >=3D 0
           if (val1 < 0 || val2 < 0) {
                           ^~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:2: note: Taking false branch
           if (val1 < 0 || val2 < 0) {
           ^
   drivers/extcon/extcon-fsa9480.c:236:2: note: Calling 'fsa9480_handle_cha=
nge'
           fsa9480_handle_change(usbsw, usbsw->cable & ~val, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-fsa9480.c:205:2: note: Loop condition is true.  En=
tering loop body
           while (mask) {
           ^
   drivers/extcon/extcon-fsa9480.c:206:3: note: 'dev' initialized to 63
                   int dev =3D fls64(mask) - 1;
                   ^~~~~~~
   drivers/extcon/extcon-fsa9480.c:207:3: note: Assigned value is garbage o=
r undefined
                   u64 cables =3D cable_types[dev];
                   ^            ~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/media/platform/xilinx/xilinx-csi2rxss.c:580:4: warning: Value st=
ored to 'spkt' is never read [clang-analyzer-deadcode.DeadStores]
                           spkt =3D xcsi2rxss_read(state, XCSI_SPKTR_OFFSET=
);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-csi2rxss.c:580:4: note: Value store=
d to 'spkt' is never read
                           spkt =3D xcsi2rxss_read(state, XCSI_SPKTR_OFFSET=
);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/media/platform/atmel/atmel-isc-base.c:214:18: warning: Value sto=
red to 'isc_clk' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   drivers/media/platform/atmel/atmel-isc-base.c:214:18: note: Value stored=
 to 'isc_clk' during its initialization is never read
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/iio/potentiometer/mcp41010.c:58:8: warning: Excessive padding in=
 'struct mcp41010_data' (70 padding bytes, where 6 is optimal). =

   Optimal fields order: =

   buf, =

   value, =

   spi, =

   cfg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct mcp41010_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/potentiometer/mcp41010.c:58:8: note: Excessive padding in 's=
truct mcp41010_data' (70 padding bytes, where 6 is optimal). Optimal fields=
 order: buf, value, spi, cfg, lock, consider reordering the fields or addin=
g explicit padding members
   struct mcp41010_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/iio/pressure/dps310.c:236:20: warning: The result of the left sh=
ift is undefined because the left operand is negative [clang-analyzer-core.=
UndefinedBinaryOperatorResult]
           val =3D ilog2(freq) << 4;
                             ^
   drivers/iio/pressure/dps310.c:420:6: note: Assuming the condition is fal=
se
           if (mutex_lock_interruptible(&data->lock))
               ^
   include/linux/mutex.h:166:40: note: expanded from macro 'mutex_lock_inte=
rruptible'
   #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(l=
ock, 0)
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/pressure/dps310.c:420:2: note: Taking false branch
           if (mutex_lock_interruptible(&data->lock))
           ^
   drivers/iio/pressure/dps310.c:423:2: note: Control jumps to 'case IIO_CH=
AN_INFO_SAMP_FREQ:'  at line 424
           switch (mask) {
           ^
   drivers/iio/pressure/dps310.c:425:3: note: Control jumps to 'case IIO_PR=
ESSURE:'  at line 426
                   switch (chan->type) {
                   ^
   drivers/iio/pressure/dps310.c:427:9: note: Calling 'dps310_set_pres_samp=
_freq'
                           rc =3D dps310_set_pres_samp_freq(data, val);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/dps310.c:233:6: note: Assuming 'freq' is >=3D 0
           if (freq < 0 || freq > 128)
               ^~~~~~~~
   drivers/iio/pressure/dps310.c:233:6: note: Left side of '||' is false
   drivers/iio/pressure/dps310.c:233:18: note: Assuming 'freq' is <=3D 128
           if (freq < 0 || freq > 128)
                           ^~~~~~~~~~
   drivers/iio/pressure/dps310.c:233:2: note: Taking false branch
           if (freq < 0 || freq > 128)
           ^
   drivers/iio/pressure/dps310.c:236:8: note: '?' condition is false
           val =3D ilog2(freq) << 4;
                 ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/iio/pressure/dps310.c:236:8: note: '?' condition is true
           val =3D ilog2(freq) << 4;
                 ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/iio/pressure/dps310.c:236:8: note: Calling '__ilog2_u32'
           val =3D ilog2(freq) << 4;
                 ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~

vim +/isc_clk +214 drivers/media/platform/atmel/atmel-isc-base.c

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  210  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  211  static int isc_clk_determine_rate(struct clk_hw *hw,
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  212  				   struct clk_rate_request *req)
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  213  {
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17 @214  	struct isc_clk *isc_clk =3D to_isc_clk(hw);
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  215  	long best_rate =3D -EINVAL;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  216  	int best_diff =3D -1;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  217  	unsigned int i, div;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  218  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  219  	for (i =3D 0; i < clk_hw_get_num_parents(hw); i++) {
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  220  		struct clk_hw *parent;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  221  		unsigned long parent_rate;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  222  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  223  		parent =3D clk_hw_get_parent_by_index(hw, i);
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  224  		if (!parent)
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  225  			continue;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  226  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  227  		parent_rate =3D clk_hw_get_rate(parent);
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  228  		if (!parent_rate)
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  229  			continue;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  230  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  231  		for (div =3D 1; div < ISC_CLK_MAX_DIV + 2; div++) {
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  232  			unsigned long rate;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  233  			int diff;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  234  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  235  			rate =3D DIV_ROUND_CLOSEST(parent_rate, div);
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  236  			diff =3D abs(req->rate - rate);
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  237  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  238  			if (best_diff < 0 || best_diff > diff) {
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  239  				best_rate =3D rate;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  240  				best_diff =3D diff;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  241  				req->best_parent_rate =3D parent_rate;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  242  				req->best_parent_hw =3D parent;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  243  			}
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  244  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  245  			if (!best_diff || rate < req->rate)
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  246  				break;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  247  		}
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  248  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  249  		if (!best_diff)
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  250  			break;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  251  	}
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  252  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  253  	dev_dbg(isc_clk->dev,
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  254  		"ISC CLK: %s, best_rate =3D %ld, parent clk: %s @ %ld\n",
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  255  		__func__, best_rate,
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  256  		__clk_get_name((req->best_parent_hw)->clk),
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  257  		req->best_parent_rate);
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  258  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  259  	if (best_rate < 0)
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  260  		return best_rate;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  261  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  262  	req->rate =3D best_rate;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  263  =

106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  264  	return 0;
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  265  }
106267444f12fd drivers/media/platform/atmel/atmel-isc.c Songjun Wu 2016-08-=
17  266  =


:::::: The code at line 214 was first introduced by commit
:::::: 106267444f12fde77f5aee92ca862a7138a88508 [media] atmel-isc: add the =
Image Sensor Controller code

:::::: TO: Songjun Wu <songjun.wu@microchip.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1405737715213232055==--


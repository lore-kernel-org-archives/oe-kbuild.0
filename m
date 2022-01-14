Content-Type: multipart/mixed; boundary="===============8377327780473371824=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media-tree:for-v5.18b 76/92] drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stored to 'isc_clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 14 Jan 2022 22:59:36 +0800
Message-ID: <202201142235.W57LFwcX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8377327780473371824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eugen Hristev <eugen.hristev@microchip.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v5.18b
head:   3ea6bb332746a4cf91c93695855447ba996d99fc
commit: a3f86357d1892ac46d799cba03fdf9020e5000d7 [76/92] media: atmel: atme=
l-isc: split the clock code into separate source file
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20220111 (https://download.01.org/0day-ci/arc=
hive/20220114/202201142235.W57LFwcX-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media=
_tree.git
        git fetch --no-tags hverkuil-media-tree for-v5.18b
        git checkout a3f86357d1892ac46d799cba03fdf9020e5000d7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/input/rmi4/rmi_f11.c:1129:2: warning: Value stored to 'query_off=
set' is never read [clang-analyzer-deadcode.DeadStores]
           query_offset +=3D rc;
           ^               ~~
   drivers/input/rmi4/rmi_f11.c:1129:2: note: Value stored to 'query_offset=
' is never read
           query_offset +=3D rc;
           ^               ~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/i2c/mt9v111.c:492:13: warning: Although the value stored t=
o 'vb' is used in the enclosing expression, the value is never actually rea=
d from 'vb' [clang-analyzer-deadcode.DeadStores]
           best_fps =3D vb =3D hb =3D 0;
                      ^    ~~~~~~
   drivers/media/i2c/mt9v111.c:492:13: note: Although the value stored to '=
vb' is used in the enclosing expression, the value is never actually read f=
rom 'vb'
           best_fps =3D vb =3D hb =3D 0;
                      ^    ~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/input/keyboard/lm8323.c:333:3: warning: Value stored to 'active'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   active =3D debounce + 3;
                   ^        ~~~~~~~~~~~~
   drivers/input/keyboard/lm8323.c:333:3: note: Value stored to 'active' is=
 never read
                   active =3D debounce + 3;
                   ^        ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stor=
ed to 'isc_clk' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   drivers/media/platform/atmel/atmel-isc-clk.c:125:18: note: Value stored =
to 'isc_clk' during its initialization is never read
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/adc/ingenic-adc.c:658:3: warning: 3rd function call argument=
 is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   ingenic_adc_set_config(adc, JZ_ADC_REG_CFG_AUX_MD, cmd);
                   ^
   drivers/iio/adc/ingenic-adc.c:692:2: note: Control jumps to 'case IIO_CH=
AN_INFO_RAW:'  at line 693
           switch (m) {
           ^
   drivers/iio/adc/ingenic-adc.c:694:10: note: Calling 'ingenic_adc_read_ch=
an_info_raw'
                   return ingenic_adc_read_chan_info_raw(iio_dev, chan, val=
);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ingenic-adc.c:633:6: note: 'cmd' declared without an ini=
tial value
           int cmd, ret, engine =3D (chan->channel =3D=3D INGENIC_ADC_BATTE=
RY);
               ^~~
   drivers/iio/adc/ingenic-adc.c:633:26: note: Assuming field 'channel' is =
not equal to INGENIC_ADC_BATTERY
           int cmd, ret, engine =3D (chan->channel =3D=3D INGENIC_ADC_BATTE=
RY);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ingenic-adc.c:637:2: note: Assuming 'ret' is 0
           if (ret) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/iio/adc/ingenic-adc.c:637:2: note: '?' condition is false
           if (ret) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/iio/adc/ingenic-adc.c:637:6: note: 'ret' is 0
           if (ret) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/iio/adc/ingenic-adc.c:637:2: note: '?' condition is false
           if (ret) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/iio/adc/ingenic-adc.c:637:2: note: Taking false branch
           if (ret) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/iio/adc/ingenic-adc.c:645:6: note: Assuming field 'has_aux_md' i=
s not equal to 0
           if (adc->soc_data->has_aux_md && engine =3D=3D 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/iio/adc/ingenic-adc.c:645:6: note: Left side of '&&' is true
           if (adc->soc_data->has_aux_md && engine =3D=3D 0) {

vim +/isc_clk +125 drivers/media/platform/atmel/atmel-isc-clk.c

a3f86357d1892a Eugen Hristev 2021-12-13  121  =

a3f86357d1892a Eugen Hristev 2021-12-13  122  static int isc_clk_determine_=
rate(struct clk_hw *hw,
a3f86357d1892a Eugen Hristev 2021-12-13  123  				  struct clk_rate_request=
 *req)
a3f86357d1892a Eugen Hristev 2021-12-13  124  {
a3f86357d1892a Eugen Hristev 2021-12-13 @125  	struct isc_clk *isc_clk =3D =
to_isc_clk(hw);
a3f86357d1892a Eugen Hristev 2021-12-13  126  	long best_rate =3D -EINVAL;
a3f86357d1892a Eugen Hristev 2021-12-13  127  	int best_diff =3D -1;
a3f86357d1892a Eugen Hristev 2021-12-13  128  	unsigned int i, div;
a3f86357d1892a Eugen Hristev 2021-12-13  129  =

a3f86357d1892a Eugen Hristev 2021-12-13  130  	for (i =3D 0; i < clk_hw_get=
_num_parents(hw); i++) {
a3f86357d1892a Eugen Hristev 2021-12-13  131  		struct clk_hw *parent;
a3f86357d1892a Eugen Hristev 2021-12-13  132  		unsigned long parent_rate;
a3f86357d1892a Eugen Hristev 2021-12-13  133  =

a3f86357d1892a Eugen Hristev 2021-12-13  134  		parent =3D clk_hw_get_paren=
t_by_index(hw, i);
a3f86357d1892a Eugen Hristev 2021-12-13  135  		if (!parent)
a3f86357d1892a Eugen Hristev 2021-12-13  136  			continue;
a3f86357d1892a Eugen Hristev 2021-12-13  137  =

a3f86357d1892a Eugen Hristev 2021-12-13  138  		parent_rate =3D clk_hw_get_=
rate(parent);
a3f86357d1892a Eugen Hristev 2021-12-13  139  		if (!parent_rate)
a3f86357d1892a Eugen Hristev 2021-12-13  140  			continue;
a3f86357d1892a Eugen Hristev 2021-12-13  141  =

a3f86357d1892a Eugen Hristev 2021-12-13  142  		for (div =3D 1; div < ISC_C=
LK_MAX_DIV + 2; div++) {
a3f86357d1892a Eugen Hristev 2021-12-13  143  			unsigned long rate;
a3f86357d1892a Eugen Hristev 2021-12-13  144  			int diff;
a3f86357d1892a Eugen Hristev 2021-12-13  145  =

a3f86357d1892a Eugen Hristev 2021-12-13  146  			rate =3D DIV_ROUND_CLOSEST=
(parent_rate, div);
a3f86357d1892a Eugen Hristev 2021-12-13  147  			diff =3D abs(req->rate - r=
ate);
a3f86357d1892a Eugen Hristev 2021-12-13  148  =

a3f86357d1892a Eugen Hristev 2021-12-13  149  			if (best_diff < 0 || best_=
diff > diff) {
a3f86357d1892a Eugen Hristev 2021-12-13  150  				best_rate =3D rate;
a3f86357d1892a Eugen Hristev 2021-12-13  151  				best_diff =3D diff;
a3f86357d1892a Eugen Hristev 2021-12-13  152  				req->best_parent_rate =3D=
 parent_rate;
a3f86357d1892a Eugen Hristev 2021-12-13  153  				req->best_parent_hw =3D p=
arent;
a3f86357d1892a Eugen Hristev 2021-12-13  154  			}
a3f86357d1892a Eugen Hristev 2021-12-13  155  =

a3f86357d1892a Eugen Hristev 2021-12-13  156  			if (!best_diff || rate < r=
eq->rate)
a3f86357d1892a Eugen Hristev 2021-12-13  157  				break;
a3f86357d1892a Eugen Hristev 2021-12-13  158  		}
a3f86357d1892a Eugen Hristev 2021-12-13  159  =

a3f86357d1892a Eugen Hristev 2021-12-13  160  		if (!best_diff)
a3f86357d1892a Eugen Hristev 2021-12-13  161  			break;
a3f86357d1892a Eugen Hristev 2021-12-13  162  	}
a3f86357d1892a Eugen Hristev 2021-12-13  163  =

a3f86357d1892a Eugen Hristev 2021-12-13  164  	dev_dbg(isc_clk->dev,
a3f86357d1892a Eugen Hristev 2021-12-13  165  		"ISC CLK: %s, best_rate =3D=
 %ld, parent clk: %s @ %ld\n",
a3f86357d1892a Eugen Hristev 2021-12-13  166  		__func__, best_rate,
a3f86357d1892a Eugen Hristev 2021-12-13  167  		__clk_get_name((req->best_p=
arent_hw)->clk),
a3f86357d1892a Eugen Hristev 2021-12-13  168  		req->best_parent_rate);
a3f86357d1892a Eugen Hristev 2021-12-13  169  =

a3f86357d1892a Eugen Hristev 2021-12-13  170  	if (best_rate < 0)
a3f86357d1892a Eugen Hristev 2021-12-13  171  		return best_rate;
a3f86357d1892a Eugen Hristev 2021-12-13  172  =

a3f86357d1892a Eugen Hristev 2021-12-13  173  	req->rate =3D best_rate;
a3f86357d1892a Eugen Hristev 2021-12-13  174  =

a3f86357d1892a Eugen Hristev 2021-12-13  175  	return 0;
a3f86357d1892a Eugen Hristev 2021-12-13  176  }
a3f86357d1892a Eugen Hristev 2021-12-13  177  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8377327780473371824==--


Content-Type: multipart/mixed; boundary="===============4384991060443928617=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/xilinx-ams.c:1324:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 28 Jan 2022 20:30:19 +0800
Message-ID: <202201282049.dQhZXwBH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4384991060443928617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Manish Narani <manish.narani@xilinx.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23a46422c56144939c091c76cf389aa863ce9c18
commit: d5c70627a79455154f5f636096abe6fe57510605 iio: adc: Add Xilinx AMS d=
river
date:   5 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220126 (https://download.01.org/0day-ci/arc=
hive/20220128/202201282049.dQhZXwBH-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7a=
a016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd5c70627a79455154f5f636096abe6fe57510605
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d5c70627a79455154f5f636096abe6fe57510605
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   lib/vsprintf.c:1360:9: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
                           *p++ =3D temp[digits];
                                ^
   lib/vsprintf.c:3071:2: note: Loop condition is true.  Entering loop body
           while (*fmt) {
           ^
   lib/vsprintf.c:3076:3: note: Control jumps to 'case FORMAT_TYPE_PTR:'  a=
t line 3111
                   switch (spec.type) {
                   ^
   lib/vsprintf.c:3113:4: note: Control jumps to the 'default' case at line=
 3122
                           switch (*fmt) {
                           ^
   lib/vsprintf.c:3123:9: note: Assuming the condition is false
                                   if (!isalnum(*fmt)) {
                                       ^~~~~~~~~~~~~~
   lib/vsprintf.c:3123:5: note: Taking false branch
                                   if (!isalnum(*fmt)) {
                                   ^
   lib/vsprintf.c:3127:11: note: Calling 'pointer'
                                   str =3D pointer(fmt, str, end, va_arg(ar=
gs, void *),
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   lib/vsprintf.c:2396:2: note: Control jumps to 'case 105:'  at line 2425
           switch (*fmt) {
           ^
   lib/vsprintf.c:2429:10: note: Calling 'ip_addr_string'
                   return ip_addr_string(buf, end, ptr, spec, fmt);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1597:2: note: Taking false branch
           if (check_pointer(&buf, end, ptr, spec))
           ^
   lib/vsprintf.c:1600:2: note: Control jumps to 'case 52:'  at line 1603
           switch (fmt[1]) {
           ^
   lib/vsprintf.c:1604:10: note: Calling 'ip4_addr_string'
                   return ip4_addr_string(buf, end, ptr, spec, fmt);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1489:2: note: Calling 'ip4_string'
           ip4_string(ip4_addr, addr, fmt);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1328:2: note: Control jumps to the 'default' case at line=
 1344
           switch (fmt[2]) {
           ^
   lib/vsprintf.c:1347:3: note:  Execution continues on line 1349
                   break;
                   ^
   lib/vsprintf.c:1349:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < 4; i++) {
           ^
   lib/vsprintf.c:1351:16: note: Calling 'put_dec_trunc8'
                   int digits =3D put_dec_trunc8(temp, addr[index]) - temp;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:219:6: note: Assuming 'r' is < 100
           if (r < 100)
               ^~~~~~~
   lib/vsprintf.c:219:2: note: Taking true branch
           if (r < 100)
           ^
   lib/vsprintf.c:220:3: note: Control jumps to line 249
                   goto out_r;
                   ^
   lib/vsprintf.c:250:9: note: Assuming 'r' is >=3D 10
           buf +=3D r < 10 ? 1 : 2;
                  ^~~~~~
   lib/vsprintf.c:250:9: note: '?' condition is false
   lib/vsprintf.c:1351:16: note: Returning from 'put_dec_trunc8'
                   int digits =3D put_dec_trunc8(temp, addr[index]) - temp;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1352:7: note: Assuming 'leading_zeros' is false
                   if (leading_zeros) {
                       ^~~~~~~~~~~~~
   lib/vsprintf.c:1352:3: note: Taking false branch
                   if (leading_zeros) {
                   ^
   lib/vsprintf.c:1359:10: note: The value 1 is assigned to 'digits'
                   while (digits--)
                          ^~~~~~~~
   lib/vsprintf.c:1359:3: note: Loop condition is true.  Entering loop body
                   while (digits--)
                   ^
   lib/vsprintf.c:1360:9: note: Assigned value is garbage or undefined
                           *p++ =3D temp[digits];
                                ^ ~~~~~~~~~~~~
   lib/vsprintf.c:1423:4: warning: Value stored to 'needcolon' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1423:4: note: Value stored to 'needcolon' is never read
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1791:2: warning: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
           ^~~~~~
   lib/vsprintf.c:1791:2: note: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119
           strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
           ^~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/iio/adc/xilinx-ams.c:1324:3: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   drivers/iio/adc/xilinx-ams.c:1324:3: note: Value stored to 'ret' is neve=
r read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/iio/amplifiers/ad8366.c:39:8: warning: Excessive padding in 'str=
uct ad8366_state' (76 padding bytes, where 12 is optimal). =

   Optimal fields order: =

   data, =

   ch, =

   spi, =

   reg, =

   reset_gpio, =

   type, =

   info, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad8366_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/amplifiers/ad8366.c:39:8: note: Excessive padding in 'struct=
 ad8366_state' (76 padding bytes, where 12 is optimal). Optimal fields orde=
r: data, ch, spi, reg, reset_gpio, type, info, lock, consider reordering th=
e fields or adding explicit padding members
   struct ad8366_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/iio/adc/ti-ads7950.c:444:2: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           ret =3D ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads7950.c:444:2: note: Value stored to 'ret' is never=
 read
           ret =3D ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/iio/adc/ti-ads8344.c:22:8: warning: Excessive padding in 'struct=
 ads8344' (88 padding bytes, where 24 is optimal). =

   Optimal fields order: =

   tx_buf, =

   rx_buf, =

   spi, =

   reg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ads8344 {
   ~~~~~~~^~~~~~~~~
   drivers/iio/adc/ti-ads8344.c:22:8: note: Excessive padding in 'struct ad=
s8344' (88 padding bytes, where 24 is optimal). Optimal fields order: tx_bu=
f, rx_buf, spi, reg, lock, consider reordering the fields or adding explici=
t padding members
   struct ads8344 {
   ~~~~~~~^~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/iio/adc/ti-ads8688.c:64:8: warning: Excessive padding in 'struct=
 ads8688_state' (108 padding bytes, where 44 is optimal). =

   Optimal fields order: =

   data, =

   chip_info, =

   spi, =

   reg, =

   vref_mv, =

   range, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ads8688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads8688.c:64:8: note: Excessive padding in 'struct ad=
s8688_state' (108 padding bytes, where 44 is optimal). Optimal fields order=
: data, chip_info, spi, reg, vref_mv, range, lock, consider reordering the =
fields or adding explicit padding members
   struct ads8688_state {
   ~~~~~~~^~~~~~~~~~~~~~~

vim +/ret +1324 drivers/iio/adc/xilinx-ams.c

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1253  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1254  static int ams_parse_fi=
rmware(struct iio_dev *indio_dev)
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1255  {
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1256  	struct ams *ams =3D ii=
o_priv(indio_dev);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1257  	struct iio_chan_spec *=
ams_channels, *dev_channels;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1258  	struct device *dev =3D=
 indio_dev->dev.parent;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1259  	struct fwnode_handle *=
child =3D NULL;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1260  	struct fwnode_handle *=
fwnode =3D dev_fwnode(dev);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1261  	size_t ams_size, dev_s=
ize;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1262  	int ret, ch_cnt =3D 0,=
 i, rising_off, falling_off;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1263  	unsigned int num_chann=
els =3D 0;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1264  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1265  	ams_size =3D ARRAY_SIZ=
E(ams_ps_channels) + ARRAY_SIZE(ams_pl_channels) +
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1266  		ARRAY_SIZE(ams_ctrl_c=
hannels);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1267  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1268  	/* Initialize buffer f=
or channel specification */
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1269  	ams_channels =3D devm_=
kcalloc(dev, ams_size, sizeof(*ams_channels), GFP_KERNEL);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1270  	if (!ams_channels)
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1271  		return -ENOMEM;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1272  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1273  	if (fwnode_device_is_a=
vailable(fwnode)) {
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1274  		ret =3D ams_init_modu=
le(indio_dev, fwnode, ams_channels);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1275  		if (ret < 0)
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1276  			return ret;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1277  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1278  		num_channels +=3D ret;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1279  	}
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1280  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1281  	fwnode_for_each_child_=
node(fwnode, child) {
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1282  		if (fwnode_device_is_=
available(child)) {
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1283  			ret =3D ams_init_mod=
ule(indio_dev, child, ams_channels + num_channels);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1284  			if (ret < 0) {
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1285  				fwnode_handle_put(c=
hild);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1286  				return ret;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1287  			}
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1288  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1289  			num_channels +=3D re=
t;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1290  		}
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1291  	}
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1292  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1293  	for (i =3D 0; i < num_=
channels; i++) {
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1294  		ams_channels[i].chann=
el =3D ch_cnt++;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1295  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1296  		if (ams_channels[i].s=
can_index < AMS_CTRL_SEQ_BASE) {
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1297  			/* set threshold to =
max and min for each channel */
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1298  			falling_off =3D
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1299  				ams_get_alarm_offse=
t(ams_channels[i].scan_index,
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1300  						     IIO_EV_DIR_F=
ALLING);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1301  			rising_off =3D
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1302  				ams_get_alarm_offse=
t(ams_channels[i].scan_index,
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1303  						     IIO_EV_DIR_R=
ISING);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1304  			if (ams_channels[i].=
scan_index >=3D AMS_PS_SEQ_MAX) {
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1305  				writel(AMS_ALARM_TH=
R_MIN,
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1306  				       ams->pl_base=
 + falling_off);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1307  				writel(AMS_ALARM_TH=
R_MAX,
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1308  				       ams->pl_base=
 + rising_off);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1309  			} else {
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1310  				writel(AMS_ALARM_TH=
R_MIN,
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1311  				       ams->ps_base=
 + falling_off);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1312  				writel(AMS_ALARM_TH=
R_MAX,
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1313  				       ams->ps_base=
 + rising_off);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1314  			}
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1315  		}
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1316  	}
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1317  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1318  	dev_size =3D array_siz=
e(sizeof(*dev_channels), num_channels);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1319  	if (dev_size =3D=3D SI=
ZE_MAX)
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1320  		return -ENOMEM;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1321  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1322  	dev_channels =3D devm_=
krealloc(dev, ams_channels, dev_size, GFP_KERNEL);
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1323  	if (!dev_channels)
d5c70627a79455 Anand Ashok Dumbre 2021-12-03 @1324  		ret =3D -ENOMEM;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1325  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1326  	indio_dev->channels =
=3D dev_channels;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1327  	indio_dev->num_channel=
s =3D num_channels;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1328  =

d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1329  	return 0;
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1330  }
d5c70627a79455 Anand Ashok Dumbre 2021-12-03  1331  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4384991060443928617==--


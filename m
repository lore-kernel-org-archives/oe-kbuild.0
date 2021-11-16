Content-Type: multipart/mixed; boundary="===============4464493512038805265=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/cirrus/cs_dsp.c:1211:2: warning: Value stored to 'adsp1_sizes' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 16 Nov 2021 09:14:02 +0800
Message-ID: <202111160958.9CizEfqT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4464493512038805265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Simon Trimmer <simont@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ab774587903771821b59471cc723bba6d893942
commit: f6bc909e7673c30abcbdb329e7d0aa2e83c103d7 firmware: cs_dsp: add driv=
er to support firmware loading on Cirrus Logic DSPs
date:   7 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-c006-20211101 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82ed10=
6567063ea269c6d5669278b733e173a42f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df6bc909e7673c30abcbdb329e7d0aa2e83c103d7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f6bc909e7673c30abcbdb329e7d0aa2e83c103d7
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           const struct usb_device_descriptor *udesc =3D &(hid_to_usb_dev(h=
id)->descriptor);
                                                         ^
   drivers/hid/usbhid/usbhid.h:94:2: note: expanded from macro 'hid_to_usb_=
dev'
           to_usb_device(hid_dev->dev.parent->parent)
           ^
   include/linux/usb.h:708:26: note: expanded from macro 'to_usb_device'
   #define to_usb_device(d) container_of(d, struct usb_device, dev)
                            ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hid/hid-logitech-hidpp.c:2548:48: note: Taking false branch
           const struct usb_device_descriptor *udesc =3D &(hid_to_usb_dev(h=
id)->descriptor);
                                                         ^
   drivers/hid/usbhid/usbhid.h:94:2: note: expanded from macro 'hid_to_usb_=
dev'
           to_usb_device(hid_dev->dev.parent->parent)
           ^
   include/linux/usb.h:708:26: note: expanded from macro 'to_usb_device'
   #define to_usb_device(d) container_of(d, struct usb_device, dev)
                            ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hid/hid-logitech-hidpp.c:2548:48: note: Loop condition is false.=
  Exiting loop
           const struct usb_device_descriptor *udesc =3D &(hid_to_usb_dev(h=
id)->descriptor);
                                                         ^
   drivers/hid/usbhid/usbhid.h:94:2: note: expanded from macro 'hid_to_usb_=
dev'
           to_usb_device(hid_dev->dev.parent->parent)
           ^
   include/linux/usb.h:708:26: note: expanded from macro 'to_usb_device'
   #define to_usb_device(d) container_of(d, struct usb_device, dev)
                            ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hid/hid-logitech-hidpp.c:2551:16: note: Assigned value is garbag=
e or undefined
           int error, j, num_slots =3D data->num_effects;
                         ^           ~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/leds/flash/leds-lm3601x.c:226:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(led->regmap, LM3601X_CFG_REG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:226:3: note: Value stored to 'ret' is =
never read
                   ret =3D regmap_update_bits(led->regmap, LM3601X_CFG_REG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:230:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:230:3: note: Value stored to 'ret' is =
never read
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:234:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:234:3: note: Value stored to 'ret' is =
never read
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/firmware/broadcom/tee_bnxt_fw.c:146:3: warning: Value stored to =
'nbytes' is never read [clang-analyzer-deadcode.DeadStores]
                   nbytes =3D rbytes;
                   ^        ~~~~~~
   drivers/firmware/broadcom/tee_bnxt_fw.c:146:3: note: Value stored to 'nb=
ytes' is never read
                   nbytes =3D rbytes;
                   ^        ~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/firmware/cirrus/cs_dsp.c:1211:2: warning: Value stored to 'adsp1=
_sizes' is never read [clang-analyzer-deadcode.DeadStores]
           adsp1_sizes =3D (void *)&firmware->data[pos];
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:1211:2: note: Value stored to 'adsp1_si=
zes' is never read
           adsp1_sizes =3D (void *)&firmware->data[pos];
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/cirrus/cs_dsp.c:1227:2: warning: Value stored to 'adsp2=
_sizes' is never read [clang-analyzer-deadcode.DeadStores]
           adsp2_sizes =3D (void *)&firmware->data[pos];
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:1227:2: note: Value stored to 'adsp2_si=
zes' is never read
           adsp2_sizes =3D (void *)&firmware->data[pos];
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/cirrus/cs_dsp.c:1312:2: warning: Value stored to 'foote=
r' is never read [clang-analyzer-deadcode.DeadStores]
           footer =3D (void *)&firmware->data[pos];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:1312:2: note: Value stored to 'footer' =
is never read
           footer =3D (void *)&firmware->data[pos];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/firmware/cirrus/cs_dsp.c:2759:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&dsp->ctl_list)) {
           ^
   drivers/firmware/cirrus/cs_dsp.c:2760:9: note: Left side of '&&' is false
                   ctl =3D list_first_entry(&dsp->ctl_list, struct cs_dsp_c=
oeff_ctl, list);
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/firmware/cirrus/cs_dsp.c:2760:9: note: Taking false branch
                   ctl =3D list_first_entry(&dsp->ctl_list, struct cs_dsp_c=
oeff_ctl, list);
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/firmware/cirrus/cs_dsp.c:2760:9: note: Loop condition is false. =
 Exiting loop
                   ctl =3D list_first_entry(&dsp->ctl_list, struct cs_dsp_c=
oeff_ctl, list);
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/firmware/cirrus/cs_dsp.c:2762:7: note: Assuming field 'control_r=
emove' is null
                   if (dsp->client_ops->control_remove)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:2762:3: note: Taking false branch
                   if (dsp->client_ops->control_remove)
                   ^
   drivers/firmware/cirrus/cs_dsp.c:2766:3: note: Calling 'cs_dsp_free_ctl_=
blk'
                   cs_dsp_free_ctl_blk(ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:907:2: note: Memory is released
           kfree(ctl);
           ^~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:2766:3: note: Returning; memory was rel=
eased
                   cs_dsp_free_ctl_blk(ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:2759:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&dsp->ctl_list)) {
           ^
   drivers/firmware/cirrus/cs_dsp.c:2760:9: note: Left side of '&&' is false
                   ctl =3D list_first_entry(&dsp->ctl_list, struct cs_dsp_c=
oeff_ctl, list);
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/firmware/cirrus/cs_dsp.c:2760:9: note: Taking false branch
                   ctl =3D list_first_entry(&dsp->ctl_list, struct cs_dsp_c=
oeff_ctl, list);
                         ^

vim +/adsp1_sizes +1211 drivers/firmware/cirrus/cs_dsp.c

f6bc909e7673c3 Simon Trimmer 2021-09-13  1203  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1204  static unsigned int cs_dsp_a=
dsp1_parse_sizes(struct cs_dsp *dsp,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1205  					     const char * const=
 file,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1206  					     unsigned int pos,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1207  					     const struct firmw=
are *firmware)
f6bc909e7673c3 Simon Trimmer 2021-09-13  1208  {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1209  	const struct wmfw_adsp1_siz=
es *adsp1_sizes;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1210  =

f6bc909e7673c3 Simon Trimmer 2021-09-13 @1211  	adsp1_sizes =3D (void *)&fi=
rmware->data[pos];
f6bc909e7673c3 Simon Trimmer 2021-09-13  1212  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1213  	cs_dsp_dbg(dsp, "%s: %d DM,=
 %d PM, %d ZM\n", file,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1214  		   le32_to_cpu(adsp1_sizes=
->dm), le32_to_cpu(adsp1_sizes->pm),
f6bc909e7673c3 Simon Trimmer 2021-09-13  1215  		   le32_to_cpu(adsp1_sizes=
->zm));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1216  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1217  	return pos + sizeof(*adsp1_=
sizes);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1218  }
f6bc909e7673c3 Simon Trimmer 2021-09-13  1219  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1220  static unsigned int cs_dsp_a=
dsp2_parse_sizes(struct cs_dsp *dsp,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1221  					     const char * const=
 file,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1222  					     unsigned int pos,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1223  					     const struct firmw=
are *firmware)
f6bc909e7673c3 Simon Trimmer 2021-09-13  1224  {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1225  	const struct wmfw_adsp2_siz=
es *adsp2_sizes;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1226  =

f6bc909e7673c3 Simon Trimmer 2021-09-13 @1227  	adsp2_sizes =3D (void *)&fi=
rmware->data[pos];
f6bc909e7673c3 Simon Trimmer 2021-09-13  1228  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1229  	cs_dsp_dbg(dsp, "%s: %d XM,=
 %d YM %d PM, %d ZM\n", file,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1230  		   le32_to_cpu(adsp2_sizes=
->xm), le32_to_cpu(adsp2_sizes->ym),
f6bc909e7673c3 Simon Trimmer 2021-09-13  1231  		   le32_to_cpu(adsp2_sizes=
->pm), le32_to_cpu(adsp2_sizes->zm));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1232  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1233  	return pos + sizeof(*adsp2_=
sizes);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1234  }
f6bc909e7673c3 Simon Trimmer 2021-09-13  1235  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1236  static bool cs_dsp_validate_=
version(struct cs_dsp *dsp, unsigned int version)
f6bc909e7673c3 Simon Trimmer 2021-09-13  1237  {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1238  	switch (version) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1239  	case 0:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1240  		cs_dsp_warn(dsp, "Deprecat=
ed file format %d\n", version);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1241  		return true;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1242  	case 1:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1243  	case 2:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1244  		return true;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1245  	default:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1246  		return false;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1247  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1248  }
f6bc909e7673c3 Simon Trimmer 2021-09-13  1249  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1250  static bool cs_dsp_halo_vali=
date_version(struct cs_dsp *dsp, unsigned int version)
f6bc909e7673c3 Simon Trimmer 2021-09-13  1251  {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1252  	switch (version) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1253  	case 3:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1254  		return true;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1255  	default:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1256  		return false;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1257  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1258  }
f6bc909e7673c3 Simon Trimmer 2021-09-13  1259  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1260  static int cs_dsp_load(struc=
t cs_dsp *dsp, const struct firmware *firmware,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1261  		       const char *file)
f6bc909e7673c3 Simon Trimmer 2021-09-13  1262  {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1263  	LIST_HEAD(buf_list);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1264  	struct regmap *regmap =3D d=
sp->regmap;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1265  	unsigned int pos =3D 0;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1266  	const struct wmfw_header *h=
eader;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1267  	const struct wmfw_adsp1_siz=
es *adsp1_sizes;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1268  	const struct wmfw_footer *f=
ooter;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1269  	const struct wmfw_region *r=
egion;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1270  	const struct cs_dsp_region =
*mem;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1271  	const char *region_name;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1272  	char *text =3D NULL;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1273  	struct cs_dsp_buf *buf;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1274  	unsigned int reg;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1275  	int regions =3D 0;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1276  	int ret, offset, type;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1277  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1278  	ret =3D -EINVAL;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1279  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1280  	pos =3D sizeof(*header) + s=
izeof(*adsp1_sizes) + sizeof(*footer);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1281  	if (pos >=3D firmware->size=
) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1282  		cs_dsp_err(dsp, "%s: file =
too short, %zu bytes\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1283  			   file, firmware->size);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1284  		goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1285  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1286  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1287  	header =3D (void *)&firmwar=
e->data[0];
f6bc909e7673c3 Simon Trimmer 2021-09-13  1288  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1289  	if (memcmp(&header->magic[0=
], "WMFW", 4) !=3D 0) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1290  		cs_dsp_err(dsp, "%s: inval=
id magic\n", file);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1291  		goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1292  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1293  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1294  	if (!dsp->ops->validate_ver=
sion(dsp, header->ver)) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1295  		cs_dsp_err(dsp, "%s: unkno=
wn file format %d\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1296  			   file, header->ver);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1297  		goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1298  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1299  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1300  	cs_dsp_info(dsp, "Firmware =
version: %d\n", header->ver);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1301  	dsp->fw_ver =3D header->ver;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1302  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1303  	if (header->core !=3D dsp->=
type) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1304  		cs_dsp_err(dsp, "%s: inval=
id core %d !=3D %d\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1305  			   file, header->core, ds=
p->type);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1306  		goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1307  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1308  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1309  	pos =3D sizeof(*header);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1310  	pos =3D dsp->ops->parse_siz=
es(dsp, file, pos, firmware);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1311  =

f6bc909e7673c3 Simon Trimmer 2021-09-13 @1312  	footer =3D (void *)&firmwar=
e->data[pos];
f6bc909e7673c3 Simon Trimmer 2021-09-13  1313  	pos +=3D sizeof(*footer);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1314  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1315  	if (le32_to_cpu(header->len=
) !=3D pos) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1316  		cs_dsp_err(dsp, "%s: unexp=
ected header length %d\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1317  			   file, le32_to_cpu(head=
er->len));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1318  		goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1319  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1320  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1321  	cs_dsp_dbg(dsp, "%s: timest=
amp %llu\n", file,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1322  		   le64_to_cpu(footer->tim=
estamp));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1323  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1324  	while (pos < firmware->size=
 &&
f6bc909e7673c3 Simon Trimmer 2021-09-13  1325  	       sizeof(*region) < fi=
rmware->size - pos) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1326  		region =3D (void *)&(firmw=
are->data[pos]);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1327  		region_name =3D "Unknown";
f6bc909e7673c3 Simon Trimmer 2021-09-13  1328  		reg =3D 0;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1329  		text =3D NULL;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1330  		offset =3D le32_to_cpu(reg=
ion->offset) & 0xffffff;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1331  		type =3D be32_to_cpu(regio=
n->type) & 0xff;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1332  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1333  		switch (type) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1334  		case WMFW_NAME_TEXT:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1335  			region_name =3D "Firmware=
 name";
f6bc909e7673c3 Simon Trimmer 2021-09-13  1336  			text =3D kzalloc(le32_to_=
cpu(region->len) + 1,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1337  				       GFP_KERNEL);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1338  			break;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1339  		case WMFW_ALGORITHM_DATA:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1340  			region_name =3D "Algorith=
m";
f6bc909e7673c3 Simon Trimmer 2021-09-13  1341  			ret =3D cs_dsp_parse_coef=
f(dsp, region);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1342  			if (ret !=3D 0)
f6bc909e7673c3 Simon Trimmer 2021-09-13  1343  				goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1344  			break;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1345  		case WMFW_INFO_TEXT:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1346  			region_name =3D "Informat=
ion";
f6bc909e7673c3 Simon Trimmer 2021-09-13  1347  			text =3D kzalloc(le32_to_=
cpu(region->len) + 1,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1348  				       GFP_KERNEL);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1349  			break;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1350  		case WMFW_ABSOLUTE:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1351  			region_name =3D "Absolute=
";
f6bc909e7673c3 Simon Trimmer 2021-09-13  1352  			reg =3D offset;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1353  			break;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1354  		case WMFW_ADSP1_PM:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1355  		case WMFW_ADSP1_DM:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1356  		case WMFW_ADSP2_XM:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1357  		case WMFW_ADSP2_YM:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1358  		case WMFW_ADSP1_ZM:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1359  		case WMFW_HALO_PM_PACKED:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1360  		case WMFW_HALO_XM_PACKED:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1361  		case WMFW_HALO_YM_PACKED:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1362  			mem =3D cs_dsp_find_regio=
n(dsp, type);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1363  			if (!mem) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1364  				cs_dsp_err(dsp, "No regi=
on of type: %x\n", type);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1365  				ret =3D -EINVAL;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1366  				goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1367  			}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1368  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1369  			region_name =3D cs_dsp_me=
m_region_name(type);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1370  			reg =3D dsp->ops->region_=
to_reg(mem, offset);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1371  			break;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1372  		default:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1373  			cs_dsp_warn(dsp,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1374  				    "%s.%d: Unknown regi=
on type %x at %d(%x)\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1375  				    file, regions, type,=
 pos, pos);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1376  			break;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1377  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1378  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1379  		cs_dsp_dbg(dsp, "%s.%d: %d=
 bytes at %d in %s\n", file,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1380  			   regions, le32_to_cpu(r=
egion->len), offset,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1381  			   region_name);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1382  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1383  		if (le32_to_cpu(region->le=
n) >
f6bc909e7673c3 Simon Trimmer 2021-09-13  1384  		    firmware->size - pos -=
 sizeof(*region)) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1385  			cs_dsp_err(dsp,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1386  				   "%s.%d: %s region len=
 %d bytes exceeds file length %zu\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1387  				   file, regions, region=
_name,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1388  				   le32_to_cpu(region->l=
en), firmware->size);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1389  			ret =3D -EINVAL;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1390  			goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1391  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1392  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1393  		if (text) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1394  			memcpy(text, region->data=
, le32_to_cpu(region->len));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1395  			cs_dsp_info(dsp, "%s: %s\=
n", file, text);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1396  			kfree(text);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1397  			text =3D NULL;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1398  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1399  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1400  		if (reg) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1401  			buf =3D cs_dsp_buf_alloc(=
region->data,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1402  					       le32_to_cpu(regi=
on->len),
f6bc909e7673c3 Simon Trimmer 2021-09-13  1403  					       &buf_list);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1404  			if (!buf) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1405  				cs_dsp_err(dsp, "Out of =
memory\n");
f6bc909e7673c3 Simon Trimmer 2021-09-13  1406  				ret =3D -ENOMEM;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1407  				goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1408  			}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1409  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1410  			ret =3D regmap_raw_write_=
async(regmap, reg, buf->buf,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1411  						     le32_to_cpu(regio=
n->len));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1412  			if (ret !=3D 0) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1413  				cs_dsp_err(dsp,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1414  					   "%s.%d: Failed to wr=
ite %d bytes at %d in %s: %d\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1415  					   file, regions,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1416  					   le32_to_cpu(region->=
len), offset,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1417  					   region_name, ret);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1418  				goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1419  			}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1420  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1421  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1422  		pos +=3D le32_to_cpu(regio=
n->len) + sizeof(*region);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1423  		regions++;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1424  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1425  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1426  	ret =3D regmap_async_comple=
te(regmap);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1427  	if (ret !=3D 0) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1428  		cs_dsp_err(dsp, "Failed to=
 complete async write: %d\n", ret);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1429  		goto out_fw;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1430  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1431  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1432  	if (pos > firmware->size)
f6bc909e7673c3 Simon Trimmer 2021-09-13  1433  		cs_dsp_warn(dsp, "%s.%d: %=
zu bytes at end of file\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1434  			    file, regions, pos - =
firmware->size);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1435  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1436  	cs_dsp_debugfs_save_wmfwnam=
e(dsp, file);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1437  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1438  out_fw:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1439  	regmap_async_complete(regma=
p);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1440  	cs_dsp_buf_free(&buf_list);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1441  	kfree(text);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1442  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1443  	return ret;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1444  }
f6bc909e7673c3 Simon Trimmer 2021-09-13  1445  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4464493512038805265==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
x4/3Jj1SAgA=
--===============4464493512038805265==--


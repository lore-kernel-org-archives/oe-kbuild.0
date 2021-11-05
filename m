Content-Type: multipart/mixed; boundary="===============3576474779939927659=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/cirrus/cs_dsp.c:1211:2: warning: Value stored to 'adsp1_sizes' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 06 Nov 2021 03:41:11 +0800
Message-ID: <202111060304.V0fp8dZy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3576474779939927659==
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
head:   fe91c4725aeed35023ba4f7a1e1adfebb6878c23
commit: f6bc909e7673c30abcbdb329e7d0aa2e83c103d7 firmware: cs_dsp: add driv=
er to support firmware loading on Cirrus Logic DSPs
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/fscache/page.c:992:2: warning: Value stored to 'ret' is never read [c=
lang-analyzer-deadcode.DeadStores]
           ret =3D -ENOBUFS;
           ^     ~~~~~~~~
   fs/fscache/page.c:992:2: note: Value stored to 'ret' is never read
           ret =3D -ENOBUFS;
           ^     ~~~~~~~~
   fs/fscache/page.c:1074:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D -ENOBUFS;
           ^     ~~~~~~~~
   fs/fscache/page.c:1074:2: note: Value stored to 'ret' is never read
           ret =3D -ENOBUFS;
           ^     ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/leds/flash/leds-as3645a.c:382:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &flash->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-as3645a.c:382:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &flash->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
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

f6bc909e7673c30 Simon Trimmer 2021-09-13  1203  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1204  static unsigned int cs_dsp_=
adsp1_parse_sizes(struct cs_dsp *dsp,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1205  					     const char * cons=
t file,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1206  					     unsigned int pos,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1207  					     const struct firm=
ware *firmware)
f6bc909e7673c30 Simon Trimmer 2021-09-13  1208  {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1209  	const struct wmfw_adsp1_si=
zes *adsp1_sizes;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1210  =

f6bc909e7673c30 Simon Trimmer 2021-09-13 @1211  	adsp1_sizes =3D (void *)&f=
irmware->data[pos];
f6bc909e7673c30 Simon Trimmer 2021-09-13  1212  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1213  	cs_dsp_dbg(dsp, "%s: %d DM=
, %d PM, %d ZM\n", file,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1214  		   le32_to_cpu(adsp1_size=
s->dm), le32_to_cpu(adsp1_sizes->pm),
f6bc909e7673c30 Simon Trimmer 2021-09-13  1215  		   le32_to_cpu(adsp1_size=
s->zm));
f6bc909e7673c30 Simon Trimmer 2021-09-13  1216  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1217  	return pos + sizeof(*adsp1=
_sizes);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1218  }
f6bc909e7673c30 Simon Trimmer 2021-09-13  1219  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1220  static unsigned int cs_dsp_=
adsp2_parse_sizes(struct cs_dsp *dsp,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1221  					     const char * cons=
t file,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1222  					     unsigned int pos,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1223  					     const struct firm=
ware *firmware)
f6bc909e7673c30 Simon Trimmer 2021-09-13  1224  {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1225  	const struct wmfw_adsp2_si=
zes *adsp2_sizes;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1226  =

f6bc909e7673c30 Simon Trimmer 2021-09-13 @1227  	adsp2_sizes =3D (void *)&f=
irmware->data[pos];
f6bc909e7673c30 Simon Trimmer 2021-09-13  1228  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1229  	cs_dsp_dbg(dsp, "%s: %d XM=
, %d YM %d PM, %d ZM\n", file,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1230  		   le32_to_cpu(adsp2_size=
s->xm), le32_to_cpu(adsp2_sizes->ym),
f6bc909e7673c30 Simon Trimmer 2021-09-13  1231  		   le32_to_cpu(adsp2_size=
s->pm), le32_to_cpu(adsp2_sizes->zm));
f6bc909e7673c30 Simon Trimmer 2021-09-13  1232  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1233  	return pos + sizeof(*adsp2=
_sizes);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1234  }
f6bc909e7673c30 Simon Trimmer 2021-09-13  1235  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1236  static bool cs_dsp_validate=
_version(struct cs_dsp *dsp, unsigned int version)
f6bc909e7673c30 Simon Trimmer 2021-09-13  1237  {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1238  	switch (version) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1239  	case 0:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1240  		cs_dsp_warn(dsp, "Depreca=
ted file format %d\n", version);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1241  		return true;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1242  	case 1:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1243  	case 2:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1244  		return true;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1245  	default:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1246  		return false;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1247  	}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1248  }
f6bc909e7673c30 Simon Trimmer 2021-09-13  1249  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1250  static bool cs_dsp_halo_val=
idate_version(struct cs_dsp *dsp, unsigned int version)
f6bc909e7673c30 Simon Trimmer 2021-09-13  1251  {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1252  	switch (version) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1253  	case 3:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1254  		return true;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1255  	default:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1256  		return false;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1257  	}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1258  }
f6bc909e7673c30 Simon Trimmer 2021-09-13  1259  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1260  static int cs_dsp_load(stru=
ct cs_dsp *dsp, const struct firmware *firmware,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1261  		       const char *file)
f6bc909e7673c30 Simon Trimmer 2021-09-13  1262  {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1263  	LIST_HEAD(buf_list);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1264  	struct regmap *regmap =3D =
dsp->regmap;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1265  	unsigned int pos =3D 0;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1266  	const struct wmfw_header *=
header;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1267  	const struct wmfw_adsp1_si=
zes *adsp1_sizes;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1268  	const struct wmfw_footer *=
footer;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1269  	const struct wmfw_region *=
region;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1270  	const struct cs_dsp_region=
 *mem;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1271  	const char *region_name;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1272  	char *text =3D NULL;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1273  	struct cs_dsp_buf *buf;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1274  	unsigned int reg;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1275  	int regions =3D 0;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1276  	int ret, offset, type;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1277  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1278  	ret =3D -EINVAL;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1279  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1280  	pos =3D sizeof(*header) + =
sizeof(*adsp1_sizes) + sizeof(*footer);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1281  	if (pos >=3D firmware->siz=
e) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1282  		cs_dsp_err(dsp, "%s: file=
 too short, %zu bytes\n",
f6bc909e7673c30 Simon Trimmer 2021-09-13  1283  			   file, firmware->size);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1284  		goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1285  	}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1286  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1287  	header =3D (void *)&firmwa=
re->data[0];
f6bc909e7673c30 Simon Trimmer 2021-09-13  1288  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1289  	if (memcmp(&header->magic[=
0], "WMFW", 4) !=3D 0) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1290  		cs_dsp_err(dsp, "%s: inva=
lid magic\n", file);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1291  		goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1292  	}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1293  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1294  	if (!dsp->ops->validate_ve=
rsion(dsp, header->ver)) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1295  		cs_dsp_err(dsp, "%s: unkn=
own file format %d\n",
f6bc909e7673c30 Simon Trimmer 2021-09-13  1296  			   file, header->ver);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1297  		goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1298  	}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1299  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1300  	cs_dsp_info(dsp, "Firmware=
 version: %d\n", header->ver);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1301  	dsp->fw_ver =3D header->ve=
r;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1302  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1303  	if (header->core !=3D dsp-=
>type) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1304  		cs_dsp_err(dsp, "%s: inva=
lid core %d !=3D %d\n",
f6bc909e7673c30 Simon Trimmer 2021-09-13  1305  			   file, header->core, d=
sp->type);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1306  		goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1307  	}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1308  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1309  	pos =3D sizeof(*header);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1310  	pos =3D dsp->ops->parse_si=
zes(dsp, file, pos, firmware);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1311  =

f6bc909e7673c30 Simon Trimmer 2021-09-13 @1312  	footer =3D (void *)&firmwa=
re->data[pos];
f6bc909e7673c30 Simon Trimmer 2021-09-13  1313  	pos +=3D sizeof(*footer);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1314  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1315  	if (le32_to_cpu(header->le=
n) !=3D pos) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1316  		cs_dsp_err(dsp, "%s: unex=
pected header length %d\n",
f6bc909e7673c30 Simon Trimmer 2021-09-13  1317  			   file, le32_to_cpu(hea=
der->len));
f6bc909e7673c30 Simon Trimmer 2021-09-13  1318  		goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1319  	}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1320  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1321  	cs_dsp_dbg(dsp, "%s: times=
tamp %llu\n", file,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1322  		   le64_to_cpu(footer->ti=
mestamp));
f6bc909e7673c30 Simon Trimmer 2021-09-13  1323  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1324  	while (pos < firmware->siz=
e &&
f6bc909e7673c30 Simon Trimmer 2021-09-13  1325  	       sizeof(*region) < f=
irmware->size - pos) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1326  		region =3D (void *)&(firm=
ware->data[pos]);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1327  		region_name =3D "Unknown";
f6bc909e7673c30 Simon Trimmer 2021-09-13  1328  		reg =3D 0;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1329  		text =3D NULL;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1330  		offset =3D le32_to_cpu(re=
gion->offset) & 0xffffff;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1331  		type =3D be32_to_cpu(regi=
on->type) & 0xff;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1332  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1333  		switch (type) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1334  		case WMFW_NAME_TEXT:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1335  			region_name =3D "Firmwar=
e name";
f6bc909e7673c30 Simon Trimmer 2021-09-13  1336  			text =3D kzalloc(le32_to=
_cpu(region->len) + 1,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1337  				       GFP_KERNEL);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1338  			break;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1339  		case WMFW_ALGORITHM_DATA:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1340  			region_name =3D "Algorit=
hm";
f6bc909e7673c30 Simon Trimmer 2021-09-13  1341  			ret =3D cs_dsp_parse_coe=
ff(dsp, region);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1342  			if (ret !=3D 0)
f6bc909e7673c30 Simon Trimmer 2021-09-13  1343  				goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1344  			break;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1345  		case WMFW_INFO_TEXT:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1346  			region_name =3D "Informa=
tion";
f6bc909e7673c30 Simon Trimmer 2021-09-13  1347  			text =3D kzalloc(le32_to=
_cpu(region->len) + 1,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1348  				       GFP_KERNEL);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1349  			break;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1350  		case WMFW_ABSOLUTE:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1351  			region_name =3D "Absolut=
e";
f6bc909e7673c30 Simon Trimmer 2021-09-13  1352  			reg =3D offset;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1353  			break;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1354  		case WMFW_ADSP1_PM:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1355  		case WMFW_ADSP1_DM:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1356  		case WMFW_ADSP2_XM:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1357  		case WMFW_ADSP2_YM:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1358  		case WMFW_ADSP1_ZM:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1359  		case WMFW_HALO_PM_PACKED:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1360  		case WMFW_HALO_XM_PACKED:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1361  		case WMFW_HALO_YM_PACKED:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1362  			mem =3D cs_dsp_find_regi=
on(dsp, type);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1363  			if (!mem) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1364  				cs_dsp_err(dsp, "No reg=
ion of type: %x\n", type);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1365  				ret =3D -EINVAL;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1366  				goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1367  			}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1368  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1369  			region_name =3D cs_dsp_m=
em_region_name(type);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1370  			reg =3D dsp->ops->region=
_to_reg(mem, offset);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1371  			break;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1372  		default:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1373  			cs_dsp_warn(dsp,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1374  				    "%s.%d: Unknown reg=
ion type %x at %d(%x)\n",
f6bc909e7673c30 Simon Trimmer 2021-09-13  1375  				    file, regions, type=
, pos, pos);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1376  			break;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1377  		}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1378  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1379  		cs_dsp_dbg(dsp, "%s.%d: %=
d bytes at %d in %s\n", file,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1380  			   regions, le32_to_cpu(=
region->len), offset,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1381  			   region_name);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1382  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1383  		if (le32_to_cpu(region->l=
en) >
f6bc909e7673c30 Simon Trimmer 2021-09-13  1384  		    firmware->size - pos =
- sizeof(*region)) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1385  			cs_dsp_err(dsp,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1386  				   "%s.%d: %s region le=
n %d bytes exceeds file length %zu\n",
f6bc909e7673c30 Simon Trimmer 2021-09-13  1387  				   file, regions, regio=
n_name,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1388  				   le32_to_cpu(region->=
len), firmware->size);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1389  			ret =3D -EINVAL;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1390  			goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1391  		}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1392  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1393  		if (text) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1394  			memcpy(text, region->dat=
a, le32_to_cpu(region->len));
f6bc909e7673c30 Simon Trimmer 2021-09-13  1395  			cs_dsp_info(dsp, "%s: %s=
\n", file, text);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1396  			kfree(text);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1397  			text =3D NULL;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1398  		}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1399  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1400  		if (reg) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1401  			buf =3D cs_dsp_buf_alloc=
(region->data,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1402  					       le32_to_cpu(reg=
ion->len),
f6bc909e7673c30 Simon Trimmer 2021-09-13  1403  					       &buf_list);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1404  			if (!buf) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1405  				cs_dsp_err(dsp, "Out of=
 memory\n");
f6bc909e7673c30 Simon Trimmer 2021-09-13  1406  				ret =3D -ENOMEM;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1407  				goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1408  			}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1409  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1410  			ret =3D regmap_raw_write=
_async(regmap, reg, buf->buf,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1411  						     le32_to_cpu(regi=
on->len));
f6bc909e7673c30 Simon Trimmer 2021-09-13  1412  			if (ret !=3D 0) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1413  				cs_dsp_err(dsp,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1414  					   "%s.%d: Failed to w=
rite %d bytes at %d in %s: %d\n",
f6bc909e7673c30 Simon Trimmer 2021-09-13  1415  					   file, regions,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1416  					   le32_to_cpu(region-=
>len), offset,
f6bc909e7673c30 Simon Trimmer 2021-09-13  1417  					   region_name, ret);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1418  				goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1419  			}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1420  		}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1421  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1422  		pos +=3D le32_to_cpu(regi=
on->len) + sizeof(*region);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1423  		regions++;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1424  	}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1425  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1426  	ret =3D regmap_async_compl=
ete(regmap);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1427  	if (ret !=3D 0) {
f6bc909e7673c30 Simon Trimmer 2021-09-13  1428  		cs_dsp_err(dsp, "Failed t=
o complete async write: %d\n", ret);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1429  		goto out_fw;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1430  	}
f6bc909e7673c30 Simon Trimmer 2021-09-13  1431  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1432  	if (pos > firmware->size)
f6bc909e7673c30 Simon Trimmer 2021-09-13  1433  		cs_dsp_warn(dsp, "%s.%d: =
%zu bytes at end of file\n",
f6bc909e7673c30 Simon Trimmer 2021-09-13  1434  			    file, regions, pos -=
 firmware->size);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1435  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1436  	cs_dsp_debugfs_save_wmfwna=
me(dsp, file);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1437  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1438  out_fw:
f6bc909e7673c30 Simon Trimmer 2021-09-13  1439  	regmap_async_complete(regm=
ap);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1440  	cs_dsp_buf_free(&buf_list);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1441  	kfree(text);
f6bc909e7673c30 Simon Trimmer 2021-09-13  1442  =

f6bc909e7673c30 Simon Trimmer 2021-09-13  1443  	return ret;
f6bc909e7673c30 Simon Trimmer 2021-09-13  1444  }
f6bc909e7673c30 Simon Trimmer 2021-09-13  1445  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3576474779939927659==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ioW2PVICAA==
--===============3576474779939927659==--


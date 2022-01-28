Content-Type: multipart/mixed; boundary="===============8160142606586940870=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/cirrus/cs_dsp.c:1211:2: warning: Value stored to 'adsp1_sizes' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 28 Jan 2022 10:26:27 +0800
Message-ID: <202201281003.OMEIIoP1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8160142606586940870==
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
head:   23a46422c56144939c091c76cf389aa863ce9c18
commit: f6bc909e7673c30abcbdb329e7d0aa2e83c103d7 firmware: cs_dsp: add driv=
er to support firmware loading on Cirrus Logic DSPs
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220123 (https://download.01.org/0day-ci/archi=
ve/20220128/202201281003.OMEIIoP1-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df6bc909e7673c30abcbdb329e7d0aa2e83c103d7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f6bc909e7673c30abcbdb329e7d0aa2e83c103d7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/media/i2c/tvp7002.c:633:6: note: 'error' is >=3D 0
           if (error < 0)
               ^~~~~
   drivers/media/i2c/tvp7002.c:633:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/media/i2c/tvp7002.c:637:37: note: The right operand of '&' is a =
garbage value
           lpfr =3D lpf_lsb | ((TVP7002_CL_MASK & lpf_msb) << TVP7002_CL_SH=
IFT);
                                              ^ ~~~~~~~
   drivers/media/i2c/tvp7002.c:638:37: warning: The right operand of '&' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           cpln =3D cpl_lsb | ((TVP7002_CL_MASK & cpl_msb) << TVP7002_CL_SH=
IFT);
                                              ^
   drivers/media/i2c/tvp7002.c:753:2: note: Calling 'tvp7002_query_dv'
           tvp7002_query_dv(sd, &detected);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:618:2: note: 'cpl_msb' declared without an i=
nitial value
           u8 cpl_msb;
           ^~~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/media/i2c/tvp7002.c:631:2: note: Calling 'tvp7002_read_err'
           tvp7002_read_err(sd, TVP7002_CLK_L_STAT_MSBS, &cpl_msb, &error);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:475:2: note: Taking false branch
           if (!*err)
           ^
   drivers/media/i2c/tvp7002.c:477:1: note: Returning without writing to '*=
dst'
   }
   ^
   drivers/media/i2c/tvp7002.c:631:2: note: Returning from 'tvp7002_read_er=
r'
           tvp7002_read_err(sd, TVP7002_CLK_L_STAT_MSBS, &cpl_msb, &error);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:633:6: note: 'error' is >=3D 0
           if (error < 0)
               ^~~~~
   drivers/media/i2c/tvp7002.c:633:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/media/i2c/tvp7002.c:638:37: note: The right operand of '&' is a =
garbage value
           cpln =3D cpl_lsb | ((TVP7002_CL_MASK & cpl_msb) << TVP7002_CL_SH=
IFT);
                                              ^ ~~~~~~~
   drivers/media/i2c/tvp7002.c:1004:2: warning: Value stored to 'error' is =
never read [clang-analyzer-deadcode.DeadStores]
           error =3D tvp7002_s_dv_timings(sd, &timings);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:1004:2: note: Value stored to 'error' is nev=
er read
           error =3D tvp7002_s_dv_timings(sd, &timings);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
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
--===============8160142606586940870==--


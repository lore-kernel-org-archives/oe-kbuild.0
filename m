Content-Type: multipart/mixed; boundary="===============0578490042882278864=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-sound:for-next 8/34] drivers/firmware/cirrus/cs_dsp.c:1211:2: warning: Value stored to 'adsp1_sizes' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 22 Nov 2021 02:51:33 +0800
Message-ID: <202111220230.2lujavmL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0578490042882278864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Rhodes <drhodes@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
head:   626a3dfbdb5d11f92e709680135abf272057ef59
commit: bae9e13fc55cbc5ae25409385b2f1ba9187082d0 [8/34] ASoC: cs35l41: DSP =
Support
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: riscv-randconfig-c006-20211118 (attached as .config)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git=
/commit/?id=3Dbae9e13fc55cbc5ae25409385b2f1ba9187082d0
        git remote add broonie-sound https://git.kernel.org/pub/scm/linux/k=
ernel/git/broonie/sound.git
        git fetch --no-tags broonie-sound for-next
        git checkout bae9e13fc55cbc5ae25409385b2f1ba9187082d0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:742:2: note: Taking false branch
           if (IS_ERR(spdif->clk_sys)) {
           ^
   sound/soc/img/img-spdif-in.c:749:7: note: Calling 'pm_runtime_enabled'
           if (!pm_runtime_enabled(&pdev->dev)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm_runtime.h:174:9: note: Assuming field 'disable_depth' i=
s 0, which participates in a condition later
           return !dev->power.disable_depth;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm_runtime.h:174:2: note: Returning without writing to 'de=
v->power.disable_depth', which participates in a condition later
           return !dev->power.disable_depth;
           ^
   include/linux/pm_runtime.h:174:2: note: Returning the value 1, which par=
ticipates in a condition later
           return !dev->power.disable_depth;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:749:7: note: Returning from 'pm_runtime_ena=
bled'
           if (!pm_runtime_enabled(&pdev->dev)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:749:2: note: Taking false branch
           if (!pm_runtime_enabled(&pdev->dev)) {
           ^
   sound/soc/img/img-spdif-in.c:755:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   sound/soc/img/img-spdif-in.c:755:2: note: Taking false branch
           if (ret < 0) {
           ^
   sound/soc/img/img-spdif-in.c:761:6: note: Calling 'IS_ERR'
           if (IS_ERR(rst)) {
               ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:761:6: note: Returning from 'IS_ERR'
           if (IS_ERR(rst)) {
               ^~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:761:2: note: Taking false branch
           if (IS_ERR(rst)) {
           ^
   sound/soc/img/img-spdif-in.c:775:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_init(&spdif->lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   sound/soc/img/img-spdif-in.c:782:2: note: The value -128 is assigned to =
field 'lock_release'
           spdif->lock_release =3D -128;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-spdif-in.c:786:30: note: The result of the left shift =
is undefined because the left operand is negative
           reg |=3D (spdif->lock_release << IMG_SPDIF_IN_CTL_LOCKLO_SHIFT) &
                   ~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   10 warnings generated.
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
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/firmware/cirrus/cs_dsp.c:2280:2: note: Loop condition is false. =
Execution continues on line 2283
           list_for_each_entry(ctl, &dsp->ctl_list, list)
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/firmware/cirrus/cs_dsp.c:2283:2: note: Calling 'cs_dsp_free_alg_=
regions'
           cs_dsp_free_alg_regions(dsp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:1592:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&dsp->alg_regions)) {
           ^
   drivers/firmware/cirrus/cs_dsp.c:1597:3: note: Memory is released
                   kfree(alg_region);
                   ^~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:1592:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&dsp->alg_regions)) {
           ^
   drivers/firmware/cirrus/cs_dsp.c:1596:3: note: Calling 'list_del'
                   list_del(&alg_region->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   drivers/firmware/cirrus/cs_dsp.c:2280:2: note: Loop condition is false. =
Execution continues on line 2283
           list_for_each_entry(ctl, &dsp->ctl_list, list)
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/firmware/cirrus/cs_dsp.c:2283:2: note: Calling 'cs_dsp_free_alg_=
regions'
           cs_dsp_free_alg_regions(dsp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:1592:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&dsp->alg_regions)) {
           ^
   drivers/firmware/cirrus/cs_dsp.c:1597:3: note: Memory is released
                   kfree(alg_region);
                   ^~~~~~~~~~~~~~~~~
   drivers/firmware/cirrus/cs_dsp.c:1592:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&dsp->alg_regions)) {
           ^
   drivers/firmware/cirrus/cs_dsp.c:1596:3: note: Calling 'list_del'
                   list_del(&alg_region->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/nvme/target/fcloop.c:1226:3: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/nvme/target/fcloop.c:1226:3: note: Value stored to 'ret' is neve=
r read
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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


:::::: The code at line 1211 was first introduced by commit
:::::: f6bc909e7673c30abcbdb329e7d0aa2e83c103d7 firmware: cs_dsp: add drive=
r to support firmware loading on Cirrus Logic DSPs

:::::: TO: Simon Trimmer <simont@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0578490042882278864==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
sTAcAgA=
--===============0578490042882278864==--


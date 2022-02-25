Content-Type: multipart/mixed; boundary="===============4746321337100024381=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/cirrus/cs_dsp.c:1211:2: warning: Value stored to 'adsp1_sizes' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Feb 2022 06:38:35 +0800
Message-ID: <202202260637.5XfUPhNX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4746321337100024381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Rhodes <drhodes@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   53ab78cd6d5aba25575a7cfb95729336ba9497d8
commit: bae9e13fc55cbc5ae25409385b2f1ba9187082d0 ASoC: cs35l41: DSP Support
date:   3 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220225 (https://download.01.org/0day-ci/arc=
hive/20220226/202202260637.5XfUPhNX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbae9e13fc55cbc5ae25409385b2f1ba9187082d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bae9e13fc55cbc5ae25409385b2f1ba9187082d0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/core.c:4277:6: note: Returning from 'IS_ERR'
           if (IS_ERR(new_parent_kobj)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/core.c:4277:2: note: Taking false branch
           if (IS_ERR(new_parent_kobj)) {
           ^
   drivers/base/core.c:4283:2: note: Taking false branch
           pr_debug("device: '%s': %s: moving to '%s'\n", dev_name(dev),
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/base/core.c:4286:6: note: Assuming 'error' is 0
           if (error) {
               ^~~~~
   drivers/base/core.c:4286:2: note: Taking false branch
           if (error) {
           ^
   drivers/base/core.c:4293:6: note: Assuming 'old_parent' is null
           if (old_parent)
               ^~~~~~~~~~
   drivers/base/core.c:4293:2: note: Taking false branch
           if (old_parent)
           ^
   drivers/base/core.c:4295:6: note: Assuming 'new_parent' is null
           if (new_parent) {
               ^~~~~~~~~~
   drivers/base/core.c:4295:2: note: Taking false branch
           if (new_parent) {
           ^
   drivers/base/core.c:4301:6: note: Assuming field 'class' is null
           if (dev->class) {
               ^~~~~~~~~~
   drivers/base/core.c:4301:2: note: Taking false branch
           if (dev->class) {
           ^
   drivers/base/core.c:4321:2: note: Control jumps to 'case DPM_ORDER_PAREN=
T_BEFORE_DEV:'  at line 4328
           switch (dpm_order) {
           ^
   drivers/base/core.c:4330:28: note: Passing null pointer value via 1st pa=
rameter 'deva'
                   devices_kset_move_before(new_parent, dev);
                                            ^~~~~~~~~~
   drivers/base/core.c:4330:3: note: Calling 'devices_kset_move_before'
                   devices_kset_move_before(new_parent, dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/core.c:2706:6: note: Assuming 'devices_kset' is non-null
           if (!devices_kset)
               ^~~~~~~~~~~~~
   drivers/base/core.c:2706:2: note: Taking false branch
           if (!devices_kset)
           ^
   drivers/base/core.c:2708:2: note: Taking false branch
           pr_debug("devices_kset: Moving %s before %s\n",
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/base/core.c:2711:17: note: Passing null pointer value via 1st pa=
rameter 'list'
           list_move_tail(&deva->kobj.entry, &devb->kobj.entry);
                          ^~~~~~~~~~~~~~~~~
   drivers/base/core.c:2711:2: note: Calling 'list_move_tail'
           list_move_tail(&deva->kobj.entry, &devb->kobj.entry);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:229:19: note: Passing null pointer value via 1st pa=
rameter 'entry'
           __list_del_entry(list);
                            ^~~~
   include/linux/list.h:229:2: note: Calling '__list_del_entry'
           __list_del_entry(list);
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Access to field 'prev' results in a d=
ereference of a null pointer (loaded from variable 'entry')
           __list_del(entry->prev, entry->next);
                      ^~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/dvb-frontends/zd1301_demod.c:40:26: warning: Value stored =
to 'pdev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:40:26: note: Value stored to =
'pdev' during its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:148:26: warning: Value stored=
 to 'pdev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:148:26: note: Value stored to=
 'pdev' during its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:181:26: warning: Value stored=
 to 'pdev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:181:26: note: Value stored to=
 'pdev' during its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:215:26: warning: Value stored=
 to 'pdev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:215:26: note: Value stored to=
 'pdev' during its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:229:26: warning: Value stored=
 to 'pdev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:229:26: note: Value stored to=
 'pdev' during its initialization is never read
           struct platform_device *pdev =3D dev->pdev;

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
--===============4746321337100024381==--


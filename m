Content-Type: multipart/mixed; boundary="===============3823410323049559953=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/2] fs/proc: optimize exactly register one ctl_table
Date: Thu, 03 Mar 2022 22:46:57 +0800
Message-ID: <202203032237.rIgEQ0y3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3823410323049559953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220302025511.20374-1-tangmeng@uniontech.com>
References: <20220302025511.20374-1-tangmeng@uniontech.com>
TO: Meng Tang <tangmeng@uniontech.com>
TO: mcgrof(a)kernel.org
TO: keescook(a)chromium.org
TO: yzaikin(a)google.com
TO: ebiederm(a)xmission.com
TO: willy(a)infradead.org
CC: nixiaoming(a)huawei.com
CC: nizhen(a)uniontech.com
CC: zhanglianjie(a)uniontech.com
CC: sujiaxun(a)uniontech.com
CC: linux-kernel(a)vger.kernel.org
CC: linux-fsdevel(a)vger.kernel.org
CC: Meng Tang <tangmeng@uniontech.com>

Hi Meng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mcgrof/sysctl-next]
[also build test WARNING on jack-fs/fsnotify rostedt-trace/for-next kees/fo=
r-next/pstore linus/master v5.17-rc6 next-20220302]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Meng-Tang/fs-proc-optimize=
-exactly-register-one-ctl_table/20220302-105801
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git sy=
sctl-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20303/202203032237.rIgEQ0y3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/867428d5e752b15858302b208=
9d545095b3049a5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Meng-Tang/fs-proc-optimize-exactly=
-register-one-ctl_table/20220302-105801
        git checkout 867428d5e752b15858302b2089d545095b3049a5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:155:3: note: Taking false branch
                   if (bf[0].offset)
                   ^
   fs/xfs/libxfs/xfs_dir2_data.c:159:6: note: Assuming field 'length' is 0
           if (!bf[1].length) {
               ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:159:2: note: Taking true branch
           if (!bf[1].length) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:160:7: note: Assuming field 'offset' is 0
                   if (bf[1].offset)
                       ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:160:3: note: Taking false branch
                   if (bf[1].offset)
                   ^
   fs/xfs/libxfs/xfs_dir2_data.c:164:6: note: Assuming field 'length' is 0
           if (!bf[2].length) {
               ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:164:2: note: Taking true branch
           if (!bf[2].length) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:165:7: note: Assuming field 'offset' is 0
                   if (bf[2].offset)
                       ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:165:3: note: Taking false branch
                   if (bf[2].offset)
                   ^
   fs/xfs/libxfs/xfs_dir2_data.c:170:6: note: Assuming the condition is fal=
se
           if (be16_to_cpu(bf[0].length) < be16_to_cpu(bf[1].length))
               ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^
   include/uapi/linux/swab.h:102:21: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                       ^
   fs/xfs/libxfs/xfs_dir2_data.c:170:2: note: Taking false branch
           if (be16_to_cpu(bf[0].length) < be16_to_cpu(bf[1].length))
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:172:6: note: Assuming the condition is fal=
se
           if (be16_to_cpu(bf[1].length) < be16_to_cpu(bf[2].length))
               ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^
   include/uapi/linux/swab.h:102:21: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                       ^
   fs/xfs/libxfs/xfs_dir2_data.c:172:2: note: Taking false branch
           if (be16_to_cpu(bf[1].length) < be16_to_cpu(bf[2].length))
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:177:9: note: Assuming 'offset' is >=3D 'en=
d'
           while (offset < end) {
                  ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:177:2: note: Loop condition is false. Exec=
ution continues on line 252
           while (offset < end) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:252:6: note: 'freeseen' is equal to 7
           if (freeseen !=3D 7)
               ^~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:252:2: note: Taking false branch
           if (freeseen !=3D 7)
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:254:6: note: Assuming the condition is true
           if (hdr->magic =3D=3D cpu_to_be32(XFS_DIR2_BLOCK_MAGIC) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:254:54: note: Left side of '||' is true
           if (hdr->magic =3D=3D cpu_to_be32(XFS_DIR2_BLOCK_MAGIC) ||
                                                               ^
   fs/xfs/libxfs/xfs_dir2_data.c:256:27: note: Access to field 'count' resu=
lts in a dereference of a null pointer (loaded from variable 'btp')
                   for (i =3D stale =3D 0; i < be32_to_cpu(btp->count); i++=
) {
                                           ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:58: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                                                            ^~
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
>> fs/proc/proc_sysctl.c:1285:2: warning: Value stored to 'link_name' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           link_name +=3D strlen(table->procname) + 1;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1285:2: note: Value stored to 'link_name' is never=
 read
           link_name +=3D strlen(table->procname) + 1;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1378:3: warning: Value stored to 'link' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   link =3D find_entry(&head, dir, procname, strlen(procnam=
e));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1378:3: note: Value stored to 'link' is never read
                   link =3D find_entry(&head, dir, procname, strlen(procnam=
e));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   drivers/base/module.c:62:2: warning: Value stored to 'no_warn' is never =
read [clang-analyzer-deadcode.DeadStores]
           no_warn =3D sysfs_create_link(&drv->p->kobj, &mk->kobj, "module"=
);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/module.c:62:2: note: Value stored to 'no_warn' is never read
           no_warn =3D sysfs_create_link(&drv->p->kobj, &mk->kobj, "module"=
);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/module.c:66:3: warning: Value stored to 'no_warn' is never =
read [clang-analyzer-deadcode.DeadStores]
                   no_warn =3D sysfs_create_link(mk->drivers_dir, &drv->p->=
kobj,
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/base/module.c:66:3: note: Value stored to 'no_warn' is never read
                   no_warn =3D sysfs_create_link(mk->drivers_dir, &drv->p->=
kobj,
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/base/regmap/regmap.c:1935:2: warning: Called function pointer is=
 null (null dereference) [clang-analyzer-core.CallAndMessage]
           map->format.format_val(map->work_buf + map->format.reg_bytes
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap.c:1933:10: note: Assuming field 'bus' is non-=
null
           WARN_ON(!map->bus || !map->format.format_val);
                   ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/base/regmap/regmap.c:1933:10: note: Left side of '||' is false
           WARN_ON(!map->bus || !map->format.format_val);
                   ^
   drivers/base/regmap/regmap.c:1933:23: note: Assuming field 'format_val' =
is null
           WARN_ON(!map->bus || !map->format.format_val);
                                ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/base/regmap/regmap.c:1933:2: note: Taking true branch
           WARN_ON(!map->bus || !map->format.format_val);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/base/regmap/regmap.c:1933:2: note: Loop condition is false.  Exi=
ting loop
           WARN_ON(!map->bus || !map->format.format_val);
           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:82:2: note: expanded from macro '__WARN_FLAGS'
           _BUG_FLAGS(ASM_UD2, f, ASM_REACHABLE);                  \
           ^
   arch/x86/include/asm/bug.h:25:43: note: expanded from macro '_BUG_FLAGS'
   #define _BUG_FLAGS(ins, flags, extra)                                   \
                                                                           ^
   drivers/base/regmap/regmap.c:1933:2: note: Loop condition is false.  Exi=
ting loop
           WARN_ON(!map->bus || !map->format.format_val);
           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:78:33: note: expanded from macro '__WARN_FLAG=
S'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   drivers/base/regmap/regmap.c:1935:2: note: Called function pointer is nu=
ll (null dereference)
           map->format.format_val(map->work_buf + map->format.reg_bytes
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/base/regmap/regmap.c:1247:2: note: Calling 'regmap_exit'
           regmap_exit(*(struct regmap **)res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap.c:1522:6: note: Assuming field 'bus' is null
           if (map->bus && map->bus->free_context)

vim +/link_name +1285 fs/proc/proc_sysctl.c

1f87f0b52b1d65 Eric W. Biederman 2012-01-06  1256  =

867428d5e752b1 Meng Tang         2022-03-02  1257  static struct ctl_table_=
header *new_links_single(struct ctl_dir *dir, struct ctl_table *table,
867428d5e752b1 Meng Tang         2022-03-02  1258  	struct ctl_table_root *=
link_root)
867428d5e752b1 Meng Tang         2022-03-02  1259  {
867428d5e752b1 Meng Tang         2022-03-02  1260  	struct ctl_table *link_=
table;
867428d5e752b1 Meng Tang         2022-03-02  1261  	struct ctl_table_header=
 *links;
867428d5e752b1 Meng Tang         2022-03-02  1262  	struct ctl_node *node;
867428d5e752b1 Meng Tang         2022-03-02  1263  	char *link_name;
867428d5e752b1 Meng Tang         2022-03-02  1264  	int name_bytes =3D 0;
867428d5e752b1 Meng Tang         2022-03-02  1265  =

867428d5e752b1 Meng Tang         2022-03-02  1266  	name_bytes +=3D strlen(=
table->procname) + 1;
867428d5e752b1 Meng Tang         2022-03-02  1267  =

867428d5e752b1 Meng Tang         2022-03-02  1268  	links =3D kzalloc(sizeo=
f(struct ctl_table_header) +
867428d5e752b1 Meng Tang         2022-03-02  1269  			sizeof(struct ctl_nod=
e) +
867428d5e752b1 Meng Tang         2022-03-02  1270  			sizeof(struct ctl_tab=
le)*2 +
867428d5e752b1 Meng Tang         2022-03-02  1271  			name_bytes,
867428d5e752b1 Meng Tang         2022-03-02  1272  			GFP_KERNEL);
867428d5e752b1 Meng Tang         2022-03-02  1273  =

867428d5e752b1 Meng Tang         2022-03-02  1274  	if (!links)
867428d5e752b1 Meng Tang         2022-03-02  1275  		return NULL;
867428d5e752b1 Meng Tang         2022-03-02  1276  =

867428d5e752b1 Meng Tang         2022-03-02  1277  	node =3D (struct ctl_no=
de *)(links + 1);
867428d5e752b1 Meng Tang         2022-03-02  1278  	link_table =3D (struct =
ctl_table *)(node + 1);
867428d5e752b1 Meng Tang         2022-03-02  1279  	link_name =3D (char *)&=
link_table[2];
867428d5e752b1 Meng Tang         2022-03-02  1280  =

867428d5e752b1 Meng Tang         2022-03-02  1281  	memcpy(link_name, table=
->procname, strlen(table->procname) + 1);
867428d5e752b1 Meng Tang         2022-03-02  1282  	link_table->procname =
=3D link_name;
867428d5e752b1 Meng Tang         2022-03-02  1283  	link_table->mode =3D S_=
IFLNK|S_IRWXUGO;
867428d5e752b1 Meng Tang         2022-03-02  1284  	link_table->data =3D li=
nk_root;
867428d5e752b1 Meng Tang         2022-03-02 @1285  	link_name +=3D strlen(t=
able->procname) + 1;
867428d5e752b1 Meng Tang         2022-03-02  1286  =

867428d5e752b1 Meng Tang         2022-03-02  1287  	init_header_single(link=
s, dir->header.root, dir->header.set, node, link_table);
867428d5e752b1 Meng Tang         2022-03-02  1288  	links->nreg =3D 1;
867428d5e752b1 Meng Tang         2022-03-02  1289  =

867428d5e752b1 Meng Tang         2022-03-02  1290  	return links;
867428d5e752b1 Meng Tang         2022-03-02  1291  }
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1292  static struct ctl_table_=
header *new_links(struct ctl_dir *dir, struct ctl_table *table,
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1293  	struct ctl_table_root *=
link_root)
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1294  {
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1295  	struct ctl_table *link_=
table, *entry, *link;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1296  	struct ctl_table_header=
 *links;
ac13ac6f4c6c05 Eric W. Biederman 2012-01-09  1297  	struct ctl_node *node;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1298  	char *link_name;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1299  	int nr_entries, name_by=
tes;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1300  =

0e47c99d7fe25e Eric W. Biederman 2012-01-07  1301  	name_bytes =3D 0;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1302  	nr_entries =3D 0;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1303  	for (entry =3D table; e=
ntry->procname; entry++) {
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1304  		nr_entries++;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1305  		name_bytes +=3D strlen=
(entry->procname) + 1;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1306  	}
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1307  =

0e47c99d7fe25e Eric W. Biederman 2012-01-07  1308  	links =3D kzalloc(sizeo=
f(struct ctl_table_header) +
ac13ac6f4c6c05 Eric W. Biederman 2012-01-09  1309  			sizeof(struct ctl_nod=
e)*nr_entries +
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1310  			sizeof(struct ctl_tab=
le)*(nr_entries + 1) +
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1311  			name_bytes,
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1312  			GFP_KERNEL);
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1313  =

0e47c99d7fe25e Eric W. Biederman 2012-01-07  1314  	if (!links)
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1315  		return NULL;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1316  =

ac13ac6f4c6c05 Eric W. Biederman 2012-01-09  1317  	node =3D (struct ctl_no=
de *)(links + 1);
ac13ac6f4c6c05 Eric W. Biederman 2012-01-09  1318  	link_table =3D (struct =
ctl_table *)(node + nr_entries);
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1319  	link_name =3D (char *)&=
link_table[nr_entries + 1];
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1320  =

0e47c99d7fe25e Eric W. Biederman 2012-01-07  1321  	for (link =3D link_tabl=
e, entry =3D table; entry->procname; link++, entry++) {
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1322  		int len =3D strlen(ent=
ry->procname) + 1;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1323  		memcpy(link_name, entr=
y->procname, len);
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1324  		link->procname =3D lin=
k_name;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1325  		link->mode =3D S_IFLNK=
|S_IRWXUGO;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1326  		link->data =3D link_ro=
ot;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1327  		link_name +=3D len;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1328  	}
ac13ac6f4c6c05 Eric W. Biederman 2012-01-09  1329  	init_header(links, dir-=
>header.root, dir->header.set, node, link_table);
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1330  	links->nreg =3D nr_entr=
ies;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1331  =

0e47c99d7fe25e Eric W. Biederman 2012-01-07  1332  	return links;
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1333  }
0e47c99d7fe25e Eric W. Biederman 2012-01-07  1334  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3823410323049559953==--


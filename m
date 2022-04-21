Content-Type: multipart/mixed; boundary="===============0227685858819493172=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ntfs3/attrib.c:1353:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Thu, 21 Apr 2022 14:32:07 +0800
Message-ID: <202204202014.95CrpH92-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0227685858819493172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   559089e0a93d44280ec3ab478830af319c56dbe3
commit: 6e5be40d32fb1907285277c02e74493ed43d77fe fs/ntfs3: Add NTFS3 in fs/=
Kconfig and fs/Makefile
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-c006-20220420 (https://download.01.org/0day-ci/arc=
hive/20220420/202204202014.95CrpH92-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd=
5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6e5be40d32fb1907285277c02e74493ed43d77fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6e5be40d32fb1907285277c02e74493ed43d77fe
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/ntfs3/attrib.c:519:6: note: Assuming 'new_size' is <=3D 'old_size'
           if (new_size > old_size) {
               ^~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:519:2: note: Taking false branch
           if (new_size > old_size) {
           ^
   fs/ntfs3/attrib.c:686:6: note: Assuming 'new_size' is not equal to 'old_=
size'
           if (new_size !=3D old_size ||
               ^~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:686:27: note: Left side of '||' is true
           if (new_size !=3D old_size ||
                                    ^
   fs/ntfs3/attrib.c:688:9: note: Assuming '__UNIQUE_ID___x275' is <=3D '__=
UNIQUE_ID___y276'
                   vcn =3D max(svcn, new_alen);
                         ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/ntfs3/attrib.c:688:9: note: '?' condition is false
                   vcn =3D max(svcn, new_alen);
                         ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/ntfs3/attrib.c:694:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/ntfs3/attrib.c:694:3: note: Taking false branch
                   if (err)
                   ^
   fs/ntfs3/attrib.c:699:7: note: Assuming 'vcn' is <=3D 'svcn'
                   if (vcn > svcn) {
                       ^~~~~~~~~~
   fs/ntfs3/attrib.c:699:3: note: Taking false branch
                   if (vcn > svcn) {
                   ^
   fs/ntfs3/attrib.c:703:14: note: Assuming 'le' is null
                   } else if (le && le->vcn) {
                              ^~
   fs/ntfs3/attrib.c:703:17: note: Left side of '&&' is false
                   } else if (le && le->vcn) {
                                 ^
   fs/ntfs3/attrib.c:728:7: note: 'vcn' is equal to 'new_alen'
                   if (vcn =3D=3D new_alen) {
                       ^~~
   fs/ntfs3/attrib.c:728:3: note: Taking true branch
                   if (vcn =3D=3D new_alen) {
                   ^
   fs/ntfs3/attrib.c:730:8: note: Assuming 'new_size' is >=3D 'old_valid'
                           if (new_size < old_valid)
                               ^~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:730:4: note: Taking false branch
                           if (new_size < old_valid)
                           ^
   fs/ntfs3/attrib.c:744:7: note: 'is_ext' is false
                   if (is_ext)
                       ^~~~~~
   fs/ntfs3/attrib.c:744:3: note: Taking false branch
                   if (is_ext)
                   ^
   fs/ntfs3/attrib.c:750:7: note: Assuming 'new_alloc_tmp' is > 'new_alloc'
                   if (new_alloc_tmp <=3D new_alloc)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:750:3: note: Taking false branch
                   if (new_alloc_tmp <=3D new_alloc)
                   ^
   fs/ntfs3/attrib.c:756:7: note: 'le' is not equal to 'le_b'
                   if (le =3D=3D le_b) {
                       ^~
   fs/ntfs3/attrib.c:756:3: note: Taking false branch
                   if (le =3D=3D le_b) {
                   ^
   fs/ntfs3/attrib.c:764:7: note: Access to field 'type' results in a deref=
erence of a null pointer (loaded from variable 'le')
                   if (le->type !=3D type || le->name_len !=3D name_len ||
                       ^~
   fs/ntfs3/attrib.c:1191:7: warning: Value stored to 'vcn' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           CLST vcn =3D from >> cluster_bits;
                ^~~   ~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1191:7: note: Value stored to 'vcn' during its initial=
ization is never read
           CLST vcn =3D from >> cluster_bits;
                ^~~   ~~~~~~~~~~~~~~~~~~~~
>> fs/ntfs3/attrib.c:1353:2: warning: Undefined or garbage value returned t=
o caller [clang-analyzer-core.uninitialized.UndefReturn]
           return err;
           ^      ~~~
   fs/ntfs3/attrib.c:1225:9: note: 'err' declared without an initial value
           int i, err;
                  ^~~
   fs/ntfs3/attrib.c:1229:6: note: Assuming field 'i_size' is >=3D 42949672=
96
           if (ni->vfs_inode.i_size < 0x100000000ull) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1229:2: note: Taking false branch
           if (ni->vfs_inode.i_size < 0x100000000ull) {
           ^
   fs/ntfs3/attrib.c:1245:6: note: Assuming field 'non_res' is not equal to=
 0
           if (!attr->non_res) {
               ^~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1245:2: note: Taking false branch
           if (!attr->non_res) {
           ^
   fs/ntfs3/attrib.c:1270:6: note: Assuming 'page' is non-null
           if (!page) {
               ^~~~~
   fs/ntfs3/attrib.c:1270:2: note: Taking false branch
           if (!page) {
           ^
   fs/ntfs3/attrib.c:1282:6: note: Assuming the condition is false
           if (vbo[1]) {
               ^~~~~~
   fs/ntfs3/attrib.c:1282:2: note: Taking false branch
           if (vbo[1]) {
           ^
   fs/ntfs3/attrib.c:1296:7: note: Assuming 'index' is equal to field 'inde=
x'
                   if (index !=3D page->index) {
                       ^~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1296:3: note: Taking false branch
                   if (index !=3D page->index) {
                   ^
   fs/ntfs3/attrib.c:1315:7: note: 'i' is 1
                   if (i) {
                       ^
   fs/ntfs3/attrib.c:1315:3: note: Taking true branch
                   if (i) {
                   ^
   fs/ntfs3/attrib.c:1316:4: note: Taking false branch
                           if (bytes_per_off =3D=3D sizeof(__le32)) {
                           ^
   fs/ntfs3/attrib.c:1293:2: note: Loop condition is false.  Exiting loop
           do {
           ^
   fs/ntfs3/attrib.c:1353:2: note: Undefined or garbage value returned to c=
aller
           return err;
           ^      ~~~
   fs/ntfs3/attrib.c:1678:15: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           valid_size =3D le64_to_cpu(attr_b->nres.valid_size);
                        ^
   include/linux/byteorder/generic.h:87:21: note: expanded from macro 'le64=
_to_cpu'
   #define le64_to_cpu __le64_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:32:50: note: expanded from =
macro '__le64_to_cpu'
   #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
                                                    ^~~
   fs/ntfs3/attrib.c:1482:6: note: Assuming 'attr_b' is non-null
           if (!attr_b)
               ^~~~~~~
   fs/ntfs3/attrib.c:1482:2: note: Taking false branch
           if (!attr_b)
           ^
   fs/ntfs3/attrib.c:1485:6: note: Assuming the condition is false
           if (!is_attr_ext(attr_b))
               ^~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1485:2: note: Taking false branch
           if (!is_attr_ext(attr_b))
           ^
   fs/ntfs3/attrib.c:1495:6: note: Assuming 'svcn' is > 'vcn'
           if (svcn <=3D vcn && vcn < evcn1) {
               ^~~~~~~~~~~
   fs/ntfs3/attrib.c:1495:18: note: Left side of '&&' is false
           if (svcn <=3D vcn && vcn < evcn1) {
                           ^
   fs/ntfs3/attrib.c:1499:13: note: Assuming 'le_b' is non-null
           } else if (!le_b) {
                      ^~~~~
   fs/ntfs3/attrib.c:1499:9: note: Taking false branch
           } else if (!le_b) {
                  ^
   fs/ntfs3/attrib.c:1506:7: note: Assuming 'attr' is non-null
                   if (!attr) {
                       ^~~~~
   fs/ntfs3/attrib.c:1506:3: note: Taking false branch
                   if (!attr) {
                   ^
   fs/ntfs3/attrib.c:1515:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/ntfs3/attrib.c:1515:2: note: Taking false branch
           if (err)
           ^
   fs/ntfs3/attrib.c:1518:8: note: Calling 'attr_is_frame_compressed'
           err =3D attr_is_frame_compressed(ni, attr_b, frame, &clst_data);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1373:6: note: Assuming the condition is false
           if (!is_attr_compressed(attr))

vim +1353 fs/ntfs3/attrib.c

be71b5cba2e648 Konstantin Komarov 2021-08-13  1208  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1209  #ifdef CONFIG_NTFS3_LZX=
_XPRESS
be71b5cba2e648 Konstantin Komarov 2021-08-13  1210  /*
be71b5cba2e648 Konstantin Komarov 2021-08-13  1211   * attr_wof_frame_info
be71b5cba2e648 Konstantin Komarov 2021-08-13  1212   *
be71b5cba2e648 Konstantin Komarov 2021-08-13  1213   * read header of xpres=
s/lzx file to get info about frame
be71b5cba2e648 Konstantin Komarov 2021-08-13  1214   */
be71b5cba2e648 Konstantin Komarov 2021-08-13  1215  int attr_wof_frame_info=
(struct ntfs_inode *ni, struct ATTRIB *attr,
be71b5cba2e648 Konstantin Komarov 2021-08-13  1216  			struct runs_tree *ru=
n, u64 frame, u64 frames,
be71b5cba2e648 Konstantin Komarov 2021-08-13  1217  			u8 frame_bits, u32 *=
ondisk_size, u64 *vbo_data)
be71b5cba2e648 Konstantin Komarov 2021-08-13  1218  {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1219  	struct ntfs_sb_info *s=
bi =3D ni->mi.sbi;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1220  	u64 vbo[2], off[2], wo=
f_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1221  	u32 voff;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1222  	u8 bytes_per_off;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1223  	char *addr;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1224  	struct page *page;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1225  	int i, err;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1226  	__le32 *off32;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1227  	__le64 *off64;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1228  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1229  	if (ni->vfs_inode.i_si=
ze < 0x100000000ull) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1230  		/* file starts with a=
rray of 32 bit offsets */
be71b5cba2e648 Konstantin Komarov 2021-08-13  1231  		bytes_per_off =3D siz=
eof(__le32);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1232  		vbo[1] =3D frame << 2;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1233  		*vbo_data =3D frames =
<< 2;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1234  	} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1235  		/* file starts with a=
rray of 64 bit offsets */
be71b5cba2e648 Konstantin Komarov 2021-08-13  1236  		bytes_per_off =3D siz=
eof(__le64);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1237  		vbo[1] =3D frame << 3;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1238  		*vbo_data =3D frames =
<< 3;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1239  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1240  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1241  	/*
be71b5cba2e648 Konstantin Komarov 2021-08-13  1242  	 * read 4/8 bytes at [=
vbo - 4(8)] =3D=3D offset where compressed frame starts
be71b5cba2e648 Konstantin Komarov 2021-08-13  1243  	 * read 4/8 bytes@[=
vbo] =3D=3D offset where compressed frame ends
be71b5cba2e648 Konstantin Komarov 2021-08-13  1244  	 */
be71b5cba2e648 Konstantin Komarov 2021-08-13  1245  	if (!attr->non_res) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1246  		if (vbo[1] + bytes_pe=
r_off > le32_to_cpu(attr->res.data_size)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1247  			ntfs_inode_err(&ni->=
vfs_inode, "is corrupted");
be71b5cba2e648 Konstantin Komarov 2021-08-13  1248  			return -EINVAL;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1249  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1250  		addr =3D resident_dat=
a(attr);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1251  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1252  		if (bytes_per_off =3D=
=3D sizeof(__le32)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1253  			off32 =3D Add2Ptr(ad=
dr, vbo[1]);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1254  			off[0] =3D vbo[1] ? =
le32_to_cpu(off32[-1]) : 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1255  			off[1] =3D le32_to_c=
pu(off32[0]);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1256  		} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1257  			off64 =3D Add2Ptr(ad=
dr, vbo[1]);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1258  			off[0] =3D vbo[1] ? =
le64_to_cpu(off64[-1]) : 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1259  			off[1] =3D le64_to_c=
pu(off64[0]);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1260  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1261  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1262  		*vbo_data +=3D off[0];
be71b5cba2e648 Konstantin Komarov 2021-08-13  1263  		*ondisk_size =3D off[=
1] - off[0];
be71b5cba2e648 Konstantin Komarov 2021-08-13  1264  		return 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1265  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1266  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1267  	wof_size =3D le64_to_c=
pu(attr->nres.data_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1268  	down_write(&ni->file.r=
un_lock);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1269  	page =3D ni->file.offs=
_page;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1270  	if (!page) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1271  		page =3D alloc_page(G=
FP_KERNEL);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1272  		if (!page) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1273  			err =3D -ENOMEM;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1274  			goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1275  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1276  		page->index =3D -1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1277  		ni->file.offs_page =
=3D page;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1278  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1279  	lock_page(page);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1280  	addr =3D page_address(=
page);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1281  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1282  	if (vbo[1]) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1283  		voff =3D vbo[1] & (PA=
GE_SIZE - 1);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1284  		vbo[0] =3D vbo[1] - b=
ytes_per_off;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1285  		i =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1286  	} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1287  		voff =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1288  		vbo[0] =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1289  		off[0] =3D 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1290  		i =3D 1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1291  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1292  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1293  	do {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1294  		pgoff_t index =3D vbo=
[i] >> PAGE_SHIFT;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1295  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1296  		if (index !=3D page->=
index) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1297  			u64 from =3D vbo[i] =
& ~(u64)(PAGE_SIZE - 1);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1298  			u64 to =3D min(from =
+ PAGE_SIZE, wof_size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1299  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1300  			err =3D attr_load_ru=
ns_range(ni, ATTR_DATA, WOF_NAME,
be71b5cba2e648 Konstantin Komarov 2021-08-13  1301  						   ARRAY_SIZE(WOF=
_NAME), run,
be71b5cba2e648 Konstantin Komarov 2021-08-13  1302  						   from, to);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1303  			if (err)
be71b5cba2e648 Konstantin Komarov 2021-08-13  1304  				goto out1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1305  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1306  			err =3D ntfs_bio_pag=
es(sbi, run, &page, 1, from,
be71b5cba2e648 Konstantin Komarov 2021-08-13  1307  					     to - from, RE=
Q_OP_READ);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1308  			if (err) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1309  				page->index =3D -1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1310  				goto out1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1311  			}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1312  			page->index =3D inde=
x;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1313  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1314  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1315  		if (i) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1316  			if (bytes_per_off =
=3D=3D sizeof(__le32)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1317  				off32 =3D Add2Ptr(a=
ddr, voff);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1318  				off[1] =3D le32_to_=
cpu(*off32);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1319  			} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1320  				off64 =3D Add2Ptr(a=
ddr, voff);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1321  				off[1] =3D le64_to_=
cpu(*off64);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1322  			}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1323  		} else if (!voff) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1324  			if (bytes_per_off =
=3D=3D sizeof(__le32)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1325  				off32 =3D Add2Ptr(a=
ddr, PAGE_SIZE - sizeof(u32));
be71b5cba2e648 Konstantin Komarov 2021-08-13  1326  				off[0] =3D le32_to_=
cpu(*off32);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1327  			} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1328  				off64 =3D Add2Ptr(a=
ddr, PAGE_SIZE - sizeof(u64));
be71b5cba2e648 Konstantin Komarov 2021-08-13  1329  				off[0] =3D le64_to_=
cpu(*off64);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1330  			}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1331  		} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1332  			/* two values in one=
 page*/
be71b5cba2e648 Konstantin Komarov 2021-08-13  1333  			if (bytes_per_off =
=3D=3D sizeof(__le32)) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1334  				off32 =3D Add2Ptr(a=
ddr, voff);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1335  				off[0] =3D le32_to_=
cpu(off32[-1]);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1336  				off[1] =3D le32_to_=
cpu(off32[0]);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1337  			} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  1338  				off64 =3D Add2Ptr(a=
ddr, voff);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1339  				off[0] =3D le64_to_=
cpu(off64[-1]);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1340  				off[1] =3D le64_to_=
cpu(off64[0]);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1341  			}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1342  			break;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1343  		}
be71b5cba2e648 Konstantin Komarov 2021-08-13  1344  	} while (++i < 2);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1345  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1346  	*vbo_data +=3D off[0];
be71b5cba2e648 Konstantin Komarov 2021-08-13  1347  	*ondisk_size =3D off[1=
] - off[0];
be71b5cba2e648 Konstantin Komarov 2021-08-13  1348  =

be71b5cba2e648 Konstantin Komarov 2021-08-13  1349  out1:
be71b5cba2e648 Konstantin Komarov 2021-08-13  1350  	unlock_page(page);
be71b5cba2e648 Konstantin Komarov 2021-08-13  1351  out:
be71b5cba2e648 Konstantin Komarov 2021-08-13  1352  	up_write(&ni->file.run=
_lock);
be71b5cba2e648 Konstantin Komarov 2021-08-13 @1353  	return err;
be71b5cba2e648 Konstantin Komarov 2021-08-13  1354  }
be71b5cba2e648 Konstantin Komarov 2021-08-13  1355  #endif
be71b5cba2e648 Konstantin Komarov 2021-08-13  1356  =


:::::: The code at line 1353 was first introduced by commit
:::::: be71b5cba2e6485e8959da7a9f9a44461a1bb074 fs/ntfs3: Add attrib operat=
ions

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0227685858819493172==--


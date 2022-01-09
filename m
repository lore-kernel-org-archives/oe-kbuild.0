Content-Type: multipart/mixed; boundary="===============1211635797691584252=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9819/11475] fs/ext4/inline.c:1386:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 10 Jan 2022 01:39:58 +0800
Message-ID: <202201092231.r3IcMO6o-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1211635797691584252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: NeilBrown <neilb@suse.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b8170452cd5121b11a5726e3ea8dbdfc2d74e771
commit: 92e2a32ff989d9655dd51a049d231757d2bcb27b [9819/11475] mm: introduce=
 memalloc_retry_wait()
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: riscv-randconfig-c006-20220109 (https://download.01.org/0day-ci/arc=
hive/20220109/202201092231.r3IcMO6o-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344=
d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D92e2a32ff989d9655dd51a049d231757d2bcb27b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 92e2a32ff989d9655dd51a049d231757d2bcb27b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/ext4/inline.c:1234:2: note: Taking false branch
           if (!data_bh) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inline.c:1242:2: note: Assuming 'error' is 0
           if (error) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/inline.c:1242:2: note: '?' condition is false
           if (error) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/inline.c:1242:6: note: 'error' is 0
           if (error) {
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
   fs/ext4/inline.c:1242:2: note: '?' condition is false
           if (error) {
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
   fs/ext4/inline.c:1242:2: note: Taking false branch
           if (error) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inline.c:1249:7: note: Assuming the condition is true
           if (!S_ISDIR(inode->i_mode)) {
                ^
   include/uapi/linux/stat.h:23:21: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/inline.c:1249:2: note: '?' condition is false
           if (!S_ISDIR(inode->i_mode)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/inline.c:1249:2: note: '?' condition is false
           if (!S_ISDIR(inode->i_mode)) {
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
   fs/ext4/inline.c:1249:2: note: Taking false branch
           if (!S_ISDIR(inode->i_mode)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inline.c:1255:11: note: Calling 'ext4_finish_convert_inline_dir'
                   error =3D ext4_finish_convert_inline_dir(handle, inode, =
data_bh,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/ext4/inline.c:1156:7: note: 5th function call argument is an uninitia=
lized value
           de =3D ext4_init_dot_dotdot(inode, de,
                ^
>> fs/ext4/inline.c:1386:13: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
           parent_ino =3D le32_to_cpu(((struct ext4_dir_entry_2 *)dir_buf)-=
>inode);
                      ^
   fs/ext4/inline.c:1362:2: note: Assuming 'ret' is 0
           if (ret)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/inline.c:1362:2: note: '?' condition is false
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/inline.c:1362:6: note: 'ret' is 0
           if (ret)
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
   fs/ext4/inline.c:1362:2: note: '?' condition is false
           if (ret)
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
   fs/ext4/inline.c:1362:2: note: Taking false branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inline.c:1366:6: note: Assuming the condition is false
           if (!ext4_has_inline_data(inode)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/inline.c:1366:2: note: '?' condition is false
           if (!ext4_has_inline_data(inode)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/inline.c:1366:2: note: '?' condition is false
           if (!ext4_has_inline_data(inode)) {
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
   fs/ext4/inline.c:1366:2: note: Taking false branch
           if (!ext4_has_inline_data(inode)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inline.c:1373:12: note: Uninitialized value stored to field 'ino=
de'
           dir_buf =3D kmalloc(inline_size, GFP_NOFS);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inline.c:1374:6: note: Assuming 'dir_buf' is non-null
           if (!dir_buf) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/inline.c:1374:2: note: '?' condition is false
           if (!dir_buf) {

vim +1386 fs/ext4/inline.c

3c47d54170b6a6 Tao Ma                  2012-12-10  1338  =

8af0f082279770 Tao Ma                  2013-04-19  1339  /*
8af0f082279770 Tao Ma                  2013-04-19  1340   * This function f=
ills a red-black tree with information from an
8af0f082279770 Tao Ma                  2013-04-19  1341   * inlined dir.  I=
t returns the number directory entries loaded
8af0f082279770 Tao Ma                  2013-04-19  1342   * into the tree. =
 If there is an error it is returned in err.
8af0f082279770 Tao Ma                  2013-04-19  1343   */
7633b08b275051 Theodore Ts'o           2019-06-21  1344  int ext4_inlinedir=
_to_tree(struct file *dir_file,
8af0f082279770 Tao Ma                  2013-04-19  1345  			   struct inode=
 *dir, ext4_lblk_t block,
8af0f082279770 Tao Ma                  2013-04-19  1346  			   struct dx_ha=
sh_info *hinfo,
8af0f082279770 Tao Ma                  2013-04-19  1347  			   __u32 start_=
hash, __u32 start_minor_hash,
8af0f082279770 Tao Ma                  2013-04-19  1348  			   int *has_inl=
ine_data)
8af0f082279770 Tao Ma                  2013-04-19  1349  {
8af0f082279770 Tao Ma                  2013-04-19  1350  	int err =3D 0, co=
unt =3D 0;
8af0f082279770 Tao Ma                  2013-04-19  1351  	unsigned int pare=
nt_ino;
8af0f082279770 Tao Ma                  2013-04-19  1352  	int pos;
8af0f082279770 Tao Ma                  2013-04-19  1353  	struct ext4_dir_e=
ntry_2 *de;
8af0f082279770 Tao Ma                  2013-04-19  1354  	struct inode *ino=
de =3D file_inode(dir_file);
8af0f082279770 Tao Ma                  2013-04-19  1355  	int ret, inline_s=
ize =3D 0;
8af0f082279770 Tao Ma                  2013-04-19  1356  	struct ext4_iloc =
iloc;
8af0f082279770 Tao Ma                  2013-04-19  1357  	void *dir_buf =3D=
 NULL;
8af0f082279770 Tao Ma                  2013-04-19  1358  	struct ext4_dir_e=
ntry_2 fake;
a7550b30ab709f Jaegeuk Kim             2016-07-10  1359  	struct fscrypt_st=
r tmp_str;
8af0f082279770 Tao Ma                  2013-04-19  1360  =

8af0f082279770 Tao Ma                  2013-04-19  1361  	ret =3D ext4_get_=
inode_loc(inode, &iloc);
8af0f082279770 Tao Ma                  2013-04-19  1362  	if (ret)
8af0f082279770 Tao Ma                  2013-04-19  1363  		return ret;
8af0f082279770 Tao Ma                  2013-04-19  1364  =

8af0f082279770 Tao Ma                  2013-04-19  1365  	down_read(&EXT4_I=
(inode)->xattr_sem);
8af0f082279770 Tao Ma                  2013-04-19  1366  	if (!ext4_has_inl=
ine_data(inode)) {
8af0f082279770 Tao Ma                  2013-04-19  1367  		up_read(&EXT4_I(=
inode)->xattr_sem);
8af0f082279770 Tao Ma                  2013-04-19  1368  		*has_inline_data=
 =3D 0;
8af0f082279770 Tao Ma                  2013-04-19  1369  		goto out;
8af0f082279770 Tao Ma                  2013-04-19  1370  	}
8af0f082279770 Tao Ma                  2013-04-19  1371  =

8af0f082279770 Tao Ma                  2013-04-19  1372  	inline_size =3D e=
xt4_get_inline_size(inode);
8af0f082279770 Tao Ma                  2013-04-19  1373  	dir_buf =3D kmall=
oc(inline_size, GFP_NOFS);
8af0f082279770 Tao Ma                  2013-04-19  1374  	if (!dir_buf) {
8af0f082279770 Tao Ma                  2013-04-19  1375  		ret =3D -ENOMEM;
8af0f082279770 Tao Ma                  2013-04-19  1376  		up_read(&EXT4_I(=
inode)->xattr_sem);
8af0f082279770 Tao Ma                  2013-04-19  1377  		goto out;
8af0f082279770 Tao Ma                  2013-04-19  1378  	}
8af0f082279770 Tao Ma                  2013-04-19  1379  =

8af0f082279770 Tao Ma                  2013-04-19  1380  	ret =3D ext4_read=
_inline_data(inode, dir_buf, inline_size, &iloc);
8af0f082279770 Tao Ma                  2013-04-19  1381  	up_read(&EXT4_I(i=
node)->xattr_sem);
8af0f082279770 Tao Ma                  2013-04-19  1382  	if (ret < 0)
8af0f082279770 Tao Ma                  2013-04-19  1383  		goto out;
8af0f082279770 Tao Ma                  2013-04-19  1384  =

8af0f082279770 Tao Ma                  2013-04-19  1385  	pos =3D 0;
8af0f082279770 Tao Ma                  2013-04-19 @1386  	parent_ino =3D le=
32_to_cpu(((struct ext4_dir_entry_2 *)dir_buf)->inode);
8af0f082279770 Tao Ma                  2013-04-19  1387  	while (pos < inli=
ne_size) {
8af0f082279770 Tao Ma                  2013-04-19  1388  		/*
8af0f082279770 Tao Ma                  2013-04-19  1389  		 * As inlined di=
r doesn't store any information about '.' and
8af0f082279770 Tao Ma                  2013-04-19  1390  		 * only the inod=
e number of '..' is stored, we have to handle
8af0f082279770 Tao Ma                  2013-04-19  1391  		 * them differen=
tly.
8af0f082279770 Tao Ma                  2013-04-19  1392  		 */
8af0f082279770 Tao Ma                  2013-04-19  1393  		if (pos =3D=3D 0=
) {
8af0f082279770 Tao Ma                  2013-04-19  1394  			fake.inode =3D =
cpu_to_le32(inode->i_ino);
8af0f082279770 Tao Ma                  2013-04-19  1395  			fake.name_len =
=3D 1;
8af0f082279770 Tao Ma                  2013-04-19  1396  			strcpy(fake.nam=
e, ".");
8af0f082279770 Tao Ma                  2013-04-19  1397  			fake.rec_len =
=3D ext4_rec_len_to_disk(
471fbbea7ff706 Daniel Rosenberg        2021-03-19  1398  					  ext4_dir_re=
c_len(fake.name_len, NULL),
8af0f082279770 Tao Ma                  2013-04-19  1399  					  inline_size=
);
8af0f082279770 Tao Ma                  2013-04-19  1400  			ext4_set_de_typ=
e(inode->i_sb, &fake, S_IFDIR);
8af0f082279770 Tao Ma                  2013-04-19  1401  			de =3D &fake;
8af0f082279770 Tao Ma                  2013-04-19  1402  			pos =3D EXT4_IN=
LINE_DOTDOT_OFFSET;
8af0f082279770 Tao Ma                  2013-04-19  1403  		} else if (pos =
=3D=3D EXT4_INLINE_DOTDOT_OFFSET) {
8af0f082279770 Tao Ma                  2013-04-19  1404  			fake.inode =3D =
cpu_to_le32(parent_ino);
8af0f082279770 Tao Ma                  2013-04-19  1405  			fake.name_len =
=3D 2;
8af0f082279770 Tao Ma                  2013-04-19  1406  			strcpy(fake.nam=
e, "..");
8af0f082279770 Tao Ma                  2013-04-19  1407  			fake.rec_len =
=3D ext4_rec_len_to_disk(
471fbbea7ff706 Daniel Rosenberg        2021-03-19  1408  					  ext4_dir_re=
c_len(fake.name_len, NULL),
8af0f082279770 Tao Ma                  2013-04-19  1409  					  inline_size=
);
8af0f082279770 Tao Ma                  2013-04-19  1410  			ext4_set_de_typ=
e(inode->i_sb, &fake, S_IFDIR);
8af0f082279770 Tao Ma                  2013-04-19  1411  			de =3D &fake;
8af0f082279770 Tao Ma                  2013-04-19  1412  			pos =3D EXT4_IN=
LINE_DOTDOT_SIZE;
8af0f082279770 Tao Ma                  2013-04-19  1413  		} else {
8af0f082279770 Tao Ma                  2013-04-19  1414  			de =3D (struct =
ext4_dir_entry_2 *)(dir_buf + pos);
8af0f082279770 Tao Ma                  2013-04-19  1415  			pos +=3D ext4_r=
ec_len_from_disk(de->rec_len, inline_size);
8af0f082279770 Tao Ma                  2013-04-19  1416  			if (ext4_check_=
dir_entry(inode, dir_file, de,
8af0f082279770 Tao Ma                  2013-04-19  1417  					 iloc.bh, dir=
_buf,
8af0f082279770 Tao Ma                  2013-04-19  1418  					 inline_size,=
 pos)) {
8af0f082279770 Tao Ma                  2013-04-19  1419  				ret =3D count;
8af0f082279770 Tao Ma                  2013-04-19  1420  				goto out;
8af0f082279770 Tao Ma                  2013-04-19  1421  			}
8af0f082279770 Tao Ma                  2013-04-19  1422  		}
8af0f082279770 Tao Ma                  2013-04-19  1423  =

471fbbea7ff706 Daniel Rosenberg        2021-03-19  1424  		if (ext4_hash_in=
_dirent(dir)) {
471fbbea7ff706 Daniel Rosenberg        2021-03-19  1425  			hinfo->hash =3D=
 EXT4_DIRENT_HASH(de);
471fbbea7ff706 Daniel Rosenberg        2021-03-19  1426  			hinfo->minor_ha=
sh =3D EXT4_DIRENT_MINOR_HASH(de);
471fbbea7ff706 Daniel Rosenberg        2021-03-19  1427  		} else {
b886ee3e778ec2 Gabriel Krisman Bertazi 2019-04-25  1428  			ext4fs_dirhash(=
dir, de->name, de->name_len, hinfo);
471fbbea7ff706 Daniel Rosenberg        2021-03-19  1429  		}
8af0f082279770 Tao Ma                  2013-04-19  1430  		if ((hinfo->hash=
 < start_hash) ||
8af0f082279770 Tao Ma                  2013-04-19  1431  		    ((hinfo->has=
h =3D=3D start_hash) &&
8af0f082279770 Tao Ma                  2013-04-19  1432  		     (hinfo->min=
or_hash < start_minor_hash)))
8af0f082279770 Tao Ma                  2013-04-19  1433  			continue;
8af0f082279770 Tao Ma                  2013-04-19  1434  		if (de->inode =
=3D=3D 0)
8af0f082279770 Tao Ma                  2013-04-19  1435  			continue;
2f61830ae33e29 Theodore Ts'o           2015-04-12  1436  		tmp_str.name =3D=
 de->name;
2f61830ae33e29 Theodore Ts'o           2015-04-12  1437  		tmp_str.len =3D =
de->name_len;
2f61830ae33e29 Theodore Ts'o           2015-04-12  1438  		err =3D ext4_htr=
ee_store_dirent(dir_file, hinfo->hash,
2f61830ae33e29 Theodore Ts'o           2015-04-12  1439  					      hinfo->=
minor_hash, de, &tmp_str);
8af0f082279770 Tao Ma                  2013-04-19  1440  		if (err) {
7a14826ede1d71 Colin Ian King          2019-08-12  1441  			ret =3D err;
8af0f082279770 Tao Ma                  2013-04-19  1442  			goto out;
8af0f082279770 Tao Ma                  2013-04-19  1443  		}
8af0f082279770 Tao Ma                  2013-04-19  1444  		count++;
8af0f082279770 Tao Ma                  2013-04-19  1445  	}
8af0f082279770 Tao Ma                  2013-04-19  1446  	ret =3D count;
8af0f082279770 Tao Ma                  2013-04-19  1447  out:
8af0f082279770 Tao Ma                  2013-04-19  1448  	kfree(dir_buf);
8af0f082279770 Tao Ma                  2013-04-19  1449  	brelse(iloc.bh);
8af0f082279770 Tao Ma                  2013-04-19  1450  	return ret;
8af0f082279770 Tao Ma                  2013-04-19  1451  }
8af0f082279770 Tao Ma                  2013-04-19  1452  =


:::::: The code at line 1386 was first introduced by commit
:::::: 8af0f08227977079f8f227e74d27c59db2ab84f6 ext4: fix readdir error in =
the case of inline_data+dir_index

:::::: TO: Tao Ma <boyu.mt@taobao.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1211635797691584252==--


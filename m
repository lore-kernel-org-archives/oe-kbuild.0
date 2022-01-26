Content-Type: multipart/mixed; boundary="===============6105408805479886192=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ext4/inline.c:1386:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 26 Jan 2022 21:57:19 +0800
Message-ID: <202201262135.P6ZvKkzw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6105408805479886192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: NeilBrown <neilb@suse.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 4034247a0d6ab281ba3293798ce67af494d86129 mm: introduce memalloc_ret=
ry_wait()
date:   11 days ago
:::::: branch date: 20 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
126/202201262135.P6ZvKkzw-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b713=
8a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4034247a0d6ab281ba3293798ce67af494d86129
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4034247a0d6ab281ba3293798ce67af494d86129
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


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
   fs/ext4/inline.c:1366:6: note: Assuming the condition is false
           if (!ext4_has_inline_data(inode)) {
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

vim +1386 fs/ext4/inline.c

3c47d54170b6a67 Tao Ma                  2012-12-10  1338  =

8af0f0822797707 Tao Ma                  2013-04-19  1339  /*
8af0f0822797707 Tao Ma                  2013-04-19  1340   * This function =
fills a red-black tree with information from an
8af0f0822797707 Tao Ma                  2013-04-19  1341   * inlined dir.  =
It returns the number directory entries loaded
8af0f0822797707 Tao Ma                  2013-04-19  1342   * into the tree.=
  If there is an error it is returned in err.
8af0f0822797707 Tao Ma                  2013-04-19  1343   */
7633b08b2750513 Theodore Ts'o           2019-06-21  1344  int ext4_inlinedi=
r_to_tree(struct file *dir_file,
8af0f0822797707 Tao Ma                  2013-04-19  1345  			   struct inod=
e *dir, ext4_lblk_t block,
8af0f0822797707 Tao Ma                  2013-04-19  1346  			   struct dx_h=
ash_info *hinfo,
8af0f0822797707 Tao Ma                  2013-04-19  1347  			   __u32 start=
_hash, __u32 start_minor_hash,
8af0f0822797707 Tao Ma                  2013-04-19  1348  			   int *has_in=
line_data)
8af0f0822797707 Tao Ma                  2013-04-19  1349  {
8af0f0822797707 Tao Ma                  2013-04-19  1350  	int err =3D 0, c=
ount =3D 0;
8af0f0822797707 Tao Ma                  2013-04-19  1351  	unsigned int par=
ent_ino;
8af0f0822797707 Tao Ma                  2013-04-19  1352  	int pos;
8af0f0822797707 Tao Ma                  2013-04-19  1353  	struct ext4_dir_=
entry_2 *de;
8af0f0822797707 Tao Ma                  2013-04-19  1354  	struct inode *in=
ode =3D file_inode(dir_file);
8af0f0822797707 Tao Ma                  2013-04-19  1355  	int ret, inline_=
size =3D 0;
8af0f0822797707 Tao Ma                  2013-04-19  1356  	struct ext4_iloc=
 iloc;
8af0f0822797707 Tao Ma                  2013-04-19  1357  	void *dir_buf =
=3D NULL;
8af0f0822797707 Tao Ma                  2013-04-19  1358  	struct ext4_dir_=
entry_2 fake;
a7550b30ab709ff Jaegeuk Kim             2016-07-10  1359  	struct fscrypt_s=
tr tmp_str;
8af0f0822797707 Tao Ma                  2013-04-19  1360  =

8af0f0822797707 Tao Ma                  2013-04-19  1361  	ret =3D ext4_get=
_inode_loc(inode, &iloc);
8af0f0822797707 Tao Ma                  2013-04-19  1362  	if (ret)
8af0f0822797707 Tao Ma                  2013-04-19  1363  		return ret;
8af0f0822797707 Tao Ma                  2013-04-19  1364  =

8af0f0822797707 Tao Ma                  2013-04-19  1365  	down_read(&EXT4_=
I(inode)->xattr_sem);
8af0f0822797707 Tao Ma                  2013-04-19  1366  	if (!ext4_has_in=
line_data(inode)) {
8af0f0822797707 Tao Ma                  2013-04-19  1367  		up_read(&EXT4_I=
(inode)->xattr_sem);
8af0f0822797707 Tao Ma                  2013-04-19  1368  		*has_inline_dat=
a =3D 0;
8af0f0822797707 Tao Ma                  2013-04-19  1369  		goto out;
8af0f0822797707 Tao Ma                  2013-04-19  1370  	}
8af0f0822797707 Tao Ma                  2013-04-19  1371  =

8af0f0822797707 Tao Ma                  2013-04-19  1372  	inline_size =3D =
ext4_get_inline_size(inode);
8af0f0822797707 Tao Ma                  2013-04-19  1373  	dir_buf =3D kmal=
loc(inline_size, GFP_NOFS);
8af0f0822797707 Tao Ma                  2013-04-19  1374  	if (!dir_buf) {
8af0f0822797707 Tao Ma                  2013-04-19  1375  		ret =3D -ENOMEM;
8af0f0822797707 Tao Ma                  2013-04-19  1376  		up_read(&EXT4_I=
(inode)->xattr_sem);
8af0f0822797707 Tao Ma                  2013-04-19  1377  		goto out;
8af0f0822797707 Tao Ma                  2013-04-19  1378  	}
8af0f0822797707 Tao Ma                  2013-04-19  1379  =

8af0f0822797707 Tao Ma                  2013-04-19  1380  	ret =3D ext4_rea=
d_inline_data(inode, dir_buf, inline_size, &iloc);
8af0f0822797707 Tao Ma                  2013-04-19  1381  	up_read(&EXT4_I(=
inode)->xattr_sem);
8af0f0822797707 Tao Ma                  2013-04-19  1382  	if (ret < 0)
8af0f0822797707 Tao Ma                  2013-04-19  1383  		goto out;
8af0f0822797707 Tao Ma                  2013-04-19  1384  =

8af0f0822797707 Tao Ma                  2013-04-19  1385  	pos =3D 0;
8af0f0822797707 Tao Ma                  2013-04-19 @1386  	parent_ino =3D l=
e32_to_cpu(((struct ext4_dir_entry_2 *)dir_buf)->inode);
8af0f0822797707 Tao Ma                  2013-04-19  1387  	while (pos < inl=
ine_size) {
8af0f0822797707 Tao Ma                  2013-04-19  1388  		/*
8af0f0822797707 Tao Ma                  2013-04-19  1389  		 * As inlined d=
ir doesn't store any information about '.' and
8af0f0822797707 Tao Ma                  2013-04-19  1390  		 * only the ino=
de number of '..' is stored, we have to handle
8af0f0822797707 Tao Ma                  2013-04-19  1391  		 * them differe=
ntly.
8af0f0822797707 Tao Ma                  2013-04-19  1392  		 */
8af0f0822797707 Tao Ma                  2013-04-19  1393  		if (pos =3D=3D =
0) {
8af0f0822797707 Tao Ma                  2013-04-19  1394  			fake.inode =3D=
 cpu_to_le32(inode->i_ino);
8af0f0822797707 Tao Ma                  2013-04-19  1395  			fake.name_len =
=3D 1;
8af0f0822797707 Tao Ma                  2013-04-19  1396  			strcpy(fake.na=
me, ".");
8af0f0822797707 Tao Ma                  2013-04-19  1397  			fake.rec_len =
=3D ext4_rec_len_to_disk(
471fbbea7ff7061 Daniel Rosenberg        2021-03-19  1398  					  ext4_dir_r=
ec_len(fake.name_len, NULL),
8af0f0822797707 Tao Ma                  2013-04-19  1399  					  inline_siz=
e);
8af0f0822797707 Tao Ma                  2013-04-19  1400  			ext4_set_de_ty=
pe(inode->i_sb, &fake, S_IFDIR);
8af0f0822797707 Tao Ma                  2013-04-19  1401  			de =3D &fake;
8af0f0822797707 Tao Ma                  2013-04-19  1402  			pos =3D EXT4_I=
NLINE_DOTDOT_OFFSET;
8af0f0822797707 Tao Ma                  2013-04-19  1403  		} else if (pos =
=3D=3D EXT4_INLINE_DOTDOT_OFFSET) {
8af0f0822797707 Tao Ma                  2013-04-19  1404  			fake.inode =3D=
 cpu_to_le32(parent_ino);
8af0f0822797707 Tao Ma                  2013-04-19  1405  			fake.name_len =
=3D 2;
8af0f0822797707 Tao Ma                  2013-04-19  1406  			strcpy(fake.na=
me, "..");
8af0f0822797707 Tao Ma                  2013-04-19  1407  			fake.rec_len =
=3D ext4_rec_len_to_disk(
471fbbea7ff7061 Daniel Rosenberg        2021-03-19  1408  					  ext4_dir_r=
ec_len(fake.name_len, NULL),
8af0f0822797707 Tao Ma                  2013-04-19  1409  					  inline_siz=
e);
8af0f0822797707 Tao Ma                  2013-04-19  1410  			ext4_set_de_ty=
pe(inode->i_sb, &fake, S_IFDIR);
8af0f0822797707 Tao Ma                  2013-04-19  1411  			de =3D &fake;
8af0f0822797707 Tao Ma                  2013-04-19  1412  			pos =3D EXT4_I=
NLINE_DOTDOT_SIZE;
8af0f0822797707 Tao Ma                  2013-04-19  1413  		} else {
8af0f0822797707 Tao Ma                  2013-04-19  1414  			de =3D (struct=
 ext4_dir_entry_2 *)(dir_buf + pos);
8af0f0822797707 Tao Ma                  2013-04-19  1415  			pos +=3D ext4_=
rec_len_from_disk(de->rec_len, inline_size);
8af0f0822797707 Tao Ma                  2013-04-19  1416  			if (ext4_check=
_dir_entry(inode, dir_file, de,
8af0f0822797707 Tao Ma                  2013-04-19  1417  					 iloc.bh, di=
r_buf,
8af0f0822797707 Tao Ma                  2013-04-19  1418  					 inline_size=
, pos)) {
8af0f0822797707 Tao Ma                  2013-04-19  1419  				ret =3D count;
8af0f0822797707 Tao Ma                  2013-04-19  1420  				goto out;
8af0f0822797707 Tao Ma                  2013-04-19  1421  			}
8af0f0822797707 Tao Ma                  2013-04-19  1422  		}
8af0f0822797707 Tao Ma                  2013-04-19  1423  =

471fbbea7ff7061 Daniel Rosenberg        2021-03-19  1424  		if (ext4_hash_i=
n_dirent(dir)) {
471fbbea7ff7061 Daniel Rosenberg        2021-03-19  1425  			hinfo->hash =
=3D EXT4_DIRENT_HASH(de);
471fbbea7ff7061 Daniel Rosenberg        2021-03-19  1426  			hinfo->minor_h=
ash =3D EXT4_DIRENT_MINOR_HASH(de);
471fbbea7ff7061 Daniel Rosenberg        2021-03-19  1427  		} else {
b886ee3e778ec2a Gabriel Krisman Bertazi 2019-04-25  1428  			ext4fs_dirhash=
(dir, de->name, de->name_len, hinfo);
471fbbea7ff7061 Daniel Rosenberg        2021-03-19  1429  		}
8af0f0822797707 Tao Ma                  2013-04-19  1430  		if ((hinfo->has=
h < start_hash) ||
8af0f0822797707 Tao Ma                  2013-04-19  1431  		    ((hinfo->ha=
sh =3D=3D start_hash) &&
8af0f0822797707 Tao Ma                  2013-04-19  1432  		     (hinfo->mi=
nor_hash < start_minor_hash)))
8af0f0822797707 Tao Ma                  2013-04-19  1433  			continue;
8af0f0822797707 Tao Ma                  2013-04-19  1434  		if (de->inode =
=3D=3D 0)
8af0f0822797707 Tao Ma                  2013-04-19  1435  			continue;
2f61830ae33e294 Theodore Ts'o           2015-04-12  1436  		tmp_str.name =
=3D de->name;
2f61830ae33e294 Theodore Ts'o           2015-04-12  1437  		tmp_str.len =3D=
 de->name_len;
2f61830ae33e294 Theodore Ts'o           2015-04-12  1438  		err =3D ext4_ht=
ree_store_dirent(dir_file, hinfo->hash,
2f61830ae33e294 Theodore Ts'o           2015-04-12  1439  					      hinfo-=
>minor_hash, de, &tmp_str);
8af0f0822797707 Tao Ma                  2013-04-19  1440  		if (err) {
7a14826ede1d714 Colin Ian King          2019-08-12  1441  			ret =3D err;
8af0f0822797707 Tao Ma                  2013-04-19  1442  			goto out;
8af0f0822797707 Tao Ma                  2013-04-19  1443  		}
8af0f0822797707 Tao Ma                  2013-04-19  1444  		count++;
8af0f0822797707 Tao Ma                  2013-04-19  1445  	}
8af0f0822797707 Tao Ma                  2013-04-19  1446  	ret =3D count;
8af0f0822797707 Tao Ma                  2013-04-19  1447  out:
8af0f0822797707 Tao Ma                  2013-04-19  1448  	kfree(dir_buf);
8af0f0822797707 Tao Ma                  2013-04-19  1449  	brelse(iloc.bh);
8af0f0822797707 Tao Ma                  2013-04-19  1450  	return ret;
8af0f0822797707 Tao Ma                  2013-04-19  1451  }
8af0f0822797707 Tao Ma                  2013-04-19  1452  =


:::::: The code at line 1386 was first introduced by commit
:::::: 8af0f08227977079f8f227e74d27c59db2ab84f6 ext4: fix readdir error in =
the case of inline_data+dir_index

:::::: TO: Tao Ma <boyu.mt@taobao.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6105408805479886192==--


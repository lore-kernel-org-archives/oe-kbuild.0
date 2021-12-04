Content-Type: multipart/mixed; boundary="===============0755374146625737261=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/5] io_uring: add fsetxattr and setxattr support
Date: Sat, 04 Dec 2021 21:56:04 +0800
Message-ID: <202112042139.bHHzzWrL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0755374146625737261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211203191516.1327214-5-shr@fb.com>
References: <20211203191516.1327214-5-shr@fb.com>
TO: Stefan Roesch <shr@fb.com>
TO: io-uring(a)vger.kernel.org
TO: linux-fsdevel(a)vger.kernel.org
TO: kernel-team(a)fb.com
CC: shr(a)fb.com

Hi Stefan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on c2b8fe96d041238d18228b8384e094cc959497ed]

url:    https://github.com/0day-ci/linux/commits/Stefan-Roesch/io_uring-add=
-xattr-support/20211204-031657
base:   c2b8fe96d041238d18228b8384e094cc959497ed
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: mips-randconfig-c004-20211203 (https://download.01.org/0day-ci/arch=
ive/20211204/202112042139.bHHzzWrL-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d30fca=
df07ee552f20156ea90be2fdb54cb9cb08)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/6d1076ace03a9946908f90650=
8f9fe32043b81c1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stefan-Roesch/io_uring-add-xattr-s=
upport/20211204-031657
        git checkout 6d1076ace03a9946908f906508f9fe32043b81c1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:88:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:88:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o '*to'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to '*to'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   fs/io_uring.c:11017:6: note: Returning from 'copy_from_user'
           if (copy_from_user(new_count, arg, sizeof(new_count)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:11017:2: note: Taking false branch
           if (copy_from_user(new_count, arg, sizeof(new_count)))
           ^
   fs/io_uring.c:11019:7: note: The value 0 is assigned to 'i'
           for (i =3D 0; i < ARRAY_SIZE(new_count); i++)
                ^~~~~
   fs/io_uring.c:11019:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(new_count); i++)
           ^
   fs/io_uring.c:11020:20: note: The left operand of '>' is a garbage value
                   if (new_count[i] > INT_MAX)
                       ~~~~~~~~~~~~ ^
>> include/linux/fs.h:2725:21: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
           return mnt_user_ns(file->f_path.mnt);
                              ^
   fs/io_uring.c:7331:25: note: Left side of '||' is true
           req->opcode =3D opcode =3D READ_ONCE(sqe->opcode);
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:29: note: expanded from macro '__nati=
ve_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
                                      ^
   fs/io_uring.c:7331:25: note: Taking false branch
           req->opcode =3D opcode =3D READ_ONCE(sqe->opcode);
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/io_uring.c:7331:25: note: Loop condition is false.  Exiting loop
           req->opcode =3D opcode =3D READ_ONCE(sqe->opcode);
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/io_uring.c:7333:27: note: Left side of '||' is true
           req->flags =3D sqe_flags =3D READ_ONCE(sqe->flags);
                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:29: note: expanded from macro '__nati=
ve_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
                                      ^
   fs/io_uring.c:7333:27: note: Taking false branch
           req->flags =3D sqe_flags =3D READ_ONCE(sqe->flags);
                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/io_uring.c:7333:27: note: Loop condition is false.  Exiting loop
           req->flags =3D sqe_flags =3D READ_ONCE(sqe->flags);
                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/io_uring.c:7334:19: note: Left side of '||' is false
           req->user_data =3D READ_ONCE(sqe->user_data);

vim +2725 include/linux/fs.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  2722  =

a6435940b62f81 Christian Brauner 2021-01-21  2723  static inline struct use=
r_namespace *file_mnt_user_ns(struct file *file)
a6435940b62f81 Christian Brauner 2021-01-21  2724  {
a6435940b62f81 Christian Brauner 2021-01-21 @2725  	return mnt_user_ns(file=
->f_path.mnt);
a6435940b62f81 Christian Brauner 2021-01-21  2726  }
7df818b2370a9a Al Viro           2016-03-25  2727  extern long vfs_truncate=
(const struct path *, loff_t);
643fe55a0679ae Christian Brauner 2021-01-21  2728  int do_truncate(struct u=
ser_namespace *, struct dentry *, loff_t start,
643fe55a0679ae Christian Brauner 2021-01-21  2729  		unsigned int time_attr=
s, struct file *filp);
72c72bdf7bf533 Anna Schumaker    2014-11-07  2730  extern int vfs_fallocate=
(struct file *file, int mode, loff_t offset,
3e63cbb1efca7d Ankit Jain        2009-06-19  2731  			loff_t len);
8e8a1407ac23b4 Jason Uhlenkott   2007-10-20  2732  extern long do_sys_open(=
int dfd, const char __user *filename, int flags,
a218d0fdc5f900 Al Viro           2011-11-21  2733  			umode_t mode);
669abf4e5539c8 Jeff Layton       2012-10-10  2734  extern struct file *file=
_open_name(struct filename *, int, umode_t);
a218d0fdc5f900 Al Viro           2011-11-21  2735  extern struct file *filp=
_open(const char *, int, umode_t);
ffb37ca3bd16ce Al Viro           2021-04-01  2736  extern struct file *file=
_open_root(const struct path *,
378c6520e7d292 Jann Horn         2016-03-22  2737  				   const char *, int=
, umode_t);
ffb37ca3bd16ce Al Viro           2021-04-01  2738  static inline struct fil=
e *file_open_root_mnt(struct vfsmount *mnt,
ffb37ca3bd16ce Al Viro           2021-04-01  2739  				   const char *name,=
 int flags, umode_t mode)
ffb37ca3bd16ce Al Viro           2021-04-01  2740  {
ffb37ca3bd16ce Al Viro           2021-04-01  2741  	return file_open_root(&=
(struct path){.mnt =3D mnt, .dentry =3D mnt->mnt_root},
ffb37ca3bd16ce Al Viro           2021-04-01  2742  			      name, flags, mo=
de);
ffb37ca3bd16ce Al Viro           2021-04-01  2743  }
765927b2d50871 Al Viro           2012-06-26  2744  extern struct file * den=
try_open(const struct path *, int, const struct cred *);
2abc77af89e175 Al Viro           2018-07-12  2745  extern struct file * ope=
n_with_fake_path(const struct path *, int,
2abc77af89e175 Al Viro           2018-07-12  2746  					 struct inode*, con=
st struct cred *);
19f391eb05b8b0 Al Viro           2018-06-08  2747  static inline struct fil=
e *file_clone_open(struct file *file)
19f391eb05b8b0 Al Viro           2018-06-08  2748  {
19f391eb05b8b0 Al Viro           2018-06-08  2749  	return dentry_open(&fil=
e->f_path, file->f_flags, file->f_cred);
19f391eb05b8b0 Al Viro           2018-06-08  2750  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  2751  extern int filp_close(st=
ruct file *, fl_owner_t id);
91a27b2a756784 Jeff Layton       2012-10-10  2752  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0755374146625737261==--


Content-Type: multipart/mixed; boundary="===============5696496699954885280=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/verity/read_metadata.c:38:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 09 Jan 2022 13:19:17 +0800
Message-ID: <202201091339.c3DpKgU6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5696496699954885280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Victor Hsieh <victorhsieh@google.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4634129ad9fdc89d10b597fc6f8f4336fb61e105
commit: e17fe6579de023725ec22a16965e9099e4a05ac9 fs-verity: add FS_IOC_READ=
_VERITY_METADATA ioctl
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-c004-20211227 (https://download.01.org/0day-ci/arch=
ive/20220109/202201091339.c3DpKgU6-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726=
c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De17fe6579de023725ec22a16965e9099e4a05ac9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e17fe6579de023725ec22a16965e9099e4a05ac9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/verity/open.c:50:2: note: Taking false branch
           if (IS_ERR(params->hashstate)) {
           ^
   fs/verity/open.c:57:6: note: Assuming 'log_blocksize' is not equal to PA=
GE_SHIFT
           if (log_blocksize !=3D PAGE_SHIFT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:57:2: note: Taking true branch
           if (log_blocksize !=3D PAGE_SHIFT) {
           ^
   fs/verity/open.c:61:3: note: Control jumps to line 121
                   goto out_err;
                   ^
   fs/verity/open.c:121:2: note: Memory is released
           kfree(params->hashstate);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:161:8: note: Returning; memory was released
           err =3D fsverity_init_merkle_tree_params(&vi->tree_params, inode,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:165:6: note: 'err' is -22
           if (err) {
               ^~~
   fs/verity/open.c:165:2: note: Taking true branch
           if (err) {
           ^
   fs/verity/open.c:169:3: note: Control jumps to line 187
                   goto out;
                   ^
   fs/verity/open.c:187:6: note: 'err' is -22
           if (err) {
               ^~~
   fs/verity/open.c:187:2: note: Taking true branch
           if (err) {
           ^
   fs/verity/open.c:188:3: note: Calling 'fsverity_free_info'
                   fsverity_free_info(vi);
                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:215:7: note: 'vi' is non-null
           if (!vi)
                ^~
   fs/verity/open.c:215:2: note: Taking false branch
           if (!vi)
           ^
   fs/verity/open.c:217:2: note: Attempt to free released memory
           kfree(vi->tree_params.hashstate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   init/main.c:640:3: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(saved_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:640:3: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                   strcpy(saved_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:641:3: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(static_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:641:3: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                   strcpy(static_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:643:2: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(saved_command_line + xlen, boot_command_line);
           ^~~~~~
   init/main.c:643:2: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
           strcpy(saved_command_line + xlen, boot_command_line);
           ^~~~~~
   init/main.c:644:2: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(static_command_line + xlen, command_line);
           ^~~~~~
   init/main.c:644:2: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
           strcpy(static_command_line + xlen, command_line);
           ^~~~~~
   init/main.c:656:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, " -- ");
                           ^~~~~~
   init/main.c:656:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, " -- ");
                           ^~~~~~
   init/main.c:660:3: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(saved_command_line + len, extra_init_args);
                   ^~~~~~
   init/main.c:660:3: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                   strcpy(saved_command_line + len, extra_init_args);
                   ^~~~~~
   init/main.c:1105:4: warning: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(entry->buf, str_entry);
                           ^~~~~~
   init/main.c:1105:4: note: Call to function 'strcpy' is insecure as it do=
es not provide bounding of the memory buffer. Replace unbounded copy functi=
ons with analogous functions that support length arguments such as 'strlcpy=
'. CWE-119
                           strcpy(entry->buf, str_entry);
                           ^~~~~~
   init/main.c:1305:3: warning: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(command_line, saved_command_line);
                   ^~~~~~
   init/main.c:1305:3: note: Call to function 'strcpy' is insecure as it do=
es not provide bounding of the memory buffer. Replace unbounded copy functi=
ons with analogous functions that support length arguments such as 'strlcpy=
'. CWE-119
                   strcpy(command_line, saved_command_line);
                   ^~~~~~
   Suppressed 10 warnings (5 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/verity/read_metadata.c:38:6: warning: Branch condition evaluates to a=
 garbage value [clang-analyzer-core.uninitialized.Branch]
           if (arg.__reserved)
               ^~~~~~~~~~~~~~
   fs/verity/read_metadata.c:27:7: note: Calling 'fsverity_get_info'
           vi =3D fsverity_get_info(inode);
                ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsverity.h:124:9: note: Left side of '||' is false
           return smp_load_acquire(&inode->i_verity_info);
                  ^
   include/asm-generic/barrier.h:171:37: note: expanded from macro 'smp_loa=
d_acquire'
           __unqual_scalar_typeof(*p) ___p1 =3D READ_ONCE(*p);             =
  \
                                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:282:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/fsverity.h:124:9: note: Left side of '||' is false
           return smp_load_acquire(&inode->i_verity_info);
                  ^
   include/asm-generic/barrier.h:171:37: note: expanded from macro 'smp_loa=
d_acquire'
           __unqual_scalar_typeof(*p) ___p1 =3D READ_ONCE(*p);             =
  \
                                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:282:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/fsverity.h:124:9: note: Left side of '||' is true
           return smp_load_acquire(&inode->i_verity_info);
                  ^
   include/asm-generic/barrier.h:171:37: note: expanded from macro 'smp_loa=
d_acquire'
           __unqual_scalar_typeof(*p) ___p1 =3D READ_ONCE(*p);             =
  \
                                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:283:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   include/linux/fsverity.h:124:9: note: Taking false branch
           return smp_load_acquire(&inode->i_verity_info);
                  ^
   include/asm-generic/barrier.h:171:37: note: expanded from macro 'smp_loa=
d_acquire'
           __unqual_scalar_typeof(*p) ___p1 =3D READ_ONCE(*p);             =
  \
                                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/fsverity.h:124:9: note: Loop condition is false.  Exiting =
loop
           return smp_load_acquire(&inode->i_verity_info);
                  ^
   include/asm-generic/barrier.h:171:37: note: expanded from macro 'smp_loa=
d_acquire'
           __unqual_scalar_typeof(*p) ___p1 =3D READ_ONCE(*p);             =
  \
                                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/fsverity.h:124:9: note: Left side of '||' is false
           return smp_load_acquire(&inode->i_verity_info);
                  ^
   include/asm-generic/barrier.h:172:2: note: expanded from macro 'smp_load=
_acquire'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:323:21: note: expanded from macro 'compil=
etime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \

vim +38 fs/verity/read_metadata.c

e17fe6579de0237 Eric Biggers 2021-01-15  11  =

e17fe6579de0237 Eric Biggers 2021-01-15  12  /**
e17fe6579de0237 Eric Biggers 2021-01-15  13   * fsverity_ioctl_read_metadat=
a() - read verity metadata from a file
e17fe6579de0237 Eric Biggers 2021-01-15  14   * @filp: file to read the met=
adata from
e17fe6579de0237 Eric Biggers 2021-01-15  15   * @uarg: user pointer to fsve=
rity_read_metadata_arg
e17fe6579de0237 Eric Biggers 2021-01-15  16   *
e17fe6579de0237 Eric Biggers 2021-01-15  17   * Return: length read on succ=
ess, 0 on EOF, -errno on failure
e17fe6579de0237 Eric Biggers 2021-01-15  18   */
e17fe6579de0237 Eric Biggers 2021-01-15  19  int fsverity_ioctl_read_metada=
ta(struct file *filp, const void __user *uarg)
e17fe6579de0237 Eric Biggers 2021-01-15  20  {
e17fe6579de0237 Eric Biggers 2021-01-15  21  	struct inode *inode =3D file_=
inode(filp);
e17fe6579de0237 Eric Biggers 2021-01-15  22  	const struct fsverity_info *v=
i;
e17fe6579de0237 Eric Biggers 2021-01-15  23  	struct fsverity_read_metadata=
_arg arg;
e17fe6579de0237 Eric Biggers 2021-01-15  24  	int length;
e17fe6579de0237 Eric Biggers 2021-01-15  25  	void __user *buf;
e17fe6579de0237 Eric Biggers 2021-01-15  26  =

e17fe6579de0237 Eric Biggers 2021-01-15  27  	vi =3D fsverity_get_info(inod=
e);
e17fe6579de0237 Eric Biggers 2021-01-15  28  	if (!vi)
e17fe6579de0237 Eric Biggers 2021-01-15  29  		return -ENODATA; /* not a ve=
rity file */
e17fe6579de0237 Eric Biggers 2021-01-15  30  	/*
e17fe6579de0237 Eric Biggers 2021-01-15  31  	 * Note that we don't have to=
 explicitly check that the file is open for
e17fe6579de0237 Eric Biggers 2021-01-15  32  	 * reading, since verity file=
s can only be opened for reading.
e17fe6579de0237 Eric Biggers 2021-01-15  33  	 */
e17fe6579de0237 Eric Biggers 2021-01-15  34  =

e17fe6579de0237 Eric Biggers 2021-01-15  35  	if (copy_from_user(&arg, uarg=
, sizeof(arg)))
e17fe6579de0237 Eric Biggers 2021-01-15  36  		return -EFAULT;
e17fe6579de0237 Eric Biggers 2021-01-15  37  =

e17fe6579de0237 Eric Biggers 2021-01-15 @38  	if (arg.__reserved)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5696496699954885280==--


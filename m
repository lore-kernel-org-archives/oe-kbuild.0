Content-Type: multipart/mixed; boundary="===============4126937280914674376=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [fscrypt:wip-wrapped-keys 2/16] block/blk-crypto.c:456:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 09 Jan 2022 03:56:28 +0800
Message-ID: <202201090337.X6nmk3xI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4126937280914674376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>

tree:   https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git wip-wrapped-k=
eys
head:   8f926aa780a1e1bc6e2b7b62dc29612ad4dfcfcd
commit: 9910dd3e26efdb464b3a56020c8fac093a325506 [2/16] block: add ioctls t=
o create and prepare hardware-wrapped keys
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: mips-randconfig-c004-20220107 (https://download.01.org/0day-ci/arch=
ive/20220109/202201090337.X6nmk3xI-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git/commit/?id=
=3D9910dd3e26efdb464b3a56020c8fac093a325506
        git remote add fscrypt https://git.kernel.org/pub/scm/fs/fscrypt/fs=
crypt.git
        git fetch --no-tags fscrypt wip-wrapped-keys
        git checkout 9910dd3e26efdb464b3a56020c8fac093a325506
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/list.h:37:2: note: Loop condition is false.  Exiting loop
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   include/linux/list.h:37:2: note: Dereference of null pointer
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   init/initramfs.c:97:11: warning: Access to field 'major' results in a de=
reference of a null pointer (loaded from variable 'q') [clang-analyzer-core=
.NullDereference]
           q->major =3D major;
                    ^
   init/initramfs.c:341:6: note: Assuming the condition is false
           if (strcmp(collected, "TRAILER!!!") =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:341:2: note: Taking false branch
           if (strcmp(collected, "TRAILER!!!") =3D=3D 0) {
           ^
   init/initramfs.c:346:6: note: Assuming the condition is true
           if (S_ISREG(mode)) {
               ^
   include/uapi/linux/stat.h:22:21: note: expanded from macro 'S_ISREG'
   #define S_ISREG(m)      (((m) & S_IFMT) =3D=3D S_IFREG)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:346:2: note: Taking true branch
           if (S_ISREG(mode)) {
           ^
   init/initramfs.c:347:12: note: Calling 'maybe_link'
                   int ml =3D maybe_link();
                            ^~~~~~~~~~~~
   init/initramfs.c:324:6: note: Assuming 'nlink' is >=3D 2
           if (nlink >=3D 2) {
               ^~~~~~~~~~
   init/initramfs.c:324:2: note: Taking true branch
           if (nlink >=3D 2) {
           ^
   init/initramfs.c:325:15: note: Calling 'find_link'
                   char *old =3D find_link(major, minor, ino, mode, collect=
ed);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:83:2: note: Loop condition is false. Execution continue=
s on line 94
           for (p =3D head + hash(major, minor, ino); *p; p =3D &(*p)->next=
) {
           ^
   init/initramfs.c:94:6: note: Calling 'kmalloc'
           q =3D kmalloc(sizeof(struct hash), GFP_KERNEL);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:94:6: note: Returning from 'kmalloc'
           q =3D kmalloc(sizeof(struct hash), GFP_KERNEL);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:94:2: note: Value assigned to 'q'
           q =3D kmalloc(sizeof(struct hash), GFP_KERNEL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:95:6: note: Assuming 'q' is null
           if (!q)
               ^~
   init/initramfs.c:95:2: note: Taking true branch
           if (!q)
           ^
   init/initramfs.c:97:11: note: Access to field 'major' results in a deref=
erence of a null pointer (loaded from variable 'q')
           q->major =3D major;
           ~        ^
   init/initramfs.c:101:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(q->name, name);
           ^~~~~~
   init/initramfs.c:101:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(q->name, name);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> block/blk-crypto.c:456:6: warning: Branch condition evaluates to a garba=
ge value [clang-analyzer-core.uninitialized.Branch]
           if (arg.raw_key_size) {
               ^
   block/blk-crypto.c:542:6: note: Assuming 'profile' is non-null
           if (!profile)
               ^~~~~~~~
   block/blk-crypto.c:542:2: note: Taking false branch
           if (!profile)
           ^
   block/blk-crypto.c:545:2: note: Control jumps to 'case 3225424513:'  at =
line 546
           switch (cmd) {
           ^
   block/blk-crypto.c:547:10: note: Calling 'blk_crypto_ioctl_create_key'
                   return blk_crypto_ioctl_create_key(profile, argp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-crypto.c:450:6: note: Calling 'copy_from_user'
           if (copy_from_user(&arg, argp, sizeof(arg)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
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
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->raw_key_size'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->r=
aw_key_size'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->r=
aw_key_size'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   block/blk-crypto.c:450:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&arg, argp, sizeof(arg)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-crypto.c:450:2: note: Taking false branch
           if (copy_from_user(&arg, argp, sizeof(arg)))
           ^
   block/blk-crypto.c:453:6: note: Assuming the condition is false
           if (memchr_inv(arg.reserved, 0, sizeof(arg.reserved)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-crypto.c:453:2: note: Taking false branch
           if (memchr_inv(arg.reserved, 0, sizeof(arg.reserved)))
           ^
   block/blk-crypto.c:456:6: note: Branch condition evaluates to a garbage =
value
           if (arg.raw_key_size) {
               ^~~~~~~~~~~~~~~~
   block/blk-crypto.c:503:36: warning: The left operand of '>' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (arg.longterm_wrapped_key_size > sizeof(longterm_wrapped_key))
                                             ^
   block/blk-crypto.c:542:6: note: Assuming 'profile' is non-null
           if (!profile)
               ^~~~~~~~
   block/blk-crypto.c:542:2: note: Taking false branch
           if (!profile)
           ^
   block/blk-crypto.c:545:2: note: Control jumps to 'case 3225424514:'  at =
line 548
           switch (cmd) {
           ^
   block/blk-crypto.c:549:10: note: Calling 'blk_crypto_ioctl_prepare_key'
                   return blk_crypto_ioctl_prepare_key(profile, argp);

vim +456 block/blk-crypto.c

9910dd3e26efdb Eric Biggers 2021-11-15  441  =

9910dd3e26efdb Eric Biggers 2021-11-15  442  static int blk_crypto_ioctl_cr=
eate_key(struct blk_crypto_profile *profile,
9910dd3e26efdb Eric Biggers 2021-11-15  443  				       void __user *argp)
9910dd3e26efdb Eric Biggers 2021-11-15  444  {
9910dd3e26efdb Eric Biggers 2021-11-15  445  	struct blk_crypto_create_key_=
arg arg;
9910dd3e26efdb Eric Biggers 2021-11-15  446  	u8 raw_key[BLK_CRYPTO_MAX_STA=
NDARD_KEY_SIZE];
9910dd3e26efdb Eric Biggers 2021-11-15  447  	u8 longterm_wrapped_key[BLK_C=
RYPTO_MAX_HW_WRAPPED_KEY_SIZE];
9910dd3e26efdb Eric Biggers 2021-11-15  448  	int ret;
9910dd3e26efdb Eric Biggers 2021-11-15  449  =

9910dd3e26efdb Eric Biggers 2021-11-15  450  	if (copy_from_user(&arg, argp=
, sizeof(arg)))
9910dd3e26efdb Eric Biggers 2021-11-15  451  		return -EFAULT;
9910dd3e26efdb Eric Biggers 2021-11-15  452  =

9910dd3e26efdb Eric Biggers 2021-11-15  453  	if (memchr_inv(arg.reserved, =
0, sizeof(arg.reserved)))
9910dd3e26efdb Eric Biggers 2021-11-15  454  		return -EINVAL;
9910dd3e26efdb Eric Biggers 2021-11-15  455  =

9910dd3e26efdb Eric Biggers 2021-11-15 @456  	if (arg.raw_key_size) {
9910dd3e26efdb Eric Biggers 2021-11-15  457  		if (arg.raw_key_size > sizeo=
f(raw_key))
9910dd3e26efdb Eric Biggers 2021-11-15  458  			return -EINVAL;
9910dd3e26efdb Eric Biggers 2021-11-15  459  		if (copy_from_user(raw_key, =
u64_to_user_ptr(arg.raw_key_ptr),
9910dd3e26efdb Eric Biggers 2021-11-15  460  				   arg.raw_key_size)) {
9910dd3e26efdb Eric Biggers 2021-11-15  461  			ret =3D -EFAULT;
9910dd3e26efdb Eric Biggers 2021-11-15  462  			goto out;
9910dd3e26efdb Eric Biggers 2021-11-15  463  		}
9910dd3e26efdb Eric Biggers 2021-11-15  464  		ret =3D blk_crypto_import_ke=
y(profile, raw_key, arg.raw_key_size,
9910dd3e26efdb Eric Biggers 2021-11-15  465  					    longterm_wrapped_key);
9910dd3e26efdb Eric Biggers 2021-11-15  466  	} else {
9910dd3e26efdb Eric Biggers 2021-11-15  467  		ret =3D blk_crypto_generate_=
key(profile, longterm_wrapped_key);
9910dd3e26efdb Eric Biggers 2021-11-15  468  	}
9910dd3e26efdb Eric Biggers 2021-11-15  469  	if (ret < 0)
9910dd3e26efdb Eric Biggers 2021-11-15  470  		goto out;
9910dd3e26efdb Eric Biggers 2021-11-15  471  	if (ret > arg.longterm_wrappe=
d_key_size) {
9910dd3e26efdb Eric Biggers 2021-11-15  472  		ret =3D -ENOBUFS;
9910dd3e26efdb Eric Biggers 2021-11-15  473  		goto out;
9910dd3e26efdb Eric Biggers 2021-11-15  474  	}
9910dd3e26efdb Eric Biggers 2021-11-15  475  	arg.longterm_wrapped_key_size=
 =3D ret;
9910dd3e26efdb Eric Biggers 2021-11-15  476  	if (copy_to_user(u64_to_user_=
ptr(arg.longterm_wrapped_key_ptr),
9910dd3e26efdb Eric Biggers 2021-11-15  477  			 longterm_wrapped_key, arg.=
longterm_wrapped_key_size) ||
9910dd3e26efdb Eric Biggers 2021-11-15  478  	    copy_to_user(argp, &arg, =
sizeof(arg))) {
9910dd3e26efdb Eric Biggers 2021-11-15  479  		ret =3D -EFAULT;
9910dd3e26efdb Eric Biggers 2021-11-15  480  		goto out;
9910dd3e26efdb Eric Biggers 2021-11-15  481  	}
9910dd3e26efdb Eric Biggers 2021-11-15  482  	ret =3D 0;
9910dd3e26efdb Eric Biggers 2021-11-15  483  out:
9910dd3e26efdb Eric Biggers 2021-11-15  484  	memzero_explicit(raw_key, siz=
eof(raw_key));
9910dd3e26efdb Eric Biggers 2021-11-15  485  	memzero_explicit(longterm_wra=
pped_key, sizeof(longterm_wrapped_key));
9910dd3e26efdb Eric Biggers 2021-11-15  486  	return ret;
9910dd3e26efdb Eric Biggers 2021-11-15  487  }
9910dd3e26efdb Eric Biggers 2021-11-15  488  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4126937280914674376==--


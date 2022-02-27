Content-Type: multipart/mixed; boundary="===============6224832381164049746=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hare-scsi-devel:tls-upcall.v2 122/159] crypto/hkdf.c:94:4: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Sun, 27 Feb 2022 17:00:02 +0800
Message-ID: <202202271613.4TGNYGNs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6224832381164049746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 tls-upcall.v2
head:   21b520ae0b338bd30496feb1ca90a2820dab7a65
commit: 04ae9ad78a4ea9280f04e5e001fd8a179665d1c1 [122/159] crypto,fs: Separ=
ate out hkdf_extract() and hkdf_expand()
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: mips-randconfig-c004-20220227 (https://download.01.org/0day-ci/arch=
ive/20220227/202202271613.4TGNYGNs-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.g=
it/commit/?id=3D04ae9ad78a4ea9280f04e5e001fd8a179665d1c1
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux=
/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-upcall.v2
        git checkout 04ae9ad78a4ea9280f04e5e001fd8a179665d1c1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   10 warnings generated.
>> crypto/hkdf.c:94:4: warning: Null pointer passed as 1st argument to memo=
ry copy function [clang-analyzer-unix.cstring.NullArg]
                           memcpy(&okm[i], tmp, okmlen - i);
                           ^      ~~~~~~~
   crypto/hkdf.c:64:14: note: Assuming the condition is false
           if (WARN_ON(okmlen > 255 * hashlen))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   crypto/hkdf.c:64:6: note: Taking false branch
           if (WARN_ON(okmlen > 255 * hashlen))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   crypto/hkdf.c:64:2: note: Taking false branch
           if (WARN_ON(okmlen > 255 * hashlen))
           ^
   crypto/hkdf.c:67:8: note: Calling 'kzalloc'
           tmp =3D kzalloc(hashlen, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:67:8: note: Returning from 'kzalloc'
           tmp =3D kzalloc(hashlen, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:68:6: note: Assuming 'tmp' is non-null
           if (!tmp)
               ^~~~
   crypto/hkdf.c:68:2: note: Taking false branch
           if (!tmp)
           ^
   crypto/hkdf.c:73:14: note: Assuming 'i' is < 'okmlen'
           for (i =3D 0; i < okmlen; i +=3D hashlen) {
                       ^~~~~~~~~~
   crypto/hkdf.c:73:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < okmlen; i +=3D hashlen) {
           ^
   crypto/hkdf.c:75:9: note: Calling 'crypto_shash_init'
                   err =3D crypto_shash_init(desc);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:946:6: note: Assuming the condition is false
           if (crypto_shash_get_flags(tfm) & CRYPTO_TFM_NEED_KEY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:946:2: note: Taking false branch
           if (crypto_shash_get_flags(tfm) & CRYPTO_TFM_NEED_KEY)
           ^
   include/crypto/hash.h:949:2: note: Returning value, which participates i=
n a condition later
           return crypto_shash_alg(tfm)->init(desc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:75:9: note: Returning from 'crypto_shash_init'
                   err =3D crypto_shash_init(desc);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/hkdf.c:76:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   crypto/hkdf.c:76:3: note: Taking false branch
                   if (err)
                   ^
   crypto/hkdf.c:79:7: note: 'prev' is null
                   if (prev) {
                       ^~~~
   crypto/hkdf.c:79:3: note: Taking false branch
                   if (prev) {
                   ^
   crypto/hkdf.c:86:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   crypto/hkdf.c:86:3: note: Taking false branch
                   if (err)
                   ^
   crypto/hkdf.c:89:3: note: Taking false branch
                   BUILD_BUG_ON(sizeof(counter) !=3D 1);
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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

vim +94 crypto/hkdf.c

04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  44  =

04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  45  /*
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  46   * HKDF-Expand (RFC 5869 sec=
tion 2.3).
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  47   * This expands the pseudora=
ndom key, which was already keyed into @hmac_tfm,
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  48   * into @okmlen bytes of out=
put keying material parameterized by the
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  49   * application-specific @inf=
o of length @infolen bytes.
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  50   * This is thread-safe and m=
ay be called by multiple threads in parallel.
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  51   */
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  52  int hkdf_expand(struct crypt=
o_shash *hmac_tfm,
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  53  		const u8 *info, unsigned i=
nt infolen,
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  54  		u8 *okm, unsigned int okml=
en)
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  55  {
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  56  	SHASH_DESC_ON_STACK(desc, h=
mac_tfm);
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  57  	u8 prefix[9];
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  58  	unsigned int i, hashlen =3D=
 crypto_shash_digestsize(hmac_tfm);
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  59  	int err;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  60  	const u8 *prev =3D NULL;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  61  	u8 counter =3D 1;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  62  	u8 *tmp;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  63  =

04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  64  	if (WARN_ON(okmlen > 255 * =
hashlen))
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  65  		return -EINVAL;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  66  =

04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  67  	tmp =3D kzalloc(hashlen, GF=
P_KERNEL);
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  68  	if (!tmp)
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  69  		return -ENOMEM;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  70  =

04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  71  	desc->tfm =3D hmac_tfm;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  72  =

04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  73  	for (i =3D 0; i < okmlen; i=
 +=3D hashlen) {
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  74  =

04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  75  		err =3D crypto_shash_init(=
desc);
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  76  		if (err)
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  77  			goto out;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  78  =

04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  79  		if (prev) {
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  80  			err =3D crypto_shash_upda=
te(desc, prev, hashlen);
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  81  			if (err)
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  82  				goto out;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  83  		}
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  84  =

04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  85  		err =3D crypto_shash_updat=
e(desc, info, infolen);
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  86  		if (err)
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  87  			goto out;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  88  =

04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  89  		BUILD_BUG_ON(sizeof(counte=
r) !=3D 1);
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  90  		if (okmlen - i < hashlen) {
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  91  			err =3D crypto_shash_finu=
p(desc, &counter, 1, tmp);
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  92  			if (err)
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10  93  				goto out;
04ae9ad78a4ea9 Hannes Reinecke 2022-01-10 @94  			memcpy(&okm[i], tmp, okml=
en - i);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6224832381164049746==--


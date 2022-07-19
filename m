Content-Type: multipart/mixed; boundary="===============0982451893133388589=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/crypto/sm4_aesni_avx_glue.c:336:4: warning: Value stored to 'dst' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 19 Jul 2022 09:39:09 +0800
Message-ID: <202207190921.nscy5lyg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0982451893133388589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/x86/=
crypto/sm4_aesni_avx_glue.c:336:4: warning: Value stored to 'dst' is never =
read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   80e19f34c2887a8881084b7bb7480e9544d56b91
commit: a7ee22ee1445c7fdb00ab80116bb9710ca86a860 crypto: x86/sm4 - add AES-=
NI/AVX/x86_64 implementation
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20719/202207190921.nscy5lyg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 45067f=
8fbf61284839c739807c2da2e2505661eb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da7ee22ee1445c7fdb00ab80116bb9710ca86a860
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a7ee22ee1445c7fdb00ab80116bb9710ca86a860
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/dlm/member.c:370:10: note: Loop condition is false.  Exiting loop
                   memb =3D list_entry(head->next, struct dlm_member, list);
                          ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/dlm/member.c:372:7: note: 'after_del' is null
                   if (after_del)
                       ^~~~~~~~~
   fs/dlm/member.c:372:3: note: Taking false branch
                   if (after_del)
                   ^
   fs/dlm/member.c:374:3: note: Memory is released
                   kfree(memb);
                   ^~~~~~~~~~~
   fs/dlm/member.c:369:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(head)) {
           ^
   fs/dlm/member.c:370:10: note: Left side of '&&' is false
                   memb =3D list_entry(head->next, struct dlm_member, list);
                          ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/dlm/member.c:370:10: note: Taking false branch
                   memb =3D list_entry(head->next, struct dlm_member, list);
                          ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/dlm/member.c:370:10: note: Loop condition is false.  Exiting loop
                   memb =3D list_entry(head->next, struct dlm_member, list);
                          ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/dlm/member.c:371:3: note: Calling 'list_del'
                   list_del(&memb->list);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> arch/x86/crypto/sm4_aesni_avx_glue.c:336:4: warning: Value stored to 'ds=
t' is never read [clang-analyzer-deadcode.DeadStores]
                           dst +=3D nbytes;
                           ^      ~~~~~~
   arch/x86/crypto/sm4_aesni_avx_glue.c:336:4: note: Value stored to 'dst' =
is never read
                           dst +=3D nbytes;
                           ^      ~~~~~~
>> arch/x86/crypto/sm4_aesni_avx_glue.c:337:4: warning: Value stored to 'sr=
c' is never read [clang-analyzer-deadcode.DeadStores]
                           src +=3D nbytes;
                           ^      ~~~~~~
   arch/x86/crypto/sm4_aesni_avx_glue.c:337:4: note: Value stored to 'src' =
is never read
                           src +=3D nbytes;
                           ^      ~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/ntfs/aops.c:1164:5: warning: 1st function call argument is an uniniti=
alized value [clang-analyzer-core.CallAndMessage]
                                   clear_buffer_dirty(bhs[i]);
                                   ^                  ~~~~~~
   fs/ntfs/aops.c:917:14: note: Assuming 'rec_size' is >=3D NTFS_BLOCK_SIZE
           if (WARN_ON(rec_size < NTFS_BLOCK_SIZE))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/ntfs/aops.c:917:6: note: Taking false branch
           if (WARN_ON(rec_size < NTFS_BLOCK_SIZE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/ntfs/aops.c:917:2: note: Taking false branch
           if (WARN_ON(rec_size < NTFS_BLOCK_SIZE))
           ^
   fs/ntfs/aops.c:922:2: note: Assuming the condition is false
           BUG_ON(!NInoNonResident(ni));
           ^
   include/asm-generic/bug.h:65:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/aops.c:922:2: note: Taking false branch
           BUG_ON(!NInoNonResident(ni));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ntfs/aops.c:922:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!NInoNonResident(ni));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ntfs/aops.c:923:2: note: Assuming the condition is false
           BUG_ON(!NInoMstProtected(ni));
           ^
   include/asm-generic/bug.h:65:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/aops.c:923:2: note: Taking false branch
           BUG_ON(!NInoMstProtected(ni));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ntfs/aops.c:923:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!NInoMstProtected(ni));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ntfs/aops.c:924:12: note: Assuming the condition is false
           is_mft =3D (S_ISREG(vi->i_mode) && !vi->i_ino);
                     ^
   include/uapi/linux/stat.h:22:21: note: expanded from macro 'S_ISREG'
   #define S_ISREG(m)      (((m) & S_IFMT) =3D=3D S_IFREG)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/aops.c:924:32: note: Left side of '&&' is false
           is_mft =3D (S_ISREG(vi->i_mode) && !vi->i_ino);
                                         ^
   fs/ntfs/aops.c:931:11: note: 'is_mft' is false
           BUG_ON(!(is_mft || S_ISDIR(vi->i_mode) ||
                    ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)

vim +/dst +336 arch/x86/crypto/sm4_aesni_avx_glue.c

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  279  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  280  static int ctr_crypt(struct s=
kcipher_request *req)
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  281  {
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  282  	struct crypto_skcipher *tfm =
=3D crypto_skcipher_reqtfm(req);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  283  	struct sm4_ctx *ctx =3D cryp=
to_skcipher_ctx(tfm);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  284  	struct skcipher_walk walk;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  285  	unsigned int nbytes;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  286  	int err;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  287  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  288  	err =3D skcipher_walk_virt(&=
walk, req, false);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  289  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  290  	while ((nbytes =3D walk.nbyt=
es) > 0) {
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  291  		const u8 *src =3D walk.src.=
virt.addr;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  292  		u8 *dst =3D walk.dst.virt.a=
ddr;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  293  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  294  		kernel_fpu_begin();
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  295  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  296  		while (nbytes >=3D SM4_CRYP=
T8_BLOCK_SIZE) {
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  297  			sm4_aesni_avx_ctr_enc_blk8=
(ctx->rkey_enc, dst,
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  298  						src, walk.iv);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  299  			dst +=3D SM4_CRYPT8_BLOCK_=
SIZE;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  300  			src +=3D SM4_CRYPT8_BLOCK_=
SIZE;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  301  			nbytes -=3D SM4_CRYPT8_BLO=
CK_SIZE;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  302  		}
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  303  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  304  		if (nbytes >=3D SM4_BLOCK_S=
IZE) {
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  305  			u8 keystream[SM4_BLOCK_SIZ=
E * 8];
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  306  			unsigned int nblocks =3D m=
in(nbytes >> 4, 8u);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  307  			int i;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  308  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  309  			for (i =3D 0; i < nblocks;=
 i++) {
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  310  				memcpy(&keystream[i * SM4=
_BLOCK_SIZE],
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  311  					walk.iv, SM4_BLOCK_SIZE);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  312  				crypto_inc(walk.iv, SM4_B=
LOCK_SIZE);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  313  			}
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  314  			sm4_aesni_avx_crypt8(ctx->=
rkey_enc, keystream,
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  315  					keystream, nblocks);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  316  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  317  			crypto_xor_cpy(dst, src, k=
eystream,
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  318  					nblocks * SM4_BLOCK_SIZE=
);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  319  			dst +=3D nblocks * SM4_BLO=
CK_SIZE;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  320  			src +=3D nblocks * SM4_BLO=
CK_SIZE;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  321  			nbytes -=3D nblocks * SM4_=
BLOCK_SIZE;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  322  		}
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  323  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  324  		kernel_fpu_end();
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  325  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  326  		/* tail */
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  327  		if (walk.nbytes =3D=3D walk=
.total && nbytes > 0) {
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  328  			u8 keystream[SM4_BLOCK_SIZ=
E];
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  329  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  330  			memcpy(keystream, walk.iv,=
 SM4_BLOCK_SIZE);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  331  			crypto_inc(walk.iv, SM4_BL=
OCK_SIZE);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  332  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  333  			sm4_crypt_block(ctx->rkey_=
enc, keystream, keystream);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  334  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  335  			crypto_xor_cpy(dst, src, k=
eystream, nbytes);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20 @336  			dst +=3D nbytes;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20 @337  			src +=3D nbytes;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  338  			nbytes =3D 0;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  339  		}
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  340  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  341  		err =3D skcipher_walk_done(=
&walk, nbytes);
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  342  	}
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  343  =

a7ee22ee1445c7 Tianjia Zhang 2021-07-20  344  	return err;
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  345  }
a7ee22ee1445c7 Tianjia Zhang 2021-07-20  346  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0982451893133388589==--


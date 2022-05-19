Content-Type: multipart/mixed; boundary="===============8166350065378335853=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: Invalid instruction cache after copy the xol area
Date: Thu, 19 May 2022 11:23:02 +0800
Message-ID: <202205191114.vxK8wEiI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8166350065378335853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220518081753.29589-1-po-kai.chi@sifive.com>
References: <20220518081753.29589-1-po-kai.chi@sifive.com>
TO: "Po-Kai Chi" <po-kai.chi@sifive.com>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: linux-riscv(a)lists.infradead.org
TO: linux-kernel(a)vger.kernel.org
CC: "Po-Kai Chi" <po-kai.chi@sifive.com>

Hi Po-Kai,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Po-Kai-Chi/riscv-Inv=
alid-instruction-cache-after-copy-the-xol-area/20220518-162054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
210e04ff768142b96452030c4c2627512b30ad95
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-randconfig-c006-20220518 (https://download.01.org/0day-ci/arc=
hive/20220519/202205191114.vxK8wEiI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/363d56cc11ac60e351b=
4ebe886faacc40864e6a9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Po-Kai-Chi/riscv-Invalid-instructi=
on-cache-after-copy-the-xol-area/20220518-162054
        git checkout 363d56cc11ac60e351b4ebe886faacc40864e6a9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/crypto/keysetup_v1.c:279:8: note: Calling 'derive_key_aes'
           err =3D derive_key_aes(raw_master_key, ci->ci_nonce,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/crypto/keysetup_v1.c:57:2: note: Taking false branch
           if (IS_ERR(tfm)) {
           ^
   fs/crypto/keysetup_v1.c:63:8: note: Calling 'skcipher_request_alloc'
           req =3D skcipher_request_alloc(tfm, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/skcipher.h:502:8: note: Memory is allocated
           req =3D kmalloc(sizeof(struct skcipher_request) +
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/skcipher.h:505:6: note: Assuming 'req' is non-null
           if (likely(req))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   include/crypto/skcipher.h:505:2: note: Taking true branch
           if (likely(req))
           ^
   fs/crypto/keysetup_v1.c:63:8: note: Returned allocated memory
           req =3D skcipher_request_alloc(tfm, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/crypto/keysetup_v1.c:64:7: note: 'req' is non-null
           if (!req) {
                ^~~
   fs/crypto/keysetup_v1.c:64:2: note: Taking false branch
           if (!req) {
           ^
   fs/crypto/keysetup_v1.c:72:6: note: Assuming 'res' is < 0
           if (res < 0)
               ^~~~~~~
   fs/crypto/keysetup_v1.c:72:2: note: Taking true branch
           if (res < 0)
           ^
   fs/crypto/keysetup_v1.c:73:3: note: Control jumps to line 81
                   goto out;
                   ^
   fs/crypto/keysetup_v1.c:82:2: note: Potential leak of memory pointed to =
by 'req'
           crypto_free_skcipher(tfm);
           ^
   fs/crypto/keysetup_v1.c:192:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&hash_key, ci->ci_policy.v1.master_key_descriptor,
           ^~~~~~
   fs/crypto/keysetup_v1.c:192:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(&hash_key, ci->ci_policy.v1.master_key_descriptor,
           ^~~~~~
   fs/crypto/keysetup_v1.c:239:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dk->dk_descriptor, ci->ci_policy.v1.master_key_descriptor,
           ^~~~~~
   fs/crypto/keysetup_v1.c:239:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(dk->dk_descriptor, ci->ci_policy.v1.master_key_descriptor,
           ^~~~~~
   fs/crypto/keysetup_v1.c:241:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dk->dk_raw, raw_key, ci->ci_mode->keysize);
           ^~~~~~
   fs/crypto/keysetup_v1.c:241:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(dk->dk_raw, raw_key, ci->ci_mode->keysize);
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   crypto/jitterentropy-kcapi.c:69:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dest, src, n);
           ^~~~~~
   crypto/jitterentropy-kcapi.c:69:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(dest, src, n);
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   crypto/ghash-generic.c:50:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dctx, 0, sizeof(*dctx));
           ^~~~~~
   crypto/ghash-generic.c:50:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(dctx, 0, sizeof(*dctx));
           ^~~~~~
   crypto/ghash-generic.c:68:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&k, key, GHASH_BLOCK_SIZE); /* avoid violating alignment =
rules */
           ^~~~~~
   crypto/ghash-generic.c:68:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(&k, key, GHASH_BLOCK_SIZE); /* avoid violating alignment =
rules */
           ^~~~~~
   crypto/ghash-generic.c:138:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, buf, GHASH_BLOCK_SIZE);
           ^~~~~~
   crypto/ghash-generic.c:138:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(dst, buf, GHASH_BLOCK_SIZE);
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
>> arch/riscv/kernel/probes/uprobes.c:168:16: warning: Value stored to 'add=
r' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           unsigned long addr =3D (unsigned long)dst;
                         ^~~~   ~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/probes/uprobes.c:168:16: note: Value stored to 'addr' =
during its initialization is never read
           unsigned long addr =3D (unsigned long)dst;
                         ^~~~   ~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/probes/uprobes.c:170:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, len);
           ^~~~~~
   arch/riscv/kernel/probes/uprobes.c:170:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, len);
           ^~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   arch/riscv/kernel/module.c:190:12: warning: Value stored to 'offset' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           ptrdiff_t offset =3D (void *)v - (void *)location;
                     ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/module.c:190:12: note: Value stored to 'offset' during=
 its initialization is never read
           ptrdiff_t offset =3D (void *)v - (void *)location;
                     ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   fs/btrfs/file.c:287:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&range, 0, sizeof(range));
           ^~~~~~
   fs/btrfs/file.c:287:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(&range, 0, sizeof(range));
           ^~~~~~
   fs/btrfs/file.c:528:3: warning: Value stored to 'modified' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   modified =3D false;
                   ^          ~~~~~
   fs/btrfs/file.c:528:3: note: Value stored to 'modified' is never read
                   modified =3D false;
                   ^          ~~~~~
   fs/btrfs/file.c:816:4: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&new_key, &key, sizeof(new_key));
                           ^~~~~~
   fs/btrfs/file.c:816:4: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                           memcpy(&new_key, &key, sizeof(new_key));
                           ^~~~~~
   fs/btrfs/file.c:872:4: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&new_key, &key, sizeof(new_key));
                           ^~~~~~
   fs/btrfs/file.c:872:4: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                           memcpy(&new_key, &key, sizeof(new_key));
                           ^~~~~~
   fs/btrfs/file.c:1121:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&new_key, &key, sizeof(new_key));
           ^~~~~~
   fs/btrfs/file.c:1121:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(&new_key, &key, sizeof(new_key));
           ^~~~~~
   fs/btrfs/file.c:1379:5: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                                   err =3D 0;
                                   ^     ~
   fs/btrfs/file.c:1379:5: note: Value stored to 'err' is never read
                                   err =3D 0;
                                   ^     ~
   fs/btrfs/file.c:2897:19: warning: Access to field 'block_rsv' results in=
 a dereference of a null pointer (loaded from variable 'trans') [clang-anal=
yzer-core.NullDereference]
           trans->block_rsv =3D &fs_info->trans_block_rsv;
           ~~~~~            ^
   fs/btrfs/file.c:2738:6: note: Assuming 'end' is > 'start'
           if (end <=3D start)
               ^~~~~~~~~~~~
   fs/btrfs/file.c:2738:2: note: Taking false branch
           if (end <=3D start)
           ^
   fs/btrfs/file.c:2742:6: note: Assuming 'rsv' is non-null
           if (!rsv) {
               ^~~~
   fs/btrfs/file.c:2742:2: note: Taking false branch
           if (!rsv) {
           ^
   fs/btrfs/file.c:2755:6: note: Left side of '||' is false
           if (!btrfs_fs_incompat(fs_info, NO_HOLES) || extent_info)
               ^
   fs/btrfs/file.c:2755:6: note: Assuming pointer value is null
           if (!btrfs_fs_incompat(fs_info, NO_HOLES) || extent_info)

vim +/addr +168 arch/riscv/kernel/probes/uprobes.c

74784081aac8a0 Guo Ren    2020-12-17  161  =

74784081aac8a0 Guo Ren    2020-12-17  162  void arch_uprobe_copy_ixol(struc=
t page *page, unsigned long vaddr,
74784081aac8a0 Guo Ren    2020-12-17  163  			   void *src, unsigned long l=
en)
74784081aac8a0 Guo Ren    2020-12-17  164  {
74784081aac8a0 Guo Ren    2020-12-17  165  	/* Initialize the slot */
74784081aac8a0 Guo Ren    2020-12-17  166  	void *kaddr =3D kmap_atomic(pag=
e);
74784081aac8a0 Guo Ren    2020-12-17  167  	void *dst =3D kaddr + (vaddr & =
~PAGE_MASK);
363d56cc11ac60 Po-Kai Chi 2022-05-18 @168  	unsigned long addr =3D (unsigne=
d long)dst;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8166350065378335853==--


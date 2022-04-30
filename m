Content-Type: multipart/mixed; boundary="===============0910413964303202385=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hnaz-mm:master 344/410] mm/mmap.c:1214:2: warning: Value stored to 'prev' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 30 Apr 2022 12:41:09 +0800
Message-ID: <202204301252.MRpyQpHS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0910413964303202385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Johannes Weiner <hannes@cmpxchg.org>

Hi Andrew,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/hnaz/linux-mm master
head:   bf4803abaa3e9d2fa207c0675a2d2abf0fd44f66
commit: 6b3cc214cfc53b4a25c450878a054f35c54152a8 [344/410] mapletree-vs-khu=
gepaged
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20430/202204301252.MRpyQpHS-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/hnaz/linux-mm/commit/6b3cc214cfc53b4a25c450878=
a054f35c54152a8
        git remote add hnaz-mm https://github.com/hnaz/linux-mm
        git fetch --no-tags hnaz-mm master
        git checkout 6b3cc214cfc53b4a25c450878a054f35c54152a8
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   arch/x86/include/asm/paravirt_types.h:404:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^       ~~~~~
   arch/x86/mm/tlb.c:1260:8: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D sprintf(buf, "%ld\n", tlb_single_page_flush_ceiling);
                 ^~~~~~~
   arch/x86/mm/tlb.c:1260:8: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           len =3D sprintf(buf, "%ld\n", tlb_single_page_flush_ceiling);
                 ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   ipc/msgutil.c:128:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst + 1, src + 1, alen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   ipc/msgutil.c:128:2: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
           memcpy(dst + 1, src + 1, alen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   ipc/msgutil.c:136:3: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst_pseg + 1, src_pseg + 1, alen);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   ipc/msgutil.c:136:3: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
                   memcpy(dst_pseg + 1, src_pseg + 1, alen);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   mm/sparse-vmemmap.c:573:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, size);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   mm/sparse-vmemmap.c:573:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(p, 0, size);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> mm/sparse-vmemmap.c:740:17: warning: Value stored to 'next' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
                   unsigned long next =3D addr, last =3D addr + size;
                                 ^~~~   ~~~~
   mm/sparse-vmemmap.c:740:17: note: Value stored to 'next' during its init=
ialization is never read
                   unsigned long next =3D addr, last =3D addr + size;
                                 ^~~~   ~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   fs/ecryptfs/crypto.c:92:2: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf((*algified_name), algified_name_len, "%s(%s)",
           ^~~~~~~~
   fs/ecryptfs/crypto.c:92:2: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           snprintf((*algified_name), algified_name_len, "%s(%s)",
           ^~~~~~~~
   fs/ecryptfs/crypto.c:125:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(src, crypt_stat->root_iv, crypt_stat->iv_bytes);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ecryptfs/crypto.c:125:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(src, crypt_stat->root_iv, crypt_stat->iv_bytes);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ecryptfs/crypto.c:126:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((src + crypt_stat->iv_bytes), 0, 16);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ecryptfs/crypto.c:126:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset((src + crypt_stat->iv_bytes), 0, 16);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ecryptfs/crypto.c:127:2: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf((src + crypt_stat->iv_bytes), 16, "%lld", offset);
           ^~~~~~~~
   fs/ecryptfs/crypto.c:127:2: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
           snprintf((src + crypt_stat->iv_bytes), 16, "%lld", offset);
           ^~~~~~~~
   fs/ecryptfs/crypto.c:139:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv, dst, crypt_stat->iv_bytes);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ecryptfs/crypto.c:139:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(iv, dst, crypt_stat->iv_bytes);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ecryptfs/crypto.c:168:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
--
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f34v7.c:84:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&data_1_5, 0, sizeof(data_1_5));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f34v7.c:532:3: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(f34->configuration_id, sizeof(f34->configuratio=
n_id),
                   ^~~~~~~~
   drivers/input/rmi4/rmi_f34v7.c:532:3: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(f34->configuration_id, sizeof(f34->configuratio=
n_id),
                   ^~~~~~~~
   drivers/input/rmi4/rmi_f34v7.c:1158:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&f34->v7.img, 0x00, sizeof(f34->v7.img));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f34v7.c:1158:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&f34->v7.img, 0x00, sizeof(f34->v7.img));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f34v7.c:1378:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&f34->v7.blkcount, 0x00, sizeof(f34->v7.blkcount));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f34v7.c:1378:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&f34->v7.blkcount, 0x00, sizeof(f34->v7.blkcount));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f34v7.c:1379:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&f34->v7.phyaddr, 0x00, sizeof(f34->v7.phyaddr));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f34v7.c:1379:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&f34->v7.phyaddr, 0x00, sizeof(f34->v7.phyaddr));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> mm/mlock.c:535:3: warning: Value stored to 'mm' is never read [clang-ana=
lyzer-deadcode.DeadStores]
                   mm =3D current->mm;
                   ^
   mm/mlock.c:535:3: note: Value stored to 'mm' is never read
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/iommu/iommu.c:420:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", group->name);
                  ^~~~~~~
   drivers/iommu/iommu.c:420:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", group->name);
                  ^~~~~~~
   drivers/iommu/iommu.c:532:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   str +=3D sprintf(str, "0x%016llx 0x%016llx %s\n",
                          ^~~~~~~
   drivers/iommu/iommu.c:532:10: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   str +=3D sprintf(str, "0x%016llx 0x%016llx %s\n",
                          ^~~~~~~
   drivers/iommu/iommu.c:569:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:569:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:1729:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&gtype, 0, sizeof(gtype));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:1729:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&gtype, 0, sizeof(gtype));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   include/linux/iommu.h:407:9: warning: Access to field 'iommu_dev' result=
s in a dereference of a null pointer (loaded from field 'iommu') [clang-ana=
lyzer-core.NullDereference]
           return dev->iommu->iommu_dev->ops;
                  ^
   drivers/iommu/iommu.c:1655:6: note: Assuming 'action' is equal to BUS_NO=
TIFY_ADD_DEVICE
           if (action =3D=3D BUS_NOTIFY_ADD_DEVICE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:1655:2: note: Taking true branch
           if (action =3D=3D BUS_NOTIFY_ADD_DEVICE) {
           ^
   drivers/iommu/iommu.c:1658:9: note: Calling 'iommu_probe_device'
                   ret =3D iommu_probe_device(dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:278:8: note: Calling '__iommu_probe_device'
           ret =3D __iommu_probe_device(dev, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:227:6: note: Assuming 'ops' is non-null
           if (!ops)
               ^~~~
   drivers/iommu/iommu.c:227:2: note: Taking false branch
           if (!ops)
           ^
   drivers/iommu/iommu.c:230:7: note: Calling 'dev_iommu_get'
           if (!dev_iommu_get(dev))
                ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:196:6: note: Assuming 'param' is non-null
           if (param)
               ^~~~~
   drivers/iommu/iommu.c:196:2: note: Taking true branch
           if (param)
           ^
   drivers/iommu/iommu.c:197:3: note: Returning without writing to 'dev->io=
mmu'
                   return param;
                   ^
   drivers/iommu/iommu.c:230:7: note: Returning from 'dev_iommu_get'
           if (!dev_iommu_get(dev))
                ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:230:2: note: Taking false branch
           if (!dev_iommu_get(dev))
           ^
   drivers/iommu/iommu.c:233:6: note: Assuming the condition is false
           if (!try_module_get(ops->owner)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:233:2: note: Taking false branch
           if (!try_module_get(ops->owner)) {
           ^
   drivers/iommu/iommu.c:239:2: note: Taking true branch
           if (IS_ERR(iommu_dev)) {
           ^
   drivers/iommu/iommu.c:241:3: note: Control jumps to line 264
                   goto out_module_put;
                   ^
   drivers/iommu/iommu.c:267:2: note: Calling 'dev_iommu_free'
--
   fs/select.c:997:7: note: Assuming the condition is false
                   if (copy_from_user(walk->entries, ufds + nfds-todo,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/select.c:997:3: note: Taking false branch
                   if (copy_from_user(walk->entries, ufds + nfds-todo,
                   ^
   fs/select.c:1002:8: note: 'todo' is 0
                   if (!todo)
                        ^~~~
   fs/select.c:1002:3: note: Taking true branch
                   if (!todo)
                   ^
   fs/select.c:1003:4: note:  Execution continues on line 1014
                           break;
                           ^
   fs/select.c:1015:12: note: Calling 'do_poll'
           fdcount =3D do_poll(head, &table, end_time);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/select.c:892:23: note: Assuming the condition is false
           __poll_t busy_flag =3D net_busy_loop_on() ? POLL_BUSY_LOOP : 0;
                                ^~~~~~~~~~~~~~~~~~
   fs/select.c:892:23: note: '?' condition is false
   fs/select.c:896:6: note: 'end_time' is null
           if (end_time && !end_time->tv_sec && !end_time->tv_nsec) {
               ^~~~~~~~
   fs/select.c:896:15: note: Left side of '&&' is false
           if (end_time && !end_time->tv_sec && !end_time->tv_nsec) {
                        ^
   fs/select.c:901:6: note: 'end_time' is null
           if (end_time && !timed_out)
               ^~~~~~~~
   fs/select.c:901:15: note: Left side of '&&' is false
           if (end_time && !timed_out)
                        ^
   fs/select.c:904:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   fs/select.c:908:3: note: Loop condition is true.  Entering loop body
                   for (walk =3D list; walk !=3D NULL; walk =3D walk->next)=
 {
                   ^
   fs/select.c:913:11: note: 'pfd' is not equal to 'pfd_end'
                           for (; pfd !=3D pfd_end; pfd++) {
                                  ^~~
   fs/select.c:913:4: note: Loop condition is true.  Entering loop body
                           for (; pfd !=3D pfd_end; pfd++) {
                           ^
   fs/select.c:921:9: note: Calling 'do_pollfd'
                                   if (do_pollfd(pfd, pt, &can_busy_loop,
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/select.c:859:2: note: Assigned value is garbage or undefined
           int fd =3D pollfd->fd;
           ^        ~~~~~~~~~~
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   arch/x86/include/asm/paravirt.h:97:2: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           PVOP_VCALL1(mmu.exit_mmap, mm);
           ^
   arch/x86/include/asm/paravirt_types.h:530:2: note: expanded from macro '=
PVOP_VCALL1'
           __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
           ^
   arch/x86/include/asm/paravirt_types.h:491:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^
   arch/x86/include/asm/paravirt_types.h:446:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^
   arch/x86/include/asm/paravirt_types.h:404:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^
   mm/mmap.c:3117:6: note: Assuming the condition is false
           if (unlikely(mm_is_oom_victim(mm))) {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mmap.c:3117:2: note: Taking false branch
           if (unlikely(mm_is_oom_victim(mm))) {
           ^
   mm/mmap.c:3134:2: note: Calling 'arch_exit_mmap'
           arch_exit_mmap(mm);
           ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:176:2: note: Calling 'paravirt_arch_e=
xit_mmap'
           paravirt_arch_exit_mmap(mm);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:97:2: note: Assigned value is garbage or=
 undefined
           PVOP_VCALL1(mmu.exit_mmap, mm);
           ^
   arch/x86/include/asm/paravirt_types.h:530:2: note: expanded from macro '=
PVOP_VCALL1'
           __PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:491:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:446:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:404:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^       ~~~~~
>> mm/mmap.c:1214:2: warning: Value stored to 'prev' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           prev =3D mas_prev(&mas, 0);
           ^      ~~~~~~~~~~~~~~~~~
   mm/mmap.c:1214:2: note: Value stored to 'prev' is never read
           prev =3D mas_prev(&mas, 0);
           ^      ~~~~~~~~~~~~~~~~~
   mm/mmap.c:3230:3: warning: Value stored to 'faulted_in_anon_vma' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   faulted_in_anon_vma =3D false;
                   ^                     ~~~~~
   mm/mmap.c:3230:3: note: Value stored to 'faulted_in_anon_vma' is never r=
ead
                   faulted_in_anon_vma =3D false;
                   ^                     ~~~~~
   mm/mmap.c:3688:2: warning: Value stored to 'ret' is never read [clang-an=
alyzer-deadcode.DeadStores]
           ret =3D percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
           ^
   mm/mmap.c:3688:2: note: Value stored to 'ret' is never read
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   net/core/flow_offload.c:208:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cookie->cookie, data, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/core/flow_offload.c:208:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(cookie->cookie, data, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/core/flow_offload.c:388:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&bo, 0, sizeof(bo));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/core/flow_offload.c:388:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(&bo, 0, sizeof(bo));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/xfs/libxfs/xfs_attr.c:1243:2: warning: Value stored to 'error' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr.c:1243:2: note: Value stored to 'error' is never =
read
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   82 warnings generated.
   fs/xfs/libxfs/xfs_attr_leaf.c:510:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(args->value, value, valuelen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:510:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(args->value, value, valuelen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'

vim +/prev +1214 mm/mmap.c

d0e9fe1758f222 Linus Torvalds  2010-04-10  1191  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1192  /*
^1da177e4c3f41 Linus Torvalds  2005-04-16  1193   * find_mergeable_anon_vma=
 is used by anon_vma_prepare, to check
^1da177e4c3f41 Linus Torvalds  2005-04-16  1194   * neighbouring vmas for a=
 suitable anon_vma, before it goes off
^1da177e4c3f41 Linus Torvalds  2005-04-16  1195   * to allocate a new anon_=
vma.  It checks because a repetitive
^1da177e4c3f41 Linus Torvalds  2005-04-16  1196   * sequence of mprotects a=
nd faults may otherwise lead to distinct
^1da177e4c3f41 Linus Torvalds  2005-04-16  1197   * anon_vmas being allocat=
ed, preventing vma merge in subsequent
^1da177e4c3f41 Linus Torvalds  2005-04-16  1198   * mprotect.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1199   */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1200  struct anon_vma *find_merg=
eable_anon_vma(struct vm_area_struct *vma)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1201  {
7ecb5aaf015a98 Liam R. Howlett 2022-04-26  1202  	MA_STATE(mas, &vma->vm_mm=
->mm_mt, vma->vm_end, vma->vm_end);
a67c8caae98f16 Miaohe Lin      2020-01-30  1203  	struct anon_vma *anon_vma=
 =3D NULL;
7ecb5aaf015a98 Liam R. Howlett 2022-04-26  1204  	struct vm_area_struct *pr=
ev, *next;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1205  =

a67c8caae98f16 Miaohe Lin      2020-01-30  1206  	/* Try next first. */
7ecb5aaf015a98 Liam R. Howlett 2022-04-26  1207  	next =3D mas_walk(&mas);
7ecb5aaf015a98 Liam R. Howlett 2022-04-26  1208  	if (next) {
7ecb5aaf015a98 Liam R. Howlett 2022-04-26  1209  		anon_vma =3D reusable_an=
on_vma(next, vma, next);
d0e9fe1758f222 Linus Torvalds  2010-04-10  1210  		if (anon_vma)
d0e9fe1758f222 Linus Torvalds  2010-04-10  1211  			return anon_vma;
a67c8caae98f16 Miaohe Lin      2020-01-30  1212  	}
a67c8caae98f16 Miaohe Lin      2020-01-30  1213  =

7ecb5aaf015a98 Liam R. Howlett 2022-04-26 @1214  	prev =3D mas_prev(&mas, 0=
);
7ecb5aaf015a98 Liam R. Howlett 2022-04-26  1215  	VM_BUG_ON_VMA(prev !=3D v=
ma, vma);
7ecb5aaf015a98 Liam R. Howlett 2022-04-26  1216  	prev =3D mas_prev(&mas, 0=
);
a67c8caae98f16 Miaohe Lin      2020-01-30  1217  	/* Try prev next. */
7ecb5aaf015a98 Liam R. Howlett 2022-04-26  1218  	if (prev)
7ecb5aaf015a98 Liam R. Howlett 2022-04-26  1219  		anon_vma =3D reusable_an=
on_vma(prev, prev, vma);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1220  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  1221  	/*
a67c8caae98f16 Miaohe Lin      2020-01-30  1222  	 * We might reach here wi=
th anon_vma =3D=3D NULL if we can't find
a67c8caae98f16 Miaohe Lin      2020-01-30  1223  	 * any reusable anon_vma.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1224  	 * There's no absolute ne=
ed to look only at touching neighbours:
^1da177e4c3f41 Linus Torvalds  2005-04-16  1225  	 * we could search furthe=
r afield for "compatible" anon_vmas.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1226  	 * But it would probably =
just be a waste of time searching,
^1da177e4c3f41 Linus Torvalds  2005-04-16  1227  	 * or lead to too many vm=
as hanging off the same anon_vma.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1228  	 * We're trying to allow =
mprotect remerging later on,
^1da177e4c3f41 Linus Torvalds  2005-04-16  1229  	 * not trying to minimize=
 memory used for anon_vmas.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1230  	 */
a67c8caae98f16 Miaohe Lin      2020-01-30  1231  	return anon_vma;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1232  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1233  =


:::::: The code at line 1214 was first introduced by commit
:::::: 7ecb5aaf015a98afe2a4ecc0a647f636995390ac mm: remove the vma linked l=
ist

:::::: TO: Liam R. Howlett <Liam.Howlett@Oracle.com>
:::::: CC: Johannes Weiner <hannes@cmpxchg.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0910413964303202385==--


Content-Type: multipart/mixed; boundary="===============0659654053164704620=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] [v3] Kbuild: move to -std=gnu11
Date: Mon, 14 Mar 2022 20:00:30 +0800
Message-ID: <202203141959.hlQJfKa4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0659654053164704620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220301145233.3689119-1-arnd@kernel.org>
References: <20220301145233.3689119-1-arnd@kernel.org>
TO: Arnd Bergmann <arnd@kernel.org>

Hi Arnd,

I love your patch! Perhaps something to improve:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on drm-intel/for-linux-next staging/staging-testin=
g kdave/for-next soc/for-next linus/master v5.17-rc8]
[cannot apply to masahiroy-kbuild/for-next srcres258-doc/doc-zh-tw next-202=
20310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arnd-Bergmann/Kbuild-move-=
to-std-gnu11/20220301-225348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for=
-next/core
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: mips-randconfig-c004-20220302 (https://download.01.org/0day-ci/arch=
ive/20220314/202203141959.hlQJfKa4-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/afebabb39f6a871f6e6d69f60=
1738fbce1c1b37c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arnd-Bergmann/Kbuild-move-to-std-g=
nu11/20220301-225348
        git checkout afebabb39f6a871f6e6d69f601738fbce1c1b37c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/xfs/libxfs/xfs_dir2_leaf.c:1253:7: note: Assuming 'index' is < field =
'count'
                index < leafhdr->count &&
                ^~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1253:7: note: Left side of '&&' is true
   fs/xfs/libxfs/xfs_dir2_leaf.c:1254:4: note: Assuming 'lep->hashval' is e=
qual to 'args->hashval'
                           be32_to_cpu(lep->hashval) =3D=3D args->hashval;
                           ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:41:26: note: expanded from mac=
ro '__be32_to_cpu'
   #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
                            ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1252:2: note: Loop condition is true.  Ent=
ering loop body
           for (lep =3D &leafhdr->ents[index];
           ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1259:7: note: Assuming field 'address' is =
not equal to XFS_DIR2_NULL_DATAPTR
                   if (be32_to_cpu(lep->address) =3D=3D XFS_DIR2_NULL_DATAP=
TR)
                       ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:41:26: note: expanded from mac=
ro '__be32_to_cpu'
   #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
                            ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1259:3: note: Taking false branch
                   if (be32_to_cpu(lep->address) =3D=3D XFS_DIR2_NULL_DATAP=
TR)
                   ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1270:7: note: Assuming 'newdb' is equal to=
 'curdb'
                   if (newdb !=3D curdb) {
                       ^~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1270:3: note: Taking false branch
                   if (newdb !=3D curdb) {
                   ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1285:43: note: Access to field 'b_addr' re=
sults in a dereference of a null pointer (loaded from variable 'dbp')
                   dep =3D (xfs_dir2_data_entry_t *)((char *)dbp->b_addr +
                                                           ^~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1462:4: warning: Call to function 'memmove=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memmove_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(&bestsp[db - i], bestsp,
                           ^~~~~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1462:4: note: Call to function 'memmove' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memmove_s' in case of C11
                           memmove(&bestsp[db - i], bestsp,
                           ^~~~~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1643:2: warning: Call to function 'memmove=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memmove_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(&bestsp[1], &bestsp[0], be32_to_cpu(ltp->bestcount) * si=
zeof(*bestsp));
           ^~~~~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1643:2: note: Call to function 'memmove' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memmove_s' in case of C11
           memmove(&bestsp[1], &bestsp[0], be32_to_cpu(ltp->bestcount) * si=
zeof(*bestsp));
           ^~~~~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1785:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(xfs_dir2_leaf_bests_p(ltp), freehdr.bests,
           ^~~~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1785:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(xfs_dir2_leaf_bests_p(ltp), freehdr.bests,
           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   crypto/authenc.c:409:6: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authenc.c:409:6: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authenc.c:415:6: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authenc.c:415:6: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   Suppressed 59 warnings (59 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   crypto/authencesn.c:424:6: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authencesn.c:424:6: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authencesn.c:429:6: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/authencesn.c:429:6: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   Suppressed 59 warnings (59 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
>> arch/mips/ath79/setup.c:185:3: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   sprintf(ath79_sys_type, "Qualcomm Atheros QCA%s ver %u r=
ev %u",
                   ^~~~~~~
   arch/mips/ath79/setup.c:185:3: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   sprintf(ath79_sys_type, "Qualcomm Atheros QCA%s ver %u r=
ev %u",
                   ^~~~~~~
   arch/mips/ath79/setup.c:188:3: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   sprintf(ath79_sys_type, "Qualcomm Atheros TP%s rev %u",
                   ^~~~~~~
   arch/mips/ath79/setup.c:188:3: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   sprintf(ath79_sys_type, "Qualcomm Atheros TP%s rev %u",
                   ^~~~~~~
   arch/mips/ath79/setup.c:191:3: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   sprintf(ath79_sys_type, "Atheros AR%s rev %u", chip, rev=
);
                   ^~~~~~~
   arch/mips/ath79/setup.c:191:3: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   sprintf(ath79_sys_type, "Atheros AR%s rev %u", chip, rev=
);
                   ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   lib/kfifo.c:31:9: note: '?' condition is false
           size =3D roundup_pow_of_two(size);
                  ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   lib/kfifo.c:31:9: note: Calling '__roundup_pow_of_two'
           size =3D roundup_pow_of_two(size);
                  ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:154:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:155:10: note: Calling 'fls'
                   return fls(l);
--
               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/string_helpers.c:102:2: note: Taking false branch
           if (units =3D=3D STRING_UNITS_2) {
           ^
   lib/string_helpers.c:112:12: note: Assigned value is garbage or undefined
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   lib/string_helpers.c:119:3: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(tmp, sizeof(tmp), ".%03u", remainder);
                   ^~~~~~~~
   lib/string_helpers.c:119:3: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   snprintf(tmp, sizeof(tmp), ".%03u", remainder);
                   ^~~~~~~~
   lib/string_helpers.c:129:2: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, len, "%u%s %s", (u32)size,
           ^~~~~~~~
   lib/string_helpers.c:129:2: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
           snprintf(buf, len, "%u%s %s", (u32)size,
           ^~~~~~~~
   lib/string_helpers.c:792:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dest + written + 1, 0, count - written - 1);
           ^~~~~~
   lib/string_helpers.c:792:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(dest + written + 1, 0, count - written - 1);
           ^~~~~~
   lib/string_helpers.c:962:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dest, src, count);
                   ^~~~~~
   lib/string_helpers.c:962:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(dest, src, count);
                   ^~~~~~
   lib/string_helpers.c:963:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(dest + count, pad,  dest_len - count);
                   ^~~~~~
   lib/string_helpers.c:963:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(dest + count, pad,  dest_len - count);
                   ^~~~~~
   lib/string_helpers.c:965:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dest, src, dest_len);
                   ^~~~~~
   lib/string_helpers.c:965:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(dest, src, dest_len);
                   ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   crypto/sha3_generic.c:170:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sctx->st, 0, sizeof(sctx->st));
           ^~~~~~
   crypto/sha3_generic.c:170:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(sctx->st, 0, sizeof(sctx->st));
           ^~~~~~
   crypto/sha3_generic.c:188:4: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(sctx->buf + sctx->partial, data,
                           ^~~~~~
   crypto/sha3_generic.c:188:4: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                           memcpy(sctx->buf + sctx->partial, data,
                           ^~~~~~
   crypto/sha3_generic.c:206:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sctx->buf + sctx->partial, src, len - done);
           ^~~~~~
   crypto/sha3_generic.c:206:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(sctx->buf + sctx->partial, src, len - done);
           ^~~~~~
   crypto/sha3_generic.c:221:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sctx->buf + inlen, 0, sctx->rsiz - inlen);
           ^~~~~~
   crypto/sha3_generic.c:221:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(sctx->buf + inlen, 0, sctx->rsiz - inlen);
           ^~~~~~
   crypto/sha3_generic.c:235:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sctx, 0, sizeof(*sctx));
           ^~~~~~
   crypto/sha3_generic.c:235:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(sctx, 0, sizeof(*sctx));
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   kernel/power/hibernate.c:1071:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "[disabled]\n");
                          ^~~~~~~
   kernel/power/hibernate.c:1071:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "[disabled]\n");
                          ^~~~~~~
>> kernel/power/hibernate.c:1091:11: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                           buf +=3D sprintf(buf, "[%s] ", hibernation_modes=
[i]);
                                  ^~~~~~~
   kernel/power/hibernate.c:1091:11: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                           buf +=3D sprintf(buf, "[%s] ", hibernation_modes=
[i]);
                                  ^~~~~~~
   kernel/power/hibernate.c:1093:11: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                           buf +=3D sprintf(buf, "%s ", hibernation_modes[i=
]);
                                  ^~~~~~~
   kernel/power/hibernate.c:1093:11: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                           buf +=3D sprintf(buf, "%s ", hibernation_modes[i=
]);
                                  ^~~~~~~
   kernel/power/hibernate.c:1095:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           buf +=3D sprintf(buf, "\n");
                  ^~~~~~~
   kernel/power/hibernate.c:1095:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           buf +=3D sprintf(buf, "\n");
                  ^~~~~~~
   kernel/power/hibernate.c:1153:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d:%d\n", MAJOR(swsusp_resume_device),
                  ^~~~~~~
   kernel/power/hibernate.c:1153:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d:%d\n", MAJOR(swsusp_resume_device),
                  ^~~~~~~
   kernel/power/hibernate.c:1190:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%llu\n", (unsigned long long)swsusp_resume_=
block);
                  ^~~~~~~
   kernel/power/hibernate.c:1190:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%llu\n", (unsigned long long)swsusp_resume_=
block);
                  ^~~~~~~
   kernel/power/hibernate.c:1213:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", image_size);
                  ^~~~~~~
   kernel/power/hibernate.c:1213:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", image_size);
                  ^~~~~~~
   kernel/power/hibernate.c:1221:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%lu", &size) =3D=3D 1) {
               ^~~~~~
   kernel/power/hibernate.c:1221:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%lu", &size) =3D=3D 1) {
               ^~~~~~
   kernel/power/hibernate.c:1234:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", reserved_size);
                  ^~~~~~~
   kernel/power/hibernate.c:1234:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", reserved_size);
                  ^~~~~~~
   kernel/power/hibernate.c:1243:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%lu", &size) =3D=3D 1) {
               ^~~~~~
   kernel/power/hibernate.c:1243:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%lu", &size) =3D=3D 1) {
               ^~~~~~
   kernel/power/hibernate.c:1281:2: warning: Call to function 'strncpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(resume_file, str, 255);
           ^~~~~~~
   kernel/power/hibernate.c:1281:2: note: Call to function 'strncpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'strncpy_s' in case of C11
           strncpy(resume_file, str, 255);
           ^~~~~~~
   kernel/power/hibernate.c:1292:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(str, "%llu", &offset) =3D=3D 1)
               ^~~~~~
   kernel/power/hibernate.c:1292:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(str, "%llu", &offset) =3D=3D 1)
               ^~~~~~
   Suppressed 39 warnings (38 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
   kernel/bpf/arraymap.c:321:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(this_cpu_ptr(array->pptrs[index & array->index_ma=
sk]),
                   ^~~~~~
   kernel/bpf/arraymap.c:321:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(this_cpu_ptr(array->pptrs[index & array->index_ma=
sk]),
                   ^~~~~~
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   84 warnings generated.
   kernel/bpf/lpm_trie.c:295:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(node->data + trie->data_size, value,
                   ^~~~~~
   kernel/bpf/lpm_trie.c:295:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(node->data + trie->data_size, value,
                   ^~~~~~
   kernel/bpf/lpm_trie.c:340:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_node->data, key->data, trie->data_size);
           ^~~~~~
   kernel/bpf/lpm_trie.c:340:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(new_node->data, key->data, trie->data_size);
           ^~~~~~
   kernel/bpf/lpm_trie.c:404:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(im_node->data, node->data, trie->data_size);
           ^~~~~~
   kernel/bpf/lpm_trie.c:404:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(im_node->data, node->data, trie->data_size);
--
                   ^
   include/linux/page-flags.h:195:23: note: Loop condition is false.  Exiti=
ng loop
           unsigned long head =3D READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/page-flags.h:195:23: note: Dereference of null pointer
           unsigned long head =3D READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/gpu/drm/bridge/tc358767.c:308:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(auxwdata, data, size);
           ^~~~~~
   drivers/gpu/drm/bridge/tc358767.c:308:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(auxwdata, data, size);
           ^~~~~~
   drivers/gpu/drm/bridge/tc358767.c:326:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, auxrdata, size);
           ^~~~~~
   drivers/gpu/drm/bridge/tc358767.c:326:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, auxrdata, size);
           ^~~~~~
   drivers/gpu/drm/bridge/tc358767.c:820:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:820:2: note: Value stored to 'ret' is =
never read
           ret =3D regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:946:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:946:2: note: Value stored to 'ret' is =
never read
           ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:949:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:949:2: note: Value stored to 'ret' is =
never read
           ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/misc/enclosure.c:186:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, "enclosure_device:");
           ^~~~~~
   drivers/misc/enclosure.c:186:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(name, "enclosure_device:");
           ^~~~~~
   drivers/misc/enclosure.c:187:2: warning: Call to function 'strcat' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(name, dev_name(&cdev->cdev));
           ^~~~~~
   drivers/misc/enclosure.c:187:2: note: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119
           strcat(name, dev_name(&cdev->cdev));
           ^~~~~~
   drivers/misc/enclosure.c:310:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(newname, COMPONENT_NAME_SIZE,
                   ^~~~~~~~
   drivers/misc/enclosure.c:310:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(newname, COMPONENT_NAME_SIZE,
                   ^~~~~~~~
   drivers/misc/enclosure.c:313:4: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(newname, COMPONENT_NAME_SIZE,
                           ^~~~~~~~
   drivers/misc/enclosure.c:313:4: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                           snprintf(newname, COMPONENT_NAME_SIZE,
                           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
>> drivers/misc/kgdbts.c:240:2: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           sprintf(scratch_buf, "%s,%lx,%i", bp_type, addr,
           ^~~~~~~
   drivers/misc/kgdbts.c:240:2: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           sprintf(scratch_buf, "%s,%lx,%i", bp_type, addr,
           ^~~~~~~
   drivers/misc/kgdbts.c:390:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(scratch_buf, 0, sizeof(scratch_buf));
           ^~~~~~
   drivers/misc/kgdbts.c:390:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(scratch_buf, 0, sizeof(scratch_buf));
           ^~~~~~
   drivers/misc/kgdbts.c:709:2: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(get_buf, buf);
           ^~~~~~
   drivers/misc/kgdbts.c:709:2: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
           strcat(get_buf, buf);
           ^~~~~~
   drivers/misc/kgdbts.c:714:2: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(get_buf, "#");
           ^~~~~~
   drivers/misc/kgdbts.c:714:2: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
           strcat(get_buf, "#");
           ^~~~~~
   drivers/misc/kgdbts.c:832:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ts, 0, sizeof(ts));
           ^~~~~~
   drivers/misc/kgdbts.c:832:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&ts, 0, sizeof(ts));
           ^~~~~~
   drivers/misc/kgdbts.c:1075:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(config, opt);
           ^~~~~~
   drivers/misc/kgdbts.c:1075:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(config, opt);
           ^~~~~~
   drivers/misc/kgdbts.c:1146:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(config, kmessage);
                   ^~~~~~
   drivers/misc/kgdbts.c:1146:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(config, kmessage);
                   ^~~~~~
   drivers/misc/kgdbts.c:1155:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(config, kmessage);
           ^~~~~~
   drivers/misc/kgdbts.c:1155:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(config, kmessage);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/clk/ingenic/cgu.c:512:10: warning: Division by zero [clang-analy=
zer-core.DivideZero]
                   rate =3D DIV_ROUND_UP(parent_rate, div);
                          ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/clk/ingenic/cgu.c:510:6: note: Assuming the condition is true
           if (clk_info->type & CGU_CLK_DIV) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:510:2: note: Taking true branch
           if (clk_info->type & CGU_CLK_DIV) {
           ^
   drivers/clk/ingenic/cgu.c:511:9: note: Calling 'ingenic_clk_calc_div'
                   div =3D ingenic_clk_calc_div(hw, clk_info, parent_rate, =
req_rate);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/ingenic/cgu.c:443:6: note: Assuming the condition is false
           if (clk_info->div.bypass_mask & BIT(parent))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:443:2: note: Taking false branch
           if (clk_info->div.bypass_mask & BIT(parent))
           ^
   drivers/clk/ingenic/cgu.c:449:6: note: Assuming field 'div_table' is non=
-null
           if (clk_info->div.div_table) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:449:2: note: Taking true branch
           if (clk_info->div.div_table) {
           ^
   drivers/clk/ingenic/cgu.c:450:12: note: Calling 'ingenic_clk_calc_hw_div'
                   hw_div =3D ingenic_clk_calc_hw_div(clk_info, div);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:417:18: note: 'best_i' initialized to 0
           unsigned int i, best_i =3D 0, best =3D (unsigned int)-1;
                           ^~~~~~
   drivers/clk/ingenic/cgu.c:419:14: note: Assuming the condition is true
           for (i =3D 0; i < (1 << clk_info->div.bits)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:419:14: note: Left side of '&&' is true
   drivers/clk/ingenic/cgu.c:419:2: note: Loop condition is false. Executio=
n continues on line 431
           for (i =3D 0; i < (1 << clk_info->div.bits)
           ^
   drivers/clk/ingenic/cgu.c:431:2: note: Returning zero (loaded from 'best=
_i')
--
                     ^                         ~~~~~~~~~~~~~~
   drivers/misc/xilinx_sdfec.c:418:16: warning: The left operand of '>=3D' =
is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (turbo.alg >=3D XSDFEC_TURBO_ALG_MAX)
                         ^
   drivers/misc/xilinx_sdfec.c:953:6: note: Assuming field 'state' is not e=
qual to XSDFEC_NEEDS_RESET
           if (xsdfec->state =3D=3D XSDFEC_NEEDS_RESET &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/xilinx_sdfec.c:953:42: note: Left side of '&&' is false
           if (xsdfec->state =3D=3D XSDFEC_NEEDS_RESET &&
                                                   ^
   drivers/misc/xilinx_sdfec.c:959:2: note: Control jumps to 'case 21480340=
52:'  at line 984
           switch (cmd) {
           ^
   drivers/misc/xilinx_sdfec.c:985:10: note: Calling 'xsdfec_set_turbo'
                   rval =3D xsdfec_set_turbo(xsdfec, arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/xilinx_sdfec.c:414:8: note: Calling 'copy_from_user'
           err =3D copy_from_user(&turbo, arg, sizeof(turbo));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
o 'to->alg'
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
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->a=
lg'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->a=
lg'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/misc/xilinx_sdfec.c:414:8: note: Returning from 'copy_from_user'
           err =3D copy_from_user(&turbo, arg, sizeof(turbo));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/xilinx_sdfec.c:415:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/misc/xilinx_sdfec.c:415:2: note: Taking false branch
           if (err)
           ^
   drivers/misc/xilinx_sdfec.c:418:16: note: The left operand of '>=3D' is =
a garbage value
           if (turbo.alg >=3D XSDFEC_TURBO_ALG_MAX)
               ~~~~~~~~~ ^
   drivers/misc/xilinx_sdfec.c:444:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&turbo_params, 0, sizeof(turbo_params));
           ^~~~~~
   drivers/misc/xilinx_sdfec.c:444:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&turbo_params, 0, sizeof(turbo_params));
           ^~~~~~
   drivers/misc/xilinx_sdfec.c:1416:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(xsdfec->dev_name, DEV_NAME_LEN, "xsdfec%d", xsdfec->dev=
_id);
           ^~~~~~~~
   drivers/misc/xilinx_sdfec.c:1416:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(xsdfec->dev_name, DEV_NAME_LEN, "xsdfec%d", xsdfec->dev=
_id);
           ^~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
>> drivers/gpu/drm/drm_dp_aux_dev.c:115:8: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           res =3D sprintf(buf, "%s\n", aux_dev->aux->name);
                 ^~~~~~~
   drivers/gpu/drm/drm_dp_aux_dev.c:115:8: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           res =3D sprintf(buf, "%s\n", aux_dev->aux->name);
                 ^~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/gpu/drm/selftests/test-drm_mm.c:212:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mm, 0, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:212:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&mm, 0, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:218:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mm, 0xff, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:218:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&mm, 0xff, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:236:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:236:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:277:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(nodes, 0, sizeof(nodes));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:277:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(nodes, 0, sizeof(nodes));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:600:4: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(node, 0, sizeof(*node));
                           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:600:4: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                           memset(node, 0, sizeof(*node));
                           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1471:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1471:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1952:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rsvd_lo, 0, sizeof(rsvd_lo));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1952:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&rsvd_lo, 0, sizeof(rsvd_lo));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1961:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rsvd_hi, 0, sizeof(rsvd_hi));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1961:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&rsvd_hi, 0, sizeof(rsvd_hi));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1976:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&node, 0, sizeof(node));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1976:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&node, 0, sizeof(node));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2181:2: warning: Use of memory a=
fter it is freed [clang-analyzer-unix.Malloc]
           drm_mm_for_each_node_safe(node, nn, &mm) {
           ^
   include/drm/drm_mm.h:376:2: note: expanded from macro 'drm_mm_for_each_n=
ode_safe'
           list_for_each_entry_safe(entry, next, drm_mm_nodes(mm), node_lis=
t)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2034:29: note: Assuming '__UNIQU=
E_ID___x238' is >=3D '__UNIQUE_ID___y239'
           const unsigned int count =3D min(4096u, max_iterations);
                                      ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   drivers/gpu/drm/selftests/test-drm_mm.c:2034:29: note: '?' condition is =
false
           const unsigned int count =3D min(4096u, max_iterations);
--
                           ^
   arch/mips/include/asm/cpu-features.h:336:24: note: expanded from macro '=
cpu_has_mips_r'
                            cpu_has_mips64r5 | cpu_has_mips64r6)
                                               ^
   arch/mips/include/asm/cpu-features.h:303:27: note: expanded from macro '=
cpu_has_mips64r6'
   # define cpu_has_mips64r6       __isa_ge_and_flag(6, MIPS_CPU_ISA_M64R6)
                                   ^
   arch/mips/include/asm/cpu-features.h:60:63: note: expanded from macro '_=
_isa_ge_and_flag'
   #define __isa_ge_and_flag(isa, flag)    ((MIPS_ISA_REV >=3D (isa)) && __=
isa(flag))
                                                                    ^
   arch/mips/include/asm/bitops.h:390:44: note: Left side of '&&' is false
               __builtin_constant_p(cpu_has_clo_clz) && cpu_has_clo_clz) {
                                                     ^
   arch/mips/include/asm/bitops.h:402:2: note: The value 32 is assigned to =
'r'
           r =3D 32;
           ^~~~~~
   arch/mips/include/asm/bitops.h:403:6: note: Assuming 'x' is not equal to=
 0, which participates in a condition later
           if (!x)
               ^~
   arch/mips/include/asm/bitops.h:403:2: note: Taking false branch
           if (!x)
           ^
   arch/mips/include/asm/bitops.h:405:6: note: Assuming the condition is fa=
lse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:405:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   arch/mips/include/asm/bitops.h:409:6: note: Assuming the condition is fa=
lse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:409:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   arch/mips/include/asm/bitops.h:413:6: note: Assuming the condition is fa=
lse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:413:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   arch/mips/include/asm/bitops.h:417:6: note: Assuming the condition is fa=
lse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:417:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   arch/mips/include/asm/bitops.h:421:6: note: Assuming the condition is fa=
lse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:421:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   arch/mips/include/asm/bitops.h:425:2: note: Returning the value 32 (load=
ed from 'r')
           return r;
           ^~~~~~~~
   drivers/net/can/dev/rx-offload.c:335:36: note: Returning from 'fls'
           offload->skb_queue_len_max =3D 2 << fls(weight);
                                             ^~~~~~~~~~~
   drivers/net/can/dev/rx-offload.c:335:33: note: The result of the left sh=
ift is undefined due to shifting by '32', which is greater or equal to the =
width of type 'int'
           offload->skb_queue_len_max =3D 2 << fls(weight);
                                          ^  ~~~~~~~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/input/misc/yealink.c:288:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:288:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:305:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p->data, &buf[ix], len);
                   ^~~~~~
   drivers/input/misc/yealink.c:305:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(p->data, &buf[ix], len);
                   ^~~~~~
   drivers/input/misc/yealink.c:321:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:321:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:516:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:516:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:558:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &map_seg7, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:558:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &map_seg7, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:567:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&map_seg7, buf, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:567:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&map_seg7, buf, sizeof(map_seg7));
           ^~~~~~
>> drivers/input/misc/yealink.c:691:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                   ret +=3D sprintf(&buf[ret], "%s %s\n",
                          ^~~~~~~
   drivers/input/misc/yealink.c:691:10: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                   ret +=3D sprintf(&buf[ret], "%s %s\n",
                          ^~~~~~~
   drivers/input/misc/yealink.c:979:2: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           ret =3D sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/yealink.c:979:2: note: Value stored to 'ret' is never=
 read
           ret =3D sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/mfd/ti-lmu.c:159:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&regmap_cfg, 0, sizeof(struct regmap_config));
           ^~~~~~
   drivers/mfd/ti-lmu.c:159:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&regmap_cfg, 0, sizeof(struct regmap_config));
           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/ata/libata-sff.c:611:4: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, pad, slop);
                           ^~~~~~
   drivers/ata/libata-sff.c:611:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf, pad, slop);
                           ^~~~~~
   drivers/ata/libata-sff.c:613:4: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pad, buf, slop);
                           ^~~~~~
   drivers/ata/libata-sff.c:613:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(pad, buf, slop);
                           ^~~~~~
   drivers/ata/libata-sff.c:1278:27: warning: Access to field 'active_tag' =
results in a dereference of a null pointer (loaded from variable 'link') [c=
lang-analyzer-core.NullDereference]
           qc =3D ata_qc_from_tag(ap, link->active_tag);
                                    ^~~~
   drivers/ata/libata-sff.c:1269:2: note: 'link' initialized here
           struct ata_link *link =3D ap->sff_pio_task_link;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-sff.c:1276:9: note: Assuming field 'sff_pio_task_link=
' is equal to null
           BUG_ON(ap->sff_pio_task_link =3D=3D NULL);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/ata/libata-sff.c:1278:27: note: Access to field 'active_tag' res=
ults in a dereference of a null pointer (loaded from variable 'link')
           qc =3D ata_qc_from_tag(ap, link->active_tag);
                                    ^~~~
   drivers/ata/libata-sff.c:1814:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tf, 0, sizeof(tf));
           ^~~~~~
   drivers/ata/libata-sff.c:1814:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&tf, 0, sizeof(tf));
           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/base/regmap/regcache-rbtree.c:293:3: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(present + BITS_TO_LONGS(rbnode->blklen), 0,
                   ^~~~~~
   drivers/base/regmap/regcache-rbtree.c:293:3: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
                   memset(present + BITS_TO_LONGS(rbnode->blklen), 0,
                   ^~~~~~
   drivers/base/regmap/regcache-rbtree.c:302:3: warning: Call to function '=
memmove' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memmove_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(blk + offset * map->cache_word_size,
                   ^~~~~~~
   drivers/base/regmap/regcache-rbtree.c:302:3: note: Call to function 'mem=
move' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(blk + offset * map->cache_word_size,
                   ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/base/regmap/regmap-debugfs.c:31:9: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(NULL, 0, "%x", max_val);
                  ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:31:9: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(NULL, 0, "%x", max_val);
                  ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:50:8: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, PAGE_SIZE, "%s\n", name);
                 ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:50:8: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, PAGE_SIZE, "%s\n", name);
                 ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:251:4: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(buf + buf_pos, count - buf_pos, "%.*x: =
",
                           ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:251:4: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(buf + buf_pos, count - buf_pos, "%.*x: =
",
                           ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:258:5: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   snprintf(buf + buf_pos, count - buf_pos,
--
   fs/btrfs/ctree.h:1641:9: note: expanded from macro 'BTRFS_SETGET_STACK_F=
UNCS'
           return get_unaligned_le##bits(&s->member);                      \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   include/asm-generic/unaligned.h:37:21: note: '__pptr' initialized to a n=
ull pointer value
           return le64_to_cpu(__get_unaligned_t(__le64, p));
                              ^
   include/asm-generic/unaligned.h:13:37: note: expanded from macro '__get_=
unaligned_t'
           const struct { type x; } __packed *__pptr =3D (typeof(__pptr))(p=
tr);      \
                                              ^~~~~~
   include/uapi/linux/byteorder/big_endian.h:33:59: note: expanded from mac=
ro '__le64_to_cpu'
   #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
                                                             ^
   include/uapi/linux/swab.h:128:54: note: expanded from macro '__swab64'
   #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
                                                        ^
   include/asm-generic/unaligned.h:37:21: note: Access to field 'x' results=
 in a dereference of a null pointer (loaded from variable '__pptr')
           return le64_to_cpu(__get_unaligned_t(__le64, p));
                              ^
   include/asm-generic/unaligned.h:14:2: note: expanded from macro '__get_u=
naligned_t'
           __pptr->x;                                                      =
        \
           ^~~~~~
   include/uapi/linux/byteorder/big_endian.h:33:59: note: expanded from mac=
ro '__le64_to_cpu'
   #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
                                                             ^
   include/uapi/linux/swab.h:128:54: note: expanded from macro '__swab64'
   #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
                                                        ^
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/usb/storage/onetouch.c:213:3: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(onetouch->name, sizeof(onetouch->name),
                   ^~~~~~~~
   drivers/usb/storage/onetouch.c:213:3: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(onetouch->name, sizeof(onetouch->name),
                   ^~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/usb/storage/sddr09.c:240:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, ecc, 3);
           ^~~~~~
   drivers/usb/storage/sddr09.c:240:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, ecc, 3);
           ^~~~~~
   drivers/usb/storage/sddr09.c:352:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:352:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:528:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:528:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:717:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:717:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:796:4: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(buffer, 0, len);
                           ^~~~~~
   drivers/usb/storage/sddr09.c:796:4: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                           memset(buffer, 0, len);
                           ^~~~~~
   drivers/usb/storage/sddr09.c:922:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(bptr, xptr, info->pagesize);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:922:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(bptr, xptr, info->pagesize);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:1076:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:1076:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(command, 0, 12);
           ^~~~~~
   drivers/usb/storage/sddr09.c:1106:3: warning: Value stored to 'wp_fmt' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   wp_fmt =3D " WP";
                   ^        ~~~~~
   drivers/usb/storage/sddr09.c:1106:3: note: Value stored to 'wp_fmt' is n=
ever read
                   wp_fmt =3D " WP";
                   ^        ~~~~~
   drivers/usb/storage/sddr09.c:1108:3: warning: Value stored to 'wp_fmt' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   wp_fmt =3D "";
                   ^        ~~
   drivers/usb/storage/sddr09.c:1108:3: note: Value stored to 'wp_fmt' is n=
ever read
                   wp_fmt =3D "";
                   ^        ~~
   drivers/usb/storage/sddr09.c:1153:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(blurbtxt, "sddr09: Found Flash card, ID =3D %4ph", devic=
eID);
           ^~~~~~~
   drivers/usb/storage/sddr09.c:1153:2: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           sprintf(blurbtxt, "sddr09: Found Flash card, ID =3D %4ph", devic=
eID);
           ^~~~~~~
>> drivers/usb/storage/sddr09.c:1156:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           sprintf(blurbtxt + strlen(blurbtxt),
           ^~~~~~~
   drivers/usb/storage/sddr09.c:1156:2: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           sprintf(blurbtxt + strlen(blurbtxt),
           ^~~~~~~
   drivers/usb/storage/sddr09.c:1168:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1168:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1171:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1171:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1177:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1177:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1183:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1183:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1188:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1188:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(blurbtxt + strlen(blurbtxt),
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1563:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ptr, 0, 18);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:1563:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(ptr, 0, 18);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:1581:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ptr, inquiry_response, 8);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:1581:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ptr, inquiry_response, 8);
                   ^~~~~~
   drivers/usb/storage/sddr09.c:1639:4: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ptr, mode_page_01, sizeof(mode_page_01));
                           ^~~~~~
   drivers/usb/storage/sddr09.c:1639:4: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ptr, mode_page_01, sizeof(mode_page_01));
                           ^~~~~~
   drivers/usb/storage/sddr09.c:1705:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(ptr+strlen(ptr), "%02X ", srb->cmnd[i]);
                   ^~~~~~~
   drivers/usb/storage/sddr09.c:1705:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(ptr+strlen(ptr), "%02X ", srb->cmnd[i]);
                   ^~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/nvme/target/io-cmd-file.c:166:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&req->f.iocb, 0, sizeof(struct kiocb));
           ^~~~~~
   drivers/nvme/target/io-cmd-file.c:166:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&req->f.iocb, 0, sizeof(struct kiocb));
           ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   include/linux/blkdev.h:522:16: warning: The result of the right shift is=
 undefined because the right operand is negative [clang-analyzer-core.Undef=
inedBinaryOperatorResult]
           return sector >> ilog2(q->limits.chunk_sectors);
                         ^
   drivers/nvme/target/zns.c:467:26: note: Calling 'bdev_zone_sectors'
           sector_t zone_sectors =3D bdev_zone_sectors(bdev);
                                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:1118:6: note: Assuming 'q' is non-null
           if (q)
               ^
   include/linux/blkdev.h:1118:2: note: Taking true branch
           if (q)
           ^
   include/linux/blkdev.h:1119:10: note: Calling 'blk_queue_zone_sectors'
                   return blk_queue_zone_sectors(q);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:508:9: note: Calling 'blk_queue_is_zoned'
           return blk_queue_is_zoned(q) ? q->limits.chunk_sectors : 0;
                  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:497:10: note: Calling 'blk_queue_zoned_model'
           switch (blk_queue_zoned_model(q)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:490:2: note: Taking true branch
           if (IS_ENABLED(CONFIG_BLK_DEV_ZONED))
           ^
   include/linux/blkdev.h:491:3: note: Returning without writing to 'q->lim=
its.zoned', which participates in a condition later
                   return q->limits.zoned;
--
           ^~~~~~~~
   drivers/i2c/busses/i2c-designware-master.c:891:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(adap->name, sizeof(adap->name),
           ^~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/i2c/busses/i2c-gpio.c:384:4: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pdata, dev_get_platdata(dev), sizeof(*pda=
ta));
                           ^~~~~~
   drivers/i2c/busses/i2c-gpio.c:384:4: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(pdata, dev_get_platdata(dev), sizeof(*pda=
ta));
                           ^~~~~~
   drivers/i2c/busses/i2c-gpio.c:441:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(adap->name, sizeof(adap->name), "i2c-gpio%d", p=
dev->id);
                   ^~~~~~~~
   drivers/i2c/busses/i2c-gpio.c:441:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(adap->name, sizeof(adap->name), "i2c-gpio%d", p=
dev->id);
                   ^~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/input/keyboard/adp5589-keys.c:474:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(pin_used, false, sizeof(pin_used));
           ^~~~~~
   drivers/input/keyboard/adp5589-keys.c:474:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(pin_used, false, sizeof(pin_used));
           ^~~~~~
   drivers/input/keyboard/adp5589-keys.c:897:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kpad->keycode, pdata->keymap,
           ^~~~~~
   drivers/input/keyboard/adp5589-keys.c:897:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(kpad->keycode, pdata->keymap,
           ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/input/keyboard/bcm-keypad.c:179:2: warning: Value stored to 'val=
' is never read [clang-analyzer-deadcode.DeadStores]
           val &=3D ~KPCR_ENABLE;
           ^      ~~~~~~~~~~~~
   drivers/input/keyboard/bcm-keypad.c:179:2: note: Value stored to 'val' i=
s never read
           val &=3D ~KPCR_ENABLE;
           ^      ~~~~~~~~~~~~
   Suppressed 30 warnings (29 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/usb/musb/musb_debugfs.c:171:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:171:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:271:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   drivers/usb/musb/musb_debugfs.c:271:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0x00, sizeof(buf));
           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/usb/typec/class.c:103:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", id->id_header);
                  ^~~~~~~
   drivers/usb/typec/class.c:103:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", id->id_header);
                  ^~~~~~~
   drivers/usb/typec/class.c:112:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", id->cert_stat);
                  ^~~~~~~
   drivers/usb/typec/class.c:112:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", id->cert_stat);
                  ^~~~~~~
   drivers/usb/typec/class.c:121:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", id->product);
                  ^~~~~~~
   drivers/usb/typec/class.c:121:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", id->product);
                  ^~~~~~~
   drivers/usb/typec/class.c:303:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dir, sizeof(dir), "mode%d", adev->mode);
           ^~~~~~~~
   drivers/usb/typec/class.c:303:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(dir, sizeof(dir), "mode%d", adev->mode);
           ^~~~~~~~
   drivers/usb/typec/class.c:335:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", alt->vdo);
                  ^~~~~~~
   drivers/usb/typec/class.c:335:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", alt->vdo);
                  ^~~~~~~
>> drivers/usb/typec/class.c:344:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", alt->desc ? alt->desc : "");
                  ^~~~~~~
   drivers/usb/typec/class.c:344:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", alt->desc ? alt->desc : "");
                  ^~~~~~~
   drivers/usb/typec/class.c:353:9: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           return sprintf(buf, "%s\n", alt->active ? "yes" : "no");
                  ^~~~~~~
   drivers/usb/typec/class.c:353:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           return sprintf(buf, "%s\n", alt->active ? "yes" : "no");
                  ^~~~~~~
   drivers/usb/typec/class.c:404:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "source\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:404:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "source\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:407:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "sink\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:407:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "sink\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:411:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "source sink\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:411:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "source sink\n");
                         ^~~~~~~
   drivers/usb/typec/class.c:423:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", adev->mode);
                  ^~~~~~~
   drivers/usb/typec/class.c:423:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", adev->mode);
                  ^~~~~~~
   drivers/usb/typec/class.c:432:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%04x\n", adev->svid);
                  ^~~~~~~
   drivers/usb/typec/class.c:432:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%04x\n", adev->svid);
                  ^~~~~~~
   drivers/usb/typec/class.c:528:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           alt->roles =3D desc->roles;
                      ^
   drivers/usb/typec/class.c:1940:6: note: Assuming 'altmodes_node' is non-=
null
           if (!altmodes_node)
               ^~~~~~~~~~~~~~
   drivers/usb/typec/class.c:1940:2: note: Taking false branch
           if (!altmodes_node)
           ^
   drivers/usb/typec/class.c:1943:2: note: Loop condition is true.  Enterin=
g loop body
           fwnode_for_each_child_node(altmodes_node, child) {
           ^
   include/linux/property.h:101:2: note: expanded from macro 'fwnode_for_ea=
ch_child_node'
           for (child =3D fwnode_get_next_child_node(fwnode, NULL); child; =
  \
           ^
   drivers/usb/typec/class.c:1945:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/usb/typec/class.c:1945:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/usb/typec/class.c:1952:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/usb/typec/class.c:1952:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/usb/typec/class.c:1958:7: note: Assuming 'index' is < 'n'
                   if (index >=3D n) {
                       ^~~~~~~~~~
   drivers/usb/typec/class.c:1958:3: note: Taking false branch
                   if (index >=3D n) {
                   ^
   drivers/usb/typec/class.c:1967:9: note: Calling 'typec_port_register_alt=
mode'
                   alt =3D typec_port_register_altmode(port, &desc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:1915:2: note: Taking false branch
           if (IS_ERR(mux))
           ^
   drivers/usb/typec/class.c:1918:9: note: Calling 'typec_register_altmode'
           adev =3D typec_register_altmode(&port->dev, desc);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:519:8: note: Calling 'kzalloc'
           alt =3D kzalloc(sizeof(*alt), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
--
           ^~~~~~
   fs/ext4/inline.c:246:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy((void *)IFIRST(header) + le16_to_cpu(entry->e_value_offs)=
 + pos,
           ^~~~~~
   fs/ext4/inline.c:299:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *)ext4_raw_inode(&is.iloc)->i_block,
           ^~~~~~
   fs/ext4/inline.c:299:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset((void *)ext4_raw_inode(&is.iloc)->i_block,
           ^~~~~~
   fs/ext4/inline.c:442:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *)ext4_raw_inode(&is.iloc)->i_block,
           ^~~~~~
   fs/ext4/inline.c:442:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset((void *)ext4_raw_inode(&is.iloc)->i_block,
           ^~~~~~
   fs/ext4/inline.c:444:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ei->i_data, 0, EXT4_MIN_INLINE_DATA_SIZE);
           ^~~~~~
   fs/ext4/inline.c:444:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(ei->i_data, 0, EXT4_MIN_INLINE_DATA_SIZE);
           ^~~~~~
   fs/ext4/inline.c:1164:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((void *)de, buf + EXT4_INLINE_DOTDOT_SIZE,
           ^~~~~~
   fs/ext4/inline.c:1164:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy((void *)de, buf + EXT4_INLINE_DOTDOT_SIZE,
           ^~~~~~
   fs/ext4/inline.c:1250:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data_bh->b_data, 0, inode->i_sb->s_blocksize);
           ^~~~~~
   fs/ext4/inline.c:1250:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(data_bh->b_data, 0, inode->i_sb->s_blocksize);
           ^~~~~~
   fs/ext4/inline.c:1253:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data_bh->b_data, buf, inline_size);
                   ^~~~~~
   fs/ext4/inline.c:1253:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(data_bh->b_data, buf, inline_size);
                   ^~~~~~
   fs/ext4/inline.c:1972:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(p + i_size, 0,
                           ^~~~~~
   fs/ext4/inline.c:1972:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(p + i_size, 0,
                           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/hwmon/adm1021.c:152:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:152:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:161:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_max[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:161:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_max[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:170:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_min[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:170:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_min[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:178:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> index) & 1);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:178:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> index) & 1);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:186:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:186:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:245:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->low_power);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:245:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->low_power);
                  ^~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
>> drivers/usb/typec/bus.c:301:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n", alt->desc ? alt->desc : "");
                  ^~~~~~~
   drivers/usb/typec/bus.c:301:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n", alt->desc ? alt->desc : "");
                  ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
>> drivers/usb/typec/altmodes/displayport.c:396:8: warning: Call to functio=
n 'sprintf' is insecure as it does not provide bounding of the memory buffe=
r or security checks introduced in the C11 standard. Replace with analogous=
 functions that support length arguments or provides boundary checks such a=
s 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecate=
dOrUnsafeBufferHandling]
           len =3D sprintf(buf, "%s ", cur ? "USB" : "[USB]");
                 ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:396:8: note: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11
           len =3D sprintf(buf, "%s ", cur ? "USB" : "[USB]");
                 ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:400:11: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           len +=3D sprintf(buf + len, "[%s] ", configurati=
ons[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:400:11: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           len +=3D sprintf(buf + len, "[%s] ", configurati=
ons[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:403:11: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           len +=3D sprintf(buf + len, "%s ", configuration=
s[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:403:11: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           len +=3D sprintf(buf + len, "%s ", configuration=
s[i]);
                                  ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:496:12: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                                   len +=3D sprintf(buf + len, "[%s] ",
                                          ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:496:12: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                                   len +=3D sprintf(buf + len, "[%s] ",
                                          ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:499:12: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                                   len +=3D sprintf(buf + len, "%s ",
                                          ^~~~~~~
   drivers/usb/typec/altmodes/displayport.c:499:12: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                                   len +=3D sprintf(buf + len, "%s ",
                                          ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/media/usb/au0828/au0828-dvb.c:154:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(purb->transfer_buffer, 0, URB_BUFSIZE);
           ^~~~~~
   drivers/media/usb/au0828/au0828-dvb.c:154:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(purb->transfer_buffer, 0, URB_BUFSIZE);
           ^~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/media/usb/hdpvr/hdpvr-control.c:107:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dev->usbc_buf, 0, 4);
           ^~~~~~
   drivers/media/usb/hdpvr/hdpvr-control.c:107:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(dev->usbc_buf, 0, 4);
           ^~~~~~
   drivers/media/usb/hdpvr/hdpvr-control.c:127:3: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(dev->usbc_buf, 0, 2);
                   ^~~~~~
   drivers/media/usb/hdpvr/hdpvr-control.c:127:3: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                   memset(dev->usbc_buf, 0, 2);
                   ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   233 warnings generated.
   drivers/target/iscsi/iscsi_target_configfs.c:48:8: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   rb =3D sprintf(page, "1\n");
                        ^~~~~~~
   drivers/target/iscsi/iscsi_target_configfs.c:48:8: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                   rb =3D sprintf(page, "1\n");
                        ^~~~~~~
   drivers/target/iscsi/iscsi_target_configfs.c:50:8: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   rb =3D sprintf(page, "0\n");
                        ^~~~~~~
   drivers/target/iscsi/iscsi_target_configfs.c:50:8: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                   rb =3D sprintf(page, "0\n");
                        ^~~~~~~
   drivers/target/iscsi/iscsi_target_configfs.c:90:5: warning: Value stored=
 to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                                   rc =3D 0;
                                   ^    ~
   drivers/target/iscsi/iscsi_target_configfs.c:90:5: note: Value stored to=
 'rc' is never read
                                   rc =3D 0;
                                   ^    ~
   drivers/target/iscsi/iscsi_target_configfs.c:171:2: warning: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, MAX_PORTAL_LEN + 1, "%s", name);
           ^~~~~~~~
   drivers/target/iscsi/iscsi_target_configfs.c:171:2: note: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf, MAX_PORTAL_LEN + 1, "%s", name);
           ^~~~~~~~
   drivers/target/iscsi/iscsi_target_configfs.c:311:1: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   ISCSI_NACL_ATTR(dataout_timeout);
   ^
   drivers/target/iscsi/iscsi_target_configfs.c:287:9: note: expanded from =
macro 'ISCSI_NACL_ATTR'
           return sprintf(page, "%u\n", nacl->node_attrib.name);           \
                  ^~~~~~~
   drivers/target/iscsi/iscsi_target_configfs.c:311:1: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
   ISCSI_NACL_ATTR(dataout_timeout);
   ^
   drivers/target/iscsi/iscsi_target_configfs.c:287:9: note: expanded from =
macro 'ISCSI_NACL_ATTR'
           return sprintf(page, "%u\n", nacl->node_attrib.name);           \
--
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/extcon/extcon-fsa9480.c:207:3: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
                   u64 cables =3D cable_types[dev];
                   ^
   drivers/extcon/extcon-fsa9480.c:266:6: note: Assuming field 'irq' is not=
 equal to 0
           if (!client->irq) {
               ^~~~~~~~~~~~
   drivers/extcon/extcon-fsa9480.c:266:2: note: Taking false branch
           if (!client->irq) {
           ^
   drivers/extcon/extcon-fsa9480.c:272:6: note: Assuming 'info' is non-null
           if (!info)
               ^~~~~
   drivers/extcon/extcon-fsa9480.c:272:2: note: Taking false branch
           if (!info)
           ^
   drivers/extcon/extcon-fsa9480.c:281:2: note: Taking false branch
           if (IS_ERR(info->edev)) {
           ^
   drivers/extcon/extcon-fsa9480.c:288:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/extcon/extcon-fsa9480.c:288:2: note: Taking false branch
           if (ret) {
           ^
   drivers/extcon/extcon-fsa9480.c:294:2: note: Taking false branch
           if (IS_ERR(info->regmap)) {
           ^
   drivers/extcon/extcon-fsa9480.c:316:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/extcon/extcon-fsa9480.c:316:2: note: Taking false branch
           if (ret) {
           ^
   drivers/extcon/extcon-fsa9480.c:322:2: note: Calling 'fsa9480_detect_dev'
           fsa9480_detect_dev(info);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:6: note: Assuming 'val1' is >=3D 0
           if (val1 < 0 || val2 < 0) {
               ^~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:6: note: Left side of '||' is false
   drivers/extcon/extcon-fsa9480.c:227:18: note: Assuming 'val2' is >=3D 0
           if (val1 < 0 || val2 < 0) {
                           ^~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:2: note: Taking false branch
           if (val1 < 0 || val2 < 0) {
           ^
   drivers/extcon/extcon-fsa9480.c:233:2: note: Loop condition is false.  E=
xiting loop
           dev_info(usbsw->dev, "dev1: 0x%x, dev2: 0x%x\n", val1, val2);
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/extcon/extcon-fsa9480.c:236:2: note: Calling 'fsa9480_handle_cha=
nge'
           fsa9480_handle_change(usbsw, usbsw->cable & ~val, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-fsa9480.c:205:2: note: Loop condition is true.  En=
tering loop body
           while (mask) {
           ^
   drivers/extcon/extcon-fsa9480.c:206:3: note: 'dev' initialized to 31
                   int dev =3D fls64(mask) - 1;
                   ^~~~~~~
   drivers/extcon/extcon-fsa9480.c:207:3: note: Assigned value is garbage o=
r undefined
                   u64 cables =3D cable_types[dev];
                   ^            ~~~~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
   Suppressed 98 warnings (98 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   101 warnings generated.
   Suppressed 101 warnings (101 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   drivers/usb/host/xhci-dbgcap.c:377:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps)=
);
           ^~~~~~
   drivers/usb/host/xhci-dbgcap.c:377:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps)=
);
           ^~~~~~
   drivers/usb/host/xhci-dbgcap.c:828:4: warning: Value stored to 'ctrl' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           ctrl =3D readl(&dbc->regs->control);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-dbgcap.c:828:4: note: Value stored to 'ctrl' is ne=
ver read
                           ctrl =3D readl(&dbc->regs->control);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/xhci-dbgcap.c:1004:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "%s\n", p);
                  ^~~~~~~
   drivers/usb/host/xhci-dbgcap.c:1004:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "%s\n", p);
                  ^~~~~~~
   Suppressed 99 warnings (99 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   Suppressed 99 warnings (99 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/base/platform.c:578:3: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pa->name, name);
                   ^~~~~~
   drivers/base/platform.c:578:3: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                   strcpy(pa->name, name);
                   ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/base/cpu.c:364:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cpu->dev, 0x00, sizeof(struct device));
           ^~~~~~
   drivers/base/cpu.c:364:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&cpu->dev, 0x00, sizeof(struct device));
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   include/linux/hid.h:1037:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-apple.c:487:6: note: Assuming the condition is true
           if (usage->hid =3D=3D (HID_UP_CUSTOM | 0x0003) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-apple.c:487:45: note: Left side of '||' is true
           if (usage->hid =3D=3D (HID_UP_CUSTOM | 0x0003) ||
                                                      ^
   drivers/hid/hid-apple.c:492:3: note: Calling 'hid_map_usage_clear'
                   hid_map_usage_clear(hi, usage, bit, max, EV_KEY, KEY_FN);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1065:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1008:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1012:2: note: Control jumps to 'case 1:'  at line 10=
21
           switch (type) {
           ^
   include/linux/hid.h:1024:3: note:  Execution continues on line 1035
                   break;
                   ^
   include/linux/hid.h:1035:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1035:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1035:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1035:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
--
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1693:6: note: Returning from 'IS_ERR'
           if (IS_ERR(buf))
               ^~~~~~~~~~~
   drivers/nvmem/core.c:1693:2: note: Taking false branch
           if (IS_ERR(buf))
           ^
   drivers/nvmem/core.c:1700:6: note: Assuming 'nbits' is 0
           if (nbits)
               ^~~~~
   drivers/nvmem/core.c:1700:2: note: Taking false branch
           if (nbits)
           ^
   drivers/nvmem/core.c:1703:11: note: The left operand of '>' is a garbage=
 value
           if (*len > max_len) {
               ~~~~ ^
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/hid/hid-quirks.c:1170:7: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   m =3D sscanf(quirks_param[n], "0x%hx:0x%hx:0x%x",
                       ^~~~~~
   drivers/hid/hid-quirks.c:1170:7: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
                   m =3D sscanf(quirks_param[n], "0x%hx:0x%hx:0x%x",
                       ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/hid/hid-debug.c:495:5: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   snprintf(buf, HID_DEBUG_BUFSIZE, "%s",
                                   ^~~~~~~~
   drivers/hid/hid-debug.c:495:5: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                                   snprintf(buf, HID_DEBUG_BUFSIZE, "%s",
                                   ^~~~~~~~
   drivers/hid/hid-debug.c:505:3: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, HID_DEBUG_BUFSIZE, "%04x", page);
                   ^~~~~~~~
   drivers/hid/hid-debug.c:505:3: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, HID_DEBUG_BUFSIZE, "%04x", page);
                   ^~~~~~~~
   drivers/hid/hid-debug.c:535:7: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                                   snprintf(buf + len,
                                                   ^~~~~~~~
   drivers/hid/hid-debug.c:535:7: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                                                   snprintf(buf + len,
                                                   ^~~~~~~~
   drivers/hid/hid-debug.c:547:3: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf + len, HID_DEBUG_BUFSIZE - len, "%04x",
                   ^~~~~~~~
   drivers/hid/hid-debug.c:547:3: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf + len, HID_DEBUG_BUFSIZE - len, "%04x",
                   ^~~~~~~~
   drivers/hid/hid-debug.c:717:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, HID_DEBUG_BUFSIZE - 1,
           ^~~~~~~~
   drivers/hid/hid-debug.c:717:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf, HID_DEBUG_BUFSIZE - 1,
           ^~~~~~~~
   drivers/hid/hid-debug.c:723:3: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, HID_DEBUG_BUFSIZE - 1,
                   ^~~~~~~~
   drivers/hid/hid-debug.c:723:3: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, HID_DEBUG_BUFSIZE - 1,
                   ^~~~~~~~
   drivers/hid/hid-debug.c:741:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf + len, HID_DEBUG_BUFSIZE - len - 1, " =3D %d\n", va=
lue);
           ^~~~~~~~
   drivers/hid/hid-debug.c:741:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf + len, HID_DEBUG_BUFSIZE - len - 1, " =3D %d\n", va=
lue);
           ^~~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   82 warnings generated.
   drivers/infiniband/core/sysfs.c:590:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, out_mad->data + offset, size);
           ^~~~~~
   drivers/infiniband/core/sysfs.c:590:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, out_mad->data + offset, size);
           ^~~~~~
   drivers/infiniband/core/sysfs.c:1111:7: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (snprintf(element->name, sizeof(element->name), "%d",=
 i) >=3D
                       ^~~~~~~~
   drivers/infiniband/core/sysfs.c:1111:7: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   if (snprintf(element->name, sizeof(element->name), "%d",=
 i) >=3D
                       ^~~~~~~~
   drivers/infiniband/core/sysfs.c:1368:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(desc.node_desc, buf, min_t(int, count, IB_DEVICE_NODE_DES=
C_MAX));
           ^~~~~~
   drivers/infiniband/core/sysfs.c:1368:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(desc.node_desc, buf, min_t(int, count, IB_DEVICE_NODE_DES=
C_MAX));
           ^~~~~~
   Suppressed 79 warnings (79 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   drivers/infiniband/core/device.c:425:2: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
           ret =3D rename_compat_devs(ibdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/device.c:425:2: note: Value stored to 'ret' is n=
ever read
           ret =3D rename_compat_devs(ibdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/core/device.c:465:7: warning: Call to function 'sscan=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sscanf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                   if (sscanf(dev_name(&device->dev), name, &i) !=3D 1)
                       ^~~~~~
   drivers/infiniband/core/device.c:465:7: note: Call to function 'sscanf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sscanf_s'=
 in case of C11
                   if (sscanf(dev_name(&device->dev), name, &i) !=3D 1)
                       ^~~~~~
   drivers/infiniband/core/device.c:469:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, sizeof buf, name, i);
                   ^~~~~~~~
   drivers/infiniband/core/device.c:469:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, sizeof buf, name, i);
                   ^~~~~~~~
   drivers/infiniband/core/device.c:1249:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&device->attrs, 0, sizeof(device->attrs));
           ^~~~~~
   drivers/infiniband/core/device.c:1249:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&device->attrs, 0, sizeof(device->attrs));
           ^~~~~~
   drivers/infiniband/core/device.c:2019:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(port_attr, 0, sizeof(*port_attr));
           ^~~~~~
   drivers/infiniband/core/device.c:2019:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(port_attr, 0, sizeof(*port_attr));
           ^~~~~~
   drivers/infiniband/core/device.c:2057:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(port_attr, 0, sizeof(*port_attr));
           ^~~~~~
   drivers/infiniband/core/device.c:2057:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(port_attr, 0, sizeof(*port_attr));
           ^~~~~~
   Suppressed 93 warnings (93 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   Suppressed 68 warnings (68 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   net/netfilter/nft_immediate.c:211:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ctx->regs[priv->dreg].data, &priv->data, sizeof(priv->da=
ta));
           ^~~~~~
   net/netfilter/nft_immediate.c:211:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ctx->regs[priv->dreg].data, &priv->data, sizeof(priv->da=
ta));
           ^~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   net/netfilter/nft_cmp.c:165:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(key + reg->offset, data, reg->len);
           ^~~~~~
   net/netfilter/nft_cmp.c:165:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(key + reg->offset, data, reg->len);
           ^~~~~~
   net/netfilter/nft_cmp.c:166:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mask + reg->offset, datamask, reg->len);
           ^~~~~~
   net/netfilter/nft_cmp.c:166:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(mask + reg->offset, datamask, reg->len);
           ^~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/hid/hid-microsoft.c:288:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(r, 0, sizeof(*r));
           ^~~~~~
   drivers/hid/hid-microsoft.c:288:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(r, 0, sizeof(*r));
           ^~~~~~
   include/linux/hid.h:1037:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-microsoft.c:189:6: note: Assuming the condition is true
           if (quirks & MS_ERGONOMY) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-microsoft.c:189:2: note: Taking true branch
           if (quirks & MS_ERGONOMY) {
           ^
   drivers/hid/hid-microsoft.c:190:13: note: Calling 'ms_ergonomy_kb_quirk'
                   int ret =3D ms_ergonomy_kb_quirk(hi, usage, bit, max);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-microsoft.c:85:6: note: Assuming the condition is true
           if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_CONSUMER) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-microsoft.c:85:2: note: Taking true branch
           if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_CONSUMER) {
           ^
   drivers/hid/hid-microsoft.c:86:3: note: Control jumps to 'case 670:'  at=
 line 94
                   switch (usage->hid & HID_USAGE) {
                   ^
   drivers/hid/hid-microsoft.c:95:4: note: Calling 'hid_map_usage_clear'
                           ms_map_key_clear(KEY_PROG2);
                           ^
   drivers/hid/hid-microsoft.c:78:29: note: expanded from macro 'ms_map_key=
_clear'
   #define ms_map_key_clear(c)     hid_map_usage_clear(hi, usage, bit, max,=
 \
--
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5720:30: note: Left side of '&&' is false
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
                                       ^
   net/netfilter/nf_tables_api.c:5723:6: note: Assuming 'flags' is equal to=
 0
           if (flags !=3D 0)
               ^~~~~~~~~~
   net/netfilter/nf_tables_api.c:5723:2: note: Taking false branch
           if (flags !=3D 0)
           ^
   net/netfilter/nf_tables_api.c:5726:6: note: Assuming the condition is fa=
lse
           if (set->flags & NFT_SET_MAP) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5726:2: note: Taking false branch
           if (set->flags & NFT_SET_MAP) {
           ^
   net/netfilter/nf_tables_api.c:5731:7: note: Assuming the condition is fa=
lse
                   if (nla[NFTA_SET_ELEM_DATA] !=3D NULL)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5731:3: note: Taking false branch
                   if (nla[NFTA_SET_ELEM_DATA] !=3D NULL)
                   ^
   net/netfilter/nf_tables_api.c:5735:42: note: Left side of '&&' is false
           if ((flags & NFT_SET_ELEM_INTERVAL_END) &&
                                                   ^
   net/netfilter/nf_tables_api.c:5746:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_SET_ELEM_TIMEOUT] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5746:2: note: Taking false branch
           if (nla[NFTA_SET_ELEM_TIMEOUT] !=3D NULL) {
           ^
   net/netfilter/nf_tables_api.c:5753:13: note: Assuming the condition is f=
alse
           } else if (set->flags & NFT_SET_TIMEOUT) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5753:9: note: Taking false branch
           } else if (set->flags & NFT_SET_TIMEOUT) {
                  ^
   net/netfilter/nf_tables_api.c:5758:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_SET_ELEM_EXPIRATION] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5758:2: note: Taking false branch
           if (nla[NFTA_SET_ELEM_EXPIRATION] !=3D NULL) {
           ^
   net/netfilter/nf_tables_api.c:5767:6: note: Assuming the condition is tr=
ue
           if (nla[NFTA_SET_ELEM_EXPR]) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5767:2: note: Taking true branch
           if (nla[NFTA_SET_ELEM_EXPR]) {
           ^
   net/netfilter/nf_tables_api.c:5770:7: note: Assuming field 'num_exprs' i=
s 0
                   if (set->num_exprs && set->num_exprs !=3D 1)
                       ^~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5770:22: note: Left side of '&&' is false
                   if (set->num_exprs && set->num_exprs !=3D 1)
                                      ^
   net/netfilter/nf_tables_api.c:5773:10: note: Calling 'nft_set_elem_expr_=
alloc'
                   expr =3D nft_set_elem_expr_alloc(ctx, set,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5332:9: note: Calling 'nft_expr_init'
           expr =3D nft_expr_init(ctx, attr);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2795:8: note: Calling 'nf_tables_expr_pars=
e'
           err =3D nf_tables_expr_parse(ctx, nla, &expr_info);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2714:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:2714:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:2718:2: note: Taking true branch
           if (IS_ERR(type))
           ^
   net/netfilter/nf_tables_api.c:2719:3: note: Returning without writing to=
 'info->ops'
                   return PTR_ERR(type);
                   ^
   net/netfilter/nf_tables_api.c:2795:8: note: Returning from 'nf_tables_ex=
pr_parse'
           err =3D nf_tables_expr_parse(ctx, nla, &expr_info);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2796:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/netfilter/nf_tables_api.c:2796:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:2800:17: note: Access to field 'size' resu=
lts in a dereference of an undefined pointer value (loaded from field 'ops')
           expr =3D kzalloc(expr_info.ops->size, GFP_KERNEL);
                          ^         ~~~
   net/netfilter/nf_tables_api.c:2831:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, src, src->ops->size);
                   ^~~~~~
   net/netfilter/nf_tables_api.c:2831:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, src, src->ops->size);
                   ^~~~~~
   net/netfilter/nf_tables_api.c:3012:4: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&cb->args[1], 0,
                           ^~~~~~
   net/netfilter/nf_tables_api.c:3012:4: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                           memset(&cb->args[1], 0,
                           ^~~~~~
>> net/netfilter/nf_tables_api.c:3804:9: warning: Call to function 'sscanf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sscanf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                           if (!sscanf(i->name, name, &tmp))
                                ^~~~~~
   net/netfilter/nf_tables_api.c:3804:9: note: Call to function 'sscanf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sscanf_s' i=
n case of C11
                           if (!sscanf(i->name, name, &tmp))
                                ^~~~~~
   net/netfilter/nf_tables_api.c:3815:4: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(inuse, 0, PAGE_SIZE);
                           ^~~~~~
   net/netfilter/nf_tables_api.c:3815:4: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                           memset(inuse, 0, PAGE_SIZE);
                           ^~~~~~
   net/netfilter/nf_tables_api.c:4249:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&desc, 0, sizeof(desc));
           ^~~~~~
   net/netfilter/nf_tables_api.c:4249:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&desc, 0, sizeof(desc));
           ^~~~~~
   net/netfilter/nf_tables_api.c:5096:16: warning: The left operand of '!=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (desc.type !=3D NFT_DATA_VALUE || desc.len !=3D set->klen) {
                         ^
   net/netfilter/nf_tables_api.c:6302:2: note: Taking false branch
           if (IS_ERR(table)) {
           ^
   net/netfilter/nf_tables_api.c:6308:2: note: Taking false branch
           if (IS_ERR(set))
           ^
   net/netfilter/nf_tables_api.c:6310:6: note: Assuming the condition is fa=
lse
           if (!list_empty(&set->bindings) && set->flags & NFT_SET_CONSTANT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6310:34: note: Left side of '&&' is false
           if (!list_empty(&set->bindings) && set->flags & NFT_SET_CONSTANT)
                                           ^
   net/netfilter/nf_tables_api.c:6315:6: note: Assuming the condition is fa=
lse
           if (!nla[NFTA_SET_ELEM_LIST_ELEMENTS])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6315:2: note: Taking false branch
           if (!nla[NFTA_SET_ELEM_LIST_ELEMENTS])
           ^
   net/netfilter/nf_tables_api.c:6318:2: note: Loop condition is true.  Ent=
ering loop body
           nla_for_each_nested(attr, nla[NFTA_SET_ELEM_LIST_ELEMENTS], rem)=
 {
           ^
   include/net/netlink.h:1932:2: note: expanded from macro 'nla_for_each_ne=
sted'
           nla_for_each_attr(pos, nla_data(nla), nla_len(nla), rem)
           ^
   include/net/netlink.h:1921:2: note: expanded from macro 'nla_for_each_at=
tr'
           for (pos =3D head, rem =3D len; \
           ^
   net/netfilter/nf_tables_api.c:6319:9: note: Calling 'nft_del_setelem'
                   err =3D nft_del_setelem(&ctx, set, attr);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6132:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:6132:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:6136:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/netfilter/nf_tables_api.c:6136:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:6139:6: note: Assuming the condition is fa=
lse
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6139:30: note: Left side of '&&' is false
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
                                       ^
   net/netfilter/nf_tables_api.c:6144:6: note: Assuming 'flags' is equal to=
 0
           if (flags !=3D 0)
               ^~~~~~~~~~
   net/netfilter/nf_tables_api.c:6144:2: note: Taking false branch
           if (flags !=3D 0)
           ^
   net/netfilter/nf_tables_api.c:6147:2: note: Taking true branch
           if (nla[NFTA_SET_ELEM_KEY]) {
           ^
   net/netfilter/nf_tables_api.c:6148:9: note: Calling 'nft_setelem_parse_k=
ey'
                   err =3D nft_setelem_parse_key(ctx, set, &elem.key.val,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5092:8: note: Calling 'nft_data_init'
           err =3D nft_data_init(ctx, key, NFT_DATA_VALUE_MAXLEN, &desc, at=
tr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9555:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:9555:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:9558:6: note: Assuming the condition is fa=
lse
           if (tb[NFTA_DATA_VALUE])
               ^~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9558:2: note: Taking false branch
           if (tb[NFTA_DATA_VALUE])
           ^
   net/netfilter/nf_tables_api.c:9561:6: note: Assuming the condition is tr=
ue
           if (tb[NFTA_DATA_VERDICT] && ctx !=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9561:6: note: Left side of '&&' is true
   net/netfilter/nf_tables_api.c:9561:31: note: 'ctx' is not equal to NULL

vim +185 arch/mips/ath79/setup.c

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   42  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   43  static void __init ath79_=
detect_sys_type(void)
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   44  {
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   45  	char *chip =3D "????";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   46  	u32 id;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   47  	u32 major;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   48  	u32 minor;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   49  	u32 rev =3D 0;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20   50  	u32 ver =3D 1;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   51  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   52  	id =3D ath79_reset_rr(AR=
71XX_RESET_REG_REV_ID);
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   53  	major =3D id & REV_ID_MA=
JOR_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   54  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   55  	switch (major) {
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   56  	case REV_ID_MAJOR_AR71XX:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   57  		minor =3D id & AR71XX_R=
EV_ID_MINOR_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   58  		rev =3D id >> AR71XX_RE=
V_ID_REVISION_SHIFT;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   59  		rev &=3D AR71XX_REV_ID_=
REVISION_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   60  		switch (minor) {
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   61  		case AR71XX_REV_ID_MINO=
R_AR7130:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   62  			ath79_soc =3D ATH79_SO=
C_AR7130;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   63  			chip =3D "7130";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   64  			break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   65  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   66  		case AR71XX_REV_ID_MINO=
R_AR7141:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   67  			ath79_soc =3D ATH79_SO=
C_AR7141;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   68  			chip =3D "7141";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   69  			break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   70  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   71  		case AR71XX_REV_ID_MINO=
R_AR7161:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   72  			ath79_soc =3D ATH79_SO=
C_AR7161;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   73  			chip =3D "7161";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   74  			break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   75  		}
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   76  		break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   77  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   78  	case REV_ID_MAJOR_AR7240:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   79  		ath79_soc =3D ATH79_SOC=
_AR7240;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   80  		chip =3D "7240";
8bed1288d479fd Gabor Juhos       2011-06-20   81  		rev =3D id & AR724X_REV=
_ID_REVISION_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   82  		break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   83  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   84  	case REV_ID_MAJOR_AR7241:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   85  		ath79_soc =3D ATH79_SOC=
_AR7241;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   86  		chip =3D "7241";
8bed1288d479fd Gabor Juhos       2011-06-20   87  		rev =3D id & AR724X_REV=
_ID_REVISION_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   88  		break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   89  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   90  	case REV_ID_MAJOR_AR7242:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   91  		ath79_soc =3D ATH79_SOC=
_AR7242;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   92  		chip =3D "7242";
8bed1288d479fd Gabor Juhos       2011-06-20   93  		rev =3D id & AR724X_REV=
_ID_REVISION_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   94  		break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   95  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   96  	case REV_ID_MAJOR_AR913X:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   97  		minor =3D id & AR913X_R=
EV_ID_MINOR_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   98  		rev =3D id >> AR913X_RE=
V_ID_REVISION_SHIFT;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04   99  		rev &=3D AR913X_REV_ID_=
REVISION_MASK;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  100  		switch (minor) {
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  101  		case AR913X_REV_ID_MINO=
R_AR9130:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  102  			ath79_soc =3D ATH79_SO=
C_AR9130;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  103  			chip =3D "9130";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  104  			break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  105  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  106  		case AR913X_REV_ID_MINO=
R_AR9132:
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  107  			ath79_soc =3D ATH79_SO=
C_AR9132;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  108  			chip =3D "9132";
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  109  			break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  110  		}
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  111  		break;
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  112  =

80a7ed81a840ae Gabor Juhos       2012-03-14  113  	case REV_ID_MAJOR_AR9330:
80a7ed81a840ae Gabor Juhos       2012-03-14  114  		ath79_soc =3D ATH79_SOC=
_AR9330;
80a7ed81a840ae Gabor Juhos       2012-03-14  115  		chip =3D "9330";
80a7ed81a840ae Gabor Juhos       2012-03-14  116  		rev =3D id & AR933X_REV=
_ID_REVISION_MASK;
80a7ed81a840ae Gabor Juhos       2012-03-14  117  		break;
80a7ed81a840ae Gabor Juhos       2012-03-14  118  =

80a7ed81a840ae Gabor Juhos       2012-03-14  119  	case REV_ID_MAJOR_AR9331:
80a7ed81a840ae Gabor Juhos       2012-03-14  120  		ath79_soc =3D ATH79_SOC=
_AR9331;
80a7ed81a840ae Gabor Juhos       2012-03-14  121  		chip =3D "9331";
80a7ed81a840ae Gabor Juhos       2012-03-14  122  		rev =3D id & AR933X_REV=
_ID_REVISION_MASK;
80a7ed81a840ae Gabor Juhos       2012-03-14  123  		break;
80a7ed81a840ae Gabor Juhos       2012-03-14  124  =

d84114660a65e8 Gabor Juhos       2012-03-14  125  	case REV_ID_MAJOR_AR9341:
d84114660a65e8 Gabor Juhos       2012-03-14  126  		ath79_soc =3D ATH79_SOC=
_AR9341;
d84114660a65e8 Gabor Juhos       2012-03-14  127  		chip =3D "9341";
d84114660a65e8 Gabor Juhos       2012-03-14  128  		rev =3D id & AR934X_REV=
_ID_REVISION_MASK;
d84114660a65e8 Gabor Juhos       2012-03-14  129  		break;
d84114660a65e8 Gabor Juhos       2012-03-14  130  =

d84114660a65e8 Gabor Juhos       2012-03-14  131  	case REV_ID_MAJOR_AR9342:
d84114660a65e8 Gabor Juhos       2012-03-14  132  		ath79_soc =3D ATH79_SOC=
_AR9342;
d84114660a65e8 Gabor Juhos       2012-03-14  133  		chip =3D "9342";
d84114660a65e8 Gabor Juhos       2012-03-14  134  		rev =3D id & AR934X_REV=
_ID_REVISION_MASK;
d84114660a65e8 Gabor Juhos       2012-03-14  135  		break;
d84114660a65e8 Gabor Juhos       2012-03-14  136  =

d84114660a65e8 Gabor Juhos       2012-03-14  137  	case REV_ID_MAJOR_AR9344:
d84114660a65e8 Gabor Juhos       2012-03-14  138  		ath79_soc =3D ATH79_SOC=
_AR9344;
d84114660a65e8 Gabor Juhos       2012-03-14  139  		chip =3D "9344";
d84114660a65e8 Gabor Juhos       2012-03-14  140  		rev =3D id & AR934X_REV=
_ID_REVISION_MASK;
d84114660a65e8 Gabor Juhos       2012-03-14  141  		break;
d84114660a65e8 Gabor Juhos       2012-03-14  142  =

af2d1b521bfbc5 Matthias Schiffer 2018-07-20  143  	case REV_ID_MAJOR_QCA953=
3_V2:
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  144  		ver =3D 2;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  145  		ath79_soc_rev =3D 2;
c9b0299034665d Liangliang Huang  2020-05-04  146  		fallthrough;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  147  	case REV_ID_MAJOR_QCA953=
3:
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  148  		ath79_soc =3D ATH79_SOC=
_QCA9533;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  149  		chip =3D "9533";
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  150  		rev =3D id & QCA953X_RE=
V_ID_REVISION_MASK;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  151  		break;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  152  =

2e6c91e392fd7b Gabor Juhos       2013-02-15  153  	case REV_ID_MAJOR_QCA955=
6:
2e6c91e392fd7b Gabor Juhos       2013-02-15  154  		ath79_soc =3D ATH79_SOC=
_QCA9556;
2e6c91e392fd7b Gabor Juhos       2013-02-15  155  		chip =3D "9556";
2e6c91e392fd7b Gabor Juhos       2013-02-15  156  		rev =3D id & QCA955X_RE=
V_ID_REVISION_MASK;
2e6c91e392fd7b Gabor Juhos       2013-02-15  157  		break;
2e6c91e392fd7b Gabor Juhos       2013-02-15  158  =

2e6c91e392fd7b Gabor Juhos       2013-02-15  159  	case REV_ID_MAJOR_QCA955=
8:
2e6c91e392fd7b Gabor Juhos       2013-02-15  160  		ath79_soc =3D ATH79_SOC=
_QCA9558;
2e6c91e392fd7b Gabor Juhos       2013-02-15  161  		chip =3D "9558";
2e6c91e392fd7b Gabor Juhos       2013-02-15  162  		rev =3D id & QCA955X_RE=
V_ID_REVISION_MASK;
2e6c91e392fd7b Gabor Juhos       2013-02-15  163  		break;
2e6c91e392fd7b Gabor Juhos       2013-02-15  164  =

af2d1b521bfbc5 Matthias Schiffer 2018-07-20  165  	case REV_ID_MAJOR_QCA956=
X:
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  166  		ath79_soc =3D ATH79_SOC=
_QCA956X;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  167  		chip =3D "956X";
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  168  		rev =3D id & QCA956X_RE=
V_ID_REVISION_MASK;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  169  		break;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  170  =

af2d1b521bfbc5 Matthias Schiffer 2018-07-20  171  	case REV_ID_MAJOR_TP9343:
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  172  		ath79_soc =3D ATH79_SOC=
_TP9343;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  173  		chip =3D "9343";
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  174  		rev =3D id & QCA956X_RE=
V_ID_REVISION_MASK;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  175  		break;
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  176  =

d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  177  	default:
ab75dc02c151c9 Ralf Baechle      2011-11-17  178  		panic("ath79: unknown S=
oC, id:0x%08x", id);
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  179  	}
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  180  =

af2d1b521bfbc5 Matthias Schiffer 2018-07-20  181  	if (ver =3D=3D 1)
be5f3623204e15 Gabor Juhos       2011-11-18  182  		ath79_soc_rev =3D rev;
be5f3623204e15 Gabor Juhos       2011-11-18  183  =

af2d1b521bfbc5 Matthias Schiffer 2018-07-20  184  	if (soc_is_qca953x() || =
soc_is_qca955x() || soc_is_qca956x())
af2d1b521bfbc5 Matthias Schiffer 2018-07-20 @185  		sprintf(ath79_sys_type,=
 "Qualcomm Atheros QCA%s ver %u rev %u",
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  186  			chip, ver, rev);
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  187  	else if (soc_is_tp9343())
af2d1b521bfbc5 Matthias Schiffer 2018-07-20  188  		sprintf(ath79_sys_type,=
 "Qualcomm Atheros TP%s rev %u",
2e6c91e392fd7b Gabor Juhos       2013-02-15  189  			chip, rev);
2e6c91e392fd7b Gabor Juhos       2013-02-15  190  	else
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  191  		sprintf(ath79_sys_type,=
 "Atheros AR%s rev %u", chip, rev);
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  192  	pr_info("SoC: %s\n", ath=
79_sys_type);
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  193  }
d4a67d9dc8a5a8 Gabor Juhos       2011-01-04  194  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0659654053164704620==--


Content-Type: multipart/mixed; boundary="===============0630989296867768505=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11591/13988] arch/x86/kernel/cpu/mce/inject.c:355:6: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments ...
Date: Tue, 22 Mar 2022 09:15:46 +0800
Message-ID: <202203220955.3mYMf6rt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0630989296867768505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f9006d9269eac8ff295c2cb67280c54888c74106
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 [11591/13988] Kbuild: move=
 to -std=3Dgnu11
:::::: branch date: 13 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-c007-20220321 (https://download.01.org/0day-ci/ar=
chive/20220322/202203220955.3mYMf6rt-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   kernel/bpf/core.c:237:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(fp, fp_old, fp_old->pages * PAGE_SIZE);
                   ^~~~~~
   kernel/bpf/core.c:237:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(fp, fp_old, fp_old->pages * PAGE_SIZE);
                   ^~~~~~
   kernel/bpf/core.c:284:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ws, 0, sizeof(ws));
           ^~~~~~
   kernel/bpf/core.c:284:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(ws, 0, sizeof(ws));
           ^~~~~~
   kernel/bpf/core.c:311:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&raw[psize], 0, raw_size - psize);
           ^~~~~~
   kernel/bpf/core.c:311:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&raw[psize], 0, raw_size - psize);
           ^~~~~~
   kernel/bpf/core.c:333:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(fp->tag, result, sizeof(fp->tag));
           ^~~~~~
   kernel/bpf/core.c:333:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(fp->tag, result, sizeof(fp->tag));
           ^~~~~~
   kernel/bpf/core.c:452:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(prog->insnsi + off, patch, sizeof(*patch));
                   ^~~~~~
   kernel/bpf/core.c:452:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(prog->insnsi + off, patch, sizeof(*patch));
                   ^~~~~~
   kernel/bpf/core.c:488:2: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(prog_adj->insnsi + off + len, prog_adj->insnsi + off + 1,
           ^~~~~~~
   kernel/bpf/core.c:488:2: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
           memmove(prog_adj->insnsi + off + len, prog_adj->insnsi + off + 1,
           ^~~~~~~
   kernel/bpf/core.c:490:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(prog_adj->insnsi + off, patch, sizeof(*patch) * len);
           ^~~~~~
   kernel/bpf/core.c:490:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(prog_adj->insnsi + off, patch, sizeof(*patch) * len);
           ^~~~~~
   kernel/bpf/core.c:508:2: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(prog->insnsi + off, prog->insnsi + off + cnt,
           ^~~~~~~
   kernel/bpf/core.c:508:2: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
           memmove(prog->insnsi + off, prog->insnsi + off + cnt,
           ^~~~~~~
   kernel/bpf/core.c:1370:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dst, 0, size);
           ^~~~~~
   kernel/bpf/core.c:1370:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(dst, 0, size);
           ^~~~~~
   Suppressed 68 warnings (66 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   arch/x86/kernel/cpu/mce/genpool.c:113:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&node->mce, mce, sizeof(*mce));
           ^~~~~~
   arch/x86/kernel/cpu/mce/genpool.c:113:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&node->mce, mce, sizeof(*mce));
           ^~~~~~
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   arch/x86/kernel/cpu/mce/inject.c:115:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(m, 0, sizeof(struct mce));
           ^~~~~~
   arch/x86/kernel/cpu/mce/inject.c:115:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(m, 0, sizeof(struct mce));
           ^~~~~~
   arch/x86/kernel/cpu/mce/inject.c:136:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(i, m, sizeof(struct mce));
           ^~~~~~
   arch/x86/kernel/cpu/mce/inject.c:136:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(i, m, sizeof(struct mce));
           ^~~~~~
   arch/x86/kernel/cpu/mce/inject.c:147:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&b, 0xff, sizeof(mce_banks_t));
           ^~~~~~
   arch/x86/kernel/cpu/mce/inject.c:147:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&b, 0xff, sizeof(mce_banks_t));
           ^~~~~~
   arch/x86/kernel/cpu/mce/inject.c:160:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&regs, 0, sizeof(struct pt_regs));
                   ^~~~~~
   arch/x86/kernel/cpu/mce/inject.c:160:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(&regs, 0, sizeof(struct pt_regs));
                   ^~~~~~
>> arch/x86/kernel/cpu/mce/inject.c:355:6: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           n =3D sprintf(buf, "%s\n", flags_options[inj_type]);
               ^~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:355:6: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           n =3D sprintf(buf, "%s\n", flags_options[inj_type]);
               ^~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:746:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&dfs_fls, 0, sizeof(dfs_fls));
           ^~~~~~
   arch/x86/kernel/cpu/mce/inject.c:746:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&dfs_fls, 0, sizeof(dfs_fls));
           ^~~~~~
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   arch/x86/crypto/cast5_avx_glue.c:53:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           CBC_ENC_BLOCK(__cast5_encrypt);
           ^
   arch/x86/crypto/ecb_cbc_helpers.h:52:2: note: expanded from macro 'CBC_E=
NC_BLOCK'
           memcpy(walk.iv, __iv, __bsize);                                 \
           ^~~~~~
   arch/x86/crypto/cast5_avx_glue.c:53:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           CBC_ENC_BLOCK(__cast5_encrypt);
           ^
   arch/x86/crypto/ecb_cbc_helpers.h:52:2: note: expanded from macro 'CBC_E=
NC_BLOCK'
           memcpy(walk.iv, __iv, __bsize);                                 \
           ^~~~~~
   arch/x86/crypto/cast5_avx_glue.c:60:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           CBC_DEC_BLOCK(CAST5_PARALLEL_BLOCKS, cast5_cbc_dec_16way);
           ^
   arch/x86/crypto/ecb_cbc_helpers.h:59:11: note: expanded from macro 'CBC_=
DEC_BLOCK'
                           __iv =3D memcpy(buf, __iv, __bsize);            =
  \
                                  ^~~~~~
   arch/x86/crypto/cast5_avx_glue.c:60:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           CBC_DEC_BLOCK(CAST5_PARALLEL_BLOCKS, cast5_cbc_dec_16way);
           ^
   arch/x86/crypto/ecb_cbc_helpers.h:59:11: note: expanded from macro 'CBC_=
DEC_BLOCK'
                           __iv =3D memcpy(buf, __iv, __bsize);            =
  \
                                  ^~~~~~
   arch/x86/crypto/cast5_avx_glue.c:61:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           CBC_DEC_BLOCK(1, __cast5_decrypt);
           ^
   arch/x86/crypto/ecb_cbc_helpers.h:59:11: note: expanded from macro 'CBC_=
DEC_BLOCK'
                           __iv =3D memcpy(buf, __iv, __bsize);            =
  \
                                  ^~~~~~
   arch/x86/crypto/cast5_avx_glue.c:61:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           CBC_DEC_BLOCK(1, __cast5_decrypt);
           ^
   arch/x86/crypto/ecb_cbc_helpers.h:59:11: note: expanded from macro 'CBC_=
DEC_BLOCK'
                           __iv =3D memcpy(buf, __iv, __bsize);            =
  \
                                  ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   arch/x86/kernel/e820.c:416:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(entries, new_entries, new_nr_entries*sizeof(*entries));
           ^~~~~~
   arch/x86/kernel/e820.c:416:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(entries, new_entries, new_nr_entries*sizeof(*entries));
           ^~~~~~
   arch/x86/kernel/e820.c:569:4: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(entry, 0, sizeof(*entry));
                           ^~~~~~
   arch/x86/kernel/e820.c:569:4: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                           memset(entry, 0, sizeof(*entry));
                           ^~~~~~
   arch/x86/kernel/e820.c:737:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(e820_table_kexec, e820_table, sizeof(*e820_table_kexec));
           ^~~~~~
   arch/x86/kernel/e820.c:737:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(e820_table_kexec, e820_table, sizeof(*e820_table_kexec));
           ^~~~~~
   arch/x86/kernel/e820.c:738:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(e820_table_firmware, e820_table, sizeof(*e820_table_firmw=
are));
           ^~~~~~
   arch/x86/kernel/e820.c:738:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(e820_table_firmware, e820_table, sizeof(*e820_table_firmw=
are));
           ^~~~~~
   arch/x86/kernel/e820.c:1288:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(e820_table_kexec, e820_table, sizeof(*e820_table_kexec));
           ^~~~~~
   arch/x86/kernel/e820.c:1288:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(e820_table_kexec, e820_table, sizeof(*e820_table_kexec));
           ^~~~~~
   arch/x86/kernel/e820.c:1289:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(e820_table_firmware, e820_table, sizeof(*e820_table_firmw=
are));
           ^~~~~~
   arch/x86/kernel/e820.c:1289:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(e820_table_firmware, e820_table, sizeof(*e820_table_firmw=
are));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   security/integrity/evm/evm_crypto.c:62:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(evmkey, key, keylen);
           ^~~~~~
   security/integrity/evm/evm_crypto.c:62:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(evmkey, key, keylen);
           ^~~~~~
   security/integrity/evm/evm_crypto.c:156:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&hmac_misc, 0, sizeof(hmac_misc));
--
           if (tr && (len < *size))
               ^~
   kernel/sysctl.c:444:6: note: Left side of '&&' is true
   kernel/sysctl.c:444:2: note: Taking false branch
           if (tr && (len < *size))
           ^
   kernel/sysctl.c:450:2: note: Returning without writing to '*tr'
           return 0;
           ^
   kernel/sysctl.c:450:2: note: Returning zero, which participates in a con=
dition later
           return 0;
           ^~~~~~~~
   kernel/sysctl.c:1447:10: note: Returning from 'proc_get_long'
                           err =3D proc_get_long(&p, &left, &val_a, &neg, t=
r_a,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sysctl.c:1454:9: note: Assuming 'left' is <=3D 1
                           if ((left <=3D 1) && skipped) {
                                ^~~~~~~~~
   kernel/sysctl.c:1454:8: note: Left side of '&&' is true
                           if ((left <=3D 1) && skipped) {
                               ^
   kernel/sysctl.c:1454:23: note: 'skipped' is 0
                           if ((left <=3D 1) && skipped) {
                                              ^~~~~~~
   kernel/sysctl.c:1454:4: note: Taking false branch
                           if ((left <=3D 1) && skipped) {
                           ^
   kernel/sysctl.c:1459:8: note: 'err' is 0
                           if (err)
                               ^~~
   kernel/sysctl.c:1459:4: note: Taking false branch
                           if (err)
                           ^
   kernel/sysctl.c:1461:8: note: Assuming 'val_a' is < 'bitmap_len'
                           if (val_a >=3D bitmap_len || neg) {
                               ^~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c:1461:8: note: Left side of '||' is false
   kernel/sysctl.c:1461:31: note: 'neg' is false
                           if (val_a >=3D bitmap_len || neg) {
                                                      ^~~
   kernel/sysctl.c:1461:4: note: Taking false branch
                           if (val_a >=3D bitmap_len || neg) {
                           ^
   kernel/sysctl.c:1467:8: note: Assuming 'left' is 0
                           if (left) {
                               ^~~~
   kernel/sysctl.c:1467:4: note: Taking false branch
                           if (left) {
                           ^
   kernel/sysctl.c:1472:10: note: The left operand of '=3D=3D' is a garbage=
 value
                           if (c =3D=3D '-') {
                               ~ ^
   Suppressed 86 warnings (86 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   crypto/essiv.c:213:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(iv, req->iv, ivsize);
                   ^~~~~~
   crypto/essiv.c:213:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(iv, req->iv, ivsize);
                   ^~~~~~
   crypto/essiv.c:403:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(essiv_cipher_name, p, len);
           ^~~~~~
   crypto/essiv.c:403:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(essiv_cipher_name, p, len);
           ^~~~~~
   crypto/essiv.c:552:6: warning: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(base->cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/essiv.c:552:6: note: Call to function 'snprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'snprintf_s' in case of C11
           if (snprintf(base->cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/essiv.c:556:6: warning: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(base->cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/essiv.c:556:6: note: Call to function 'snprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'snprintf_s' in case of C11
           if (snprintf(base->cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   security/keys/encrypted-keys/ecryptfs_format.c:57:2: warning: Call to fu=
nction 'strncpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'strncpy_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy((char *)auth_tok->token.password.signature, key_desc,
           ^~~~~~~
   security/keys/encrypted-keys/ecryptfs_format.c:57:2: note: Call to funct=
ion 'strncpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy((char *)auth_tok->token.password.signature, key_desc,
           ^~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   security/integrity/evm/evm_secfs.c:48:2: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(temp, "%d", (evm_initialized & ~EVM_SETUP_COMPLETE));
           ^~~~~~~
   security/integrity/evm/evm_secfs.c:48:2: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(temp, "%d", (evm_initialized & ~EVM_SETUP_COMPLETE));
           ^~~~~~~
>> security/integrity/evm/evm_secfs.c:159:3: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
                   sprintf(temp + offset, "%s\n", xattr->name);
                   ^~~~~~~
   security/integrity/evm/evm_secfs.c:159:3: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
                   sprintf(temp + offset, "%s\n", xattr->name);
                   ^~~~~~~
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   lib/bitmap.c:131:3: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memset(&dst[lim - off], 0, off*sizeof(unsigned long));
                   ^~~~~~
   lib/bitmap.c:131:3: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
                   memset(&dst[lim - off], 0, off*sizeof(unsigned long));
                   ^~~~~~
   lib/bitmap.c:169:3: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memset(dst, 0, off*sizeof(unsigned long));
                   ^~~~~~
   lib/bitmap.c:169:3: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
                   memset(dst, 0, off*sizeof(unsigned long));
                   ^~~~~~
   lib/bitmap.c:222:2: warning: Call to function 'memmove' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(dst, src, len * sizeof(*dst));
           ^~~~~~~
   lib/bitmap.c:222:2: note: Call to function 'memmove' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memmove_s' in case of C11
           memmove(dst, src, len * sizeof(*dst));
           ^~~~~~~
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   include/linux/scatterlist.h:76:9: warning: Access to field 'page_link' r=
esults in a dereference of a null pointer (loaded from variable 'sg') [clan=
g-analyzer-core.NullDereference]
           return sg->page_link & SG_PAGE_LINK_MASK;
                  ^
   lib/scatterlist.c:103:27: note: 'ret' initialized to a null pointer value
           struct scatterlist *sg, *ret =3D NULL;
                                    ^~~
   lib/scatterlist.c:106:30: note: Assuming 'i' is >=3D 'nents'
           for_each_sg(sgl, sg, nents, i)
                                       ^
   include/linux/scatterlist.h:169:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   lib/scatterlist.c:106:2: note: Loop condition is false. Execution contin=
ues on line 109
           for_each_sg(sgl, sg, nents, i)
           ^
   include/linux/scatterlist.h:169:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   lib/scatterlist.c:109:21: note: Passing null pointer value via 1st param=
eter 'sg'
           BUG_ON(!sg_is_last(ret));
                              ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/scatterlist.c:109:10: note: Calling 'sg_is_last'
           BUG_ON(!sg_is_last(ret));
                   ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/scatterlist.h:91:20: note: Passing null pointer value via =
1st parameter 'sg'
           return __sg_flags(sg) & SG_END;
                             ^~
   include/linux/scatterlist.h:91:9: note: Calling '__sg_flags'
           return __sg_flags(sg) & SG_END;
                  ^~~~~~~~~~~~~~
   include/linux/scatterlist.h:76:9: note: Access to field 'page_link' resu=
lts in a dereference of a null pointer (loaded from variable 'sg')
           return sg->page_link & SG_PAGE_LINK_MASK;
                  ^~
   lib/scatterlist.c:126:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sgl, 0, sizeof(*sgl) * nents);
           ^~~~~~
   lib/scatterlist.c:126:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(sgl, 0, sizeof(*sgl) * nents);
           ^~~~~~
   lib/scatterlist.c:292:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(table, 0, sizeof(*table));
           ^~~~~~
   lib/scatterlist.c:292:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(table, 0, sizeof(*table));
           ^~~~~~
   lib/scatterlist.c:579:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sgt, &append.sgt, sizeof(*sgt));
           ^~~~~~
   lib/scatterlist.c:579:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(sgt, &append.sgt, sizeof(*sgt));
           ^~~~~~
   lib/scatterlist.c:789:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(miter, 0, sizeof(struct sg_mapping_iter));
--
                                               ^
   include/linux/hid.h:1035:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1035:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1036:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:639:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1036:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:639:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1036:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   include/linux/hid.h:1037:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:656:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/platform/x86/classmate-laptop.c:213:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", accel->sensitivity);
                  ^~~~~~~
   drivers/platform/x86/classmate-laptop.c:213:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", accel->sensitivity);
                  ^~~~~~~
   drivers/platform/x86/classmate-laptop.c:262:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", accel->g_select);
                  ^~~~~~~
   drivers/platform/x86/classmate-laptop.c:262:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", accel->g_select);
                  ^~~~~~~
   drivers/platform/x86/classmate-laptop.c:556:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", accel->sensitivity);
                  ^~~~~~~
   drivers/platform/x86/classmate-laptop.c:556:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", accel->sensitivity);
                  ^~~~~~~
   drivers/platform/x86/classmate-laptop.c:943:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(struct backlight_properties));
           ^~~~~~
   drivers/platform/x86/classmate-laptop.c:943:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(struct backlight_properties));
           ^~~~~~
   Suppressed 35 warnings (34 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/platform/x86/fujitsu-tablet.c:309:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(fujitsu.config.keymap, dmi->driver_data,
           ^~~~~~
   drivers/platform/x86/fujitsu-tablet.c:309:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(fujitsu.config.keymap, dmi->driver_data,
           ^~~~~~
>> drivers/platform/x86/fujitsu-tablet.c:458:2: warning: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOr=
UnsafeBufferHandling]
           sprintf(acpi_device_name(adev), "Fujitsu %s", acpi_device_hid(ad=
ev));
           ^~~~~~~
   drivers/platform/x86/fujitsu-tablet.c:458:2: note: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11
           sprintf(acpi_device_name(adev), "Fujitsu %s", acpi_device_hid(ad=
ev));
           ^~~~~~~
   drivers/platform/x86/fujitsu-tablet.c:459:2: warning: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOr=
UnsafeBufferHandling]
           sprintf(acpi_device_class(adev), "%s", ACPI_FUJITSU_CLASS);
           ^~~~~~~
   drivers/platform/x86/fujitsu-tablet.c:459:2: note: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11
           sprintf(acpi_device_class(adev), "%s", ACPI_FUJITSU_CLASS);
           ^~~~~~~
   drivers/platform/x86/fujitsu-tablet.c:461:2: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(fujitsu.phys, sizeof(fujitsu.phys),
           ^~~~~~~~
   drivers/platform/x86/fujitsu-tablet.c:461:2: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(fujitsu.phys, sizeof(fujitsu.phys),
           ^~~~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/leds/leds-pwm.c:141:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&led, 0, sizeof(led));
           ^~~~~~
   drivers/leds/leds-pwm.c:141:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(&led, 0, sizeof(led));
           ^~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (34 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/leds/flash/leds-lm3601x.c:226:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(led->regmap, LM3601X_CFG_REG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:226:3: note: Value stored to 'ret' is =
never read
                   ret =3D regmap_update_bits(led->regmap, LM3601X_CFG_REG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:230:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:230:3: note: Value stored to 'ret' is =
never read
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:234:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:234:3: note: Value stored to 'ret' is =
never read
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/i2c/i2c-dev.c:607:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(client->name, I2C_NAME_SIZE, "i2c-dev %d", adap->nr);
           ^~~~~~~~
   drivers/i2c/i2c-dev.c:607:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(client->name, I2C_NAME_SIZE, "i2c-dev %d", adap->nr);
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/i2c/i2c-mux.c:328:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(priv->adap.name, sizeof(priv->adap.name),
           ^~~~~~~~
   drivers/i2c/i2c-mux.c:328:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(priv->adap.name, sizeof(priv->adap.name),
           ^~~~~~~~
   drivers/i2c/i2c-mux.c:424:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(symlink_name, sizeof(symlink_name), "channel-%u", chan_=
id);
           ^~~~~~~~
   drivers/i2c/i2c-mux.c:424:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(symlink_name, sizeof(symlink_name), "channel-%u", chan_=
id);
           ^~~~~~~~
   drivers/i2c/i2c-mux.c:451:3: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(symlink_name, sizeof(symlink_name),
                   ^~~~~~~~
   drivers/i2c/i2c-mux.c:451:3: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                   snprintf(symlink_name, sizeof(symlink_name),
                   ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:251:13: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                           count +=3D sprintf(buf + count, "[%s] ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:255:13: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                           count +=3D sprintf(buf + count, "%s ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:255:13: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                           count +=3D sprintf(buf + count, "%s ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:299:10: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                   return sprintf(buf, "%s\n", ps_attr->text_values[value.i=
ntval]);
                          ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:299:10: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                   return sprintf(buf, "%s\n", ps_attr->text_values[value.i=
ntval]);
                          ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:308:9: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%s\n", value.strval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:308:9: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%s\n", value.strval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:311:9: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%d\n", value.intval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:311:9: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%d\n", value.intval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:415:4: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(power_supply_attrs[i].attr_name, "_err_%=
d", i);
                           ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:415:4: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(power_supply_attrs[i].attr_name, "_err_%=
d", i);
                           ^~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/bcma/main.c:36:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%03X\n", core->id.manuf);
                  ^~~~~~~
   drivers/bcma/main.c:36:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%03X\n", core->id.manuf);
                  ^~~~~~~
   drivers/bcma/main.c:43:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%03X\n", core->id.id);
                  ^~~~~~~
   drivers/bcma/main.c:43:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%03X\n", core->id.id);
                  ^~~~~~~
   drivers/bcma/main.c:50:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%02X\n", core->id.rev);
                  ^~~~~~~
   drivers/bcma/main.c:50:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%02X\n", core->id.rev);
                  ^~~~~~~
   drivers/bcma/main.c:57:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%X\n", core->id.class);
                  ^~~~~~~
   drivers/bcma/main.c:57:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%X\n", core->id.class);
                  ^~~~~~~
   drivers/bcma/main.c:674:3: warning: Value stored to 'err' is never read =
[clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   drivers/bcma/main.c:674:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/platform/x86/think-lmi.c:286:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pwdcfg, obj->buffer.pointer, copy_size);
           ^~~~~~
   drivers/platform/x86/think-lmi.c:286:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pwdcfg, obj->buffer.pointer, copy_size);
           ^~~~~~
   drivers/platform/x86/think-lmi.c:421:5: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   sprintf(pwd_type, "uhdp%d", setting->ind=
ex);
                                   ^~~~~~~
   drivers/platform/x86/think-lmi.c:421:5: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                                   sprintf(pwd_type, "uhdp%d", setting->ind=
ex);
                                   ^~~~~~~
   drivers/platform/x86/think-lmi.c:423:5: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   sprintf(pwd_type, "mhdp%d", setting->ind=
ex);
                                   ^~~~~~~
   drivers/platform/x86/think-lmi.c:423:5: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                                   sprintf(pwd_type, "mhdp%d", setting->ind=
ex);
                                   ^~~~~~~
   drivers/platform/x86/think-lmi.c:426:5: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   sprintf(pwd_type, "unvp%d", setting->ind=
ex);
                                   ^~~~~~~
   drivers/platform/x86/think-lmi.c:426:5: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                                   sprintf(pwd_type, "unvp%d", setting->ind=
ex);
                                   ^~~~~~~
   drivers/platform/x86/think-lmi.c:428:5: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   sprintf(pwd_type, "mnvp%d", setting->ind=
ex);
                                   ^~~~~~~
   drivers/platform/x86/think-lmi.c:428:5: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                                   sprintf(pwd_type, "mnvp%d", setting->ind=
ex);
                                   ^~~~~~~
>> drivers/platform/x86/think-lmi.c:430:4: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                           sprintf(pwd_type, "%s", setting->pwd_type);
                           ^~~~~~~
   drivers/platform/x86/think-lmi.c:430:4: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                           sprintf(pwd_type, "%s", setting->pwd_type);
                           ^~~~~~~
   drivers/platform/x86/think-lmi.c:541:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(setting->kbdlang, buf, length);
           ^~~~~~
   drivers/platform/x86/think-lmi.c:541:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(setting->kbdlang, buf, length);
           ^~~~~~
   drivers/platform/x86/think-lmi.c:821:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", tlmi_priv.pending_changes);
                  ^~~~~~~
   drivers/platform/x86/think-lmi.c:821:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", tlmi_priv.pending_changes);
                  ^~~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/input/touchscreen/fujitsu_ts.c:111:2: warning: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(fujitsu->phys, sizeof(fujitsu->phys),
           ^~~~~~~~
   drivers/input/touchscreen/fujitsu_ts.c:111:2: note: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(fujitsu->phys, sizeof(fujitsu->phys),
           ^~~~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/comedi/comedi_fops.c:399:9: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%u\n", size);
                  ^~~~~~~~
   drivers/comedi/comedi_fops.c:399:9: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%u\n", size);
                  ^~~~~~~~
   drivers/comedi/comedi_fops.c:455:9: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%u\n", size);
                  ^~~~~~~~
   drivers/comedi/comedi_fops.c:455:9: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%u\n", size);
                  ^~~~~~~~
   drivers/comedi/comedi_fops.c:512:9: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%u\n", size);
                  ^~~~~~~~
   drivers/comedi/comedi_fops.c:512:9: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%u\n", size);
                  ^~~~~~~~
   drivers/comedi/comedi_fops.c:568:9: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%u\n", size);
                  ^~~~~~~~
   drivers/comedi/comedi_fops.c:568:9: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%u\n", size);
                  ^~~~~~~~
   drivers/comedi/comedi_fops.c:937:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&devinfo, 0, sizeof(devinfo));
           ^~~~~~
   drivers/comedi/comedi_fops.c:937:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&devinfo, 0, sizeof(devinfo));
           ^~~~~~
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/platform/x86/adv_swbutton.c:66:2: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(button->phys, sizeof(button->phys), "%s/button/input0",=
 ACPI_BUTTON_HID_SWBTN);
           ^~~~~~~~
   drivers/platform/x86/adv_swbutton.c:66:2: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(button->phys, sizeof(button->phys), "%s/button/input0",=
 ACPI_BUTTON_HID_SWBTN);
           ^~~~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   drivers/platform/x86/asus-laptop.c:806:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(struct backlight_properties));
           ^~~~~~
   drivers/platform/x86/asus-laptop.c:806:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(struct backlight_properties));
           ^~~~~~
   drivers/platform/x86/asus-laptop.c:855:9: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(page, ASUS_LAPTOP_NAME " " ASUS_LAPTOP_VERSION =
"\n");
                  ^~~~~~~
   drivers/platform/x86/asus-laptop.c:855:9: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(page, ASUS_LAPTOP_NAME " " ASUS_LAPTOP_VERSION =
"\n");
                  ^~~~~~~
>> drivers/platform/x86/asus-laptop.c:856:9: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
           len +=3D sprintf(page + len, "Model reference    : %s\n", asus->=
name);
                  ^~~~~~~
   drivers/platform/x86/asus-laptop.c:856:9: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
           len +=3D sprintf(page + len, "Model reference    : %s\n", asus->=
name);
                  ^~~~~~~
   drivers/platform/x86/asus-laptop.c:865:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(page + len, "SFUN value         : %#x\n=
",
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:865:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(page + len, "SFUN value         : %#x\n=
",
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:877:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(page + len, "HWRS value         : %#x\n=
",
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:877:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(page + len, "HWRS value         : %#x\n=
",
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:888:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(page + len, "ASYM value         : %#x\n=
",
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:888:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(page + len, "ASYM value         : %#x\n=
",
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:891:3: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, 16, "%d", asus->dsdt_info->length);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:891:3: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, 16, "%d", asus->dsdt_info->length);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:892:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
                   len +=3D sprintf(page + len, "DSDT length        : %s\n"=
, buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:892:10: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
                   len +=3D sprintf(page + len, "DSDT length        : %s\n"=
, buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:893:3: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, 16, "%d", asus->dsdt_info->checksum);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:893:3: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, 16, "%d", asus->dsdt_info->checksum);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:894:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
                   len +=3D sprintf(page + len, "DSDT checksum      : %s\n"=
, buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:894:10: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
                   len +=3D sprintf(page + len, "DSDT checksum      : %s\n"=
, buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:895:3: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, 16, "%d", asus->dsdt_info->revision);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:895:3: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, 16, "%d", asus->dsdt_info->revision);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:896:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
                   len +=3D sprintf(page + len, "DSDT revision      : %s\n"=
, buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:896:10: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
                   len +=3D sprintf(page + len, "DSDT revision      : %s\n"=
, buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:897:3: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, 7, "%s", asus->dsdt_info->oem_id);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:897:3: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, 7, "%s", asus->dsdt_info->oem_id);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:898:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
                   len +=3D sprintf(page + len, "OEM id             : %s\n"=
, buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:898:10: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
                   len +=3D sprintf(page + len, "OEM id             : %s\n"=
, buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:899:3: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, 9, "%s", asus->dsdt_info->oem_table_id);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:899:3: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, 9, "%s", asus->dsdt_info->oem_table_id);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:900:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
                   len +=3D sprintf(page + len, "OEM table id       : %s\n"=
, buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:900:10: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
                   len +=3D sprintf(page + len, "OEM table id       : %s\n"=
, buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:901:3: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, 16, "%x", asus->dsdt_info->oem_revision);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:901:3: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, 16, "%x", asus->dsdt_info->oem_revision);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:902:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
                   len +=3D sprintf(page + len, "OEM revision       : 0x%s\=
n", buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:902:10: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
                   len +=3D sprintf(page + len, "OEM revision       : 0x%s\=
n", buf);
                          ^~~~~~~
   drivers/platform/x86/asus-laptop.c:903:3: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, 5, "%s", asus->dsdt_info->asl_compiler_id);
                   ^~~~~~~~
   drivers/platform/x86/asus-laptop.c:903:3: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, 5, "%s", asus->dsdt_info->asl_compiler_id);
--
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:2566:6: note: Returning from 'IS_ERR'
           if (IS_ERR(name))
               ^~~~~~~~~~~~
   fs/namei.c:2566:2: note: Taking true branch
           if (IS_ERR(name))
           ^
   fs/namei.c:2567:3: note: Returning without writing to 'parent->mnt'
                   return PTR_ERR(name);
                   ^
   fs/namei.c:2567:3: note: Returning value, which participates in a condit=
ion later
                   return PTR_ERR(name);
                   ^~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4741:10: note: Returning from 'filename_parentat'
           error =3D filename_parentat(olddfd, from, lookup_flags, &old_pat=
h,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4743:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namei.c:4743:2: note: Taking false branch
           if (error)
           ^
   fs/namei.c:4746:10: note: Calling 'filename_parentat'
           error =3D filename_parentat(newdfd, to, lookup_flags, &new_path,=
 &new_last,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   fs/namei.c:2566:6: note: Calling 'IS_ERR'
           if (IS_ERR(name))
               ^~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:2566:6: note: Returning from 'IS_ERR'
           if (IS_ERR(name))
               ^~~~~~~~~~~~
   fs/namei.c:2566:2: note: Taking true branch
           if (IS_ERR(name))
           ^
   fs/namei.c:2567:3: note: Returning value, which participates in a condit=
ion later
                   return PTR_ERR(name);
                   ^~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4746:10: note: Returning from 'filename_parentat'
           error =3D filename_parentat(newdfd, to, lookup_flags, &new_path,=
 &new_last,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   fs/namei.c:4748:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namei.c:4748:2: note: Taking false branch
           if (error)
           ^
   fs/namei.c:4752:19: note: The left operand of '!=3D' is a garbage value
           if (old_path.mnt !=3D new_path.mnt)
               ~~~~~~~~~~~~ ^
   fs/namei.c:5025:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(page_address(page), symname, len-1);
           ^~~~~~
   fs/namei.c:5025:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(page_address(page), symname, len-1);
           ^~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/usb/line6/driver.c:274:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer + 1, line6_midi_id, sizeof(line6_midi_id));
           ^~~~~~
   sound/usb/line6/driver.c:274:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer + 1, line6_midi_id, sizeof(line6_midi_id));
           ^~~~~~
   sound/usb/line6/driver.c:767:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->id, properties->id);
           ^~~~~~
   sound/usb/line6/driver.c:767:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->id, properties->id);
           ^~~~~~
   sound/usb/line6/driver.c:768:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->driver, driver_name);
           ^~~~~~
   sound/usb/line6/driver.c:768:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->driver, driver_name);
           ^~~~~~
   sound/usb/line6/driver.c:769:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, properties->name);
           ^~~~~~
   sound/usb/line6/driver.c:769:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->shortname, properties->name);
           ^~~~~~
>> sound/usb/line6/driver.c:770:2: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           sprintf(card->longname, "Line 6 %s at USB %s", properties->name,
           ^~~~~~~
   sound/usb/line6/driver.c:770:2: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           sprintf(card->longname, "Line 6 %s at USB %s", properties->name,
           ^~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/media/cec/core/cec-api.c:156:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&log_addrs, &adap->log_addrs, sizeof(log_addrs));
           ^~~~~~
   drivers/media/cec/core/cec-api.c:156:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&log_addrs, &adap->log_addrs, sizeof(log_addrs));
           ^~~~~~
   drivers/media/cec/core/cec-api.c:158:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(log_addrs.log_addr, CEC_LOG_ADDR_INVALID,
                   ^~~~~~
   drivers/media/cec/core/cec-api.c:158:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(log_addrs.log_addr, CEC_LOG_ADDR_INVALID,
                   ^~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/media/cec/core/cec-api.c:645:6: note: Assuming 'fh' is not equal=
 to field 'cec_initiator'
           if (adap->cec_initiator =3D=3D fh)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:645:2: note: Taking false branch
           if (adap->cec_initiator =3D=3D fh)
           ^
   drivers/media/cec/core/cec-api.c:647:6: note: Assuming 'fh' is not equal=
 to field 'cec_follower'
           if (adap->cec_follower =3D=3D fh) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:647:2: note: Taking false branch
           if (adap->cec_follower =3D=3D fh) {
           ^
   drivers/media/cec/core/cec-api.c:651:6: note: Assuming the condition is =
false
           if (fh->mode_follower =3D=3D CEC_MODE_FOLLOWER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:651:2: note: Taking false branch
           if (fh->mode_follower =3D=3D CEC_MODE_FOLLOWER)
           ^
   drivers/media/cec/core/cec-api.c:653:6: note: Assuming the condition is =
false
           if (fh->mode_follower =3D=3D CEC_MODE_MONITOR_PIN)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:653:2: note: Taking false branch
           if (fh->mode_follower =3D=3D CEC_MODE_MONITOR_PIN)
           ^
   drivers/media/cec/core/cec-api.c:655:6: note: Assuming the condition is =
false
           if (fh->mode_follower =3D=3D CEC_MODE_MONITOR_ALL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:655:2: note: Taking false branch
           if (fh->mode_follower =3D=3D CEC_MODE_MONITOR_ALL)
           ^
   drivers/media/cec/core/cec-api.c:664:6: note: Assuming the condition is =
false
           if (cec_is_registered(adap) && list_empty(&devnode->fhs) &&
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:664:30: note: Left side of '&&' is false
           if (cec_is_registered(adap) && list_empty(&devnode->fhs) &&
                                       ^
   drivers/media/cec/core/cec-api.c:672:2: note: Loop condition is false. E=
xecution continues on line 680
           while (!list_empty(&fh->xfer_list)) {
           ^
   drivers/media/cec/core/cec-api.c:681:2: note: Loop condition is true.  E=
ntering loop body
           while (!list_empty(&fh->msgs)) {
           ^
   drivers/media/cec/core/cec-api.c:686:3: note: Memory is released
                   kfree(entry);
                   ^~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:681:2: note: Loop condition is true.  E=
ntering loop body
           while (!list_empty(&fh->msgs)) {
           ^
   drivers/media/cec/core/cec-api.c:685:3: note: Calling 'list_del'
                   list_del(&entry->list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   drivers/media/cec/core/cec-api.c:645:6: note: Assuming 'fh' is not equal=
 to field 'cec_initiator'
           if (adap->cec_initiator =3D=3D fh)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:645:2: note: Taking false branch
           if (adap->cec_initiator =3D=3D fh)
           ^
   drivers/media/cec/core/cec-api.c:647:6: note: Assuming 'fh' is not equal=
 to field 'cec_follower'
           if (adap->cec_follower =3D=3D fh) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:647:2: note: Taking false branch
           if (adap->cec_follower =3D=3D fh) {
--
           return ethnl_update_bitset32((u32 *)bitmap, nbits, attr, names, =
extack,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/ethtool/bitset.c:561:6: note: Assuming 'attr' is non-null
           if (!attr)
               ^~~~~
   net/ethtool/bitset.c:561:2: note: Taking false branch
           if (!attr)
           ^
   net/ethtool/bitset.c:565:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   net/ethtool/bitset.c:565:2: note: Taking false branch
           if (ret < 0)
           ^
   net/ethtool/bitset.c:568:6: note: Assuming the condition is false
           if (tb[ETHTOOL_A_BITSET_BITS])
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/bitset.c:568:2: note: Taking false branch
           if (tb[ETHTOOL_A_BITSET_BITS])
           ^
   net/ethtool/bitset.c:572:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   net/ethtool/bitset.c:572:2: note: Taking false branch
           if (ret < 0)
           ^
   net/ethtool/bitset.c:576:16: note: '__UNIQUE_ID___x407' is >=3D '__UNIQU=
E_ID___y408'
           change_bits =3D min_t(unsigned int,
                         ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   net/ethtool/bitset.c:576:16: note: '?' condition is false
           change_bits =3D min_t(unsigned int,
                         ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   net/ethtool/bitset.c:580:10: note: 'no_mask' is true
                                 no_mask ? NULL :
                                 ^~~~~~~
   net/ethtool/bitset.c:580:10: note: '?' condition is true
   net/ethtool/bitset.c:578:2: note: Calling 'ethnl_bitmap32_update'
           ethnl_bitmap32_update(bitmap, change_bits,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/bitset.c:131:9: note: Assuming 'nbits' is > 0
           while (nbits > 0) {
                  ^~~~~~~~~
   net/ethtool/bitset.c:131:2: note: Loop condition is true.  Entering loop=
 body
           while (nbits > 0) {
           ^
   net/ethtool/bitset.c:132:19: note: 'mask' is null
                   u32 real_mask =3D mask ? *mask : ~(u32)0;
                                   ^~~~
   net/ethtool/bitset.c:132:19: note: '?' condition is false
   net/ethtool/bitset.c:135:7: note: Assuming 'nbits' is < 32
                   if (nbits < 32)
                       ^~~~~~~~~~
   net/ethtool/bitset.c:135:3: note: Taking true branch
                   if (nbits < 32)
                   ^
   net/ethtool/bitset.c:136:17: note: Calling 'ethnl_lower_bits'
                           real_mask &=3D ethnl_lower_bits(nbits);
                                        ^~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/bitset.c:17:17: note: The result of the right shift is undef=
ined due to shifting by '32', which is greater or equal to the width of typ=
e 'u32'
           return ~(u32)0 >> (32 - n % 32);
                          ^  ~~~~~~~~~~~~~
   net/ethtool/bitset.c:256:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, val, nbytes);
                   ^~~~~~
   net/ethtool/bitset.c:256:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, val, nbytes);
                   ^~~~~~
   net/ethtool/bitset.c:265:4: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dst, mask, nbytes);
                           ^~~~~~
   net/ethtool/bitset.c:265:4: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                           memcpy(dst, mask, nbytes);
                           ^~~~~~
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
>> sound/usb/6fire/chip.c:130:2: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           sprintf(card->longname, "%s at %d:%d", card->shortname,
           ^~~~~~~
   sound/usb/6fire/chip.c:130:2: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           sprintf(card->longname, "%s at %d:%d", card->shortname,
           ^~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   sound/usb/6fire/firmware.c:383:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer, ep_w_max_packet_size,
                   ^~~~~~
   sound/usb/6fire/firmware.c:383:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer, ep_w_max_packet_size,
                   ^~~~~~
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   sound/soc/intel/atom/sst/sst_loader.c:269:4: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(listnode->dstn, listnode->src, listnode->=
size);
                           ^~~~~~
   sound/soc/intel/atom/sst/sst_loader.c:269:4: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(listnode->dstn, listnode->src, listnode->=
size);
                           ^~~~~~
   sound/soc/intel/atom/sst/sst_loader.c:297:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sst->fw_in_mem, fw->data, fw->size);
           ^~~~~~
   sound/soc/intel/atom/sst/sst_loader.c:297:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(sst->fw_in_mem, fw->data, fw->size);
           ^~~~~~
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   sound/soc/intel/atom/sst/sst_pvt.c:259:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msg->mailbox_data, &dsp_hdr, sizeof(dsp_hdr));
                   ^~~~~~
   sound/soc/intel/atom/sst/sst_pvt.c:259:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(msg->mailbox_data, &dsp_hdr, sizeof(dsp_hdr));
                   ^~~~~~
   sound/soc/intel/atom/sst/sst_pvt.c:261:4: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(msg->mailbox_data + sizeof(dsp_hdr),
                           ^~~~~~
   sound/soc/intel/atom/sst/sst_pvt.c:261:4: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(msg->mailbox_data + sizeof(dsp_hdr),
                           ^~~~~~
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/power/supply/ds2760_battery.c:692:2: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "ds2760-battery.%d", dev->id);
           ^~~~~~~~
   drivers/power/supply/ds2760_battery.c:692:2: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "ds2760-battery.%d", dev->id);
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   73 warnings generated.
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   85 warnings generated.
   net/sunrpc/svc.c:120:10: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", *ip);
                          ^~~~~~~
   net/sunrpc/svc.c:120:10: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", *ip);
                          ^~~~~~~
   net/sunrpc/svc.c:1198:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rqstp->rq_argp, 0, procp->pc_argsize);
           ^~~~~~
   net/sunrpc/svc.c:1198:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(rqstp->rq_argp, 0, procp->pc_argsize);
           ^~~~~~
   net/sunrpc/svc.c:1199:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rqstp->rq_resp, 0, procp->pc_ressize);
           ^~~~~~
   net/sunrpc/svc.c:1199:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(rqstp->rq_resp, 0, procp->pc_ressize);
           ^~~~~~
   net/sunrpc/svc.c:1231:2: warning: Value stored to 'rpc_stat' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           rpc_stat =3D rpc_success;
--
           ^~~~~~
   drivers/media/tuners/tda8290.c:813:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&fe->ops.analog_ops, 0, sizeof(struct analog_demod_ops));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   82 warnings generated.
   net/sunrpc/addr.c:40:10: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, buflen, "::");
                          ^~~~~~~~
   net/sunrpc/addr.c:40:10: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, buflen, "::");
                          ^~~~~~~~
   net/sunrpc/addr.c:48:10: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, buflen, "::1");
                          ^~~~~~~~
   net/sunrpc/addr.c:48:10: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, buflen, "::1");
                          ^~~~~~~~
   net/sunrpc/addr.c:57:10: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, buflen, "::ffff:%pI4",
                          ^~~~~~~~
   net/sunrpc/addr.c:57:10: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, buflen, "::ffff:%pI4",
                          ^~~~~~~~
   net/sunrpc/addr.c:63:9: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, buflen, "%pI6c", addr);
                  ^~~~~~~~
   net/sunrpc/addr.c:63:9: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           return snprintf(buf, buflen, "%pI6c", addr);
                  ^~~~~~~~
   net/sunrpc/addr.c:83:7: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           rc =3D snprintf(scopebuf, sizeof(scopebuf), "%c%u",
                ^~~~~~~~
   net/sunrpc/addr.c:83:7: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           rc =3D snprintf(scopebuf, sizeof(scopebuf), "%c%u",
                ^~~~~~~~
   net/sunrpc/addr.c:92:2: warning: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, scopebuf);
           ^~~~~~
   net/sunrpc/addr.c:92:2: note: Call to function 'strcat' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcat'. CWE-119
           strcat(buf, scopebuf);
           ^~~~~~
   net/sunrpc/addr.c:117:9: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, buflen, "%pI4", &sin->sin_addr);
                  ^~~~~~~~
   net/sunrpc/addr.c:117:9: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, buflen, "%pI4", &sin->sin_addr);
                  ^~~~~~~~
   net/sunrpc/addr.c:151:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sap, 0, sizeof(struct sockaddr_in));
           ^~~~~~
   net/sunrpc/addr.c:151:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(sap, 0, sizeof(struct sockaddr_in));
           ^~~~~~
   net/sunrpc/addr.c:183:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(p, delim + 1, len);
           ^~~~~~
   net/sunrpc/addr.c:183:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(p, delim + 1, len);
           ^~~~~~
   net/sunrpc/addr.c:210:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sap, 0, sizeof(struct sockaddr_in6));
           ^~~~~~
   net/sunrpc/addr.c:210:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(sap, 0, sizeof(struct sockaddr_in6));
           ^~~~~~
   net/sunrpc/addr.c:286:6: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(portbuf, sizeof(portbuf),
               ^~~~~~~~
   net/sunrpc/addr.c:286:6: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           if (snprintf(portbuf, sizeof(portbuf),
               ^~~~~~~~
   net/sunrpc/addr.c:321:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, uaddr, uaddr_len);
           ^~~~~~
   net/sunrpc/addr.c:321:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(buf, uaddr, uaddr_len);
           ^~~~~~
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   sound/usb/usx2y/usbusx2y.c:191:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(usx2y->in04_last, usx2y->in04_buf, sizeof=
(usx2y->in04_last));
                           ^~~~~~
   sound/usb/usx2y/usbusx2y.c:191:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(usx2y->in04_last, usx2y->in04_buf, sizeof=
(usx2y->in04_last));
                           ^~~~~~
   sound/usb/usx2y/usbusx2y.c:206:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(us428ctls->ctl_snapshot + n, usx2y->in04_=
buf, sizeof(us428ctls->ctl_snapshot[0]));
                           ^~~~~~
   sound/usb/usx2y/usbusx2y.c:206:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(us428ctls->ctl_snapshot + n, usx2y->in04_=
buf, sizeof(us428ctls->ctl_snapshot[0]));
                           ^~~~~~
   sound/usb/usx2y/usbusx2y.c:381:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->shortname, "TASCAM "NAME_ALLCAPS"");
           ^~~~~~~
   sound/usb/usx2y/usbusx2y.c:381:2: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->shortname, "TASCAM "NAME_ALLCAPS"");
           ^~~~~~~
>> sound/usb/usx2y/usbusx2y.c:382:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           sprintf(card->longname, "%s (%x:%x if %d at %03d/%03d)",
           ^~~~~~~
   sound/usb/usx2y/usbusx2y.c:382:2: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           sprintf(card->longname, "%s (%x:%x if %d at %03d/%03d)",
           ^~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   fs/nfs/nfs4idmap.c:172:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, name, namelen);
           ^~~~~~
   fs/nfs/nfs4idmap.c:172:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(buf, name, namelen);
           ^~~~~~
   fs/nfs/nfs4idmap.c:183:9: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, buflen, "%u", id);
                  ^~~~~~~~
   fs/nfs/nfs4idmap.c:183:9: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, buflen, "%u", id);
                  ^~~~~~~~
   fs/nfs/nfs4idmap.c:269:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cp, type, typelen);
           ^~~~~~
   fs/nfs/nfs4idmap.c:269:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(cp, type, typelen);
           ^~~~~~
   fs/nfs/nfs4idmap.c:273:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cp, name, namelen);
           ^~~~~~
   fs/nfs/nfs4idmap.c:273:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(cp, name, namelen);
           ^~~~~~
   fs/nfs/nfs4idmap.c:338:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, payload->data, ret);
                   ^~~~~~
   fs/nfs/nfs4idmap.c:338:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(data, payload->data, ret);
                   ^~~~~~
   Suppressed 75 warnings (75 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/media/dvb-frontends/dib0070.c:80:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(state->msg, 0, 2 * sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dib0070.c:80:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(state->msg, 0, 2 * sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dib0070.c:113:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(state->msg, 0, sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dib0070.c:113:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(state->msg, 0, sizeof(struct i2c_msg));
           ^~~~~~
   drivers/media/dvb-frontends/dib0070.c:755:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &dib0070_ops, sizeof(struct dvb_tuner=
_ops));
           ^~~~~~
   drivers/media/dvb-frontends/dib0070.c:755:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &dib0070_ops, sizeof(struct dvb_tuner=
_ops));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   73 warnings generated.
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   106 warnings generated.
   include/linux/skbuff.h:2167:2: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                       ^
   net/ipv6/ip6_output.c:1846:8: note: Calling '__skb_dequeue'
           skb =3D __skb_dequeue(queue);
                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2182:6: note: Assuming 'skb' is non-null
           if (skb)
               ^~~
   include/linux/skbuff.h:2182:2: note: Taking true branch
           if (skb)
           ^
   include/linux/skbuff.h:2183:3: note: Calling '__skb_unlink'
                   __skb_unlink(skb, list);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2163:2: note: Left side of '||' is false
           WRITE_ONCE(list->qlen, list->qlen - 1);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/skbuff.h:2163:2: note: Left side of '||' is false
           WRITE_ONCE(list->qlen, list->qlen - 1);

vim +355 arch/x86/kernel/cpu/mce/inject.c

bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  348  =

bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  349  static ssize_t flags_read(struct file *filp, char __user *ubuf,
bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  350  			  size_t cnt, loff_t *ppos)
bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  351  {
bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  352  	char buf[MAX_FLAG_OPT_SIZE];
bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  353  	int n;
bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  354  =

bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13 @355  	n =3D sprintf(buf, "%s\n", flags_options[inj_type]);
bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  356  =

bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  357  	return simple_read_from_buffer(ubuf, cnt, ppos, buf, n);
bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  358  }
bc8e80d56c1ecb arch/x86/kernel/cpu/mcheck/mce-inject.c Borislav Petkov 2017=
-06-13  359  =


:::::: The code at line 355 was first introduced by commit
:::::: bc8e80d56c1ecb35e65df392d7601d1427d14efe x86/mce: Merge mce_amd_inj =
into mce-inject

:::::: TO: Borislav Petkov <bp@suse.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0630989296867768505==--


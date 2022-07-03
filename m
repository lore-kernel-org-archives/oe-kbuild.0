Content-Type: multipart/mixed; boundary="===============4740416381159855200=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/debug/kdb/kdb_main.c:314:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or pr...
Date: Mon, 04 Jul 2022 06:57:49 +0800
Message-ID: <202207040657.YqO5g0Rg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4740416381159855200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 kernel/debug/kdb/kdb_main.c:314:2: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   20855e4cb361adeabce3665f5174b09b4a6ebfe6
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220625 (https://download.01.org/0day-ci/archi=
ve/20220704/202207040657.YqO5g0Rg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 42a7dd=
b428c999229491b0effbb1a4059149fba8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:131:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(key, pkey->key, pkey->keylen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:131:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(key, pkey->key, pkey->keylen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:135:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ptr, pkey->params, pkey->paramlen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:135:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ptr, pkey->params, pkey->paramlen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:202:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(key, pkey->key, pkey->keylen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:202:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(key, pkey->key, pkey->keylen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:206:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ptr, pkey->params, pkey->paramlen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:206:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ptr, pkey->params, pkey->paramlen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:348:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(key, pkey->key, pkey->keylen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:348:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(key, pkey->key, pkey->keylen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:352:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ptr, pkey->params, pkey->paramlen);
           ^~~~~~
   crypto/asymmetric_keys/public_key.c:352:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ptr, pkey->params, pkey->paramlen);
           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   crypto/ahash.c:151:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(alignbuffer, key, keylen);
           ^~~~~~
   crypto/ahash.c:151:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(alignbuffer, key, keylen);
           ^~~~~~
   crypto/ahash.c:261:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(priv->result, req->result,
                   ^~~~~~
   crypto/ahash.c:261:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(priv->result, req->result,
                   ^~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   crypto/shash.c:57:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy(alignbuffer, key, keylen);
           ^~~~~~
   crypto/shash.c:57:2: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
           memcpy(alignbuffer, key, keylen);
           ^~~~~~
   crypto/shash.c:113:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, data, unaligned_len);
           ^~~~~~
   crypto/shash.c:113:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(buf, data, unaligned_len);
           ^~~~~~
   crypto/shash.c:115:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, unaligned_len);
           ^~~~~~
   crypto/shash.c:115:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(buf, 0, unaligned_len);
           ^~~~~~
   crypto/shash.c:156:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, buf, ds);
           ^~~~~~
   crypto/shash.c:156:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(out, buf, ds);
           ^~~~~~
   crypto/shash.c:159:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, ds);
           ^~~~~~
   crypto/shash.c:159:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(buf, 0, ds);
           ^~~~~~
   crypto/shash.c:239:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, shash_desc_ctx(desc), crypto_shash_descsize(desc->tf=
m));
           ^~~~~~
   crypto/shash.c:239:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(out, shash_desc_ctx(desc), crypto_shash_descsize(desc->tf=
m));
           ^~~~~~
   crypto/shash.c:245:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(shash_desc_ctx(desc), in, crypto_shash_descsize(desc->tfm=
));
           ^~~~~~
   crypto/shash.c:245:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(shash_desc_ctx(desc), in, crypto_shash_descsize(desc->tfm=
));
           ^~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
>> kernel/debug/kdb/kdb_main.c:314:2: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           sprintf(ep, "%s=3D%s", var, val);
           ^~~~~~~
   kernel/debug/kdb/kdb_main.c:314:2: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           sprintf(ep, "%s=3D%s", var, val);
           ^~~~~~~
   kernel/debug/kdb/kdb_main.c:563:3: warning: Value stored to 'found' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   found =3D kdbnearsym(addr, &symtab);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/debug/kdb/kdb_main.c:563:3: note: Value stored to 'found' is neve=
r read
                   found =3D kdbnearsym(addr, &symtab);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/debug/kdb/kdb_main.c:750:3: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(mp->usage, argv[2]+1);
                   ^~~~~~
   kernel/debug/kdb/kdb_main.c:750:3: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
                   strcpy(mp->usage, argv[2]+1);
                   ^~~~~~
   kernel/debug/kdb/kdb_main.c:754:3: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(mp->help, argv[3]+1);
                   ^~~~~~
   kernel/debug/kdb/kdb_main.c:754:3: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
                   strcpy(mp->help, argv[3]+1);
                   ^~~~~~
   kernel/debug/kdb/kdb_main.c:882:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(kdb_grep_string, cp);
           ^~~~~~
   kernel/debug/kdb/kdb_main.c:882:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(kdb_grep_string, cp);
           ^~~~~~
   kernel/debug/kdb/kdb_main.c:1295:3: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"),
                   ^~~~~~~~
   kernel/debug/kdb/kdb_main.c:1295:3: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"),
                   ^~~~~~~~
   kernel/debug/kdb/kdb_main.c:1298:4: warning: Call to function 'strncat' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'strncat_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncat(kdb_prompt_str, "[defcmd]", CMD_BUFLEN);
                           ^~~~~~~
   kernel/debug/kdb/kdb_main.c:1298:4: note: Call to function 'strncat' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'strncat_s' in case of C11
                           strncat(kdb_prompt_str, "[defcmd]", CMD_BUFLEN);
                           ^~~~~~~
   kernel/debug/kdb/kdb_main.c:1488:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cbuf, '\0', sizeof(cbuf));
           ^~~~~~
   kernel/debug/kdb/kdb_main.c:1488:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(cbuf, '\0', sizeof(cbuf));
           ^~~~~~
   kernel/debug/kdb/kdb_main.c:1504:4: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&symtab, 0, sizeof(symtab));
                           ^~~~~~
   kernel/debug/kdb/kdb_main.c:1504:4: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                           memset(&symtab, 0, sizeof(symtab));
                           ^~~~~~
   kernel/debug/kdb/kdb_main.c:1667:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(fmtstr, "%%16.16l%c ", fmtchar);
                   ^~~~~~~
   kernel/debug/kdb/kdb_main.c:1667:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(fmtstr, "%%16.16l%c ", fmtchar);
                   ^~~~~~~
   kernel/debug/kdb/kdb_main.c:1670:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(fmtstr, "%%8.8l%c ", fmtchar);
                   ^~~~~~~
   kernel/debug/kdb/kdb_main.c:1670:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(fmtstr, "%%8.8l%c ", fmtchar);
                   ^~~~~~~
   kernel/debug/kdb/kdb_main.c:1673:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(fmtstr, "%%4.4l%c ", fmtchar);
                   ^~~~~~~
   kernel/debug/kdb/kdb_main.c:1673:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(fmtstr, "%%4.4l%c ", fmtchar);
                   ^~~~~~~
   kernel/debug/kdb/kdb_main.c:1676:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(fmtstr, "%%2.2l%c ", fmtchar);
                   ^~~~~~~
   kernel/debug/kdb/kdb_main.c:1676:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(fmtstr, "%%2.2l%c ", fmtchar);
                   ^~~~~~~
   kernel/debug/kdb/kdb_main.c:2480:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(val, 0, sizeof(*val));
           ^~~~~~
   kernel/debug/kdb/kdb_main.c:2480:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(val, 0, sizeof(*val));
           ^~~~~~
   kernel/debug/kdb/kdb_main.c:2558:2: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(fmtstr, "%%0%dlx ", (int)(2*bytesperword));
           ^~~~~~~
   kernel/debug/kdb/kdb_main.c:2558:2: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           sprintf(fmtstr, "%%0%dlx ", (int)(2*bytesperword));
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   kernel/cgroup/debug.c:225:4: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(pbuf, sizeof(pbuf) - 1, " P=3D%d",
--
                 ^~~~~~~~
   drivers/gpu/drm/drm_print.c:109:8: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           len =3D snprintf(NULL, 0, "%pV", vaf);
                 ^~~~~~~~
   drivers/gpu/drm/drm_print.c:121:3: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(((char *) iterator->data) + pos,
                   ^~~~~~~~
   drivers/gpu/drm/drm_print.c:121:3: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(((char *) iterator->data) + pos,
                   ^~~~~~~~
   drivers/gpu/drm/drm_print.c:138:2: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, len + 1, "%pV", vaf);
           ^~~~~~~~
   drivers/gpu/drm/drm_print.c:138:2: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf, len + 1, "%pV", vaf);
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/iommu/iommu.c:419:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", group->name);
                  ^~~~~~~
   drivers/iommu/iommu.c:419:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", group->name);
                  ^~~~~~~
   drivers/iommu/iommu.c:531:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   str +=3D sprintf(str, "0x%016llx 0x%016llx %s\n",
                          ^~~~~~~
   drivers/iommu/iommu.c:531:10: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   str +=3D sprintf(str, "0x%016llx 0x%016llx %s\n",
                          ^~~~~~~
   drivers/iommu/iommu.c:568:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:568:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:1733:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&gtype, 0, sizeof(gtype));
           ^~~~~~
   drivers/iommu/iommu.c:1733:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&gtype, 0, sizeof(gtype));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
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
   43 warnings generated.
   drivers/usb/mon/mon_bin.c:249:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, from, step_len);
                   ^~~~~~
   drivers/usb/mon/mon_bin.c:249:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, from, step_len);
                   ^~~~~~
   drivers/usb/mon/mon_bin.c:388:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ep, 0, PKT_SIZE);
           ^~~~~~
   drivers/usb/mon/mon_bin.c:388:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(ep, 0, PKT_SIZE);
           ^~~~~~
   drivers/usb/mon/mon_bin.c:399:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(setupb, urb->setup_packet, SETUP_LEN);
           ^~~~~~
   drivers/usb/mon/mon_bin.c:399:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(setupb, urb->setup_packet, SETUP_LEN);
           ^~~~~~
   drivers/usb/mon/mon_bin.c:566:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ep, 0, PKT_SIZE);
           ^~~~~~
   drivers/usb/mon/mon_bin.c:566:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(ep, 0, PKT_SIZE);
           ^~~~~~
   drivers/usb/mon/mon_bin.c:653:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ep, 0, PKT_SIZE);
           ^~~~~~
   drivers/usb/mon/mon_bin.c:653:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(ep, 0, PKT_SIZE);
           ^~~~~~
   drivers/usb/mon/mon_bin.c:848:3: warning: Value stored to 'nbytes' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   nbytes -=3D step_len;
                   ^         ~~~~~~~~
   drivers/usb/mon/mon_bin.c:848:3: note: Value stored to 'nbytes' is never=
 read
                   nbytes -=3D step_len;
                   ^         ~~~~~~~~
   drivers/usb/mon/mon_bin.c:849:3: warning: Value stored to 'buf' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   buf +=3D step_len;
                   ^      ~~~~~~~~
   drivers/usb/mon/mon_bin.c:849:3: note: Value stored to 'buf' is never re=
ad
                   buf +=3D step_len;
                   ^      ~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
>> drivers/mtd/maps/sa1100-flash.c:199:3: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
                   sprintf(subdev->name, "%s-%d", plat->name, i);
                   ^~~~~~~
   drivers/mtd/maps/sa1100-flash.c:199:3: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
                   sprintf(subdev->name, "%s-%d", plat->name, i);
                   ^~~~~~~
   drivers/mtd/maps/sa1100-flash.c:221:3: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
                   strcpy(info->subdev[0].name, plat->name);
                   ^~~~~~
   drivers/mtd/maps/sa1100-flash.c:221:3: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
                   strcpy(info->subdev[0].name, plat->name);
                   ^~~~~~
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/mtd/nand/ecc.c:538:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(tweak->databuf.in, 0xFF, ctx->page_buffer_size);
                   ^~~~~~
   drivers/mtd/nand/ecc.c:538:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(tweak->databuf.in, 0xFF, ctx->page_buffer_size);
                   ^~~~~~
   drivers/mtd/nand/ecc.c:546:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(tweak->oobbuf.in, 0xFF, ctx->oob_buffer_size);
                   ^~~~~~
   drivers/mtd/nand/ecc.c:546:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(tweak->oobbuf.in, 0xFF, ctx->oob_buffer_size);
                   ^~~~~~
   drivers/mtd/nand/ecc.c:552:4: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((void *)tweak->databuf.out + orig->dataof=
fs,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:552:4: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                           memcpy((void *)tweak->databuf.out + orig->dataof=
fs,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:556:4: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((void *)tweak->oobbuf.out + orig->ooboffs,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:556:4: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                           memcpy((void *)tweak->oobbuf.out + orig->ooboffs,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:573:4: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(orig->databuf.in,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:573:4: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                           memcpy(orig->databuf.in,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:578:4: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(orig->oobbuf.in,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:578:4: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                           memcpy(orig->oobbuf.in,
                           ^~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/misc/bh1770glc.c:528:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(chip->chipname, sizeof(chip->chipname), "BH1770=
GLC");
                   ^~~~~~~~
   drivers/misc/bh1770glc.c:528:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(chip->chipname, sizeof(chip->chipname), "BH1770=
GLC");
                   ^~~~~~~~
   drivers/misc/bh1770glc.c:534:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(chip->chipname, sizeof(chip->chipname), "SFH777=
0");
                   ^~~~~~~~
   drivers/misc/bh1770glc.c:534:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(chip->chipname, sizeof(chip->chipname), "SFH777=
0");
                   ^~~~~~~~
   drivers/misc/bh1770glc.c:675:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !pm_runtime_suspended(dev));
                  ^~~~~~~
   drivers/misc/bh1770glc.c:675:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !pm_runtime_suspended(dev));
                  ^~~~~~~
   drivers/misc/bh1770glc.c:695:8: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sprintf(buf, "%d\n", bh1770_lux_read_result(chip));
                 ^~~~~~~
   drivers/misc/bh1770glc.c:695:8: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           ret =3D sprintf(buf, "%d\n", bh1770_lux_read_result(chip));
                 ^~~~~~~
   drivers/misc/bh1770glc.c:704:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", BH1770_LUX_RANGE);
                  ^~~~~~~
   drivers/misc/bh1770glc.c:704:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", BH1770_LUX_RANGE);
                  ^~~~~~~
   drivers/misc/bh1770glc.c:746:8: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D sprintf(buf, "%d\n", chip->prox_enable_count);
                 ^~~~~~~
   drivers/misc/bh1770glc.c:746:8: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           len =3D sprintf(buf, "%d\n", chip->prox_enable_count);
--
           ^~~~~~~
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/gpu/drm/drm_atomic_uapi.c:93:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&state->mode, 0, sizeof(state->mode));
                   ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:93:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(&state->mode, 0, sizeof(state->mode));
                   ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:128:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&state->mode, 0, sizeof(state->mode));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:128:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&state->mode, 0, sizeof(state->mode));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:1197:4: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&f[*num_fences], 0, sizeof(*f));
                           ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:1197:4: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                           memset(&f[*num_fences], 0, sizeof(*f));
                           ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:1236:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&f[*num_fences], 0, sizeof(*f));
                   ^~~~~~
   drivers/gpu/drm/drm_atomic_uapi.c:1236:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(&f[*num_fences], 0, sizeof(*f));
                   ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/input/mouse/cyapa_gen6.c:175:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pip_info, 0, sizeof(struct pip_fixed_info));
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:175:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&pip_info, 0, sizeof(struct pip_fixed_info));
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:237:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cyapa->product_id[0], &resp_data[51], 5);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:237:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cyapa->product_id[0], &resp_data[51], 5);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:239:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cyapa->product_id[6], &resp_data[56], 6);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:239:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cyapa->product_id[6], &resp_data[56], 6);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:241:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cyapa->product_id[13], &resp_data[62], 2);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:241:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cyapa->product_id[13], &resp_data[62], 2);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:279:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cyapa->product_id[0], &resp_data[13], 5);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:279:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cyapa->product_id[0], &resp_data[13], 5);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:281:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cyapa->product_id[6], &resp_data[18], 6);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:281:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cyapa->product_id[6], &resp_data[18], 6);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:283:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cyapa->product_id[13], &resp_data[24], 2);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:283:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cyapa->product_id[13], &resp_data[24], 2);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:358:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&set_interval_cmd, 0, sizeof(set_interval_cmd));
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:358:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&set_interval_cmd, 0, sizeof(set_interval_cmd));
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:574:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:574:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:600:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, &resp_data[10], read_len);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:600:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, &resp_data[10], read_len);
           ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:658:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf, 0, PAGE_SIZE);
                   ^~~~~~
   drivers/input/mouse/cyapa_gen6.c:658:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(buf, 0, PAGE_SIZE);
                   ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
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
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/input/serio/arc_ps2.c:166:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(io->name, sizeof(io->name), "ARC PS/2 port%d", index);
           ^~~~~~~~
   drivers/input/serio/arc_ps2.c:166:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(io->name, sizeof(io->name), "ARC PS/2 port%d", index);
           ^~~~~~~~
   drivers/input/serio/arc_ps2.c:167:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(io->phys, sizeof(io->phys), "arc/serio%d", index);
           ^~~~~~~~
   drivers/input/serio/arc_ps2.c:167:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(io->phys, sizeof(io->phys), "arc/serio%d", index);
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/rtc/rtc-bq32k.c:81:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buffer[1], data, len);
           ^~~~~~
   drivers/rtc/rtc-bq32k.c:81:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&buffer[1], data, len);
           ^~~~~~
   drivers/rtc/rtc-bq32k.c:203:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (reg & BQ32K_TCFE) ? 1 : 0);
                  ^~~~~~~
   drivers/rtc/rtc-bq32k.c:203:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (reg & BQ32K_TCFE) ? 1 : 0);
                  ^~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/gpu/drm/scheduler/sched_entity.c:68:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(entity, 0, sizeof(struct drm_sched_entity));
--
   43 warnings generated.
   drivers/tty/tty_io.c:1192:2: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           sprintf(p, "%s%c%x",
           ^~~~~~~
   drivers/tty/tty_io.c:1192:2: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           sprintf(p, "%s%c%x",
           ^~~~~~~
   drivers/tty/tty_io.c:1211:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   return sprintf(p, "%s", driver->name);
                          ^~~~~~~
   drivers/tty/tty_io.c:1211:10: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   return sprintf(p, "%s", driver->name);
                          ^~~~~~~
   drivers/tty/tty_io.c:1213:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   return sprintf(p, "%s%d", driver->name,
                          ^~~~~~~
   drivers/tty/tty_io.c:1213:10: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   return sprintf(p, "%s%d", driver->name,
                          ^~~~~~~
   drivers/tty/tty_io.c:2575:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(icount, 0, sizeof(*icount));
           ^~~~~~
   drivers/tty/tty_io.c:2575:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(icount, 0, sizeof(*icount));
           ^~~~~~
   drivers/tty/tty_io.c:2630:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&v, 0, sizeof(v));
           ^~~~~~
   drivers/tty/tty_io.c:2630:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&v, 0, sizeof(v));
           ^~~~~~
   drivers/tty/tty_io.c:3558:13: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                           count +=3D sprintf(buf + count, "%s%d",
                                    ^~~~~~~
   drivers/tty/tty_io.c:3558:13: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                           count +=3D sprintf(buf + count, "%s%d",
                                    ^~~~~~~
   drivers/tty/tty_io.c:3561:12: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   count +=3D sprintf(buf + count, "%c", i ? ' ':'\n');
                            ^~~~~~~
   drivers/tty/tty_io.c:3561:12: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   count +=3D sprintf(buf + count, "%c", i ? ' ':'\n');
                            ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   mm/vmscan.c:239:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset(new->map, (int)0xff, old_map_size);
                   ^~~~~~
   mm/vmscan.c:239:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset(new->map, (int)0xff, old_map_size);
                   ^~~~~~
   mm/vmscan.c:240:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset((void *)new->map + old_map_size, 0, map_size - ol=
d_map_size);
                   ^~~~~~
   mm/vmscan.c:240:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset((void *)new->map + old_map_size, 0, map_size - ol=
d_map_size);
                   ^~~~~~
   mm/vmscan.c:242:3: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new->nr_deferred, old->nr_deferred, old_defer_siz=
e);
                   ^~~~~~
   mm/vmscan.c:242:3: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
                   memcpy(new->nr_deferred, old->nr_deferred, old_defer_siz=
e);
                   ^~~~~~
   mm/vmscan.c:243:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset((void *)new->nr_deferred + old_defer_size, 0,
                   ^~~~~~
   mm/vmscan.c:243:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset((void *)new->nr_deferred + old_defer_size, 0,
                   ^~~~~~
   mm/vmscan.c:1526:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(stat, 0, sizeof(*stat));
           ^~~~~~
   mm/vmscan.c:1526:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(stat, 0, sizeof(*stat));
           ^~~~~~
   mm/vmscan.c:2956:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(targets, nr, sizeof(nr));
           ^~~~~~
   mm/vmscan.c:2956:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(targets, nr, sizeof(nr));
           ^~~~~~
   mm/vmscan.c:3202:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(&sc->nr, 0, sizeof(sc->nr));
           ^~~~~~
   mm/vmscan.c:3202:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(&sc->nr, 0, sizeof(sc->nr));
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
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
   40 warnings generated.
>> drivers/rtc/sysfs.c:26:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           return sprintf(buf, "%s %s\n", dev_driver_string(dev->parent),
                  ^~~~~~~
   drivers/rtc/sysfs.c:26:9: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%s %s\n", dev_driver_string(dev->parent),
                  ^~~~~~~
   drivers/rtc/sysfs.c:41:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ptRd\n", &tm);
                  ^~~~~~~
   drivers/rtc/sysfs.c:41:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ptRd\n", &tm);
                  ^~~~~~~
   drivers/rtc/sysfs.c:55:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ptRt\n", &tm);
                  ^~~~~~~
   drivers/rtc/sysfs.c:55:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ptRt\n", &tm);
                  ^~~~~~~
   drivers/rtc/sysfs.c:70:12: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   retval =3D sprintf(buf, "%lld\n", time);
                            ^~~~~~~
   drivers/rtc/sysfs.c:70:12: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
                   retval =3D sprintf(buf, "%lld\n", time);
                            ^~~~~~~
   drivers/rtc/sysfs.c:80:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", to_rtc_device(dev)->max_user_freq);
                  ^~~~~~~
   drivers/rtc/sysfs.c:80:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", to_rtc_device(dev)->max_user_freq);
                  ^~~~~~~
   drivers/rtc/sysfs.c:122:9: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0\n");
                  ^~~~~~~
   drivers/rtc/sysfs.c:122:9: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0\n");
                  ^~~~~~~
   drivers/rtc/sysfs.c:144:12: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   retval =3D sprintf(buf, "%lld\n", alarm);
                            ^~~~~~~
   drivers/rtc/sysfs.c:144:12: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
                   retval =3D sprintf(buf, "%lld\n", alarm);
                            ^~~~~~~
   drivers/rtc/sysfs.c:225:12: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   retval =3D sprintf(buf, "%ld\n", offset);
                            ^~~~~~~
   drivers/rtc/sysfs.c:225:12: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
                   retval =3D sprintf(buf, "%ld\n", offset);
                            ^~~~~~~
   drivers/rtc/sysfs.c:248:9: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "[%lld,%llu]\n", to_rtc_device(dev)->range_m=
in,
                  ^~~~~~~
   drivers/rtc/sysfs.c:248:9: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "[%lld,%llu]\n", to_rtc_device(dev)->range_m=
in,
                  ^~~~~~~
   drivers/rtc/sysfs.c:335:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(groups, rtc->dev.groups, old_cnt * sizeof(*groups));
           ^~~~~~
   drivers/rtc/sysfs.c:335:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(groups, rtc->dev.groups, old_cnt * sizeof(*groups));
           ^~~~~~
   drivers/rtc/sysfs.c:336:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(groups + old_cnt, grps, add_cnt * sizeof(*groups));
           ^~~~~~
   drivers/rtc/sysfs.c:336:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(groups + old_cnt, grps, add_cnt * sizeof(*groups));
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/power/supply/wm831x_backup.c:183:3: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(devdata->name, sizeof(devdata->name),
                   ^~~~~~~~
   drivers/power/supply/wm831x_backup.c:183:3: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(devdata->name, sizeof(devdata->name),
                   ^~~~~~~~
   drivers/power/supply/wm831x_backup.c:186:3: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(devdata->name, sizeof(devdata->name),
                   ^~~~~~~~
   drivers/power/supply/wm831x_backup.c:186:3: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(devdata->name, sizeof(devdata->name),
                   ^~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/power/supply/wm831x_power.c:548:3: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(power->wall_name, sizeof(power->wall_name),
                   ^~~~~~~~
   drivers/power/supply/wm831x_power.c:548:3: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(power->wall_name, sizeof(power->wall_name),
                   ^~~~~~~~
   drivers/power/supply/wm831x_power.c:550:3: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(power->battery_name, sizeof(power->wall_name),
                   ^~~~~~~~
   drivers/power/supply/wm831x_power.c:550:3: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(power->battery_name, sizeof(power->wall_name),
                   ^~~~~~~~
   drivers/power/supply/wm831x_power.c:552:3: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(power->usb_name, sizeof(power->wall_name),
--
   ^
   drivers/hwmon/w83781d.c:354:10: note: expanded from macro 'show_temp_reg'
                   return sprintf(buf, "%d\n", \
                          ^~~~~~~
   drivers/hwmon/w83781d.c:361:1: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   show_temp_reg(temp_max);
   ^
   drivers/hwmon/w83781d.c:354:10: note: expanded from macro 'show_temp_reg'
                   return sprintf(buf, "%d\n", \
                          ^~~~~~~
   drivers/hwmon/w83781d.c:361:1: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
   show_temp_reg(temp_max);
   ^
   drivers/hwmon/w83781d.c:354:10: note: expanded from macro 'show_temp_reg'
                   return sprintf(buf, "%d\n", \
                          ^~~~~~~
   drivers/hwmon/w83781d.c:362:1: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   show_temp_reg(temp_max_hyst);
   ^
   drivers/hwmon/w83781d.c:354:10: note: expanded from macro 'show_temp_reg'
                   return sprintf(buf, "%d\n", \
                          ^~~~~~~
   drivers/hwmon/w83781d.c:362:1: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
   show_temp_reg(temp_max_hyst);
   ^
   drivers/hwmon/w83781d.c:354:10: note: expanded from macro 'show_temp_reg'
                   return sprintf(buf, "%d\n", \
                          ^~~~~~~
   drivers/hwmon/w83781d.c:409:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", (long) vid_from_reg(data->vid, data=
->vrm));
                  ^~~~~~~
   drivers/hwmon/w83781d.c:409:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", (long) vid_from_reg(data->vid, data=
->vrm));
                  ^~~~~~~
   drivers/hwmon/w83781d.c:418:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", (long) data->vrm);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:418:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", (long) data->vrm);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:443:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:443:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:453:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:453:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:462:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:462:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:485:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n",
                  ^~~~~~~
   drivers/hwmon/w83781d.c:485:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n",
                  ^~~~~~~
   drivers/hwmon/w83781d.c:524:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->beep_mask >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:524:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->beep_mask >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:583:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->beep_mask >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:583:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->beep_mask >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:624:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n",
                  ^~~~~~~
   drivers/hwmon/w83781d.c:624:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n",
                  ^~~~~~~
   drivers/hwmon/w83781d.c:693:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)data->pwm[attr->index]);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:693:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)data->pwm[attr->index]);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:700:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)data->pwm2_enable);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:700:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)data->pwm2_enable);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:774:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)data->sens[attr->index]);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:774:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)data->sens[attr->index]);
                  ^~~~~~~
>> drivers/hwmon/w83781d.c:1615:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   drivers/hwmon/w83781d.c:1615:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/hwmon/adt7411.c:172:25: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return ret < 0 ? ret : sprintf(buf, "%u\n", !!(ret & attr2->nr));
                                  ^~~~~~~
   drivers/hwmon/adt7411.c:172:25: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return ret < 0 ? ret : sprintf(buf, "%u\n", !!(ret & attr2->nr));
                                  ^~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   drivers/hwmon/adt7462.c:785:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:785:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:787:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", 1000 * (data->temp_min[attr->index] =
- 64));
                  ^~~~~~~
   drivers/hwmon/adt7462.c:787:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", 1000 * (data->temp_min[attr->index] =
- 64));
                  ^~~~~~~
   drivers/hwmon/adt7462.c:821:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:821:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:823:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", 1000 * (data->temp_max[attr->index] =
- 64));
                  ^~~~~~~
   drivers/hwmon/adt7462.c:823:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", 1000 * (data->temp_max[attr->index] =
- 64));
                  ^~~~~~~
   drivers/hwmon/adt7462.c:858:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:858:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:860:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", 1000 * (data->temp[attr->index] - 64=
) +
                  ^~~~~~~
   drivers/hwmon/adt7462.c:860:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", 1000 * (data->temp[attr->index] - 64=
) +
                  ^~~~~~~
   drivers/hwmon/adt7462.c:870:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n", temp_label(data, attr->index));
                  ^~~~~~~
   drivers/hwmon/adt7462.c:870:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n", temp_label(data, attr->index));
                  ^~~~~~~
   drivers/hwmon/adt7462.c:883:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", x);
                  ^~~~~~~
   drivers/hwmon/adt7462.c:883:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", x);
                  ^~~~~~~
   drivers/hwmon/adt7462.c:923:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", x);
                  ^~~~~~~
   drivers/hwmon/adt7462.c:923:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", x);
                  ^~~~~~~
   drivers/hwmon/adt7462.c:963:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", x);
                  ^~~~~~~
   drivers/hwmon/adt7462.c:963:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", x);
                  ^~~~~~~
   drivers/hwmon/adt7462.c:972:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n", voltage_label(data, attr->index));
                  ^~~~~~~
   drivers/hwmon/adt7462.c:972:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n", voltage_label(data, attr->index));
                  ^~~~~~~
   drivers/hwmon/adt7462.c:984:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:984:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "1\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:986:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:986:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:1007:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adt7462.c:1007:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
--
                   ^~~~~~
   drivers/usb/serial/garmin_gps.c:1063:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(garmin_data_p->privpkt, buf, len);
                   ^~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/usb/serial/garmin_gps.c:856:2: note: Calling 'pkt_clear'
           pkt_clear(garmin_data_p);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/garmin_gps.c:321:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&garmin_data_p->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/usb/serial/garmin_gps.c:321:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&garmin_data_p->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/usb/serial/garmin_gps.c:322:2: note: Loop condition is true.  En=
tering loop body
           while (!list_empty(&garmin_data_p->pktlist)) {
           ^
   drivers/usb/serial/garmin_gps.c:325:3: note: Memory is released
                   kfree(result);
                   ^~~~~~~~~~~~~
   drivers/usb/serial/garmin_gps.c:322:2: note: Loop condition is true.  En=
tering loop body
           while (!list_empty(&garmin_data_p->pktlist)) {
           ^
   drivers/usb/serial/garmin_gps.c:324:3: note: Calling 'list_del'
                   list_del(&result->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/usb/serial/garmin_gps.c:856:2: note: Calling 'pkt_clear'
           pkt_clear(garmin_data_p);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/garmin_gps.c:321:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&garmin_data_p->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/usb/serial/garmin_gps.c:321:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&garmin_data_p->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/usb/serial/garmin_gps.c:322:2: note: Loop condition is true.  En=
tering loop body
           while (!list_empty(&garmin_data_p->pktlist)) {
           ^
   drivers/usb/serial/garmin_gps.c:325:3: note: Memory is released
                   kfree(result);
                   ^~~~~~~~~~~~~
   drivers/usb/serial/garmin_gps.c:322:2: note: Loop condition is true.  En=
tering loop body
           while (!list_empty(&garmin_data_p->pktlist)) {
           ^
   drivers/usb/serial/garmin_gps.c:324:3: note: Calling 'list_del'
                   list_del(&result->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   sound/drivers/serial-u16550.c:797:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(uart->prev_status, 0x80, sizeof(unsigned char) * SNDRV_SE=
RIAL_MAX_OUTS);
           ^~~~~~
   sound/drivers/serial-u16550.c:797:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(uart->prev_status, 0x80, sizeof(unsigned char) * SNDRV_SE=
RIAL_MAX_OUTS);
           ^~~~~~
   sound/drivers/serial-u16550.c:828:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(substream->name, "Serial MIDI %d", substream->nu=
mber + 1);
                   ^~~~~~~
   sound/drivers/serial-u16550.c:828:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(substream->name, "Serial MIDI %d", substream->nu=
mber + 1);
                   ^~~~~~~
>> sound/drivers/serial-u16550.c:920:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           sprintf(card->longname, "%s [%s] at %#lx, irq %d",
           ^~~~~~~
   sound/drivers/serial-u16550.c:920:2: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           sprintf(card->longname, "%s [%s] at %#lx, irq %d",
           ^~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   fs/xfs/xfs_icache.c:99:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ip->i_imap, 0, sizeof(struct xfs_imap));
           ^~~~~~
   fs/xfs/xfs_icache.c:99:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&ip->i_imap, 0, sizeof(struct xfs_imap));
           ^~~~~~
   fs/xfs/xfs_icache.c:102:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ip->i_df, 0, sizeof(ip->i_df));
           ^~~~~~
   fs/xfs/xfs_icache.c:102:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&ip->i_df, 0, sizeof(ip->i_df));
           ^~~~~~
   fs/xfs/xfs_icache.c:727:2: warning: Value stored to 'error' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           error =3D 0;
           ^       ~
   fs/xfs/xfs_icache.c:727:2: note: Value stored to 'error' is never read
           error =3D 0;
           ^       ~
   fs/xfs/xfs_icache.c:1649:2: warning: Value stored to 'nr_found' is never=
 read [clang-analyzer-deadcode.DeadStores]
           nr_found =3D 0;
           ^          ~
   fs/xfs/xfs_icache.c:1649:2: note: Value stored to 'nr_found' is never re=
ad
           nr_found =3D 0;
           ^          ~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   fs/xfs/xfs_ioctl.c:97:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&handle.ha_fsid, ip->i_mount->m_fixedfsid, sizeof(xfs_fsi=
d_t));
           ^~~~~~
   fs/xfs/xfs_ioctl.c:97:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(&handle.ha_fsid, ip->i_mount->m_fixedfsid, sizeof(xfs_fsi=
d_t));
           ^~~~~~
   fs/xfs/xfs_ioctl.c:103:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&handle.ha_fid, 0, sizeof(handle.ha_fid));
                   ^~~~~~
   fs/xfs/xfs_ioctl.c:103:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(&handle.ha_fid, 0, sizeof(handle.ha_fid));
                   ^~~~~~
   fs/xfs/xfs_ioctl.c:167:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fid, 0, sizeof(struct fid));
           ^~~~~~
   fs/xfs/xfs_ioctl.c:167:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&fid, 0, sizeof(struct fid));
           ^~~~~~
   fs/xfs/xfs_ioctl.c:342:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(aep->a_name, name, namelen);
           ^~~~~~
   fs/xfs/xfs_ioctl.c:342:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(aep->a_name, name, namelen);
           ^~~~~~
   fs/xfs/xfs_ioctl.c:1741:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(label, 0, sizeof(label));
           ^~~~~~
   fs/xfs/xfs_ioctl.c:1741:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(label, 0, sizeof(label));
           ^~~~~~
   fs/xfs/xfs_ioctl.c:1743:2: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(label, sbp->sb_fname, XFSLABEL_MAX);
           ^~~~~~~
   fs/xfs/xfs_ioctl.c:1743:2: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
           strncpy(label, sbp->sb_fname, XFSLABEL_MAX);
           ^~~~~~~
   fs/xfs/xfs_ioctl.c:1781:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sbp->sb_fname, 0, sizeof(sbp->sb_fname));
           ^~~~~~
   fs/xfs/xfs_ioctl.c:1781:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(sbp->sb_fname, 0, sizeof(sbp->sb_fname));
           ^~~~~~
   fs/xfs/xfs_ioctl.c:1782:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sbp->sb_fname, label, len);
           ^~~~~~
   fs/xfs/xfs_ioctl.c:1782:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(sbp->sb_fname, label, len);
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   sound/core/device.c:237:2: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)

vim +314 kernel/debug/kdb/kdb_main.c

5d5314d6795f3c Jason Wessel 2010-05-20  294  =

83fa2d13d628be Sumit Garg   2021-02-08  295  /*
83fa2d13d628be Sumit Garg   2021-02-08  296   * kdb_setenv() - Alter an exi=
sting environment variable or create a new one.
83fa2d13d628be Sumit Garg   2021-02-08  297   * @var: Name of the variable
83fa2d13d628be Sumit Garg   2021-02-08  298   * @val: Value of the variable
83fa2d13d628be Sumit Garg   2021-02-08  299   *
83fa2d13d628be Sumit Garg   2021-02-08  300   * Return: Zero on success, a =
kdb diagnostic on failure.
83fa2d13d628be Sumit Garg   2021-02-08  301   */
83fa2d13d628be Sumit Garg   2021-02-08  302  static int kdb_setenv(const ch=
ar *var, const char *val)
83fa2d13d628be Sumit Garg   2021-02-08  303  {
83fa2d13d628be Sumit Garg   2021-02-08  304  	int i;
83fa2d13d628be Sumit Garg   2021-02-08  305  	char *ep;
83fa2d13d628be Sumit Garg   2021-02-08  306  	size_t varlen, vallen;
83fa2d13d628be Sumit Garg   2021-02-08  307  =

83fa2d13d628be Sumit Garg   2021-02-08  308  	varlen =3D strlen(var);
83fa2d13d628be Sumit Garg   2021-02-08  309  	vallen =3D strlen(val);
83fa2d13d628be Sumit Garg   2021-02-08  310  	ep =3D kdballocenv(varlen + v=
allen + 2);
83fa2d13d628be Sumit Garg   2021-02-08  311  	if (ep =3D=3D (char *)0)
83fa2d13d628be Sumit Garg   2021-02-08  312  		return KDB_ENVBUFFULL;
83fa2d13d628be Sumit Garg   2021-02-08  313  =

83fa2d13d628be Sumit Garg   2021-02-08 @314  	sprintf(ep, "%s=3D%s", var, v=
al);
83fa2d13d628be Sumit Garg   2021-02-08  315  =

83fa2d13d628be Sumit Garg   2021-02-08  316  	for (i =3D 0; i < __nenv; i++=
) {
83fa2d13d628be Sumit Garg   2021-02-08  317  		if (__env[i]
83fa2d13d628be Sumit Garg   2021-02-08  318  		 && ((strncmp(__env[i], var,=
 varlen) =3D=3D 0)
83fa2d13d628be Sumit Garg   2021-02-08  319  		   && ((__env[i][varlen] =3D=
=3D '\0')
83fa2d13d628be Sumit Garg   2021-02-08  320  		    || (__env[i][varlen] =3D=
=3D '=3D')))) {
83fa2d13d628be Sumit Garg   2021-02-08  321  			__env[i] =3D ep;
83fa2d13d628be Sumit Garg   2021-02-08  322  			return 0;
83fa2d13d628be Sumit Garg   2021-02-08  323  		}
83fa2d13d628be Sumit Garg   2021-02-08  324  	}
83fa2d13d628be Sumit Garg   2021-02-08  325  =

83fa2d13d628be Sumit Garg   2021-02-08  326  	/*
83fa2d13d628be Sumit Garg   2021-02-08  327  	 * Wasn't existing variable. =
 Fit into slot.
83fa2d13d628be Sumit Garg   2021-02-08  328  	 */
83fa2d13d628be Sumit Garg   2021-02-08  329  	for (i =3D 0; i < __nenv-1; i=
++) {
83fa2d13d628be Sumit Garg   2021-02-08  330  		if (__env[i] =3D=3D (char *)=
0) {
83fa2d13d628be Sumit Garg   2021-02-08  331  			__env[i] =3D ep;
83fa2d13d628be Sumit Garg   2021-02-08  332  			return 0;
83fa2d13d628be Sumit Garg   2021-02-08  333  		}
83fa2d13d628be Sumit Garg   2021-02-08  334  	}
83fa2d13d628be Sumit Garg   2021-02-08  335  =

83fa2d13d628be Sumit Garg   2021-02-08  336  	return KDB_ENVFULL;
83fa2d13d628be Sumit Garg   2021-02-08  337  }
83fa2d13d628be Sumit Garg   2021-02-08  338  =


:::::: The code@line 314 was first introduced by commit
:::::: 83fa2d13d628be901a21cdfb3553963cd8858052 kdb: Refactor env variables=
 get/set code

:::::: TO: Sumit Garg <sumit.garg@linaro.org>
:::::: CC: Daniel Thompson <daniel.thompson@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4740416381159855200==--


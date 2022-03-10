Content-Type: multipart/mixed; boundary="===============1785103638960486097=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11110/11953] arch/riscv/kernel/ptrace.c:62:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memc...
Date: Fri, 11 Mar 2022 03:38:08 +0800
Message-ID: <202203110357.vOfNsn46-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1785103638960486097==
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
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: 6992f0b3f0fd879b31095263986ba1aedb27c83b [11110/11953] Kbuild: move=
 to -std=3Dgnu11
:::::: branch date: 10 hours ago
:::::: commit date: 34 hours ago
config: riscv-randconfig-c006-20220309 (https://download.01.org/0day-ci/arc=
hive/20220311/202203110357.vOfNsn46-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6992f0b3f0fd879b31095263986ba1aedb27c83b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6992f0b3f0fd879b31095263986ba1aedb27c83b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                         ^~~~~~~~
   fs/proc/base.c:2390:9: note: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11
                   len =3D snprintf(buf, sizeof(buf), "%lx-%lx", p->start, =
p->end);
                         ^~~~~~~~
   fs/proc/base.c:2885:9: warning: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D snprintf(buffer, sizeof(buffer), "%08lx\n",
                         ^~~~~~~~
   fs/proc/base.c:2885:9: note: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11
                   len =3D snprintf(buffer, sizeof(buffer), "%08lx\n",
                         ^~~~~~~~
   fs/proc/base.c:3472:9: warning: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D snprintf(name, sizeof(name), "%u", iter.tgid);
                         ^~~~~~~~
   fs/proc/base.c:3472:9: note: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11
                   len =3D snprintf(name, sizeof(name), "%u", iter.tgid);
                         ^~~~~~~~
   fs/proc/base.c:3811:9: warning: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D snprintf(name, sizeof(name), "%u", tid);
                         ^~~~~~~~
   fs/proc/base.c:3811:9: note: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11
                   len =3D snprintf(name, sizeof(name), "%u", tid);
                         ^~~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   fs/crypto/policy.c:264:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ctx_u, 0, sizeof(*ctx_u));
           ^~~~~~
   fs/crypto/policy.c:264:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(ctx_u, 0, sizeof(*ctx_u));
           ^~~~~~
   fs/crypto/policy.c:277:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->master_key_descriptor,
                   ^~~~~~
   fs/crypto/policy.c:277:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->master_key_descriptor,
                   ^~~~~~
   fs/crypto/policy.c:280:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->nonce, nonce, FSCRYPT_FILE_NONCE_SIZE);
                   ^~~~~~
   fs/crypto/policy.c:280:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->nonce, nonce, FSCRYPT_FILE_NONCE_SIZE);
                   ^~~~~~
   fs/crypto/policy.c:293:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->master_key_identifier,
                   ^~~~~~
   fs/crypto/policy.c:293:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->master_key_identifier,
                   ^~~~~~
   fs/crypto/policy.c:296:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->nonce, nonce, FSCRYPT_FILE_NONCE_SIZE);
                   ^~~~~~
   fs/crypto/policy.c:296:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->nonce, nonce, FSCRYPT_FILE_NONCE_SIZE);
                   ^~~~~~
   fs/crypto/policy.c:322:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(policy_u, 0, sizeof(*policy_u));
           ^~~~~~
   fs/crypto/policy.c:322:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(policy_u, 0, sizeof(*policy_u));
           ^~~~~~
   fs/crypto/policy.c:338:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(policy->master_key_descriptor,
                   ^~~~~~
   fs/crypto/policy.c:338:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(policy->master_key_descriptor,
                   ^~~~~~
   fs/crypto/policy.c:353:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(policy->__reserved, ctx->__reserved,
                   ^~~~~~
   fs/crypto/policy.c:353:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(policy->__reserved, ctx->__reserved,
                   ^~~~~~
   fs/crypto/policy.c:355:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(policy->master_key_identifier,
                   ^~~~~~
   fs/crypto/policy.c:355:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(policy->master_key_identifier,
                   ^~~~~~
   fs/crypto/policy.c:737:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(key_spec.u.descriptor, 0x42,
                   ^~~~~~
   fs/crypto/policy.c:737:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(key_spec.u.descriptor, 0x42,
                   ^~~~~~
   fs/crypto/policy.c:763:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(policy->v1.master_key_descriptor, key_spec.u.desc=
riptor,
                   ^~~~~~
   fs/crypto/policy.c:763:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(policy->v1.master_key_descriptor, key_spec.u.desc=
riptor,
                   ^~~~~~
   fs/crypto/policy.c:769:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(policy->v2.master_key_identifier, key_spec.u.iden=
tifier,
                   ^~~~~~
   fs/crypto/policy.c:769:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(policy->v2.master_key_identifier, key_spec.u.iden=
tifier,
                   ^~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
>> arch/riscv/kernel/ptrace.c:62:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           membuf_store(&to, fstate->fcsr);
           ^
   include/linux/regset.h:70:4: note: expanded from macro 'membuf_store'
                           memcpy(__s->p, &__v, __size);   \
                           ^~~~~~
   arch/riscv/kernel/ptrace.c:62:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           membuf_store(&to, fstate->fcsr);
           ^
   include/linux/regset.h:70:4: note: expanded from macro 'membuf_store'
                           memcpy(__s->p, &__v, __size);   \
                           ^~~~~~
   Suppressed 61 warnings (54 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   arch/riscv/kernel/signal.c:127:2: warning: Value stored to 'task' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           task =3D current;
           ^
   arch/riscv/kernel/signal.c:127:2: note: Value stored to 'task' is never =
read
   Suppressed 58 warnings (50 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   fs/orangefs/orangefs-bufmap.c:547:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(page_to, page_from, PAGE_SIZE);
           ^~~~~~
   fs/orangefs/orangefs-bufmap.c:547:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(page_to, page_from, PAGE_SIZE);
           ^~~~~~
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   78 warnings generated.
   fs/orangefs/orangefs-debugfs.c:207:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(k_buffer, kernel_debug_string);
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:207:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(k_buffer, kernel_debug_string);
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:208:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(k_buffer, "\n");
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:208:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(k_buffer, "\n");
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:210:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(k_buffer, "none\n");
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:210:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(k_buffer, "none\n");
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:313:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(c_buffer, client_debug_string);
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:313:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(c_buffer, client_debug_string);
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:314:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(c_buffer, "\n");
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:314:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(c_buffer, "\n");
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:316:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(c_buffer, "none\n");
                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:316:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
--
                                       ^~~~~~~~
   crypto/algapi.c:990:20: note: The result of the left shift is undefined =
due to shifting by '63', which is greater or equal to the width of type 'in=
t'
                   relalign =3D d ? 1 << __ffs(d) : size;
                                    ^  ~~~~~~~~
   Suppressed 79 warnings (72 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   lib/zlib_inflate/inflate.c:130:9: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state->window, strm->next_out - state->wsize, state->wsiz=
e);
           ^~~~~~
   lib/zlib_inflate/inflate.c:130:9: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(state->window, strm->next_out - state->wsize, state->wsiz=
e);
           ^~~~~~
   lib/zlib_inflate/inflate.c:137:9: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state->window + state->write, strm->next_out - copy, dist=
);
           ^~~~~~
   lib/zlib_inflate/inflate.c:137:9: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(state->window + state->write, strm->next_out - copy, dist=
);
           ^~~~~~
   lib/zlib_inflate/inflate.c:140:13: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
               memcpy(state->window, strm->next_out - copy, copy);
               ^~~~~~
   lib/zlib_inflate/inflate.c:140:13: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
               memcpy(state->window, strm->next_out - copy, copy);
               ^~~~~~
   lib/zlib_inflate/inflate.c:456:17: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(put, next, copy);
                   ^~~~~~
   lib/zlib_inflate/inflate.c:456:17: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(put, next, copy);
                   ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   kernel/trace/trace_events_synth.c:57:2: warning: Call to function 'strnc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(last_cmd, str, MAX_FILTER_STR_VAL - 1);
           ^~~~~~~
   kernel/trace/trace_events_synth.c:57:2: note: Call to function 'strncpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(last_cmd, str, MAX_FILTER_STR_VAL - 1);
           ^~~~~~~
   kernel/trace/trace_events_synth.c:188:2: warning: Call to function 'strn=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'strncpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(buf, start, len);
           ^~~~~~~
   kernel/trace/trace_events_synth.c:188:2: note: Call to function 'strncpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(buf, start, len);
           ^~~~~~~
   kernel/trace/trace_events_synth.c:339:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(print_fmt, sizeof(print_fmt), "%%s=3D%s%%s", fm=
t);
                   ^~~~~~~~
   kernel/trace/trace_events_synth.c:339:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(print_fmt, sizeof(print_fmt), "%%s=3D%s%%s", fm=
t);
                   ^~~~~~~~
   kernel/trace/trace_events_synth.c:531:9: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "\"");
                  ^~~~~~~~
   kernel/trace/trace_events_synth.c:531:9: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "\"");
                  ^~~~~~~~
   kernel/trace/trace_events_synth.c:534:10: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "%s=3D%s%s",
                          ^~~~~~~~
   kernel/trace/trace_events_synth.c:534:10: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "%s=3D%s%s",
                          ^~~~~~~~
   kernel/trace/trace_events_synth.c:538:9: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "\"");
                  ^~~~~~~~
   kernel/trace/trace_events_synth.c:538:9: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "\"");
                  ^~~~~~~~
   kernel/trace/trace_events_synth.c:543:11: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           pos +=3D snprintf(buf + pos, LEN_OR_ZERO,
                                  ^~~~~~~~
   kernel/trace/trace_events_synth.c:543:11: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                           pos +=3D snprintf(buf + pos, LEN_OR_ZERO,
                                  ^~~~~~~~
   kernel/trace/trace_events_synth.c:546:11: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           pos +=3D snprintf(buf + pos, LEN_OR_ZERO,
                                  ^~~~~~~~
   kernel/trace/trace_events_synth.c:546:11: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                           pos +=3D snprintf(buf + pos, LEN_OR_ZERO,
                                  ^~~~~~~~
   kernel/trace/trace_events_synth.c:1544:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(trace_state, '\0', sizeof(*trace_state));
           ^~~~~~
   kernel/trace/trace_events_synth.c:1544:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(trace_state, '\0', sizeof(*trace_state));
           ^~~~~~
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
>> fs/crypto/inline_crypt.c:221:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dun, 0, BLK_CRYPTO_MAX_IV_SIZE);
           ^~~~~~
   fs/crypto/inline_crypt.c:221:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(dun, 0, BLK_CRYPTO_MAX_IV_SIZE);
           ^~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   fs/coredump.c:91:9: warning: Call to function 'vsnprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           need =3D vsnprintf(cn->corename + cn->used, free, fmt, arg_copy);
                  ^~~~~~~~~
   fs/coredump.c:91:9: note: Call to function 'vsnprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'vsnprintf_s' in case of C11
           need =3D vsnprintf(cn->corename + cn->used, free, fmt, arg_copy);
                  ^~~~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   lib/zstd/decompress/huf_decompress.c:106:5: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(&dtd, table, sizeof(dtd));
       ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:106:5: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(&dtd, table, sizeof(dtd));
       ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:170:9: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ZSTD_memcpy(DTable, &dtd, sizeof(dtd));
           ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:170:9: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           ZSTD_memcpy(DTable, &dtd, sizeof(dtd));
           ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:539:5: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(rankVal, rankValOrigin, sizeof(U32) * (HUF_TABLELOG_MAX =
+ 1));
       ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:539:5: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(rankVal, rankValOrigin, sizeof(U32) * (HUF_TABLELOG_MAX =
+ 1));
       ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:585:5: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(rankVal, rankValOrigin, sizeof(U32) * (HUF_TABLELOG_MAX =
+ 1));
       ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:585:5: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(rankVal, rankValOrigin, sizeof(U32) * (HUF_TABLELOG_MAX =
+ 1));
       ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:643:5: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memset(wksp->rankStats, 0, sizeof(wksp->rankStats));
       ^
   lib/zstd/decompress/../common/zstd_deps.h:34:28: note: expanded from mac=
ro 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:643:5: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
       ZSTD_memset(wksp->rankStats, 0, sizeof(wksp->rankStats));
       ^
   lib/zstd/decompress/../common/zstd_deps.h:34:28: note: expanded from mac=
ro 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:644:5: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memset(wksp->rankStart0, 0, sizeof(wksp->rankStart0));
       ^
   lib/zstd/decompress/../common/zstd_deps.h:34:28: note: expanded from mac=
ro 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
--
   block/bfq-cgroup.c:672:6: warning: Use of memory after it is freed [clan=
g-analyzer-unix.Malloc]
               entity->parent->last_bfqq_created =3D=3D bfqq)
               ^
   block/bfq-cgroup.c:894:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&bfqd->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   block/bfq-cgroup.c:894:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&bfqd->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   block/bfq-cgroup.c:896:6: note: Assuming 'entity' is non-null
           if (!entity) /* root group */
               ^~~~~~~
   block/bfq-cgroup.c:896:2: note: Taking false branch
           if (!entity) /* root group */
           ^
   block/bfq-cgroup.c:903:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < BFQ_IOPRIO_CLASSES; i++) {
           ^
   block/bfq-cgroup.c:918:3: note: Calling 'bfq_reparent_active_queues'
                   bfq_reparent_active_queues(bfqd, bfqg, st, i);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:868:2: note: Loop condition is true.  Entering loop b=
ody
           while ((entity =3D bfq_entity_of(rb_first(active))))
           ^
   block/bfq-cgroup.c:869:3: note: Calling 'bfq_reparent_leaf_entity'
                   bfq_reparent_leaf_entity(bfqd, entity, ioprio_class);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:838:2: note: Loop condition is false. Execution conti=
nues on line 850
           while (child_entity->my_sched_data) { /* leaf not reached yet */
           ^
   block/bfq-cgroup.c:851:2: note: Calling 'bfq_bfqq_move'
           bfq_bfqq_move(bfqd, bfqq, bfqd->root_group);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:661:6: note: Assuming 'bfqq' is not equal to field 'i=
n_service_queue'
           if (bfqq =3D=3D bfqd->in_service_queue)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:661:2: note: Taking false branch
           if (bfqq =3D=3D bfqd->in_service_queue)
           ^
   block/bfq-cgroup.c:665:6: note: Assuming the condition is false
           if (bfq_bfqq_busy(bfqq))
               ^~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:665:2: note: Taking false branch
           if (bfq_bfqq_busy(bfqq))
           ^
   block/bfq-cgroup.c:667:11: note: Assuming field 'on_st_or_in_serv' is fa=
lse
           else if (entity->on_st_or_in_serv)
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:667:7: note: Taking false branch
           else if (entity->on_st_or_in_serv)
                ^
   block/bfq-cgroup.c:669:20: note: Calling 'bfqq_group'
           bfqg_and_blkg_put(bfqq_group(bfqq));
                             ^~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:312:9: note: Assuming 'group_entity' is non-null
           return group_entity ? container_of(group_entity, struct bfq_grou=
p,
                  ^~~~~~~~~~~~
   block/bfq-cgroup.c:312:9: note: '?' condition is true
   block/bfq-cgroup.c:669:20: note: Returning from 'bfqq_group'
           bfqg_and_blkg_put(bfqq_group(bfqq));
                             ^~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:669:2: note: Calling 'bfqg_and_blkg_put'
           bfqg_and_blkg_put(bfqq_group(bfqq));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:347:2: note: Calling 'bfqg_put'
           bfqg_put(bfqg);
           ^~~~~~~~~~~~~~
   block/bfq-cgroup.c:331:6: note: Assuming field 'ref' is equal to 0
           if (bfqg->ref =3D=3D 0)
               ^~~~~~~~~~~~~~
   block/bfq-cgroup.c:331:2: note: Taking true branch
           if (bfqg->ref =3D=3D 0)
           ^
   block/bfq-cgroup.c:332:3: note: Memory is released
                   kfree(bfqg);
                   ^~~~~~~~~~~
   block/bfq-cgroup.c:347:2: note: Returning; memory was released
           bfqg_put(bfqg);
           ^~~~~~~~~~~~~~
   block/bfq-cgroup.c:669:2: note: Returning; memory was released
           bfqg_and_blkg_put(bfqq_group(bfqq));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:671:14: note: Field 'parent' is non-null
           if (entity->parent &&
                       ^
   block/bfq-cgroup.c:671:6: note: Left side of '&&' is true
           if (entity->parent &&
               ^
   block/bfq-cgroup.c:672:6: note: Use of memory after it is freed
               entity->parent->last_bfqq_created =3D=3D bfqq)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> block/bfq-cgroup.c:1069:6: warning: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(ctx.body, "%llu", &v) =3D=3D 1) {
               ^~~~~~
   block/bfq-cgroup.c:1069:6: note: Call to function 'sscanf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sscanf_s' in case of C11
           if (sscanf(ctx.body, "%llu", &v) =3D=3D 1) {
               ^~~~~~
   block/bfq-cgroup.c:1105:23: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (*endp =3D=3D '\0' || sscanf(buf, "default %llu", &v) =3D=3D =
1) {
                                ^~~~~~
   block/bfq-cgroup.c:1105:23: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
           if (*endp =3D=3D '\0' || sscanf(buf, "default %llu", &v) =3D=3D =
1) {
                                ^~~~~~
   Suppressed 63 warnings (56 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   block/blk-cgroup.c:475:4: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(bis, 0, sizeof(*bis));
                           ^~~~~~
   block/blk-cgroup.c:475:4: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                           memset(bis, 0, sizeof(*bis));
                           ^~~~~~
   block/blk-cgroup.c:477:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&blkg->iostat, 0, sizeof(blkg->iostat));
                   ^~~~~~
   block/blk-cgroup.c:477:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(&blkg->iostat, 0, sizeof(blkg->iostat));
                   ^~~~~~
   block/blk-cgroup.c:591:6: warning: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(input, "%u:%u%n", &major, &minor, &key_len) !=3D 2)
               ^~~~~~
   block/blk-cgroup.c:591:6: note: Call to function 'sscanf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sscanf_s' in case of C11
           if (sscanf(input, "%u:%u%n", &major, &minor, &key_len) !=3D 2)
               ^~~~~~
   block/blk-cgroup.c:861:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&tmp, 0, sizeof(tmp));
                   ^~~~~~
   block/blk-cgroup.c:861:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(&tmp, 0, sizeof(tmp));
                   ^~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   lib/mpi/ec.c:209:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(n, 0, sizeof(n));
           ^~~~~~
   lib/mpi/ec.c:209:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(n, 0, sizeof(n));
           ^~~~~~
   lib/mpi/ec.c:231:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(n, 0, sizeof(n));
           ^~~~~~
   lib/mpi/ec.c:231:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(n, 0, sizeof(n));
           ^~~~~~
   lib/mpi/ec.c:260:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(wp, n, wsize * BYTES_PER_MPI_LIMB);
           ^~~~~~
   lib/mpi/ec.c:260:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(wp, n, wsize * BYTES_PER_MPI_LIMB);
           ^~~~~~
   lib/mpi/ec.c:263:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(m, n+LIMB_SIZE_25519-1, (wsize+1) * BYTES_PER_MPI_LIMB);
           ^~~~~~
   lib/mpi/ec.c:263:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(m, n+LIMB_SIZE_25519-1, (wsize+1) * BYTES_PER_MPI_LIMB);
           ^~~~~~
   lib/mpi/ec.c:266:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(n, m, wsize * BYTES_PER_MPI_LIMB);
--
                  ^~~~~~~~
   lib/test_bitmap.c:568:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(arr, 0xa5, sizeof(arr));
           ^~~~~~
   lib/test_bitmap.c:568:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(arr, 0xa5, sizeof(arr));
           ^~~~~~
   lib/test_bitmap.c:596:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(bmap1, 0x5a, sizeof(bmap1));
                           ^~~~~~
   lib/test_bitmap.c:596:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(bmap1, 0x5a, sizeof(bmap1));
                           ^~~~~~
   lib/test_bitmap.c:597:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(bmap2, 0x5a, sizeof(bmap2));
                           ^~~~~~
   lib/test_bitmap.c:597:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(bmap2, 0x5a, sizeof(bmap2));
                           ^~~~~~
   lib/test_bitmap.c:707:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(in, t->in, sizeof(t->in));
                   ^~~~~~
   lib/test_bitmap.c:707:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(in, t->in, sizeof(t->in));
                   ^~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   fs/xfs/libxfs/xfs_rtbitmap.c:349:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:349:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:394:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:394:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:847:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:847:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:893:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:893:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/hexdump.c:139:10: warning: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D snprintf(linebuf + lx, linebuflen - lx,
                                 ^~~~~~~~
   lib/hexdump.c:139:10: note: Call to function 'snprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'snprintf_s' in case of C11
                           ret =3D snprintf(linebuf + lx, linebuflen - lx,
                                 ^~~~~~~~
   lib/hexdump.c:150:10: warning: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D snprintf(linebuf + lx, linebuflen - lx,
                                 ^~~~~~~~
   lib/hexdump.c:150:10: note: Call to function 'snprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'snprintf_s' in case of C11
                           ret =3D snprintf(linebuf + lx, linebuflen - lx,
                                 ^~~~~~~~
   lib/hexdump.c:161:10: warning: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D snprintf(linebuf + lx, linebuflen - lx,
                                 ^~~~~~~~
   lib/hexdump.c:161:10: note: Call to function 'snprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'snprintf_s' in case of C11
                           ret =3D snprintf(linebuf + lx, linebuflen - lx,
                                 ^~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
>> lib/test_firmware.c:310:8: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D snprintf(dst, PAGE_SIZE, "%s\n", src);
                 ^~~~~~~~
   lib/test_firmware.c:310:8: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           len =3D snprintf(dst, PAGE_SIZE, "%s\n", src);
                 ^~~~~~~~
   lib/test_firmware.c:333:9: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", val);
                  ^~~~~~~~
   lib/test_firmware.c:333:9: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", val);
                  ^~~~~~~~
   lib/test_firmware.c:357:9: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%zu\n", val);
                  ^~~~~~~~
   lib/test_firmware.c:357:9: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%zu\n", val);
                  ^~~~~~~~
   lib/test_firmware.c:362:9: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", val);
                  ^~~~~~~~
   lib/test_firmware.c:362:9: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", val);
                  ^~~~~~~~
   lib/test_firmware.c:384:9: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%u\n", val);
                  ^~~~~~~~
   lib/test_firmware.c:384:9: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%u\n", val);
                  ^~~~~~~~
>> lib/test_firmware.c:1044:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, req->fw->data, req->fw->size);
           ^~~~~~
   lib/test_firmware.c:1044:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(buf, req->fw->data, req->fw->size);
           ^~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   fs/xfs/xfs_iops.c:681:11: warning: Value stored to 'uid' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                   ^~~
   fs/xfs/xfs_iops.c:681:11: note: Value stored to 'uid' during its initial=
ization is never read
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                   ^~~
   fs/xfs/xfs_iops.c:681:34: warning: Value stored to 'iuid' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                                          ^~~~
   fs/xfs/xfs_iops.c:681:34: note: Value stored to 'iuid' during its initia=
lization is never read
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                                          ^~~~
   fs/xfs/xfs_iops.c:682:11: warning: Value stored to 'gid' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                   ^~~
   fs/xfs/xfs_iops.c:682:11: note: Value stored to 'gid' during its initial=
ization is never read
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                   ^~~
   fs/xfs/xfs_iops.c:682:34: warning: Value stored to 'igid' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                                          ^~~~
   fs/xfs/xfs_iops.c:682:34: note: Value stored to 'igid' during its initia=
lization is never read
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                                          ^~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   fs/xfs/xfs_inode.c:2897:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(i_tab, 0, *num_inodes * sizeof(struct xfs_inode *));
           ^~~~~~
   fs/xfs/xfs_inode.c:2897:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(i_tab, 0, *num_inodes * sizeof(struct xfs_inode *));
           ^~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   fs/direct-io.c:1160:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dio, 0, offsetof(struct dio, pages));
           ^~~~~~
   fs/direct-io.c:1160:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(dio, 0, offsetof(struct dio, pages));
           ^~~~~~
   fs/direct-io.c:1239:2: warning: Value stored to 'retval' is never read [=
clang-analyzer-deadcode.DeadStores]
           retval =3D 0;
           ^        ~
   fs/direct-io.c:1239:2: note: Value stored to 'retval' is never read
           retval =3D 0;
           ^        ~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   fs/mpage.c:295:40: warning: The left operand of '<<' is a garbage value =
[clang-analyzer-core.UndefinedBinaryOperatorResult]
                           if (!bdev_read_page(bdev, blocks[0] << (blkbits =
- 9),
                                                               ^
   fs/mpage.c:401:13: note: Calling 'do_mpage_readpage'
           args.bio =3D do_mpage_readpage(&args);
                      ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:177:12: note: Field 'is_readahead' is false
           if (args->is_readahead) {
                     ^
   fs/mpage.c:177:2: note: Taking false branch
           if (args->is_readahead) {
           ^
   fs/mpage.c:185:6: note: Assuming the condition is false
           if (page_has_buffers(page))
               ^
   include/linux/buffer_head.h:146:32: note: expanded from macro 'page_has_=
buffers'
   #define page_has_buffers(page)  PagePrivate(page)
                                   ^~~~~~~~~~~~~~~~~
   fs/mpage.c:185:2: note: Taking false branch
           if (page_has_buffers(page))
           ^
   fs/mpage.c:191:6: note: Assuming 'last_block' is <=3D 'last_block_in_fil=
e'
           if (last_block > last_block_in_file)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:191:2: note: Taking false branch
           if (last_block > last_block_in_file)
           ^
   fs/mpage.c:199:28: note: Left side of '&&' is false
           if (buffer_mapped(map_bh) &&
                                     ^
   fs/mpage.c:224:9: note: Assuming 'page_block' is >=3D 'blocks_per_page'
           while (page_block < blocks_per_page) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:224:2: note: Loop condition is false. Execution continues on =
line 275
           while (page_block < blocks_per_page) {
           ^
   fs/mpage.c:275:6: note: 'first_hole' is equal to 'blocks_per_page'
           if (first_hole !=3D blocks_per_page) {
--
   lib/test_stackinit.c:458:15: note: expanded from macro 'test_scalars'
                   failures +=3D test_u8_ ## init ();                \
                               ^~~~~~~~~~~~~~~~~~~
   note: expanded from here
   lib/test_stackinit.c:374:1: note: Taking false branch
   DEFINE_SCALAR_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:349:3: note: expanded from macro 'DEFINE_SCALAR_TES=
TS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/test_stackinit.c:345:3: note: expanded from macro 'DEFINE_SCALAR_TES=
T'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/test_stackinit.c:299:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   lib/test_stackinit.c:374:1: note: Loop condition is false.  Exiting loop
   DEFINE_SCALAR_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:349:3: note: expanded from macro 'DEFINE_SCALAR_TES=
TS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/test_stackinit.c:345:3: note: expanded from macro 'DEFINE_SCALAR_TES=
T'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/test_stackinit.c:299:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   lib/test_stackinit.c:374:1: note: Calling 'leaf_u8_zero'
   DEFINE_SCALAR_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:349:3: note: expanded from macro 'DEFINE_SCALAR_TES=
TS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:345:3: note: expanded from macro 'DEFINE_SCALAR_TES=
T'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:299:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   lib/test_stackinit.c:218:12: note: expanded from macro '\DEFINE_TEST_DRI=
VER'
           ignored =3D leaf_ ##name((unsigned long)&ignored, 1,      \
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   lib/test_stackinit.c:374:1: note: 'fill' is true
   DEFINE_SCALAR_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:349:3: note: expanded from macro 'DEFINE_SCALAR_TES=
TS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:345:3: note: expanded from macro 'DEFINE_SCALAR_TES=
T'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:284:6: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
               ^~~~
   lib/test_stackinit.c:374:1: note: Taking true branch
   DEFINE_SCALAR_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:349:3: note: expanded from macro 'DEFINE_SCALAR_TES=
TS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/test_stackinit.c:345:3: note: expanded from macro 'DEFINE_SCALAR_TES=
T'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/test_stackinit.c:284:2: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
           ^
   lib/test_stackinit.c:374:1: note: Address of stack memory associated wit=
h local variable 'var' is still referred to by the global variable 'target_=
start' upon returning to the caller.  This will be a dangling reference
   DEFINE_SCALAR_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:349:3: note: expanded from macro 'DEFINE_SCALAR_TES=
TS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:345:3: note: expanded from macro 'DEFINE_SCALAR_TES=
T'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:298:2: note: expanded from macro 'DEFINE_TEST'
           return (int)buf[0] | (int)buf[sizeof(buf) - 1];         \
           ^
>> lib/test_stackinit.c:374:1: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEFINE_SCALAR_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:349:3: note: expanded from macro 'DEFINE_SCALAR_TES=
TS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:345:3: note: expanded from macro 'DEFINE_SCALAR_TES=
T'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:296:2: note: expanded from macro 'DEFINE_TEST'
           memcpy(check_buf, target_start, target_size);           \
           ^~~~~~
   lib/test_stackinit.c:374:1: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
   DEFINE_SCALAR_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:349:3: note: expanded from macro 'DEFINE_SCALAR_TES=
TS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:345:3: note: expanded from macro 'DEFINE_SCALAR_TES=
T'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:296:2: note: expanded from macro 'DEFINE_TEST'
           memcpy(check_buf, target_start, target_size);           \
           ^~~~~~
>> lib/test_stackinit.c:374:1: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEFINE_SCALAR_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:349:3: note: expanded from macro 'DEFINE_SCALAR_TES=
TS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:345:3: note: expanded from macro 'DEFINE_SCALAR_TES=
T'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:282:2: note: expanded from macro 'DEFINE_TEST'
           memset(buf, (char)(sp & 0xff), sizeof(buf));            \
           ^~~~~~
   lib/test_stackinit.c:374:1: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
   DEFINE_SCALAR_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:349:3: note: expanded from macro 'DEFINE_SCALAR_TES=
TS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:345:3: note: expanded from macro 'DEFINE_SCALAR_TES=
T'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_stackinit.c:282:2: note: expanded from macro 'DEFINE_TEST'
           memset(buf, (char)(sp & 0xff), sizeof(buf));            \
           ^~~~~~
   lib/test_stackinit.c:375:1: warning: Address of stack memory associated =
with local variable 'var' is still referred to by the global variable 'fill=
_start' upon returning to the caller.  This will be a dangling reference [c=
lang-analyzer-core.StackAddressEscape]
   DEFINE_STRUCT_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:362:3: note: expanded from macro 'DEFINE_STRUCT_TES=
TS'
                   DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
                   ^
   lib/test_stackinit.c:357:3: note: expanded from macro 'DEFINE_STRUCT_TES=
T'
                   DEFINE_TEST(name ## _ ## init,                  \
                   ^
   lib/test_stackinit.c:298:2: note: expanded from macro 'DEFINE_TEST'
           return (int)buf[0] | (int)buf[sizeof(buf) - 1];         \
           ^
   lib/test_stackinit.c:473:2: note: Loop condition is false.  Exiting loop
           test_scalars(zero);
           ^
   lib/test_stackinit.c:457:28: note: expanded from macro 'test_scalars'
   #define test_scalars(init)      do {                            \
                                   ^
   lib/test_stackinit.c:474:2: note: Calling 'test_small_hole_zero'
           test_structs(zero);
           ^
   lib/test_stackinit.c:466:15: note: expanded from macro 'test_structs'
                   failures +=3D test_small_hole_ ## init ();        \
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   lib/test_stackinit.c:375:1: note: Taking false branch
   DEFINE_STRUCT_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:362:3: note: expanded from macro 'DEFINE_STRUCT_TES=
TS'
                   DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
                   ^
   lib/test_stackinit.c:357:3: note: expanded from macro 'DEFINE_STRUCT_TES=
T'
                   DEFINE_TEST(name ## _ ## init,                  \
                   ^
   lib/test_stackinit.c:299:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   lib/test_stackinit.c:375:1: note: Loop condition is false.  Exiting loop
   DEFINE_STRUCT_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:362:3: note: expanded from macro 'DEFINE_STRUCT_TES=
TS'
                   DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
                   ^
   lib/test_stackinit.c:357:3: note: expanded from macro 'DEFINE_STRUCT_TES=
T'
                   DEFINE_TEST(name ## _ ## init,                  \
                   ^
   lib/test_stackinit.c:299:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   lib/test_stackinit.c:375:1: note: Loop condition is false.  Exiting loop
   DEFINE_STRUCT_TESTS(zero, WANT_SUCCESS);
   ^
   lib/test_stackinit.c:362:3: note: expanded from macro 'DEFINE_STRUCT_TES=
TS'
                   DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
                   ^
   lib/test_stackinit.c:357:3: note: expanded from macro 'DEFINE_STRUCT_TES=
T'
                   DEFINE_TEST(name ## _ ## init,                  \
--
           ^
   fs/reiserfs/ibalance.c:54:3: note: Null pointer value stored to 'src_bi.=
bi_bh'
                   src_bi->bi_bh =3D tb->L[h];
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/ibalance.c:64:3: note:  Execution continues on line 63
                   break;
                   ^
   fs/reiserfs/ibalance.c:573:2: note: Returning from 'internal_define_dest=
_src_infos'
           internal_define_dest_src_infos(mode, tb, h, &dest_bi, &src_bi,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/ibalance.c:576:7: note: Access to field 'b_data' results in =
a dereference of a null pointer (loaded from field 'bi_bh')
           nr =3D B_NR_ITEMS(src_bi.bi_bh);
                ^
   fs/reiserfs/reiserfs.h:1684:40: note: expanded from macro 'B_NR_ITEMS'
   #define B_NR_ITEMS(bh)                  (blkh_nr_item(B_BLK_HEAD(bh)))
                                                         ^          ~~
   fs/reiserfs/reiserfs.h:1682:48: note: expanded from macro 'B_BLK_HEAD'
   #define B_BLK_HEAD(bh)                  ((struct block_head *)((bh)->b_d=
ata))
                                                                 ^ ~~
   fs/reiserfs/reiserfs.h:1658:53: note: expanded from macro 'blkh_nr_item'
   #define blkh_nr_item(p_blkh)          (le16_to_cpu((p_blkh)->blk_nr_item=
))
                                                       ^~~~~~
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from =
macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   fs/reiserfs/ibalance.c:769:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(internal_key(tb->CFL[h], tb->lkey[h]), key, KEY_SIZE);
           ^~~~~~
   fs/reiserfs/ibalance.c:769:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(internal_key(tb->CFL[h], tb->lkey[h]), key, KEY_SIZE);
           ^~~~~~
   fs/reiserfs/ibalance.c:784:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(internal_key(tb->CFR[h], tb->rkey[h]), key, KEY_SIZE);
           ^~~~~~
   fs/reiserfs/ibalance.c:784:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(internal_key(tb->CFR[h], tb->rkey[h]), key, KEY_SIZE);
           ^~~~~~
   fs/reiserfs/ibalance.c:853:2: warning: Value stored to 'k' is never read=
 [clang-analyzer-deadcode.DeadStores]
           k =3D 0;
           ^   ~
   fs/reiserfs/ibalance.c:853:2: note: Value stored to 'k' is never read
           k =3D 0;
           ^   ~
   fs/reiserfs/ibalance.c:1065:4: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&new_insert_key, internal_key(tbSh, n - s=
num),
                           ^~~~~~
   fs/reiserfs/ibalance.c:1065:4: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                           memcpy(&new_insert_key, internal_key(tbSh, n - s=
num),
                           ^~~~~~
   fs/reiserfs/ibalance.c:1077:4: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&new_insert_key,
                           ^~~~~~
   fs/reiserfs/ibalance.c:1077:4: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                           memcpy(&new_insert_key,
                           ^~~~~~
   fs/reiserfs/ibalance.c:1112:4: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&new_insert_key, insert_key + insert_num =
- k - 1,
                           ^~~~~~
   fs/reiserfs/ibalance.c:1112:4: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                           memcpy(&new_insert_key, insert_key + insert_num =
- k - 1,
                           ^~~~~~
   fs/reiserfs/ibalance.c:1158:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
                   ^~~~~~
   fs/reiserfs/ibalance.c:1158:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
                   ^~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   Suppressed 77 warnings (70 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/regulator/bd9571mwv-regulator.c:91:6: warning: Assigned value is=
 garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           val >>=3D ffs(rdev->desc->vsel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/bd9571mwv-regulator.c:83:6: note: Assuming 'ret' is >=
=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/regulator/bd9571mwv-regulator.c:83:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/regulator/bd9571mwv-regulator.c:87:6: note: Assuming 'ret' is eq=
ual to 0
           if (ret !=3D 0)
               ^~~~~~~~
   drivers/regulator/bd9571mwv-regulator.c:87:2: note: Taking false branch
           if (ret !=3D 0)
           ^
   drivers/regulator/bd9571mwv-regulator.c:91:6: note: Assigned value is ga=
rbage or undefined
           val >>=3D ffs(rdev->desc->vsel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
>> drivers/regulator/da9055-regulator.c:436:3: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name, "DA9055 GPI %d", gpio_mux);
                   ^~~~~~~
   drivers/regulator/da9055-regulator.c:436:3: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(name, "DA9055 GPI %d", gpio_mux);
                   ^~~~~~~
   drivers/regulator/da9055-regulator.c:464:3: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name, "DA9055 GPI %d", gpio_mux);
                   ^~~~~~~
   drivers/regulator/da9055-regulator.c:464:3: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(name, "DA9055 GPI %d", gpio_mux);
                   ^~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/video/backlight/aat2870_bl.c:137:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(struct backlight_properties));
           ^~~~~~
   drivers/video/backlight/aat2870_bl.c:137:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(struct backlight_properties));
           ^~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   fs/fuse/readdir.c:81:3: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   clear_page(addr);
                   ^
   arch/riscv/include/asm/page.h:51:30: note: expanded from macro 'clear_pa=
ge'
   #define clear_page(pgaddr)                      memset((pgaddr), 0, PAGE=
_SIZE)
                                                   ^~~~~~
   fs/fuse/readdir.c:81:3: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                   clear_page(addr);
                   ^
   arch/riscv/include/asm/page.h:51:30: note: expanded from macro 'clear_pa=
ge'
   #define clear_page(pgaddr)                      memset((pgaddr), 0, PAGE=
_SIZE)
                                                   ^~~~~~
   fs/fuse/readdir.c:82:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr + offset, dirent, reclen);
           ^~~~~~
   fs/fuse/readdir.c:82:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(addr + offset, dirent, reclen);
           ^~~~~~
   fs/fuse/readdir.c:262:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   fs/fuse/readdir.c:262:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/video/backlight/adp8870_bl.c:555:9: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", reg_val);
                  ^~~~~~~
   drivers/video/backlight/adp8870_bl.c:555:9: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", reg_val);
                  ^~~~~~~
   drivers/video/backlight/adp8870_bl.c:756:9: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", ret_val);
                  ^~~~~~~
   drivers/video/backlight/adp8870_bl.c:756:9: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", ret_val);
                  ^~~~~~~
   drivers/video/backlight/adp8870_bl.c:775:9: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/video/backlight/adp8870_bl.c:775:9: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/video/backlight/adp8870_bl.c:883:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(props));
           ^~~~~~
   drivers/video/backlight/adp8870_bl.c:883:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(props));
           ^~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/video/backlight/backlight.c:139:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&bd->fb_notif, 0, sizeof(bd->fb_notif));
           ^~~~~~
   drivers/video/backlight/backlight.c:139:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&bd->fb_notif, 0, sizeof(bd->fb_notif));
           ^~~~~~
   drivers/video/backlight/backlight.c:186:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", bd->props.power);
                  ^~~~~~~
   drivers/video/backlight/backlight.c:186:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", bd->props.power);
                  ^~~~~~~
   drivers/video/backlight/backlight.c:227:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", bd->props.brightness);
--
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-zoned.c:202:6: note: Assuming 'need_reset' is non-null
           if (!need_reset)
               ^~~~~~~~~~~
   block/blk-zoned.c:202:2: note: Taking false branch
           if (!need_reset)
           ^
   block/blk-zoned.c:208:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   block/blk-zoned.c:208:2: note: Taking false branch
           if (ret < 0)
           ^
   block/blk-zoned.c:212:9: note: 'sector' is < 'capacity'
           while (sector < capacity) {
                  ^~~~~~
   block/blk-zoned.c:212:2: note: Loop condition is true.  Entering loop bo=
dy
           while (sector < capacity) {
           ^
   block/blk-zoned.c:213:17: note: Calling 'blk_queue_zone_no'
                   if (!test_bit(blk_queue_zone_no(q, sector), need_reset))=
 {
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:520:7: note: Calling 'blk_queue_is_zoned'
           if (!blk_queue_is_zoned(q))
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
                   ^
   include/linux/blkdev.h:491:3: note: Returning the value 2, which partici=
pates in a condition later
                   return q->limits.zoned;
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:497:10: note: Returning from 'blk_queue_zoned_mod=
el'
           switch (blk_queue_zoned_model(q)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:497:2: note: Control jumps to 'case BLK_ZONED_HM:=
'  at line 499
           switch (blk_queue_zoned_model(q)) {
           ^
   include/linux/blkdev.h:500:3: note: Returning the value 1, which partici=
pates in a condition later
                   return true;
                   ^~~~~~~~~~~
   include/linux/blkdev.h:520:7: note: Returning from 'blk_queue_is_zoned'
           if (!blk_queue_is_zoned(q))
                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:520:2: note: Taking false branch
           if (!blk_queue_is_zoned(q))
           ^
   include/linux/blkdev.h:522:19: note: '?' condition is false
           return sector >> ilog2(q->limits.chunk_sectors);
                            ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   include/linux/blkdev.h:522:19: note: '?' condition is true
           return sector >> ilog2(q->limits.chunk_sectors);
                            ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   include/linux/blkdev.h:522:19: note: Calling '__ilog2_u32'
           return sector >> ilog2(q->limits.chunk_sectors);
                            ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:522:19: note: Returning from '__ilog2_u32'
           return sector >> ilog2(q->limits.chunk_sectors);
                            ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/blkdev.h:522:16: note: The result of the right shift is un=
defined because the right operand is negative
           return sector >> ilog2(q->limits.chunk_sectors);
                         ^
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   block/blk-iolatency.c:814:7: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(tok, "%15[^=3D]=3D%20s", key, val) !=3D 2)
                       ^~~~~~
   block/blk-iolatency.c:814:7: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
                   if (sscanf(tok, "%15[^=3D]=3D%20s", key, val) !=3D 2)
                       ^~~~~~
   block/blk-iolatency.c:822:13: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           else if (sscanf(val, "%llu", &v) =3D=3D 1)
                                    ^~~~~~
   block/blk-iolatency.c:822:13: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
                           else if (sscanf(val, "%llu", &v) =3D=3D 1)
                                    ^~~~~~
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
>> block/blk-iocost.c:922:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ioc->params.qos, p->qos, sizeof(p->qos));
                   ^~~~~~
   block/blk-iocost.c:922:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(ioc->params.qos, p->qos, sizeof(p->qos));
                   ^~~~~~
   block/blk-iocost.c:924:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ioc->params.i_lcoefs, p->i_lcoefs, sizeof(p->i_lc=
oefs));
                   ^~~~~~
   block/blk-iocost.c:924:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(ioc->params.i_lcoefs, p->i_lcoefs, sizeof(p->i_lc=
oefs));
                   ^~~~~~
   block/blk-iocost.c:1881:32: warning: The left operand of '>' is a garbag=
e value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           WARN_ON_ONCE(root_iocg->level > 0);
                                         ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   block/blk-iocost.c:1840:2: note: Loop condition is false. Execution cont=
inues on line 1852
           list_for_each_entry(iocg, surpluses, surplus_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   block/blk-iocost.c:1852:6: note: 'after_sum' is < WEIGHT_ONE
           if (after_sum >=3D WEIGHT_ONE) {
               ^~~~~~~~~
   block/blk-iocost.c:1852:2: note: Taking false branch
           if (after_sum >=3D WEIGHT_ONE) {
           ^
   block/blk-iocost.c:1864:2: note: Loop condition is false. Execution cont=
inues on line 1876
           list_for_each_entry_safe(iocg, tiocg, &over_hwa, walk_list) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   block/blk-iocost.c:1876:2: note: Loop condition is false. Execution cont=
inues on line 1880
           list_for_each_entry(iocg, surpluses, surplus_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   block/blk-iocost.c:1881:32: note: The left operand of '>' is a garbage v=
alue
           WARN_ON_ONCE(root_iocg->level > 0);
                                         ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
>> block/blk-iocost.c:3060:8: warning: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (!sscanf(buf, "default %u", &v) && !sscanf(buf, "%u",=
 &v))
                        ^~~~~~
   block/blk-iocost.c:3060:8: note: Call to function 'sscanf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sscanf_s' in case of C11
                   if (!sscanf(buf, "default %u", &v) && !sscanf(buf, "%u",=
 &v))
                        ^~~~~~
   block/blk-iocost.c:3060:42: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (!sscanf(buf, "default %u", &v) && !sscanf(buf, "%u",=
 &v))
                                                          ^~~~~~
   block/blk-iocost.c:3060:42: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
                   if (!sscanf(buf, "default %u", &v) && !sscanf(buf, "%u",=
 &v))
                                                          ^~~~~~
   block/blk-iocost.c:3092:8: warning: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (!sscanf(ctx.body, "%u", &v))
                        ^~~~~~
   block/blk-iocost.c:3092:8: note: Call to function 'sscanf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sscanf_s' in case of C11
                   if (!sscanf(ctx.body, "%u", &v))
                        ^~~~~~
   block/blk-iocost.c:3184:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(qos, ioc->params.qos, sizeof(qos));
           ^~~~~~
   block/blk-iocost.c:3184:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(qos, ioc->params.qos, sizeof(qos));
           ^~~~~~
   block/blk-iocost.c:3266:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ioc->params.qos, qos, sizeof(qos));
                   ^~~~~~
   block/blk-iocost.c:3266:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(ioc->params.qos, qos, sizeof(qos));
                   ^~~~~~
   block/blk-iocost.c:3351:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(u, ioc->params.i_lcoefs, sizeof(u));
           ^~~~~~
   block/blk-iocost.c:3351:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(u, ioc->params.i_lcoefs, sizeof(u));
           ^~~~~~
   block/blk-iocost.c:3351:2: warning: Null pointer passed as 2nd argument =
to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(u, ioc->params.i_lcoefs, sizeof(u));
           ^         ~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:3339:6: note: Calling 'IS_ERR'
           if (IS_ERR(bdev))
               ^~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
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
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:3339:6: note: Returning from 'IS_ERR'
           if (IS_ERR(bdev))
               ^~~~~~~~~~~~
   block/blk-iocost.c:3339:2: note: Taking false branch
           if (IS_ERR(bdev))
           ^
   block/blk-iocost.c:3342:8: note: Calling 'q_to_ioc'
           ioc =3D q_to_ioc(bdev_get_queue(bdev));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:665:9: note: Calling 'rqos_to_ioc'
           return rqos_to_ioc(rq_qos_id(q, RQ_QOS_COST));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:660:2: note: Returning null pointer, which participat=
es in a condition later
           return container_of(rqos, struct ioc, rqos);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:665:9: note: Returning from 'rqos_to_ioc'
           return rqos_to_ioc(rq_qos_id(q, RQ_QOS_COST));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:665:2: note: Returning null pointer, which participat=
es in a condition later
           return rqos_to_ioc(rq_qos_id(q, RQ_QOS_COST));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:3342:8: note: Returning from 'q_to_ioc'
           ioc =3D q_to_ioc(bdev_get_queue(bdev));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:3343:7: note: 'ioc' is null
           if (!ioc) {
                ^~~
   block/blk-iocost.c:3343:2: note: Taking true branch
           if (!ioc) {
           ^
   block/blk-iocost.c:3344:9: note: Calling 'blk_iocost_init'
                   ret =3D blk_iocost_init(bdev_get_queue(bdev));
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:2838:8: note: Calling 'kzalloc'
           ioc =3D kzalloc(sizeof(*ioc), GFP_KERNEL);
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
--
   fs/btrfs/lzo.c:182:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(kaddr + offset_in_page(*cur_out),
                   ^~~~~~
   fs/btrfs/lzo.c:182:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(kaddr + offset_in_page(*cur_out),
                   ^~~~~~
   fs/btrfs/lzo.c:197:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(kaddr + offset_in_page(*cur_out), 0,
           ^~~~~~
   fs/btrfs/lzo.c:197:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(kaddr + offset_in_page(*cur_out), 0,
           ^~~~~~
   fs/btrfs/lzo.c:319:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dest + *cur_in - orig_in,
                   ^~~~~~
   fs/btrfs/lzo.c:319:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(dest + *cur_in - orig_in,
                   ^~~~~~
   fs/btrfs/lzo.c:413:6: warning: Branch condition evaluates to a garbage v=
alue [clang-analyzer-core.uninitialized.Branch]
           if (!ret)
               ^~~~
   fs/btrfs/lzo.c:334:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   fs/btrfs/lzo.c:354:15: note: Assuming '__UNIQUE_ID___x928' is >=3D '__UN=
IQUE_ID___y929'
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
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
                            ^~~~~~~~~~
   fs/btrfs/lzo.c:354:15: note: '?' condition is false
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
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
   fs/btrfs/lzo.c:354:6: note: Assuming the condition is false
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/btrfs/lzo.c:354:6: note: Left side of '||' is false
   fs/btrfs/lzo.c:355:6: note: Assuming the condition is false
               round_up(len_in, sectorsize) < cb->compressed_len) {
               ^
   include/linux/math.h:24:24: note: expanded from macro 'round_up'
   #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
                          ^
   fs/btrfs/lzo.c:354:2: note: Taking false branch
           if (len_in > min_t(size_t, BTRFS_MAX_COMPRESSED, cb->compressed_=
len) ||
           ^
   fs/btrfs/lzo.c:363:9: note: Assuming 'cur_in' is >=3D 'len_in'
           while (cur_in < len_in) {
                  ^~~~~~~~~~~~~~~
   fs/btrfs/lzo.c:363:2: note: Loop condition is false. Execution continues=
 on line 413
           while (cur_in < len_in) {
           ^
   fs/btrfs/lzo.c:413:6: note: Branch condition evaluates to a garbage value
           if (!ret)
               ^~~~
   fs/btrfs/lzo.c:466:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kaddr, workspace->buf + start_byte, bytes);
           ^~~~~~
   fs/btrfs/lzo.c:466:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(kaddr, workspace->buf + start_byte, bytes);
           ^~~~~~
   fs/btrfs/lzo.c:474:3: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(kaddr+bytes, 0, destlen-bytes);
                   ^~~~~~
   fs/btrfs/lzo.c:474:3: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
                   memset(kaddr+bytes, 0, destlen-bytes);
                   ^~~~~~
   Suppressed 61 warnings (54 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/usb/host/ssb-hcd.c:109:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hci_res, 0, sizeof(hci_res));
           ^~~~~~
   drivers/usb/host/ssb-hcd.c:109:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(hci_res, 0, sizeof(hci_res));
           ^~~~~~
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
>> drivers/usb/host/max3421-hcd.c:354:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:354:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:380:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:380:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:404:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:404:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:430:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:430:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:637:21: warning: Value stored to 'spi' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:637:21: note: Value stored to 'spi' durin=
g its initialization is never read
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:772:21: warning: Value stored to 'spi' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:772:21: note: Value stored to 'spi' durin=
g its initialization is never read
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:852:21: warning: Value stored to 'spi' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:852:21: note: Value stored to 'spi' durin=
g its initialization is never read
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:1636:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(desc, 0, sizeof(*desc));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:1636:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(desc, 0, sizeof(*desc));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:1719:4: warning: Value stored to 'retval'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           retval =3D -EPIPE;
                           ^        ~~~~~~
   drivers/usb/host/max3421-hcd.c:1719:4: note: Value stored to 'retval' is=
 never read
                           retval =3D -EPIPE;
                           ^        ~~~~~~
   Suppressed 48 warnings (41 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/gpu/drm/drm_dsc.c:45:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(pps_header, 0, sizeof(*pps_header));
           ^~~~~~
   drivers/gpu/drm/drm_dsc.c:45:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(pps_header, 0, sizeof(*pps_header));
           ^~~~~~
   drivers/gpu/drm/drm_dsc.c:105:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(pps_payload, 0, sizeof(*pps_payload));
           ^~~~~~
   drivers/gpu/drm/drm_dsc.c:105:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(pps_payload, 0, sizeof(*pps_payload));
           ^~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/base/power/qos.c:279:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(req, 0, sizeof(*req));
                   ^~~~~~
   drivers/base/power/qos.c:279:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(req, 0, sizeof(*req));
                   ^~~~~~
   drivers/base/power/qos.c:285:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(req, 0, sizeof(*req));
                   ^~~~~~
   drivers/base/power/qos.c:285:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(req, 0, sizeof(*req));
--
   drivers/usb/c67x00/c67x00-ll-hpi.c:288:3: warning: 3rd function call arg=
ument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   hpi_write_word(dev, COMM_R(i), data->regs[i]);
                   ^
   drivers/usb/c67x00/c67x00-ll-hpi.c:324:7: note: Calling 'c67x00_comm_exe=
c_int'
           rc =3D c67x00_comm_exec_int(dev, HUSB_RESET_INT, &data);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-ll-hpi.c:287:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < COMM_REGS; i++)
           ^
   drivers/usb/c67x00/c67x00-ll-hpi.c:287:2: note: Loop condition is true. =
 Entering loop body
   drivers/usb/c67x00/c67x00-ll-hpi.c:287:29: note: The value 2 is assigned=
 to 'i'
           for (i =3D 0; i < COMM_REGS; i++)
                                      ^~~
   drivers/usb/c67x00/c67x00-ll-hpi.c:287:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < COMM_REGS; i++)
           ^
   drivers/usb/c67x00/c67x00-ll-hpi.c:288:3: note: 3rd function call argume=
nt is an uninitialized value
                   hpi_write_word(dev, COMM_R(i), data->regs[i]);
                   ^                              ~~~~~~~~~~~~~
   Suppressed 22 warnings (15 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/usb/c67x00/c67x00-hcd.c:80:3: warning: Value stored to 'len' is =
never read [clang-analyzer-deadcode.DeadStores]
                   len =3D 4;                /* hub power */
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:80:3: note: Value stored to 'len' is nev=
er read
                   len =3D 4;                /* hub power */
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:108:3: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   len =3D 4;
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:108:3: note: Value stored to 'len' is ne=
ver read
                   len =3D 4;
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:116:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:116:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:132:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:132:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:137:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:137:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:142:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:142:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:162:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:162:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:168:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:168:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:174:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:174:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:180:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:180:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:191:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:191:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:197:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:197:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:203:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:203:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
>> drivers/usb/c67x00/c67x00-hcd.c:216:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, c67x00_hub_des, len);
                   ^~~~~~
   drivers/usb/c67x00/c67x00-hcd.c:216:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, c67x00_hub_des, len);
                   ^~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/gpu/drm/drm_writeback.c:216:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(wb_connector->timeline_name,
           ^~~~~~~~
   drivers/gpu/drm/drm_writeback.c:216:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(wb_connector->timeline_name,
           ^~~~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/gpu/drm/drm_client_modeset.c:545:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(crtcs, best_crtcs, n * sizeof(*crtcs));
                   ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:545:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(crtcs, best_crtcs, n * sizeof(*crtcs));
                   ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:550:4: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(best_crtcs, crtcs, connector_count * size=
of(*crtcs));
                           ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:550:4: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(best_crtcs, crtcs, connector_count * size=
of(*crtcs));
                           ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:593:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(save_enabled, enabled, count);
           ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:593:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(save_enabled, enabled, count);
           ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:742:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(enabled, save_enabled, count);
                   ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:742:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(enabled, save_enabled, count);
                   ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:825:3: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(modes, 0, connector_count * sizeof(*modes));
                   ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:825:3: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
                   memset(modes, 0, connector_count * sizeof(*modes));
                   ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:826:3: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(crtcs, 0, connector_count * sizeof(*crtcs));
                   ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:826:3: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
                   memset(crtcs, 0, connector_count * sizeof(*crtcs));
                   ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:827:3: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(offsets, 0, connector_count * sizeof(*offsets));
                   ^~~~~~
   drivers/gpu/drm/drm_client_modeset.c:827:3: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
                   memset(offsets, 0, connector_count * sizeof(*offsets));
                   ^~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/usb/core/endpoint.c:46:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_ep_attr(bLength, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:46:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   usb_ep_attr(bLength, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:47:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_ep_attr(bEndpointAddress, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:47:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   usb_ep_attr(bEndpointAddress, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:48:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_ep_attr(bmAttributes, "%02x\n");
   ^
   drivers/usb/core/endpoint.c:42:9: note: expanded from macro 'usb_ep_attr'
           return sprintf(buf, format_string, ep->desc->field);    \
                  ^~~~~~~
   drivers/usb/core/endpoint.c:48:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   usb_ep_attr(bmAttributes, "%02x\n");
--
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
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/input/joystick/iforce/iforce-usb.c:12:8: warning: Excessive padd=
ing in 'struct iforce_usb' (144 padding bytes, where 80 is optimal). =

   Optimal fields order: =

   data_in, =

   usbdev, =

   intf, =

   irq, =

   out, =

   iforce, =

   data_out, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct iforce_usb {
   ~~~~~~~^~~~~~~~~~~~
   drivers/input/joystick/iforce/iforce-usb.c:12:8: note: Excessive padding=
 in 'struct iforce_usb' (144 padding bytes, where 80 is optimal). Optimal f=
ields order: data_in, usbdev, intf, irq, out, iforce, data_out, consider re=
ordering the fields or adding explicit padding members
   struct iforce_usb {
   ~~~~~~~^~~~~~~~~~~~
>> drivers/input/joystick/iforce/iforce-usb.c:50:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iforce_usb->out->transfer_buffer + 1,
           ^~~~~~
   drivers/input/joystick/iforce/iforce-usb.c:50:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(iforce_usb->out->transfer_buffer + 1,
           ^~~~~~
   drivers/input/joystick/iforce/iforce-usb.c:54:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(iforce_usb->out->transfer_buffer + 1 + c,
                   ^~~~~~
   drivers/input/joystick/iforce/iforce-usb.c:54:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(iforce_usb->out->transfer_buffer + 1 + c,
                   ^~~~~~
   drivers/input/joystick/iforce/iforce-usb.c:102:3: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(response_data, buf, status);
                   ^~~~~~
   drivers/input/joystick/iforce/iforce-usb.c:102:3: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(response_data, buf, status);
                   ^~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/input/joystick/joydump.c:60:4: warning: 3rd function call argume=
nt is an uninitialized value [clang-analyzer-core.CallAndMessage]
                           printk(KERN_INFO "joydump: | Axis %d: %4d.      =
                     |\n", i, axes[i]);
                           ^
   include/linux/printk.h:446:44: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                              ^               ~~~~~~~~~~~
   include/linux/printk.h:418:3: note: expanded from macro 'printk_index_wr=
ap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                   ^               ~~~~~~~~~~~
   drivers/input/joystick/joydump.c:42:2: note: Loop condition is false.  E=
xiting loop
           printk(KERN_INFO "joydump: ,------------------ START -----------=
-----.\n");
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
   drivers/input/joystick/joydump.c:43:2: note: Loop condition is false.  E=
xiting loop
           printk(KERN_INFO "joydump: | Dumping: %30s |\n", gameport->phys);
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
   drivers/input/joystick/joydump.c:44:2: note: Loop condition is false.  E=
xiting loop
           printk(KERN_INFO "joydump: | Speed: %28d kHz |\n", gameport->spe=
ed);
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
   drivers/input/joystick/joydump.c:46:6: note: Assuming the condition is t=
rue
           if (gameport_open(gameport, drv, GAMEPORT_MODE_RAW)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/joystick/joydump.c:46:2: note: Taking true branch
           if (gameport_open(gameport, drv, GAMEPORT_MODE_RAW)) {
           ^
   drivers/input/joystick/joydump.c:48:3: note: Loop condition is false.  E=
xiting loop
                   printk(KERN_INFO "joydump: | Raw mode not available - tr=
ying cooked.    |\n");
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
   drivers/input/joystick/joydump.c:50:7: note: Assuming the condition is f=
alse
                   if (gameport_open(gameport, drv, GAMEPORT_MODE_COOKED)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/joystick/joydump.c:50:3: note: Taking false branch
                   if (gameport_open(gameport, drv, GAMEPORT_MODE_COOKED)) {
                   ^
   drivers/input/joystick/joydump.c:57:3: note: Calling 'gameport_cooked_re=
ad'
                   gameport_cooked_read(gameport, axes, &buttons);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/gameport.h:184:6: note: Assuming field 'cooked_read' is nu=
ll
           if (gameport->cooked_read)
               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/gameport.h:184:2: note: Taking false branch
           if (gameport->cooked_read)
           ^
   include/linux/gameport.h:187:3: note: Returning without writing to '*axe=
s'
                   return -1;
--
   drivers/nvme/target/configfs.c:1484:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "\n");
                  ^~~~~~~
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   block/blk-mq-sysfs.c:98:9: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%u\n", hctx->tags->nr_tags);
                  ^~~~~~~
   block/blk-mq-sysfs.c:98:9: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%u\n", hctx->tags->nr_tags);
                  ^~~~~~~
   block/blk-mq-sysfs.c:104:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%u\n", hctx->tags->nr_reserved_tags);
                  ^~~~~~~
   block/blk-mq-sysfs.c:104:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%u\n", hctx->tags->nr_reserved_tags);
                  ^~~~~~~
   block/blk-mq-sysfs.c:115:10: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D snprintf(pos + page, size - pos, "%u", i=
);
                                 ^~~~~~~~
   block/blk-mq-sysfs.c:115:10: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                           ret =3D snprintf(pos + page, size - pos, "%u", i=
);
                                 ^~~~~~~~
   block/blk-mq-sysfs.c:117:10: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D snprintf(pos + page, size - pos, ", %u",=
 i);
                                 ^~~~~~~~
   block/blk-mq-sysfs.c:117:10: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                           ret =3D snprintf(pos + page, size - pos, ", %u",=
 i);
                                 ^~~~~~~~
   block/blk-mq-sysfs.c:126:8: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(pos + page, size + 1 - pos, "\n");
                 ^~~~~~~~
   block/blk-mq-sysfs.c:126:8: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(pos + page, size + 1 - pos, "\n");
                 ^~~~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/input/joystick/turbografx.c:168:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tgfx_parport_cb, 0, sizeof(tgfx_parport_cb));
           ^~~~~~
   drivers/input/joystick/turbografx.c:168:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&tgfx_parport_cb, 0, sizeof(tgfx_parport_cb));
           ^~~~~~
   drivers/input/joystick/turbografx.c:205:3: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(tgfx->name[i], sizeof(tgfx->name[i]),
                   ^~~~~~~~
   drivers/input/joystick/turbografx.c:205:3: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(tgfx->name[i], sizeof(tgfx->name[i]),
                   ^~~~~~~~
   drivers/input/joystick/turbografx.c:207:3: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(tgfx->phys[i], sizeof(tgfx->phys[i]),
                   ^~~~~~~~
   drivers/input/joystick/turbografx.c:207:3: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(tgfx->phys[i], sizeof(tgfx->phys[i]),
                   ^~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/input/joystick/twidjoy.c:183:2: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(twidjoy->phys, sizeof(twidjoy->phys), "%s/input0", seri=
o->phys);
           ^~~~~~~~
   drivers/input/joystick/twidjoy.c:183:2: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(twidjoy->phys, sizeof(twidjoy->phys), "%s/input0", seri=
o->phys);
           ^~~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/input/joystick/xpad.c:108:21: warning: Excessive padding in 'str=
uct xpad_device' (10 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   name, =

   idVendor, =

   idProduct, =

   mapping, =

   xtype, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   static const struct xpad_device {
                ~~~~~~~^~~~~~~~~~~~~
   drivers/input/joystick/xpad.c:108:21: note: Excessive padding in 'struct=
 xpad_device' (10 padding bytes, where 2 is optimal). Optimal fields order:=
 name, idVendor, idProduct, mapping, xtype, consider reordering the fields =
or adding explicit padding members
   static const struct xpad_device {
                ~~~~~~~^~~~~~~~~~~~~
   drivers/input/joystick/xpad.c:461:8: warning: Excessive padding in 'stru=
ct xboxone_init_packet' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   data, =

   idVendor, =

   idProduct, =

   len, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct xboxone_init_packet {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/input/joystick/xpad.c:461:8: note: Excessive padding in 'struct =
xboxone_init_packet' (11 padding bytes, where 3 is optimal). Optimal fields=
 order: data, idVendor, idProduct, len, consider reordering the fields or a=
dding explicit padding members
   struct xboxone_init_packet {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
>> drivers/input/joystick/xpad.c:999:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(xpad->odata, init_packet->data, init_packet->len);
                   ^~~~~~
   drivers/input/joystick/xpad.c:999:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(xpad->odata, init_packet->data, init_packet->len);
                   ^~~~~~
   drivers/input/joystick/xpad.c:1035:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(xpad->odata, packet->data, packet->len);
                   ^~~~~~
   drivers/input/joystick/xpad.c:1035:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(xpad->odata, packet->data, packet->len);
                   ^~~~~~
   drivers/input/joystick/xpad.c:1236:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(packet->data, mode_report_ack, packet->len);
           ^~~~~~
   drivers/input/joystick/xpad.c:1236:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(packet->data, mode_report_ack, packet->len);
           ^~~~~~
>> drivers/input/joystick/xpad.c:1465:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(led->name, sizeof(led->name), "xpad%d", xpad->pad_nr);
           ^~~~~~~~
   drivers/input/joystick/xpad.c:1465:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(led->name, sizeof(led->name), "xpad%d", xpad->pad_nr);
           ^~~~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/usb/misc/isight_firmware.c:66:3: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, ptr, 4);
                   ^~~~~~
   drivers/usb/misc/isight_firmware.c:66:3: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data, ptr, 4);
                   ^~~~~~
   drivers/usb/misc/isight_firmware.c:85:4: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, ptr, llen);
                           ^~~~~~
   drivers/usb/misc/isight_firmware.c:85:4: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf, ptr, llen);
                           ^~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/usb/misc/usblcd.c:175:3: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, "%1d%1d.%1d%1d",
                   ^~~~~~~
   drivers/usb/misc/usblcd.c:175:3: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, "%1d%1d.%1d%1d",
                   ^~~~~~~
   drivers/usb/misc/usblcd.c:184:3: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, DRIVER_VERSION);
                   ^~~~~~~
   drivers/usb/misc/usblcd.c:184:3: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, DRIVER_VERSION);
                   ^~~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/i2c/muxes/i2c-demux-pinctrl.c:103:2: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(priv->cur_adap.name, sizeof(priv->cur_adap.name),
           ^~~~~~~~
   drivers/i2c/muxes/i2c-demux-pinctrl.c:103:2: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(priv->cur_adap.name, sizeof(priv->cur_adap.name),
           ^~~~~~~~
   drivers/i2c/muxes/i2c-demux-pinctrl.c:184:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", priv->cur_chan);
                  ^~~~~~~
   drivers/i2c/muxes/i2c-demux-pinctrl.c:184:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", priv->cur_chan);
                  ^~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/i2c/muxes/i2c-mux-gpio.c:140:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&mux->data, dev_get_platdata(&pdev->dev),
                   ^~~~~~
   drivers/i2c/muxes/i2c-mux-gpio.c:140:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&mux->data, dev_get_platdata(&pdev->dev),
                   ^~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/spi/spi-mem.c:370:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nby=
tes);
                   ^~~~~~
   drivers/spi/spi-mem.c:370:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nby=
tes);
                   ^~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/spi/spi-axi-spi-engine.c:324:4: warning: Array access (from vari=
able 'buf') results in a null pointer dereference [clang-analyzer-core.Null=
Dereference]
                           writel_relaxed(buf[i], addr);
                           ^
   arch/riscv/include/asm/mmio.h:120:45: note: expanded from macro 'writel_=
relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __i=
o_raw(); })
                                                  ^
   arch/riscv/include/asm/mmio.h:93:59: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
--
   include/scsi/scsi_device.h:469:9: note: Loop condition is false.  Exitin=
g loop
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:2: note: expanded from macro 'scsi_execut=
e'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   include/scsi/scsi_device.h:469:9: note: Calling '__scsi_execute'
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:460:2: note: expanded from macro 'scsi_execut=
e'
           __scsi_execute(sdev, cmd, data_direction, buffer, bufflen,      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:220:4: note: 'data_direction' is not equal to DM=
A_TO_DEVICE
                           data_direction =3D=3D DMA_TO_DEVICE ?
                           ^~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:220:4: note: '?' condition is false
   drivers/scsi/scsi_lib.c:222:4: note: '?' condition is false
                           rq_flags & RQF_PM ? BLK_MQ_REQ_PM : 0);
                           ^
   drivers/scsi/scsi_lib.c:223:2: note: Taking true branch
           if (IS_ERR(req))
           ^
   drivers/scsi/scsi_lib.c:224:3: note: Returning without writing to 'sshdr=
->response_code'
                   return PTR_ERR(req);
                   ^
   include/scsi/scsi_device.h:469:9: note: Returning from '__scsi_execute'
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:460:2: note: expanded from macro 'scsi_execut=
e'
           __scsi_execute(sdev, cmd, data_direction, buffer, bufflen,      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/scsi/scsi_device.h:469:2: note: Returning without writing to 'ss=
hdr->response_code'
           return scsi_execute(sdev, cmd, data_direction, buffer,
           ^
   drivers/scsi/scsi_lib.c:2202:11: note: Returning from 'scsi_execute_req'
           result =3D scsi_execute_req(sdev, cmd, DMA_FROM_DEVICE, buffer, =
len,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/scsi/scsi_lib.c:2204:6: note: Assuming 'result' is >=3D 0
           if (result < 0)
               ^~~~~~~~~~
   drivers/scsi/scsi_lib.c:2204:2: note: Taking false branch
           if (result < 0)
           ^
   drivers/scsi/scsi_lib.c:2212:7: note: Calling 'scsi_status_is_good'
           if (!scsi_status_is_good(result)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/scsi/scsi.h:198:6: note: 'status' is >=3D 0
           if (status < 0)
               ^~~~~~
   include/scsi/scsi.h:198:2: note: Taking false branch
           if (status < 0)
           ^
   include/scsi/scsi.h:201:6: note: Assuming the condition is true
           if (host_byte(status) =3D=3D DID_NO_CONNECT)
               ^
   include/scsi/scsi.h:124:29: note: expanded from macro 'host_byte'
   #define host_byte(result)   (((result) >> 16) & 0xff)
                               ^
   include/scsi/scsi.h:201:2: note: Taking true branch
           if (host_byte(status) =3D=3D DID_NO_CONNECT)
           ^
   include/scsi/scsi.h:202:3: note: Returning zero, which participates in a=
 condition later
                   return false;
                   ^~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:2212:7: note: Returning from 'scsi_status_is_goo=
d'
           if (!scsi_status_is_good(result)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:2212:2: note: Taking true branch
           if (!scsi_status_is_good(result)) {
           ^
   drivers/scsi/scsi_lib.c:2213:7: note: Calling 'scsi_sense_valid'
                   if (scsi_sense_valid(sshdr)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/scsi/scsi_common.h:63:7: note: 'sshdr' is non-null
           if (!sshdr)
                ^~~~~
   include/scsi/scsi_common.h:63:2: note: Taking false branch
           if (!sshdr)
           ^
   include/scsi/scsi_common.h:66:31: note: The left operand of '&' is a gar=
bage value
           return (sshdr->response_code & 0x70) =3D=3D 0x70;
                   ~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
>> drivers/usb/gadget/udc/udc-xilinx.c:502:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(eprambase, bufferptr, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:502:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(eprambase, bufferptr, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:506:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(bufferptr, eprambase, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:506:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(bufferptr, eprambase, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:520:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(eprambase, bufferptr, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:520:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(eprambase, bufferptr, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:524:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(bufferptr, eprambase, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:524:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(bufferptr, eprambase, bytestosend);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:635:3: warning: Value stored to 'buf=
ferspace' is never read [clang-analyzer-deadcode.DeadStores]
                   bufferspace -=3D count;
                   ^              ~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:635:3: note: Value stored to 'buffer=
space' is never read
                   bufferspace -=3D count;
                   ^              ~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1026:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(corebuf, req->usb_req.buf, length);
                   ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1026:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(corebuf, req->usb_req.buf, length);
                   ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1139:19: warning: Value stored to 'r=
eq' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xusb_req *req    =3D to_xusb_req(_req);
                            ^~~
   drivers/usb/gadget/udc/udc-xilinx.c:1139:19: note: Value stored to 'req'=
 during its initialization is never read
           struct xusb_req *req    =3D to_xusb_req(_req);
                            ^~~
>> drivers/usb/gadget/udc/udc-xilinx.c:1311:4: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(ep->name, EPNAME_SIZE, "ep%d", ep_numbe=
r);
                           ^~~~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1311:4: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(ep->name, EPNAME_SIZE, "ep%d", ep_numbe=
r);
                           ^~~~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1746:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&setup, ep0rambase, 8);
           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1746:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&setup, ep0rambase, 8);
           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1833:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer, ep0rambase, bytes_to_rx);
                   ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1833:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer, ep0rambase, bytes_to_rx);
                   ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1909:4: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ep0rambase, buffer, length);
                           ^~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1909:4: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ep0rambase, buffer, length);
                           ^~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/gpu/drm/drm_print.c:81:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(iterator->data,
                   ^~~~~~
   drivers/gpu/drm/drm_print.c:81:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(iterator->data,
                   ^~~~~~
   drivers/gpu/drm/drm_print.c:91:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(iterator->data + pos, str, len);
                   ^~~~~~
   drivers/gpu/drm/drm_print.c:91:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(iterator->data + pos, str, len);
                   ^~~~~~
   drivers/gpu/drm/drm_print.c:109:8: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D snprintf(NULL, 0, "%pV", vaf);
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
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/mtd/ubi/vtbl.c:105:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ubi->vtbl[idx], vtbl_rec, sizeof(struct ubi_vtbl_record)=
);
           ^~~~~~
   drivers/mtd/ubi/vtbl.c:105:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&ubi->vtbl[idx], vtbl_rec, sizeof(struct ubi_vtbl_record)=
);
           ^~~~~~
   drivers/mtd/ubi/vtbl.c:132:4: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(vtbl_rec, &empty_vtbl_record,
                           ^~~~~~
   drivers/mtd/ubi/vtbl.c:132:4: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                           memcpy(vtbl_rec, &empty_vtbl_record,
                           ^~~~~~
   drivers/mtd/ubi/vtbl.c:138:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(vtbl_rec->name, re->new_name, re->new_name_len);
                   ^~~~~~
   drivers/mtd/ubi/vtbl.c:138:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(vtbl_rec->name, re->new_name, re->new_name_len);
                   ^~~~~~
   drivers/mtd/ubi/vtbl.c:139:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(vtbl_rec->name + re->new_name_len, 0,
                   ^~~~~~
   drivers/mtd/ubi/vtbl.c:139:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(vtbl_rec->name + re->new_name_len, 0,
                   ^~~~~~
   drivers/mtd/ubi/vtbl.c:495:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&vtbl[i], &empty_vtbl_record, UBI_VTBL_RECORD_SIZ=
E);
                   ^~~~~~
   drivers/mtd/ubi/vtbl.c:495:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(&vtbl[i], &empty_vtbl_record, UBI_VTBL_RECORD_SIZ=
E);
--
   drivers/leds/led-class-flash.c:203:14: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
                           buf_len =3D sprintf(pbuf, "%s ",
                                     ^~~~~~~
   drivers/leds/led-class-flash.c:203:14: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
                           buf_len =3D sprintf(pbuf, "%s ",
                                     ^~~~~~~
   drivers/leds/led-class-flash.c:210:16: warning: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           return strlen(strcat(buf, "\n"));
                         ^~~~~~
   drivers/leds/led-class-flash.c:210:16: note: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119
           return strlen(strcat(buf, "\n"));
                         ^~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
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
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/i2c/algos/i2c-algo-pca.c:195:10: warning: Although the value sto=
red to 'state' is used in the enclosing expression, the value is never actu=
ally read from 'state' [clang-analyzer-deadcode.DeadStores]
           while ((state =3D pca_status(adap)) !=3D 0xf8) {
                   ^
   drivers/i2c/algos/i2c-algo-pca.c:195:10: note: Although the value stored=
 to 'state' is used in the enclosing expression, the value is never actuall=
y read from 'state'
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/hwmon/hwmon.c:70:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
           return sprintf(buf, "%s\n", to_hwmon_device(dev)->name);
                  ^~~~~~~
   drivers/hwmon/hwmon.c:70:9: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
           return sprintf(buf, "%s\n", to_hwmon_device(dev)->name);
                  ^~~~~~~
   drivers/hwmon/hwmon.c:312:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", val);
                  ^~~~~~~
   drivers/hwmon/hwmon.c:312:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", val);
                  ^~~~~~~
   drivers/hwmon/hwmon.c:332:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", s);
                  ^~~~~~~
   drivers/hwmon/hwmon.c:332:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", s);
                  ^~~~~~~
   drivers/hwmon/hwmon.c:912:13: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (likely(sscanf(dev_name(dev), HWMON_ID_FORMAT, &id) =3D=3D 1)=
) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/hwmon/hwmon.c:912:13: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
           if (likely(sscanf(dev_name(dev), HWMON_ID_FORMAT, &id) =3D=3D 1)=
) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (21 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (21 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/crypto/atmel-i2c.c:361:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(i2c_priv->wake_token, 0, sizeof(i2c_priv->wake_token));
           ^~~~~~
   drivers/crypto/atmel-i2c.c:361:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(i2c_priv->wake_token, 0, sizeof(i2c_priv->wake_token));
           ^~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
>> drivers/crypto/atmel-ecc.c:124:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(public_key, &cmd->data[RSP_DATA_IDX], ATMEL_ECC_PUBKEY_SI=
ZE);
           ^~~~~~
   drivers/crypto/atmel-ecc.c:124:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(public_key, &cmd->data[RSP_DATA_IDX], ATMEL_ECC_PUBKEY_SI=
ZE);
           ^~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
>> drivers/spi/spi-dw-dma.c:274:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&txconf, 0, sizeof(txconf));
           ^~~~~~
   drivers/spi/spi-dw-dma.c:274:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&txconf, 0, sizeof(txconf));
           ^~~~~~
   drivers/spi/spi-dw-dma.c:375:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rxconf, 0, sizeof(rxconf));
           ^~~~~~
   drivers/spi/spi-dw-dma.c:375:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&rxconf, 0, sizeof(rxconf));
           ^~~~~~
   drivers/spi/spi-dw-dma.c:526:17: warning: Although the value stored to '=
len' is used in the enclosing expression, the value is never actually read =
from 'len' [clang-analyzer-deadcode.DeadStores]
           for (base =3D 0, len =3D 0; base < xfer->len; base +=3D len) {
                          ^     ~
   drivers/spi/spi-dw-dma.c:526:17: note: Although the value stored to 'len=
' is used in the enclosing expression, the value is never actually read fro=
m 'len'
           for (base =3D 0, len =3D 0; base < xfer->len; base +=3D len) {
                          ^     ~
   drivers/spi/spi-dw-dma.c:581:2: warning: Undefined or garbage value retu=
rned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   drivers/spi/spi-dw-dma.c:589:10: note: Assuming '__UNIQUE_ID___x256' is =
<=3D '__UNIQUE_ID___y257'
           nents =3D max(xfer->tx_sg.nents, xfer->rx_sg.nents);
                   ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
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
   drivers/spi/spi-dw-dma.c:589:10: note: '?' condition is false
           nents =3D max(xfer->tx_sg.nents, xfer->rx_sg.nents);
                   ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
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
   drivers/spi/spi-dw-dma.c:598:6: note: Assuming field 'dma_sg_burst' is n=
ot equal to 0
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
               ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-dw-dma.c:598:6: note: Left side of '||' is false
   drivers/spi/spi-dw-dma.c:598:28: note: Assuming field 'rx_buf' is non-nu=
ll
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
                                     ^~~~~~~~~~~~~
   drivers/spi/spi-dw-dma.c:598:6: note: Left side of '||' is false
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
               ^
   drivers/spi/spi-dw-dma.c:598:45: note: Assuming 'nents' is > field 'dma_=
sg_burst'
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
                                                      ^~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/spi/spi-dw-dma.c:598:2: note: Taking false branch
           if (!dws->dma_sg_burst || !xfer->rx_buf || nents <=3D dws->dma_s=
g_burst)
           ^
   drivers/spi/spi-dw-dma.c:601:9: note: Calling 'dw_spi_dma_transfer_one'
                   ret =3D dw_spi_dma_transfer_one(dws, xfer);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-dw-dma.c:521:2: note: 'ret' declared without an initial =
value
           int ret;
           ^~~~~~~
   drivers/spi/spi-dw-dma.c:526:26: note: Assuming 'base' is >=3D field 'le=
n'
           for (base =3D 0, len =3D 0; base < xfer->len; base +=3D len) {
                                   ^~~~~~~~~~~~~~~~
   drivers/spi/spi-dw-dma.c:526:2: note: Loop condition is false. Execution=
 continues on line 579
           for (base =3D 0, len =3D 0; base < xfer->len; base +=3D len) {
           ^
   drivers/spi/spi-dw-dma.c:581:2: note: Undefined or garbage value returne=
d to caller
           return ret;
           ^      ~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/leds/leds-lp55xx-common.c:183:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "%s:channel%d",
                   ^~~~~~~~
   drivers/leds/leds-lp55xx-common.c:183:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "%s:channel%d",
                   ^~~~~~~~
   drivers/leds/leds-lp55xx-common.c:279:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", chip->engine_idx);
                  ^~~~~~~
   drivers/leds/leds-lp55xx-common.c:279:9: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", chip->engine_idx);
                  ^~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/leds/leds-lp8501.c:223:9: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
--
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:319:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", DIV_FROM_REG(data->fan_div[nr]));
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:413:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr][index])=
);
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:413:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr][index])=
);
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:470:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   show_pwm_reg(pwm_mode)
   ^
   drivers/hwmon/w83l786ng.c:467:9: note: expanded from macro 'show_pwm_reg'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:470:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   show_pwm_reg(pwm_mode)
   ^
   drivers/hwmon/w83l786ng.c:467:9: note: expanded from macro 'show_pwm_reg'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:471:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   show_pwm_reg(pwm_enable)
   ^
   drivers/hwmon/w83l786ng.c:467:9: note: expanded from macro 'show_pwm_reg'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:471:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   show_pwm_reg(pwm_enable)
   ^
   drivers/hwmon/w83l786ng.c:467:9: note: expanded from macro 'show_pwm_reg'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:472:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   show_pwm_reg(pwm)
   ^
   drivers/hwmon/w83l786ng.c:467:9: note: expanded from macro 'show_pwm_reg'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:472:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   show_pwm_reg(pwm)
   ^
   drivers/hwmon/w83l786ng.c:467:9: note: expanded from macro 'show_pwm_reg'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:579:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", (long)data->tolerance[nr]);
                  ^~~~~~~
   drivers/hwmon/w83l786ng.c:579:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", (long)data->tolerance[nr]);
                  ^~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/usb/gadget/function/storage_common.c:318:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", fsg_lun_is_open(curlun)
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:318:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", fsg_lun_is_open(curlun)
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:326:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", curlun->nofua);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:326:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", curlun->nofua);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:343:4: warning: Call to fun=
ction 'memmove' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memmove_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(buf, p, rc);
                           ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:343:4: note: Call to functi=
on 'memmove' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memmove_s' in case of C11
                           memmove(buf, p, rc);
                           ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:358:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", curlun->cdrom);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:358:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", curlun->cdrom);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:364:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", curlun->removable);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:364:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", curlun->removable);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:370:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depre=
catedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", curlun->inquiry_string);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:370:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", curlun->inquiry_string);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:512:3: warning: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(curlun->inquiry_string,
                   ^~~~~~~~
   drivers/usb/gadget/function/storage_common.c:512:3: note: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(curlun->inquiry_string,
                   ^~~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
>> drivers/input/misc/keyspan_remote.c:132:3: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(codes + i * 3, 4, "%02x ", dev->in_buffer[i]);
                   ^~~~~~~~
   drivers/input/misc/keyspan_remote.c:132:3: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(codes + i * 3, 4, "%02x ", dev->in_buffer[i]);
                   ^~~~~~~~
>> drivers/input/misc/keyspan_remote.c:194:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(remote->data.buffer, remote->in_buffer, R=
ECV_SIZE);
                           ^~~~~~
   drivers/input/misc/keyspan_remote.c:194:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(remote->data.buffer, remote->in_buffer, R=
ECV_SIZE);
                           ^~~~~~
   drivers/input/misc/keyspan_remote.c:208:3: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(remote->data.buffer + remote->data.len, remote->i=
n_buffer, RECV_SIZE);
                   ^~~~~~
   drivers/input/misc/keyspan_remote.c:208:3: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(remote->data.buffer + remote->data.len, remote->i=
n_buffer, RECV_SIZE);
                   ^~~~~~
   drivers/input/misc/keyspan_remote.c:245:3: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(remote->data.buffer + remote->data.len, remote->i=
n_buffer, RECV_SIZE);
                   ^~~~~~
   drivers/input/misc/keyspan_remote.c:245:3: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(remote->data.buffer + remote->data.len, remote->i=
n_buffer, RECV_SIZE);
                   ^~~~~~
   drivers/input/misc/keyspan_remote.c:497:3: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(remote->name, sizeof(remote->name),
                   ^~~~~~~~
   drivers/input/misc/keyspan_remote.c:497:3: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(remote->name, sizeof(remote->name),
                   ^~~~~~~~
   drivers/input/misc/keyspan_remote.c:504:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(remote->keymap, keyspan_key_table, sizeof(remote->keymap)=
);
           ^~~~~~
   drivers/input/misc/keyspan_remote.c:504:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(remote->keymap, keyspan_key_table, sizeof(remote->keymap)=
);
           ^~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/hwmon/lm95234.c:215:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:215:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:229:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u", !!(data->status & mask));
                  ^~~~~~~
   drivers/hwmon/lm95234.c:229:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u", !!(data->status & mask));
                  ^~~~~~~
   drivers/hwmon/lm95234.c:242:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, data->sensor_type & mask ? "1\n" : "2\n");
                  ^~~~~~~
   drivers/hwmon/lm95234.c:242:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, data->sensor_type & mask ? "1\n" : "2\n");
                  ^~~~~~~
   drivers/hwmon/lm95234.c:286:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u", data->tcrit2[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:286:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u", data->tcrit2[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:325:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:325:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:335:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u", data->tcrit1[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:335:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u", data->tcrit1[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:374:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:374:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:415:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d", data->toffset[index] * 500);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:415:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d", data->toffset[index] * 500);
                  ^~~~~~~
   drivers/hwmon/lm95234.c:453:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n",
                  ^~~~~~~
   drivers/hwmon/lm95234.c:453:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n",
                  ^~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
   drivers/hwmon/amc6821.c:273:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp[ix] * 1000);
                  ^~~~~~~
   drivers/hwmon/amc6821.c:273:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp[ix] * 1000);
                  ^~~~~~~
   drivers/hwmon/amc6821.c:330:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "1");
                          ^~~~~~~
   drivers/hwmon/amc6821.c:330:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "1");
--
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:517:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(info->maps[i].virt)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:517:3: note: Taking false branch
                   if (IS_ERR(info->maps[i].virt)) {
                   ^
   drivers/mtd/maps/physmap-core.c:522:3: note: Loop condition is false.  E=
xiting loop
                   dev_notice(&dev->dev, "physmap platform flash device: %p=
R\n",
                   ^
   include/linux/dev_printk.h:148:2: note: expanded from macro 'dev_notice'
           dev_printk_index_wrap(_dev_notice, KERN_NOTICE, dev, dev_fmt(fmt=
), ##__VA_ARGS__)
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
   drivers/mtd/maps/physmap-core.c:525:7: note: Assuming field 'name' is no=
n-null
                   if (!info->maps[i].name)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:525:3: note: Taking false branch
                   if (!info->maps[i].name)
                   ^
   drivers/mtd/maps/physmap-core.c:528:7: note: Assuming field 'phys' is no=
t equal to 0
                   if (!info->maps[i].phys)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:528:3: note: Taking false branch
                   if (!info->maps[i].phys)
                   ^
   drivers/mtd/maps/physmap-core.c:533:14: note: Field 'gpios' is null
                                            (info->gpios ?
                                                   ^
   drivers/mtd/maps/physmap-core.c:533:8: note: '?' condition is false
                                            (info->gpios ?
                                             ^
   drivers/mtd/maps/physmap-core.c:532:24: note: The result of the left shi=
ft is undefined due to shifting by '4294967295', which is greater or equal =
to the width of type 'unsigned long'
                   info->maps[i].size =3D BIT(info->win_order +
                                        ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   Suppressed 32 warnings (25 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   fs/gfs2/main.c:45:2: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memset(&ip->i_res, 0, sizeof(ip->i_res));
           ^~~~~~
   fs/gfs2/main.c:45:2: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
           memset(&ip->i_res, 0, sizeof(ip->i_res));
           ^~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (55 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   fs/gfs2/aops.c:457:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
           ^~~~~~
   fs/gfs2/aops.c:457:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
           ^~~~~~
   fs/gfs2/aops.c:458:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
           ^~~~~~
   fs/gfs2/aops.c:458:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
           ^~~~~~
   fs/gfs2/aops.c:530:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf + copied, p + offset, amt);
                   ^~~~~~
   fs/gfs2/aops.c:530:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(buf + copied, p + offset, amt);
                   ^~~~~~
   Suppressed 62 warnings (55 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
>> drivers/iio/adc/ad7192.c:436:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(st->mode & AD7192_MODE_ACX));
                  ^~~~~~~
   drivers/iio/adc/ad7192.c:436:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(st->mode & AD7192_MODE_ACX));
                  ^~~~~~~
   drivers/iio/adc/ad7192.c:446:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(st->gpocon & AD7192_GPOCON_BPDSW)=
);
                  ^~~~~~~
   drivers/iio/adc/ad7192.c:446:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(st->gpocon & AD7192_GPOCON_BPDSW)=
);
                  ^~~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/iio/adc/ad7266.c:26:8: warning: Excessive padding in 'struct ad7=
266_state' (95 padding bytes, where 31 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   reg, =

   vref_mv, =

   gpios, =

   single_msg, =

   single_xfer, =

   range, =

   mode, =

   fixed_addr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7266_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7266.c:26:8: note: Excessive padding in 'struct ad7266=
_state' (95 padding bytes, where 31 is optimal). Optimal fields order: data=
, spi, reg, vref_mv, gpios, single_msg, single_xfer, range, mode, fixed_add=
r, consider reordering the fields or adding explicit padding members
   struct ad7266_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7266.c:157:3: warning: Value stored to 'ret' is never =
read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ad7266_read_single(st, val, chan->address);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad7266.c:157:3: note: Value stored to 'ret' is never read
                   ret =3D ad7266_read_single(st, val, chan->address);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/spi/spi-xcomm.c:117:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(spi_xcomm->buf + 1, t->tx_buf, t->len);
                   ^~~~~~
   drivers/spi/spi-xcomm.c:117:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(spi_xcomm->buf + 1, t->tx_buf, t->len);
                   ^~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/spi/spi-zynqmp-gqspi.c:347:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(xqspi->rxbuf, &data, size);
           ^~~~~~
   drivers/spi/spi-zynqmp-gqspi.c:347:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(xqspi->rxbuf, &data, size);
           ^~~~~~
   drivers/spi/spi-zynqmp-gqspi.c:513:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&intermediate, xqspi->txbuf, 4);
                           ^~~~~~
   drivers/spi/spi-zynqmp-gqspi.c:513:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&intermediate, xqspi->txbuf, 4);
                           ^~~~~~
   drivers/spi/spi-zynqmp-gqspi.c:518:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&intermediate, xqspi->txbuf,
                           ^~~~~~
   drivers/spi/spi-zynqmp-gqspi.c:518:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&intermediate, xqspi->txbuf,
                           ^~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/mtd/inftlmount.c:104:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(mh, buf, sizeof(struct INFTLMediaHeader));
                   ^~~~~~
   drivers/mtd/inftlmount.c:104:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(mh, buf, sizeof(struct INFTLMediaHeader));
                   ^~~~~~
   drivers/mtd/inftlmount.c:371:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(instr, 0, sizeof(struct erase_info));
           ^~~~~~
   drivers/mtd/inftlmount.c:371:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(instr, 0, sizeof(struct erase_info));
           ^~~~~~
   drivers/mtd/inftlmount.c:550:2: warning: Value stored to 'logical_block'=
 is never read [clang-analyzer-deadcode.DeadStores]
           logical_block =3D block =3D BLOCK_NIL;
           ^               ~~~~~~~~~~~~~~~~~
   drivers/mtd/inftlmount.c:550:2: note: Value stored to 'logical_block' is=
 never read
           logical_block =3D block =3D BLOCK_NIL;
           ^               ~~~~~~~~~~~~~~~~~
   drivers/mtd/inftlmount.c:550:18: warning: Although the value stored to '=
block' is used in the enclosing expression, the value is never actually rea=
d from 'block' [clang-analyzer-deadcode.DeadStores]
           logical_block =3D block =3D BLOCK_NIL;
                           ^
   drivers/mtd/inftlmount.c:550:18: note: Although the value stored to 'blo=
ck' is used in the enclosing expression, the value is never actually read f=
rom 'block'
   drivers/mtd/inftlmount.c:693:3: warning: Value stored to 'logical_block'=
 is never read [clang-analyzer-deadcode.DeadStores]
--
           ^
   drivers/iio/pressure/dps310.c:297:23: note: '?' condition is true
           return scale_factors[ilog2(rc)];
                                ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/iio/pressure/dps310.c:297:23: note: Calling '__ilog2_u32'
           return scale_factors[ilog2(rc)];
                                ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   drivers/iio/pressure/dps310.c:297:23: note: Returning from '__ilog2_u32'
           return scale_factors[ilog2(rc)];
                                ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   drivers/iio/pressure/dps310.c:297:2: note: Undefined or garbage value re=
turned to caller
           return scale_factors[ilog2(rc)];
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/dps310.c:754:2: warning: Value stored to 'rc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           rc =3D regmap_write(data->regmap, DPS310_PRS_CFG, 0);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/dps310.c:754:2: note: Value stored to 'rc' is never=
 read
           rc =3D regmap_write(data->regmap, DPS310_PRS_CFG, 0);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/iio/common/ms_sensors/ms_sensors_i2c.c:327:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (config_reg & 0x40) >> 6);
                  ^~~~~~~
   drivers/iio/common/ms_sensors/ms_sensors_i2c.c:327:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (config_reg & 0x40) >> 6);
                  ^~~~~~~
   drivers/iio/common/ms_sensors/ms_sensors_i2c.c:354:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (config_reg & 0x4) >> 2);
                  ^~~~~~~
   drivers/iio/common/ms_sensors/ms_sensors_i2c.c:354:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (config_reg & 0x4) >> 2);
                  ^~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (41 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/power/supply/bq24190_charger.c:1729:2: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(bdi->model_name, id->name, I2C_NAME_SIZE);
           ^~~~~~~
   drivers/power/supply/bq24190_charger.c:1729:2: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(bdi->model_name, id->name, I2C_NAME_SIZE);
           ^~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/power/supply/bq2515x_charger.c:1095:2: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(bq2515x->model_name, id->name, I2C_NAME_SIZE);
           ^~~~~~~
   drivers/power/supply/bq2515x_charger.c:1095:2: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(bq2515x->model_name, id->name, I2C_NAME_SIZE);
           ^~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
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
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
>> drivers/iio/common/ssp_sensors/ssp_spi.c:99:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(msg->buffer, &h, SSP_HEADER_SIZE);
           ^~~~~~
   drivers/iio/common/ssp_sensors/ssp_spi.c:99:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(msg->buffer, &h, SSP_HEADER_SIZE);
           ^~~~~~
   drivers/iio/common/ssp_sensors/ssp_spi.c:112:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&m->buffer[SSP_HEADER_SIZE_ALIGNED + offset], src, len);
           ^~~~~~
   drivers/iio/common/ssp_sensors/ssp_spi.c:112:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&m->buffer[SSP_HEADER_SIZE_ALIGNED + offset], src, len);
           ^~~~~~
   drivers/iio/common/ssp_sensors/ssp_spi.c:118:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dest, &m->buffer[SSP_HEADER_SIZE_ALIGNED + offset],  len);
           ^~~~~~
   drivers/iio/common/ssp_sensors/ssp_spi.c:118:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dest, &m->buffer[SSP_HEADER_SIZE_ALIGNED + offset],  len);
           ^~~~~~
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/iio/magnetometer/rm3100-core.c:489:4: warning: Call to function =
'memmove' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memmove_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(data->buffer + i * 4, data->buffer + i *=
 3, 3);
                           ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:489:4: note: Call to function 'me=
mmove' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memmove_s' in case of C11
                           memmove(data->buffer + i * 4, data->buffer + i *=
 3, 3);
                           ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:496:3: warning: Call to function =
'memmove' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memmove_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(data->buffer + 4, data->buffer + 3, 3);
                   ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:496:3: note: Call to function 'me=
mmove' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(data->buffer + 4, data->buffer + 3, 3);
                   ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:503:3: warning: Call to function =
'memmove' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memmove_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(data->buffer + 4, data->buffer + 3, 3);
                   ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:503:3: note: Call to function 'me=
mmove' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(data->buffer + 4, data->buffer + 3, 3);
                   ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:510:3: warning: Call to function =
'memmove' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memmove_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(data->buffer + 4, data->buffer + 6, 3);
                   ^~~~~~~
   drivers/iio/magnetometer/rm3100-core.c:510:3: note: Call to function 'me=
mmove' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(data->buffer + 4, data->buffer + 6, 3);
                   ^~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/hid/hid-input.c:146:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ke->scancode, &scancode, sizeof(scancode));
                   ^~~~~~
   drivers/hid/hid-input.c:146:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(ke->scancode, &scancode, sizeof(scancode));
                   ^~~~~~
   drivers/hid/hid-input.c:2056:2: warning: Use of memory after it is freed=
 [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(hidinput, next, &hid->inputs, list) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/hid/hid-input.c:1956:2: note: Loop condition is false.  Exiting =
loop
           INIT_WORK(&hid->led_work, hidinput_led_worker);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/hid/hid-input.c:1960:6: note: Assuming 'force' is not equal to 0
           if (!force) {
               ^~~~~~
   drivers/hid/hid-input.c:1960:2: note: Taking false branch
           if (!force) {
           ^
   drivers/hid/hid-input.c:1975:2: note: Loop condition is true.  Entering =
loop body
           for (k =3D HID_INPUT_REPORT; k <=3D HID_OUTPUT_REPORT; k++) {
           ^
   drivers/hid/hid-input.c:1976:7: note: 'k' is not equal to HID_OUTPUT_REP=
ORT
                   if (k =3D=3D HID_OUTPUT_REPORT &&
                       ^
   drivers/hid/hid-input.c:1976:30: note: Left side of '&&' is false
                   if (k =3D=3D HID_OUTPUT_REPORT &&
                                              ^
   drivers/hid/hid-input.c:1980:3: note: Loop condition is false. Execution=
 continues on line 1975
                   list_for_each_entry(report, &hid->report_enum[k].report_=
list, list) {
                   ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
--
                  ^~~~~~~
   drivers/hwmon/lm77.c:151:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   drivers/hwmon/lm77.c:208:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/lm77.c:208:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/hwmon/lm78.c:147:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:147:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in[attr->index]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:155:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:155:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:163:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:163:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:233:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp));
                  ^~~~~~~
   drivers/hwmon/lm78.c:233:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp));
                  ^~~~~~~
   drivers/hwmon/lm78.c:240:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_over));
                  ^~~~~~~
   drivers/hwmon/lm78.c:240:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_over));
                  ^~~~~~~
   drivers/hwmon/lm78.c:266:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_hyst));
                  ^~~~~~~
   drivers/hwmon/lm78.c:266:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_hyst));
                  ^~~~~~~
   drivers/hwmon/lm78.c:299:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:299:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:309:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:309:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
                  ^~~~~~~
   drivers/hwmon/lm78.c:338:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[attr->ind=
ex]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:338:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[attr->ind=
ex]));
                  ^~~~~~~
   drivers/hwmon/lm78.c:423:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, 82));
                  ^~~~~~~
   drivers/hwmon/lm78.c:423:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, 82));
                  ^~~~~~~
   drivers/hwmon/lm78.c:432:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/lm78.c:432:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/lm78.c:441:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> nr) & 1);
                  ^~~~~~~
   drivers/hwmon/lm78.c:441:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> nr) & 1);
                  ^~~~~~~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
>> drivers/hid/usbhid/usbkbd.c:143:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kbd->old, kbd->new, 8);
           ^~~~~~
   drivers/hid/usbhid/usbkbd.c:143:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(kbd->old, kbd->new, 8);
           ^~~~~~
>> drivers/hid/usbhid/usbkbd.c:306:3: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(kbd->name, sizeof(kbd->name),
                   ^~~~~~~~
   drivers/hid/usbhid/usbkbd.c:306:3: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(kbd->name, sizeof(kbd->name),
                   ^~~~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/hid/usbhid/usbmouse.c:154:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mouse->name, sizeof(mouse->name),
                   ^~~~~~~~
   drivers/hid/usbhid/usbmouse.c:154:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(mouse->name, sizeof(mouse->name),
                   ^~~~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/usb/gadget/udc/core.c:1663:9: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           return sprintf(buf, "%s\n", usb_state_string(gadget->state));
                  ^~~~~~~
   drivers/usb/gadget/udc/core.c:1663:9: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
           return sprintf(buf, "%s\n", usb_state_string(gadget->state));
                  ^~~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
>> drivers/usb/gadget/udc/dummy_hcd.c:728:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dum->fifo_buf, _req->buf, _req->length);
                   ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:728:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dum->fifo_buf, _req->buf, _req->length);
                   ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:1349:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ubuf, rbuf, len);
                           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:1349:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ubuf, rbuf, len);
                           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:1351:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(rbuf, ubuf, len);
                           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:1351:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(rbuf, ubuf, len);
                           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:1378:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ubuf, rbuf, this_sg);
                           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:1378:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ubuf, rbuf, this_sg);
                           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:1380:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(rbuf, ubuf, this_sg);
                           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:1380:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(rbuf, ubuf, this_sg);
                           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:1957:4: warning: Value stored to 'lim=
it' is never read [clang-analyzer-deadcode.DeadStores]
                           limit =3D max(limit, periodic_bytes(dum, ep));
                           ^
   drivers/usb/gadget/udc/dummy_hcd.c:1957:4: note: Value stored to 'limit'=
 is never read
>> drivers/usb/gadget/udc/dummy_hcd.c:2068:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(desc, 0, sizeof *desc);
           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2068:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(desc, 0, sizeof *desc);
           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2081:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(desc, 0, sizeof *desc);
           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2081:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(desc, 0, sizeof *desc);
           ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2176:3: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, &usb3_bos_desc, sizeof(usb3_bos_desc));
                   ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2176:3: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, &usb3_bos_desc, sizeof(usb3_bos_desc));
                   ^~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2837:8: warning: Access to field 'hs_=
hcd' results in a dereference of a null pointer [clang-analyzer-core.NullDe=
reference]
                   if (!dum[i]->hs_hcd ||
                        ^~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2772:2: note: Initializing to a null =
pointer value
           struct  dummy *dum[MAX_NUM_UDC] =3D {};
           ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2774:6: note: Assuming the condition =
is false
           if (usb_disabled())
               ^~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2774:2: note: Taking false branch
           if (usb_disabled())
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2777:6: note: Assuming field 'is_high=
_speed' is true
           if (!mod_data.is_high_speed && mod_data.is_super_speed)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2777:30: note: Left side of '&&' is f=
alse
           if (!mod_data.is_high_speed && mod_data.is_super_speed)
                                       ^
   drivers/usb/gadget/udc/dummy_hcd.c:2780:6: note: Assuming field 'num' is=
 >=3D 1
           if (mod_data.num < 1 || mod_data.num > MAX_NUM_UDC) {
               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2780:6: note: Left side of '||' is fa=
lse
   drivers/usb/gadget/udc/dummy_hcd.c:2780:26: note: Assuming field 'num' i=
s <=3D MAX_NUM_UDC
           if (mod_data.num < 1 || mod_data.num > MAX_NUM_UDC) {
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2780:2: note: Taking false branch
           if (mod_data.num < 1 || mod_data.num > MAX_NUM_UDC) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2786:14: note: 'i' is < field 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^
   drivers/usb/gadget/udc/dummy_hcd.c:2786:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2788:7: note: Assuming the condition =
is false
                   if (!the_hcd_pdev[i]) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2788:3: note: Taking false branch
                   if (!the_hcd_pdev[i]) {
                   ^
   drivers/usb/gadget/udc/dummy_hcd.c:2786:14: note: Assuming 'i' is >=3D f=
ield 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2786:2: note: Loop condition is false=
. Execution continues on line 2795
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2795:14: note: Assuming 'i' is >=3D f=
ield 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2795:2: note: Loop condition is false=
. Execution continues on line 2804
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2804:2: note: Loop condition is false=
. Execution continues on line 2820
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2821:6: note: Assuming 'retval' is >=
=3D 0
           if (retval < 0)
               ^~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2821:2: note: Taking false branch
           if (retval < 0)
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2824:6: note: Assuming 'retval' is >=
=3D 0
           if (retval < 0)
               ^~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2824:2: note: Taking false branch
           if (retval < 0)
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2827:14: note: Assuming 'i' is < fiel=
d 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2827:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2829:7: note: Assuming 'retval' is >=
=3D 0
                   if (retval < 0) {
                       ^~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2829:3: note: Taking false branch
                   if (retval < 0) {
                   ^
   drivers/usb/gadget/udc/dummy_hcd.c:2827:14: note: Assuming 'i' is >=3D f=
ield 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2827:2: note: Loop condition is false=
. Execution continues on line 2836
--
   reg, =

   chip_info, =

   msg, =

   start_conv_msg, =

   start_conv_transfer, =

   lock, =

   transfer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct mcp320x {
   ~~~~~~~^~~~~~~~~
   drivers/iio/adc/mcp320x.c:84:8: note: Excessive padding in 'struct mcp32=
0x' (67 padding bytes, where 3 is optimal). Optimal fields order: tx_buf, r=
x_buf, spi, reg, chip_info, msg, start_conv_msg, start_conv_transfer, lock,=
 transfer, consider reordering the fields or adding explicit padding members
   struct mcp320x {
   ~~~~~~~^~~~~~~~~
   drivers/iio/adc/mcp320x.c:134:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&adc->rx_buf, 0, sizeof(adc->rx_buf));
           ^~~~~~
   drivers/iio/adc/mcp320x.c:134:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&adc->rx_buf, 0, sizeof(adc->rx_buf));
           ^~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/usb/gadget/function/f_printer.c:385:2: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
           DBG(dev, "printer_close\n");
           ^
   include/linux/usb/composite.h:637:11: note: expanded from macro 'DBG'
           dev_dbg(&(d)->gadget->dev , fmt , ## args)
           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:158:25: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:22: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                      ^~~
   drivers/usb/gadget/function/f_printer.c:377:2: note: Loop condition is f=
alse.  Exiting loop
           spin_lock_irqsave(&dev->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/usb/gadget/function/f_printer.c:377:2: note: Loop condition is f=
alse.  Exiting loop
           spin_lock_irqsave(&dev->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/usb/gadget/function/f_printer.c:384:2: note: Calling 'kref_put'
           kref_put(&dev->kref, printer_dev_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'printer_dev_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/gadget/function/f_printer.c:228:2: note: Memory is released
           kfree(dev);
           ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/gadget/function/f_printer.c:384:2: note: Returning; memory w=
as released
           kref_put(&dev->kref, printer_dev_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_printer.c:385:2: note: Loop condition is f=
alse.  Exiting loop
           DBG(dev, "printer_close\n");
           ^
   include/linux/usb/composite.h:637:2: note: expanded from macro 'DBG'
           dev_dbg(&(d)->gadget->dev , fmt , ## args)
           ^
   include/linux/dev_printk.h:158:2: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:128:3: note: expanded from macro 'dev_printk'
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
   drivers/usb/gadget/function/f_printer.c:385:2: note: Use of memory after=
 it is freed
           DBG(dev, "printer_close\n");
           ^
   include/linux/usb/composite.h:637:11: note: expanded from macro 'DBG'
           dev_dbg(&(d)->gadget->dev , fmt , ## args)
           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:158:25: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:22: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                      ^~~
>> drivers/usb/gadget/function/f_printer.c:1010:4: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf + 2, dev->pnp_string, value);
                           ^~~~~~
   drivers/usb/gadget/function/f_printer.c:1010:4: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf + 2, dev->pnp_string, value);
                           ^~~~~~
>> drivers/usb/gadget/function/f_printer.c:1271:11: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           result =3D sprintf(page, "%d\n", opts->q_len);
                    ^~~~~~~
   drivers/usb/gadget/function/f_printer.c:1271:11: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
           result =3D sprintf(page, "%d\n", opts->q_len);
                    ^~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/iio/industrialio-event.c:542:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ev_int->group.attrs,
                   ^~~~~~
   drivers/iio/industrialio-event.c:542:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ev_int->group.attrs,
                   ^~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/iio/industrialio-buffer.c:841:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(config, 0, sizeof(*config));
           ^~~~~~
   drivers/iio/industrialio-buffer.c:841:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(config, 0, sizeof(*config));
           ^~~~~~
   drivers/iio/industrialio-buffer.c:854:2: warning: Dereference of null po=
inter [clang-analyzer-core.NullDereference]
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:640:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/iio/industrialio-buffer.c:1303:8: note: Calling 'strtobool'
           ret =3D strtobool(buf, &requested_state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kstrtox.h:152:9: note: Value assigned to 'requested_state'=
, which participates in a condition later
           return kstrtobool(s, res);
                  ^~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1303:8: note: Returning from 'strtoboo=
l'
           ret =3D strtobool(buf, &requested_state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1304:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/industrialio-buffer.c:1304:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/industrialio-buffer.c:1312:6: note: Assuming 'inlist' is not=
 equal to 'requested_state'
           if (inlist =3D=3D requested_state)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1312:2: note: Taking false branch
           if (inlist =3D=3D requested_state)
           ^
   drivers/iio/industrialio-buffer.c:1315:6: note: Assuming 'requested_stat=
e' is true
           if (requested_state)
               ^~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1315:2: note: Taking true branch
           if (requested_state)
           ^
   drivers/iio/industrialio-buffer.c:1316:9: note: Calling '__iio_update_bu=
ffers'
                   ret =3D __iio_update_buffers(indio_dev, buffer, NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1197:8: note: Calling 'iio_verify_upda=
te'
           ret =3D iio_verify_update(indio_dev, insert_buffer, remove_buffe=
r,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:834:6: note: 'insert_buffer' is non-nu=
ll
           if (insert_buffer &&
               ^~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:834:6: note: Left side of '&&' is true
   drivers/iio/industrialio-buffer.c:835:6: note: Calling 'bitmap_empty'
               bitmap_empty(insert_buffer->scan_mask, indio_dev->masklength=
)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:385:6: note: Left side of '&&' is false
           if (small_const_nbits(nbits))
               ^
   include/asm-generic/bitsperlong.h:36:31: note: expanded from macro 'smal=
l_const_nbits'
           (__builtin_constant_p(nbits) && (nbits) <=3D BITS_PER_LONG && (n=
bits) > 0)
                                        ^
   include/linux/bitmap.h:388:9: note: Assuming the condition is false
           return find_first_bit(src, nbits) =3D=3D nbits;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:388:2: note: Returning zero, which participates i=
n a condition later
           return find_first_bit(src, nbits) =3D=3D nbits;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:835:6: note: Returning from 'bitmap_em=
pty'
               bitmap_empty(insert_buffer->scan_mask, indio_dev->masklength=
)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:834:2: note: Taking false branch
           if (insert_buffer &&
           ^
   drivers/iio/industrialio-buffer.c:848:6: note: 'remove_buffer' is null
--
   fs/btrfs/disk-io.c:228:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(result, 0, BTRFS_CSUM_SIZE);
           ^~~~~~
   fs/btrfs/disk-io.c:228:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(result, 0, BTRFS_CSUM_SIZE);
           ^~~~~~
   fs/btrfs/disk-io.c:1137:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&root->root_key, 0, sizeof(root->root_key));
           ^~~~~~
   fs/btrfs/disk-io.c:1137:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&root->root_key, 0, sizeof(root->root_key));
           ^~~~~~
   fs/btrfs/disk-io.c:1138:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&root->root_item, 0, sizeof(root->root_item));
           ^~~~~~
   fs/btrfs/disk-io.c:1138:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&root->root_item, 0, sizeof(root->root_item));
           ^~~~~~
   fs/btrfs/disk-io.c:1139:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&root->defrag_progress, 0, sizeof(root->defrag_progress));
           ^~~~~~
   fs/btrfs/disk-io.c:1139:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&root->defrag_progress, 0, sizeof(root->defrag_progress));
           ^~~~~~
   fs/btrfs/disk-io.c:2107:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(root_backup, 0, sizeof(*root_backup));
           ^~~~~~
   fs/btrfs/disk-io.c:2107:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(root_backup, 0, sizeof(*root_backup));
           ^~~~~~
   fs/btrfs/disk-io.c:2166:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&info->super_copy->super_roots,
           ^~~~~~
   fs/btrfs/disk-io.c:2166:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&info->super_copy->super_roots,
           ^~~~~~
   fs/btrfs/disk-io.c:2367:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&BTRFS_I(inode)->location, 0, sizeof(struct btrfs_key));
           ^~~~~~
   fs/btrfs/disk-io.c:2367:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&BTRFS_I(inode)->location, 0, sizeof(struct btrfs_key));
           ^~~~~~
   fs/btrfs/disk-io.c:3438:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(fs_info->super_copy, disk_super, sizeof(*fs_info->super_c=
opy));
           ^~~~~~
   fs/btrfs/disk-io.c:3438:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(fs_info->super_copy, disk_super, sizeof(*fs_info->super_c=
opy));
           ^~~~~~
   fs/btrfs/disk-io.c:3452:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(fs_info->super_for_commit, fs_info->super_copy,
           ^~~~~~
   fs/btrfs/disk-io.c:3452:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(fs_info->super_for_commit, fs_info->super_copy,
           ^~~~~~
   fs/btrfs/disk-io.c:3483:3: warning: Value stored to 'features' is never =
read [clang-analyzer-deadcode.DeadStores]
                   features |=3D BTRFS_FEATURE_INCOMPAT_BIG_METADATA;
                   ^
   fs/btrfs/disk-io.c:3483:3: note: Value stored to 'features' is never read
   fs/btrfs/disk-io.c:3585:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sb->s_uuid, fs_info->fs_devices->fsid, BTRFS_FSID_SIZE);
           ^~~~~~
   fs/btrfs/disk-io.c:3585:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&sb->s_uuid, fs_info->fs_devices->fsid, BTRFS_FSID_SIZE);
           ^~~~~~
   fs/btrfs/disk-io.c:4025:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(disk_super, sb, BTRFS_SUPER_INFO_SIZE);
                   ^~~~~~
   fs/btrfs/disk-io.c:4025:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(disk_super, sb, BTRFS_SUPER_INFO_SIZE);
                   ^~~~~~
   fs/btrfs/disk-io.c:4338:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev_item->uuid, dev->uuid, BTRFS_UUID_SIZE);
                   ^~~~~~
   fs/btrfs/disk-io.c:4338:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(dev_item->uuid, dev->uuid, BTRFS_UUID_SIZE);
                   ^~~~~~
   fs/btrfs/disk-io.c:4339:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev_item->fsid, dev->fs_devices->metadata_uuid,
                   ^~~~~~
   fs/btrfs/disk-io.c:4339:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(dev_item->fsid, dev->fs_devices->metadata_uuid,
                   ^~~~~~
   Suppressed 62 warnings (55 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/input/keyboard/lkkbd.c:627:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lk->keycode, lkkbd_keycode, sizeof(lk->keycode));
           ^~~~~~
   drivers/input/keyboard/lkkbd.c:627:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(lk->keycode, lkkbd_keycode, sizeof(lk->keycode));
           ^~~~~~
   drivers/input/keyboard/lkkbd.c:630:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(lk->phys, sizeof(lk->phys), "%s/input0", serio->phys);
           ^~~~~~~~
   drivers/input/keyboard/lkkbd.c:630:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(lk->phys, sizeof(lk->phys), "%s/input0", serio->phys);
           ^~~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
>> drivers/usb/gadget/function/f_tcm.c:1084:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cmd, 0, sizeof(*cmd));
           ^~~~~~
   drivers/usb/gadget/function/f_tcm.c:1084:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(cmd, 0, sizeof(*cmd));
           ^~~~~~
>> drivers/usb/gadget/function/f_tcm.c:1126:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd->cmd_buf, cmd_iu->cdb, cmd_len);
           ^~~~~~
   drivers/usb/gadget/function/f_tcm.c:1126:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd->cmd_buf, cmd_iu->cdb, cmd_len);
           ^~~~~~
   drivers/usb/gadget/function/f_tcm.c:1234:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd->cmd_buf, cbw->CDB, cmd_len);
           ^~~~~~
   drivers/usb/gadget/function/f_tcm.c:1234:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd->cmd_buf, cbw->CDB, cmd_len);
           ^~~~~~
>> drivers/usb/gadget/function/f_tcm.c:1472:2: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(tport->tport_name, sizeof(tport->tport_name), "%s", wnn=
_name);
           ^~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:1472:2: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(tport->tport_name, sizeof(tport->tport_name), "%s", wnn=
_name);
           ^~~~~~~~
>> drivers/usb/gadget/function/f_tcm.c:1488:9: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "usb-gadget fabric module\n");
                  ^~~~~~~
   drivers/usb/gadget/function/f_tcm.c:1488:9: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "usb-gadget fabric module\n");
                  ^~~~~~~
   drivers/usb/gadget/function/f_tcm.c:1531:8: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(page, PAGE_SIZE, "%s\n",
                 ^~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:1531:8: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(page, PAGE_SIZE, "%s\n",
                 ^~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:1641:2: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(i_port, USBG_NAMELEN, "%s", page);
           ^~~~~~~~
   drivers/usb/gadget/function/f_tcm.c:1641:2: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(i_port, USBG_NAMELEN, "%s", page);
           ^~~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (49 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/iio/adc/ad_sigma_delta.c:196:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0xff, size);
           ^~~~~~
   drivers/iio/adc/ad_sigma_delta.c:196:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0xff, size);
           ^~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/scsi/libsas/sas_scsi_host.c:87:4: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(sc->sense_buffer, ts->buf,
                           ^~~~~~
   drivers/scsi/libsas/sas_scsi_host.c:87:4: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(sc->sense_buffer, ts->buf,
                           ^~~~~~
   drivers/scsi/libsas/sas_scsi_host.c:150:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(task->ssp_task.LUN, &lun.scsi_lun, 8);
           ^~~~~~
   drivers/scsi/libsas/sas_scsi_host.c:150:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(task->ssp_task.LUN, &lun.scsi_lun, 8);
           ^~~~~~
   Suppressed 62 warnings (55 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/scsi/libsas/sas_task.c:27:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(tstat->buf, iu->sense_data, tstat->buf_valid_size=
);
                   ^~~~~~
   drivers/scsi/libsas/sas_task.c:27:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(tstat->buf, iu->sense_data, tstat->buf_valid_size=
);
                   ^~~~~~
   Suppressed 62 warnings (55 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   drivers/scsi/st.c:528:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(SRpnt->sense, rq->sense, SCSI_SENSE_BUFFERSIZE);
                   ^~~~~~
   drivers/scsi/st.c:528:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(SRpnt->sense, rq->sense, SCSI_SENSE_BUFFERSIZE);
                   ^~~~~~
   drivers/scsi/st.c:578:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rq->cmd, 0, BLK_MAX_CDB);
           ^~~~~~
   drivers/scsi/st.c:578:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(rq->cmd, 0, BLK_MAX_CDB);
           ^~~~~~
   drivers/scsi/st.c:579:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rq->cmd, cmd, rq->cmd_len);
           ^~~~~~
   drivers/scsi/st.c:579:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(rq->cmd, cmd, rq->cmd_len);
           ^~~~~~
   drivers/scsi/st.c:637:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(SRpnt->cmd, cmd, sizeof(SRpnt->cmd));
           ^~~~~~
   drivers/scsi/st.c:637:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(SRpnt->cmd, cmd, sizeof(SRpnt->cmd));
           ^~~~~~
   drivers/scsi/st.c:779:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cmd, 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:779:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(cmd, 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:974:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset((void *) &cmd[0], 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:974:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset((void *) &cmd[0], 0, MAX_COMMAND_SIZE);
--
                  ^~~~~~~
   drivers/fpga/dfl.c:318:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%x\n", ddev->feature_id);
                  ^~~~~~~
   drivers/fpga/dfl.c:318:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%x\n", ddev->feature_id);
                  ^~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/fpga/dfl-afu-main.c:175:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%x\n", (u8)FIELD_GET(PORT_CTRL_LATENCY, v));
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:175:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%x\n", (u8)FIELD_GET(PORT_CTRL_LATENCY, v));
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:216:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%x\n", (u8)FIELD_GET(PORT_STS_AP1_EVT, v));
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:216:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%x\n", (u8)FIELD_GET(PORT_STS_AP1_EVT, v));
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:254:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%x\n", (u8)FIELD_GET(PORT_STS_AP2_EVT, v));
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:254:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%x\n", (u8)FIELD_GET(PORT_STS_AP2_EVT, v));
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:291:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%x\n", (u8)FIELD_GET(PORT_STS_PWR_STATE, =
v));
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:291:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%x\n", (u8)FIELD_GET(PORT_STS_PWR_STATE, =
v));
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:351:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%llx\n", (unsigned long long)userclk_freq=
sts);
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:351:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%llx\n", (unsigned long long)userclk_freq=
sts);
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:369:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%llx\n",
                  ^~~~~~~
   drivers/fpga/dfl-afu-main.c:369:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%llx\n",
                  ^~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   lib/kobject.c:156:3: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                   memcpy(path + length, kobject_name(parent), cur);
                   ^~~~~~
   lib/kobject.c:156:3: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
                   memcpy(path + length, kobject_name(parent), cur);
                   ^~~~~~
   lib/kobject.c:516:2: warning: Call to function 'sprintf' is insecure as =
it does not provide bounding of the memory buffer or security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(devpath_string, "DEVPATH_OLD=3D%s", devpath);
           ^~~~~~~
   lib/kobject.c:516:2: note: Call to function 'sprintf' is insecure as it =
does not provide bounding of the memory buffer or security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(devpath_string, "DEVPATH_OLD=3D%s", devpath);
           ^~~~~~~
   lib/kobject.c:582:2: warning: Call to function 'sprintf' is insecure as =
it does not provide bounding of the memory buffer or security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(devpath_string, "DEVPATH_OLD=3D%s", devpath);
           ^~~~~~~
   lib/kobject.c:582:2: note: Call to function 'sprintf' is insecure as it =
does not provide bounding of the memory buffer or security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(devpath_string, "DEVPATH_OLD=3D%s", devpath);
           ^~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/iio/adc/ti-ads8688.c:64:8: warning: Excessive padding in 'struct=
 ads8688_state' (92 padding bytes, where 28 is optimal). =

   Optimal fields order: =

   data, =

   chip_info, =

   spi, =

   reg, =

   lock, =

   vref_mv, =

   range, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ads8688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads8688.c:64:8: note: Excessive padding in 'struct ad=
s8688_state' (92 padding bytes, where 28 is optimal). Optimal fields order:=
 data, chip_info, spi, reg, lock, vref_mv, range, consider reordering the f=
ields or adding explicit padding members
   struct ads8688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
>> drivers/iio/adc/ti-ads8688.c:123:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0.%09u 0.%09u 0.%09u\n",
                  ^~~~~~~
   drivers/iio/adc/ti-ads8688.c:123:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0.%09u 0.%09u 0.%09u\n",
                  ^~~~~~~
   drivers/iio/adc/ti-ads8688.c:132:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d %d\n", ads8688_range_def[0].offset,
                  ^~~~~~~
   drivers/iio/adc/ti-ads8688.c:132:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d %d\n", ads8688_range_def[0].offset,
                  ^~~~~~~
   Suppressed 59 warnings (51 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/iio/adc/ti-tlc4541.c:33:8: warning: Excessive padding in 'struct=
 tlc4541_state' (72 padding bytes, where 8 is optimal). =

   Optimal fields order: =

   rx_buf, =

   spi, =

   reg, =

   scan_single_msg, =

   scan_single_xfer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct tlc4541_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tlc4541.c:33:8: note: Excessive padding in 'struct tl=
c4541_state' (72 padding bytes, where 8 is optimal). Optimal fields order: =
rx_buf, spi, reg, scan_single_msg, scan_single_xfer, consider reordering th=
e fields or adding explicit padding members
   struct tlc4541_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/hwtracing/intel_th/gth.c:157:11: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   count =3D snprintf(buf, PAGE_SIZE, "%x\n", port);
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:157:11: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   count =3D snprintf(buf, PAGE_SIZE, "%x\n", port);
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:159:11: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   count =3D snprintf(buf, PAGE_SIZE, "disabled\n");
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:159:11: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   count =3D snprintf(buf, PAGE_SIZE, "disabled\n");
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:335:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           count =3D snprintf(buf, PAGE_SIZE, "%x\n",
                   ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:335:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           count =3D snprintf(buf, PAGE_SIZE, "%x\n",
                   ^~~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/iio/adc/ad7292.c:78:8: warning: Excessive padding in 'struct ad7=
292_state' (106 padding bytes, where 42 is optimal). =

   Optimal fields order: =

   d16, =

   vref_mv, =

   d8, =

   spi, =

   reg, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7292_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7292.c:78:8: note: Excessive padding in 'struct ad7292=
_state' (106 padding bytes, where 42 is optimal). Optimal fields order: d16=
, vref_mv, d8, spi, reg, consider reordering the fields or adding explicit =
padding members
   struct ad7292_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/iio/adc/ad7923.c:48:8: warning: Excessive padding in 'struct ad7=
923_state' (76 padding bytes, where 12 is optimal). =

   Optimal fields order: =

   rx_buf, =

   spi, =

   reg, =

   ring_msg, =

   scan_single_msg, =

   scan_single_xfer, =

   ring_xfer, =

   settings, =

   tx_buf, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7923_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7923.c:48:8: note: Excessive padding in 'struct ad7923=
_state' (76 padding bytes, where 12 is optimal). Optimal fields order: rx_b=
uf, spi, reg, ring_msg, scan_single_msg, scan_single_xfer, ring_xfer, setti=
ngs, tx_buf, consider reordering the fields or adding explicit padding memb=
ers
   struct ad7923_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (22 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/iio/adc/ad7768-1.c:420:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(label, "%s\n", st->labels[chan->channel]);
                  ^~~~~~~
   drivers/iio/adc/ad7768-1.c:420:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
--
               ^~~~~~~
   fs/btrfs/relocation.c:555:2: note: Taking true branch
           if (rb_node) {
           ^
   fs/btrfs/relocation.c:557:7: note: Assuming field 'detached' is 0
                   if (node->detached)
                       ^~~~~~~~~~~~~~
   fs/btrfs/relocation.c:557:3: note: Taking false branch
                   if (node->detached)
                   ^
   fs/btrfs/relocation.c:560:11: note: Assuming field 'new_bytenr' is equal=
 to field 'start'
                           BUG_ON(node->new_bytenr !=3D reloc_root->node->s=
tart);
                                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/btrfs/relocation.c:560:4: note: Taking false branch
                           BUG_ON(node->new_bytenr !=3D reloc_root->node->s=
tart);
                           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/relocation.c:560:4: note: Loop condition is false.  Exiting loop
                           BUG_ON(node->new_bytenr !=3D reloc_root->node->s=
tart);
                           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/btrfs/relocation.c:563:7: note: 'node' is non-null
           if (!node) {
                ^~~~
   fs/btrfs/relocation.c:563:2: note: Taking false branch
           if (!node) {
           ^
   fs/btrfs/relocation.c:573:7: note: 'node' is non-null
           if (!node)
                ^~~~
   fs/btrfs/relocation.c:573:2: note: Taking false branch
           if (!node)
           ^
   fs/btrfs/relocation.c:578:6: note: Assuming 'new_node' is non-null
           if (!new_node)
               ^~~~~~~~~
   fs/btrfs/relocation.c:578:2: note: Taking false branch
           if (!new_node)
           ^
   fs/btrfs/relocation.c:586:6: note: Assuming field 'lowest' is 0
           if (!node->lowest) {
               ^~~~~~~~~~~~~
   fs/btrfs/relocation.c:586:2: note: Taking true branch
           if (!node->lowest) {
           ^
   fs/btrfs/relocation.c:587:3: note: Loop condition is true.  Entering loo=
p body
                   list_for_each_entry(edge, &node->lower, list[UPPER]) {
                   ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/btrfs/relocation.c:589:8: note: Assuming 'new_edge' is null
                           if (!new_edge)
                               ^~~~~~~~~
   fs/btrfs/relocation.c:589:4: note: Taking true branch
                           if (!new_edge)
                           ^
   fs/btrfs/relocation.c:590:5: note: Control jumps to line 612
                                   goto fail;
                                   ^
   fs/btrfs/relocation.c:612:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&new_node->lower)) {
           ^
   fs/btrfs/relocation.c:616:3: note: Calling 'btrfs_backref_free_edge'
                   btrfs_backref_free_edge(cache, new_edge);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/backref.h:312:6: note: 'edge' is non-null
           if (edge) {
               ^~~~
   fs/btrfs/backref.h:312:2: note: Taking true branch
           if (edge) {
           ^
   fs/btrfs/backref.h:314:3: note: Memory is released
                   kfree(edge);
                   ^~~~~~~~~~~
   fs/btrfs/relocation.c:616:3: note: Returning; memory was released
                   btrfs_backref_free_edge(cache, new_edge);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/relocation.c:612:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&new_node->lower)) {
           ^
   fs/btrfs/relocation.c:615:3: note: Calling 'list_del'
                   list_del(&new_edge->list[UPPER]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 62 warnings (55 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/iio/common/ssp_sensors/ssp_iio.c:83:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(spd->buffer, buf, len);
           ^~~~~~
   drivers/iio/common/ssp_sensors/ssp_iio.c:83:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(spd->buffer, buf, len);
           ^~~~~~
   drivers/iio/common/ssp_sensors/ssp_iio.c:86:3: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&time, &((char *)buf)[len], SSP_TIME_SIZE);
                   ^~~~~~
   drivers/iio/common/ssp_sensors/ssp_iio.c:86:3: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&time, &((char *)buf)[len], SSP_TIME_SIZE);
                   ^~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/fpga/dfl-afu-dma-region.c:38:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:38:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:86:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:86:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:249:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-afu-dma-region.c:249:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdata->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/of/dynamic.c:240:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:240:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:293:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:293:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:508:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rce, ce, sizeof(*rce));
           ^~~~~~
   drivers/of/dynamic.c:508:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(rce, ce, sizeof(*rce));
           ^~~~~~
   drivers/of/dynamic.c:550:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&rd, 0, sizeof(rd));
                   ^~~~~~
   drivers/of/dynamic.c:550:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&rd, 0, sizeof(rd));
                   ^~~~~~
   drivers/of/dynamic.c:679:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ocs, 0, sizeof(*ocs));
           ^~~~~~
   drivers/of/dynamic.c:679:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(ocs, 0, sizeof(*ocs));
           ^~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/of/fdt.c:198:4: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pp->value, ps, len - 1);
                           ^~~~~~
   drivers/of/fdt.c:198:4: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                           memcpy(pp->value, ps, len - 1);
                           ^~~~~~
   drivers/of/fdt.c:232:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(fn, pathp, len);
                   ^~~~~~
   drivers/of/fdt.c:232:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(fn, pathp, len);
                   ^~~~~~
   drivers/of/fdt.c:409:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mem, 0, size);
--
                                           ^~~~~~~~~~~~~~
   drivers/iio/light/veml6030.c:355:8: note: Taking true branch
                   else if ((val =3D=3D 3) && (val2 =3D=3D 200000))
                        ^
   drivers/iio/light/veml6030.c:356:21: note: The right operand of '/' is a=
 garbage value
                           period =3D 3200000 / y;
                                            ^ ~
   drivers/iio/light/veml6030.c:358:21: warning: The right operand of '/' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           period =3D 6400000 / y;
                                            ^
   drivers/iio/light/veml6030.c:611:2: note: Control jumps to 'case IIO_EV_=
INFO_PERIOD:'  at line 614
           switch (info) {
           ^
   drivers/iio/light/veml6030.c:615:10: note: Calling 'veml6030_write_persi=
stence'
                   return veml6030_write_persistence(indio_dev, val, val2);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/veml6030.c:343:22: note: 'y' declared without an initi=
al value
           int ret, period, x, y;
                               ^
   drivers/iio/light/veml6030.c:346:8: note: Calling 'veml6030_get_intgrn_t=
m'
           ret =3D veml6030_get_intgrn_tm(indio_dev, &x, &y);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/veml6030.c:221:6: note: Assuming 'ret' is not equal to=
 0
           if (ret) {
               ^~~
   drivers/iio/light/veml6030.c:221:2: note: Taking true branch
           if (ret) {
           ^
   drivers/iio/light/veml6030.c:222:3: note: Loop condition is false.  Exit=
ing loop
                   dev_err(&data->client->dev,
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
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
   drivers/iio/light/veml6030.c:224:3: note: Returning without writing to '=
*val2'
                   return ret;
                   ^
   drivers/iio/light/veml6030.c:346:8: note: Returning from 'veml6030_get_i=
ntgrn_tm'
           ret =3D veml6030_get_intgrn_tm(indio_dev, &x, &y);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/veml6030.c:347:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/veml6030.c:347:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/veml6030.c:350:6: note: Assuming 'val' is not equal to=
 0
           if (!val) {
               ^~~~
   drivers/iio/light/veml6030.c:350:2: note: Taking false branch
           if (!val) {
           ^
   drivers/iio/light/veml6030.c:353:8: note: Assuming 'val' is not equal to=
 1
                   if ((val =3D=3D 1) && (val2 =3D=3D 600000))
                        ^~~~~~~~
   drivers/iio/light/veml6030.c:353:18: note: Left side of '&&' is false
                   if ((val =3D=3D 1) && (val2 =3D=3D 600000))
                                  ^
   drivers/iio/light/veml6030.c:355:13: note: Assuming 'val' is not equal t=
o 3
                   else if ((val =3D=3D 3) && (val2 =3D=3D 200000))
                             ^~~~~~~~
   drivers/iio/light/veml6030.c:355:23: note: Left side of '&&' is false
                   else if ((val =3D=3D 3) && (val2 =3D=3D 200000))
                                       ^
   drivers/iio/light/veml6030.c:357:13: note: Assuming 'val' is equal to 6
                   else if ((val =3D=3D 6) && (val2 =3D=3D 400000))
                             ^~~~~~~~
   drivers/iio/light/veml6030.c:357:12: note: Left side of '&&' is true
                   else if ((val =3D=3D 6) && (val2 =3D=3D 400000))
                            ^
   drivers/iio/light/veml6030.c:357:27: note: Assuming 'val2' is equal to 4=
00000
                   else if ((val =3D=3D 6) && (val2 =3D=3D 400000))
                                           ^~~~~~~~~~~~~~
   drivers/iio/light/veml6030.c:357:8: note: Taking true branch
                   else if ((val =3D=3D 6) && (val2 =3D=3D 400000))
                        ^
   drivers/iio/light/veml6030.c:358:21: note: The right operand of '/' is a=
 garbage value
                           period =3D 6400000 / y;
                                            ^ ~
   Suppressed 56 warnings (49 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/usb/gadget/udc/snps_udc_core.c:439:2: warning: Value stored to '=
tmp' is never read [clang-analyzer-deadcode.DeadStores]
           tmp =3D desc->bEndpointAddress;
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:439:2: note: Value stored to 'tmp=
' is never read
           tmp =3D desc->bEndpointAddress;
           ^     ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/udc/snps_udc_core.c:1154:6: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memcpy(ep->bna_dummy_req->td_dat=
a,
                                           ^~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:1154:6: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                                           memcpy(ep->bna_dummy_req->td_dat=
a,
                                           ^~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2117:5: warning: Value stored to =
'req' is never read [clang-analyzer-deadcode.DeadStores]
                                   req =3D list_entry(ep->queue.next,
                                   ^
   drivers/usb/gadget/udc/snps_udc_core.c:2117:5: note: Value stored to 're=
q' is never read
   drivers/usb/gadget/udc/snps_udc_core.c:2139:5: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(req->td_data, ep->bna_dummy_req->=
td_data,
                                   ^~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2139:5: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(req->td_data, ep->bna_dummy_req->=
td_data,
                                   ^~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2613:4: warning: Value stored to =
'count' is never read [clang-analyzer-deadcode.DeadStores]
                           count =3D AMD_GETBITS(count, UDC_EPSTS_RX_PKT_SI=
ZE);
                           ^
   drivers/usb/gadget/udc/snps_udc_core.c:2613:4: note: Value stored to 'co=
unt' is never read
>> drivers/usb/gadget/udc/snps_udc_core.c:2763:3: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&setup_data, 0 , sizeof(union udc_setup_data));
                   ^~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2763:3: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                   memset(&setup_data, 0 , sizeof(union udc_setup_data));
                   ^~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2797:3: warning: Value stored to =
'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2797:3: note: Value stored to 'tm=
p' is never read
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2811:3: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&setup_data, 0 , sizeof(union udc_setup_data));
                   ^~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2811:3: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                   memset(&setup_data, 0 , sizeof(union udc_setup_data));
                   ^~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2857:3: warning: Value stored to =
'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2857:3: note: Value stored to 'tm=
p' is never read
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>> drivers/usb/gadget/udc/snps_udc_core.c:3146:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(tmp, sizeof(tmp), "%d", dev->irq);
           ^~~~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:3146:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(tmp, sizeof(tmp), "%d", dev->irq);
           ^~~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/hwtracing/intel_th/sth.c:73:15: warning: Value stored to 'outp' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u64 __iomem *outp =3D &out->Dn;
                        ^~~~   ~~~~~~~~
   drivers/hwtracing/intel_th/sth.c:73:15: note: Value stored to 'outp' dur=
ing its initialization is never read
           u64 __iomem *outp =3D &out->Dn;
                        ^~~~   ~~~~~~~~
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/hwtracing/intel_th/sth.c:81:9: note: '?' condition is false
           size =3D rounddown_pow_of_two(size);
                  ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/hwtracing/intel_th/sth.c:81:9: note: Calling '__rounddown_pow_of=
_two'
           size =3D rounddown_pow_of_two(size);
                  ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/hwmon/ad7314.c:37:8: warning: Excessive padding in 'struct ad731=
4_data' (118 padding bytes, where 54 is optimal). =

   Optimal fields order: =

   rx, =

   spi_dev, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7314_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/hwmon/ad7314.c:37:8: note: Excessive padding in 'struct ad7314_d=
ata' (118 padding bytes, where 54 is optimal). Optimal fields order: rx, sp=
i_dev, consider reordering the fields or adding explicit padding members
   struct ad7314_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/hwmon/ad7314.c:71:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", 250 * data);
                          ^~~~~~~
   drivers/hwmon/ad7314.c:71:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", 250 * data);
                          ^~~~~~~
   drivers/hwmon/ad7314.c:82:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n",
                          ^~~~~~~
   drivers/hwmon/ad7314.c:82:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n",
                          ^~~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/hwmon/ad7418.c:137:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/ad7418.c:137:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/ad7418.c:152:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/ad7418.c:152:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/lm75.h:30:29: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           return (u16)((ntemp / 500) << 7);
                                      ^
   drivers/hwmon/ad7418.c:166:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/hwmon/ad7418.c:166:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/hwmon/ad7418.c:170:28: note: Calling 'LM75_TEMP_TO_REG'
           data->temp[attr->index] =3D LM75_TEMP_TO_REG(temp);
                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm75.h:27:14: note: Assuming '__UNIQUE_ID___x293' is <=3D =
'__UNIQUE_ID___y294'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
--
               ^
   drivers/usb/host/xhci.c:3497:4: note: Assuming the condition is false
                           HCC_MAX_PSA(xhci->hcc_params) < 4) {
                           ^
   drivers/usb/host/xhci.h:121:25: note: expanded from macro 'HCC_MAX_PSA'
   #define HCC_MAX_PSA(p)          (1 << ((((p) >> 12) & 0xf) + 1))
                                   ^
   drivers/usb/host/xhci.c:3496:2: note: Taking false branch
           if ((xhci->quirks & XHCI_BROKEN_STREAMS) ||
           ^
   drivers/usb/host/xhci.c:3503:6: note: Assuming 'config_cmd' is non-null
           if (!config_cmd)
               ^~~~~~~~~~~
   drivers/usb/host/xhci.c:3503:2: note: Taking false branch
           if (!config_cmd)
           ^
   drivers/usb/host/xhci.c:3507:6: note: Assuming 'ctrl_ctx' is non-null
           if (!ctrl_ctx) {
               ^~~~~~~~~
   drivers/usb/host/xhci.c:3507:2: note: Taking false branch
           if (!ctrl_ctx) {
           ^
   drivers/usb/host/xhci.c:3518:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&xhci->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/usb/host/xhci.c:3518:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&xhci->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/usb/host/xhci.c:3521:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/usb/host/xhci.c:3521:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/usb/host/xhci.c:3526:6: note: Assuming 'num_streams' is > 1
           if (num_streams <=3D 1) {
               ^~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.c:3526:2: note: Taking false branch
           if (num_streams <=3D 1) {
           ^
   drivers/usb/host/xhci.c:3537:2: note: Loop condition is false. Execution=
 continues on line 3541
           for (i =3D 0; i < num_eps; i++) {
           ^
   drivers/usb/host/xhci.c:3547:2: note: Calling 'xhci_calculate_streams_en=
tries'
           xhci_calculate_streams_entries(xhci, &num_streams, &num_stream_c=
txs);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/usb/host/xhci.c:3360:21: note: '?' condition is false
           *num_stream_ctxs =3D roundup_pow_of_two(*num_streams);
                              ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/usb/host/xhci.c:3360:21: note: Calling '__roundup_pow_of_two'
           *num_stream_ctxs =3D roundup_pow_of_two(*num_streams);
                              ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:154:2: note: Taking false branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:156:9: note: Calling 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/asm-generic/bitops/fls64.h:29:6: note: 'x' is not equal to 0
           if (x =3D=3D 0)
               ^
   include/asm-generic/bitops/fls64.h:29:2: note: Taking false branch
           if (x =3D=3D 0)
           ^
   include/asm-generic/bitops/fls64.h:31:2: note: Returning the value 64
           return __fls(x) + 1;
           ^~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:156:9: note: Returning from 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/linux/bitops.h:156:2: note: Returning the value 64
           return fls64(l);
           ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '64', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 113 warnings (106 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/usb/gadget/udc/m66592-udc.c:1603:3: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(clk_name, sizeof(clk_name), "usbf%d", pdev->id);
                   ^~~~~~~~
   drivers/usb/gadget/udc/m66592-udc.c:1603:3: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(clk_name, sizeof(clk_name), "usbf%d", pdev->id);
                   ^~~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/usb/gadget/udc/r8a66597-udc.c:1524:2: warning: Value stored to '=
tmp' is never read [clang-analyzer-deadcode.DeadStores]
           tmp =3D r8a66597_read(r8a66597, SYSCFG0);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/r8a66597-udc.c:1524:2: note: Value stored to 'tmp=
' is never read
           tmp =3D r8a66597_read(r8a66597, SYSCFG0);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/udc/r8a66597-udc.c:1880:3: warning: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(clk_name, sizeof(clk_name), "usb%d", pdev->id);
                   ^~~~~~~~
   drivers/usb/gadget/udc/r8a66597-udc.c:1880:3: note: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(clk_name, sizeof(clk_name), "usb%d", pdev->id);
                   ^~~~~~~~
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/usb/gadget/udc/mv_udc_core.c:1244:2: warning: Call to function '=
strncpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'strncpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(ep->name, "ep0", sizeof(ep->name));
           ^~~~~~~
   drivers/usb/gadget/udc/mv_udc_core.c:1244:2: note: Call to function 'str=
ncpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(ep->name, "ep0", sizeof(ep->name));
           ^~~~~~~
   drivers/usb/gadget/udc/mv_udc_core.c:1263:4: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, sizeof(name), "ep%din", i / 2);
                           ^~~~~~~~
   drivers/usb/gadget/udc/mv_udc_core.c:1263:4: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, sizeof(name), "ep%din", i / 2);
                           ^~~~~~~~
   drivers/usb/gadget/udc/mv_udc_core.c:1267:4: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, sizeof(name), "ep%dout", i / 2);
                           ^~~~~~~~
   drivers/usb/gadget/udc/mv_udc_core.c:1267:4: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, sizeof(name), "ep%dout", i / 2);
                           ^~~~~~~~
   drivers/usb/gadget/udc/mv_udc_core.c:1272:3: warning: Call to function '=
strncpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'strncpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(ep->name, name, sizeof(ep->name));
                   ^~~~~~~
   drivers/usb/gadget/udc/mv_udc_core.c:1272:3: note: Call to function 'str=
ncpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'strncpy_s' in case of C11
                   strncpy(ep->name, name, sizeof(ep->name));
                   ^~~~~~~
   drivers/usb/gadget/udc/mv_udc_core.c:1774:3: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer_ptr, (u8 *) dqh->setup_buffer, 8);
                   ^~~~~~
   drivers/usb/gadget/udc/mv_udc_core.c:1774:3: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer_ptr, (u8 *) dqh->setup_buffer, 8);
                   ^~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   117 warnings generated.
   drivers/usb/host/xhci-mem.c:646:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(stream_info->stream_ctx_array, 0,
           ^~~~~~
   drivers/usb/host/xhci-mem.c:646:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(stream_info->stream_ctx_array, 0,
           ^~~~~~
   drivers/usb/host/xhci-mem.c:729:6: warning: The result of the left shift=
 is undefined due to shifting by '4294967295', which is greater or equal to=
 the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           1 << (max_primary_streams + 1));
                             ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:729:6: note: The result of the left shift is=
 undefined due to shifting by '4294967295', which is greater or equal to th=
e width of type 'int'
                           1 << (max_primary_streams + 1));
                             ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:946:2: warning: Access to field 'next' resul=
ts in a dereference of a null pointer (loaded from variable 'tt_list_head')=
 [clang-analyzer-core.NullDereference]
           list_for_each_entry_safe(tt_info, next, tt_list_head, tt_list) {
           ^
   include/linux/list.h:725:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:531:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/usb/host/xhci-mem.c:2383:23: note: Calling 'xhci_to_hcd'
           struct device   *dev =3D xhci_to_hcd(xhci)->self.sysdev;
                                  ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:1965:2: note: Returning without writing to 'xhci=
->rh_bw'
           return xhci->main_hcd;
           ^
   drivers/usb/host/xhci-mem.c:2383:23: note: Returning from 'xhci_to_hcd'
           struct device   *dev =3D xhci_to_hcd(xhci)->self.sysdev;
                                  ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:2392:2: note: Loop condition is false.  Exit=
ing loop
           INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED=
_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^
   include/linux/workqueue.h:252:3: note: expanded from macro '__INIT_DELAY=
ED_WORK'
                   INIT_WORK(&(_work)->work, (_func));                     \
                   ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/usb/host/xhci-mem.c:2392:2: note: Loop condition is false.  Exit=
ing loop
           INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED=
_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^
   include/linux/workqueue.h:253:3: note: expanded from macro '__INIT_DELAY=
ED_WORK'
                   __init_timer(&(_work)->timer,                           \

vim +62 arch/riscv/kernel/ptrace.c

e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  50  =

b8c8a9590e4fde Jim Wilson     2018-10-17  51  #ifdef CONFIG_FPU
b8c8a9590e4fde Jim Wilson     2018-10-17  52  static int riscv_fpr_get(stru=
ct task_struct *target,
b8c8a9590e4fde Jim Wilson     2018-10-17  53  			 const struct user_regset =
*regset,
2cb6cd495d1780 Al Viro        2020-06-16  54  			 struct membuf to)
b8c8a9590e4fde Jim Wilson     2018-10-17  55  {
b8c8a9590e4fde Jim Wilson     2018-10-17  56  	struct __riscv_d_ext_state *=
fstate =3D &target->thread.fstate;
b8c8a9590e4fde Jim Wilson     2018-10-17  57  =

379eb01c21795e Vincent Chen   2021-08-03  58  	if (target =3D=3D current)
379eb01c21795e Vincent Chen   2021-08-03  59  		fstate_save(current, task_p=
t_regs(current));
379eb01c21795e Vincent Chen   2021-08-03  60  =

2cb6cd495d1780 Al Viro        2020-06-16  61  	membuf_write(&to, fstate, of=
fsetof(struct __riscv_d_ext_state, fcsr));
2cb6cd495d1780 Al Viro        2020-06-16 @62  	membuf_store(&to, fstate->fc=
sr);
2cb6cd495d1780 Al Viro        2020-06-16  63  	return membuf_zero(&to, 4);	=
// explicitly pad
b8c8a9590e4fde Jim Wilson     2018-10-17  64  }
b8c8a9590e4fde Jim Wilson     2018-10-17  65  =


:::::: The code at line 62 was first introduced by commit
:::::: 2cb6cd495d1780eb257e1626f82d4557c4b88ed5 riscv: switch to ->regset_g=
et()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1785103638960486097==--


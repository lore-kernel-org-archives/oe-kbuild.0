Content-Type: multipart/mixed; boundary="===============3383290815578252758=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/kernel/proc.c:61:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provide...
Date: Wed, 30 Mar 2022 00:56:04 +0800
Message-ID: <202203300031.dgoS813Z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3383290815578252758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   2 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-c004-20220328 (https://download.01.org/0day-ci/arch=
ive/20220330/202203300031.dgoS813Z-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~
   security/integrity/ima/ima_api.c:45:2: note: Taking true branch
           if (desc)
           ^
   security/integrity/ima/ima_api.c:52:6: note: Assuming the condition is f=
alse
           if (!*entry)
               ^~~~~~~
   security/integrity/ima/ima_api.c:52:2: note: Taking false branch
           if (!*entry)
           ^
   security/integrity/ima/ima_api.c:55:29: note: Assuming 'ima_tpm_chip' is=
 equal to null
           digests =3D kcalloc(NR_BANKS(ima_tpm_chip) + ima_extra_slots,
                                      ^
   security/integrity/ima/ima.h:44:26: note: expanded from macro 'NR_BANKS'
   #define NR_BANKS(chip) ((chip !=3D NULL) ? chip->nr_allocated_banks : 0)
                            ^~~~~~~~~~~~
   security/integrity/ima/ima_api.c:55:20: note: '?' condition is false
           digests =3D kcalloc(NR_BANKS(ima_tpm_chip) + ima_extra_slots,
                             ^
   security/integrity/ima/ima.h:44:25: note: expanded from macro 'NR_BANKS'
   #define NR_BANKS(chip) ((chip !=3D NULL) ? chip->nr_allocated_banks : 0)
                           ^
   security/integrity/ima/ima_api.c:57:6: note: Assuming 'digests' is non-n=
ull
           if (!digests) {
               ^~~~~~~~
   security/integrity/ima/ima_api.c:57:2: note: Taking false branch
           if (!digests) {
           ^
   security/integrity/ima/ima_api.c:65:14: note: Assuming 'i' is < field 'n=
um_fields'
           for (i =3D 0; i < template_desc->num_fields; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:65:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < template_desc->num_fields; i++) {
           ^
   security/integrity/ima/ima_api.c:72:7: note: Assuming 'result' is not eq=
ual to 0
                   if (result !=3D 0)
                       ^~~~~~~~~~~
   security/integrity/ima/ima_api.c:72:3: note: Taking true branch
                   if (result !=3D 0)
                   ^
   security/integrity/ima/ima_api.c:73:4: note: Control jumps to line 81
                           goto out;
                           ^
   security/integrity/ima/ima_api.c:82:2: note: Null pointer value stored t=
o 'entry'
           *entry =3D NULL;
           ^~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:328:11: note: Returning from 'ima_alloc=
_init_template'
           result =3D ima_alloc_init_template(&event_data, &entry, template=
_desc);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   security/integrity/ima/ima_api.c:329:6: note: Assuming 'result' is >=3D 0
           if (result < 0) {
               ^~~~~~~~~~
   security/integrity/ima/ima_api.c:329:2: note: Taking false branch
           if (result < 0) {
           ^
   security/integrity/ima/ima_api.c:335:30: note: Passing null pointer valu=
e via 1st parameter 'entry'
           result =3D ima_store_template(entry, violation, inode, filename,=
 pcr);
                                       ^~~~~
   security/integrity/ima/ima_api.c:335:11: note: Calling 'ima_store_templa=
te'
           result =3D ima_store_template(entry, violation, inode, filename,=
 pcr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   security/integrity/ima/ima_api.c:108:24: note: Access to field 'template=
_desc' results in a dereference of a null pointer (loaded from variable 'en=
try')
           char *template_name =3D entry->template_desc->name;
                                 ^~~~~
   security/integrity/ima/ima_api.c:249:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&hash.digest, 0, sizeof(hash.digest));
           ^~~~~~
   security/integrity/ima/ima_api.c:249:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&hash.digest, 0, sizeof(hash.digest));
           ^~~~~~
   security/integrity/ima/ima_api.c:267:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iint->ima_hash, &hash, length);
           ^~~~~~
   security/integrity/ima/ima_api.c:267:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(iint->ima_hash, &hash, length);
           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   kernel/debug/kdb/kdb_bp.c:583:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&kdb_breakpoints, '\0', sizeof(kdb_breakpoints));
           ^~~~~~
   kernel/debug/kdb/kdb_bp.c:583:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&kdb_breakpoints, '\0', sizeof(kdb_breakpoints));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (30 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> arch/mips/kernel/proc.c:61:2: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           sprintf(fmt, "cpu model\t\t: %%s V%%d.%%d%s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:61:2: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           sprintf(fmt, "cpu model\t\t: %%s V%%d.%%d%s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:296:2: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:296:2: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
           ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   arch/mips/kernel/crash_dump.c:29:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, vaddr + offset, csize);
                   ^~~~~~
   arch/mips/kernel/crash_dump.c:29:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, vaddr + offset, csize);
                   ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   40 warnings generated.
   lib/crypto/blake2s-generic.c:56:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(m, block, BLAKE2S_BLOCK_SIZE);
                   ^~~~~~
   lib/crypto/blake2s-generic.c:56:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(m, block, BLAKE2S_BLOCK_SIZE);
                   ^~~~~~
   lib/crypto/blake2s-generic.c:58:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(v, state->h, 32);
                   ^~~~~~
   lib/crypto/blake2s-generic.c:58:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(v, state->h, 32);
                   ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   lib/crypto/sha256.c:136:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(sctx->buf + partial, data, done + 64);
                           ^~~~~~
   lib/crypto/sha256.c:136:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(sctx->buf + partial, data, done + 64);
                           ^~~~~~
   lib/crypto/sha256.c:150:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sctx->buf + partial, src, len - done);
           ^~~~~~
   lib/crypto/sha256.c:150:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(sctx->buf + partial, src, len - done);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   kernel/seccomp.c:2242:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(names, 0, sizeof(names));
           ^~~~~~
   kernel/seccomp.c:2242:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(names, 0, sizeof(names));
           ^~~~~~
   kernel/seccomp.c:2264:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(names, 0, sizeof(names));
           ^~~~~~
   kernel/seccomp.c:2264:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(names, 0, sizeof(names));
           ^~~~~~
   kernel/seccomp.c:2288:14: warning: Value stored to 'new' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           const char *new =3D names;
                       ^~~   ~~~~~
   kernel/seccomp.c:2288:14: note: Value stored to 'new' during its initial=
ization is never read
           const char *new =3D names;
                       ^~~   ~~~~~
   kernel/seccomp.c:2289:14: warning: Value stored to 'old' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           const char *old =3D old_names;
                       ^~~   ~~~~~~~~~
   kernel/seccomp.c:2289:14: note: Value stored to 'old' during its initial=
ization is never read
           const char *old =3D old_names;
                       ^~~   ~~~~~~~~~
   kernel/seccomp.c:2294:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(names, 0, sizeof(names));
--
                                 ^
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   block/blk-sysfs.c:32:9: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%lu\n", var);
                  ^~~~~~~
   block/blk-sysfs.c:32:9: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%lu\n", var);
                  ^~~~~~~
   block/blk-sysfs.c:177:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%llu\n",
                  ^~~~~~~
   block/blk-sysfs.c:177:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%llu\n",
                  ^~~~~~~
   block/blk-sysfs.c:183:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%llu\n",
                  ^~~~~~~
   block/blk-sysfs.c:183:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%llu\n",
                  ^~~~~~~
   block/blk-sysfs.c:217:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%llu\n",
                  ^~~~~~~
   block/blk-sysfs.c:217:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%llu\n",
                  ^~~~~~~
   block/blk-sysfs.c:223:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%llu\n",
                  ^~~~~~~
   block/blk-sysfs.c:223:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%llu\n",
                  ^~~~~~~
   block/blk-sysfs.c:237:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%llu\n", max_sectors << SECTOR_SHIFT);
                  ^~~~~~~
   block/blk-sysfs.c:237:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%llu\n", max_sectors << SECTOR_SHIFT);
                  ^~~~~~~
   block/blk-sysfs.c:314:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "host-aware\n");
                          ^~~~~~~
   block/blk-sysfs.c:314:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "host-aware\n");
                          ^~~~~~~
   block/blk-sysfs.c:316:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "host-managed\n");
                          ^~~~~~~
   block/blk-sysfs.c:316:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "host-managed\n");
                          ^~~~~~~
   block/blk-sysfs.c:318:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "none\n");
                          ^~~~~~~
   block/blk-sysfs.c:318:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "none\n");
                          ^~~~~~~
   block/blk-sysfs.c:404:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%d\n", val);
                  ^~~~~~~
   block/blk-sysfs.c:404:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%d\n", val);
                  ^~~~~~~
   block/blk-sysfs.c:446:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%u\n", jiffies_to_msecs(q->rq_timeout));
                  ^~~~~~~
   block/blk-sysfs.c:446:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%u\n", jiffies_to_msecs(q->rq_timeout));
                  ^~~~~~~
   block/blk-sysfs.c:469:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%llu\n", div_u64(wbt_get_min_lat(q), 1000)=
);
                  ^~~~~~~
   block/blk-sysfs.c:469:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%llu\n", div_u64(wbt_get_min_lat(q), 1000)=
);
                  ^~~~~~~
   block/blk-sysfs.c:519:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "write back\n");
                          ^~~~~~~
   block/blk-sysfs.c:519:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "write back\n");
                          ^~~~~~~
   block/blk-sysfs.c:521:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "write through\n");
                  ^~~~~~~
   block/blk-sysfs.c:521:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(page, "write through\n");
                  ^~~~~~~
   block/blk-sysfs.c:548:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%u\n", test_bit(QUEUE_FLAG_FUA, &q->queue_=
flags));
                  ^~~~~~~
   block/blk-sysfs.c:548:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%u\n", test_bit(QUEUE_FLAG_FUA, &q->queue_=
flags));
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
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
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/tty/vt/consolemap.c:212:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(q, 0, MAX_GLYPH);
           ^~~~~~
   drivers/tty/vt/consolemap.c:212:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(q, 0, MAX_GLYPH);
           ^~~~~~
   drivers/tty/vt/consolemap.c:238:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(q, 0, MAX_GLYPH * sizeof(u16));
           ^~~~~~
   drivers/tty/vt/consolemap.c:238:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(q, 0, MAX_GLYPH * sizeof(u16));
           ^~~~~~
   drivers/tty/vt/consolemap.c:332:30: warning: The right operand of '|' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   inbuf[i] =3D UNI_DIRECT_BASE | ubuf[i];
                                              ^ ~~~~~~~
   drivers/tty/vt/consolemap.c:328:6: note: Calling 'copy_from_user'
           if (copy_from_user(ubuf, arg, E_TABSZ))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o '*to'
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
   include/linux/uaccess.h:163:2: note: Returning without writing to '*to'

vim +61 arch/mips/kernel/proc.c

^1da177e4c3f41 Linus Torvalds      2005-04-16   49  =

^1da177e4c3f41 Linus Torvalds      2005-04-16   50  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16   51  	 * For the first proce=
ssor also print the system type
^1da177e4c3f41 Linus Torvalds      2005-04-16   52  	 */
487d70d0b8bd1c Gabor Juhos         2010-11-23   53  	if (n =3D=3D 0) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   54  		seq_printf(m, "system=
 type\t\t: %s\n", get_system_type());
487d70d0b8bd1c Gabor Juhos         2010-11-23   55  		if (mips_get_machine_=
name())
487d70d0b8bd1c Gabor Juhos         2010-11-23   56  			seq_printf(m, "machi=
ne\t\t\t: %s\n",
487d70d0b8bd1c Gabor Juhos         2010-11-23   57  				   mips_get_machine=
_name());
487d70d0b8bd1c Gabor Juhos         2010-11-23   58  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16   59  =

^1da177e4c3f41 Linus Torvalds      2005-04-16   60  	seq_printf(m, "process=
or\t\t: %ld\n", n);
^1da177e4c3f41 Linus Torvalds      2005-04-16  @61  	sprintf(fmt, "cpu mode=
l\t\t: %%s V%%d.%%d%s\n",
e04582b7bc70b4 Atsushi Nemoto      2006-10-09   62  		      cpu_data[n].opt=
ions & MIPS_CPU_FPU ? "  FPU V%d.%d" : "");
e47c659b55aff7 Johannes Dickgreber 2008-10-13   63  	seq_printf(m, fmt, __c=
pu_name[n],
^1da177e4c3f41 Linus Torvalds      2005-04-16   64  		      (version >> 4) =
& 0x0f, version & 0x0f,
^1da177e4c3f41 Linus Torvalds      2005-04-16   65  		      (fp_vers >> 4) =
& 0x0f, fp_vers & 0x0f);
5636919b5c909f Ralf Baechle        2009-02-28   66  	seq_printf(m, "BogoMIP=
S\t\t: %u.%02u\n",
0ac354801a8791 Ralf Baechle        2005-02-21   67  		      cpu_data[n].ude=
lay_val / (500000/HZ),
0ac354801a8791 Ralf Baechle        2005-02-21   68  		      (cpu_data[n].ud=
elay_val / (5000/HZ)) % 100);
^1da177e4c3f41 Linus Torvalds      2005-04-16   69  	seq_printf(m, "wait in=
struction\t: %s\n", cpu_wait ? "yes" : "no");
^1da177e4c3f41 Linus Torvalds      2005-04-16   70  	seq_printf(m, "microse=
cond timers\t: %s\n",
^1da177e4c3f41 Linus Torvalds      2005-04-16   71  		      cpu_has_counter=
 ? "yes" : "no");
31aa36658a1232 Karl-Johan Karlsson 2006-10-08   72  	seq_printf(m, "tlb_ent=
ries\t\t: %d\n", cpu_data[n].tlbsize);
^1da177e4c3f41 Linus Torvalds      2005-04-16   73  	seq_printf(m, "extra i=
nterrupt vector\t: %s\n",
^1da177e4c3f41 Linus Torvalds      2005-04-16   74  		      cpu_has_divec ?=
 "yes" : "no");
654f57bfb46799 David Daney         2008-09-23   75  	seq_printf(m, "hardwar=
e watchpoint\t: %s",
654f57bfb46799 David Daney         2008-09-23   76  		      cpu_has_watch ?=
 "yes, " : "no\n");
654f57bfb46799 David Daney         2008-09-23   77  	if (cpu_has_watch) {
654f57bfb46799 David Daney         2008-09-23   78  		seq_printf(m, "count:=
 %d, address/irw mask: [",
654f57bfb46799 David Daney         2008-09-23   79  		      cpu_data[n].wat=
ch_reg_count);
654f57bfb46799 David Daney         2008-09-23   80  		for (i =3D 0; i < cpu=
_data[n].watch_reg_count; i++)
654f57bfb46799 David Daney         2008-09-23   81  			seq_printf(m, "%s0x%=
04x", i ? ", " : "",
654f57bfb46799 David Daney         2008-09-23   82  				cpu_data[n].watch_r=
eg_masks[i]);
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   83  		seq_puts(m, "]\n");
654f57bfb46799 David Daney         2008-09-23   84  	}
41315b6ec108e9 Aaro Koskinen       2013-12-31   85  =

1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   86  	seq_puts(m, "isa\t\t\t=
:");
e5f5a5b06e51a3 Maciej W. Rozycki   2017-07-08   87  	if (cpu_has_mips_1)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   88  		seq_puts(m, " mips1");
a96102be700f87 Steven J. Hill      2012-12-07   89  	if (cpu_has_mips_2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   90  		seq_puts(m, " mips2");
a96102be700f87 Steven J. Hill      2012-12-07   91  	if (cpu_has_mips_3)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   92  		seq_puts(m, " mips3");
a96102be700f87 Steven J. Hill      2012-12-07   93  	if (cpu_has_mips_4)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   94  		seq_puts(m, " mips4");
a96102be700f87 Steven J. Hill      2012-12-07   95  	if (cpu_has_mips_5)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   96  		seq_puts(m, " mips5");
a96102be700f87 Steven J. Hill      2012-12-07   97  	if (cpu_has_mips32r1)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   98  		seq_puts(m, " mips32r=
1");
a96102be700f87 Steven J. Hill      2012-12-07   99  	if (cpu_has_mips32r2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  100  		seq_puts(m, " mips32r=
2");
ab7c01fdc3cfe0 Serge Semin         2020-05-21  101  	if (cpu_has_mips32r5)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  102  		seq_puts(m, " mips32r=
5");
515a6393dbac4f Markos Chandras     2014-11-14  103  	if (cpu_has_mips32r6)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  104  		seq_puts(m, " mips32r=
6");
a96102be700f87 Steven J. Hill      2012-12-07  105  	if (cpu_has_mips64r1)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  106  		seq_puts(m, " mips64r=
1");
a96102be700f87 Steven J. Hill      2012-12-07  107  	if (cpu_has_mips64r2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  108  		seq_puts(m, " mips64r=
2");
ab7c01fdc3cfe0 Serge Semin         2020-05-21  109  	if (cpu_has_mips64r5)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  110  		seq_puts(m, " mips64r=
5");
515a6393dbac4f Markos Chandras     2014-11-14  111  	if (cpu_has_mips64r6)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  112  		seq_puts(m, " mips64r=
6");
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  113  	seq_puts(m, "\n");
981ef0de49869c Ralf Baechle        2012-08-20  114  =

1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  115  	seq_puts(m, "ASEs impl=
emented\t:");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  116  	if (cpu_has_mips16)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  117  		seq_puts(m, " mips16"=
);
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  118  	if (cpu_has_mips16e2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  119  		seq_puts(m, " mips16e=
2");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  120  	if (cpu_has_mdmx)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  121  		seq_puts(m, " mdmx");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  122  	if (cpu_has_mips3d)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  123  		seq_puts(m, " mips3d"=
);
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  124  	if (cpu_has_smartmips)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  125  		seq_puts(m, " smartmi=
ps");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  126  	if (cpu_has_dsp)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  127  		seq_puts(m, " dsp");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  128  	if (cpu_has_dsp2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  129  		seq_puts(m, " dsp2");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  130  	if (cpu_has_dsp3)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  131  		seq_puts(m, " dsp3");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  132  	if (cpu_has_mipsmt)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  133  		seq_puts(m, " mt");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  134  	if (cpu_has_mmips)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  135  		seq_puts(m, " micromi=
ps");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  136  	if (cpu_has_vz)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  137  		seq_puts(m, " vz");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  138  	if (cpu_has_msa)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  139  		seq_puts(m, " msa");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  140  	if (cpu_has_eva)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  141  		seq_puts(m, " eva");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  142  	if (cpu_has_htw)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  143  		seq_puts(m, " htw");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  144  	if (cpu_has_xpa)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  145  		seq_puts(m, " xpa");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  146  	if (cpu_has_loongson_m=
mi)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  147  		seq_puts(m, " loongso=
n-mmi");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  148  	if (cpu_has_loongson_c=
am)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  149  		seq_puts(m, " loongso=
n-cam");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  150  	if (cpu_has_loongson_e=
xt)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  151  		seq_puts(m, " loongso=
n-ext");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  152  	if (cpu_has_loongson_e=
xt2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  153  		seq_puts(m, " loongso=
n-ext2");
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  154  	seq_puts(m, "\n");
981ef0de49869c Ralf Baechle        2012-08-20  155  =

bce860833ab1e4 Steven J. Hill      2013-03-25  156  	if (cpu_has_mmips) {
bce860833ab1e4 Steven J. Hill      2013-03-25  157  		seq_printf(m, "microm=
ips kernel\t: %s\n",
bce860833ab1e4 Steven J. Hill      2013-03-25  158  		      (read_c0_config=
3() & MIPS_CONF3_ISA_OE) ?  "yes" : "no");
bce860833ab1e4 Steven J. Hill      2013-03-25  159  	}
626bfa03729959 Hauke Mehrtens      2021-10-13  160  =

626bfa03729959 Hauke Mehrtens      2021-10-13  161  	seq_puts(m, "Options i=
mplemented\t:");
626bfa03729959 Hauke Mehrtens      2021-10-13  162  	if (cpu_has_tlb)
626bfa03729959 Hauke Mehrtens      2021-10-13  163  		seq_puts(m, " tlb");
626bfa03729959 Hauke Mehrtens      2021-10-13  164  	if (cpu_has_ftlb)
626bfa03729959 Hauke Mehrtens      2021-10-13  165  		seq_puts(m, " ftlb");
626bfa03729959 Hauke Mehrtens      2021-10-13  166  	if (cpu_has_tlbinv)
626bfa03729959 Hauke Mehrtens      2021-10-13  167  		seq_puts(m, " tlbinv"=
);
626bfa03729959 Hauke Mehrtens      2021-10-13  168  	if (cpu_has_segments)
626bfa03729959 Hauke Mehrtens      2021-10-13  169  		seq_puts(m, " segment=
s");
626bfa03729959 Hauke Mehrtens      2021-10-13  170  	if (cpu_has_rixiex)
626bfa03729959 Hauke Mehrtens      2021-10-13  171  		seq_puts(m, " rixiex"=
);
626bfa03729959 Hauke Mehrtens      2021-10-13  172  	if (cpu_has_ldpte)
626bfa03729959 Hauke Mehrtens      2021-10-13  173  		seq_puts(m, " ldpte");
626bfa03729959 Hauke Mehrtens      2021-10-13  174  	if (cpu_has_maar)
626bfa03729959 Hauke Mehrtens      2021-10-13  175  		seq_puts(m, " maar");
626bfa03729959 Hauke Mehrtens      2021-10-13  176  	if (cpu_has_rw_llb)
626bfa03729959 Hauke Mehrtens      2021-10-13  177  		seq_puts(m, " rw_llb"=
);
626bfa03729959 Hauke Mehrtens      2021-10-13  178  	if (cpu_has_4kex)
626bfa03729959 Hauke Mehrtens      2021-10-13  179  		seq_puts(m, " 4kex");
626bfa03729959 Hauke Mehrtens      2021-10-13  180  	if (cpu_has_3k_cache)
626bfa03729959 Hauke Mehrtens      2021-10-13  181  		seq_puts(m, " 3k_cach=
e");
626bfa03729959 Hauke Mehrtens      2021-10-13  182  	if (cpu_has_4k_cache)
626bfa03729959 Hauke Mehrtens      2021-10-13  183  		seq_puts(m, " 4k_cach=
e");
626bfa03729959 Hauke Mehrtens      2021-10-13  184  	if (cpu_has_tx39_cache)
626bfa03729959 Hauke Mehrtens      2021-10-13  185  		seq_puts(m, " tx39_ca=
che");
626bfa03729959 Hauke Mehrtens      2021-10-13  186  	if (cpu_has_octeon_cac=
he)
626bfa03729959 Hauke Mehrtens      2021-10-13  187  		seq_puts(m, " octeon_=
cache");
1cab5bd69eb1f9 Tiezhu Yang         2021-11-25  188  	if (raw_cpu_has_fpu)
626bfa03729959 Hauke Mehrtens      2021-10-13  189  		seq_puts(m, " fpu");
626bfa03729959 Hauke Mehrtens      2021-10-13  190  	if (cpu_has_32fpr)
626bfa03729959 Hauke Mehrtens      2021-10-13  191  		seq_puts(m, " 32fpr");
626bfa03729959 Hauke Mehrtens      2021-10-13  192  	if (cpu_has_cache_cdex=
_p)
626bfa03729959 Hauke Mehrtens      2021-10-13  193  		seq_puts(m, " cache_c=
dex_p");
626bfa03729959 Hauke Mehrtens      2021-10-13  194  	if (cpu_has_cache_cdex=
_s)
626bfa03729959 Hauke Mehrtens      2021-10-13  195  		seq_puts(m, " cache_c=
dex_s");
626bfa03729959 Hauke Mehrtens      2021-10-13  196  	if (cpu_has_prefetch)
626bfa03729959 Hauke Mehrtens      2021-10-13  197  		seq_puts(m, " prefetc=
h");
626bfa03729959 Hauke Mehrtens      2021-10-13  198  	if (cpu_has_mcheck)
626bfa03729959 Hauke Mehrtens      2021-10-13  199  		seq_puts(m, " mcheck"=
);
626bfa03729959 Hauke Mehrtens      2021-10-13  200  	if (cpu_has_ejtag)
626bfa03729959 Hauke Mehrtens      2021-10-13  201  		seq_puts(m, " ejtag");
626bfa03729959 Hauke Mehrtens      2021-10-13  202  	if (cpu_has_llsc)
626bfa03729959 Hauke Mehrtens      2021-10-13  203  		seq_puts(m, " llsc");
626bfa03729959 Hauke Mehrtens      2021-10-13  204  	if (cpu_has_guestctl0e=
xt)
626bfa03729959 Hauke Mehrtens      2021-10-13  205  		seq_puts(m, " guestct=
l0ext");
626bfa03729959 Hauke Mehrtens      2021-10-13  206  	if (cpu_has_guestctl1)
626bfa03729959 Hauke Mehrtens      2021-10-13  207  		seq_puts(m, " guestct=
l1");
626bfa03729959 Hauke Mehrtens      2021-10-13  208  	if (cpu_has_guestctl2)
626bfa03729959 Hauke Mehrtens      2021-10-13  209  		seq_puts(m, " guestct=
l2");
626bfa03729959 Hauke Mehrtens      2021-10-13  210  	if (cpu_has_guestid)
626bfa03729959 Hauke Mehrtens      2021-10-13  211  		seq_puts(m, " guestid=
");
626bfa03729959 Hauke Mehrtens      2021-10-13  212  	if (cpu_has_drg)
626bfa03729959 Hauke Mehrtens      2021-10-13  213  		seq_puts(m, " drg");
626bfa03729959 Hauke Mehrtens      2021-10-13  214  	if (cpu_has_rixi)
626bfa03729959 Hauke Mehrtens      2021-10-13  215  		seq_puts(m, " rixi");
626bfa03729959 Hauke Mehrtens      2021-10-13  216  	if (cpu_has_lpa)
626bfa03729959 Hauke Mehrtens      2021-10-13  217  		seq_puts(m, " lpa");
626bfa03729959 Hauke Mehrtens      2021-10-13  218  	if (cpu_has_mvh)
626bfa03729959 Hauke Mehrtens      2021-10-13  219  		seq_puts(m, " mvh");
626bfa03729959 Hauke Mehrtens      2021-10-13  220  	if (cpu_has_vtag_icach=
e)
626bfa03729959 Hauke Mehrtens      2021-10-13  221  		seq_puts(m, " vtag_ic=
ache");
626bfa03729959 Hauke Mehrtens      2021-10-13  222  	if (cpu_has_dc_aliases)
626bfa03729959 Hauke Mehrtens      2021-10-13  223  		seq_puts(m, " dc_alia=
ses");
626bfa03729959 Hauke Mehrtens      2021-10-13  224  	if (cpu_has_ic_fills_f=
_dc)
626bfa03729959 Hauke Mehrtens      2021-10-13  225  		seq_puts(m, " ic_fill=
s_f_dc");
626bfa03729959 Hauke Mehrtens      2021-10-13  226  	if (cpu_has_pindexed_d=
cache)
626bfa03729959 Hauke Mehrtens      2021-10-13  227  		seq_puts(m, " pindexe=
d_dcache");
626bfa03729959 Hauke Mehrtens      2021-10-13  228  	if (cpu_has_userlocal)
626bfa03729959 Hauke Mehrtens      2021-10-13  229  		seq_puts(m, " userloc=
al");
626bfa03729959 Hauke Mehrtens      2021-10-13  230  	if (cpu_has_nofpuex)
626bfa03729959 Hauke Mehrtens      2021-10-13  231  		seq_puts(m, " nofpuex=
");
626bfa03729959 Hauke Mehrtens      2021-10-13  232  	if (cpu_has_vint)
626bfa03729959 Hauke Mehrtens      2021-10-13  233  		seq_puts(m, " vint");
626bfa03729959 Hauke Mehrtens      2021-10-13  234  	if (cpu_has_veic)
626bfa03729959 Hauke Mehrtens      2021-10-13  235  		seq_puts(m, " veic");
626bfa03729959 Hauke Mehrtens      2021-10-13  236  	if (cpu_has_inclusive_=
pcaches)
626bfa03729959 Hauke Mehrtens      2021-10-13  237  		seq_puts(m, " inclusi=
ve_pcaches");
626bfa03729959 Hauke Mehrtens      2021-10-13  238  	if (cpu_has_perf_cntr_=
intr_bit)
626bfa03729959 Hauke Mehrtens      2021-10-13  239  		seq_puts(m, " perf_cn=
tr_intr_bit");
626bfa03729959 Hauke Mehrtens      2021-10-13  240  	if (cpu_has_ufr)
626bfa03729959 Hauke Mehrtens      2021-10-13  241  		seq_puts(m, " ufr");
626bfa03729959 Hauke Mehrtens      2021-10-13  242  	if (cpu_has_fre)
626bfa03729959 Hauke Mehrtens      2021-10-13  243  		seq_puts(m, " fre");
626bfa03729959 Hauke Mehrtens      2021-10-13  244  	if (cpu_has_cdmm)
626bfa03729959 Hauke Mehrtens      2021-10-13  245  		seq_puts(m, " cdmm");
626bfa03729959 Hauke Mehrtens      2021-10-13  246  	if (cpu_has_small_page=
s)
626bfa03729959 Hauke Mehrtens      2021-10-13  247  		seq_puts(m, " small_p=
ages");
626bfa03729959 Hauke Mehrtens      2021-10-13  248  	if (cpu_has_nan_legacy)
626bfa03729959 Hauke Mehrtens      2021-10-13  249  		seq_puts(m, " nan_leg=
acy");
626bfa03729959 Hauke Mehrtens      2021-10-13  250  	if (cpu_has_nan_2008)
626bfa03729959 Hauke Mehrtens      2021-10-13  251  		seq_puts(m, " nan_200=
8");
626bfa03729959 Hauke Mehrtens      2021-10-13  252  	if (cpu_has_ebase_wg)
626bfa03729959 Hauke Mehrtens      2021-10-13  253  		seq_puts(m, " ebase_w=
g");
626bfa03729959 Hauke Mehrtens      2021-10-13  254  	if (cpu_has_badinstr)
626bfa03729959 Hauke Mehrtens      2021-10-13  255  		seq_puts(m, " badinst=
r");
626bfa03729959 Hauke Mehrtens      2021-10-13  256  	if (cpu_has_badinstrp)
626bfa03729959 Hauke Mehrtens      2021-10-13  257  		seq_puts(m, " badinst=
rp");
626bfa03729959 Hauke Mehrtens      2021-10-13  258  	if (cpu_has_contextcon=
fig)
626bfa03729959 Hauke Mehrtens      2021-10-13  259  		seq_puts(m, " context=
config");
626bfa03729959 Hauke Mehrtens      2021-10-13  260  	if (cpu_has_perf)
626bfa03729959 Hauke Mehrtens      2021-10-13  261  		seq_puts(m, " perf");
626bfa03729959 Hauke Mehrtens      2021-10-13  262  	if (cpu_has_mac2008_on=
ly)
626bfa03729959 Hauke Mehrtens      2021-10-13  263  		seq_puts(m, " mac2008=
_only");
626bfa03729959 Hauke Mehrtens      2021-10-13  264  	if (cpu_has_ftlbparex)
626bfa03729959 Hauke Mehrtens      2021-10-13  265  		seq_puts(m, " ftlbpar=
ex");
626bfa03729959 Hauke Mehrtens      2021-10-13  266  	if (cpu_has_gsexcex)
626bfa03729959 Hauke Mehrtens      2021-10-13  267  		seq_puts(m, " gsexcex=
");
626bfa03729959 Hauke Mehrtens      2021-10-13  268  	if (cpu_has_shared_ftl=
b_ram)
626bfa03729959 Hauke Mehrtens      2021-10-13  269  		seq_puts(m, " shared_=
ftlb_ram");
626bfa03729959 Hauke Mehrtens      2021-10-13  270  	if (cpu_has_shared_ftl=
b_entries)
626bfa03729959 Hauke Mehrtens      2021-10-13  271  		seq_puts(m, " shared_=
ftlb_entries");
626bfa03729959 Hauke Mehrtens      2021-10-13  272  	if (cpu_has_mipsmt_per=
tccounters)
626bfa03729959 Hauke Mehrtens      2021-10-13  273  		seq_puts(m, " mipsmt_=
pertccounters");
626bfa03729959 Hauke Mehrtens      2021-10-13  274  	if (cpu_has_mmid)
626bfa03729959 Hauke Mehrtens      2021-10-13  275  		seq_puts(m, " mmid");
626bfa03729959 Hauke Mehrtens      2021-10-13  276  	if (cpu_has_mm_sysad)
626bfa03729959 Hauke Mehrtens      2021-10-13  277  		seq_puts(m, " mm_sysa=
d");
626bfa03729959 Hauke Mehrtens      2021-10-13  278  	if (cpu_has_mm_full)
626bfa03729959 Hauke Mehrtens      2021-10-13  279  		seq_puts(m, " mm_full=
");
626bfa03729959 Hauke Mehrtens      2021-10-13  280  	seq_puts(m, "\n");
626bfa03729959 Hauke Mehrtens      2021-10-13  281  =

f6771dbb27c704 Ralf Baechle        2007-11-08  282  	seq_printf(m, "shadow =
register sets\t: %d\n",
f6771dbb27c704 Ralf Baechle        2007-11-08  283  		      cpu_data[n].srs=
ets);
e77c32fe284a4d David Daney         2010-12-21  284  	seq_printf(m, "kscratc=
h registers\t: %d\n",
e77c32fe284a4d David Daney         2010-12-21  285  		      hweight8(cpu_da=
ta[n].kscratch_mask));
bda4584cd943d7 Huacai Chen         2014-06-26  286  	seq_printf(m, "package=
\t\t\t: %d\n", cpu_data[n].package);
f875a832d20285 Paul Burton         2017-08-12  287  	seq_printf(m, "core\t\=
t\t: %d\n", cpu_core(&cpu_data[n]));
5508d456e9992b Ralf Baechle        2014-04-03  288  =


:::::: The code@line 61 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3383290815578252758==--


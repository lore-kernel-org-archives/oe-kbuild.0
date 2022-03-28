Content-Type: multipart/mixed; boundary="===============0808953250550292903=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/kernel/proc.c:61:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provide...
Date: Tue, 29 Mar 2022 01:00:45 +0800
Message-ID: <202203290056.sA6WFxfS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0808953250550292903==
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
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   2 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-c004-20220328 (https://download.01.org/0day-ci/arch=
ive/20220329/202203290056.sA6WFxfS-lkp(a)intel.com/config)
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
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
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
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   security/keys/request_key_auth.c:100:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer, rka->callout_info, buflen);
                   ^~~~~~
   security/keys/request_key_auth.c:100:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer, rka->callout_info, buflen);
                   ^~~~~~
   security/keys/request_key_auth.c:214:2: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(desc, "%x", target->serial);
           ^~~~~~~
   security/keys/request_key_auth.c:214:2: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(desc, "%x", target->serial);
           ^~~~~~~
   security/keys/request_key_auth.c:262:27: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ctx.index_key.desc_len =3D sprintf(description, "%x", target_id);
                                    ^~~~~~~
   security/keys/request_key_auth.c:262:27: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           ctx.index_key.desc_len =3D sprintf(description, "%x", target_id);
                                    ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   security/integrity/evm/evm_main.c:360:5: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(buffer + total_size, xattr->name,=
 size);
                                   ^~~~~~
   security/integrity/evm/evm_main.c:360:5: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(buffer + total_size, xattr->name,=
 size);
                                   ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/reiserfs/xattr.c:156:2: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(namebuf, sizeof(namebuf), "%X.%X",
           ^~~~~~~~
   fs/reiserfs/xattr.c:156:2: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           snprintf(namebuf, sizeof(namebuf), "%X.%X",
           ^~~~~~~~
   fs/reiserfs/xattr.c:581:5: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(data + skip, buffer + buffer_pos,=
 chunk);
                                   ^~~~~~
   fs/reiserfs/xattr.c:581:5: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                                   memcpy(data + skip, buffer + buffer_pos,=
 chunk);
                                   ^~~~~~
   fs/reiserfs/xattr.c:591:3: warning: Value stored to 'skip' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   skip =3D 0;
                   ^      ~
   fs/reiserfs/xattr.c:591:3: note: Value stored to 'skip' is never read
                   skip =3D 0;
                   ^      ~
   fs/reiserfs/xattr.c:741:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer + buffer_pos, data + skip, chunk);
                   ^~~~~~
   fs/reiserfs/xattr.c:741:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer + buffer_pos, data + skip, chunk);
                   ^~~~~~
   fs/reiserfs/xattr.c:746:3: warning: Value stored to 'skip' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   skip =3D 0;
                   ^      ~
   fs/reiserfs/xattr.c:746:3: note: Value stored to 'skip' is never read
                   skip =3D 0;
                   ^      ~
   fs/reiserfs/xattr.c:830:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(b->buf + b->pos, name, namelen);
                           ^~~~~~
   fs/reiserfs/xattr.c:830:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(b->buf + b->pos, name, namelen);
                           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
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
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/gpio/gpio-sim.c:515:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(devname, sizeof(devname), "gpio-sim.%u", simdev->id);
           ^~~~~~~~
   drivers/gpio/gpio-sim.c:515:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(devname, sizeof(devname), "gpio-sim.%u", simdev->id);
           ^~~~~~~~
   drivers/gpio/gpio-sim.c:648:2: warning: Call to function 'memmove' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(dup, trimmed, strlen(trimmed) + 1);
           ^~~~~~~
   drivers/gpio/gpio-sim.c:648:2: note: Call to function 'memmove' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memmove_s' in case of C11
           memmove(dup, trimmed, strlen(trimmed) + 1);
           ^~~~~~~
   drivers/gpio/gpio-sim.c:663:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   ret =3D sprintf(page, "%s\n", dev_name(&pdev->dev));
                         ^~~~~~~
   drivers/gpio/gpio-sim.c:663:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   ret =3D sprintf(page, "%s\n", dev_name(&pdev->dev));
                         ^~~~~~~
   drivers/gpio/gpio-sim.c:665:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(page, "gpio-sim.%d\n", dev->id);
                         ^~~~~~~
   drivers/gpio/gpio-sim.c:665:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(page, "gpio-sim.%d\n", dev->id);
                         ^~~~~~~
   drivers/gpio/gpio-sim.c:683:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%c\n", live ? '1' : '0');
                  ^~~~~~~
   drivers/gpio/gpio-sim.c:683:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%c\n", live ? '1' : '0');
                  ^~~~~~~
   drivers/gpio/gpio-sim.c:826:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(properties, 0, sizeof(properties));
           ^~~~~~
   drivers/gpio/gpio-sim.c:826:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(properties, 0, sizeof(properties));
           ^~~~~~
   drivers/gpio/gpio-sim.c:894:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pdevinfo, 0, sizeof(pdevinfo));
           ^~~~~~
   drivers/gpio/gpio-sim.c:894:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(&pdevinfo, 0, sizeof(pdevinfo));
           ^~~~~~
   drivers/gpio/gpio-sim.c:1012:11: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
                           return sprintf(ctx->page, "%s\n", dev_name(dev));
                                  ^~~~~~~
   drivers/gpio/gpio-sim.c:1012:11: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
                           return sprintf(ctx->page, "%s\n", dev_name(dev));
                                  ^~~~~~~
   drivers/gpio/gpio-sim.c:1031:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(page, "none\n");
                         ^~~~~~~
   drivers/gpio/gpio-sim.c:1031:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(page, "none\n");
                         ^~~~~~~
   drivers/gpio/gpio-sim.c:1047:8: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           ret =3D sprintf(page, "%s\n", bank->label ?: "");
                 ^~~~~~~
   drivers/gpio/gpio-sim.c:1047:8: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           ret =3D sprintf(page, "%s\n", bank->label ?: "");
                 ^~~~~~~
   drivers/gpio/gpio-sim.c:1090:8: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sprintf(page, "%u\n", bank->num_lines);
                 ^~~~~~~
   drivers/gpio/gpio-sim.c:1090:8: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           ret =3D sprintf(page, "%u\n", bank->num_lines);
                 ^~~~~~~
   drivers/gpio/gpio-sim.c:1142:8: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           ret =3D sprintf(page, "%s\n", line->name ?: "");
                 ^~~~~~~
   drivers/gpio/gpio-sim.c:1142:8: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           ret =3D sprintf(page, "%s\n", line->name ?: "");
--
                               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-irq.c:502:3: note: Loop condition is true.  E=
ntering loop body
                   for (i =3D 0; i < data->chip->num_regs; i++) {
                   ^
   drivers/base/regmap/regmap-irq.c:503:4: note: Control jumps to 'case 4:'=
  at line 510
                           switch (map->format.val_bytes) {
                           ^
   drivers/base/regmap/regmap-irq.c:511:27: note: Array access (from variab=
le 'buf32') results in a null pointer dereference
                                   data->status_buf[i] =3D buf32[i];
                                                         ^~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   lib/xz/xz_dec_stream.c:162:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(s->temp.buf + s->temp.pos, b->in + b->in_pos, copy_size);
           ^~~~~~
   lib/xz/xz_dec_stream.c:162:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(s->temp.buf + s->temp.pos, b->in + b->in_pos, copy_size);
           ^~~~~~
   lib/xz/xz_dec_stream.c:822:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memzero(&s->block, sizeof(s->block));
           ^
   lib/xz/xz_private.h:44:30: note: expanded from macro 'memzero'
   #               define memzero(buf, size) memset(buf, 0, size)
                                             ^~~~~~
   lib/xz/xz_dec_stream.c:822:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memzero(&s->block, sizeof(s->block));
           ^
   lib/xz/xz_private.h:44:30: note: expanded from macro 'memzero'
   #               define memzero(buf, size) memset(buf, 0, size)
                                             ^~~~~~
   lib/xz/xz_dec_stream.c:823:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memzero(&s->index, sizeof(s->index));
           ^
   lib/xz/xz_private.h:44:30: note: expanded from macro 'memzero'
   #               define memzero(buf, size) memset(buf, 0, size)
                                             ^~~~~~
   lib/xz/xz_dec_stream.c:823:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memzero(&s->index, sizeof(s->index));
           ^
   lib/xz/xz_private.h:44:30: note: expanded from macro 'memzero'
   #               define memzero(buf, size) memset(buf, 0, size)
                                             ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   lib/xz/xz_dec_lzma2.c:401:3: warning: Call to function 'memmove' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(dict->buf + dict->pos, b->in + b->in_pos, copy_s=
ize);
                   ^~~~~~~
   lib/xz/xz_dec_lzma2.c:401:3: note: Call to function 'memmove' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memmove_s' in case of C11
                   memmove(dict->buf + dict->pos, b->in + b->in_pos, copy_s=
ize);
                   ^~~~~~~
   lib/xz/xz_dec_lzma2.c:415:4: warning: Call to function 'memmove' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(b->out + b->out_pos, b->in + b->in_pos,
                           ^~~~~~~
   lib/xz/xz_dec_lzma2.c:415:4: note: Call to function 'memmove' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memmove_s' in case of C11
                           memmove(b->out + b->out_pos, b->in + b->in_pos,
                           ^~~~~~~
   lib/xz/xz_dec_lzma2.c:456:4: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(b->out + b->out_pos, dict->buf + dict->st=
art,
                           ^~~~~~
   lib/xz/xz_dec_lzma2.c:456:4: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                           memcpy(b->out + b->out_pos, dict->buf + dict->st=
art,
                           ^~~~~~
   lib/xz/xz_dec_lzma2.c:892:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(s->temp.buf + s->temp.size, b->in + b->in_pos, tm=
p);
                   ^~~~~~
   lib/xz/xz_dec_lzma2.c:892:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(s->temp.buf + s->temp.size, b->in + b->in_pos, tm=
p);
                   ^~~~~~
   lib/xz/xz_dec_lzma2.c:895:4: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memzero(s->temp.buf + s->temp.size + tmp,
                           ^
   lib/xz/xz_private.h:44:30: note: expanded from macro 'memzero'
   #               define memzero(buf, size) memset(buf, 0, size)
                                             ^~~~~~
   lib/xz/xz_dec_lzma2.c:895:4: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                           memzero(s->temp.buf + s->temp.size + tmp,
                           ^
   lib/xz/xz_private.h:44:30: note: expanded from macro 'memzero'
   #               define memzero(buf, size) memset(buf, 0, size)
                                             ^~~~~~
   lib/xz/xz_dec_lzma2.c:917:4: warning: Call to function 'memmove' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(s->temp.buf, s->temp.buf + s->rc.in_pos,
                           ^~~~~~~
   lib/xz/xz_dec_lzma2.c:917:4: note: Call to function 'memmove' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memmove_s' in case of C11
                           memmove(s->temp.buf, s->temp.buf + s->rc.in_pos,
                           ^~~~~~~
   lib/xz/xz_dec_lzma2.c:952:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(s->temp.buf, b->in + b->in_pos, in_avail);
                   ^~~~~~
   lib/xz/xz_dec_lzma2.c:952:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(s->temp.buf, b->in + b->in_pos, in_avail);
                   ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
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
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:151:9: warning: 2nd =
function call argument is an uninitialized value [clang-analyzer-core.CallA=
ndMessage]
                   ret =3D cdns_mhdp_mailbox_write(mhdp, header[i]);
                         ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2413:8: note: Callin=
g 'cdns_mhdp_update_link_status'
           ret =3D cdns_mhdp_update_link_status(mhdp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2258:18: note: Calli=
ng 'cdns_mhdp_detect_hpd'
           mhdp->plugged =3D cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2224:14: note: Calli=
ng 'cdns_mhdp_read_hpd_event'
           hpd_event =3D cdns_mhdp_read_hpd_event(mhdp);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:447:8: note: Calling=
 'cdns_mhdp_mailbox_send'
           ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:150:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < sizeof(header); i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:7: note: Assumin=
g 'ret' is 0
                   if (ret)
                       ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:3: note: Taking =
false branch
                   if (ret)
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:150:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < sizeof(header); i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:7: note: Assumin=
g 'ret' is 0
                   if (ret)
                       ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:3: note: Taking =
false branch
                   if (ret)
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:150:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < sizeof(header); i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:7: note: Assumin=
g 'ret' is 0
                   if (ret)
                       ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:152:3: note: Taking =
false branch
                   if (ret)
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:150:34: note: The va=
lue 3 is assigned to 'i'
           for (i =3D 0; i < sizeof(header); i++) {
--
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/crypto/s5p-sss.c:1381:6: note: 'req' is non-null
           if (req)
               ^~~
   drivers/crypto/s5p-sss.c:1381:2: note: Taking true branch
           if (req)
           ^
   drivers/crypto/s5p-sss.c:1384:6: note: Assuming the condition is false
           if (test_bit(HASH_FLAGS_BUSY, &dd->hash_flags)) {
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/crypto/s5p-sss.c:1384:2: note: Taking false branch
           if (test_bit(HASH_FLAGS_BUSY, &dd->hash_flags)) {
           ^
   drivers/crypto/s5p-sss.c:1391:6: note: Assuming 'async_req' is non-null
           if (async_req)
               ^~~~~~~~~
   drivers/crypto/s5p-sss.c:1391:2: note: Taking true branch
           if (async_req)
           ^
   drivers/crypto/s5p-sss.c:1396:7: note: 'async_req' is non-null
           if (!async_req)
                ^~~~~~~~~
   drivers/crypto/s5p-sss.c:1396:2: note: Taking false branch
           if (!async_req)
           ^
   drivers/crypto/s5p-sss.c:1399:6: note: Assuming 'backlog' is null
           if (backlog)
               ^~~~~~~
   drivers/crypto/s5p-sss.c:1399:2: note: Taking false branch
           if (backlog)
           ^
   drivers/crypto/s5p-sss.c:1407:6: note: 'err' is 0
           if (err || !ctx->total)
               ^~~
   drivers/crypto/s5p-sss.c:1407:6: note: Left side of '||' is false
   drivers/crypto/s5p-sss.c:1407:13: note: Assuming field 'total' is 0
           if (err || !ctx->total)
                      ^~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1407:2: note: Taking true branch
           if (err || !ctx->total)
           ^
   drivers/crypto/s5p-sss.c:1408:3: note: Control jumps to line 1426
                   goto out;
                   ^
   drivers/crypto/s5p-sss.c:1426:2: note: Taking true branch
           if (err !=3D -EINPROGRESS) {
           ^
   drivers/crypto/s5p-sss.c:1428:3: note: Calling 's5p_hash_finish_req'
                   s5p_hash_finish_req(req, err);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1332:6: note: Assuming the condition is false
           if (test_bit(HASH_FLAGS_SGS_COPIED, &dd->hash_flags))
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/crypto/s5p-sss.c:1332:2: note: Taking false branch
           if (test_bit(HASH_FLAGS_SGS_COPIED, &dd->hash_flags))
           ^
   drivers/crypto/s5p-sss.c:1336:6: note: Assuming the condition is true
           if (test_bit(HASH_FLAGS_SGS_ALLOCED, &dd->hash_flags))
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/crypto/s5p-sss.c:1336:2: note: Taking true branch
           if (test_bit(HASH_FLAGS_SGS_ALLOCED, &dd->hash_flags))
           ^
   drivers/crypto/s5p-sss.c:1337:3: note: Memory is released
                   kfree(ctx->sg);
                   ^~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1339:10: note: Use of memory after it is freed
           ctx->sg =3D NULL;
           ~~~~~~~ ^
   drivers/crypto/s5p-sss.c:1701:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, ctx, sizeof(*ctx) + ctx->bufcnt);
           ^~~~~~
   drivers/crypto/s5p-sss.c:1701:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(out, ctx, sizeof(*ctx) + ctx->bufcnt);
           ^~~~~~
   drivers/crypto/s5p-sss.c:1718:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx, in, sizeof(*ctx) + BUFLEN);
           ^~~~~~
   drivers/crypto/s5p-sss.c:1718:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx, in, sizeof(*ctx) + BUFLEN);
           ^~~~~~
   drivers/crypto/s5p-sss.c:2056:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->aes_key, key, keylen);
           ^~~~~~
   drivers/crypto/s5p-sss.c:2056:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->aes_key, key, keylen);
           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
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
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/mtd/nand/raw/nand_jedec.c:103:6: warning: The result of the left=
 shift is undefined because the right operand is negative [clang-analyzer-c=
ore.UndefinedBinaryOperatorResult]
                           1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
                             ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_jedec.c:27:25: note: Calling 'nand_to_mtd'
           struct mtd_info *mtd =3D nand_to_mtd(chip);
                                  ^~~~~~~~~~~~~~~~~
   include/linux/mtd/rawnand.h:1315:2: note: Returning without writing to '=
chip->parameters.model', which participates in a condition later
           return &chip->base.mtd;
--
                   ^
   mm/vmalloc.c:2211:6: note: Assuming the condition is true
           if (vmap_pages_range(addr, addr + size, PAGE_KERNEL,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:2211:2: note: Taking true branch
           if (vmap_pages_range(addr, addr + size, PAGE_KERNEL,
           ^
   mm/vmalloc.c:2213:3: note: Calling 'vm_unmap_ram'
                   vm_unmap_ram(mem, count);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:2151:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:180:29: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                               ^
   include/linux/kernel.h:115:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   mm/vmalloc.c:2151:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:180:24: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                          ^
   mm/vmalloc.c:2152:9: note: Assuming 'addr' is 0
           BUG_ON(!addr);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   mm/vmalloc.c:2159:13: note: 'count' is > 32
           if (likely(count <=3D VMAP_MAX_ALLOC)) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   mm/vmalloc.c:2159:2: note: Taking false branch
           if (likely(count <=3D VMAP_MAX_ALLOC)) {
           ^
   mm/vmalloc.c:2165:7: note: Calling 'find_vmap_area'
           va =3D find_vmap_area(addr);
                ^~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:1792:2: note: Value assigned to 'va'
           va =3D __find_vmap_area(addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:1795:2: note: Returning pointer (loaded from 'va')
           return va;
           ^~~~~~~~~
   mm/vmalloc.c:2165:7: note: Returning from 'find_vmap_area'
           va =3D find_vmap_area(addr);
                ^~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:2165:2: note: Value assigned to 'va'
           va =3D find_vmap_area(addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:2166:9: note: Assuming 'va' is null
           BUG_ON(!va);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   mm/vmalloc.c:2167:37: note: Access to field 'va_start' results in a dere=
ference of a null pointer (loaded from variable 'va')
           debug_check_no_locks_freed((void *)va->va_start,
                                              ^~
   mm/vmalloc.c:3362:4: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, map + offset, length);
                           ^~~~~~
   mm/vmalloc.c:3362:4: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
                           memcpy(buf, map + offset, length);
                           ^~~~~~
   mm/vmalloc.c:3365:4: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                           memset(buf, 0, length);
                           ^~~~~~
   mm/vmalloc.c:3365:4: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
                           memset(buf, 0, length);
                           ^~~~~~
   mm/vmalloc.c:3445:4: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                           memset(buf, 0, n);
                           ^~~~~~
   mm/vmalloc.c:3445:4: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
                           memset(buf, 0, n);
                           ^~~~~~
   mm/vmalloc.c:3457:3: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                   memset(buf, 0, buflen - (buf - buf_start));
                   ^~~~~~
   mm/vmalloc.c:3457:3: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
                   memset(buf, 0, buflen - (buf - buf_start));
                   ^~~~~~
   mm/vmalloc.c:3954:3: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                   memset(counters, 0, nr_node_ids * sizeof(unsigned int));
                   ^~~~~~
   mm/vmalloc.c:3954:3: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
                   memset(counters, 0, nr_node_ids * sizeof(unsigned int));
                   ^~~~~~
   Suppressed 40 warnings (39 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
>> drivers/mmc/host/omap_hsmmc.c:747:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           return sprintf(buf, "%s\n", mmc_pdata(host)->name);
                  ^~~~~~~
   drivers/mmc/host/omap_hsmmc.c:747:9: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           return sprintf(buf, "%s\n", mmc_pdata(host)->name);
                  ^~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/mmc/host/davinci_mmc.c:631:37: warning: The result of the '/' ex=
pression is undefined [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   host->ns_in_one_cycle =3D (1000000) / (((mmc_pclk
                                                     ^
   drivers/mmc/host/davinci_mmc.c:646:6: note: Assuming field 'bus_mode' is=
 not equal to MMC_BUSMODE_OPENDRAIN
           if (ios->bus_mode =3D=3D MMC_BUSMODE_OPENDRAIN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:646:2: note: Taking false branch
           if (ios->bus_mode =3D=3D MMC_BUSMODE_OPENDRAIN) {
           ^
   drivers/mmc/host/davinci_mmc.c:666:24: note: Calling 'calculate_freq_for=
_card'
                   mmc_push_pull_freq =3D calculate_freq_for_card(host, ios=
->clock);
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/mmc/host/davinci_mmc.c:618:6: note: Assuming 'mmc_req_freq' is 0
           if (mmc_req_freq && mmc_pclk > (2 * mmc_req_freq))
               ^~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:618:19: note: Left side of '&&' is false
           if (mmc_req_freq && mmc_pclk > (2 * mmc_req_freq))
                            ^
   drivers/mmc/host/davinci_mmc.c:627:6: note: Assuming 'mmc_freq' is <=3D =
'mmc_req_freq'
           if (mmc_freq > mmc_req_freq)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:627:2: note: Taking false branch
           if (mmc_freq > mmc_req_freq)
           ^
   drivers/mmc/host/davinci_mmc.c:630:6: note: 'mmc_req_freq' is <=3D 400000
           if (mmc_req_freq <=3D 400000)
               ^~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:630:2: note: Taking true branch
           if (mmc_req_freq <=3D 400000)
           ^
   drivers/mmc/host/davinci_mmc.c:631:37: note: The result of the '/' expre=
ssion is undefined
                   host->ns_in_one_cycle =3D (1000000) / (((mmc_pclk
                                           ~~~~~~~~~~^~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:939:15: warning: Access to field 'error' =
results in a dereference of a null pointer (loaded from variable 'data') [c=
lang-analyzer-core.NullDereference]
                   data->error =3D -ETIMEDOUT;
                   ~~~~        ^
   drivers/mmc/host/davinci_mmc.c:870:2: note: 'data' initialized here
           struct mmc_data *data =3D host->data;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:872:6: note: Assuming field 'cmd' is not =
equal to NULL
           if (host->cmd =3D=3D NULL && host->data =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:872:24: note: Left side of '&&' is false
           if (host->cmd =3D=3D NULL && host->data =3D=3D NULL) {
                                 ^
   drivers/mmc/host/davinci_mmc.c:891:6: note: Assuming field 'bytes_left' =
is 0
           if (host->bytes_left && (status & (MMCST0_DXRDY | MMCST0_DRRDY))=
) {
               ^~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:891:23: note: Left side of '&&' is false
           if (host->bytes_left && (status & (MMCST0_DXRDY | MMCST0_DRRDY))=
) {
                                ^
   drivers/mmc/host/davinci_mmc.c:920:6: note: Assuming the condition is tr=
ue
           if (qstatus & MMCST0_DATDNE) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:920:2: note: Taking true branch
           if (qstatus & MMCST0_DATDNE) {
           ^
   drivers/mmc/host/davinci_mmc.c:922:7: note: Assuming 'data' is equal to =
NULL
                   if (data !=3D NULL) {
                       ^~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:922:3: note: Taking false branch
                   if (data !=3D NULL) {
                   ^
   drivers/mmc/host/davinci_mmc.c:932:4: note: Left side of '&&' is true
                           dev_err(mmc_dev(host->mmc),
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
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/mmc/host/davinci_mmc.c:932:4: note: Taking true branch
                           dev_err(mmc_dev(host->mmc),
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
--
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/brcmstb_gisb.c:422:6: note: Returning from 'IS_ERR'
           if (IS_ERR(gdev->base))
               ^~~~~~~~~~~~~~~~~~
   drivers/bus/brcmstb_gisb.c:422:2: note: Taking false branch
           if (IS_ERR(gdev->base))
           ^
   drivers/bus/brcmstb_gisb.c:426:6: note: Assuming 'of_id' is non-null
           if (!of_id) {
               ^~~~~~
   drivers/bus/brcmstb_gisb.c:426:2: note: Taking false branch
           if (!of_id) {
           ^
   drivers/bus/brcmstb_gisb.c:436:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/bus/brcmstb_gisb.c:436:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/bus/brcmstb_gisb.c:442:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/bus/brcmstb_gisb.c:442:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/bus/brcmstb_gisb.c:446:6: note: Assuming 'bp_irq' is <=3D 0
           if (bp_irq > 0) {
               ^~~~~~~~~~
   drivers/bus/brcmstb_gisb.c:446:2: note: Taking false branch
           if (bp_irq > 0) {
           ^
   drivers/bus/brcmstb_gisb.c:455:2: note: Taking false branch
           if (of_property_read_u32(dn, "brcm,gisb-arb-master-mask",
           ^
   drivers/bus/brcmstb_gisb.c:464:6: note: Assuming the condition is true
           if (hweight_long(gdev->valid_mask) =3D=3D num_masters) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/brcmstb_gisb.c:464:2: note: Taking true branch
           if (hweight_long(gdev->valid_mask) =3D=3D num_masters) {
           ^
   drivers/bus/brcmstb_gisb.c:468:19: note: Assuming 'i' is < 'last'
                   for (i =3D first; i < last; i++) {
                                   ^~~~~~~~
   drivers/bus/brcmstb_gisb.c:468:3: note: Loop condition is true.  Enterin=
g loop body
                   for (i =3D first; i < last; i++) {
                   ^
   drivers/bus/brcmstb_gisb.c:469:8: note: Assuming the condition is true
                           if (!(gdev->valid_mask & BIT(i)))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/brcmstb_gisb.c:469:4: note: Taking true branch
                           if (!(gdev->valid_mask & BIT(i)))
                           ^
   drivers/bus/brcmstb_gisb.c:470:5: note:  Execution continues on line 468
                                   continue;
                                   ^
   drivers/bus/brcmstb_gisb.c:468:29: note: The value 32 is assigned to 'i'
                   for (i =3D first; i < last; i++) {
                                             ^~~
   drivers/bus/brcmstb_gisb.c:468:19: note: Assuming 'i' is < 'last'
                   for (i =3D first; i < last; i++) {
                                   ^~~~~~~~
   drivers/bus/brcmstb_gisb.c:468:3: note: Loop condition is true.  Enterin=
g loop body
                   for (i =3D first; i < last; i++) {
                   ^
   drivers/bus/brcmstb_gisb.c:469:29: note: The result of the left shift is=
 undefined due to shifting by '32', which is greater or equal to the width =
of type 'unsigned long'
                           if (!(gdev->valid_mask & BIT(i)))
                                                    ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   Suppressed 31 warnings (30 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/mmc/core/mmc_ops.c:270:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cxd, cmd.resp, sizeof(u32) * 4);
           ^~~~~~
   drivers/mmc/core/mmc_ops.c:270:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(cxd, cmd.resp, sizeof(u32) * 4);
           ^~~~~~
   drivers/mmc/core/mmc_ops.c:789:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data_buf, test_buf, len);
                   ^~~~~~
   drivers/mmc/core/mmc_ops.c:789:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data_buf, test_buf, len);
                   ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/i2c/busses/i2c-jz4780.c:573:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, len);
           ^~~~~~
   drivers/i2c/busses/i2c-jz4780.c:573:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, len);
           ^~~~~~
>> drivers/i2c/busses/i2c-jz4780.c:784:2: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           sprintf(i2c->adap.name, "%s", pdev->name);
           ^~~~~~~
   drivers/i2c/busses/i2c-jz4780.c:784:2: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           sprintf(i2c->adap.name, "%s", pdev->name);
           ^~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/gpu/ipu-v3/ipu-csi.c:351:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(csicfg, 0, sizeof(*csicfg));
           ^~~~~~
   drivers/gpu/ipu-v3/ipu-csi.c:351:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(csicfg, 0, sizeof(*csicfg));
           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (41 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/media/i2c/saa6588.c:157:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &s->buffer[s->rd_index], 3);
           ^~~~~~
   drivers/media/i2c/saa6588.c:157:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &s->buffer[s->rd_index], 3);
           ^~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/media/dvb-frontends/s5h1420.c:186:29: warning: The result of the=
 left shift is undefined because the left operand is negative [clang-analyz=
er-core.UndefinedBinaryOperatorResult]
                                         ((cmd->msg_len-1) << 4) | 0x08);
                                          ~~~~~~~~~~~~~~~~ ^
   drivers/media/dvb-frontends/s5h1420.c:170:2: note: Assuming 'debug' is 0
           dprintk("enter %s\n", __func__);
           ^
   drivers/media/dvb-frontends/s5h1420.c:61:6: note: expanded from macro 'd=
printk'
           if (debug) \
               ^~~~~
   drivers/media/dvb-frontends/s5h1420.c:170:2: note: Taking false branch
           dprintk("enter %s\n", __func__);
           ^
   drivers/media/dvb-frontends/s5h1420.c:61:2: note: expanded from macro 'd=
printk'
           if (debug) \
           ^
   drivers/media/dvb-frontends/s5h1420.c:170:2: note: Loop condition is fal=
se.  Exiting loop
           dprintk("enter %s\n", __func__);
           ^
   drivers/media/dvb-frontends/s5h1420.c:60:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) do { \
                         ^
   drivers/media/dvb-frontends/s5h1420.c:171:6: note: Assuming the conditio=
n is false
           if (cmd->msg_len > sizeof(cmd->msg))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/s5h1420.c:171:2: note: Taking false branch
           if (cmd->msg_len > sizeof(cmd->msg))
           ^
   drivers/media/dvb-frontends/s5h1420.c:180:11: note: Assuming 'i' is >=3D=
 field 'msg_len'
           for(i=3D0; i< cmd->msg_len; i++) {
                    ^~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/s5h1420.c:180:2: note: Loop condition is fal=
se. Execution continues on line 185
           for(i=3D0; i< cmd->msg_len; i++) {
           ^
   drivers/media/dvb-frontends/s5h1420.c:186:29: note: The result of the le=
ft shift is undefined because the left operand is negative
                                         ((cmd->msg_len-1) << 4) | 0x08);
                                          ~~~~~~~~~~~~~~~~ ^
   drivers/media/dvb-frontends/s5h1420.c:846:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(m, 0, sizeof(struct i2c_msg) * (1 + num));
           ^~~~~~
   drivers/media/dvb-frontends/s5h1420.c:846:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(m, 0, sizeof(struct i2c_msg) * (1 + num));
           ^~~~~~
   drivers/media/dvb-frontends/s5h1420.c:852:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&m[1], msg, sizeof(struct i2c_msg) * num);
           ^~~~~~
   drivers/media/dvb-frontends/s5h1420.c:852:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&m[1], msg, sizeof(struct i2c_msg) * num);
           ^~~~~~
   drivers/media/dvb-frontends/s5h1420.c:895:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(state->shadow, 0xff, sizeof(state->shadow));
           ^~~~~~
   drivers/media/dvb-frontends/s5h1420.c:895:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(state->shadow, 0xff, sizeof(state->shadow));
--
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/thermal/rcar_gen3_thermal.c:502:3: note: '?' condition is true
                   dev_info(dev, "No calibration values fused, fallback to =
driver values\n");
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
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/thermal/rcar_gen3_thermal.c:502:3: note: Loop condition is false=
.  Exiting loop
                   dev_info(dev, "No calibration values fused, fallback to =
driver values\n");
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
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/thermal/rcar_gen3_thermal.c:504:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < priv->num_tscs; i++) {
           ^
   drivers/thermal/rcar_gen3_thermal.c:509:3: note: Taking false branch
                   if (IS_ERR(zone)) {
                   ^
   drivers/thermal/rcar_gen3_thermal.c:517:3: note: Calling 'rcar_gen3_ther=
mal_calc_coefs'
                   rcar_gen3_thermal_calc_coefs(priv, tsc, *ths_tj_1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/rcar_gen3_thermal.c:146:45: note: The result of the left=
 shift is undefined because the left operand is negative
                        / (priv->ptat[0] - priv->ptat[2])) + FIXPT_INT(TJ_3=
);
                                                             ^
   drivers/thermal/rcar_gen3_thermal.c:125:29: note: expanded from macro 'F=
IXPT_INT'
   #define FIXPT_INT(_x) ((_x) << FIXPT_SHIFT)
                          ~~~~ ^
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/greybus/interface.c:472:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:472:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:491:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:491:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:510:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:510:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:589:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", gb_interface_type_string(intf));
                  ^~~~~~~
   drivers/greybus/interface.c:589:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", gb_interface_type_string(intf));
                  ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/w1/slaves/w1_ds28e04.c:137:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, &data->memory[off], count);
                   ^~~~~~
   drivers/w1/slaves/w1_ds28e04.c:137:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, &data->memory[off], count);
                   ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
>> drivers/power/supply/wm8350_power.c:179:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n", charge);
                  ^~~~~~~
   drivers/power/supply/wm8350_power.c:179:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n", charge);
                  ^~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/media/dvb-frontends/stv0910.c:683:4: warning: Value stored to 's=
tatus' is never read [clang-analyzer-deadcode.DeadStores]
                           status =3D write_reg(state, RSTV0910_P2_ERRCTRL1=
 +
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0910.c:683:4: note: Value stored to 'stat=
us' is never read
                           status =3D write_reg(state, RSTV0910_P2_ERRCTRL1=
 +
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0910.c:689:4: warning: Value stored to 's=
tatus' is never read [clang-analyzer-deadcode.DeadStores]
                           status =3D write_reg(state, RSTV0910_P2_ERRCTRL1=
 +
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0910.c:689:4: note: Value stored to 'stat=
us' is never read
                           status =3D write_reg(state, RSTV0910_P2_ERRCTRL1=
 +
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/media/dvb-frontends/mxl5xx.c:230:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[6], reg_data_ptr, size);
           ^~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:230:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[6], reg_data_ptr, size);
           ^~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:412:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           BUILD_HYDRA_CMD(MXL_HYDRA_ABORT_TUNE_CMD, MXL_CMD_WRITE,
           ^
   drivers/media/dvb-frontends/mxl5xx_defs.h:196:3: note: expanded from mac=
ro 'BUILD_HYDRA_CMD'
                   memcpy((void *)&cmd_buff[6], data_ptr, size);           \
                   ^~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:412:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           BUILD_HYDRA_CMD(MXL_HYDRA_ABORT_TUNE_CMD, MXL_CMD_WRITE,
           ^
   drivers/media/dvb-frontends/mxl5xx_defs.h:196:3: note: expanded from mac=
ro 'BUILD_HYDRA_CMD'
                   memcpy((void *)&cmd_buff[6], data_ptr, size);           \
                   ^~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:482:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           BUILD_HYDRA_CMD(MXL_HYDRA_DEMOD_SET_PARAM_CMD, MXL_CMD_WRITE,
           ^
   drivers/media/dvb-frontends/mxl5xx_defs.h:196:3: note: expanded from mac=
ro 'BUILD_HYDRA_CMD'
                   memcpy((void *)&cmd_buff[6], data_ptr, size);           \
                   ^~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:482:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           BUILD_HYDRA_CMD(MXL_HYDRA_DEMOD_SET_PARAM_CMD, MXL_CMD_WRITE,
           ^
   drivers/media/dvb-frontends/mxl5xx_defs.h:196:3: note: expanded from mac=
ro 'BUILD_HYDRA_CMD'
                   memcpy((void *)&cmd_buff[6], data_ptr, size);           \
                   ^~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:552:35: warning: Assigned value is =
garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   p->pre_bit_error.stat[0].uvalue =3D reg[2];
                                                   ^
   drivers/media/dvb-frontends/mxl5xx.c:656:6: note: Assuming 're_tune' is =
false
           if (re_tune) {
               ^~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:656:2: note: Taking false branch
           if (re_tune) {
           ^
   drivers/media/dvb-frontends/mxl5xx.c:663:9: note: Calling 'read_status'
           return read_status(fe, status);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:624:13: note: Assuming 'reg_data' i=
s equal to 1
           *status =3D (reg_data =3D=3D 1) ? 0x1f : 0;
                      ^~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:624:12: note: '?' condition is true
           *status =3D (reg_data =3D=3D 1) ? 0x1f : 0;
                     ^
   drivers/media/dvb-frontends/mxl5xx.c:629:2: note: Calling 'read_signal_s=
trength'
           read_signal_strength(fe);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:607:2: note: Returning without writ=
ing to 'fe->dtv_property_cache.delivery_system', which participates in a co=
ndition later
           return stat;
           ^
   drivers/media/dvb-frontends/mxl5xx.c:629:2: note: Returning from 'read_s=
ignal_strength'
           read_signal_strength(fe);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:631:2: note: Taking true branch
           if (*status & FE_HAS_CARRIER)
           ^
   drivers/media/dvb-frontends/mxl5xx.c:632:3: note: Calling 'read_snr'
                   read_snr(fe);
                   ^~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:530:2: note: Returning without writ=
ing to 'fe->dtv_property_cache.delivery_system', which participates in a co=
ndition later
           return stat;
           ^
   drivers/media/dvb-frontends/mxl5xx.c:632:3: note: Returning from 'read_s=
nr'
                   read_snr(fe);
                   ^~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:636:2: note: Taking true branch
           if (*status & FE_HAS_SYNC)
           ^
   drivers/media/dvb-frontends/mxl5xx.c:637:3: note: Calling 'read_ber'
                   read_ber(fe);
--
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1373:7: note: 'gpu_fence' is non-n=
ull
           if (!gpu_fence) {
                ^~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1373:2: note: Taking false branch
           if (!gpu_fence) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1380:6: note: Assuming field 'fe_r=
unning' is true
           if (!gpu->fe_running)
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1380:2: note: Taking false branch
           if (!gpu->fe_running)
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1383:6: note: Assuming field 'prev=
_mmu_context' is null
           if (submit->prev_mmu_context)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1383:2: note: Taking false branch
           if (submit->prev_mmu_context)
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1387:14: note: Field 'nr_pmrs' is 0
           if (submit->nr_pmrs) {
                       ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1387:2: note: Taking false branch
           if (submit->nr_pmrs) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1399:6: note: Assuming field 'nr_p=
mrs' is not equal to 0
           if (submit->nr_pmrs) {
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1399:2: note: Taking true branch
           if (submit->nr_pmrs) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1400:3: note: Array subscript is u=
ndefined
                   gpu->event[event[2]].sync_point =3D &sync_point_perfmon_=
sample_post;
                   ^          ~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/power/supply/twl4030_charger.c:364:2: warning: Value stored to '=
cur_reg' is never read [clang-analyzer-deadcode.DeadStores]
           cur_reg |=3D oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:364:2: note: Value stored to 'cur=
_reg' is never read
           cur_reg |=3D oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: warning: Value stored to '=
status' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: note: Value stored to 'sta=
tus' is never read
                   status =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl4030_clear_set_boot_bci(0, TWL4030_BC=
IAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl4030_clear_set_boot_bci(0, TWL4030_BC=
IAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/twl4030_charger.c:487:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:487:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:490:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:490:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:493:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:493:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:496:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:496:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:499:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x9c,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:499:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x9c,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 42 warnings (41 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
>> drivers/leds/trigger/ledtrig-tty.c:33:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
                   len =3D sprintf(buf, "%s\n", trigger_data->ttyname);
                         ^~~~~~~
   drivers/leds/trigger/ledtrig-tty.c:33:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
                   len =3D sprintf(buf, "%s\n", trigger_data->ttyname);
                         ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/leds/led-class-flash.c:75:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", fled_cdev->brightness.val);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:75:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", fled_cdev->brightness.val);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:85:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", fled_cdev->brightness.max);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:85:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", fled_cdev->brightness.max);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:133:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", state);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:133:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", state);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:172:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", fled_cdev->timeout.val);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:172:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", fled_cdev->timeout.val);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:182:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", fled_cdev->timeout.max);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:182:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", fled_cdev->timeout.max);
                  ^~~~~~~
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
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/media/v4l2-core/v4l2-device.c:37:3: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(v4l2_dev->name, sizeof(v4l2_dev->name), "%s %s",
                   ^~~~~~~~
   drivers/media/v4l2-core/v4l2-device.c:37:3: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(v4l2_dev->name, sizeof(v4l2_dev->name), "%s %s",
                   ^~~~~~~~
   drivers/media/v4l2-core/v4l2-device.c:67:3: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(v4l2_dev->name, sizeof(v4l2_dev->name),
                   ^~~~~~~~
   drivers/media/v4l2-core/v4l2-device.c:67:3: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(v4l2_dev->name, sizeof(v4l2_dev->name),
                   ^~~~~~~~
   drivers/media/v4l2-core/v4l2-device.c:70:3: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(v4l2_dev->name, sizeof(v4l2_dev->name),
                   ^~~~~~~~
   drivers/media/v4l2-core/v4l2-device.c:70:3: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(v4l2_dev->name, sizeof(v4l2_dev->name),
                   ^~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/power/supply/max1721x_battery.c:259:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(str, 13, "%04X%04X%04X", val[0], val[1], val[2]);
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:259:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(str, 13, "%04X%04X%04X", val[0], val[1], val[2]);
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:341:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(info->name, sizeof(info->name),
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:341:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(info->name, sizeof(info->name),
--
   33 warnings generated.
   drivers/gpu/drm/scheduler/sched_main.c:627:10: warning: Access to field =
'rq' results in a dereference of a null pointer (loaded from variable 'enti=
ty') [clang-analyzer-core.NullDereference]
           sched =3D entity->rq->sched;
                   ^~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:623:2: note: 'entity' initialized=
 here
           struct drm_sched_entity *entity =3D job->entity;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/scheduler/sched_main.c:625:9: note: Assuming 'entity' is=
 null
           BUG_ON(!entity);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/gpu/drm/scheduler/sched_main.c:627:10: note: Access to field 'rq=
' results in a dereference of a null pointer (loaded from variable 'entity')
           sched =3D entity->rq->sched;
                   ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/gpu/drm/scheduler/sched_entity.c:68:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(entity, 0, sizeof(struct drm_sched_entity));
           ^~~~~~
   drivers/gpu/drm/scheduler/sched_entity.c:68:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(entity, 0, sizeof(struct drm_sched_entity));
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   fs/iomap/direct-io.c:405:4: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(iomap_inline_data(iomap, size), 0, pos - =
size);
                           ^~~~~~
   fs/iomap/direct-io.c:405:4: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                           memset(iomap_inline_data(iomap, size), 0, pos - =
size);
                           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/phy/marvell/phy-mmp3-usb.c:143:16: warning: Value stored to 'bas=
e' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           void __iomem *base =3D mmp3_usb_phy->base;
                         ^~~~   ~~~~~~~~~~~~~~~~~~
   drivers/phy/marvell/phy-mmp3-usb.c:143:16: note: Value stored to 'base' =
during its initialization is never read
           void __iomem *base =3D mmp3_usb_phy->base;
                         ^~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1996:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(desc, 0, sizeof(*desc));
           ^~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1996:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(desc, 0, sizeof(*desc));
           ^~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2212:4: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(oob, 0x99, mtd->oobsize);
                           ^~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2212:4: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                           memset(oob, 0x99, mtd->oobsize);
                           ^~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2259:4: warning: Value stored t=
o 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D brcmnand_read_by_pio(mtd, chip, addr, tr=
ans, buf,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2259:4: note: Value stored to '=
err' is never read
                           err =3D brcmnand_read_by_pio(mtd, chip, addr, tr=
ans, buf,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2551:9: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
           buf +=3D sprintf(buf,
                  ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2551:9: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
           buf +=3D sprintf(buf,
                  ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2561:3: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, ", Hamming ECC");
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2561:3: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, ", Hamming ECC");
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2563:3: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, ", BCH-%u (1KiB sector)", cfg->ecc_level <<=
 1);
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2563:3: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, ", BCH-%u (1KiB sector)", cfg->ecc_level <<=
 1);
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2565:3: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(buf, ", BCH-%u", cfg->ecc_level);
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2565:3: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(buf, ", BCH-%u", cfg->ecc_level);
                   ^~~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2592:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cfg, 0, sizeof(*cfg));
           ^~~~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2592:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(cfg, 0, sizeof(*cfg));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/iio/adc/mcp3422.c:277:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "240 60 15\n");
                          ^~~~~~~
   drivers/iio/adc/mcp3422.c:277:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "240 60 15\n");
                          ^~~~~~~
   drivers/iio/adc/mcp3422.c:279:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "240 60 15 3\n");
                  ^~~~~~~
   drivers/iio/adc/mcp3422.c:279:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "240 60 15 3\n");
                  ^~~~~~~
   drivers/iio/adc/mcp3422.c:288:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0.%09u 0.%09u 0.%09u 0.%09u\n",
                  ^~~~~~~
   drivers/iio/adc/mcp3422.c:288:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0.%09u 0.%09u 0.%09u 0.%09u\n",
                  ^~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/i2c/busses/i2c-stm32f7.c:2194:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(adap->name, sizeof(adap->name), "STM32F7 I2C(%pa)",
           ^~~~~~~~
   drivers/i2c/busses/i2c-stm32f7.c:2194:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(adap->name, sizeof(adap->name), "STM32F7 I2C(%pa)",
           ^~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/i2c/busses/i2c-stm32.c:35:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&dma_sconfig, 0, sizeof(dma_sconfig));
           ^~~~~~
   drivers/i2c/busses/i2c-stm32.c:35:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&dma_sconfig, 0, sizeof(dma_sconfig));
           ^~~~~~
   drivers/i2c/busses/i2c-stm32.c:57:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&dma_sconfig, 0, sizeof(dma_sconfig));
           ^~~~~~
   drivers/i2c/busses/i2c-stm32.c:57:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&dma_sconfig, 0, sizeof(dma_sconfig));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/media/dvb-frontends/m88ds3103.c:1687:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&board_info, 0, sizeof(board_info));
           ^~~~~~
   drivers/media/dvb-frontends/m88ds3103.c:1687:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&board_info, 0, sizeof(board_info));
           ^~~~~~
   drivers/media/dvb-frontends/m88ds3103.c:1874:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&dev->fe.ops, &m88ds3103_ops, sizeof(struct dvb_frontend_=
ops));
           ^~~~~~
   drivers/media/dvb-frontends/m88ds3103.c:1874:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&dev->fe.ops, &m88ds3103_ops, sizeof(struct dvb_frontend_=
ops));

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
--===============0808953250550292903==--


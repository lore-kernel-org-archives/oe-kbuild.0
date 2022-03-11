Content-Type: multipart/mixed; boundary="===============2267256727198395787=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11110/11953] security/smack/smackfs.c:1186:7: warning: Call to function 'sscanf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provi...
Date: Sat, 12 Mar 2022 02:31:30 +0800
Message-ID: <202203120215.DGwSrRQQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2267256727198395787==
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
:::::: branch date: 33 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220310 (https://download.01.org/0day-ci/archi=
ve/20220312/202203120215.DGwSrRQQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6992f0b3f0fd879b31095263986ba1aedb27c83b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6992f0b3f0fd879b31095263986ba1aedb27c83b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   drivers/video/hdmi.c:306:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(ptr, frame->vendor, sizeof(frame->vendor));
           ^~~~~~
   drivers/video/hdmi.c:307:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ptr + 8, frame->product, sizeof(frame->product));
           ^~~~~~
   drivers/video/hdmi.c:307:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(ptr + 8, frame->product, sizeof(frame->product));
           ^~~~~~
   drivers/video/hdmi.c:355:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(frame, 0, sizeof(*frame));
           ^~~~~~
   drivers/video/hdmi.c:355:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(frame, 0, sizeof(*frame));
           ^~~~~~
   drivers/video/hdmi.c:421:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buffer, 0, size);
           ^~~~~~
   drivers/video/hdmi.c:421:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(buffer, 0, size);
           ^~~~~~
   drivers/video/hdmi.c:490:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(frame, 0, sizeof(*frame));
           ^~~~~~
   drivers/video/hdmi.c:490:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(frame, 0, sizeof(*frame));
           ^~~~~~
   drivers/video/hdmi.c:583:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buffer, 0, size);
           ^~~~~~
   drivers/video/hdmi.c:583:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(buffer, 0, size);
           ^~~~~~
   drivers/video/hdmi.c:662:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(frame, 0, sizeof(*frame));
           ^~~~~~
   drivers/video/hdmi.c:662:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(frame, 0, sizeof(*frame));
           ^~~~~~
   drivers/video/hdmi.c:723:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buffer, 0, size);
           ^~~~~~
   drivers/video/hdmi.c:723:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(buffer, 0, size);
           ^~~~~~
   drivers/video/hdmi.c:1274:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, sizeof(buf));
           ^~~~~~
   drivers/video/hdmi.c:1274:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(buf, 0, sizeof(buf));
           ^~~~~~
   drivers/video/hdmi.c:1276:2: warning: Call to function 'strncpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(buf, frame->vendor, 8);
           ^~~~~~~
   drivers/video/hdmi.c:1276:2: note: Call to function 'strncpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'strncpy_s' in case of C11
           strncpy(buf, frame->vendor, 8);
           ^~~~~~~
   drivers/video/hdmi.c:1278:2: warning: Call to function 'strncpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(buf, frame->product, 16);
           ^~~~~~~
   drivers/video/hdmi.c:1278:2: note: Call to function 'strncpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'strncpy_s' in case of C11
           strncpy(buf, frame->product, 16);
           ^~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   security/smack/smack_access.c:472:2: warning: Call to function 'strncpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(smack, string, i);
           ^~~~~~~
   security/smack/smack_access.c:472:2: note: Call to function 'strncpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'strncpy_s' in case of C11
           strncpy(smack, string, i);
           ^~~~~~~
   Suppressed 93 warnings (92 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   114 warnings generated.
   security/smack/smackfs.c:887:8: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(rule, "%d", &maplevel);
                 ^~~~~~
   security/smack/smackfs.c:887:8: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(rule, "%d", &maplevel);
                 ^~~~~~
   security/smack/smackfs.c:897:8: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(rule, "%d", &catlen);
                 ^~~~~~
   security/smack/smackfs.c:897:8: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(rule, "%d", &catlen);
                 ^~~~~~
   security/smack/smackfs.c:905:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mapcatset, 0, sizeof(mapcatset));
           ^~~~~~
   security/smack/smackfs.c:905:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(mapcatset, 0, sizeof(mapcatset));
           ^~~~~~
   security/smack/smackfs.c:913:9: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(rule, "%u", &cat);
                         ^~~~~~
   security/smack/smackfs.c:913:9: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(rule, "%u", &cat);
                         ^~~~~~
>> security/smack/smackfs.c:1186:7: warning: Call to function 'sscanf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sscanf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           rc =3D sscanf(data, "%hhd.%hhd.%hhd.%hhd/%u %s",
                ^~~~~~
   security/smack/smackfs.c:1186:7: note: Call to function 'sscanf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sscanf_s' in cas=
e of C11
           rc =3D sscanf(data, "%hhd.%hhd.%hhd.%hhd/%u %s",
                ^~~~~~
   security/smack/smackfs.c:1189:8: warning: Call to function 'sscanf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sscanf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   rc =3D sscanf(data, "%hhd.%hhd.%hhd.%hhd %s",
                        ^~~~~~
   security/smack/smackfs.c:1189:8: note: Call to function 'sscanf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sscanf_s' in cas=
e of C11
                   rc =3D sscanf(data, "%hhd.%hhd.%hhd.%hhd %s",
                        ^~~~~~
   security/smack/smackfs.c:1195:3: warning: Value stored to 'm' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   m =3D BEBITS;
                   ^
   security/smack/smackfs.c:1195:3: note: Value stored to 'm' is never read
   security/smack/smackfs.c:1446:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sscanf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           i =3D sscanf(data, "%x:%x:%x:%x:%x:%x:%x:%x/%u %s",
               ^~~~~~
   security/smack/smackfs.c:1446:6: note: Call to function 'sscanf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sscanf_s' in cas=
e of C11
           i =3D sscanf(data, "%x:%x:%x:%x:%x:%x:%x:%x/%u %s",
               ^~~~~~
   security/smack/smackfs.c:1451:7: warning: Call to function 'sscanf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sscanf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   i =3D sscanf(data, "%x:%x:%x:%x:%x:%x:%x:%x %s",
                       ^~~~~~
   security/smack/smackfs.c:1451:7: note: Call to function 'sscanf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sscanf_s' in cas=
e of C11
                   i =3D sscanf(data, "%x:%x:%x:%x:%x:%x:%x:%x %s",
                       ^~~~~~
   security/smack/smackfs.c:1579:2: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(temp, "%d", smk_cipso_doi_value);
           ^~~~~~~
   security/smack/smackfs.c:1579:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           sprintf(temp, "%d", smk_cipso_doi_value);
           ^~~~~~~
   security/smack/smackfs.c:1611:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:1611:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:1645:2: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(temp, "%d", smack_cipso_direct);
           ^~~~~~~
   security/smack/smackfs.c:1645:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           sprintf(temp, "%d", smack_cipso_direct);
           ^~~~~~~
   security/smack/smackfs.c:1678:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:1678:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:1723:2: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(temp, "%d", smack_cipso_mapped);
           ^~~~~~~
   security/smack/smackfs.c:1723:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           sprintf(temp, "%d", smack_cipso_mapped);
           ^~~~~~~
   security/smack/smackfs.c:1756:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:1756:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:2161:2: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(temp, "%d\n", log_policy);
           ^~~~~~~
   security/smack/smackfs.c:2161:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           sprintf(temp, "%d\n", log_policy);
           ^~~~~~~
   security/smack/smackfs.c:2192:6: warning: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:2192:6: note: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(temp, "%d", &i) !=3D 1)
               ^~~~~~
   security/smack/smackfs.c:2313:9: warning: 1st function call argument is =
an uninitialized value [clang-analyzer-core.CallAndMessage]
                   res =3D smk_access(rule.smk_subject, rule.smk_object,
                         ^
   security/smack/smackfs.c:2341:9: note: Calling 'smk_user_access'
           return smk_user_access(file, buf, count, ppos, SMK_FIXED24_FMT);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:2298:6: note: Calling 'IS_ERR'
           if (IS_ERR(data))
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
   security/smack/smackfs.c:2298:6: note: Returning from 'IS_ERR'
           if (IS_ERR(data))
               ^~~~~~~~~~~~
   security/smack/smackfs.c:2298:2: note: Taking false branch

vim +1186 security/smack/smackfs.c

113a0e4590881c etienne              2009-03-04  1131  =

113a0e4590881c etienne              2009-03-04  1132  =

6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1133  /**
21abb1ec414c75 Casey Schaufler      2015-07-22  1134   * smk_write_net4addr=
 - write() for /smack/netlabel
251a2a958b0455 Randy Dunlap         2009-02-18  1135   * @file: file pointe=
r, not actually used
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1136   * @buf: where to get=
 the data from
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1137   * @count: bytes sent
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1138   * @ppos: where to st=
art
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1139   *
21abb1ec414c75 Casey Schaufler      2015-07-22  1140   * Accepts only one n=
et4addr per write call.
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1141   * Returns number of =
bytes written or error code, as appropriate
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1142   */
21abb1ec414c75 Casey Schaufler      2015-07-22  1143  static ssize_t smk_wr=
ite_net4addr(struct file *file, const char __user *buf,
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1144  				size_t count, lof=
f_t *ppos)
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1145  {
21abb1ec414c75 Casey Schaufler      2015-07-22  1146  	struct smk_net4addr =
*snp;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1147  	struct sockaddr_in n=
ewname;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1148  	char *smack;
21abb1ec414c75 Casey Schaufler      2015-07-22  1149  	struct smack_known *=
skp =3D NULL;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1150  	char *data;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1151  	char *host =3D (char=
 *)&newname.sin_addr.s_addr;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1152  	int rc;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1153  	struct netlbl_audit =
audit_info;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1154  	struct in_addr mask;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1155  	unsigned int m;
21abb1ec414c75 Casey Schaufler      2015-07-22  1156  	unsigned int masks;
7198e2eeb44b3f Etienne Basset       2009-03-24  1157  	int found;
113a0e4590881c etienne              2009-03-04  1158  	u32 mask_bits =3D (1=
<<31);
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1159  	__be32 nsa;
113a0e4590881c etienne              2009-03-04  1160  	u32 temp_mask;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1161  =

6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1162  	/*
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1163  	 * Must have privile=
ge.
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1164  	 * No partial writes.
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1165  	 * Enough data must =
be present.
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1166  	 * "<addr/mask, as a=
.b.c.d/e><space><label>"
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1167  	 * "<addr, as a.b.c.=
d><space><label>"
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1168  	 */
1880eff77e7a7c Casey Schaufler      2012-06-05  1169  	if (!smack_privilege=
d(CAP_MAC_ADMIN))
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1170  		return -EPERM;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1171  	if (*ppos !=3D 0)
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1172  		return -EINVAL;
7ef4c19d245f3d Sabyrzhan Tasbolatov 2021-01-28  1173  	if (count < SMK_NETL=
BLADDRMIN || count > PAGE_SIZE - 1)
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1174  		return -EINVAL;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1175  =

16e5c1fc36040e Al Viro              2015-12-24  1176  	data =3D memdup_user=
_nul(buf, count);
16e5c1fc36040e Al Viro              2015-12-24  1177  	if (IS_ERR(data))
16e5c1fc36040e Al Viro              2015-12-24  1178  		return PTR_ERR(data=
);
f7112e6c9abf1c Casey Schaufler      2012-05-06  1179  =

f7112e6c9abf1c Casey Schaufler      2012-05-06  1180  	smack =3D kzalloc(co=
unt + 1, GFP_KERNEL);
f7112e6c9abf1c Casey Schaufler      2012-05-06  1181  	if (smack =3D=3D NUL=
L) {
f7112e6c9abf1c Casey Schaufler      2012-05-06  1182  		rc =3D -ENOMEM;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1183  		goto free_data_out;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1184  	}
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1185  =

ec554fa75ec94d Toralf F=C3=B6rster       2014-04-27 @1186  	rc =3D sscanf(d=
ata, "%hhd.%hhd.%hhd.%hhd/%u %s",
21abb1ec414c75 Casey Schaufler      2015-07-22  1187  		&host[0], &host[1],=
 &host[2], &host[3], &masks, smack);
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1188  	if (rc !=3D 6) {
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1189  		rc =3D sscanf(data,=
 "%hhd.%hhd.%hhd.%hhd %s",
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1190  			&host[0], &host[1]=
, &host[2], &host[3], smack);
f7112e6c9abf1c Casey Schaufler      2012-05-06  1191  		if (rc !=3D 5) {
f7112e6c9abf1c Casey Schaufler      2012-05-06  1192  			rc =3D -EINVAL;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1193  			goto free_out;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1194  		}
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1195  		m =3D BEBITS;
21abb1ec414c75 Casey Schaufler      2015-07-22  1196  		masks =3D 32;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1197  	}
21abb1ec414c75 Casey Schaufler      2015-07-22  1198  	if (masks > BEBITS) {
f7112e6c9abf1c Casey Schaufler      2012-05-06  1199  		rc =3D -EINVAL;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1200  		goto free_out;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1201  	}
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1202  =

f7112e6c9abf1c Casey Schaufler      2012-05-06  1203  	/*
f7112e6c9abf1c Casey Schaufler      2012-05-06  1204  	 * If smack begins w=
ith '-', it is an option, don't import it
f7112e6c9abf1c Casey Schaufler      2012-05-06  1205  	 */
4303154e865978 Etienne Basset       2009-03-27  1206  	if (smack[0] !=3D '-=
') {
21c7eae21a2100 Lukasz Pawelczyk     2014-08-29  1207  		skp =3D smk_import_=
entry(smack, 0);
e774ad683f425a Lukasz Pawelczyk     2015-04-20  1208  		if (IS_ERR(skp)) {
e774ad683f425a Lukasz Pawelczyk     2015-04-20  1209  			rc =3D PTR_ERR(skp=
);
f7112e6c9abf1c Casey Schaufler      2012-05-06  1210  			goto free_out;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1211  		}
4303154e865978 Etienne Basset       2009-03-27  1212  	} else {
21abb1ec414c75 Casey Schaufler      2015-07-22  1213  		/*
21abb1ec414c75 Casey Schaufler      2015-07-22  1214  		 * Only the -CIPSO =
option is supported for IPv4
21abb1ec414c75 Casey Schaufler      2015-07-22  1215  		 */
21abb1ec414c75 Casey Schaufler      2015-07-22  1216  		if (strcmp(smack, S=
MACK_CIPSO_OPTION) !=3D 0) {
f7112e6c9abf1c Casey Schaufler      2012-05-06  1217  			rc =3D -EINVAL;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1218  			goto free_out;
f7112e6c9abf1c Casey Schaufler      2012-05-06  1219  		}
4303154e865978 Etienne Basset       2009-03-27  1220  	}
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1221  =

21abb1ec414c75 Casey Schaufler      2015-07-22  1222  	for (m =3D masks, te=
mp_mask =3D 0; m > 0; m--) {
113a0e4590881c etienne              2009-03-04  1223  		temp_mask |=3D mask=
_bits;
113a0e4590881c etienne              2009-03-04  1224  		mask_bits >>=3D 1;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1225  	}
113a0e4590881c etienne              2009-03-04  1226  	mask.s_addr =3D cpu_=
to_be32(temp_mask);
113a0e4590881c etienne              2009-03-04  1227  =

113a0e4590881c etienne              2009-03-04  1228  	newname.sin_addr.s_a=
ddr &=3D mask.s_addr;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1229  	/*
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1230  	 * Only allow one wr=
iter at a time. Writes should be
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1231  	 * quite rare and sm=
all in any case.
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1232  	 */
21abb1ec414c75 Casey Schaufler      2015-07-22  1233  	mutex_lock(&smk_net4=
addr_lock);
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1234  =

6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1235  	nsa =3D newname.sin_=
addr.s_addr;
113a0e4590881c etienne              2009-03-04  1236  	/* try to find if th=
e prefix is already in the list */
7198e2eeb44b3f Etienne Basset       2009-03-24  1237  	found =3D 0;
21abb1ec414c75 Casey Schaufler      2015-07-22  1238  	list_for_each_entry_=
rcu(snp, &smk_net4addr_list, list) {
21abb1ec414c75 Casey Schaufler      2015-07-22  1239  		if (snp->smk_host.s=
_addr =3D=3D nsa && snp->smk_masks =3D=3D masks) {
7198e2eeb44b3f Etienne Basset       2009-03-24  1240  			found =3D 1;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1241  			break;
7198e2eeb44b3f Etienne Basset       2009-03-24  1242  		}
7198e2eeb44b3f Etienne Basset       2009-03-24  1243  	}
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1244  	smk_netlabel_audit_s=
et(&audit_info);
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1245  =

7198e2eeb44b3f Etienne Basset       2009-03-24  1246  	if (found =3D=3D 0) {
21c7eae21a2100 Lukasz Pawelczyk     2014-08-29  1247  		snp =3D kzalloc(siz=
eof(*snp), GFP_KERNEL);
21c7eae21a2100 Lukasz Pawelczyk     2014-08-29  1248  		if (snp =3D=3D NULL)
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1249  			rc =3D -ENOMEM;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1250  		else {
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1251  			rc =3D 0;
21abb1ec414c75 Casey Schaufler      2015-07-22  1252  			snp->smk_host.s_ad=
dr =3D newname.sin_addr.s_addr;
21c7eae21a2100 Lukasz Pawelczyk     2014-08-29  1253  			snp->smk_mask.s_ad=
dr =3D mask.s_addr;
21c7eae21a2100 Lukasz Pawelczyk     2014-08-29  1254  			snp->smk_label =3D=
 skp;
21abb1ec414c75 Casey Schaufler      2015-07-22  1255  			snp->smk_masks =3D=
 masks;
21abb1ec414c75 Casey Schaufler      2015-07-22  1256  			smk_net4addr_inser=
t(snp);
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1257  		}
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1258  	} else {
21abb1ec414c75 Casey Schaufler      2015-07-22  1259  		/*
21abb1ec414c75 Casey Schaufler      2015-07-22  1260  		 * Delete the unlab=
eled entry, only if the previous label
21abb1ec414c75 Casey Schaufler      2015-07-22  1261  		 * wasn't the speci=
al CIPSO option
21abb1ec414c75 Casey Schaufler      2015-07-22  1262  		 */
21abb1ec414c75 Casey Schaufler      2015-07-22  1263  		if (snp->smk_label =
!=3D NULL)
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1264  			rc =3D netlbl_cfg_=
unlbl_static_del(&init_net, NULL,
21abb1ec414c75 Casey Schaufler      2015-07-22  1265  					&snp->smk_host, =
&snp->smk_mask,
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1266  					PF_INET, &audit_=
info);
4303154e865978 Etienne Basset       2009-03-27  1267  		else
4303154e865978 Etienne Basset       2009-03-27  1268  			rc =3D 0;
21c7eae21a2100 Lukasz Pawelczyk     2014-08-29  1269  		snp->smk_label =3D =
skp;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1270  	}
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1271  =

6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1272  	/*
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1273  	 * Now tell netlabel=
 about the single label nature of
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1274  	 * this host so that=
 incoming packets get labeled.
4303154e865978 Etienne Basset       2009-03-27  1275  	 * but only if we di=
dn't get the special CIPSO option
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1276  	 */
21abb1ec414c75 Casey Schaufler      2015-07-22  1277  	if (rc =3D=3D 0 && s=
kp !=3D NULL)
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1278  		rc =3D netlbl_cfg_u=
nlbl_static_add(&init_net, NULL,
21abb1ec414c75 Casey Schaufler      2015-07-22  1279  			&snp->smk_host, &s=
np->smk_mask, PF_INET,
21c7eae21a2100 Lukasz Pawelczyk     2014-08-29  1280  			snp->smk_label->sm=
k_secid, &audit_info);
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1281  =

6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1282  	if (rc =3D=3D 0)
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1283  		rc =3D count;
6d3dc07cbb1e88 Casey Schaufler      2008-12-31  1284  =

21abb1ec414c75 Casey Schaufler      2015-07-22  1285  	mutex_unlock(&smk_ne=
t4addr_lock);
21abb1ec414c75 Casey Schaufler      2015-07-22  1286  =

21abb1ec414c75 Casey Schaufler      2015-07-22  1287  free_out:
21abb1ec414c75 Casey Schaufler      2015-07-22  1288  	kfree(smack);
21abb1ec414c75 Casey Schaufler      2015-07-22  1289  free_data_out:
21abb1ec414c75 Casey Schaufler      2015-07-22  1290  	kfree(data);
21abb1ec414c75 Casey Schaufler      2015-07-22  1291  =

21abb1ec414c75 Casey Schaufler      2015-07-22  1292  	return rc;
21abb1ec414c75 Casey Schaufler      2015-07-22  1293  }
21abb1ec414c75 Casey Schaufler      2015-07-22  1294  =


:::::: The code at line 1186 was first introduced by commit
:::::: ec554fa75ec94dcf47e52db9551755679c10235b Warning in scanf string typ=
ing

:::::: TO: Toralf F=C3=B6rster <toralf.foerster@gmx.de>
:::::: CC: Casey Schaufler <casey@schaufler-ca.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2267256727198395787==--


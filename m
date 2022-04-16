Content-Type: multipart/mixed; boundary="===============7184092149637303838=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/marvell/mwifiex/util.c:264:8: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length...
Date: Sun, 17 Apr 2022 07:26:36 +0800
Message-ID: <202204170737.p8nutCxY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7184092149637303838==
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
head:   90ea17a9e27b5778ec517efb1ce0b81d36905654
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220417 (https://download.01.org/0day-ci/archi=
ve/20220417/202204170737.p8nutCxY-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~
   lib/test_hexdump.c:133:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(real, FILL_CHAR, sizeof(real));
           ^~~~~~
   lib/test_hexdump.c:133:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(real, FILL_CHAR, sizeof(real));
           ^~~~~~
   lib/test_hexdump.c:137:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(test, FILL_CHAR, sizeof(test));
           ^~~~~~
   lib/test_hexdump.c:137:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(test, FILL_CHAR, sizeof(test));
           ^~~~~~
   lib/test_hexdump.c:172:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, FILL_CHAR, sizeof(buf));
           ^~~~~~
   lib/test_hexdump.c:172:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(buf, FILL_CHAR, sizeof(buf));
           ^~~~~~
   lib/test_hexdump.c:193:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(test + f, FILL_CHAR, sizeof(test) - f);
           ^~~~~~
   lib/test_hexdump.c:193:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(test + f, FILL_CHAR, sizeof(test) - f);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   106 warnings generated.
   drivers/net/wireless/marvell/mwifiex/util.c:184:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info->packets_out,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:184:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info->packets_out,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:222:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info->last_cmd_id, adapter->dbg.last_cmd_id,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:222:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info->last_cmd_id, adapter->dbg.last_cmd_id,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:224:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info->last_cmd_act, adapter->dbg.last_cmd_act,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:224:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info->last_cmd_act, adapter->dbg.last_cmd_act,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:227:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info->last_cmd_resp_id, adapter->dbg.last_cmd_res=
p_id,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:227:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info->last_cmd_resp_id, adapter->dbg.last_cmd_res=
p_id,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:230:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info->last_event, adapter->dbg.last_event,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:230:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info->last_event, adapter->dbg.last_event,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:233:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info->last_mp_wr_bitmap, adapter->dbg.last_mp_wr_=
bitmap,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:233:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info->last_mp_wr_bitmap, adapter->dbg.last_mp_wr_=
bitmap,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:235:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info->last_mp_wr_ports, adapter->dbg.last_mp_wr_p=
orts,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:235:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info->last_mp_wr_ports, adapter->dbg.last_mp_wr_p=
orts,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:237:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info->last_mp_curr_wr_port,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:237:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info->last_mp_curr_wr_port,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:240:3: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info->last_mp_wr_len, adapter->dbg.last_mp_wr_len,
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:240:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info->last_mp_wr_len, adapter->dbg.last_mp_wr_len,
                   ^~~~~~
>> drivers/net/wireless/marvell/mwifiex/util.c:264:8: warning: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprec=
atedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%s=3D", d[i].name);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:264:8: note: Call to functio=
n 'sprintf' is insecure as it does not provide bounding of the memory buffe=
r or security checks introduced in the C11 standard. Replace with analogous=
 functions that support length arguments or provides boundary checks such a=
s 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "%s=3D", d[i].name);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:292:9: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "%#lx ", val);
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:292:9: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "%#lx ", val);
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:296:8: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "\n");
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:296:8: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "\n");
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:300:8: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "Tx BA stream table:\n");
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:300:8: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "Tx BA stream table:\n");
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:302:9: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "tid =3D %d, ra =3D %pM\n",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:302:9: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "tid =3D %d, ra =3D %pM\n",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:307:8: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "Rx reorder table:\n");
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:307:8: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "Rx reorder table:\n");
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:309:9: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "tid =3D %d, ta =3D %pM, ",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:309:9: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "tid =3D %d, ta =3D %pM, ",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:312:9: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "start_win =3D %d, ",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:312:9: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "start_win =3D %d, ",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:314:9: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "win_size =3D %d, buffer: ",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:314:9: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "win_size =3D %d, buffer: ",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:318:10: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   p +=3D sprintf(p, "%c ",
                                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:318:10: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                                   p +=3D sprintf(p, "%c ",
                                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:322:9: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "\n");
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:322:9: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "\n");
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:327:8: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "TDLS peer table:\n");
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:327:8: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "TDLS peer table:\n");
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:329:9: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "peer =3D %pM",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:329:9: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "peer =3D %pM",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:331:9: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "\n");
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:331:9: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "\n");
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:421:2: warning: Call to func=
tion 'memmove' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memmove_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(skb->data + sizeof(struct ieee80211_hdr_3addr),
           ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:421:2: note: Call to functio=
n 'memmove' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memmove_s' in case of C11
           memmove(skb->data + sizeof(struct ieee80211_hdr_3addr),
           ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:619:2: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(node->mac_addr, mac, ETH_ALEN);
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/util.c:619:2: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(node->mac_addr, mac, ETH_ALEN);
           ^~~~~~
   Suppressed 81 warnings (81 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                                 ^~~~~~~~
   kernel/printk/printk.c:1908:17: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   dropped_len =3D snprintf(dropped_text, sizeof(dropped_te=
xt),
                                 ^~~~~~~~
   kernel/printk/printk.c:2091:4: warning: Call to function 'memmove' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(text, text + prefix_len, text_len);
                           ^~~~~~~
   kernel/printk/printk.c:2091:4: note: Call to function 'memmove' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memmove_s' in case of C11
                           memmove(text, text + prefix_len, text_len);
                           ^~~~~~~
   kernel/printk/printk.c:2135:17: warning: Call to function 'vsnprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           reserve_size =3D vsnprintf(&prefix_buf[0], sizeof(prefix_buf), f=
mt, args2) + 1;
                          ^~~~~~~~~
   kernel/printk/printk.c:2135:17: note: Call to function 'vsnprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'vsnprintf_s' in case of C11
           reserve_size =3D vsnprintf(&prefix_buf[0], sizeof(prefix_buf), f=
mt, args2) + 1;
                          ^~~~~~~~~
   kernel/printk/printk.c:2188:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&r.text_buf[text_len], trunc_msg, trunc_msg_len);
                   ^~~~~~
   kernel/printk/printk.c:2188:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(&r.text_buf[text_len], trunc_msg, trunc_msg_len);
                   ^~~~~~
   kernel/printk/printk.c:2196:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&r.info->dev_info, dev_info, sizeof(r.info->dev_i=
nfo));
                   ^~~~~~
   kernel/printk/printk.c:2196:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(&r.info->dev_info, dev_info, sizeof(r.info->dev_i=
nfo));
                   ^~~~~~
   kernel/printk/printk.c:2399:3: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(buf + 4, str, sizeof(buf) - 5);
                   ^~~~~~~
   kernel/printk/printk.c:2399:3: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
                   strncpy(buf + 4, str, sizeof(buf) - 5);
                   ^~~~~~~
   kernel/printk/printk.c:2401:3: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(buf, str, sizeof(buf) - 1);
                   ^~~~~~~
   kernel/printk/printk.c:2401:3: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
                   strncpy(buf, str, sizeof(buf) - 1);
                   ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   crypto/rng.c:74:2: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memset(&rrng, 0, sizeof(rrng));
           ^~~~~~
   crypto/rng.c:74:2: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
           memset(&rrng, 0, sizeof(rrng));
           ^~~~~~
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   116 warnings generated.
   drivers/net/wireless/marvell/mwifiex/main.c:83:2: warning: Call to funct=
ion 'memmove' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memmove_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(&adapter->if_ops, if_ops, sizeof(struct mwifiex_if_ops));
           ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:83:2: note: Call to function=
 'memmove' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memmove_s' in case of C11
           memmove(&adapter->if_ops, if_ops, sizeof(struct mwifiex_if_ops));
           ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:237:2: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ver_ext, 0, sizeof(ver_ext));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:237:2: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
           memset(&ver_ext, 0, sizeof(ver_ext));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:570:2: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fw, 0, sizeof(struct mwifiex_fw_image));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:570:2: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
           memset(&fw, 0, sizeof(struct mwifiex_fw_image));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:948:2: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(tx_info, 0, sizeof(*tx_info));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:948:2: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
           memset(tx_info, 0, sizeof(*tx_info));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1146:2: warning: Call to fun=
ction 'strcpy' is insecure as it does not provide bounding of the memory bu=
ffer. Replace unbounded copy functions with analogous functions that suppor=
t length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.inse=
cureAPI.strcpy]
           strcpy(p, "=3D=3D=3D=3D=3D=3D=3D=3DStart dump driverinfo=3D=3D=
=3D=3D=3D=3D=3D=3D\n");
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1146:2: note: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119
           strcpy(p, "=3D=3D=3D=3D=3D=3D=3D=3DStart dump driverinfo=3D=3D=
=3D=3D=3D=3D=3D=3D\n");
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1148:7: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "driver_name =3D " "\"mwifiex\"\n");
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1148:7: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "driver_name =3D " "\"mwifiex\"\n");
                ^~~~~~~
>> drivers/net/wireless/marvell/mwifiex/main.c:1152:7: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depre=
catedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "driver_version =3D %s\n", drv_version);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1152:7: note: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "driver_version =3D %s\n", drv_version);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1156:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "tx_cmd_urb_pending =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1156:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "tx_cmd_urb_pending =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1158:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "tx_data_urb_pending_port_0 =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1158:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "tx_data_urb_pending_port_0 =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1160:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "tx_data_urb_pending_port_1 =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1160:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "tx_data_urb_pending_port_1 =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1162:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "rx_cmd_urb_pending =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1162:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "rx_cmd_urb_pending =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1164:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "rx_data_urb_pending =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1164:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "rx_data_urb_pending =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1168:7: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "tx_pending =3D %d\n",
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1168:7: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "tx_pending =3D %d\n",
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1170:7: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "rx_pending =3D %d\n",
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1170:7: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "rx_pending =3D %d\n",
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1175:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "\nmp_rd_bitmap=3D0x%x curr_rd_port=3D=
0x%x\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1175:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "\nmp_rd_bitmap=3D0x%x curr_rd_port=3D=
0x%x\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1177:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "mp_wr_bitmap=3D0x%x curr_wr_port=3D0x=
%x\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1177:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "mp_wr_bitmap=3D0x%x curr_wr_port=3D0x=
%x\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1185:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depre=
catedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "\n[interface  : \"%s\"]\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1185:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "\n[interface  : \"%s\"]\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1187:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "wmm_tx_pending[0] =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1187:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "wmm_tx_pending[0] =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1189:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "wmm_tx_pending[1] =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1189:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "wmm_tx_pending[1] =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1191:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "wmm_tx_pending[2] =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1191:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "wmm_tx_pending[2] =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1193:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "wmm_tx_pending[3] =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1193:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "wmm_tx_pending[3] =3D %d\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1195:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depre=
catedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "media_state=3D\"%s\"\n", !priv->media=
_connected ?
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1195:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "media_state=3D\"%s\"\n", !priv->media=
_connected ?
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1197:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depre=
catedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "carrier %s\n", (netif_carrier_ok(priv=
->netdev)
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/main.c:1197:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "carrier %s\n", (netif_carrier_ok(priv=
->netdev)
--
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:988:4: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&sta_ptr->tdls_cap.ht_oper, pos + 2,
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:988:4: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&sta_ptr->tdls_cap.ht_oper, pos + 2,
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1001:4: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((u8 *)&sta_ptr->tdls_cap.extcap, pos,
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1001:4: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy((u8 *)&sta_ptr->tdls_cap.extcap, pos,
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1011:4: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((u8 *)&sta_ptr->tdls_cap.rsn_ie, pos,
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1011:4: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy((u8 *)&sta_ptr->tdls_cap.rsn_ie, pos,
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1027:5: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&sta_ptr->tdls_cap.vhtoper, pos +=
 2,
                                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1027:5: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(&sta_ptr->tdls_cap.vhtoper, pos +=
 2,
                                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1036:5: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy((u8 *)&sta_ptr->tdls_cap.vhtcap, =
pos + 2,
                                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1036:5: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy((u8 *)&sta_ptr->tdls_cap.vhtcap, =
pos + 2,
                                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1063:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tdls_oper, 0, sizeof(struct mwifiex_ds_tdls_oper));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1063:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(&tdls_oper, 0, sizeof(struct mwifiex_ds_tdls_oper));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1072:2: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tdls_oper.peer_mac, peer, ETH_ALEN);
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1072:2: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tdls_oper.peer_mac, peer, ETH_ALEN);
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1084:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tdls_oper, 0, sizeof(struct mwifiex_ds_tdls_oper));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1084:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(&tdls_oper, 0, sizeof(struct mwifiex_ds_tdls_oper));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1099:2: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tdls_oper.peer_mac, peer, ETH_ALEN);
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1099:2: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tdls_oper.peer_mac, peer, ETH_ALEN);
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1111:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tdls_oper, 0, sizeof(struct mwifiex_ds_tdls_oper));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1111:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(&tdls_oper, 0, sizeof(struct mwifiex_ds_tdls_oper));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1126:2: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tdls_oper.peer_mac, peer, ETH_ALEN);
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1126:2: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tdls_oper.peer_mac, peer, ETH_ALEN);
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1172:3: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(sta_ptr->rx_seq, 0xff, sizeof(sta_ptr->rx_seq));
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1172:3: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
                   memset(sta_ptr->rx_seq, 0xff, sizeof(sta_ptr->rx_seq));
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1260:3: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&tdls_oper, 0, sizeof(struct mwifiex_ds_tdls_oper=
));
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1260:3: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&tdls_oper, 0, sizeof(struct mwifiex_ds_tdls_oper=
));
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1271:3: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&tdls_oper.peer_mac, sta_ptr->mac_addr, ETH_ALEN);
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/tdls.c:1271:3: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&tdls_oper.peer_mac, sta_ptr->mac_addr, ETH_ALEN);
                   ^~~~~~
   Suppressed 81 warnings (81 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   140 warnings generated.
   drivers/net/wireless/marvell/mwifiex/debugfs.c:91:2: warning: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(info));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:91:2: note: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(info));
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:100:7: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "driver_name =3D " "\"mwifiex\"\n");
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:100:7: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "driver_name =3D " "\"mwifiex\"\n");
                ^~~~~~~
>> drivers/net/wireless/marvell/mwifiex/debugfs.c:101:7: warning: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Dep=
recatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "driver_version =3D %s", fmt);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:101:7: note: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "driver_version =3D %s", fmt);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:102:7: warning: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Dep=
recatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "\nverext =3D %s", priv->version_str);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:102:7: note: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "\nverext =3D %s", priv->version_str);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:103:7: warning: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Dep=
recatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "\ninterface_name=3D\"%s\"\n", netdev->name);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:103:7: note: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "\ninterface_name=3D\"%s\"\n", netdev->name);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:106:8: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "bss_mode=3D\"%d\"\n", info.bss_mode);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:106:8: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "bss_mode=3D\"%d\"\n", info.bss_mode);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:108:8: warning: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Dep=
recatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "bss_mode=3D\"%s\"\n", bss_modes[info.=
bss_mode]);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:108:8: note: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "bss_mode=3D\"%s\"\n", bss_modes[info.=
bss_mode]);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:110:7: warning: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Dep=
recatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "media_state=3D\"%s\"\n",
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:110:7: note: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "media_state=3D\"%s\"\n",
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:112:7: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "mac_address=3D\"%pM\"\n", netdev->dev_addr);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:112:7: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "mac_address=3D\"%pM\"\n", netdev->dev_addr);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:115:8: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "multicast_count=3D\"%d\"\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:115:8: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "multicast_count=3D\"%d\"\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:117:8: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "essid=3D\"%.*s\"\n", info.ssid.ssid_l=
en,
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:117:8: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "essid=3D\"%.*s\"\n", info.ssid.ssid_l=
en,
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:119:8: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "bssid=3D\"%pM\"\n", info.bssid);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:119:8: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "bssid=3D\"%pM\"\n", info.bssid);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:120:8: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "channel=3D\"%d\"\n", (int) info.bss_c=
han);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:120:8: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "channel=3D\"%d\"\n", (int) info.bss_c=
han);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:121:8: warning: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Dep=
recatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "country_code =3D \"%s\"\n", info.coun=
try_code);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:121:8: note: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "country_code =3D \"%s\"\n", info.coun=
try_code);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:122:8: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "region_code=3D\"0x%x\"\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:122:8: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "region_code=3D\"0x%x\"\n",
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:126:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "multicast_address[%d]=3D\"%pM=
\"\n",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:126:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "multicast_address[%d]=3D\"%pM=
\"\n",
                                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:130:7: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "num_tx_bytes =3D %lu\n", priv->stats.tx_bytes=
);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:130:7: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "num_tx_bytes =3D %lu\n", priv->stats.tx_bytes=
);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:131:7: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "num_rx_bytes =3D %lu\n", priv->stats.rx_bytes=
);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:131:7: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "num_rx_bytes =3D %lu\n", priv->stats.rx_bytes=
);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:132:7: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "num_tx_pkts =3D %lu\n", priv->stats.tx_packet=
s);
                ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/debugfs.c:132:7: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "num_tx_pkts =3D %lu\n", priv->stats.tx_packet=
s);

vim +264 drivers/net/wireless/marvell/mwifiex/util.c

5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/util.c         Bing Zhao       =
2011-03-21  250  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  251  int mwifiex_debug_info_to_buffer(struct mwifiex_private *p=
riv, char *buf,
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  252  				 struct mwifiex_debug_info *info)
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  253  {
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  254  	char *p =3D buf;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  255  	struct mwifiex_debug_data *d =3D &items[0];
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  256  	size_t size, addr;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  257  	long val;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  258  	int i, j;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  259  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  260  	if (!info)
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  261  		return 0;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  262  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  263  	for (i =3D 0; i < num_of_items; i++) {
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23 @264  		p +=3D sprintf(p, "%s=3D", d[i].name);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  265  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  266  		size =3D d[i].size / d[i].num;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  267  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  268  		if (i < (num_of_items - 3))
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  269  			addr =3D d[i].addr + (size_t)info;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  270  		else /* The last 3 items are struct mwifiex_adapter vari=
ables */
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  271  			addr =3D d[i].addr + (size_t)priv->adapter;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  272  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  273  		for (j =3D 0; j < d[i].num; j++) {
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  274  			switch (size) {
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  275  			case 1:
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  276  				val =3D *((u8 *)addr);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  277  				break;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  278  			case 2:
92c70a958b0b6b drivers/net/wireless/marvell/mwifiex/util.c Devidas Puranik =
2017-03-09  279  				val =3D get_unaligned((u16 *)addr);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  280  				break;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  281  			case 4:
92c70a958b0b6b drivers/net/wireless/marvell/mwifiex/util.c Devidas Puranik =
2017-03-09  282  				val =3D get_unaligned((u32 *)addr);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  283  				break;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  284  			case 8:
92c70a958b0b6b drivers/net/wireless/marvell/mwifiex/util.c Devidas Puranik =
2017-03-09  285  				val =3D get_unaligned((long long *)addr);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  286  				break;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  287  			default:
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  288  				val =3D -1;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  289  				break;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  290  			}
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  291  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  292  			p +=3D sprintf(p, "%#lx ", val);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  293  			addr +=3D size;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  294  		}
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  295  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  296  		p +=3D sprintf(p, "\n");
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  297  	}
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  298  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  299  	if (info->tx_tbl_num) {
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  300  		p +=3D sprintf(p, "Tx BA stream table:\n");
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  301  		for (i =3D 0; i < info->tx_tbl_num; i++)
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  302  			p +=3D sprintf(p, "tid =3D %d, ra =3D %pM\n",
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  303  				     info->tx_tbl[i].tid, info->tx_tbl[i].ra);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  304  	}
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  305  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  306  	if (info->rx_tbl_num) {
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  307  		p +=3D sprintf(p, "Rx reorder table:\n");
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  308  		for (i =3D 0; i < info->rx_tbl_num; i++) {
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  309  			p +=3D sprintf(p, "tid =3D %d, ta =3D %pM, ",
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  310  				     info->rx_tbl[i].tid,
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  311  				     info->rx_tbl[i].ta);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  312  			p +=3D sprintf(p, "start_win =3D %d, ",
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  313  				     info->rx_tbl[i].start_win);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  314  			p +=3D sprintf(p, "win_size =3D %d, buffer: ",
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  315  				     info->rx_tbl[i].win_size);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  316  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  317  			for (j =3D 0; j < info->rx_tbl[i].win_size; j++)
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  318  				p +=3D sprintf(p, "%c ",
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  319  					     info->rx_tbl[i].buffer[j] ?
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  320  					     '1' : '0');
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  321  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  322  			p +=3D sprintf(p, "\n");
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  323  		}
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  324  	}
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  325  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  326  	if (info->tdls_peer_num) {
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  327  		p +=3D sprintf(p, "TDLS peer table:\n");
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  328  		for (i =3D 0; i < info->tdls_peer_num; i++) {
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  329  			p +=3D sprintf(p, "peer =3D %pM",
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  330  				     info->tdls_list[i].peer_addr);
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  331  			p +=3D sprintf(p, "\n");
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  332  		}
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  333  	}
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  334  =

bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  335  	return p - buf;
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  336  }
bb5097fec91efd drivers/net/wireless/mwifiex/util.c         Xinming Hu      =
2014-12-23  337  =


:::::: The code at line 264 was first introduced by commit
:::::: bb5097fec91efd3253d2b769ba2ccd9f8d67a5d6 mwifiex: move debug_data du=
mp function to common utililty file

:::::: TO: Xinming Hu <huxm@marvell.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7184092149637303838==--


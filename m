Content-Type: multipart/mixed; boundary="===============7726221604259491739=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/marvell/mwifiex/main.c:1152:7: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support lengt...
Date: Sun, 17 Apr 2022 12:51:42 +0800
Message-ID: <202204171229.A3BhvrIL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7726221604259491739==
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
head:   a2c29ccd9477861b16ddc02c411a6c9665250558
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220417 (https://download.01.org/0day-ci/archi=
ve/20220417/202204171229.A3BhvrIL-lkp(a)intel.com/config)
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
                   ^~~~~~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/gpu/host1x/cdma.c:604:15: warning: Value stored to 'space' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/cdma.c:604:15: note: Value stored to 'space' during i=
ts initialization is never read
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/gpu/host1x/job.c:570:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(job->gather_copy_mapped + offset, gather + g->off=
set,
                   ^~~~~~
   drivers/gpu/host1x/job.c:570:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(job->gather_copy_mapped + offset, gather + g->off=
set,
                   ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/gpu/host1x/debug.c:34:8: warning: Call to function 'vsnprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf(o->buf, sizeof(o->buf), fmt, args);
                 ^~~~~~~~~
   drivers/gpu/host1x/debug.c:34:8: note: Call to function 'vsnprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf(o->buf, sizeof(o->buf), fmt, args);
                 ^~~~~~~~~
   drivers/gpu/host1x/debug.c:46:8: warning: Call to function 'vsnprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf(o->buf, sizeof(o->buf), fmt, args);
                 ^~~~~~~~~
   drivers/gpu/host1x/debug.c:46:8: note: Call to function 'vsnprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf(o->buf, sizeof(o->buf), fmt, args);
                 ^~~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   drivers/net/wireless/ath/ath6kl/core.c:303:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((u8 *)ar->sta_list, 0,
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/core.c:303:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset((u8 *)ar->sta_list, 0,
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/core.c:324:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ar->ap_country_code, DEF_AP_COUNTRY_CODE, 3);
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/core.c:324:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ar->ap_country_code, DEF_AP_COUNTRY_CODE, 3);
           ^~~~~~
   Suppressed 65 warnings (65 in non-user code).
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
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/phy/cadence/cdns-dphy.c:103:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cfg, 0, sizeof(*cfg));
           ^~~~~~
   drivers/phy/cadence/cdns-dphy.c:103:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(cfg, 0, sizeof(*cfg));
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/phy/marvell/phy-mmp3-usb.c:143:16: warning: Value stored to 'bas=
e' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           void __iomem *base =3D mmp3_usb_phy->base;
                         ^~~~   ~~~~~~~~~~~~~~~~~~
   drivers/phy/marvell/phy-mmp3-usb.c:143:16: note: Value stored to 'base' =
during its initialization is never read
           void __iomem *base =3D mmp3_usb_phy->base;
                         ^~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
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
   31 warnings generated.
   drivers/dma/tegra210-adma.c:213:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tdc->sconfig, sconfig, sizeof(*sconfig));
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

vim +1152 drivers/net/wireless/marvell/mwifiex/main.c

d0e2b44ef32814 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2017-12-12  1131  =

d0e2b44ef32814 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2017-12-12  1132  void mwifiex_drv_info_dump(struct mwifiex_adapter *adapt=
er)
d0e2b44ef32814 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2017-12-12  1133  {
d0e2b44ef32814 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2017-12-12  1134  	char *p;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1135  	char drv_version[64];
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1136  	struct usb_card_rec *cardp;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1137  	struct sdio_mmc_card *sdio_card;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1138  	struct mwifiex_private *priv;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1139  	int i, idx;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1140  	struct netdev_queue *txq;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1141  	struct mwifiex_debug_info *debug_info;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1142  =

9cc0dbf0436767 drivers/net/wireless/mwifiex/main.c         Amitkumar Karwar=
 2015-05-26  1143  	mwifiex_dbg(adapter, MSG, "=3D=3D=3Dmwifiex driverinfo =
dump start=3D=3D=3D\n");
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1144  =

d0e2b44ef32814 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2017-12-12  1145  	p =3D adapter->devdump_data;
d0e2b44ef32814 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2017-12-12  1146  	strcpy(p, "=3D=3D=3D=3D=3D=3D=3D=3DStart dump driverinf=
o=3D=3D=3D=3D=3D=3D=3D=3D\n");
d0e2b44ef32814 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2017-12-12  1147  	p +=3D strlen("=3D=3D=3D=3D=3D=3D=3D=3DStart dump drive=
rinfo=3D=3D=3D=3D=3D=3D=3D=3D\n");
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1148  	p +=3D sprintf(p, "driver_name =3D " "\"mwifiex\"\n");
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1149  =

11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1150  	mwifiex_drv_get_driver_version(adapter, drv_version,
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1151  				       sizeof(drv_version) - 1);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23 @1152  	p +=3D sprintf(p, "driver_version =3D %s\n", drv_versio=
n);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1153  =

11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1154  	if (adapter->iface_type =3D=3D MWIFIEX_USB) {
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1155  		cardp =3D (struct usb_card_rec *)adapter->card;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1156  		p +=3D sprintf(p, "tx_cmd_urb_pending =3D %d\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1157  			     atomic_read(&cardp->tx_cmd_urb_pending));
308fe29ef24394 drivers/net/wireless/mwifiex/main.c         Zhaoyang Liu    =
 2015-09-18  1158  		p +=3D sprintf(p, "tx_data_urb_pending_port_0 =3D %d\n=
",
308fe29ef24394 drivers/net/wireless/mwifiex/main.c         Zhaoyang Liu    =
 2015-09-18  1159  			     atomic_read(&cardp->port[0].tx_data_urb_pending)=
);
308fe29ef24394 drivers/net/wireless/mwifiex/main.c         Zhaoyang Liu    =
 2015-09-18  1160  		p +=3D sprintf(p, "tx_data_urb_pending_port_1 =3D %d\n=
",
308fe29ef24394 drivers/net/wireless/mwifiex/main.c         Zhaoyang Liu    =
 2015-09-18  1161  			     atomic_read(&cardp->port[1].tx_data_urb_pending)=
);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1162  		p +=3D sprintf(p, "rx_cmd_urb_pending =3D %d\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1163  			     atomic_read(&cardp->rx_cmd_urb_pending));
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1164  		p +=3D sprintf(p, "rx_data_urb_pending =3D %d\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1165  			     atomic_read(&cardp->rx_data_urb_pending));
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1166  	}
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1167  =

11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1168  	p +=3D sprintf(p, "tx_pending =3D %d\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1169  		     atomic_read(&adapter->tx_pending));
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1170  	p +=3D sprintf(p, "rx_pending =3D %d\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1171  		     atomic_read(&adapter->rx_pending));
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1172  =

11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1173  	if (adapter->iface_type =3D=3D MWIFIEX_SDIO) {
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1174  		sdio_card =3D (struct sdio_mmc_card *)adapter->card;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1175  		p +=3D sprintf(p, "\nmp_rd_bitmap=3D0x%x curr_rd_port=
=3D0x%x\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1176  			     sdio_card->mp_rd_bitmap, sdio_card->curr_rd_port=
);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1177  		p +=3D sprintf(p, "mp_wr_bitmap=3D0x%x curr_wr_port=3D=
0x%x\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1178  			     sdio_card->mp_wr_bitmap, sdio_card->curr_wr_port=
);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1179  	}
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1180  =

11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1181  	for (i =3D 0; i < adapter->priv_num; i++) {
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1182  		if (!adapter->priv[i] || !adapter->priv[i]->netdev)
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1183  			continue;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1184  		priv =3D adapter->priv[i];
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1185  		p +=3D sprintf(p, "\n[interface  : \"%s\"]\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1186  			     priv->netdev->name);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1187  		p +=3D sprintf(p, "wmm_tx_pending[0] =3D %d\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1188  			     atomic_read(&priv->wmm_tx_pending[0]));
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1189  		p +=3D sprintf(p, "wmm_tx_pending[1] =3D %d\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1190  			     atomic_read(&priv->wmm_tx_pending[1]));
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1191  		p +=3D sprintf(p, "wmm_tx_pending[2] =3D %d\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1192  			     atomic_read(&priv->wmm_tx_pending[2]));
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1193  		p +=3D sprintf(p, "wmm_tx_pending[3] =3D %d\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1194  			     atomic_read(&priv->wmm_tx_pending[3]));
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1195  		p +=3D sprintf(p, "media_state=3D\"%s\"\n", !priv->med=
ia_connected ?
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1196  			     "Disconnected" : "Connected");
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1197  		p +=3D sprintf(p, "carrier %s\n", (netif_carrier_ok(pr=
iv->netdev)
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1198  			     ? "on" : "off"));
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1199  		for (idx =3D 0; idx < priv->netdev->num_tx_queues; idx=
++) {
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1200  			txq =3D netdev_get_tx_queue(priv->netdev, idx);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1201  			p +=3D sprintf(p, "tx queue %d:%s  ", idx,
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1202  				     netif_tx_queue_stopped(txq) ?
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1203  				     "stopped" : "started");
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1204  		}
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1205  		p +=3D sprintf(p, "\n%s: num_tx_timeout =3D %d\n",
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1206  			     priv->netdev->name, priv->num_tx_timeout);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1207  	}
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1208  =

4646968b94bdf8 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2016-04-05  1209  	if (adapter->iface_type =3D=3D MWIFIEX_SDIO ||
4646968b94bdf8 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2016-04-05  1210  	    adapter->iface_type =3D=3D MWIFIEX_PCIE) {
4646968b94bdf8 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2016-04-05  1211  		p +=3D sprintf(p, "\n=3D=3D=3D %s register dump=3D=3D=
=3D\n",
4646968b94bdf8 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2016-04-05  1212  			     adapter->iface_type =3D=3D MWIFIEX_SDIO ?
4646968b94bdf8 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2016-04-05  1213  							"SDIO" : "PCIE");
809c6ea8abe9f1 drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1214  		if (adapter->if_ops.reg_dump)
809c6ea8abe9f1 drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1215  			p +=3D adapter->if_ops.reg_dump(adapter, p);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1216  	}
9cc0dbf0436767 drivers/net/wireless/mwifiex/main.c         Amitkumar Karwar=
 2015-05-26  1217  	p +=3D sprintf(p, "\n=3D=3D=3D more debug information\n=
");
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1218  	debug_info =3D kzalloc(sizeof(*debug_info), GFP_KERNEL);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1219  	if (debug_info) {
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1220  		for (i =3D 0; i < adapter->priv_num; i++) {
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1221  			if (!adapter->priv[i] || !adapter->priv[i]->netdev)
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1222  				continue;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1223  			priv =3D adapter->priv[i];
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1224  			mwifiex_get_debug_info(priv, debug_info);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1225  			p +=3D mwifiex_debug_info_to_buffer(priv, p, debug_in=
fo);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1226  			break;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1227  		}
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1228  		kfree(debug_info);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1229  	}
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1230  =

d0e2b44ef32814 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2017-12-12  1231  	strcpy(p, "\n=3D=3D=3D=3D=3D=3D=3D=3DEnd dump=3D=3D=3D=
=3D=3D=3D=3D=3D\n");
d0e2b44ef32814 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2017-12-12  1232  	p +=3D strlen("\n=3D=3D=3D=3D=3D=3D=3D=3DEnd dump=3D=3D=
=3D=3D=3D=3D=3D=3D\n");
9cc0dbf0436767 drivers/net/wireless/mwifiex/main.c         Amitkumar Karwar=
 2015-05-26  1233  	mwifiex_dbg(adapter, MSG, "=3D=3D=3Dmwifiex driverinfo =
dump end=3D=3D=3D\n");
d0e2b44ef32814 drivers/net/wireless/marvell/mwifiex/main.c Xinming Hu      =
 2017-12-12  1234  	adapter->devdump_len =3D p - (char *)adapter->devdump_d=
ata;
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1235  }
fc697159ad4c40 drivers/net/wireless/mwifiex/main.c         Amitkumar Karwar=
 2015-05-26  1236  EXPORT_SYMBOL_GPL(mwifiex_drv_info_dump);
11cd07a9694cbd drivers/net/wireless/mwifiex/main.c         Xinming Hu      =
 2014-12-23  1237  =


:::::: The code at line 1152 was first introduced by commit
:::::: 11cd07a9694cbd4d06361d6f46b735a47daa9a77 mwifiex: save driver inform=
ation to file when firmware dump

:::::: TO: Xinming Hu <huxm@marvell.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7726221604259491739==--


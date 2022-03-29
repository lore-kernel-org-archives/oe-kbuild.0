Content-Type: multipart/mixed; boundary="===============0854268717839973236=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/gadget/udc/renesas_usb3.c:2496:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argu...
Date: Wed, 30 Mar 2022 03:49:27 +0800
Message-ID: <202203300330.dXkjLkHw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0854268717839973236==
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
:::::: branch date: 19 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220327 (https://download.01.org/0day-ci/arc=
hive/20220330/202203300330.dXkjLkHw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   net/mac80211/mesh_hwmp.c:264:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mgmt->bssid, sdata->vif.addr, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:264:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(mgmt->bssid, sdata->vif.addr, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:281:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pos, target, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:281:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(pos, target, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:440:3: warning: Value stored to 'fresh_info' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   fresh_info =3D false;
                   ^            ~~~~~
   net/mac80211/mesh_hwmp.c:440:3: note: Value stored to 'fresh_info' is ne=
ver read
                   fresh_info =3D false;
                   ^            ~~~~~
   net/mac80211/mesh_hwmp.c:514:3: warning: Value stored to 'fresh_info' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   fresh_info =3D false;
                   ^            ~~~~~
   net/mac80211/mesh_hwmp.c:514:3: note: Value stored to 'fresh_info' is ne=
ver read
                   fresh_info =3D false;
                   ^            ~~~~~
   net/mac80211/mesh_hwmp.c:733:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(next_hop, next_hop_deref_protected(mpath)->sta.addr, ETH_=
ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:733:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(next_hop, next_hop_deref_protected(mpath)->sta.addr, ETH_=
ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:885:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mpath->rann_snd_addr, mgmt->sa, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:885:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(mpath->rann_snd_addr, mgmt->sa, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:1004:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(preq_node->dst, mpath->dst, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:1004:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(preq_node->dst, mpath->dst, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:1208:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(hdr->addr1, hdr->addr3, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:1208:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(hdr->addr1, hdr->addr3, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:1209:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(hdr->addr2, sdata->vif.addr, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:1209:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(hdr->addr2, sdata->vif.addr, ETH_ALEN);
           ^~~~~~
   net/mac80211/mesh_hwmp.c:1250:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(hdr->addr1, next_hop->sta.addr, ETH_ALEN);
                   ^~~~~~
   net/mac80211/mesh_hwmp.c:1250:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(hdr->addr1, next_hop->sta.addr, ETH_ALEN);
                   ^~~~~~
   net/mac80211/mesh_hwmp.c:1251:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(hdr->addr2, sdata->vif.addr, ETH_ALEN);
                   ^~~~~~
   net/mac80211/mesh_hwmp.c:1251:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(hdr->addr2, sdata->vif.addr, ETH_ALEN);
                   ^~~~~~
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/usb/gadget/udc/m66592-udc.c:1603:3: warning: Call to function 's=
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
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/usb/gadget/udc/r8a66597-udc.c:1524:2: warning: Value stored to '=
tmp' is never read [clang-analyzer-deadcode.DeadStores]
           tmp =3D r8a66597_read(r8a66597, SYSCFG0);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/r8a66597-udc.c:1524:2: note: Value stored to 'tmp=
' is never read
           tmp =3D r8a66597_read(r8a66597, SYSCFG0);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/r8a66597-udc.c:1880:3: warning: Call to function =
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
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/usb/gadget/udc/renesas_usb3.c:1580:3: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(usb3->ep0_buf, tx_data,
                   ^~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:1580:3: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(usb3->ep0_buf, tx_data,
                   ^~~~~~
>> drivers/usb/gadget/udc/renesas_usb3.c:2496:9: warning: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedO=
rUnsafeBufferHandling]
           return sprintf(buf, "%s\n", usb3_is_host(usb3) ? "host" : "perip=
heral");
                  ^~~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:2496:9: note: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11
           return sprintf(buf, "%s\n", usb3_is_host(usb3) ? "host" : "perip=
heral");
                  ^~~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:2608:3: warning: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep=
%d", i);
                   ^~~~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:2608:3: note: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep=
%d", i);
                   ^~~~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:2649:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ramif, 0, sizeof(ramif));
           ^~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:2649:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(ramif, 0, sizeof(ramif));
           ^~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:2650:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(basead, 0, sizeof(basead));
           ^~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:2650:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(basead, 0, sizeof(basead));
           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
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
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/comedi/drivers/ni_routes.c:141:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(tables, 0, sizeof(struct ni_route_tables));
           ^~~~~~
   drivers/comedi/drivers/ni_routes.c:141:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(tables, 0, sizeof(struct ni_route_tables));
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   155 warnings generated.
   net/core/filter.c:94:3: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(dst, 0, sizeof(*dst));
                   ^~~~~~
   net/core/filter.c:94:3: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                   memset(dst, 0, sizeof(*dst));
                   ^~~~~~
   net/core/filter.c:872:4: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(new_insn, tmp_insns,
                           ^~~~~~
   net/core/filter.c:872:4: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                           memcpy(new_insn, tmp_insns,
                           ^~~~~~
   net/core/filter.c:919:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(masks, 0xff, flen * sizeof(*masks));

vim +2496 drivers/usb/gadget/udc/renesas_usb3.c

cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2487  =

cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2488  static ssize_t role_sho=
w(struct device *dev, struct device_attribute *attr,
cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2489  			 char *buf)
cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2490  {
cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2491  	struct renesas_usb3 *u=
sb3 =3D dev_get_drvdata(dev);
cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2492  =

cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2493  	if (!usb3->driver)
cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2494  		return -ENODEV;
cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2495  =

cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31 @2496  	return sprintf(buf, "%=
s\n", usb3_is_host(usb3) ? "host" : "peripheral");
cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2497  }
cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2498  static DEVICE_ATTR_RW(r=
ole);
cc995c9ec1184b9 Yoshihiro Shimoda 2017-03-31  2499  =


:::::: The code at line 2496 was first introduced by commit
:::::: cc995c9ec1184b964ffdf8cf242250bb4319cd91 usb: gadget: udc: renesas_u=
sb3: add support for usb role swap

:::::: TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0854268717839973236==--


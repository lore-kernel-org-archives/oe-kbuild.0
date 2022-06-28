Content-Type: multipart/mixed; boundary="===============3055389597355900213=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/wireless/sysfs.c:46:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides b...
Date: Tue, 28 Jun 2022 22:54:43 +0800
Message-ID: <202206282216.q0Hp15SA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3055389597355900213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 net/wireless/sysfs.c:46:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling=
]"
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
head:   941e3e7912696b9fbe3586083a7c2e102cee7a87
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220627 (https://download.01.org/0day-ci/archi=
ve/20220628/202206282216.q0Hp15SA-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 016342=
e319fd31e41cf5ed16a6140a8ea2de74dd)
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
   net/can/j1939/socket.c:572:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(addr, 0, J1939_MIN_NAMELEN);
           ^~~~~~
   net/can/j1939/socket.c:836:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(msg->msg_name, 0, msg->msg_namelen);
                   ^~~~~~
   net/can/j1939/socket.c:836:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(msg->msg_name, 0, msg->msg_namelen);
                   ^~~~~~
   net/can/j1939/socket.c:882:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(skcb, 0, sizeof(*skcb));
           ^~~~~~
   net/can/j1939/socket.c:882:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(skcb, 0, sizeof(*skcb));
           ^~~~~~
   net/can/j1939/socket.c:969:21: warning: Value stored to 'priv' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct j1939_priv *priv =3D session->priv;
                              ^~~~   ~~~~~~~~~~~~~
   net/can/j1939/socket.c:969:21: note: Value stored to 'priv' during its i=
nitialization is never read
           struct j1939_priv *priv =3D session->priv;
                              ^~~~   ~~~~~~~~~~~~~
   net/can/j1939/socket.c:1013:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(serr, 0, sizeof(*serr));
           ^~~~~~
   net/can/j1939/socket.c:1013:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(serr, 0, sizeof(*serr));
           ^~~~~~
   Suppressed 86 warnings (85 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   net/8021q/vlan_dev.c:593:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->broadcast, real_dev->broadcast, dev->addr_le=
n);
                   ^~~~~~
   net/8021q/vlan_dev.c:593:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->broadcast, real_dev->broadcast, dev->addr_le=
n);
                   ^~~~~~
   Suppressed 69 warnings (69 in non-user code).
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
   66 warnings generated.
   Suppressed 66 warnings (65 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   net/wireless/core.c:104:2: warning: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           sscanf(newname, PHY_NAME "%d%n", &wiphy_idx, &taken);
           ^~~~~~
   net/wireless/core.c:104:2: note: Call to function 'sscanf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sscanf_s' in case of C11
           sscanf(newname, PHY_NAME "%d%n", &wiphy_idx, &taken);
           ^~~~~~
   net/wireless/core.c:800:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(wiphy->perm_addr, wiphy->addresses[0].addr, ETH_A=
LEN);
                   ^~~~~~
   net/wireless/core.c:800:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(wiphy->perm_addr, wiphy->addresses[0].addr, ETH_A=
LEN);
                   ^~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   net/wireless/sysfs.c:36:1: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
   SHOW_FMT(index, "%d", wiphy_idx);
   ^
   net/wireless/sysfs.c:32:9: note: expanded from macro 'SHOW_FMT'
           return sprintf(buf, fmt "\n", dev_to_rdev(dev)->member);        \
                  ^~~~~~~
   net/wireless/sysfs.c:36:1: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
   SHOW_FMT(index, "%d", wiphy_idx);
   ^
   net/wireless/sysfs.c:32:9: note: expanded from macro 'SHOW_FMT'
           return sprintf(buf, fmt "\n", dev_to_rdev(dev)->member);        \
                  ^~~~~~~
   net/wireless/sysfs.c:37:1: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
   SHOW_FMT(macaddress, "%pM", wiphy.perm_addr);
   ^
   net/wireless/sysfs.c:32:9: note: expanded from macro 'SHOW_FMT'
           return sprintf(buf, fmt "\n", dev_to_rdev(dev)->member);        \
                  ^~~~~~~
   net/wireless/sysfs.c:37:1: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
   SHOW_FMT(macaddress, "%pM", wiphy.perm_addr);
   ^
   net/wireless/sysfs.c:32:9: note: expanded from macro 'SHOW_FMT'
           return sprintf(buf, fmt "\n", dev_to_rdev(dev)->member);        \
                  ^~~~~~~
   net/wireless/sysfs.c:38:1: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
   SHOW_FMT(address_mask, "%pM", wiphy.addr_mask);
   ^
   net/wireless/sysfs.c:32:9: note: expanded from macro 'SHOW_FMT'
           return sprintf(buf, fmt "\n", dev_to_rdev(dev)->member);        \
                  ^~~~~~~
   net/wireless/sysfs.c:38:1: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
   SHOW_FMT(address_mask, "%pM", wiphy.addr_mask);
   ^
   net/wireless/sysfs.c:32:9: note: expanded from macro 'SHOW_FMT'
           return sprintf(buf, fmt "\n", dev_to_rdev(dev)->member);        \
                  ^~~~~~~
>> net/wireless/sysfs.c:46:9: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           return sprintf(buf, "%s\n", wiphy_name(wiphy));
                  ^~~~~~~
   net/wireless/sysfs.c:46:9: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           return sprintf(buf, "%s\n", wiphy_name(wiphy));
                  ^~~~~~~
   net/wireless/sysfs.c:59:10: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%pM\n", wiphy->perm_addr);
                          ^~~~~~~
   net/wireless/sysfs.c:59:10: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%pM\n", wiphy->perm_addr);
                          ^~~~~~~
   net/wireless/sysfs.c:62:10: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   buf +=3D sprintf(buf, "%pM\n", wiphy->addresses[i].addr);
                          ^~~~~~~
   net/wireless/sysfs.c:62:10: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
                   buf +=3D sprintf(buf, "%pM\n", wiphy->addresses[i].addr);
                          ^~~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (58 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   net/nfc/digital_technology.c:366:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sel_req->nfcid1, sdd_res->nfcid1, 4);
           ^~~~~~
   net/nfc/digital_technology.c:366:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(sel_req->nfcid1, sdd_res->nfcid1, 4);
           ^~~~~~
   net/nfc/digital_technology.c:427:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(target->nfcid1 + target->nfcid1_len, sdd_res->nfcid1 + of=
fset,
           ^~~~~~
   net/nfc/digital_technology.c:427:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(target->nfcid1 + target->nfcid1_len, sdd_res->nfcid1 + of=
fset,
           ^~~~~~
   net/nfc/digital_technology.c:627:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(attrib_req->nfcid0, sensb_res->nfcid0,
           ^~~~~~
   net/nfc/digital_technology.c:627:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(attrib_req->nfcid0, sensb_res->nfcid0,
           ^~~~~~
   net/nfc/digital_technology.c:771:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&target, 0, sizeof(struct nfc_target));
           ^~~~~~
   net/nfc/digital_technology.c:771:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&target, 0, sizeof(struct nfc_target));
           ^~~~~~
   net/nfc/digital_technology.c:775:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(target.sensf_res, sensf_res, resp->len);
           ^~~~~~
   net/nfc/digital_technology.c:775:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(target.sensf_res, sensf_res, resp->len);
           ^~~~~~
   net/nfc/digital_technology.c:778:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(target.nfcid2, sensf_res->nfcid2, NFC_NFCID2_MAXSIZE);
           ^~~~~~
   net/nfc/digital_technology.c:778:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(target.nfcid2, sensf_res->nfcid2, NFC_NFCID2_MAXSIZE);
           ^~~~~~
   net/nfc/digital_technology.c:874:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(target->iso15693_uid, &res->uid, sizeof(target->iso15693_=
uid));
           ^~~~~~
   net/nfc/digital_technology.c:874:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(target->iso15693_uid, &res->uid, sizeof(target->iso15693_=
uid));
           ^~~~~~
   net/nfc/digital_technology.c:1142:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sensf_res, 0, size);
           ^~~~~~
   net/nfc/digital_technology.c:1142:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(sensf_res, 0, size);
           ^~~~~~
   Suppressed 58 warnings (58 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   109 warnings generated.
   net/bluetooth/hci_event.c:291:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hdev->adv_data, 0, sizeof(hdev->adv_data));
           ^~~~~~
   net/bluetooth/hci_event.c:291:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(hdev->adv_data, 0, sizeof(hdev->adv_data));
           ^~~~~~
   net/bluetooth/hci_event.c:294:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hdev->scan_rsp_data, 0, sizeof(hdev->scan_rsp_data));
           ^~~~~~
   net/bluetooth/hci_event.c:294:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(hdev->scan_rsp_data, 0, sizeof(hdev->scan_rsp_data));
           ^~~~~~
   net/bluetooth/hci_event.c:362:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(hdev->dev_name, sent, HCI_MAX_NAME_LENGTH);
                   ^~~~~~
   net/bluetooth/hci_event.c:362:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(hdev->dev_name, sent, HCI_MAX_NAME_LENGTH);
                   ^~~~~~
   net/bluetooth/hci_event.c:381:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(hdev->dev_name, rp->name, HCI_MAX_NAME_LENGTH);
                   ^~~~~~
   net/bluetooth/hci_event.c:381:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(hdev->dev_name, rp->name, HCI_MAX_NAME_LENGTH);
                   ^~~~~~
   net/bluetooth/hci_event.c:517:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(hdev->dev_class, rp->dev_class, 3);
--
                   ^~~~~~
   net/ipv4/devinet.c:1159:5: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(ifa->ifa_label, ifr->ifr_name, IF=
NAMSIZ);
                                   ^~~~~~
   net/ipv4/devinet.c:1159:5: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                                   memcpy(ifa->ifa_label, ifr->ifr_name, IF=
NAMSIZ);
                                   ^~~~~~
   net/ipv4/devinet.c:1161:5: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(ifa->ifa_label, dev->name, IFNAMS=
IZ);
                                   ^~~~~~
   net/ipv4/devinet.c:1161:5: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                                   memcpy(ifa->ifa_label, dev->name, IFNAMS=
IZ);
                                   ^~~~~~
   net/ipv4/devinet.c:1268:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ifr, 0, sizeof(struct ifreq));
                   ^~~~~~
   net/ipv4/devinet.c:1268:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(&ifr, 0, sizeof(struct ifreq));
                   ^~~~~~
   net/ipv4/devinet.c:1269:3: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(ifr.ifr_name, ifa->ifa_label);
                   ^~~~~~
   net/ipv4/devinet.c:1269:3: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                   strcpy(ifr.ifr_name, ifa->ifa_label);
                   ^~~~~~
   net/ipv4/devinet.c:1488:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(old, ifa->ifa_label, IFNAMSIZ);
                   ^~~~~~
   net/ipv4/devinet.c:1488:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(old, ifa->ifa_label, IFNAMSIZ);
                   ^~~~~~
   net/ipv4/devinet.c:1489:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ifa->ifa_label, dev->name, IFNAMSIZ);
                   ^~~~~~
   net/ipv4/devinet.c:1489:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(ifa->ifa_label, dev->name, IFNAMSIZ);
                   ^~~~~~
   net/ipv4/devinet.c:1494:4: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(old, ":%d", named);
                           ^~~~~~~
   net/ipv4/devinet.c:1494:4: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
                           sprintf(old, ":%d", named);
                           ^~~~~~~
   net/ipv4/devinet.c:1498:4: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(ifa->ifa_label, dot);
                           ^~~~~~
   net/ipv4/devinet.c:1498:4: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                           strcat(ifa->ifa_label, dot);
                           ^~~~~~
   net/ipv4/devinet.c:1500:4: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(ifa->ifa_label + (IFNAMSIZ - strlen(dot) =
- 1), dot);
                           ^~~~~~
   net/ipv4/devinet.c:1500:4: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                           strcpy(ifa->ifa_label + (IFNAMSIZ - strlen(dot) =
- 1), dot);
                           ^~~~~~
   net/ipv4/devinet.c:1542:5: warning: Value stored to 'in_dev' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                                   in_dev =3D inetdev_init(dev);
                                   ^        ~~~~~~~~~~~~~~~~~
   net/ipv4/devinet.c:1542:5: note: Value stored to 'in_dev' is never read
                                   in_dev =3D inetdev_init(dev);
                                   ^        ~~~~~~~~~~~~~~~~~
   net/ipv4/devinet.c:1567:5: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(ifa->ifa_label, dev->name, IFNAMS=
IZ);
                                   ^~~~~~
   net/ipv4/devinet.c:1567:5: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                                   memcpy(ifa->ifa_label, dev->name, IFNAMS=
IZ);
                                   ^~~~~~
   net/ipv4/devinet.c:2683:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(all, current->nsproxy->net_ns->ipv4.devco=
nf_all,
                           ^~~~~~
   net/ipv4/devinet.c:2683:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(all, current->nsproxy->net_ns->ipv4.devco=
nf_all,
                           ^~~~~~
   net/ipv4/devinet.c:2685:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dflt,
                           ^~~~~~
   net/ipv4/devinet.c:2685:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(dflt,
                           ^~~~~~
   net/ipv4/devinet.c:2691:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(all, init_net.ipv4.devconf_all,
                           ^~~~~~
   net/ipv4/devinet.c:2691:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(all, init_net.ipv4.devconf_all,
                           ^~~~~~
   net/ipv4/devinet.c:2693:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dflt, init_net.ipv4.devconf_dflt,
                           ^~~~~~
   net/ipv4/devinet.c:2693:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(dflt, init_net.ipv4.devconf_dflt,
                           ^~~~~~
   Suppressed 90 warnings (89 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   net/batman-adv/multicast.c:255:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mla_flags, 0, sizeof(mla_flags));
           ^~~~~~
   net/batman-adv/multicast.c:255:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&mla_flags, 0, sizeof(mla_flags));
           ^~~~~~
>> net/batman-adv/multicast.c:811:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           sprintf(str_old_flags, "[%c%c%c%s%s]",
           ^~~~~~~
   net/batman-adv/multicast.c:811:2: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           sprintf(str_old_flags, "[%c%c%c%s%s]",
           ^~~~~~~
   net/batman-adv/multicast.c:849:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mcast_data.reserved, 0, sizeof(mcast_data.reserved));
           ^~~~~~
   net/batman-adv/multicast.c:849:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(mcast_data.reserved, 0, sizeof(mcast_data.reserved));
           ^~~~~~
   Suppressed 91 warnings (90 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   73 warnings generated.
   net/batman-adv/netlink.c:1218:32: warning: Access to field 'soft_iface' =
results in a dereference of a null pointer (loaded from variable 'bat_priv'=
) [clang-analyzer-core.NullDereference]
           if (hard_iface->soft_iface !=3D bat_priv->soft_iface)
                                         ^
   net/batman-adv/netlink.c:1275:2: note: 'bat_priv' initialized to a null =
pointer value
           struct batadv_priv *bat_priv =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/netlink.c:1283:14: note: '?' condition is false
           if (WARN_ON(hweight8(ops->internal_flags & user_ptr1_flags) > 1))
                       ^
   include/asm-generic/bitops/const_hweight.h:26:23: note: expanded from ma=
cro 'hweight8'
   #define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : _=
_arch_hweight8(w))
                         ^
   net/batman-adv/netlink.c:1283:14: note: Assuming the condition is false
           if (WARN_ON(hweight8(ops->internal_flags & user_ptr1_flags) > 1))
                       ^
   include/asm-generic/bitops/const_hweight.h:26:22: note: expanded from ma=
cro 'hweight8'
   #define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : _=
_arch_hweight8(w))
                        ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/batman-adv/netlink.c:1283:2: note: Taking false branch
           if (WARN_ON(hweight8(ops->internal_flags & user_ptr1_flags) > 1))
           ^
   net/batman-adv/netlink.c:1287:15: note: Assuming the condition is false
           if (WARN_ON((ops->internal_flags & mesh_dep_flags) &&
                        ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/batman-adv/netlink.c:1287:53: note: Left side of '&&' is false
           if (WARN_ON((ops->internal_flags & mesh_dep_flags) &&
                                                              ^
   net/batman-adv/netlink.c:1287:2: note: Taking false branch
           if (WARN_ON((ops->internal_flags & mesh_dep_flags) &&
           ^
   net/batman-adv/netlink.c:1291:6: note: Assuming the condition is false
           if (ops->internal_flags & BATADV_FLAG_NEED_MESH) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/netlink.c:1291:2: note: Taking false branch
           if (ops->internal_flags & BATADV_FLAG_NEED_MESH) {
           ^
   net/batman-adv/netlink.c:1300:6: note: Assuming the condition is true
           if (ops->internal_flags & BATADV_FLAG_NEED_HARDIF) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/netlink.c:1300:2: note: Taking true branch
           if (ops->internal_flags & BATADV_FLAG_NEED_HARDIF) {
           ^
   net/batman-adv/netlink.c:1301:44: note: Passing null pointer value via 1=
st parameter 'bat_priv'
                   hard_iface =3D batadv_get_hardif_from_info(bat_priv, net=
, info);
                                                            ^~~~~~~~
   net/batman-adv/netlink.c:1301:16: note: Calling 'batadv_get_hardif_from_=
info'
                   hard_iface =3D batadv_get_hardif_from_info(bat_priv, net=
, info);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   net/batman-adv/netlink.c:1205:6: note: Assuming the condition is false
           if (!info->attrs[BATADV_ATTR_HARD_IFINDEX])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/netlink.c:1205:2: note: Taking false branch
           if (!info->attrs[BATADV_ATTR_HARD_IFINDEX])
           ^
   net/batman-adv/netlink.c:1211:6: note: Assuming 'hard_dev' is non-null
           if (!hard_dev)
               ^~~~~~~~~
   net/batman-adv/netlink.c:1211:2: note: Taking false branch
           if (!hard_dev)
           ^
   net/batman-adv/netlink.c:1215:6: note: Assuming 'hard_iface' is non-null
           if (!hard_iface)
               ^~~~~~~~~~~
   net/batman-adv/netlink.c:1215:2: note: Taking false branch
           if (!hard_iface)
           ^
   net/batman-adv/netlink.c:1218:32: note: Access to field 'soft_iface' res=
ults in a dereference of a null pointer (loaded from variable 'bat_priv')
           if (hard_iface->soft_iface !=3D bat_priv->soft_iface)
                                         ^~~~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   134 warnings generated.
   net/core/skbuff.c:210:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(shinfo, 0, offsetof(struct skb_shared_info, dataref));
           ^~~~~~
   net/core/skbuff.c:210:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(shinfo, 0, offsetof(struct skb_shared_info, dataref));
--
           ^~~~~~
   net/openvswitch/flow_netlink.c:2510:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(attrs, 0, sizeof(attrs));
           ^~~~~~
   net/openvswitch/flow_netlink.c:2595:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(match, 0, sizeof(*match));
           ^~~~~~
   net/openvswitch/flow_netlink.c:2595:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(match, 0, sizeof(*match));
           ^~~~~~
   net/openvswitch/flow_netlink.c:2600:3: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(key, 0, sizeof(*key));
                   ^~~~~~
   net/openvswitch/flow_netlink.c:2600:3: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
                   memset(key, 0, sizeof(*key));
                   ^~~~~~
   net/openvswitch/flow_netlink.c:2603:3: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&mask->key, 0, sizeof(mask->key));
                   ^~~~~~
   net/openvswitch/flow_netlink.c:2603:3: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
                   memset(&mask->key, 0, sizeof(mask->key));
                   ^~~~~~
   net/openvswitch/flow_netlink.c:2902:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(nla_data(at), nla_data(ovs_key), key_len); /* Key=
. */
                   ^~~~~~
   net/openvswitch/flow_netlink.c:2902:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(nla_data(at), nla_data(ovs_key), key_len); /* Key=
. */
                   ^~~~~~
   net/openvswitch/flow_netlink.c:2903:3: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(nla_data(at) + key_len, 0xff, key_len);    /* Mas=
k. */
                   ^~~~~~
   net/openvswitch/flow_netlink.c:2903:3: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
                   memset(nla_data(at) + key_len, 0xff, key_len);    /* Mas=
k. */
                   ^~~~~~
   net/openvswitch/flow_netlink.c:3031:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(to, from, totlen);
           ^~~~~~
   net/openvswitch/flow_netlink.c:3031:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(to, from, totlen);
           ^~~~~~
   Suppressed 103 warnings (102 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   Suppressed 80 warnings (79 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   net/ipv4/inet_fragment.c:547:5: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&fp->rbnode, 0, sizeof(fp->rbnode=
));
                                   ^~~~~~
   net/ipv4/inet_fragment.c:547:5: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                                   memset(&fp->rbnode, 0, sizeof(fp->rbnode=
));
                                   ^~~~~~
   net/ipv4/inet_fragment.c:591:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&head->rbnode, 0, sizeof(head->rbnode));
           ^~~~~~
   net/ipv4/inet_fragment.c:591:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&head->rbnode, 0, sizeof(head->rbnode));
           ^~~~~~
   Suppressed 89 warnings (88 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   86 warnings generated.
   net/core/xdp.c:161:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xdp_rxq, 0, sizeof(*xdp_rxq));
           ^~~~~~
   net/core/xdp.c:161:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(xdp_rxq, 0, sizeof(*xdp_rxq));
           ^~~~~~
   net/core/xdp.c:524:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xdpf, 0, sizeof(*xdpf));
           ^~~~~~
   net/core/xdp.c:524:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(xdpf, 0, sizeof(*xdpf));
           ^~~~~~
   net/core/xdp.c:528:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, data_to_copy, totsize);
           ^~~~~~
   net/core/xdp.c:528:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(addr, data_to_copy, totsize);
           ^~~~~~
   net/core/xdp.c:613:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(skb, 0, offsetof(struct sk_buff, tail));
           ^~~~~~
   net/core/xdp.c:613:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(skb, 0, offsetof(struct sk_buff, tail));
           ^~~~~~
   net/core/xdp.c:636:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, xdpf, totalsize);
           ^~~~~~
   net/core/xdp.c:636:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(addr, xdpf, totalsize);
           ^~~~~~
   Suppressed 81 warnings (81 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   net/wireless/mlme.c:43:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cr, 0, sizeof(cr));
           ^~~~~~
   net/wireless/mlme.c:43:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&cr, 0, sizeof(cr));
           ^~~~~~
>> net/wireless/mlme.c:217:3: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
                   sprintf(buf, "MLME-MICHAELMICFAILURE.indication("
                   ^~~~~~~
   net/wireless/mlme.c:217:3: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
                   sprintf(buf, "MLME-MICHAELMICFAILURE.indication("
                   ^~~~~~~
   net/wireless/mlme.c:221:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&wrqu, 0, sizeof(wrqu));
                   ^~~~~~
   net/wireless/mlme.c:221:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(&wrqu, 0, sizeof(wrqu));
                   ^~~~~~
   net/wireless/mlme.c:286:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ht_capa, 0, sizeof(*ht_capa));
                   ^~~~~~
   net/wireless/mlme.c:286:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(ht_capa, 0, sizeof(*ht_capa));
                   ^~~~~~
   net/wireless/mlme.c:303:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(vht_capa, 0, sizeof(*vht_capa));
                   ^~~~~~
   net/wireless/mlme.c:303:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(vht_capa, 0, sizeof(*vht_capa));
                   ^~~~~~
   net/wireless/mlme.c:426:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(bssid, wdev->current_bss->pub.bssid, ETH_ALEN);
           ^~~~~~
   net/wireless/mlme.c:426:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(bssid, wdev->current_bss->pub.bssid, ETH_ALEN);
           ^~~~~~
   net/wireless/mlme.c:578:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(nreg->match, match_data, match_len);
                   ^~~~~~
   net/wireless/mlme.c:578:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(nreg->match, match_data, match_len);
                   ^~~~~~
   net/wireless/mlme.c:929:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&rdev->radar_chandef, chandef, sizeof(struct cfg80211_cha=
n_def));
           ^~~~~~
   net/wireless/mlme.c:929:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&rdev->radar_chandef, chandef, sizeof(struct cfg80211_cha=
n_def));
           ^~~~~~
   net/wireless/mlme.c:957:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&rdev->cac_done_chandef, chandef,
                   ^~~~~~
   net/wireless/mlme.c:957:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(&rdev->cac_done_chandef, chandef,
                   ^~~~~~
   net/wireless/mlme.c:997:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&rdev->cac_done_chandef, chandef, sizeof(*chandef=
));
                   ^~~~~~
   net/wireless/mlme.c:997:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(&rdev->cac_done_chandef, chandef, sizeof(*chandef=
));
                   ^~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   122 warnings generated.
   net/wireless/scan.c:292:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(pos, tmp_new, tmp_new[1] + 2);
                   ^~~~~~
   net/wireless/scan.c:292:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(pos, tmp_new, tmp_new[1] + 2);
                   ^~~~~~
   net/wireless/scan.c:326:5: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(pos, tmp_old, tmp_old[1] + 2);
                                   ^~~~~~
   net/wireless/scan.c:326:5: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                                   memcpy(pos, tmp_old, tmp_old[1] + 2);
                                   ^~~~~~
   net/wireless/scan.c:342:6: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memcpy(pos, tmp, tmp[1] + 2);
                                           ^~~~~~
   net/wireless/scan.c:342:6: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                                           memcpy(pos, tmp, tmp[1] + 2);
                                           ^~~~~~
   net/wireless/scan.c:346:6: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memcpy(pos, tmp_old, tmp_old[1] =
+ 2);
                                           ^~~~~~
   net/wireless/scan.c:346:6: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                                           memcpy(pos, tmp_old, tmp_old[1] =
+ 2);
                                           ^~~~~~
   net/wireless/scan.c:351:5: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(pos, tmp, tmp[1] + 2);
                                   ^~~~~~
   net/wireless/scan.c:351:5: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                                   memcpy(pos, tmp, tmp[1] + 2);
                                   ^~~~~~
   net/wireless/scan.c:370:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pos, tmp_new, tmp_new[1] + 2);
                           ^~~~~~
   net/wireless/scan.c:370:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(pos, tmp_new, tmp_new[1] + 2);
                           ^~~~~~
   net/wireless/scan.c:540:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(entry->bssid, pos, ETH_ALEN);
           ^~~~~~
   net/wireless/scan.c:540:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(entry->bssid, pos, ETH_ALEN);
           ^~~~~~
   net/wireless/scan.c:544:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&entry->short_ssid, pos,

vim +46 net/wireless/sysfs.c

ef15aac6073b27f Johannes Berg      2010-01-20  39  =

cfd8e12f42746df Ben Greear         2010-10-11  40  static ssize_t name_show=
(struct device *dev,
cfd8e12f42746df Ben Greear         2010-10-11  41  			 struct device_attrib=
ute *attr,
5ec71dd7f1b63da Johannes Berg      2017-01-04  42  			 char *buf)
5ec71dd7f1b63da Johannes Berg      2017-01-04  43  {
cfd8e12f42746df Ben Greear         2010-10-11  44  	struct wiphy *wiphy =3D=
 &dev_to_rdev(dev)->wiphy;
5ec71dd7f1b63da Johannes Berg      2017-01-04  45  =

5ec71dd7f1b63da Johannes Berg      2017-01-04 @46  	return sprintf(buf, "%s=
\n", wiphy_name(wiphy));
cfd8e12f42746df Ben Greear         2010-10-11  47  }
f0bc99c84349ce8 Greg Kroah-Hartman 2013-07-24  48  static DEVICE_ATTR_RO(na=
me);
cfd8e12f42746df Ben Greear         2010-10-11  49  =


:::::: The code at line 46 was first introduced by commit
:::::: 5ec71dd7f1b63da20fefebabf1e66cb530b9eb4d cfg80211: sysfs: use wiphy_=
name()

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3055389597355900213==--


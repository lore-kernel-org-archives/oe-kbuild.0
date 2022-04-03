Content-Type: multipart/mixed; boundary="===============8699558754918585675=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-5.17 458/787] net/bluetooth/eir.h:28:2: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Mon, 04 Apr 2022 01:32:37 +0800
Message-ID: <202204040107.SaTX5mXT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8699558754918585675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-5.17
head:   910f479048304416d2f70a98fb84a9466e56c169
commit: 823b529c121fd985e726a49e4cafccb5eebe37e5 [458/787] Bluetooth: Fix s=
kb allocation in mgmt_remote_name() & mgmt_device_connected()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220403 (https://download.01.org/0day-ci/archi=
ve/20220404/202204040107.SaTX5mXT-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stab=
le.git/commit/?id=3D823b529c121fd985e726a49e4cafccb5eebe37e5
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/k=
ernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.17
        git checkout 823b529c121fd985e726a49e4cafccb5eebe37e5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:4740:6: n=
ote: Left side of '&&' is true
           if (LCNREV_IS(pi->pubpi.phy_rev, 2))
               ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/types.h:189:3: note: ex=
panded from macro 'LCNREV_IS'
           (LCNCONF_HAS(val) && (LCNCONF_IS(val) || ((var) =3D=3D (val))))
            ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/types.h:154:26: note: e=
xpanded from macro 'LCNCONF_HAS'
   #define LCNCONF_HAS(val)        CONF_HAS(LCNCONF, val)
                                   ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/types.h:133:31: note: e=
xpanded from macro 'CONF_HAS'
   #define CONF_HAS(config, val)   ((config) & (1 << (val)))
                                   ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:4740:6: n=
ote: Left side of '||' is false
           if (LCNREV_IS(pi->pubpi.phy_rev, 2))
               ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/types.h:189:24: note: e=
xpanded from macro 'LCNREV_IS'
           (LCNCONF_HAS(val) && (LCNCONF_IS(val) || ((var) =3D=3D (val))))
                                 ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/types.h:156:26: note: e=
xpanded from macro 'LCNCONF_IS'
   #define LCNCONF_IS(val)         CONF_IS(LCNCONF, val)
                                   ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/types.h:138:30: note: e=
xpanded from macro 'CONF_IS'
   #define CONF_IS(config, val)    ((config) =3D=3D (1 << (val)))
                                   ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:4740:6: n=
ote: Assuming field 'phy_rev' is not equal to 2
           if (LCNREV_IS(pi->pubpi.phy_rev, 2))
               ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/types.h:189:44: note: e=
xpanded from macro 'LCNREV_IS'
           (LCNCONF_HAS(val) && (LCNCONF_IS(val) || ((var) =3D=3D (val))))
                                                     ^~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:4740:2: n=
ote: Taking false branch
           if (LCNREV_IS(pi->pubpi.phy_rev, 2))
           ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:4742:2: n=
ote: Calling 'wlc_lcnphy_bu_tweaks'
           wlc_lcnphy_bu_tweaks(pi);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:4373:41: =
note: The result of the left shift is undefined because the left operand is=
 negative
           mod_phy_reg(pi, 0x4df, (0xff << 8), -9 << 8);
                                               ~~ ^
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:4434:3: w=
arning: Value stored to 'rcal_value' is never read [clang-analyzer-deadcode=
.DeadStores]
                   rcal_value =3D rcal_value & 0x1f;
                   ^            ~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:4434:3: n=
ote: Value stored to 'rcal_value' is never read
                   rcal_value =3D rcal_value & 0x1f;
                   ^            ~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:4629:27: =
warning: Value stored to 'pi_lcn' during its initialization is never read [=
clang-analyzer-deadcode.DeadStores]
           struct brcms_phy_lcnphy *pi_lcn =3D pi->u.pi_lcnphy;
                                    ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:4629:27: =
note: Value stored to 'pi_lcn' during its initialization is never read
           struct brcms_phy_lcnphy *pi_lcn =3D pi->u.pi_lcnphy;
                                    ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:5103:11: =
warning: The result of the left shift is undefined due to shifting by '4294=
967295', which is greater or equal to the width of type 'int' [clang-analyz=
er-core.UndefinedBinaryOperatorResult]
           val1 =3D 1 << msb1;
                    ^  ~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:5101:2: n=
ote: The value 4294967295 is assigned to 'msb1'
           msb1 =3D ffs(power) - 1;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:5103:11: =
note: The result of the left shift is undefined due to shifting by '4294967=
295', which is greater or equal to the width of type 'int'
           val1 =3D 1 << msb1;
                    ^  ~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:5104:11: =
warning: The result of the left shift is undefined due to shifting by '32',=
 which is greater or equal to the width of type 'int' [clang-analyzer-core.=
UndefinedBinaryOperatorResult]
           val2 =3D 1 << msb2;
                    ^  ~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:5102:2: n=
ote: The value 32 is assigned to 'msb2'
           msb2 =3D msb1 + 1;
           ^~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:5104:11: =
note: The result of the left shift is undefined due to shifting by '32', wh=
ich is greater or equal to the width of type 'int'
           val2 =3D 1 << msb2;
                    ^  ~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   net/bluetooth/hci_core.c:890:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(di.name, hdev->name);
           ^~~~~~
   net/bluetooth/hci_core.c:890:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(di.name, hdev->name);
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> net/bluetooth/eir.h:28:2: warning: Null pointer passed as 2nd argument t=
o memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(&eir[eir_len], data, data_len);
           ^
   net/bluetooth/mgmt.c:9090:6: note: Assuming field 'le_adv_data_len' is <=
=3D 0
           if (conn->le_adv_data_len > 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:9090:2: note: Taking false branch
           if (conn->le_adv_data_len > 0)
           ^
   net/bluetooth/mgmt.c:9095:25: note: Assuming 'name' is null
                                        sizeof(*ev) + (name ? eir_precalc_l=
en(name_len) : 0) +
                                                       ^~~~
   net/bluetooth/mgmt.c:9095:25: note: '?' condition is false
   net/bluetooth/mgmt.c:9102:6: note: Assuming field 'out' is false
           if (conn->out)
               ^~~~~~~~~
   net/bluetooth/mgmt.c:9102:2: note: Taking false branch
           if (conn->out)
           ^
   net/bluetooth/mgmt.c:9111:12: note: Field 'le_adv_data_len' is <=3D 0
           if (conn->le_adv_data_len > 0) {
                     ^
   net/bluetooth/mgmt.c:9111:2: note: Taking false branch
           if (conn->le_adv_data_len > 0) {
           ^
   net/bluetooth/mgmt.c:9115:7: note: Assuming 'name_len' is > 0
                   if (name_len > 0) {
                       ^~~~~~~~~~~~
   net/bluetooth/mgmt.c:9115:3: note: Taking true branch
                   if (name_len > 0) {
                   ^
   net/bluetooth/mgmt.c:9117:9: note: Passing null pointer value via 4th pa=
rameter 'data'
                                                     name, name_len);
                                                     ^~~~
   net/bluetooth/mgmt.c:9116:14: note: Calling 'eir_append_data'
                           eir_len =3D eir_append_data(ev->eir, 0, EIR_NAME=
_COMPLETE,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   net/bluetooth/eir.h:28:2: note: Null pointer passed as 2nd argument to m=
emory copy function
           memcpy(&eir[eir_len], data, data_len);
           ^                     ~~~~
   net/bluetooth/mgmt.c:6653:4: warning: Value stored to 'authenticated' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           authenticated =3D 0x00;
                           ^               ~~~~
   net/bluetooth/mgmt.c:6653:4: note: Value stored to 'authenticated' is ne=
ver read
                           authenticated =3D 0x00;
                           ^               ~~~~
   net/bluetooth/mgmt.c:6654:4: warning: Value stored to 'type' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           type =3D SMP_LTK_P256_DEBUG;
                           ^      ~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:6654:4: note: Value stored to 'type' is never read
                           type =3D SMP_LTK_P256_DEBUG;
                           ^      ~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:7608:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D mgmt_limited_event(MGMT_EV_LOCAL_OOB_DATA_UPDATED, hdev,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:7608:2: note: Value stored to 'err' is never read
           err =3D mgmt_limited_event(MGMT_EV_LOCAL_OOB_DATA_UPDATED, hdev,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:7954:14: warning: Although the value stored to 'cur=
_len' is used in the enclosing expression, the value is never actually read=
 from 'cur_len' [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0, cur_len =3D 0; i < len; i +=3D (cur_len + 1)) {
                       ^         ~
   net/bluetooth/mgmt.c:7954:14: note: Although the value stored to 'cur_le=
n' is used in the enclosing expression, the value is never actually read fr=
om 'cur_len'
           for (i =3D 0, cur_len =3D 0; i < len; i +=3D (cur_len + 1)) {
                       ^         ~
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
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).

vim +28 net/bluetooth/eir.h

823b529c121fd9 Radoslaw Biernacki     2022-02-01  22  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  23  static inline u16 eir=
_append_data(u8 *eir, u16 eir_len, u8 type,
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  24  				  u8 *data, u8 da=
ta_len)
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  25  {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  26  	eir[eir_len++] =3D s=
izeof(type) + data_len;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  27  	eir[eir_len++] =3D t=
ype;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20 @28  	memcpy(&eir[eir_len]=
, data, data_len);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  29  	eir_len +=3D data_le=
n;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  30  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  31  	return eir_len;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  32  }
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  33  =


:::::: The code@line 28 was first introduced by commit
:::::: 01ce70b0a274bd76a5a311fb90d4d446d9bdfea1 Bluetooth: eir: Move EIR/Ad=
v Data functions to its own file

:::::: TO: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8699558754918585675==--


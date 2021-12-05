Content-Type: multipart/mixed; boundary="===============2310361027697566663=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath11k/mac.c:1927:27: warning: Although the value stored to 'he_mcs' is used in the enclosing expression, the value is never actually read from 'he_mcs' [clang-analyzer-deadcode.DeadStores]
Date: Sun, 05 Dec 2021 08:40:25 +0800
Message-ID: <202112050821.X3jKB1bZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2310361027697566663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miles Hu <milehu@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>
CC: Aloka Dixit <alokad@codeaurora.org>
CC: Lavanya Suresh <lavaks@codeaurora.org>
CC: Pradeep Chitrapu <pradeepc@codeaurora.org>
CC: Venkateswara Naralasetty <vnaralas@codeaurora.org>
CC: Jouni Malinen <jouni@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bbef3c7a63d2a4cb0f3f839db9e767f168c5e348
commit: 61fe43e7216df6e9a912d831aafc7142fa20f280 ath11k: add support for se=
tting fixed HE rate/gi/ltf
date:   10 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-c001-20211015 (https://download.01.org/0day-ci/arch=
ive/20211205/202112050821.X3jKB1bZ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6069a6=
a5049497a32a50a49661c2f4169078bdba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D61fe43e7216df6e9a912d831aafc7142fa20f280
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 61fe43e7216df6e9a912d831aafc7142fa20f280
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   16 warnings generated.
   drivers/video/fbdev/nvidia/nv_i2c.c:89:2: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
           strcpy(chan->adapter.name, name);
           ^~~~~~
   drivers/video/fbdev/nvidia/nv_i2c.c:89:2: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
           strcpy(chan->adapter.name, name);
           ^~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   16 warnings generated.
   drivers/video/fbdev/nvidia/nvidia.c:124:4: warning: Value stored to 'tmp=
' is never read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D 0;
                           ^     ~
   drivers/video/fbdev/nvidia/nvidia.c:124:4: note: Value stored to 'tmp' i=
s never read
                           tmp =3D 0;
                           ^     ~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/net/wireless/ath/ath11k/wmi.c:890:2: warning: Value stored to 'p=
tr' is never read [clang-analyzer-deadcode.DeadStores]
           ptr +=3D sizeof(*tlv);
           ^      ~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:890:2: note: Value stored to 'ptr'=
 is never read
           ptr +=3D sizeof(*tlv);
           ^      ~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:7111:22: warning: Assigned value i=
s garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           conn_req.service_id =3D svc_id[pdev_idx];
                               ^
   drivers/net/wireless/ath/ath11k/wmi.c:7227:6: note: Assuming 'wmi_ep_cou=
nt' is <=3D field 'max_radios'
           if (wmi_ep_count > ab->hw_params.max_radios)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:7227:2: note: Taking false branch
           if (wmi_ep_count > ab->hw_params.max_radios)
           ^
   drivers/net/wireless/ath/ath11k/wmi.c:7230:14: note: Assuming 'i' is < '=
wmi_ep_count'
           for (i =3D 0; i < wmi_ep_count; i++)
                       ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:7230:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < wmi_ep_count; i++)
           ^
   drivers/net/wireless/ath/ath11k/wmi.c:7230:14: note: Assuming 'i' is < '=
wmi_ep_count'
           for (i =3D 0; i < wmi_ep_count; i++)
                       ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:7230:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < wmi_ep_count; i++)
           ^
   drivers/net/wireless/ath/ath11k/wmi.c:7230:14: note: Assuming 'i' is < '=
wmi_ep_count'
           for (i =3D 0; i < wmi_ep_count; i++)
                       ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:7230:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < wmi_ep_count; i++)
           ^
   drivers/net/wireless/ath/ath11k/wmi.c:7230:32: note: The value 3 is assi=
gned to 'i'
           for (i =3D 0; i < wmi_ep_count; i++)
                                         ^~~
   drivers/net/wireless/ath/ath11k/wmi.c:7230:14: note: Assuming 'i' is < '=
wmi_ep_count'
           for (i =3D 0; i < wmi_ep_count; i++)
                       ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:7230:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < wmi_ep_count; i++)
           ^
   drivers/net/wireless/ath/ath11k/wmi.c:7231:39: note: Passing the value 3=
 via 2nd parameter 'pdev_idx'
                   ath11k_connect_pdev_htc_service(ab, i);
                                                       ^
   drivers/net/wireless/ath/ath11k/wmi.c:7231:3: note: Calling 'ath11k_conn=
ect_pdev_htc_service'
                   ath11k_connect_pdev_htc_service(ab, i);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:7111:22: note: Assigned value is g=
arbage or undefined
           conn_req.service_id =3D svc_id[pdev_idx];
                               ^ ~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/net/wireless/ath/ath11k/mac.c:1661:27: warning: Although the val=
ue stored to 'vht_mcs' is used in the enclosing expression, the value is ne=
ver actually read from 'vht_mcs' [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0, max_nss =3D 0, vht_mcs =3D 0; i < NL80211_VHT_NSS_=
MAX; i++) {
                                    ^         ~
   drivers/net/wireless/ath/ath11k/mac.c:1661:27: note: Although the value =
stored to 'vht_mcs' is used in the enclosing expression, the value is never=
 actually read from 'vht_mcs'
           for (i =3D 0, max_nss =3D 0, vht_mcs =3D 0; i < NL80211_VHT_NSS_=
MAX; i++) {
                                    ^         ~
>> drivers/net/wireless/ath/ath11k/mac.c:1927:27: warning: Although the val=
ue stored to 'he_mcs' is used in the enclosing expression, the value is nev=
er actually read from 'he_mcs' [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0, max_nss =3D 0, he_mcs =3D 0; i < NL80211_HE_NSS_MA=
X; i++) {
                                    ^        ~
   drivers/net/wireless/ath/ath11k/mac.c:1927:27: note: Although the value =
stored to 'he_mcs' is used in the enclosing expression, the value is never =
actually read from 'he_mcs'
           for (i =3D 0, max_nss =3D 0, he_mcs =3D 0; i < NL80211_HE_NSS_MA=
X; i++) {
                                    ^        ~
   drivers/net/wireless/ath/ath11k/mac.c:3141:3: warning: 1st function call=
 argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   kfree(arg.extraie.ptr);
                   ^     ~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:3078:2: note: Control jumps to 'ca=
se ATH11K_SCAN_ABORTING:' @line 3089
           switch (ar->scan.state) {
           ^
   drivers/net/wireless/ath/ath11k/mac.c:3091:3: note:  Execution continues=
 on line 3093
                   break;
                   ^
   drivers/net/wireless/ath/ath11k/mac.c:3095:6: note: 'ret' is -16
           if (ret)
               ^~~
   drivers/net/wireless/ath/ath11k/mac.c:3095:2: note: Taking true branch
           if (ret)
           ^
   drivers/net/wireless/ath/ath11k/mac.c:3096:3: note: Control jumps to lin=
e 3140
                   goto exit;
                   ^
   drivers/net/wireless/ath/ath11k/mac.c:3140:6: note: Assuming field 'ie_l=
en' is not equal to 0
           if (req->ie_len)
               ^~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:3140:2: note: Taking true branch
           if (req->ie_len)
           ^
   drivers/net/wireless/ath/ath11k/mac.c:3141:3: note: 1st function call ar=
gument is an uninitialized value
                   kfree(arg.extraie.ptr);
                   ^     ~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:4091:3: warning: Value stored to '=
bw' is never read [clang-analyzer-deadcode.DeadStores]
                   bw =3D WMI_PEER_CHWIDTH_20MHZ;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:4091:3: note: Value stored to 'bw'=
 is never read
                   bw =3D WMI_PEER_CHWIDTH_20MHZ;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:4120:3: warning: Value stored to '=
smps' is never read [clang-analyzer-deadcode.DeadStores]
                   smps =3D WMI_PEER_SMPS_PS_NONE;
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:4120:3: note: Value stored to 'smp=
s' is never read
                   smps =3D WMI_PEER_SMPS_PS_NONE;
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:5684:2: warning: Value stored to '=
changed_flags' is never read [clang-analyzer-deadcode.DeadStores]
           changed_flags &=3D SUPPORTED_FILTERS;
           ^
   drivers/net/wireless/ath/ath11k/mac.c:5684:2: note: Value stored to 'cha=
nged_flags' is never read
   drivers/net/wireless/ath/ath11k/mac.c:7312:22: warning: Value stored to =
'ab' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct ath11k_base *ab =3D ar->ab;
                               ^~   ~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:7312:22: note: Value stored to 'ab=
' during its initialization is never read
           struct ath11k_base *ab =3D ar->ab;
                               ^~   ~~~~~~
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   include/linux/hid.h:1007:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-penmount.c:22:6: note: Assuming the condition is true
           if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_BUTTON) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-penmount.c:22:2: note: Taking true branch
           if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_BUTTON) {
           ^
   drivers/hid/hid-penmount.c:23:7: note: Assuming the condition is true
                   if (((usage->hid - 1) & HID_USAGE) =3D=3D 0) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-penmount.c:23:3: note: Taking true branch
                   if (((usage->hid - 1) & HID_USAGE) =3D=3D 0) {
                   ^
   drivers/hid/hid-penmount.c:24:4: note: Calling 'hid_map_usage'
                           hid_map_usage(hi, usage, bit, max, EV_KEY, BTN_T=
OUCH);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/hid.h:982:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:986:2: note: Control jumps to 'case 1:'  at line 995
           switch (type) {
           ^
   include/linux/hid.h:998:3: note:  Execution continues on line 1005
                   break;
                   ^
   include/linux/hid.h:1005:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1005:28: note: Assuming 'bmap' is null

vim +1927 drivers/net/wireless/ath/ath11k/mac.c

61fe43e7216df6 Miles Hu            2021-09-24  1761  =

d5c65159f28953 Kalle Valo          2019-11-23  1762  static void ath11k_pee=
r_assoc_h_he(struct ath11k *ar,
d5c65159f28953 Kalle Valo          2019-11-23  1763  				   struct ieee8021=
1_vif *vif,
d5c65159f28953 Kalle Valo          2019-11-23  1764  				   struct ieee8021=
1_sta *sta,
d5c65159f28953 Kalle Valo          2019-11-23  1765  				   struct peer_ass=
oc_params *arg)
d5c65159f28953 Kalle Valo          2019-11-23  1766  {
61fe43e7216df6 Miles Hu            2021-09-24  1767  	struct ath11k_vif *ar=
vif =3D (void *)vif->drv_priv;
61fe43e7216df6 Miles Hu            2021-09-24  1768  	struct cfg80211_chan_=
def def;
9f056ed8ee01ad John Crispin        2019-11-25  1769  	const struct ieee8021=
1_sta_he_cap *he_cap =3D &sta->he_cap;
af6d39db1b046a Tamizh Chelvam      2020-09-08  1770  	u8 ampdu_factor;
61fe43e7216df6 Miles Hu            2021-09-24  1771  	enum nl80211_band ban=
d;
61fe43e7216df6 Miles Hu            2021-09-24  1772  	u16 *he_mcs_mask;
61fe43e7216df6 Miles Hu            2021-09-24  1773  	u8 max_nss, he_mcs;
61fe43e7216df6 Miles Hu            2021-09-24  1774  	u16 he_tx_mcs =3D 0, =
v =3D 0;
61fe43e7216df6 Miles Hu            2021-09-24  1775  	int i, he_nss, nss_id=
x;
61fe43e7216df6 Miles Hu            2021-09-24  1776  	bool user_rate_valid =
=3D true;
61fe43e7216df6 Miles Hu            2021-09-24  1777  =

61fe43e7216df6 Miles Hu            2021-09-24  1778  	if (WARN_ON(ath11k_ma=
c_vif_chan(vif, &def)))
61fe43e7216df6 Miles Hu            2021-09-24  1779  		return;
9f056ed8ee01ad John Crispin        2019-11-25  1780  =

9f056ed8ee01ad John Crispin        2019-11-25  1781  	if (!he_cap->has_he)
9f056ed8ee01ad John Crispin        2019-11-25  1782  		return;
9f056ed8ee01ad John Crispin        2019-11-25  1783  =

61fe43e7216df6 Miles Hu            2021-09-24  1784  	band =3D def.chan->ba=
nd;
61fe43e7216df6 Miles Hu            2021-09-24  1785  	he_mcs_mask =3D arvif=
->bitrate_mask.control[band].he_mcs;
61fe43e7216df6 Miles Hu            2021-09-24  1786  =

61fe43e7216df6 Miles Hu            2021-09-24  1787  	if (ath11k_peer_assoc=
_h_he_masked(he_mcs_mask))
61fe43e7216df6 Miles Hu            2021-09-24  1788  		return;
61fe43e7216df6 Miles Hu            2021-09-24  1789  =

9f056ed8ee01ad John Crispin        2019-11-25  1790  	arg->he_flag =3D true;
9f056ed8ee01ad John Crispin        2019-11-25  1791  =

c8bcd82a4efd05 Kees Cook           2021-06-16  1792  	memcpy_and_pad(&arg->=
peer_he_cap_macinfo,
c8bcd82a4efd05 Kees Cook           2021-06-16  1793  		       sizeof(arg->p=
eer_he_cap_macinfo),
c8bcd82a4efd05 Kees Cook           2021-06-16  1794  		       he_cap->he_ca=
p_elem.mac_cap_info,
c8bcd82a4efd05 Kees Cook           2021-06-16  1795  		       sizeof(he_cap=
->he_cap_elem.mac_cap_info),
c8bcd82a4efd05 Kees Cook           2021-06-16  1796  		       0);
c8bcd82a4efd05 Kees Cook           2021-06-16  1797  	memcpy_and_pad(&arg->=
peer_he_cap_phyinfo,
c8bcd82a4efd05 Kees Cook           2021-06-16  1798  		       sizeof(arg->p=
eer_he_cap_phyinfo),
c8bcd82a4efd05 Kees Cook           2021-06-16  1799  		       he_cap->he_ca=
p_elem.phy_cap_info,
c8bcd82a4efd05 Kees Cook           2021-06-16  1800  		       sizeof(he_cap=
->he_cap_elem.phy_cap_info),
c8bcd82a4efd05 Kees Cook           2021-06-16  1801  		       0);
60689de46c7f6a Rajkumar Manoharan  2020-04-24  1802  	arg->peer_he_ops =3D =
vif->bss_conf.he_oper.params;
9f056ed8ee01ad John Crispin        2019-11-25  1803  =

9f056ed8ee01ad John Crispin        2019-11-25  1804  	/* the top most byte =
is used to indicate BSS color info */
9f056ed8ee01ad John Crispin        2019-11-25  1805  	arg->peer_he_ops &=3D=
 0xffffff;
9f056ed8ee01ad John Crispin        2019-11-25  1806  =

af6d39db1b046a Tamizh Chelvam      2020-09-08  1807  	/* As per section 26.=
6.1 11ax Draft5.0, if the Max AMPDU Exponent Extension
af6d39db1b046a Tamizh Chelvam      2020-09-08  1808  	 * in HE cap is zero,=
 use the arg->peer_max_mpdu as calculated while parsing
af6d39db1b046a Tamizh Chelvam      2020-09-08  1809  	 * VHT caps(if VHT ca=
ps is present) or HT caps (if VHT caps is not present).
af6d39db1b046a Tamizh Chelvam      2020-09-08  1810  	 *
af6d39db1b046a Tamizh Chelvam      2020-09-08  1811  	 * For non-zero value=
 of Max AMPDU Extponent Extension in HE MAC caps,
af6d39db1b046a Tamizh Chelvam      2020-09-08  1812  	 * if a HE STA sends =
VHT cap and HE cap IE in assoc request then, use
af6d39db1b046a Tamizh Chelvam      2020-09-08  1813  	 * MAX_AMPDU_LEN_FACT=
OR as 20 to calculate max_ampdu length.
af6d39db1b046a Tamizh Chelvam      2020-09-08  1814  	 * If a HE STA that d=
oes not send VHT cap, but HE and HT cap in assoc
af6d39db1b046a Tamizh Chelvam      2020-09-08  1815  	 * request, then use =
MAX_AMPDU_LEN_FACTOR as 16 to calculate max_ampdu
af6d39db1b046a Tamizh Chelvam      2020-09-08  1816  	 * length.
af6d39db1b046a Tamizh Chelvam      2020-09-08  1817  	 */
1f851b8dfd76a0 Johannes Berg       2021-04-09  1818  	ampdu_factor =3D u8_g=
et_bits(he_cap->he_cap_elem.mac_cap_info[3],
1f851b8dfd76a0 Johannes Berg       2021-04-09  1819  				   IEEE80211_HE_MA=
C_CAP3_MAX_AMPDU_LEN_EXP_MASK);
af6d39db1b046a Tamizh Chelvam      2020-09-08  1820  =

af6d39db1b046a Tamizh Chelvam      2020-09-08  1821  	if (ampdu_factor) {
af6d39db1b046a Tamizh Chelvam      2020-09-08  1822  		if (sta->vht_cap.vht=
_supported)
af6d39db1b046a Tamizh Chelvam      2020-09-08  1823  			arg->peer_max_mpdu =
=3D (1 << (IEEE80211_HE_VHT_MAX_AMPDU_FACTOR +
af6d39db1b046a Tamizh Chelvam      2020-09-08  1824  						    ampdu_factor=
)) - 1;
af6d39db1b046a Tamizh Chelvam      2020-09-08  1825  		else if (sta->ht_cap=
.ht_supported)
af6d39db1b046a Tamizh Chelvam      2020-09-08  1826  			arg->peer_max_mpdu =
=3D (1 << (IEEE80211_HE_HT_MAX_AMPDU_FACTOR +
af6d39db1b046a Tamizh Chelvam      2020-09-08  1827  						    ampdu_factor=
)) - 1;
af6d39db1b046a Tamizh Chelvam      2020-09-08  1828  	}
af6d39db1b046a Tamizh Chelvam      2020-09-08  1829  =

9f056ed8ee01ad John Crispin        2019-11-25  1830  	if (he_cap->he_cap_el=
em.phy_cap_info[6] &
9f056ed8ee01ad John Crispin        2019-11-25  1831  	    IEEE80211_HE_PHY_=
CAP6_PPE_THRESHOLD_PRESENT) {
9f056ed8ee01ad John Crispin        2019-11-25  1832  		int bit =3D 7;
9f056ed8ee01ad John Crispin        2019-11-25  1833  		int nss, ru;
9f056ed8ee01ad John Crispin        2019-11-25  1834  =

9f056ed8ee01ad John Crispin        2019-11-25  1835  		arg->peer_ppet.numss=
_m1 =3D he_cap->ppe_thres[0] &
9f056ed8ee01ad John Crispin        2019-11-25  1836  					  IEEE80211_PPE_T=
HRES_NSS_MASK;
9f056ed8ee01ad John Crispin        2019-11-25  1837  		arg->peer_ppet.ru_bi=
t_mask =3D
9f056ed8ee01ad John Crispin        2019-11-25  1838  			(he_cap->ppe_thres[=
0] &
9f056ed8ee01ad John Crispin        2019-11-25  1839  			 IEEE80211_PPE_THRE=
S_RU_INDEX_BITMASK_MASK) >>
9f056ed8ee01ad John Crispin        2019-11-25  1840  			IEEE80211_PPE_THRES=
_RU_INDEX_BITMASK_POS;
9f056ed8ee01ad John Crispin        2019-11-25  1841  =

9f056ed8ee01ad John Crispin        2019-11-25  1842  		for (nss =3D 0; nss =
<=3D arg->peer_ppet.numss_m1; nss++) {
9f056ed8ee01ad John Crispin        2019-11-25  1843  			for (ru =3D 0; ru <=
 4; ru++) {
9f056ed8ee01ad John Crispin        2019-11-25  1844  				u32 val =3D 0;
9f056ed8ee01ad John Crispin        2019-11-25  1845  				int i;
9f056ed8ee01ad John Crispin        2019-11-25  1846  =

9f056ed8ee01ad John Crispin        2019-11-25  1847  				if ((arg->peer_ppe=
t.ru_bit_mask & BIT(ru)) =3D=3D 0)
9f056ed8ee01ad John Crispin        2019-11-25  1848  					continue;
9f056ed8ee01ad John Crispin        2019-11-25  1849  				for (i =3D 0; i < =
6; i++) {
9f056ed8ee01ad John Crispin        2019-11-25  1850  					val >>=3D 1;
9f056ed8ee01ad John Crispin        2019-11-25  1851  					val |=3D ((he_cap=
->ppe_thres[bit / 8] >>
9f056ed8ee01ad John Crispin        2019-11-25  1852  						 (bit % 8)) & 0x=
1) << 5;
9f056ed8ee01ad John Crispin        2019-11-25  1853  					bit++;
9f056ed8ee01ad John Crispin        2019-11-25  1854  				}
9f056ed8ee01ad John Crispin        2019-11-25  1855  				arg->peer_ppet.ppe=
t16_ppet8_ru3_ru0[nss] |=3D
9f056ed8ee01ad John Crispin        2019-11-25  1856  								val << (ru * 6=
);
9f056ed8ee01ad John Crispin        2019-11-25  1857  			}
9f056ed8ee01ad John Crispin        2019-11-25  1858  		}
9f056ed8ee01ad John Crispin        2019-11-25  1859  	}
9f056ed8ee01ad John Crispin        2019-11-25  1860  =

6d293d447670da John Crispin        2019-11-25  1861  	if (he_cap->he_cap_el=
em.mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_RES)
6d293d447670da John Crispin        2019-11-25  1862  		arg->twt_responder =
=3D true;
6d293d447670da John Crispin        2019-11-25  1863  	if (he_cap->he_cap_el=
em.mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_REQ)
6d293d447670da John Crispin        2019-11-25  1864  		arg->twt_requester =
=3D true;
6d293d447670da John Crispin        2019-11-25  1865  =

61fe43e7216df6 Miles Hu            2021-09-24  1866  	he_nss =3D  ath11k_ma=
c_max_he_nss(he_mcs_mask);
61fe43e7216df6 Miles Hu            2021-09-24  1867  =

61fe43e7216df6 Miles Hu            2021-09-24  1868  	if (he_nss > sta->rx_=
nss) {
61fe43e7216df6 Miles Hu            2021-09-24  1869  		user_rate_valid =3D =
false;
61fe43e7216df6 Miles Hu            2021-09-24  1870  		for (nss_idx =3D sta=
->rx_nss - 1; nss_idx >=3D 0; nss_idx--) {
61fe43e7216df6 Miles Hu            2021-09-24  1871  			if (he_mcs_mask[nss=
_idx]) {
61fe43e7216df6 Miles Hu            2021-09-24  1872  				user_rate_valid =
=3D true;
61fe43e7216df6 Miles Hu            2021-09-24  1873  				break;
61fe43e7216df6 Miles Hu            2021-09-24  1874  			}
61fe43e7216df6 Miles Hu            2021-09-24  1875  		}
61fe43e7216df6 Miles Hu            2021-09-24  1876  	}
61fe43e7216df6 Miles Hu            2021-09-24  1877  =

61fe43e7216df6 Miles Hu            2021-09-24  1878  	if (!user_rate_valid)=
 {
61fe43e7216df6 Miles Hu            2021-09-24  1879  		ath11k_dbg(ar->ab, A=
TH11K_DBG_MAC, "mac setting he range mcs value to peer supported nss %d for=
 peer %pM\n",
61fe43e7216df6 Miles Hu            2021-09-24  1880  			   sta->rx_nss, sta=
->addr);
61fe43e7216df6 Miles Hu            2021-09-24  1881  		he_mcs_mask[sta->rx_=
nss - 1] =3D he_mcs_mask[he_nss - 1];
61fe43e7216df6 Miles Hu            2021-09-24  1882  	}
61fe43e7216df6 Miles Hu            2021-09-24  1883  =

9f056ed8ee01ad John Crispin        2019-11-25  1884  	switch (sta->bandwidt=
h) {
9f056ed8ee01ad John Crispin        2019-11-25  1885  	case IEEE80211_STA_RX=
_BW_160:
9f056ed8ee01ad John Crispin        2019-11-25  1886  		if (he_cap->he_cap_e=
lem.phy_cap_info[0] &
9f056ed8ee01ad John Crispin        2019-11-25  1887  		    IEEE80211_HE_PHY=
_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G) {
9f056ed8ee01ad John Crispin        2019-11-25  1888  			v =3D le16_to_cpu(h=
e_cap->he_mcs_nss_supp.rx_mcs_80p80);
61fe43e7216df6 Miles Hu            2021-09-24  1889  			v =3D ath11k_peer_a=
ssoc_h_he_limit(v, he_mcs_mask);
9f056ed8ee01ad John Crispin        2019-11-25  1890  			arg->peer_he_rx_mcs=
_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  1891  =

9f056ed8ee01ad John Crispin        2019-11-25  1892  			v =3D le16_to_cpu(h=
e_cap->he_mcs_nss_supp.tx_mcs_80p80);
9f056ed8ee01ad John Crispin        2019-11-25  1893  			arg->peer_he_tx_mcs=
_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  1894  =

9f056ed8ee01ad John Crispin        2019-11-25  1895  			arg->peer_he_mcs_co=
unt++;
61fe43e7216df6 Miles Hu            2021-09-24  1896  			he_tx_mcs =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  1897  		}
9f056ed8ee01ad John Crispin        2019-11-25  1898  		v =3D le16_to_cpu(he=
_cap->he_mcs_nss_supp.rx_mcs_160);
9f056ed8ee01ad John Crispin        2019-11-25  1899  		arg->peer_he_rx_mcs_=
set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  1900  =

9f056ed8ee01ad John Crispin        2019-11-25  1901  		v =3D le16_to_cpu(he=
_cap->he_mcs_nss_supp.tx_mcs_160);
61fe43e7216df6 Miles Hu            2021-09-24  1902  		v =3D ath11k_peer_as=
soc_h_he_limit(v, he_mcs_mask);
9f056ed8ee01ad John Crispin        2019-11-25  1903  		arg->peer_he_tx_mcs_=
set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  1904  =

9f056ed8ee01ad John Crispin        2019-11-25  1905  		arg->peer_he_mcs_cou=
nt++;
61fe43e7216df6 Miles Hu            2021-09-24  1906  		if (!he_tx_mcs)
61fe43e7216df6 Miles Hu            2021-09-24  1907  			he_tx_mcs =3D v;
0b294aebb6a00b Gustavo A. R. Silva 2020-07-27  1908  		fallthrough;
9f056ed8ee01ad John Crispin        2019-11-25  1909  =

9f056ed8ee01ad John Crispin        2019-11-25  1910  	default:
9f056ed8ee01ad John Crispin        2019-11-25  1911  		v =3D le16_to_cpu(he=
_cap->he_mcs_nss_supp.rx_mcs_80);
9f056ed8ee01ad John Crispin        2019-11-25  1912  		arg->peer_he_rx_mcs_=
set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  1913  =

9f056ed8ee01ad John Crispin        2019-11-25  1914  		v =3D le16_to_cpu(he=
_cap->he_mcs_nss_supp.tx_mcs_80);
61fe43e7216df6 Miles Hu            2021-09-24  1915  		v =3D ath11k_peer_as=
soc_h_he_limit(v, he_mcs_mask);
9f056ed8ee01ad John Crispin        2019-11-25  1916  		arg->peer_he_tx_mcs_=
set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  1917  =

9f056ed8ee01ad John Crispin        2019-11-25  1918  		arg->peer_he_mcs_cou=
nt++;
61fe43e7216df6 Miles Hu            2021-09-24  1919  		if (!he_tx_mcs)
61fe43e7216df6 Miles Hu            2021-09-24  1920  			he_tx_mcs =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  1921  		break;
9f056ed8ee01ad John Crispin        2019-11-25  1922  	}
61fe43e7216df6 Miles Hu            2021-09-24  1923  =

61fe43e7216df6 Miles Hu            2021-09-24  1924  	/* Calculate peer NSS=
 capability from HE capabilities if STA
61fe43e7216df6 Miles Hu            2021-09-24  1925  	 * supports HE.
61fe43e7216df6 Miles Hu            2021-09-24  1926  	 */
61fe43e7216df6 Miles Hu            2021-09-24 @1927  	for (i =3D 0, max_nss=
 =3D 0, he_mcs =3D 0; i < NL80211_HE_NSS_MAX; i++) {
61fe43e7216df6 Miles Hu            2021-09-24  1928  		he_mcs =3D he_tx_mcs=
 >> (2 * i) & 3;
61fe43e7216df6 Miles Hu            2021-09-24  1929  =

61fe43e7216df6 Miles Hu            2021-09-24  1930  		/* In case of fixed =
rates, MCS Range in he_tx_mcs might have
61fe43e7216df6 Miles Hu            2021-09-24  1931  		 * unsupported range=
, with he_mcs_mask set, so check either of them
61fe43e7216df6 Miles Hu            2021-09-24  1932  		 * to find nss.
61fe43e7216df6 Miles Hu            2021-09-24  1933  		 */
61fe43e7216df6 Miles Hu            2021-09-24  1934  		if (he_mcs !=3D IEEE=
80211_HE_MCS_NOT_SUPPORTED ||
61fe43e7216df6 Miles Hu            2021-09-24  1935  		    he_mcs_mask[i])
61fe43e7216df6 Miles Hu            2021-09-24  1936  			max_nss =3D i + 1;
61fe43e7216df6 Miles Hu            2021-09-24  1937  	}
61fe43e7216df6 Miles Hu            2021-09-24  1938  	arg->peer_nss =3D min=
(sta->rx_nss, max_nss);
61fe43e7216df6 Miles Hu            2021-09-24  1939  =

61fe43e7216df6 Miles Hu            2021-09-24  1940  	ath11k_dbg(ar->ab, AT=
H11K_DBG_MAC,
61fe43e7216df6 Miles Hu            2021-09-24  1941  		   "mac he peer %pM =
nss %d mcs cnt %d\n",
61fe43e7216df6 Miles Hu            2021-09-24  1942  		   sta->addr, arg->p=
eer_nss, arg->peer_he_mcs_count);
d5c65159f28953 Kalle Valo          2019-11-23  1943  }
d5c65159f28953 Kalle Valo          2019-11-23  1944  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2310361027697566663==--


Content-Type: multipart/mixed; boundary="===============8639949285308388810=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1415:15: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 12 Apr 2022 18:00:01 +0800
Message-ID: <202204121722.hPLOkyZN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8639949285308388810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: 2663ce498459bae8e47140cc34147e16bf68af8c mt76: mt7915: rely on mt76=
_connac_mcu_sta_basic_tlv
date:   10 weeks ago
:::::: branch date: 34 hours ago
:::::: commit date: 10 weeks ago
config: riscv-randconfig-c006-20220410 (https://download.01.org/0day-ci/arc=
hive/20220412/202204121722.hPLOkyZN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 256c6b=
0ba14e8a7ab6373b61b7193ea8c0a3651c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2663ce498459bae8e47140cc34147e16bf68af8c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2663ce498459bae8e47140cc34147e16bf68af8c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   sound/core/memalloc.c:102:3: note: Taking false branch
                   if (err !=3D -ENOMEM)
                   ^
   sound/core/memalloc.c:104:7: note: Assuming the condition is false
                   if (size <=3D PAGE_SIZE)
                       ^~~~~~~~~~~~~~~~~
   sound/core/memalloc.c:104:3: note: Taking false branch
                   if (size <=3D PAGE_SIZE)
                   ^
   sound/core/memalloc.c:107:23: note: Calling 'get_order'
                   size =3D PAGE_SIZE << get_order(size);
                                       ^~~~~~~~~~~~~~~
   include/asm-generic/getorder.h:31:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/asm-generic/getorder.h:44:9: note: Calling 'fls'
           return fls(size);
                  ^~~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/asm-generic/getorder.h:44:9: note: Returning from 'fls'
           return fls(size);
                  ^~~~~~~~~
   include/asm-generic/getorder.h:44:2: note: Returning the value 32
           return fls(size);
           ^~~~~~~~~~~~~~~~
   sound/core/memalloc.c:107:23: note: Returning from 'get_order'
                   size =3D PAGE_SIZE << get_order(size);
                                       ^~~~~~~~~~~~~~~
   sound/core/memalloc.c:107:20: note: The result of the left shift is unde=
fined due to shifting by '32', which is greater or equal to the width of ty=
pe 'unsigned long'
                   size =3D PAGE_SIZE << get_order(size);
                                    ^  ~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c:178:3: warning: Value=
 stored to 'nss' is never read [clang-analyzer-deadcode.DeadStores]
                   nss =3D nss_band;
                   ^     ~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c:178:3: note: Value st=
ored to 'nss' is never read
                   nss =3D nss_band;
                   ^     ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1415:15: warning: Assign=
ed value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   bf->mem_20m =3D matrix[bf->nrow][bf->ncol];
                               ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1811:9: note: Assuming '=
sta' is non-null
           msta =3D sta ? (struct mt7915_sta *)sta->drv_priv : &mvif->sta;
                  ^~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1811:9: note: '?' condit=
ion is true
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1815:2: note: Taking fal=
se branch
           if (IS_ERR(skb))
           ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1820:6: note: Assuming '=
enable' is true
           if (!enable)
               ^~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1820:2: note: Taking fal=
se branch
           if (!enable)
           ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1824:6: note: 'sta' is n=
on-null
           if (sta && sta->ht_cap.ht_supported) {
               ^~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1824:6: note: Left side =
of '&&' is true
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1824:13: note: Assuming =
field 'ht_supported' is true
           if (sta && sta->ht_cap.ht_supported) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1824:2: note: Taking tru=
e branch
           if (sta && sta->ht_cap.ht_supported) {
           ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1826:3: note: Calling 'm=
t7915_mcu_sta_bfer_tlv'
                   mt7915_mcu_sta_bfer_tlv(dev, skb, vif, sta);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1370:3: note: Assuming f=
ield 'band_idx' is 0
                   mvif->mt76.band_idx ? mt7915_ext_phy(dev) : &dev->phy;
                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1370:3: note: '?' condit=
ion is false
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1371:15: note: '?' condi=
tion is false
           int tx_ant =3D hweight8(phy->mt76->chainmask) - 1;
                        ^
   include/asm-generic/bitops/const_hweight.h:26:23: note: expanded from ma=
cro 'hweight8'
   #define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : _=
_arch_hweight8(w))
                         ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1382:8: note: Calling 'm=
t7915_is_ebf_supported'
           ebf =3D mt7915_is_ebf_supported(phy, vif, sta, false);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1199:15: note: '?' condi=
tion is false
           int tx_ant =3D hweight8(phy->mt76->chainmask) - 1;
                        ^
   include/asm-generic/bitops/const_hweight.h:26:23: note: expanded from ma=
cro 'hweight8'
   #define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : _=
_arch_hweight8(w))
                         ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1201:6: note: Assuming f=
ield 'type' is equal to NL80211_IFTYPE_STATION
           if (vif->type !=3D NL80211_IFTYPE_STATION &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1201:42: note: Left side=
 of '&&' is false
           if (vif->type !=3D NL80211_IFTYPE_STATION &&
                                                   ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1205:7: note: 'bfee' is =
false
           if (!bfee && tx_ant < 2)
                ^~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1205:6: note: Left side =
of '&&' is true
           if (!bfee && tx_ant < 2)
               ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1205:15: note: Assuming =
'tx_ant' is >=3D 2
           if (!bfee && tx_ant < 2)
                        ^~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1205:2: note: Taking fal=
se branch
           if (!bfee && tx_ant < 2)
           ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1208:6: note: Assuming f=
ield 'has_he' is true, which participates in a condition later
           if (sta->he_cap.has_he) {
               ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1208:2: note: Taking tru=
e branch
           if (sta->he_cap.has_he) {
           ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1211:7: note: 'bfee' is =
false
                   if (bfee)
                       ^~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1211:3: note: Taking fal=
se branch
                   if (bfee)
                   ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1215:11: note: Assuming =
field 'he_su_ebfer' is true
                           return mvif->cap.he_su_ebfer &&
                                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1215:11: note: Left side=
 of '&&' is true
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1215:4: note: Returning =
without writing to 'sta->he_cap.has_he', which participates in a condition =
later
                           return mvif->cap.he_su_ebfer &&
                           ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1215:4: note: Returning =
value, which participates in a condition later
                           return mvif->cap.he_su_ebfer &&
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1382:8: note: Returning =
from 'mt7915_is_ebf_supported'
           ebf =3D mt7915_is_ebf_supported(phy, vif, sta, false);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1383:6: note: Assuming '=
ebf' is true
           if (!ebf && !dev->ibf)
               ^~~~
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1383:11: note: Left side=
 of '&&' is false
           if (!ebf && !dev->ibf)
                    ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1393:18: note: Field 'ha=
s_he' is true
           if (sta->he_cap.has_he && ebf)
                           ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1393:6: note: Left side =
of '&&' is true

vim +1415 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c

89029a85482cbc Ryder Lee        2020-05-12  1363  =

89029a85482cbc Ryder Lee        2020-05-12  1364  static void
f89f297aef2815 Ryder Lee        2021-10-18  1365  mt7915_mcu_sta_bfer_tlv(s=
truct mt7915_dev *dev, struct sk_buff *skb,
f89f297aef2815 Ryder Lee        2021-10-18  1366  			struct ieee80211_vif *=
vif, struct ieee80211_sta *sta)
89029a85482cbc Ryder Lee        2020-05-12  1367  {
f89f297aef2815 Ryder Lee        2021-10-18  1368  	struct mt7915_vif *mvif =
=3D (struct mt7915_vif *)vif->drv_priv;
f89f297aef2815 Ryder Lee        2021-10-18  1369  	struct mt7915_phy *phy =
=3D
6cf4392f248903 Lorenzo Bianconi 2021-12-14  1370  		mvif->mt76.band_idx ? m=
t7915_ext_phy(dev) : &dev->phy;
b9027e0816ebbc Lorenzo Bianconi 2021-01-05  1371  	int tx_ant =3D hweight8(=
phy->mt76->chainmask) - 1;
89029a85482cbc Ryder Lee        2020-05-12  1372  	struct sta_rec_bf *bf;
89029a85482cbc Ryder Lee        2020-05-12  1373  	struct tlv *tlv;
89029a85482cbc Ryder Lee        2020-05-12  1374  	const u8 matrix[4][4] =
=3D {
89029a85482cbc Ryder Lee        2020-05-12  1375  		{0, 0, 0, 0},
89029a85482cbc Ryder Lee        2020-05-12  1376  		{1, 1, 0, 0},	/* 2x1, 2=
x2, 2x3, 2x4 */
89029a85482cbc Ryder Lee        2020-05-12  1377  		{2, 4, 4, 0},	/* 3x1, 3=
x2, 3x3, 3x4 */
89029a85482cbc Ryder Lee        2020-05-12  1378  		{3, 5, 6, 0}	/* 4x1, 4x=
2, 4x3, 4x4 */
89029a85482cbc Ryder Lee        2020-05-12  1379  	};
f89f297aef2815 Ryder Lee        2021-10-18  1380  	bool ebf;
89029a85482cbc Ryder Lee        2020-05-12  1381  =

f89f297aef2815 Ryder Lee        2021-10-18  1382  	ebf =3D mt7915_is_ebf_su=
pported(phy, vif, sta, false);
f89f297aef2815 Ryder Lee        2021-10-18  1383  	if (!ebf && !dev->ibf)
f89f297aef2815 Ryder Lee        2021-10-18  1384  		return;
89029a85482cbc Ryder Lee        2020-05-12  1385  =

069c8e341ad537 Lorenzo Bianconi 2021-12-19  1386  	tlv =3D mt76_connac_mcu_=
add_tlv(skb, STA_REC_BF, sizeof(*bf));
89029a85482cbc Ryder Lee        2020-05-12  1387  	bf =3D (struct sta_rec_b=
f *)tlv;
89029a85482cbc Ryder Lee        2020-05-12  1388  =

6d6dc980e07d1f Ryder Lee        2021-01-14  1389  	/* he: eBF only, in acco=
rdance with spec
6d6dc980e07d1f Ryder Lee        2021-01-14  1390  	 * vht: support eBF and =
iBF
6d6dc980e07d1f Ryder Lee        2021-01-14  1391  	 * ht: iBF only, since m=
ac80211 lacks of eBF support
6d6dc980e07d1f Ryder Lee        2021-01-14  1392  	 */
f89f297aef2815 Ryder Lee        2021-10-18  1393  	if (sta->he_cap.has_he &=
& ebf)
6d6dc980e07d1f Ryder Lee        2021-01-14  1394  		mt7915_mcu_sta_bfer_he(=
sta, vif, phy, bf);
6d6dc980e07d1f Ryder Lee        2021-01-14  1395  	else if (sta->vht_cap.vh=
t_supported)
f89f297aef2815 Ryder Lee        2021-10-18  1396  		mt7915_mcu_sta_bfer_vht=
(sta, phy, bf, ebf);
6d6dc980e07d1f Ryder Lee        2021-01-14  1397  	else if (sta->ht_cap.ht_=
supported)
6d6dc980e07d1f Ryder Lee        2021-01-14  1398  		mt7915_mcu_sta_bfer_ht(=
sta, phy, bf);
6d6dc980e07d1f Ryder Lee        2021-01-14  1399  	else
6d6dc980e07d1f Ryder Lee        2021-01-14  1400  		return;
6d6dc980e07d1f Ryder Lee        2021-01-14  1401  =

a56c431ededa4e Ryder Lee        2021-10-18  1402  	bf->bf_cap =3D ebf ? ebf=
 : dev->ibf << 1;
89029a85482cbc Ryder Lee        2020-05-12  1403  	bf->bw =3D sta->bandwidt=
h;
89029a85482cbc Ryder Lee        2020-05-12  1404  	bf->ibf_dbw =3D sta->ban=
dwidth;
89029a85482cbc Ryder Lee        2020-05-12  1405  	bf->ibf_nrow =3D tx_ant;
89029a85482cbc Ryder Lee        2020-05-12  1406  =

a56c431ededa4e Ryder Lee        2021-10-18  1407  	if (!ebf && sta->bandwid=
th <=3D IEEE80211_STA_RX_BW_40 && !bf->ncol)
6d6dc980e07d1f Ryder Lee        2021-01-14  1408  		bf->ibf_timeout =3D 0x4=
8;
6d6dc980e07d1f Ryder Lee        2021-01-14  1409  	else
6d6dc980e07d1f Ryder Lee        2021-01-14  1410  		bf->ibf_timeout =3D 0x1=
8;
89029a85482cbc Ryder Lee        2020-05-12  1411  =

a56c431ededa4e Ryder Lee        2021-10-18  1412  	if (ebf && bf->nrow !=3D=
 tx_ant)
a56c431ededa4e Ryder Lee        2021-10-18  1413  		bf->mem_20m =3D matrix[=
tx_ant][bf->ncol];
89029a85482cbc Ryder Lee        2020-05-12  1414  	else
a56c431ededa4e Ryder Lee        2021-10-18 @1415  		bf->mem_20m =3D matrix[=
bf->nrow][bf->ncol];
89029a85482cbc Ryder Lee        2020-05-12  1416  =

89029a85482cbc Ryder Lee        2020-05-12  1417  	switch (sta->bandwidth) {
89029a85482cbc Ryder Lee        2020-05-12  1418  	case IEEE80211_STA_RX_BW=
_160:
89029a85482cbc Ryder Lee        2020-05-12  1419  	case IEEE80211_STA_RX_BW=
_80:
89029a85482cbc Ryder Lee        2020-05-12  1420  		bf->mem_total =3D bf->m=
em_20m * 2;
89029a85482cbc Ryder Lee        2020-05-12  1421  		break;
89029a85482cbc Ryder Lee        2020-05-12  1422  	case IEEE80211_STA_RX_BW=
_40:
89029a85482cbc Ryder Lee        2020-05-12  1423  		bf->mem_total =3D bf->m=
em_20m;
89029a85482cbc Ryder Lee        2020-05-12  1424  		break;
89029a85482cbc Ryder Lee        2020-05-12  1425  	case IEEE80211_STA_RX_BW=
_20:
89029a85482cbc Ryder Lee        2020-05-12  1426  	default:
89029a85482cbc Ryder Lee        2020-05-12  1427  		break;
89029a85482cbc Ryder Lee        2020-05-12  1428  	}
89029a85482cbc Ryder Lee        2020-05-12  1429  }
89029a85482cbc Ryder Lee        2020-05-12  1430  =


:::::: The code at line 1415 was first introduced by commit
:::::: a56c431ededa4e0f02cf4740cc5cd76063d3df1e mt76: mt7915: improve stare=
c readability of txbf

:::::: TO: Ryder Lee <ryder.lee@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8639949285308388810==--


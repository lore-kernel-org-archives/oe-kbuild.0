Content-Type: multipart/mixed; boundary="===============7806996336550407782=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [nbd168-wireless:mt76 110/138] drivers/net/wireless/mediatek/mt76/mt7915/main.c:694:1: sparse: sparse: context imbalance in 'mt7915_sta_rc_update' - wrong count at exit
Date: Sat, 16 May 2020 13:51:38 +0800
Message-ID: <202005161335.oHtpy5Ps%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7806996336550407782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ryder Lee <ryder.lee@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Shayne Chen <shayne.chen@mediatek.com>
CC: "Chih-Min Chen" <chih-min.chen@mediatek.com>

tree:   https://github.com/nbd168/wireless mt76
head:   12a87174accd29ff943d4c5fb735e1541b92630b
commit: e57b7901469fc0b021930b83a8094baaf3d81b09 [110/138] mt76: add mac802=
11 driver for MT7915 PCIe-based chipsets
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout e57b7901469fc0b021930b83a8094baaf3d81b09
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:694:1: sparse: sparse: =
context imbalance in 'mt7915_sta_rc_update' - wrong count at exit
--
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:244:16: sparse: sparse: =
mixing different enum types:
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:244:16: sparse:    unsig=
ned int enum mt7915_txq_id
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:244:16: sparse:    unsig=
ned int enum mt76_txq_id
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@    expected unsigne=
d int w @@    got restricted __le3unsigned int w @@
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse:    expe=
cted unsigned int w
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse:    got =
restricted __le32 [usertype] supp_ht_mcs
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1288:23: sparse: sparse:=
 restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1328:33: sparse: sparse:=
 restricted __le16 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1327:60: sparse: sparse:=
 bad assignment (>>=3D) to restricted __le16
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1671:16: sparse: sparse:=
 restricted __le32 degrades to integer
--
>> drivers/net/wireless/mediatek/mt76/mt7915/mac.c:299:26: sparse: sparse: =
restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mac.c:303:43: sparse: sparse: =
cast to restricted __le32
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:303:43: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:303:43: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:304:43: sparse: sparse: =
cast to restricted __le32
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:304:43: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:304:43: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:305:43: sparse: sparse: =
cast to restricted __le32
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:305:43: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:305:43: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:306:43: sparse: sparse: =
cast to restricted __le32
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:306:43: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:306:43: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:319:35: sparse: sparse: =
cast to restricted __le32
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:319:35: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:319:35: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:320:33: sparse: sparse: =
cast to restricted __le32
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:320:33: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:320:33: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:327:35: sparse: sparse: =
cast to restricted __le32
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:327:35: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:327:35: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:328:35: sparse: sparse: =
cast to restricted __le32
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:328:35: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:328:35: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:345:41: sparse: sparse: =
cast to restricted __le32
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:345:41: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:345:41: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:355:33: sparse: sparse: =
cast to restricted __le32
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:355:33: sparse: sparse: =
restricted __le32 degrades to integer
   drivers/net/wireless/mediatek/mt76/mt7915/mac.c:355:33: sparse: sparse: =
restricted __le32 degrades to integer
>> drivers/net/wireless/mediatek/mt76/mt7915/mac.c:451:21: sparse: sparse: =
invalid assignment: |=3D
>> drivers/net/wireless/mediatek/mt76/mt7915/mac.c:451:21: sparse:    left =
side has type unsigned int
>> drivers/net/wireless/mediatek/mt76/mt7915/mac.c:451:21: sparse:    right=
 side has type restricted __le32

# https://github.com/nbd168/wireless/commit/e57b7901469fc0b021930b83a8094ba=
af3d81b09
git remote add nbd168-wireless https://github.com/nbd168/wireless
git remote update nbd168-wireless
git checkout e57b7901469fc0b021930b83a8094baaf3d81b09
vim +/mt7915_sta_rc_update +694 drivers/net/wireless/mediatek/mt76/mt7915/m=
ain.c

e57b7901469fc0 Ryder Lee 2020-04-25  692  =

e57b7901469fc0 Ryder Lee 2020-04-25  693  static void
e57b7901469fc0 Ryder Lee 2020-04-25 @694  mt7915_sta_rc_update(struct ieee8=
0211_hw *hw,
e57b7901469fc0 Ryder Lee 2020-04-25  695  		     struct ieee80211_vif *vif,
e57b7901469fc0 Ryder Lee 2020-04-25  696  		     struct ieee80211_sta *sta,
e57b7901469fc0 Ryder Lee 2020-04-25  697  		     u32 changed)
e57b7901469fc0 Ryder Lee 2020-04-25  698  {
e57b7901469fc0 Ryder Lee 2020-04-25  699  	struct mt7915_sta *msta =3D (str=
uct mt7915_sta *)sta->drv_priv;
e57b7901469fc0 Ryder Lee 2020-04-25  700  =

e57b7901469fc0 Ryder Lee 2020-04-25  701  	rcu_read_lock();
e57b7901469fc0 Ryder Lee 2020-04-25  702  	sta =3D ieee80211_find_sta(vif, =
sta->addr);
e57b7901469fc0 Ryder Lee 2020-04-25  703  	if (!sta) {
e57b7901469fc0 Ryder Lee 2020-04-25  704  		rcu_read_unlock();
e57b7901469fc0 Ryder Lee 2020-04-25  705  		return;
e57b7901469fc0 Ryder Lee 2020-04-25  706  	}
e57b7901469fc0 Ryder Lee 2020-04-25  707  	rcu_read_lock();
e57b7901469fc0 Ryder Lee 2020-04-25  708  =

e57b7901469fc0 Ryder Lee 2020-04-25  709  	set_bit(changed, &msta->stats.ch=
anged);
e57b7901469fc0 Ryder Lee 2020-04-25  710  	ieee80211_queue_work(hw, &msta->=
stats_work);
e57b7901469fc0 Ryder Lee 2020-04-25  711  }
e57b7901469fc0 Ryder Lee 2020-04-25  712  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7806996336550407782==--


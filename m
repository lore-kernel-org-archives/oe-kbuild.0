Content-Type: multipart/mixed; boundary="===============1847421916511177170=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7603/mac.c:448:41: warning: Array 'dev->mphy.q_tx[3]' accessed at index 3, which is out of bounds. [arrayIndexOutOfBounds]
Date: Mon, 21 Jun 2021 07:08:44 +0800
Message-ID: <202106210732.xLqx0ZF6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1847421916511177170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cba5e97280f53ec7feb656fcdf0ec00a5c6dd539
commit: 91990519298e231bf102f7242d5f483bef5e514a mt76: move tx hw data queu=
es in mt76_phy
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wireless/mediatek/mt76/mt7603/mac.c:448:41: warning: Array '=
dev->mphy.q_tx[3]' accessed at index 3, which is out of bounds. [arrayIndex=
OutOfBounds]
      struct mt76_queue *q =3D dev->mphy.q_tx[i];
                                           ^
   drivers/net/wireless/mediatek/mt76/mt7603/mac.c:1518:21: warning: Array =
'dev->mphy.q_tx[3]' accessed at index 3, which is out of bounds. [arrayInde=
xOutOfBounds]
     q =3D dev->mphy.q_tx[i];
                       ^

vim +448 drivers/net/wireless/mediatek/mt76/mt7603/mac.c

c8846e1015022d Felix Fietkau    2018-11-06  391  =

ea565833fd7848 Felix Fietkau    2019-09-04  392  void mt7603_mac_sta_poll(s=
truct mt7603_dev *dev)
ea565833fd7848 Felix Fietkau    2019-09-04  393  {
ea565833fd7848 Felix Fietkau    2019-09-04  394  	static const u8 ac_to_tid=
[4] =3D {
ea565833fd7848 Felix Fietkau    2019-09-04  395  		[IEEE80211_AC_BE] =3D 0,
ea565833fd7848 Felix Fietkau    2019-09-04  396  		[IEEE80211_AC_BK] =3D 1,
ea565833fd7848 Felix Fietkau    2019-09-04  397  		[IEEE80211_AC_VI] =3D 4,
ea565833fd7848 Felix Fietkau    2019-09-04  398  		[IEEE80211_AC_VO] =3D 6
ea565833fd7848 Felix Fietkau    2019-09-04  399  	};
ea565833fd7848 Felix Fietkau    2019-09-04  400  	struct ieee80211_sta *sta;
ea565833fd7848 Felix Fietkau    2019-09-04  401  	struct mt7603_sta *msta;
ea565833fd7848 Felix Fietkau    2019-09-04  402  	u32 total_airtime =3D 0;
ea565833fd7848 Felix Fietkau    2019-09-04  403  	u32 airtime[4];
ea565833fd7848 Felix Fietkau    2019-09-04  404  	u32 addr;
ea565833fd7848 Felix Fietkau    2019-09-04  405  	int i;
ea565833fd7848 Felix Fietkau    2019-09-04  406  =

ea565833fd7848 Felix Fietkau    2019-09-04  407  	rcu_read_lock();
ea565833fd7848 Felix Fietkau    2019-09-04  408  =

ea565833fd7848 Felix Fietkau    2019-09-04  409  	while (1) {
ea565833fd7848 Felix Fietkau    2019-09-04  410  		bool clear =3D false;
ea565833fd7848 Felix Fietkau    2019-09-04  411  =

ea565833fd7848 Felix Fietkau    2019-09-04  412  		spin_lock_bh(&dev->sta_p=
oll_lock);
ea565833fd7848 Felix Fietkau    2019-09-04  413  		if (list_empty(&dev->sta=
_poll_list)) {
ea565833fd7848 Felix Fietkau    2019-09-04  414  			spin_unlock_bh(&dev->st=
a_poll_lock);
ea565833fd7848 Felix Fietkau    2019-09-04  415  			break;
ea565833fd7848 Felix Fietkau    2019-09-04  416  		}
ea565833fd7848 Felix Fietkau    2019-09-04  417  =

ea565833fd7848 Felix Fietkau    2019-09-04  418  		msta =3D list_first_entr=
y(&dev->sta_poll_list, struct mt7603_sta,
ea565833fd7848 Felix Fietkau    2019-09-04  419  					poll_list);
ea565833fd7848 Felix Fietkau    2019-09-04  420  		list_del_init(&msta->pol=
l_list);
ea565833fd7848 Felix Fietkau    2019-09-04  421  		spin_unlock_bh(&dev->sta=
_poll_lock);
ea565833fd7848 Felix Fietkau    2019-09-04  422  =

ea565833fd7848 Felix Fietkau    2019-09-04  423  		addr =3D mt7603_wtbl4_ad=
dr(msta->wcid.idx);
ea565833fd7848 Felix Fietkau    2019-09-04  424  		for (i =3D 0; i < 4; i++=
) {
ea565833fd7848 Felix Fietkau    2019-09-04  425  			u32 airtime_last =3D ms=
ta->tx_airtime_ac[i];
ea565833fd7848 Felix Fietkau    2019-09-04  426  =

ea565833fd7848 Felix Fietkau    2019-09-04  427  			msta->tx_airtime_ac[i] =
=3D mt76_rr(dev, addr + i * 8);
ea565833fd7848 Felix Fietkau    2019-09-04  428  			airtime[i] =3D msta->tx=
_airtime_ac[i] - airtime_last;
ea565833fd7848 Felix Fietkau    2019-09-04  429  			airtime[i] *=3D 32;
ea565833fd7848 Felix Fietkau    2019-09-04  430  			total_airtime +=3D airt=
ime[i];
ea565833fd7848 Felix Fietkau    2019-09-04  431  =

ea565833fd7848 Felix Fietkau    2019-09-04  432  			if (msta->tx_airtime_ac=
[i] & BIT(22))
ea565833fd7848 Felix Fietkau    2019-09-04  433  				clear =3D true;
ea565833fd7848 Felix Fietkau    2019-09-04  434  		}
ea565833fd7848 Felix Fietkau    2019-09-04  435  =

ea565833fd7848 Felix Fietkau    2019-09-04  436  		if (clear) {
ea565833fd7848 Felix Fietkau    2019-09-04  437  			mt7603_wtbl_update(dev,=
 msta->wcid.idx,
ea565833fd7848 Felix Fietkau    2019-09-04  438  					   MT_WTBL_UPDATE_ADM=
_COUNT_CLEAR);
ea565833fd7848 Felix Fietkau    2019-09-04  439  			memset(msta->tx_airtime=
_ac, 0,
ea565833fd7848 Felix Fietkau    2019-09-04  440  			       sizeof(msta->tx_=
airtime_ac));
ea565833fd7848 Felix Fietkau    2019-09-04  441  		}
ea565833fd7848 Felix Fietkau    2019-09-04  442  =

ea565833fd7848 Felix Fietkau    2019-09-04  443  		if (!msta->wcid.sta)
ea565833fd7848 Felix Fietkau    2019-09-04  444  			continue;
ea565833fd7848 Felix Fietkau    2019-09-04  445  =

ea565833fd7848 Felix Fietkau    2019-09-04  446  		sta =3D container_of((vo=
id *)msta, struct ieee80211_sta, drv_priv);
ea565833fd7848 Felix Fietkau    2019-09-04  447  		for (i =3D 0; i < 4; i++=
) {
91990519298e23 Lorenzo Bianconi 2020-11-11 @448  			struct mt76_queue *q =
=3D dev->mphy.q_tx[i];
ea565833fd7848 Felix Fietkau    2019-09-04  449  			u8 qidx =3D q->hw_idx;
ea565833fd7848 Felix Fietkau    2019-09-04  450  			u8 tid =3D ac_to_tid[i];
ea565833fd7848 Felix Fietkau    2019-09-04  451  			u32 txtime =3D airtime[=
qidx];
ea565833fd7848 Felix Fietkau    2019-09-04  452  =

ea565833fd7848 Felix Fietkau    2019-09-04  453  			if (!txtime)
ea565833fd7848 Felix Fietkau    2019-09-04  454  				continue;
ea565833fd7848 Felix Fietkau    2019-09-04  455  =

ea565833fd7848 Felix Fietkau    2019-09-04  456  			ieee80211_sta_register_=
airtime(sta, tid, txtime, 0);
ea565833fd7848 Felix Fietkau    2019-09-04  457  		}
ea565833fd7848 Felix Fietkau    2019-09-04  458  	}
ea565833fd7848 Felix Fietkau    2019-09-04  459  =

ea565833fd7848 Felix Fietkau    2019-09-04  460  	rcu_read_unlock();
ea565833fd7848 Felix Fietkau    2019-09-04  461  =

ea565833fd7848 Felix Fietkau    2019-09-04  462  	if (!total_airtime)
ea565833fd7848 Felix Fietkau    2019-09-04  463  		return;
ea565833fd7848 Felix Fietkau    2019-09-04  464  =

ea565833fd7848 Felix Fietkau    2019-09-04  465  	spin_lock_bh(&dev->mt76.c=
c_lock);
96747a51fe62eb Felix Fietkau    2019-10-12  466  	dev->mphy.chan_state->cc_=
tx +=3D total_airtime;
ea565833fd7848 Felix Fietkau    2019-09-04  467  	spin_unlock_bh(&dev->mt76=
.cc_lock);
ea565833fd7848 Felix Fietkau    2019-09-04  468  }
ea565833fd7848 Felix Fietkau    2019-09-04  469  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1847421916511177170==--


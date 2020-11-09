Content-Type: multipart/mixed; boundary="===============8406039941935585538=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/broadcom/b43/phy_n.c:5734 b43_nphy_rev2_cal_rx_iq() error: uninitialized symbol 'cur_hpf1'.
Date: Mon, 09 Nov 2020 21:40:51 +0800
Message-ID: <202011092138.sc3GjAMz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8406039941935585538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f8394f232b1eab649ce2df5c5f15b0e528c92091
commit: 3f649ab728cda8038259d8f14492fe400fbab911 treewide: Remove uninitial=
ized_var() usage
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-m031-20201109 (attached as .config)
compiler: mips64el-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/broadcom/b43/phy_n.c:5734 b43_nphy_rev2_cal_rx_iq() er=
ror: uninitialized symbol 'cur_hpf1'.
drivers/net/wireless/broadcom/b43/phy_n.c:5744 b43_nphy_rev2_cal_rx_iq() er=
ror: uninitialized symbol 'cur_hpf2'.
drivers/net/wireless/broadcom/b43/xmit.c:457 b43_generate_txhdr() error: un=
initialized symbol 'cts'.
drivers/net/wireless/broadcom/b43/xmit.c:479 b43_generate_txhdr() error: un=
initialized symbol 'rts'.
drivers/net/wireless/broadcom/b43/xmit.c:497 b43_generate_txhdr() error: un=
initialized symbol 'plcp'.
drivers/net/wireless/broadcom/b43/xmit.c:517 b43_generate_txhdr() error: po=
tentially dereferencing uninitialized 'hdr'.
drivers/net/wireless/broadcom/b43/xmit.c:664 b43_rx() error: uninitialized =
symbol 'macstat'.
drivers/net/wireless/broadcom/b43/xmit.c:719 b43_rx() error: uninitialized =
symbol 'chanstat'.
drivers/net/wireless/broadcom/b43/xmit.c:771 b43_rx() error: uninitialized =
symbol 'mactime'.
drivers/net/wireless/broadcom/b43/dma.c:67 b43_dma_address() error: uniniti=
alized symbol 'addr'.

Old smatch warnings:
drivers/net/wireless/broadcom/b43/phy_n.c:585 b43_nphy_adjust_lna_gain_tabl=
e() warn: assigning (-2) to unsigned variable '*(lna_gain[0])'
drivers/net/wireless/broadcom/b43/phy_n.c:5739 b43_nphy_rev2_cal_rx_iq() er=
ror: uninitialized symbol 'cur_hpf1'.

vim +/cur_hpf1 +5734 drivers/net/wireless/broadcom/b43/phy_n.c

984ff4ffb7fa36 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-02-04  5636  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5637  /* http://bcm-v4.sipsolutions.net/802.11/PHY/N/Ca=
lRxIqRev2 */
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5638  static int b43_nphy_rev2_cal_rx_iq(struct b43_wld=
ev *dev,
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5639  			struct nphy_txgains target, u8 type, bool debu=
g)
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5640  {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5641  	struct b43_phy_n *nphy =3D dev->phy.n;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5642  	int i, j, index;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5643  	u8 rfctl[2];
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5644  	u8 afectl_core;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5645  	u16 tmp[6];
3f649ab728cda8 drivers/net/wireless/broadcom/b43/phy_n.c Kees Cook     2020=
-06-03  5646  	u16 cur_hpf1, cur_hpf2, cur_lna;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5647  	u32 real, imag;
57fbcce37be7c1 drivers/net/wireless/broadcom/b43/phy_n.c Johannes Berg 2016=
-04-12  5648  	enum nl80211_band band;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5649  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5650  	u8 use;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5651  	u16 cur_hpf;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5652  	u16 lna[3] =3D { 3, 3, 1 };
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5653  	u16 hpf1[3] =3D { 7, 2, 0 };
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5654  	u16 hpf2[3] =3D { 2, 0, 0 };
de9a47f92795f6 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-18  5655  	u32 power[3] =3D { };
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5656  	u16 gain_save[2];
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5657  	u16 cal_gain[2];
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5658  	struct nphy_iqcal_params cal_params[2];
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5659  	struct nphy_iq_est est;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5660  	int ret =3D 0;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5661  	bool playtone =3D true;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5662  	int desired =3D 13;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5663  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5664  	b43_nphy_stay_in_carrier_search(dev, 1);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5665  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5666  	if (dev->phy.rev < 2)
984ff4ffb7fa36 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-02-04  5667  		b43_nphy_reapply_tx_cal_coeffs(dev);
9145834e84805f drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-18  5668  	b43_ntab_read_bulk(dev, B43_NTAB16(7, 0x110), 2,=
 gain_save);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5669  	for (i =3D 0; i < 2; i++) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5670  		b43_nphy_iq_cal_gain_params(dev, i, target, &ca=
l_params[i]);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5671  		cal_gain[i] =3D cal_params[i].cal_gain;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5672  	}
2581b1434ccba6 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-18  5673  	b43_ntab_write_bulk(dev, B43_NTAB16(7, 0x110), 2=
, cal_gain);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5674  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5675  	for (i =3D 0; i < 2; i++) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5676  		if (i =3D=3D 0) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5677  			rfctl[0] =3D B43_NPHY_RFCTL_INTC1;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5678  			rfctl[1] =3D B43_NPHY_RFCTL_INTC2;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5679  			afectl_core =3D B43_NPHY_AFECTL_C1;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5680  		} else {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5681  			rfctl[0] =3D B43_NPHY_RFCTL_INTC2;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5682  			rfctl[1] =3D B43_NPHY_RFCTL_INTC1;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5683  			afectl_core =3D B43_NPHY_AFECTL_C2;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5684  		}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5685  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5686  		tmp[1] =3D b43_phy_read(dev, B43_NPHY_RFSEQCA);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5687  		tmp[2] =3D b43_phy_read(dev, afectl_core);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5688  		tmp[3] =3D b43_phy_read(dev, B43_NPHY_AFECTL_OV=
ER);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5689  		tmp[4] =3D b43_phy_read(dev, rfctl[0]);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5690  		tmp[5] =3D b43_phy_read(dev, rfctl[1]);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5691  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5692  		b43_phy_maskset(dev, B43_NPHY_RFSEQCA,
acd82aa868c213 drivers/net/wireless/b43/phy_n.c          Larry Finger  2010=
-07-21  5693  				~B43_NPHY_RFSEQCA_RXDIS & 0xFFFF,
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5694  				((1 - i) << B43_NPHY_RFSEQCA_RXDIS_SHIFT));
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5695  		b43_phy_maskset(dev, B43_NPHY_RFSEQCA, ~B43_NPH=
Y_RFSEQCA_TXEN,
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5696  				(1 - i));
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5697  		b43_phy_set(dev, afectl_core, 0x0006);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5698  		b43_phy_set(dev, B43_NPHY_AFECTL_OVER, 0x0006);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5699  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5700  		band =3D b43_current_band(dev->wl);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5701  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5702  		if (nphy->rxcalparams & 0xFF000000) {
57fbcce37be7c1 drivers/net/wireless/broadcom/b43/phy_n.c Johannes Berg 2016=
-04-12  5703  			if (band =3D=3D NL80211_BAND_5GHZ)
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5704  				b43_phy_write(dev, rfctl[0], 0x140);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5705  			else
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5706  				b43_phy_write(dev, rfctl[0], 0x110);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5707  		} else {
57fbcce37be7c1 drivers/net/wireless/broadcom/b43/phy_n.c Johannes Berg 2016=
-04-12  5708  			if (band =3D=3D NL80211_BAND_5GHZ)
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5709  				b43_phy_write(dev, rfctl[0], 0x180);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5710  			else
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5711  				b43_phy_write(dev, rfctl[0], 0x120);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5712  		}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5713  =

57fbcce37be7c1 drivers/net/wireless/broadcom/b43/phy_n.c Johannes Berg 2016=
-04-12  5714  		if (band =3D=3D NL80211_BAND_5GHZ)
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5715  			b43_phy_write(dev, rfctl[1], 0x148);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5716  		else
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5717  			b43_phy_write(dev, rfctl[1], 0x114);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5718  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5719  		if (nphy->rxcalparams & 0x10000) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5720  			b43_radio_maskset(dev, B2055_C1_GENSPARE2, 0xF=
C,
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5721  					(i + 1));
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5722  			b43_radio_maskset(dev, B2055_C2_GENSPARE2, 0xF=
C,
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5723  					(2 - i));
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5724  		}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5725  =

30115c2252fcf9 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-10-22  5726  		for (j =3D 0; j < 4; j++) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5727  			if (j < 3) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5728  				cur_lna =3D lna[j];
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5729  				cur_hpf1 =3D hpf1[j];
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5730  				cur_hpf2 =3D hpf2[j];
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5731  			} else {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5732  				if (power[1] > 10000) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5733  					use =3D 1;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15 @5734  					cur_hpf =3D cur_hpf1;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5735  					index =3D 2;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5736  				} else {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5737  					if (power[0] > 10000) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5738  						use =3D 1;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5739  						cur_hpf =3D cur_hpf1;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5740  						index =3D 1;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5741  					} else {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5742  						index =3D 0;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5743  						use =3D 2;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15 @5744  						cur_hpf =3D cur_hpf2;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5745  					}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5746  				}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5747  				cur_lna =3D lna[index];
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5748  				cur_hpf1 =3D hpf1[index];
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5749  				cur_hpf2 =3D hpf2[index];
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5750  				cur_hpf +=3D desired - hweight32(power[index]=
);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5751  				cur_hpf =3D clamp_val(cur_hpf, 0, 10);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5752  				if (use =3D=3D 1)
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5753  					cur_hpf1 =3D cur_hpf;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5754  				else
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5755  					cur_hpf2 =3D cur_hpf;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5756  			}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5757  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5758  			tmp[0] =3D ((cur_hpf2 << 8) | (cur_hpf1 << 4) |
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5759  					(cur_lna << 2));
78ae753280f8bd drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2013-03-30  5760  			b43_nphy_rf_ctl_override(dev, 0x400, tmp[0], 3,
75377b2476d85d drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-22  5761  									false);
de9a47f92795f6 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-18  5762  			b43_nphy_force_rf_sequence(dev, B43_RFSEQ_RESE=
T2RX);
53ae8e8c92b271 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-17  5763  			b43_nphy_stop_playback(dev);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5764  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5765  			if (playtone) {
59af099b195608 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-22  5766  				ret =3D b43_nphy_tx_tone(dev, 4000,
59af099b195608 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-22  5767  						(nphy->rxcalparams & 0xFFFF),
ed03033e3033c9 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2014-06-22  5768  						false, false, true);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5769  				playtone =3D false;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5770  			} else {
ed03033e3033c9 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2014-06-22  5771  				b43_nphy_run_samples(dev, 160, 0xFFFF, 0, fal=
se,
ed03033e3033c9 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2014-06-22  5772  						     false, true);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5773  			}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5774  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5775  			if (ret =3D=3D 0) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5776  				if (j < 3) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5777  					b43_nphy_rx_iq_est(dev, &est, 1024, 32,
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5778  									false);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5779  					if (i =3D=3D 0) {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5780  						real =3D est.i0_pwr;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5781  						imag =3D est.q0_pwr;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5782  					} else {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5783  						real =3D est.i1_pwr;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5784  						imag =3D est.q1_pwr;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5785  					}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5786  					power[i] =3D ((real + imag) / 1024) + 1;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5787  				} else {
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5788  					b43_nphy_calc_rx_iq_comp(dev, 1 << i);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5789  				}
53ae8e8c92b271 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-17  5790  				b43_nphy_stop_playback(dev);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5791  			}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5792  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5793  			if (ret !=3D 0)
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5794  				break;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5795  		}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5796  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5797  		b43_radio_mask(dev, B2055_C1_GENSPARE2, 0xFC);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5798  		b43_radio_mask(dev, B2055_C2_GENSPARE2, 0xFC);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5799  		b43_phy_write(dev, rfctl[1], tmp[5]);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5800  		b43_phy_write(dev, rfctl[0], tmp[4]);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5801  		b43_phy_write(dev, B43_NPHY_AFECTL_OVER, tmp[3]=
);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5802  		b43_phy_write(dev, afectl_core, tmp[2]);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5803  		b43_phy_write(dev, B43_NPHY_RFSEQCA, tmp[1]);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5804  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5805  		if (ret !=3D 0)
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5806  			break;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5807  	}
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5808  =

78ae753280f8bd drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2013-03-30  5809  	b43_nphy_rf_ctl_override(dev, 0x400, 0, 3, true);
67c0d6e2d1abb9 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-17  5810  	b43_nphy_force_rf_sequence(dev, B43_RFSEQ_RESET2=
RX);
2581b1434ccba6 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-18  5811  	b43_ntab_write_bulk(dev, B43_NTAB16(7, 0x110), 2=
, gain_save);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5812  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5813  	b43_nphy_stay_in_carrier_search(dev, 0);
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5814  =

15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5815  	return ret;
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5816  }
15931e318b27e8 drivers/net/wireless/b43/phy_n.c          Rafa=C5=82 Mi=C5=
=82ecki 2010-01-15  5817  =


:::::: The code@line 5734 was first introduced by commit
:::::: 15931e318b27e85ea06f44d53abc3d3e6a3fc9ff b43: N-PHY: add RX IQ calib=
rationi for rev < 3

:::::: TO: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8406039941935585538==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AsCi/vBZ6REkXWhv9H9W/A3f+Q4CAA==
--===============8406039941935585538==--


Content-Type: multipart/mixed; boundary="===============5809668795489629609=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.6-main 41/41] drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:2959:44: sparse: expected unsigned short [assigned] [usertype] freq
Date: Mon, 13 Apr 2020 03:10:20 +0800
Message-ID: <202004130308.tSRHFzDI%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5809668795489629609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.6-main
head:   1944ca382365022a8bf3895ee49b47f24e810b5d
commit: 1944ca382365022a8bf3895ee49b47f24e810b5d [41/41] mt76_new: updated =
again to master-version
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-188-g79f7ac98-dirty
        git checkout 1944ca382365022a8bf3895ee49b47f24e810b5d
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:2953:28: sparse: spa=
rse: restricted __le16 degrades to integer
   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:2954:33: sparse: spa=
rse: bad assignment (-=3D) to restricted __le16
   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:2959:44: sparse: spa=
rse: incorrect type in argument 1 (different base types) @@    expected uns=
igned short [assigned] [usertype] freq @@    got resunsigned short [assigne=
d] [usertype] freq @@
>> drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:2959:44: sparse:    =
expected unsigned short [assigned] [usertype] freq
>> drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:2959:44: sparse:    =
got restricted __le16 [assigned] [usertype] center_freq
   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:2975:33: sparse: spa=
rse: incorrect type in assignment (different base types) @@    expected res=
tricted __le16 [addressable] [assigned] [usertype] center_freq @@    got ed=
] [usertype] center_freq @@
>> drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:2975:33: sparse:    =
expected restricted __le16 [addressable] [assigned] [usertype] center_freq
>> drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:2975:33: sparse:    =
got int [assigned] freq2
   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:3073:28: sparse: spa=
rse: restricted __le16 degrades to integer
   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:3074:33: sparse: spa=
rse: bad assignment (-=3D) to restricted __le16
   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:3079:43: sparse: spa=
rse: incorrect type in argument 1 (different base types) @@    expected uns=
igned short [usertype] freq @@    got restricted __lunsigned short [usertyp=
e] freq @@
>> drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:3079:43: sparse:    =
expected unsigned short [usertype] freq
   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:3079:43: sparse:    =
got restricted __le16 [assigned] [usertype] center_freq
   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:3095:33: sparse: spa=
rse: incorrect type in assignment (different base types) @@    expected res=
tricted __le16 [addressable] [assigned] [usertype] center_freq @@    got ed=
] [usertype] center_freq @@
   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:3095:33: sparse:    =
expected restricted __le16 [addressable] [assigned] [usertype] center_freq
   drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c:3095:33: sparse:    =
got int [assigned] freq2

# https://github.com/frank-w/BPI-R2-4.14/commit/1944ca382365022a8bf3895ee49=
b47f24e810b5d
git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R2-4.14
git remote update frank-w-bpi-r2-4.14
git checkout 1944ca382365022a8bf3895ee49b47f24e810b5d
vim +2959 drivers/net/wireless/mediatek/mt76_new/mt7615/mcu.c

1944ca38236502 Frank Wunderlich 2020-04-12  2910  =

1944ca38236502 Frank Wunderlich 2020-04-12  2911  int mt7615_mcu_apply_rx_d=
coc(struct mt7615_phy *phy)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  2912  {
1944ca38236502 Frank Wunderlich 2020-04-12  2913  	struct mt7615_dev *dev =
=3D phy->dev;
1944ca38236502 Frank Wunderlich 2020-04-12  2914  	struct cfg80211_chan_def=
 *chandef =3D &phy->mt76->chandef;
1944ca38236502 Frank Wunderlich 2020-04-12  2915  	int freq2 =3D chandef->c=
enter_freq2;
1944ca38236502 Frank Wunderlich 2020-04-12  2916  	int ret;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  2917  	struct {
1944ca38236502 Frank Wunderlich 2020-04-12  2918  		u8 direction;
1944ca38236502 Frank Wunderlich 2020-04-12  2919  		u8 runtime_calibration;
1944ca38236502 Frank Wunderlich 2020-04-12  2920  		u8 _rsv[2];
1944ca38236502 Frank Wunderlich 2020-04-12  2921  =

1944ca38236502 Frank Wunderlich 2020-04-12  2922  		__le16 center_freq;
1944ca38236502 Frank Wunderlich 2020-04-12  2923  		u8 bw;
1944ca38236502 Frank Wunderlich 2020-04-12  2924  		u8 band;
1944ca38236502 Frank Wunderlich 2020-04-12  2925  		u8 is_freq2;
1944ca38236502 Frank Wunderlich 2020-04-12  2926  		u8 success;
1944ca38236502 Frank Wunderlich 2020-04-12  2927  		u8 dbdc_en;
1944ca38236502 Frank Wunderlich 2020-04-12  2928  =

1944ca38236502 Frank Wunderlich 2020-04-12  2929  		u8 _rsv2;
1944ca38236502 Frank Wunderlich 2020-04-12  2930  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  2931  		struct {
1944ca38236502 Frank Wunderlich 2020-04-12  2932  			__le32 sx0_i_lna[4];
1944ca38236502 Frank Wunderlich 2020-04-12  2933  			__le32 sx0_q_lna[4];
1944ca38236502 Frank Wunderlich 2020-04-12  2934  =

1944ca38236502 Frank Wunderlich 2020-04-12  2935  			__le32 sx2_i_lna[4];
1944ca38236502 Frank Wunderlich 2020-04-12  2936  			__le32 sx2_q_lna[4];
1944ca38236502 Frank Wunderlich 2020-04-12  2937  		} dcoc_data[4];
1944ca38236502 Frank Wunderlich 2020-04-12  2938  	} req =3D {
1944ca38236502 Frank Wunderlich 2020-04-12  2939  		.direction =3D 1,
1944ca38236502 Frank Wunderlich 2020-04-12  2940  =

1944ca38236502 Frank Wunderlich 2020-04-12  2941  		.center_freq =3D cpu_to=
_le16(chandef->center_freq1),
1944ca38236502 Frank Wunderlich 2020-04-12  2942  		.bw =3D mt7615_mcu_chan=
_bw(chandef),
1944ca38236502 Frank Wunderlich 2020-04-12  2943  		.band =3D chandef->cent=
er_freq1 > 4000,
1944ca38236502 Frank Wunderlich 2020-04-12  2944  		.dbdc_en =3D !!dev->mt7=
6.phy2,
53a7ee94e2f945 Frank Wunderlich 2020-04-11  2945  	};
1944ca38236502 Frank Wunderlich 2020-04-12  2946  	int freq_idx;
1944ca38236502 Frank Wunderlich 2020-04-12  2947  	u8 *eep =3D dev->mt76.ee=
prom.data;
1944ca38236502 Frank Wunderlich 2020-04-12  2948  =

1944ca38236502 Frank Wunderlich 2020-04-12  2949  	if (!(eep[MT_EE_CALDATA_=
FLASH] & MT_EE_CALDATA_FLASH_RX_CAL))
1944ca38236502 Frank Wunderlich 2020-04-12  2950  		return 0;
1944ca38236502 Frank Wunderlich 2020-04-12  2951  =

1944ca38236502 Frank Wunderlich 2020-04-12  2952  	if (chandef->width =3D=
=3D NL80211_CHAN_WIDTH_160) {
1944ca38236502 Frank Wunderlich 2020-04-12  2953  		freq2 =3D req.center_fr=
eq + 40;
1944ca38236502 Frank Wunderlich 2020-04-12  2954  		req.center_freq -=3D 40;
1944ca38236502 Frank Wunderlich 2020-04-12  2955  	}
1944ca38236502 Frank Wunderlich 2020-04-12  2956  =

1944ca38236502 Frank Wunderlich 2020-04-12  2957  again:
1944ca38236502 Frank Wunderlich 2020-04-12  2958  	req.runtime_calibration =
=3D 1;
1944ca38236502 Frank Wunderlich 2020-04-12 @2959  	freq_idx =3D mt7615_dcoc=
_freq_idx(req.center_freq, chandef->width);
1944ca38236502 Frank Wunderlich 2020-04-12  2960  	if (freq_idx < 0)
1944ca38236502 Frank Wunderlich 2020-04-12  2961  		goto out;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  2962  =

1944ca38236502 Frank Wunderlich 2020-04-12  2963  	memcpy(req.dcoc_data, ee=
p + MT7615_EEPROM_DCOC_OFFSET +
1944ca38236502 Frank Wunderlich 2020-04-12  2964  			      freq_idx * MT761=
5_EEPROM_DCOC_SIZE,
1944ca38236502 Frank Wunderlich 2020-04-12  2965  	       sizeof(req.dcoc_d=
ata));
1944ca38236502 Frank Wunderlich 2020-04-12  2966  	req.runtime_calibration =
=3D 0;
1944ca38236502 Frank Wunderlich 2020-04-12  2967  =

1944ca38236502 Frank Wunderlich 2020-04-12  2968  out:
1944ca38236502 Frank Wunderlich 2020-04-12  2969  	ret =3D __mt76_mcu_send_=
msg(&dev->mt76, MCU_EXT_CMD_RXDCOC_CAL, &req,
1944ca38236502 Frank Wunderlich 2020-04-12  2970  				  sizeof(req), true);
1944ca38236502 Frank Wunderlich 2020-04-12  2971  =

1944ca38236502 Frank Wunderlich 2020-04-12  2972  	if ((chandef->width =3D=
=3D NL80211_CHAN_WIDTH_80P80 ||
1944ca38236502 Frank Wunderlich 2020-04-12  2973  	     chandef->width =3D=
=3D NL80211_CHAN_WIDTH_160) && !req.is_freq2) {
1944ca38236502 Frank Wunderlich 2020-04-12  2974  		req.is_freq2 =3D true;
1944ca38236502 Frank Wunderlich 2020-04-12 @2975  		req.center_freq =3D fre=
q2;
1944ca38236502 Frank Wunderlich 2020-04-12  2976  		goto again;
1944ca38236502 Frank Wunderlich 2020-04-12  2977  	}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  2978  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  2979  	return ret;
1944ca38236502 Frank Wunderlich 2020-04-12  2980  }
53a7ee94e2f945 Frank Wunderlich 2020-04-11  2981  =

1944ca38236502 Frank Wunderlich 2020-04-12  2982  static int mt7615_dpd_fre=
q_idx(u16 freq, u8 bw)
1944ca38236502 Frank Wunderlich 2020-04-12  2983  {
1944ca38236502 Frank Wunderlich 2020-04-12  2984  	static const u16 freq_li=
st[] =3D {
1944ca38236502 Frank Wunderlich 2020-04-12  2985  		4920, 4940, 4960, 4980,
1944ca38236502 Frank Wunderlich 2020-04-12  2986  		5040, 5060, 5080, 5180,
1944ca38236502 Frank Wunderlich 2020-04-12  2987  		5200, 5220, 5240, 5260,
1944ca38236502 Frank Wunderlich 2020-04-12  2988  		5280, 5300, 5320, 5340,
1944ca38236502 Frank Wunderlich 2020-04-12  2989  		5360, 5380, 5400, 5420,
1944ca38236502 Frank Wunderlich 2020-04-12  2990  		5440, 5460, 5480, 5500,
1944ca38236502 Frank Wunderlich 2020-04-12  2991  		5520, 5540, 5560, 5580,
1944ca38236502 Frank Wunderlich 2020-04-12  2992  		5600, 5620, 5640, 5660,
1944ca38236502 Frank Wunderlich 2020-04-12  2993  		5680, 5700, 5720, 5745,
1944ca38236502 Frank Wunderlich 2020-04-12  2994  		5765, 5785, 5805, 5825,
1944ca38236502 Frank Wunderlich 2020-04-12  2995  		5845, 5865, 5885, 5905
1944ca38236502 Frank Wunderlich 2020-04-12  2996  	};
1944ca38236502 Frank Wunderlich 2020-04-12  2997  	int offset_2g =3D ARRAY_=
SIZE(freq_list);
1944ca38236502 Frank Wunderlich 2020-04-12  2998  	int idx;
1944ca38236502 Frank Wunderlich 2020-04-12  2999  =

1944ca38236502 Frank Wunderlich 2020-04-12  3000  	if (freq < 4000) {
1944ca38236502 Frank Wunderlich 2020-04-12  3001  		if (freq < 2432)
1944ca38236502 Frank Wunderlich 2020-04-12  3002  			return offset_2g;
1944ca38236502 Frank Wunderlich 2020-04-12  3003  		if (freq < 2457)
1944ca38236502 Frank Wunderlich 2020-04-12  3004  			return offset_2g + 1;
1944ca38236502 Frank Wunderlich 2020-04-12  3005  =

1944ca38236502 Frank Wunderlich 2020-04-12  3006  		return offset_2g + 2;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  3007  	}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  3008  =

1944ca38236502 Frank Wunderlich 2020-04-12  3009  	if (bw !=3D NL80211_CHAN=
_WIDTH_20) {
1944ca38236502 Frank Wunderlich 2020-04-12  3010  		idx =3D mt7615_find_fre=
q_idx(freq_list, ARRAY_SIZE(freq_list),
1944ca38236502 Frank Wunderlich 2020-04-12  3011  					   freq + 10);
1944ca38236502 Frank Wunderlich 2020-04-12  3012  		if (idx >=3D 0)
1944ca38236502 Frank Wunderlich 2020-04-12  3013  			return idx;
1944ca38236502 Frank Wunderlich 2020-04-12  3014  =

1944ca38236502 Frank Wunderlich 2020-04-12  3015  		idx =3D mt7615_find_fre=
q_idx(freq_list, ARRAY_SIZE(freq_list),
1944ca38236502 Frank Wunderlich 2020-04-12  3016  					   freq - 10);
1944ca38236502 Frank Wunderlich 2020-04-12  3017  		if (idx >=3D 0)
1944ca38236502 Frank Wunderlich 2020-04-12  3018  			return idx;
1944ca38236502 Frank Wunderlich 2020-04-12  3019  	}
1944ca38236502 Frank Wunderlich 2020-04-12  3020  =

1944ca38236502 Frank Wunderlich 2020-04-12  3021  	return mt7615_find_freq_=
idx(freq_list, ARRAY_SIZE(freq_list), freq);
1944ca38236502 Frank Wunderlich 2020-04-12  3022  }
1944ca38236502 Frank Wunderlich 2020-04-12  3023  =

1944ca38236502 Frank Wunderlich 2020-04-12  3024  =

1944ca38236502 Frank Wunderlich 2020-04-12  3025  int mt7615_mcu_apply_tx_d=
pd(struct mt7615_phy *phy)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  3026  {
1944ca38236502 Frank Wunderlich 2020-04-12  3027  	struct mt7615_dev *dev =
=3D phy->dev;
1944ca38236502 Frank Wunderlich 2020-04-12  3028  	struct cfg80211_chan_def=
 *chandef =3D &phy->mt76->chandef;
1944ca38236502 Frank Wunderlich 2020-04-12  3029  	int freq2 =3D chandef->c=
enter_freq2;
1944ca38236502 Frank Wunderlich 2020-04-12  3030  	int ret;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  3031  	struct {
1944ca38236502 Frank Wunderlich 2020-04-12  3032  		u8 direction;
1944ca38236502 Frank Wunderlich 2020-04-12  3033  		u8 runtime_calibration;
1944ca38236502 Frank Wunderlich 2020-04-12  3034  		u8 _rsv[2];
1944ca38236502 Frank Wunderlich 2020-04-12  3035  =

1944ca38236502 Frank Wunderlich 2020-04-12  3036  		__le16 center_freq;
1944ca38236502 Frank Wunderlich 2020-04-12  3037  		u8 bw;
1944ca38236502 Frank Wunderlich 2020-04-12  3038  		u8 band;
1944ca38236502 Frank Wunderlich 2020-04-12  3039  		u8 is_freq2;
1944ca38236502 Frank Wunderlich 2020-04-12  3040  		u8 success;
1944ca38236502 Frank Wunderlich 2020-04-12  3041  		u8 dbdc_en;
1944ca38236502 Frank Wunderlich 2020-04-12  3042  =

1944ca38236502 Frank Wunderlich 2020-04-12  3043  		u8 _rsv2;
1944ca38236502 Frank Wunderlich 2020-04-12  3044  =

1944ca38236502 Frank Wunderlich 2020-04-12  3045  		struct {
1944ca38236502 Frank Wunderlich 2020-04-12  3046  			struct {
1944ca38236502 Frank Wunderlich 2020-04-12  3047  				u32 dpd_g0;
1944ca38236502 Frank Wunderlich 2020-04-12  3048  				u8 data[32];
1944ca38236502 Frank Wunderlich 2020-04-12  3049  			} wf0, wf1;
1944ca38236502 Frank Wunderlich 2020-04-12  3050  =

1944ca38236502 Frank Wunderlich 2020-04-12  3051  			struct {
1944ca38236502 Frank Wunderlich 2020-04-12  3052  				u32 dpd_g0_prim;
1944ca38236502 Frank Wunderlich 2020-04-12  3053  				u32 dpd_g0_sec;
1944ca38236502 Frank Wunderlich 2020-04-12  3054  				u8 data_prim[32];
1944ca38236502 Frank Wunderlich 2020-04-12  3055  				u8 data_sec[32];
1944ca38236502 Frank Wunderlich 2020-04-12  3056  			} wf2, wf3;
1944ca38236502 Frank Wunderlich 2020-04-12  3057  		} dpd_data;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  3058  	} req =3D {
1944ca38236502 Frank Wunderlich 2020-04-12  3059  		.direction =3D 1,
1944ca38236502 Frank Wunderlich 2020-04-12  3060  =

1944ca38236502 Frank Wunderlich 2020-04-12  3061  		.center_freq =3D cpu_to=
_le16(chandef->center_freq1),
1944ca38236502 Frank Wunderlich 2020-04-12  3062  		.bw =3D mt7615_mcu_chan=
_bw(chandef),
1944ca38236502 Frank Wunderlich 2020-04-12  3063  		.band =3D chandef->cent=
er_freq1 > 4000,
1944ca38236502 Frank Wunderlich 2020-04-12  3064  		.dbdc_en =3D !!dev->mt7=
6.phy2,
53a7ee94e2f945 Frank Wunderlich 2020-04-11  3065  	};
1944ca38236502 Frank Wunderlich 2020-04-12  3066  	int freq_idx;
1944ca38236502 Frank Wunderlich 2020-04-12  3067  	u8 *eep =3D dev->mt76.ee=
prom.data;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  3068  =

1944ca38236502 Frank Wunderlich 2020-04-12  3069  	if (!(eep[MT_EE_CALDATA_=
FLASH] & MT_EE_CALDATA_FLASH_TX_DPD))
1944ca38236502 Frank Wunderlich 2020-04-12  3070  		return 0;
1944ca38236502 Frank Wunderlich 2020-04-12  3071  =

1944ca38236502 Frank Wunderlich 2020-04-12  3072  	if (chandef->width =3D=
=3D NL80211_CHAN_WIDTH_160) {
1944ca38236502 Frank Wunderlich 2020-04-12  3073  		freq2 =3D req.center_fr=
eq + 40;
1944ca38236502 Frank Wunderlich 2020-04-12  3074  		req.center_freq -=3D 40;
1944ca38236502 Frank Wunderlich 2020-04-12  3075  	}
1944ca38236502 Frank Wunderlich 2020-04-12  3076  =

1944ca38236502 Frank Wunderlich 2020-04-12  3077  again:
1944ca38236502 Frank Wunderlich 2020-04-12  3078  	req.runtime_calibration =
=3D 1;
1944ca38236502 Frank Wunderlich 2020-04-12 @3079  	freq_idx =3D mt7615_dpd_=
freq_idx(req.center_freq, chandef->width);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5809668795489629609==--


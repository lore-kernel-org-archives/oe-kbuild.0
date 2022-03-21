Content-Type: multipart/mixed; boundary="===============4844840418702005882=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH wireless-next] mac80211: introduce BSS color collision detection
Date: Tue, 22 Mar 2022 05:22:29 +0800
Message-ID: <202203220555.BHvsEAhe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4844840418702005882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <6226a016389e034fd9c208b3a7a75edd01aba6f4.1647858505.git.loren=
zo@kernel.org>
References: <6226a016389e034fd9c208b3a7a75edd01aba6f4.1647858505.git.lorenz=
o@kernel.org>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: johannes(a)sipsolutions.net
CC: nbd(a)nbd.name
CC: linux-wireless(a)vger.kernel.org
CC: lorenzo.bianconi(a)redhat.com
CC: ryder.lee(a)mediatek.com
CC: evelyn.tsai(a)mediatek.com
CC: chui-hao.chiu(a)mediatek.com
CC: j(a)w1.fi

Hi Lorenzo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main kvalo-ath/ath-next v5.17 next-202=
20321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lorenzo-Bianconi/mac80211-=
introduce-BSS-color-collision-detection/20220321-183456
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-n=
ext.git main
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: nios2-randconfig-m031-20220321 (https://download.01.org/0day-ci/arc=
hive/20220322/202203220555.BHvsEAhe-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/mac80211/rx.c:3218 ieee80211_rx_check_bss_color_collision() warn: shoul=
d '(((1))) << color' be a 64 bit type?

Old smatch warnings:
net/mac80211/rx.c:877 ieee80211_rx_monitor() warn: variable dereferenced be=
fore check 'origskb' (see line 770)
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +3218 net/mac80211/rx.c

fea147328908b7 Jouni Malinen    2009-01-08  3180  =

964596b43c17b4 Lorenzo Bianconi 2022-03-21  3181  static void
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3182  ieee80211_rx_check_bss_co=
lor_collision(struct ieee80211_rx_data *rx)
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3183  {
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3184  	struct ieee80211_mgmt *m=
gmt =3D (void *)rx->skb->data;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3185  	const struct element *ie;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3186  	size_t baselen;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3187  =

964596b43c17b4 Lorenzo Bianconi 2022-03-21  3188  	if (!wiphy_ext_feature_i=
sset(rx->local->hw.wiphy,
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3189  				     NL80211_EXT_FEAT=
URE_BSS_COLOR))
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3190  		return;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3191  =

964596b43c17b4 Lorenzo Bianconi 2022-03-21  3192  	if (wiphy_ext_feature_is=
set(rx->local->hw.wiphy,
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3193  				    NL80211_EXT_FEATU=
RE_HW_COLOR_COLLISION))
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3194  		return;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3195  =

964596b43c17b4 Lorenzo Bianconi 2022-03-21  3196  	baselen =3D mgmt->u.beac=
on.variable - rx->skb->data;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3197  	if (baselen > rx->skb->l=
en)
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3198  		return;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3199  =

964596b43c17b4 Lorenzo Bianconi 2022-03-21  3200  	ie =3D cfg80211_find_ext=
_elem(WLAN_EID_EXT_HE_OPERATION,
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3201  				    mgmt->u.beacon.va=
riable,
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3202  				    rx->skb->len - ba=
selen);
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3203  	if (ie && ie->datalen >=
=3D sizeof(struct ieee80211_he_operation) &&
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3204  	    ie->datalen >=3D iee=
e80211_he_oper_size(ie->data + 1)) {
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3205  		struct ieee80211_bss_co=
nf *bss_conf =3D &rx->sdata->vif.bss_conf;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3206  		const struct ieee80211_=
he_operation *he_oper;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3207  		u8 color;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3208  =

964596b43c17b4 Lorenzo Bianconi 2022-03-21  3209  		he_oper =3D (void *)(ie=
->data + 1);
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3210  		if (le32_get_bits(he_op=
er->he_oper_params,
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3211  				  IEEE80211_HE_OPERAT=
ION_BSS_COLOR_DISABLED))
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3212  			return;
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3213  =

964596b43c17b4 Lorenzo Bianconi 2022-03-21  3214  		color =3D le32_get_bits=
(he_oper->he_oper_params,
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3215  				      IEEE80211_HE_OP=
ERATION_BSS_COLOR_MASK);
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3216  		if (color =3D=3D bss_co=
nf->he_bss_color.color)
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3217  			ieeee80211_obss_color_=
collision_notify(&rx->sdata->vif,
964596b43c17b4 Lorenzo Bianconi 2022-03-21 @3218  							       BIT(color));
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3219  	}
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3220  }
964596b43c17b4 Lorenzo Bianconi 2022-03-21  3221  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4844840418702005882==--


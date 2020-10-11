Content-Type: multipart/mixed; boundary="===============8701504588662017547=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/broadcom/b43/xmit.c:457 b43_generate_txhdr() error: uninitialized symbol 'cts'.
Date: Sun, 11 Oct 2020 14:21:13 +0800
Message-ID: <202010111405.4BTonyja-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8701504588662017547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   da690031a5d6d50a361e3f19f3eeabd086a6f20d
commit: 3f649ab728cda8038259d8f14492fe400fbab911 treewide: Remove uninitial=
ized_var() usage
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-m031-20201011 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
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

vim +/cts +457 drivers/net/wireless/broadcom/b43/xmit.c

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  233  =

eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  234  /* Generate a TX data header. */
09552ccd8277e63 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  235  int b43_generate_txhdr(struct b43_wldev *dev,
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  236  		       u8 *_txhdr,
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  237  		       struct sk_buff *skb_frag,
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  238  		       struct ieee80211_tx_info *info,
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  239  		       u16 cookie)
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  240  {
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  241  	const unsigned char *fragment_data =3D skb_frag->data;
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  242  	unsigned int fragment_len =3D skb_frag->len;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  243  	struct b43_txhdr *txhdr =3D (struct b43_txhdr *)_txhdr;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  244  	const struct b43_phy *phy =3D &dev->phy;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  245  	const struct ieee80211_hdr *wlhdr =3D
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  246  	    (const struct ieee80211_hdr *)fragment_data;
d0f09804144fd94 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-07-29  247  	int use_encryption =3D !!info->control.hw_key;
f37d923422b6188 drivers/net/wireless/b43/xmit.c          Harvey Harrison 20=
08-06-14  248  	__le16 fctl =3D wlhdr->frame_control;
8318d78a44d49ac drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-01-24  249  	struct ieee80211_rate *fbrate;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  250  	u8 rate, rate_fb;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  251  	int rate_ofdm, rate_fb_ofdm;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  252  	unsigned int plcp_fragment_len;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  253  	u32 mac_ctl =3D 0;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  254  	u16 phy_ctl =3D 0;
694718d8ad2f0b1 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-10-17  255  	bool fill_phy_ctl1 =3D (phy->type =3D=3D B43_PH=
YTYPE_LP ||
694718d8ad2f0b1 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-10-17  256  			      phy->type =3D=3D B43_PHYTYPE_N ||
694718d8ad2f0b1 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-10-17  257  			      phy->type =3D=3D B43_PHYTYPE_HT);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  258  	u8 extra_ft =3D 0;
2e92e6f2c50b4ba drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  259  	struct ieee80211_rate *txrate;
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  260  	struct ieee80211_tx_rate *rates;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  261  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  262  	memset(txhdr, 0, sizeof(*txhdr));
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  263  =

e039fa4a4195ac4 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  264  	txrate =3D ieee80211_get_tx_rate(dev->wl->hw, info);
2e92e6f2c50b4ba drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  265  	rate =3D txrate ? txrate->hw_value : B43_CCK_RATE_1MB;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  266  	rate_ofdm =3D b43_is_ofdm_rate(rate);
870abdf67170daa drivers/net/wireless/b43/xmit.c          Felix Fietkau   20=
08-10-05  267  	fbrate =3D ieee80211_get_alt_retry_rate(dev->wl->hw, info, =
0) ? : txrate;
8318d78a44d49ac drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-01-24  268  	rate_fb =3D fbrate->hw_value;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  269  	rate_fb_ofdm =3D b43_is_ofdm_rate(rate_fb);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  270  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  271  	if (rate_ofdm)
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  272  		txhdr->phy_rate =3D b43_plcp_get_ratecode_ofdm(rate);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  273  	else
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  274  		txhdr->phy_rate =3D b43_plcp_get_ratecode_cck(rate);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  275  	txhdr->mac_frame_ctl =3D wlhdr->frame_control;
d458cdf712e0c67 drivers/net/wireless/b43/xmit.c          Joe Perches     20=
13-10-01  276  	memcpy(txhdr->tx_receiver, wlhdr->addr1, ETH_ALEN);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  277  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  278  	/* Calculate duration for fallback rate */
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  279  	if ((rate_fb =3D=3D rate) ||
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  280  	    (wlhdr->duration_id & cpu_to_le16(0x8000)) ||
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  281  	    (wlhdr->duration_id =3D=3D cpu_to_le16(0))) {
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  282  		/* If the fallback rate equals the normal rate or the
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  283  		 * dur_id field contains an AID, CFP magic or 0,
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  284  		 * use the original dur_id field. */
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  285  		txhdr->dur_fb =3D wlhdr->duration_id;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  286  	} else {
e039fa4a4195ac4 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  287  		txhdr->dur_fb =3D ieee80211_generic_frame_duration(
4ee73f338a528f4 drivers/net/wireless/b43/xmit.c          Michal Kazior   20=
12-04-11  288  			dev->wl->hw, info->control.vif, info->band,
4ee73f338a528f4 drivers/net/wireless/b43/xmit.c          Michal Kazior   20=
12-04-11  289  			fragment_len, fbrate);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  290  	}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  291  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  292  	plcp_fragment_len =3D fragment_len + FCS_LEN;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  293  	if (use_encryption) {
e039fa4a4195ac4 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  294  		u8 key_idx =3D info->control.hw_key->hw_key_idx;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  295  		struct b43_key *key;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  296  		int wlhdr_len;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  297  		size_t iv_len;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  298  =

66d2d089c394c7e drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
09-08-06  299  		B43_WARN_ON(key_idx >=3D ARRAY_SIZE(dev->key));
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  300  		key =3D &(dev->key[key_idx]);
7be1bb6b798d506 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  301  =

09552ccd8277e63 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  302  		if (unlikely(!key->keyconf)) {
09552ccd8277e63 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  303  			/* This key is invalid. This might only happen
09552ccd8277e63 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  304  			 * in a short timeframe after machine resume before
09552ccd8277e63 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  305  			 * we were able to reconfigure keys.
09552ccd8277e63 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  306  			 * Drop this packet completely. Do not transmit it
09552ccd8277e63 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  307  			 * unencrypted to avoid leaking information. */
09552ccd8277e63 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  308  			return -ENOKEY;
09552ccd8277e63 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  309  		}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  310  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  311  		/* Hardware appends ICV. */
76708dee382a69b drivers/net/wireless/b43/xmit.c          Felix Fietkau   20=
08-10-05  312  		plcp_fragment_len +=3D info->control.hw_key->icv_len;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  313  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  314  		key_idx =3D b43_kidx_to_fw(dev, key_idx);
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  315  		mac_ctl |=3D (key_idx << B43_TXH_MAC_KEYIDX_SHIFT) &
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  316  			   B43_TXH_MAC_KEYIDX;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  317  		mac_ctl |=3D (key->algorithm << B43_TXH_MAC_KEYALG_SHIFT) &
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  318  			   B43_TXH_MAC_KEYALG;
f37d923422b6188 drivers/net/wireless/b43/xmit.c          Harvey Harrison 20=
08-06-14  319  		wlhdr_len =3D ieee80211_hdrlen(fctl);
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  320  		if (key->algorithm =3D=3D B43_SEC_ALGO_TKIP) {
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  321  			u16 phase1key[5];
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  322  			int i;
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  323  			/* we give the phase1key and iv16 here, the key is stored=
 in
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  324  			 * shm. With that the hardware can do phase 2 and encrypt=
ion.
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  325  			 */
523b02ea23b175d drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
11-07-07  326  			ieee80211_get_tkip_p1k(info->control.hw_key, skb_frag, ph=
ase1key);
cde1b55b43b71ca drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
09-09-06  327  			/* phase1key is in host endian. Copy to little-endian txh=
dr->iv. */
cde1b55b43b71ca drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
09-09-06  328  			for (i =3D 0; i < 5; i++) {
cde1b55b43b71ca drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
09-09-06  329  				txhdr->iv[i * 2 + 0] =3D phase1key[i];
cde1b55b43b71ca drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
09-09-06  330  				txhdr->iv[i * 2 + 1] =3D phase1key[i] >> 8;
cde1b55b43b71ca drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
09-09-06  331  			}
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  332  			/* iv16 */
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  333  			memcpy(txhdr->iv + 10, ((u8 *) wlhdr) + wlhdr_len, 3);
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  334  		} else {
c8e4955653a470e drivers/net/wireless/b43/xmit.c          Silvan Jegen    20=
14-02-25  335  			iv_len =3D min_t(size_t, info->control.hw_key->iv_len,
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  336  				     ARRAY_SIZE(txhdr->iv));
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  337  			memcpy(txhdr->iv, ((u8 *) wlhdr) + wlhdr_len, iv_len);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  338  		}
035d0243ebbdbd5 drivers/net/wireless/b43/xmit.c          gregor kowski   20=
09-08-19  339  	}
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  340  	switch (dev->fw.hdr_format) {
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  341  	case B43_FW_HDR_598:
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  342  		b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)=
(&txhdr->format_598.plcp),
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  343  				      plcp_fragment_len, rate);
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  344  		break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  345  	case B43_FW_HDR_351:
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  346  		b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)=
(&txhdr->format_351.plcp),
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  347  				      plcp_fragment_len, rate);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  348  		break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  349  	case B43_FW_HDR_410:
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  350  		b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)=
(&txhdr->format_410.plcp),
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  351  				      plcp_fragment_len, rate);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  352  		break;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  353  	}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  354  	b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)(&txhdr->plcp=
_fb),
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  355  			      plcp_fragment_len, rate_fb);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  356  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  357  	/* Extra Frame Types */
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  358  	if (rate_fb_ofdm)
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  359  		extra_ft |=3D B43_TXH_EFT_FB_OFDM;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  360  	else
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  361  		extra_ft |=3D B43_TXH_EFT_FB_CCK;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  362  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  363  	/* Set channel radio code. Note that the micrcode ORs 0x100=
 to
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  364  	 * this value before comparing it to the value in SHM, if t=
his
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  365  	 * is a 5Ghz packet.
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  366  	 */
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  367  	txhdr->chan_radio_code =3D phy->channel;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  368  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  369  	/* PHY TX Control word */
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  370  	if (rate_ofdm)
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  371  		phy_ctl |=3D B43_TXH_PHY_ENC_OFDM;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  372  	else
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  373  		phy_ctl |=3D B43_TXH_PHY_ENC_CCK;
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  374  	if (info->control.rates[0].flags & IEEE80211_TX_RC_USE_SHOR=
T_PREAMBLE)
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  375  		phy_ctl |=3D B43_TXH_PHY_SHORTPRMBL;
9db1f6d725921c4 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-12-22  376  =

d748b4642a53cd1 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
12-03-28  377  	switch (b43_ieee80211_antenna_sanitize(dev, 0)) {
9db1f6d725921c4 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-12-22  378  	case 0: /* Default */
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  379  		phy_ctl |=3D B43_TXH_PHY_ANT01AUTO;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  380  		break;
9db1f6d725921c4 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-12-22  381  	case 1: /* Antenna 0 */
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  382  		phy_ctl |=3D B43_TXH_PHY_ANT0;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  383  		break;
9db1f6d725921c4 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-12-22  384  	case 2: /* Antenna 1 */
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  385  		phy_ctl |=3D B43_TXH_PHY_ANT1;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  386  		break;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  387  	case 3: /* Antenna 2 */
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  388  		phy_ctl |=3D B43_TXH_PHY_ANT2;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  389  		break;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  390  	case 4: /* Antenna 3 */
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  391  		phy_ctl |=3D B43_TXH_PHY_ANT3;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  392  		break;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  393  	default:
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  394  		B43_WARN_ON(1);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  395  	}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  396  =

e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  397  	rates =3D info->control.rates;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  398  	/* MAC control */
e039fa4a4195ac4 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  399  	if (!(info->flags & IEEE80211_TX_CTL_NO_ACK))
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  400  		mac_ctl |=3D B43_TXH_MAC_ACK;
f591fa5dbbbeaeb drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-07-10  401  	/* use hardware sequence counter as the non-TID counter */
f591fa5dbbbeaeb drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-07-10  402  	if (info->flags & IEEE80211_TX_CTL_ASSIGN_SEQ)
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  403  		mac_ctl |=3D B43_TXH_MAC_HWSEQ;
e039fa4a4195ac4 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  404  	if (info->flags & IEEE80211_TX_CTL_FIRST_FRAGMENT)
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  405  		mac_ctl |=3D B43_TXH_MAC_STMSDU;
24acfc632b7ba55 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2014-05-20  406  	if (!phy->gmode)
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  407  		mac_ctl |=3D B43_TXH_MAC_5GHZ;
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  408  =

e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  409  	/* Overwrite rates[0].count to make the retry calculation
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  410  	 * in the tx status easier. need the actual retry limit to
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  411  	 * detect whether the fallback rate was used.
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  412  	 */
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  413  	if ((rates[0].flags & IEEE80211_TX_RC_USE_RTS_CTS) ||
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  414  	    (rates[0].count <=3D dev->wl->hw->conf.long_frame_max_t=
x_count)) {
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  415  		rates[0].count =3D dev->wl->hw->conf.long_frame_max_tx_cou=
nt;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  416  		mac_ctl |=3D B43_TXH_MAC_LONGFRAME;
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  417  	} else {
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  418  		rates[0].count =3D dev->wl->hw->conf.short_frame_max_tx_co=
unt;
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  419  	}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  420  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  421  	/* Generate the RTS or CTS-to-self frame */
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  422  	if ((rates[0].flags & IEEE80211_TX_RC_USE_RTS_CTS) ||
e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  423  	    (rates[0].flags & IEEE80211_TX_RC_USE_CTS_PROTECT)) {
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  424  		unsigned int len;
3f649ab728cda80 drivers/net/wireless/broadcom/b43/xmit.c Kees Cook       20=
20-06-03  425  		struct ieee80211_hdr *hdr;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  426  		int rts_rate, rts_rate_fb;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  427  		int rts_rate_ofdm, rts_rate_fb_ofdm;
3f649ab728cda80 drivers/net/wireless/broadcom/b43/xmit.c Kees Cook       20=
20-06-03  428  		struct b43_plcp_hdr6 *plcp;
2e92e6f2c50b4ba drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  429  		struct ieee80211_rate *rts_cts_rate;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  430  =

e039fa4a4195ac4 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  431  		rts_cts_rate =3D ieee80211_get_rts_cts_rate(dev->wl->hw, i=
nfo);
2e92e6f2c50b4ba drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  432  =

2e92e6f2c50b4ba drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  433  		rts_rate =3D rts_cts_rate ? rts_cts_rate->hw_value : B43_C=
CK_RATE_1MB;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  434  		rts_rate_ofdm =3D b43_is_ofdm_rate(rts_rate);
d0b03439f7845ad drivers/net/wireless/broadcom/b43/xmit.c Adrian Chadd    20=
16-05-16  435  		rts_rate_fb =3D b43_calc_fallback_rate(rts_rate, phy->gmod=
e);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  436  		rts_rate_fb_ofdm =3D b43_is_ofdm_rate(rts_rate_fb);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  437  =

e6a9854b05c1a6a drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-10-21  438  		if (rates[0].flags & IEEE80211_TX_RC_USE_CTS_PROTECT) {
3f649ab728cda80 drivers/net/wireless/broadcom/b43/xmit.c Kees Cook       20=
20-06-03  439  			struct ieee80211_cts *cts;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  440  =

efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  441  			switch (dev->fw.hdr_format) {
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  442  			case B43_FW_HDR_598:
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  443  				cts =3D (struct ieee80211_cts *)
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  444  					(txhdr->format_598.rts_frame);
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  445  				break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  446  			case B43_FW_HDR_351:
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  447  				cts =3D (struct ieee80211_cts *)
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  448  					(txhdr->format_351.rts_frame);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  449  				break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  450  			case B43_FW_HDR_410:
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  451  				cts =3D (struct ieee80211_cts *)
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  452  					(txhdr->format_410.rts_frame);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  453  				break;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  454  			}
e039fa4a4195ac4 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  455  			ieee80211_ctstoself_get(dev->wl->hw, info->control.vif,
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  456  						fragment_data, fragment_len,
e039fa4a4195ac4 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15 @457  						info, cts);
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  458  			mac_ctl |=3D B43_TXH_MAC_SENDCTS;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  459  			len =3D sizeof(struct ieee80211_cts);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  460  		} else {
3f649ab728cda80 drivers/net/wireless/broadcom/b43/xmit.c Kees Cook       20=
20-06-03  461  			struct ieee80211_rts *rts;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  462  =

efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  463  			switch (dev->fw.hdr_format) {
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  464  			case B43_FW_HDR_598:
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  465  				rts =3D (struct ieee80211_rts *)
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  466  					(txhdr->format_598.rts_frame);
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  467  				break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  468  			case B43_FW_HDR_351:
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  469  				rts =3D (struct ieee80211_rts *)
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  470  					(txhdr->format_351.rts_frame);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  471  				break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  472  			case B43_FW_HDR_410:
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  473  				rts =3D (struct ieee80211_rts *)
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  474  					(txhdr->format_410.rts_frame);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  475  				break;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  476  			}
e039fa4a4195ac4 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15  477  			ieee80211_rts_get(dev->wl->hw, info->control.vif,
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  478  					  fragment_data, fragment_len,
e039fa4a4195ac4 drivers/net/wireless/b43/xmit.c          Johannes Berg   20=
08-05-15 @479  					  info, rts);
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  480  			mac_ctl |=3D B43_TXH_MAC_SENDRTS;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  481  			len =3D sizeof(struct ieee80211_rts);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  482  		}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  483  		len +=3D FCS_LEN;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  484  =

eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  485  		/* Generate the PLCP headers for the RTS/CTS frame */
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  486  		switch (dev->fw.hdr_format) {
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  487  		case B43_FW_HDR_598:
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  488  			plcp =3D &txhdr->format_598.rts_plcp;
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  489  			break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  490  		case B43_FW_HDR_351:
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  491  			plcp =3D &txhdr->format_351.rts_plcp;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  492  			break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  493  		case B43_FW_HDR_410:
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  494  			plcp =3D &txhdr->format_410.rts_plcp;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  495  			break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  496  		}
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28 @497  		b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)plcp,
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  498  				      len, rts_rate);
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  499  		plcp =3D &txhdr->rts_plcp_fb;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  500  		b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)plcp,
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  501  				      len, rts_rate_fb);
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  502  =

efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  503  		switch (dev->fw.hdr_format) {
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  504  		case B43_FW_HDR_598:
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  505  			hdr =3D (struct ieee80211_hdr *)
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  506  				(&txhdr->format_598.rts_frame);
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  507  			break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  508  		case B43_FW_HDR_351:
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  509  			hdr =3D (struct ieee80211_hdr *)
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  510  				(&txhdr->format_351.rts_frame);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  511  			break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  512  		case B43_FW_HDR_410:
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  513  			hdr =3D (struct ieee80211_hdr *)
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  514  				(&txhdr->format_410.rts_frame);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  515  			break;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  516  		}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18 @517  		txhdr->rts_dur_fb =3D hdr->duration_id;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  518  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  519  		if (rts_rate_ofdm) {
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  520  			extra_ft |=3D B43_TXH_EFT_RTS_OFDM;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  521  			txhdr->phy_rate_rts =3D
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  522  			    b43_plcp_get_ratecode_ofdm(rts_rate);
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  523  		} else {
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  524  			extra_ft |=3D B43_TXH_EFT_RTS_CCK;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  525  			txhdr->phy_rate_rts =3D
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  526  			    b43_plcp_get_ratecode_cck(rts_rate);
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  527  		}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  528  		if (rts_rate_fb_ofdm)
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  529  			extra_ft |=3D B43_TXH_EFT_RTSFB_OFDM;
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  530  		else
eb189d8bc9824bc drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-28  531  			extra_ft |=3D B43_TXH_EFT_RTSFB_CCK;
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  532  =

3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  533  		if (rates[0].flags & IEEE80211_TX_RC_USE_RTS_C=
TS &&
694718d8ad2f0b1 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-10-17  534  		    fill_phy_ctl1) {
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  535  			txhdr->phy_ctl1_rts =3D cpu_to_le16(
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  536  				b43_generate_tx_phy_ctl1(dev, rts_rate));
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  537  			txhdr->phy_ctl1_rts_fb =3D cpu_to_le16(
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  538  				b43_generate_tx_phy_ctl1(dev, rts_rate_fb));
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  539  		}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  540  	}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  541  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  542  	/* Magic cookie */
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  543  	switch (dev->fw.hdr_format) {
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  544  	case B43_FW_HDR_598:
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  545  		txhdr->format_598.cookie =3D cpu_to_le16(cooki=
e);
5d852905561a979 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  546  		break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  547  	case B43_FW_HDR_351:
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  548  		txhdr->format_351.cookie =3D cpu_to_le16(cooki=
e);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  549  		break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  550  	case B43_FW_HDR_410:
2391b7e8d40e4b3 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  551  		txhdr->format_410.cookie =3D cpu_to_le16(cooki=
e);
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  552  		break;
efe0249b0fd1e9a drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-08-11  553  	}
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  554  =

694718d8ad2f0b1 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-10-17  555  	if (fill_phy_ctl1) {
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  556  		txhdr->phy_ctl1 =3D
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  557  			cpu_to_le16(b43_generate_tx_phy_ctl1(dev, rat=
e));
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  558  		txhdr->phy_ctl1_fb =3D
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  559  			cpu_to_le16(b43_generate_tx_phy_ctl1(dev, rat=
e_fb));
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  560  	}
3311abbbbff1719 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=
=82ecki   2011-02-25  561  =

e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  562  	/* Apply the bitfields */
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  563  	txhdr->mac_ctl =3D cpu_to_le32(mac_ctl);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  564  	txhdr->phy_ctl =3D cpu_to_le16(phy_ctl);
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  565  	txhdr->extra_ft =3D extra_ft;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  566  =

09552ccd8277e63 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
08-01-23  567  	return 0;
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  568  }
e4d6b7951812d98 drivers/net/wireless/b43/xmit.c          Michael Buesch  20=
07-09-18  569  =


:::::: The code at line 457 was first introduced by commit
:::::: e039fa4a4195ac4ee895e6f3d1334beed63256fe mac80211: move TX info into=
 skb->cb

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8701504588662017547==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
1Xd0HQIA
--===============8701504588662017547==--


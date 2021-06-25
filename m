Content-Type: multipart/mixed; boundary="===============1559744013208583723=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/broadcom/b43/xmit.c:457 b43_generate_txhdr() error: uninitialized symbol 'cts'.
Date: Fri, 25 Jun 2021 21:05:15 +0800
Message-ID: <202106252107.46eSP1Hi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1559744013208583723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   44db63d1ad8d71c6932cbe007eb41f31c434d140
commit: 3f649ab728cda8038259d8f14492fe400fbab911 treewide: Remove uninitial=
ized_var() usage
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-m031-20210625 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
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
drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c:642 _rtl92cu_init_chipn=
_two_out_ep_priority() error: uninitialized symbol 'valuelow'.
drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c:644 _rtl92cu_init_chipn=
_two_out_ep_priority() error: uninitialized symbol 'valuehi'.

Old smatch warnings:
drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c:649 _rtl92cu_init_chipn=
_two_out_ep_priority() error: uninitialized symbol 'valuehi'.
drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c:650 _rtl92cu_init_chipn=
_two_out_ep_priority() error: uninitialized symbol 'valuelow'.

vim +/cts +457 drivers/net/wireless/broadcom/b43/xmit.c

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  233  =

eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  234  /* Generate a TX data header. */
09552ccd8277e6 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  235  int b43_generate_txhdr(struct b43_wldev *dev,
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  236  		       u8 *_txhdr,
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  237  		       struct sk_buff *skb_frag,
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  238  		       struct ieee80211_tx_info *info,
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  239  		       u16 cookie)
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  240  {
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  241  	const unsigned char *fragment_data =3D skb_frag->data;
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  242  	unsigned int fragment_len =3D skb_frag->len;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  243  	struct b43_txhdr *txhdr =3D (struct b43_txhdr *)_txhdr;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  244  	const struct b43_phy *phy =3D &dev->phy;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  245  	const struct ieee80211_hdr *wlhdr =3D
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  246  	    (const struct ieee80211_hdr *)fragment_data;
d0f09804144fd9 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-07-29  247  	int use_encryption =3D !!info->control.hw_key;
f37d923422b618 drivers/net/wireless/b43/xmit.c          Harvey Harrison 200=
8-06-14  248  	__le16 fctl =3D wlhdr->frame_control;
8318d78a44d49a drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-01-24  249  	struct ieee80211_rate *fbrate;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  250  	u8 rate, rate_fb;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  251  	int rate_ofdm, rate_fb_ofdm;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  252  	unsigned int plcp_fragment_len;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  253  	u32 mac_ctl =3D 0;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  254  	u16 phy_ctl =3D 0;
694718d8ad2f0b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-10-17  255  	bool fill_phy_ctl1 =3D (phy->type =3D=3D B43_PHYTY=
PE_LP ||
694718d8ad2f0b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-10-17  256  			      phy->type =3D=3D B43_PHYTYPE_N ||
694718d8ad2f0b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-10-17  257  			      phy->type =3D=3D B43_PHYTYPE_HT);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  258  	u8 extra_ft =3D 0;
2e92e6f2c50b4b drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  259  	struct ieee80211_rate *txrate;
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  260  	struct ieee80211_tx_rate *rates;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  261  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  262  	memset(txhdr, 0, sizeof(*txhdr));
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  263  =

e039fa4a4195ac drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  264  	txrate =3D ieee80211_get_tx_rate(dev->wl->hw, info);
2e92e6f2c50b4b drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  265  	rate =3D txrate ? txrate->hw_value : B43_CCK_RATE_1MB;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  266  	rate_ofdm =3D b43_is_ofdm_rate(rate);
870abdf67170da drivers/net/wireless/b43/xmit.c          Felix Fietkau   200=
8-10-05  267  	fbrate =3D ieee80211_get_alt_retry_rate(dev->wl->hw, info, 0=
) ? : txrate;
8318d78a44d49a drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-01-24  268  	rate_fb =3D fbrate->hw_value;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  269  	rate_fb_ofdm =3D b43_is_ofdm_rate(rate_fb);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  270  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  271  	if (rate_ofdm)
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  272  		txhdr->phy_rate =3D b43_plcp_get_ratecode_ofdm(rate);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  273  	else
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  274  		txhdr->phy_rate =3D b43_plcp_get_ratecode_cck(rate);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  275  	txhdr->mac_frame_ctl =3D wlhdr->frame_control;
d458cdf712e0c6 drivers/net/wireless/b43/xmit.c          Joe Perches     201=
3-10-01  276  	memcpy(txhdr->tx_receiver, wlhdr->addr1, ETH_ALEN);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  277  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  278  	/* Calculate duration for fallback rate */
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  279  	if ((rate_fb =3D=3D rate) ||
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  280  	    (wlhdr->duration_id & cpu_to_le16(0x8000)) ||
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  281  	    (wlhdr->duration_id =3D=3D cpu_to_le16(0))) {
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  282  		/* If the fallback rate equals the normal rate or the
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  283  		 * dur_id field contains an AID, CFP magic or 0,
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  284  		 * use the original dur_id field. */
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  285  		txhdr->dur_fb =3D wlhdr->duration_id;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  286  	} else {
e039fa4a4195ac drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  287  		txhdr->dur_fb =3D ieee80211_generic_frame_duration(
4ee73f338a528f drivers/net/wireless/b43/xmit.c          Michal Kazior   201=
2-04-11  288  			dev->wl->hw, info->control.vif, info->band,
4ee73f338a528f drivers/net/wireless/b43/xmit.c          Michal Kazior   201=
2-04-11  289  			fragment_len, fbrate);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  290  	}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  291  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  292  	plcp_fragment_len =3D fragment_len + FCS_LEN;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  293  	if (use_encryption) {
e039fa4a4195ac drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  294  		u8 key_idx =3D info->control.hw_key->hw_key_idx;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  295  		struct b43_key *key;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  296  		int wlhdr_len;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  297  		size_t iv_len;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  298  =

66d2d089c394c7 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
9-08-06  299  		B43_WARN_ON(key_idx >=3D ARRAY_SIZE(dev->key));
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  300  		key =3D &(dev->key[key_idx]);
7be1bb6b798d50 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  301  =

09552ccd8277e6 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  302  		if (unlikely(!key->keyconf)) {
09552ccd8277e6 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  303  			/* This key is invalid. This might only happen
09552ccd8277e6 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  304  			 * in a short timeframe after machine resume before
09552ccd8277e6 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  305  			 * we were able to reconfigure keys.
09552ccd8277e6 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  306  			 * Drop this packet completely. Do not transmit it
09552ccd8277e6 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  307  			 * unencrypted to avoid leaking information. */
09552ccd8277e6 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  308  			return -ENOKEY;
09552ccd8277e6 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  309  		}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  310  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  311  		/* Hardware appends ICV. */
76708dee382a69 drivers/net/wireless/b43/xmit.c          Felix Fietkau   200=
8-10-05  312  		plcp_fragment_len +=3D info->control.hw_key->icv_len;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  313  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  314  		key_idx =3D b43_kidx_to_fw(dev, key_idx);
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  315  		mac_ctl |=3D (key_idx << B43_TXH_MAC_KEYIDX_SHIFT) &
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  316  			   B43_TXH_MAC_KEYIDX;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  317  		mac_ctl |=3D (key->algorithm << B43_TXH_MAC_KEYALG_SHIFT) &
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  318  			   B43_TXH_MAC_KEYALG;
f37d923422b618 drivers/net/wireless/b43/xmit.c          Harvey Harrison 200=
8-06-14  319  		wlhdr_len =3D ieee80211_hdrlen(fctl);
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  320  		if (key->algorithm =3D=3D B43_SEC_ALGO_TKIP) {
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  321  			u16 phase1key[5];
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  322  			int i;
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  323  			/* we give the phase1key and iv16 here, the key is stored =
in
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  324  			 * shm. With that the hardware can do phase 2 and encrypti=
on.
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  325  			 */
523b02ea23b175 drivers/net/wireless/b43/xmit.c          Johannes Berg   201=
1-07-07  326  			ieee80211_get_tkip_p1k(info->control.hw_key, skb_frag, pha=
se1key);
cde1b55b43b71c drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
9-09-06  327  			/* phase1key is in host endian. Copy to little-endian txhd=
r->iv. */
cde1b55b43b71c drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
9-09-06  328  			for (i =3D 0; i < 5; i++) {
cde1b55b43b71c drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
9-09-06  329  				txhdr->iv[i * 2 + 0] =3D phase1key[i];
cde1b55b43b71c drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
9-09-06  330  				txhdr->iv[i * 2 + 1] =3D phase1key[i] >> 8;
cde1b55b43b71c drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
9-09-06  331  			}
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  332  			/* iv16 */
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  333  			memcpy(txhdr->iv + 10, ((u8 *) wlhdr) + wlhdr_len, 3);
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  334  		} else {
c8e4955653a470 drivers/net/wireless/b43/xmit.c          Silvan Jegen    201=
4-02-25  335  			iv_len =3D min_t(size_t, info->control.hw_key->iv_len,
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  336  				     ARRAY_SIZE(txhdr->iv));
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  337  			memcpy(txhdr->iv, ((u8 *) wlhdr) + wlhdr_len, iv_len);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  338  		}
035d0243ebbdbd drivers/net/wireless/b43/xmit.c          gregor kowski   200=
9-08-19  339  	}
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  340  	switch (dev->fw.hdr_format) {
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  341  	case B43_FW_HDR_598:
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  342  		b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)(&t=
xhdr->format_598.plcp),
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  343  				      plcp_fragment_len, rate);
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  344  		break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  345  	case B43_FW_HDR_351:
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  346  		b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)(&t=
xhdr->format_351.plcp),
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  347  				      plcp_fragment_len, rate);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  348  		break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  349  	case B43_FW_HDR_410:
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  350  		b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)(&t=
xhdr->format_410.plcp),
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  351  				      plcp_fragment_len, rate);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  352  		break;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  353  	}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  354  	b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)(&txhdr->plcp_=
fb),
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  355  			      plcp_fragment_len, rate_fb);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  356  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  357  	/* Extra Frame Types */
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  358  	if (rate_fb_ofdm)
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  359  		extra_ft |=3D B43_TXH_EFT_FB_OFDM;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  360  	else
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  361  		extra_ft |=3D B43_TXH_EFT_FB_CCK;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  362  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  363  	/* Set channel radio code. Note that the micrcode ORs 0x100 =
to
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  364  	 * this value before comparing it to the value in SHM, if th=
is
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  365  	 * is a 5Ghz packet.
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  366  	 */
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  367  	txhdr->chan_radio_code =3D phy->channel;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  368  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  369  	/* PHY TX Control word */
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  370  	if (rate_ofdm)
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  371  		phy_ctl |=3D B43_TXH_PHY_ENC_OFDM;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  372  	else
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  373  		phy_ctl |=3D B43_TXH_PHY_ENC_CCK;
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  374  	if (info->control.rates[0].flags & IEEE80211_TX_RC_USE_SHORT=
_PREAMBLE)
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  375  		phy_ctl |=3D B43_TXH_PHY_SHORTPRMBL;
9db1f6d725921c drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-12-22  376  =

d748b4642a53cd drivers/net/wireless/b43/xmit.c          Johannes Berg   201=
2-03-28  377  	switch (b43_ieee80211_antenna_sanitize(dev, 0)) {
9db1f6d725921c drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-12-22  378  	case 0: /* Default */
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  379  		phy_ctl |=3D B43_TXH_PHY_ANT01AUTO;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  380  		break;
9db1f6d725921c drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-12-22  381  	case 1: /* Antenna 0 */
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  382  		phy_ctl |=3D B43_TXH_PHY_ANT0;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  383  		break;
9db1f6d725921c drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-12-22  384  	case 2: /* Antenna 1 */
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  385  		phy_ctl |=3D B43_TXH_PHY_ANT1;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  386  		break;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  387  	case 3: /* Antenna 2 */
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  388  		phy_ctl |=3D B43_TXH_PHY_ANT2;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  389  		break;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  390  	case 4: /* Antenna 3 */
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  391  		phy_ctl |=3D B43_TXH_PHY_ANT3;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  392  		break;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  393  	default:
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  394  		B43_WARN_ON(1);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  395  	}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  396  =

e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  397  	rates =3D info->control.rates;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  398  	/* MAC control */
e039fa4a4195ac drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  399  	if (!(info->flags & IEEE80211_TX_CTL_NO_ACK))
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  400  		mac_ctl |=3D B43_TXH_MAC_ACK;
f591fa5dbbbeae drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-07-10  401  	/* use hardware sequence counter as the non-TID counter */
f591fa5dbbbeae drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-07-10  402  	if (info->flags & IEEE80211_TX_CTL_ASSIGN_SEQ)
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  403  		mac_ctl |=3D B43_TXH_MAC_HWSEQ;
e039fa4a4195ac drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  404  	if (info->flags & IEEE80211_TX_CTL_FIRST_FRAGMENT)
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  405  		mac_ctl |=3D B43_TXH_MAC_STMSDU;
24acfc632b7ba5 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2014-05-20  406  	if (!phy->gmode)
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  407  		mac_ctl |=3D B43_TXH_MAC_5GHZ;
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  408  =

e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  409  	/* Overwrite rates[0].count to make the retry calculation
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  410  	 * in the tx status easier. need the actual retry limit to
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  411  	 * detect whether the fallback rate was used.
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  412  	 */
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  413  	if ((rates[0].flags & IEEE80211_TX_RC_USE_RTS_CTS) ||
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  414  	    (rates[0].count <=3D dev->wl->hw->conf.long_frame_max_tx=
_count)) {
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  415  		rates[0].count =3D dev->wl->hw->conf.long_frame_max_tx_coun=
t;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  416  		mac_ctl |=3D B43_TXH_MAC_LONGFRAME;
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  417  	} else {
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  418  		rates[0].count =3D dev->wl->hw->conf.short_frame_max_tx_cou=
nt;
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  419  	}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  420  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  421  	/* Generate the RTS or CTS-to-self frame */
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  422  	if ((rates[0].flags & IEEE80211_TX_RC_USE_RTS_CTS) ||
e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  423  	    (rates[0].flags & IEEE80211_TX_RC_USE_CTS_PROTECT)) {
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  424  		unsigned int len;
3f649ab728cda8 drivers/net/wireless/broadcom/b43/xmit.c Kees Cook       202=
0-06-03  425  		struct ieee80211_hdr *hdr;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  426  		int rts_rate, rts_rate_fb;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  427  		int rts_rate_ofdm, rts_rate_fb_ofdm;
3f649ab728cda8 drivers/net/wireless/broadcom/b43/xmit.c Kees Cook       202=
0-06-03  428  		struct b43_plcp_hdr6 *plcp;
2e92e6f2c50b4b drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  429  		struct ieee80211_rate *rts_cts_rate;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  430  =

e039fa4a4195ac drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  431  		rts_cts_rate =3D ieee80211_get_rts_cts_rate(dev->wl->hw, in=
fo);
2e92e6f2c50b4b drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  432  =

2e92e6f2c50b4b drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  433  		rts_rate =3D rts_cts_rate ? rts_cts_rate->hw_value : B43_CC=
K_RATE_1MB;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  434  		rts_rate_ofdm =3D b43_is_ofdm_rate(rts_rate);
d0b03439f7845a drivers/net/wireless/broadcom/b43/xmit.c Adrian Chadd    201=
6-05-16  435  		rts_rate_fb =3D b43_calc_fallback_rate(rts_rate, phy->gmode=
);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  436  		rts_rate_fb_ofdm =3D b43_is_ofdm_rate(rts_rate_fb);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  437  =

e6a9854b05c1a6 drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-10-21  438  		if (rates[0].flags & IEEE80211_TX_RC_USE_CTS_PROTECT) {
3f649ab728cda8 drivers/net/wireless/broadcom/b43/xmit.c Kees Cook       202=
0-06-03  439  			struct ieee80211_cts *cts;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  440  =

efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  441  			switch (dev->fw.hdr_format) {
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  442  			case B43_FW_HDR_598:
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  443  				cts =3D (struct ieee80211_cts *)
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  444  					(txhdr->format_598.rts_frame);
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  445  				break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  446  			case B43_FW_HDR_351:
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  447  				cts =3D (struct ieee80211_cts *)
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  448  					(txhdr->format_351.rts_frame);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  449  				break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  450  			case B43_FW_HDR_410:
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  451  				cts =3D (struct ieee80211_cts *)
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  452  					(txhdr->format_410.rts_frame);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  453  				break;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  454  			}
e039fa4a4195ac drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  455  			ieee80211_ctstoself_get(dev->wl->hw, info->control.vif,
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  456  						fragment_data, fragment_len,
e039fa4a4195ac drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15 @457  						info, cts);
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  458  			mac_ctl |=3D B43_TXH_MAC_SENDCTS;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  459  			len =3D sizeof(struct ieee80211_cts);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  460  		} else {
3f649ab728cda8 drivers/net/wireless/broadcom/b43/xmit.c Kees Cook       202=
0-06-03  461  			struct ieee80211_rts *rts;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  462  =

efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  463  			switch (dev->fw.hdr_format) {
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  464  			case B43_FW_HDR_598:
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  465  				rts =3D (struct ieee80211_rts *)
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  466  					(txhdr->format_598.rts_frame);
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  467  				break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  468  			case B43_FW_HDR_351:
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  469  				rts =3D (struct ieee80211_rts *)
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  470  					(txhdr->format_351.rts_frame);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  471  				break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  472  			case B43_FW_HDR_410:
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  473  				rts =3D (struct ieee80211_rts *)
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  474  					(txhdr->format_410.rts_frame);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  475  				break;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  476  			}
e039fa4a4195ac drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15  477  			ieee80211_rts_get(dev->wl->hw, info->control.vif,
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  478  					  fragment_data, fragment_len,
e039fa4a4195ac drivers/net/wireless/b43/xmit.c          Johannes Berg   200=
8-05-15 @479  					  info, rts);
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  480  			mac_ctl |=3D B43_TXH_MAC_SENDRTS;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  481  			len =3D sizeof(struct ieee80211_rts);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  482  		}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  483  		len +=3D FCS_LEN;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  484  =

eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  485  		/* Generate the PLCP headers for the RTS/CTS frame */
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  486  		switch (dev->fw.hdr_format) {
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  487  		case B43_FW_HDR_598:
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  488  			plcp =3D &txhdr->format_598.rts_plcp;
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  489  			break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  490  		case B43_FW_HDR_351:
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  491  			plcp =3D &txhdr->format_351.rts_plcp;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  492  			break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  493  		case B43_FW_HDR_410:
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  494  			plcp =3D &txhdr->format_410.rts_plcp;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  495  			break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  496  		}
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28 @497  		b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)plcp,
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  498  				      len, rts_rate);
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  499  		plcp =3D &txhdr->rts_plcp_fb;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  500  		b43_generate_plcp_hdr((struct b43_plcp_hdr4 *)plcp,
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  501  				      len, rts_rate_fb);
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  502  =

efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  503  		switch (dev->fw.hdr_format) {
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  504  		case B43_FW_HDR_598:
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  505  			hdr =3D (struct ieee80211_hdr *)
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  506  				(&txhdr->format_598.rts_frame);
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  507  			break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  508  		case B43_FW_HDR_351:
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  509  			hdr =3D (struct ieee80211_hdr *)
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  510  				(&txhdr->format_351.rts_frame);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  511  			break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  512  		case B43_FW_HDR_410:
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  513  			hdr =3D (struct ieee80211_hdr *)
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  514  				(&txhdr->format_410.rts_frame);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  515  			break;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  516  		}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18 @517  		txhdr->rts_dur_fb =3D hdr->duration_id;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  518  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  519  		if (rts_rate_ofdm) {
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  520  			extra_ft |=3D B43_TXH_EFT_RTS_OFDM;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  521  			txhdr->phy_rate_rts =3D
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  522  			    b43_plcp_get_ratecode_ofdm(rts_rate);
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  523  		} else {
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  524  			extra_ft |=3D B43_TXH_EFT_RTS_CCK;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  525  			txhdr->phy_rate_rts =3D
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  526  			    b43_plcp_get_ratecode_cck(rts_rate);
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  527  		}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  528  		if (rts_rate_fb_ofdm)
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  529  			extra_ft |=3D B43_TXH_EFT_RTSFB_OFDM;
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  530  		else
eb189d8bc9824b drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-28  531  			extra_ft |=3D B43_TXH_EFT_RTSFB_CCK;
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  532  =

3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  533  		if (rates[0].flags & IEEE80211_TX_RC_USE_RTS_CTS =
&&
694718d8ad2f0b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-10-17  534  		    fill_phy_ctl1) {
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  535  			txhdr->phy_ctl1_rts =3D cpu_to_le16(
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  536  				b43_generate_tx_phy_ctl1(dev, rts_rate));
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  537  			txhdr->phy_ctl1_rts_fb =3D cpu_to_le16(
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  538  				b43_generate_tx_phy_ctl1(dev, rts_rate_fb));
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  539  		}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  540  	}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  541  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  542  	/* Magic cookie */
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  543  	switch (dev->fw.hdr_format) {
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  544  	case B43_FW_HDR_598:
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  545  		txhdr->format_598.cookie =3D cpu_to_le16(cookie);
5d852905561a97 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  546  		break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  547  	case B43_FW_HDR_351:
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  548  		txhdr->format_351.cookie =3D cpu_to_le16(cookie);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  549  		break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  550  	case B43_FW_HDR_410:
2391b7e8d40e4b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  551  		txhdr->format_410.cookie =3D cpu_to_le16(cookie);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  552  		break;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-08-11  553  	}
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  554  =

694718d8ad2f0b drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-10-17  555  	if (fill_phy_ctl1) {
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  556  		txhdr->phy_ctl1 =3D
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  557  			cpu_to_le16(b43_generate_tx_phy_ctl1(dev, rate));
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  558  		txhdr->phy_ctl1_fb =3D
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  559  			cpu_to_le16(b43_generate_tx_phy_ctl1(dev, rate_f=
b));
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  560  	}
3311abbbbff171 drivers/net/wireless/b43/xmit.c          Rafa=C5=82 Mi=C5=82=
ecki   2011-02-25  561  =

e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  562  	/* Apply the bitfields */
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  563  	txhdr->mac_ctl =3D cpu_to_le32(mac_ctl);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  564  	txhdr->phy_ctl =3D cpu_to_le16(phy_ctl);
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  565  	txhdr->extra_ft =3D extra_ft;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  566  =

09552ccd8277e6 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
8-01-23  567  	return 0;
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  568  }
e4d6b7951812d9 drivers/net/wireless/b43/xmit.c          Michael Buesch  200=
7-09-18  569  =


:::::: The code at line 457 was first introduced by commit
:::::: e039fa4a4195ac4ee895e6f3d1334beed63256fe mac80211: move TX info into=
 skb->cb

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1559744013208583723==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
b/E2AgA=
--===============1559744013208583723==--


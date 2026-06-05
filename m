Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D023D7E6
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 05:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780637657; cv=none; b=b1wlW4JKEjqn7HLFTARox+5A18oqawKBQ6lUI+TTFQGFo7AOx2kDAnMA0TI6p5mpBr5vrkNcq4+ot2uBfN9OSAuAc0mQOZRDSZQ3I9RCffOv0lpJyMQJA8hsjwG/FnzdCKXFISkGX3RySfHV1Le/nWyPAqNlPTNT9A98pibmzKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780637657; c=relaxed/simple;
	bh=V5qZTotbVZqIi3WbOGzhwzC5ayxsLaxpl9YiVyDHJv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsRz86vYG3OvGgIJVTHuBPVxe45A7xq1AC+6xlB/9rF9oZIWFH6vByvukf74gVeK4gqLk1ILYX54Moco7Q5gnC75Gs2cU/TvRMlRf+1vlgfzxa2vV1wZcCabK6lRPmt1MwcYqIxyg0xXl+zKgvfjjXFUhZMI5HAKYJ0ckJ49h9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I387eIeU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I387eIeU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b915ded5so11673935e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Jun 2026 22:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780637654; x=1781242454; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37IODtkHh3WkItPEPXTLqKpgBZFLXl0jA8UdpZi3R+c=;
        b=I387eIeUiOED+32K+svTXqGxSsyZ9cdaObeHXjWVNwUvkE+8PaHkp31iPJ1BKGSVx7
         QrR9SPKxN5fJ8Ga1/BMCO/rOmQda80yWPxX/WsQPxbmv/+sMqv0y5+X9dTAVpBih6+Ry
         l7hZ9GPH/4GWYF4q0M6NbD3e1vJ1Pk9iBpSHPDW3FOsi/UqihNyAVAHtToz7u1vx2twU
         kAXrVilXL6ZiKE/1CC/gxzIBAPAJIGb8fsLmZjvA926CCEW6pTUm5Kbzg6dYMI/1H7vC
         ybK7MJCxTmrlYc8fxoOjpwm+hjAVQcIfH6rVAK0nWl9Ps47NKGdMyXgpVa89YX0dsKTV
         6I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780637654; x=1781242454;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37IODtkHh3WkItPEPXTLqKpgBZFLXl0jA8UdpZi3R+c=;
        b=XRch/1xwFIFTt6rVoD6vZ1OutEz+fuo9dxUxdqK+Sb4KQwJFWkRR6nFykJeScdo6Sl
         anUl9poxpSHKXhkMMsaWLG5/R7FaCCKIfpnXfXMXzDPx6xCc4njblLBclWrfvfkhyzQw
         LEQ/b+bxCze7OdM5UoapKSFhFglvkbBeBYpdNlYwY4tgDf5sGTLGX5bs1bXNJ+enjDhY
         SdQeET+UXTf+K/zMRf4NpfHsHVcbkJ2bAh5N/6sRZM9v+M9CBPgr+fO5mX2xjqgm9rv6
         Vqr5sUz9hCmNlC5V2meOK7Vq5+Ek00KAXLy1Lvzl7M7J4s6mgznxoqhRHaq6Szz57u9E
         duyw==
X-Gm-Message-State: AOJu0Yw20tRWGzOeWFLilZsw0Q7IEuN+b7zY4fW/HEagvHXy20rhtRDj
	ZZKbVk62ddbi9SiKAOacIZ12DqP5IOnXJnuvKoR7UNJymLBh1Ts04ZtOGuooAYQh
X-Gm-Gg: Acq92OFV5+E2r81Hzi+8mnkp9o2LJ8mTDMkNl9TLukylzQJ2PMYeeGmusMHs4kKHEjH
	IHSw7EqesKPAVltgqPyiXMrOqhySPux0/il2fLYk/Ub9CaJ8kMMzZ0S+cBhZfVW7sVkabs3ojn3
	f7X6oDeBjauBVp6PLoZy6dfYDLF5D+zrEmMAh23hSXoayQKD8/EHLcsXlF05hZkV5xTTpYHmNdo
	Nbb/5HCW9PgOkThNkHNAZxLMKNRfjkQNUnvctxmTXW3W7yOA6+B8yHRqSzTiJ53AkTviiPxfBNN
	wkoBhyIrSZNL7Gp7id24SOsMWOhEpNdWJDLA6Dg7nDv0tSop6T85J+O8kAPDKMFqxuzcuhxeLNR
	RcYlZ5z04Bi9Hl+fbOEIYn695CgTET4vws9aYg1Y1x5rzCtXxlTvOjHDaBgnh13a6hjrYrMoQdg
	Tqdr9aQRkEUI68gsbVAXOOFaDOPl0yNg==
X-Received: by 2002:a05:600c:34c9:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490c25b3549mr25030335e9.7.1780637653630;
        Thu, 04 Jun 2026 22:34:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm37251852f8f.27.2026.06.04.22.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:34:12 -0700 (PDT)
Date: Fri, 5 Jun 2026 08:34:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-wireless-next-main 5/5]
 drivers/net/wireless/ath/ath12k/wifi7/hw.c:979 ath12k_wifi7_mac_op_tx()
 error: buffer overflow 'ahsta->link' 15 <= 15
Message-ID: <202606051125.XaYVDQZf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260605053408.mB7DGSOcq8lcfHRb9j5z4O4nF1ijGZ4VFWtXEmc-Fug@z>

tree:   https://android.googlesource.com/kernel/common upstream-wireless-next-main
head:   a26c2a22e7e88b2b5afb1349f3994fc564c988b1
commit: 2f57f737dbf3005951a045eb9d1daaff0095f6c1 [5/5] wifi: ath12k: Add support for 4-address mode
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260605/202606051125.XaYVDQZf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606051125.XaYVDQZf-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ath/ath12k/wifi7/hw.c:979 ath12k_wifi7_mac_op_tx() error: buffer overflow 'ahsta->link' 15 <= 15

vim +979 drivers/net/wireless/ath/ath12k/wifi7/hw.c

c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   880  static void ath12k_wifi7_mac_op_tx(struct ieee80211_hw *hw,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   881  				   struct ieee80211_tx_control *control,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   882  				   struct sk_buff *skb)
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   883  {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   884  	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   885  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   886  	struct ieee80211_vif *vif = info->control.vif;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   887  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   888  	struct ath12k_link_vif *arvif = &ahvif->deflink;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   889  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   890  	struct ieee80211_key_conf *key = info->control.hw_key;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   891  	struct ieee80211_sta *sta = control->sta;
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25   892  	struct ath12k_link_sta *arsta = NULL;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   893  	struct ath12k_link_vif *tmp_arvif;
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25   894  	struct ath12k_sta *ahsta = NULL;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   895  	u32 info_flags = info->flags;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   896  	struct sk_buff *msdu_copied;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   897  	struct ath12k *ar, *tmp_ar;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   898  	struct ath12k_pdev_dp *dp_pdev, *tmp_dp_pdev;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   899  	struct ath12k_dp_link_peer *peer;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   900  	unsigned long links_map;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   901  	bool is_mcast = false;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   902  	bool is_dvlan = false;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   903  	struct ethhdr *eth;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   904  	bool is_prb_rsp;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   905  	u16 mcbc_gsn;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   906  	u8 link_id;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   907  	int ret;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   908  	struct ath12k_dp *tmp_dp;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   909  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   910  	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   911  		ieee80211_free_txskb(hw, skb);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   912  		return;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   913  	}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   914  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   915  	link_id = u32_get_bits(info->control.flags, IEEE80211_TX_CTRL_MLO_LINK);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   916  	memset(skb_cb, 0, sizeof(*skb_cb));
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   917  	skb_cb->vif = vif;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   918  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   919  	if (key) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   920  		skb_cb->cipher = key->cipher;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   921  		skb_cb->flags |= ATH12K_SKB_CIPHER_SET;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   922  	}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   923  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   924  	/* handle only for MLO case, use deflink for non MLO case */
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   925  	if (ieee80211_vif_is_mld(vif)) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   926  		link_id = ath12k_mac_get_tx_link(sta, vif, link_id, skb, info_flags);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   927  		if (link_id >= IEEE80211_MLD_MAX_NUM_LINKS) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   928  			ieee80211_free_txskb(hw, skb);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   929  			return;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   930  		}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   931  	} else {
9abf22075da98c drivers/net/wireless/ath/ath12k/wifi7/hw.c Jakub Kicinski      2026-01-22   932  		if (vif->type == NL80211_IFTYPE_P2P_DEVICE)
9abf22075da98c drivers/net/wireless/ath/ath12k/wifi7/hw.c Jakub Kicinski      2026-01-22   933  			link_id = ATH12K_FIRST_SCAN_LINK;

ATH12K_FIRST_SCAN_LINK is 15.

9abf22075da98c drivers/net/wireless/ath/ath12k/wifi7/hw.c Jakub Kicinski      2026-01-22   934  		else
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   935  			link_id = 0;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   936  	}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   937  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   938  	arvif = rcu_dereference(ahvif->link[link_id]);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   939  	if (!arvif || !arvif->ar) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   940  		ath12k_warn(ahvif->ah, "failed to find arvif link id %u for frame transmission",
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   941  			    link_id);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   942  		ieee80211_free_txskb(hw, skb);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   943  		return;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   944  	}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   945  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   946  	ar = arvif->ar;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   947  	skb_cb->link_id = link_id;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   948  	/*
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   949  	 * as skb_cb is common currently for dp and mgmt tx processing
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   950  	 * set this in the common mac op tx function.
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   951  	 */
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   952  	skb_cb->ar = ar;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   953  	is_prb_rsp = ieee80211_is_probe_resp(hdr->frame_control);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   954  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   955  	if (info_flags & IEEE80211_TX_CTL_HW_80211_ENCAP) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   956  		eth = (struct ethhdr *)skb->data;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   957  		is_mcast = is_multicast_ether_addr(eth->h_dest);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   958  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   959  		skb_cb->flags |= ATH12K_SKB_HW_80211_ENCAP;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   960  	} else if (ieee80211_is_mgmt(hdr->frame_control)) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   961  		if (sta && sta->mlo)
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   962  			skb_cb->flags |= ATH12K_SKB_MLO_STA;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   963  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   964  		ret = ath12k_mac_mgmt_tx(ar, skb, is_prb_rsp);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   965  		if (ret) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   966  			ath12k_warn(ar->ab, "failed to queue management frame %d\n",
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   967  				    ret);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   968  			ieee80211_free_txskb(hw, skb);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   969  		}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   970  		return;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   971  	}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   972  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   973  	if (!(info_flags & IEEE80211_TX_CTL_HW_80211_ENCAP))
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   974  		is_mcast = is_multicast_ether_addr(hdr->addr1);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   975  
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25   976  	if (sta) {
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25   977  		ahsta = ath12k_sta_to_ahsta(control->sta);
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25   978  		if (ahsta && ahsta->enable_4addr)
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25  @979  			arsta = rcu_dereference(ahsta->link[link_id]);

But the ahsta->link[] array has 15 elements.

2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25   980  	}
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25   981  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   982  	/* This is case only for P2P_GO */

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


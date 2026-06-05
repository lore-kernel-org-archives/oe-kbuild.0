Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CB23BD25A
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 03:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630338; cv=none; b=Naq5MlMyOJkNY6X7I5L7ZyodxxLX1eTXrCvrap3RrIslBdE6YfllFaOxxKKpzZ8o5wIn+gRosAbKj1IMOaZFX2I8SZJE3o8BBB+jIkOwXVeX716YUlYhOdR6+UmN7kWn2Vi/l29hhNz+xQOyqDUYnIyXJI+bAGLYelnlUHhSI9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630338; c=relaxed/simple;
	bh=SwFswj63cuzrpzJ2KFJ/zNKCYINLQyxI9tERb/LcTHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iPWy64zUfda1DYOv927O64NlYXvL+vaTbZXaYI5W0jgt2fU1UPZZ/CLCdDf2HDuRAWHo+WtCsasYK3I9VzWy/M0DRc9gyoEx38ZMaTrRUkkApMUAJqYdEa5ev6JX8TNJup/+GGBg84VrfRKXiP+WMyOJ9YI1POwlB/+NIYyRVws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRwXjoTs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRwXjoTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780630333; x=1812166333;
  h=date:from:to:cc:subject:message-id;
  bh=SwFswj63cuzrpzJ2KFJ/zNKCYINLQyxI9tERb/LcTHY=;
  b=DRwXjoTsl2FDLo/AiJ4rPNbUWIq1RIb2SlEw2Wx243zrTYOTcOerqT/o
   /BfML2zBtDi/BNKhEzR2mHlPJNsU//4Cg7VEvj8yqi8zzRB1EjBb2Lfdy
   m5bc4Y8+P67eqa5XvFmnNdR21/+X9UjOFgNrjwJyEHgVahX0zeGXgJBWS
   g66NTtGIINS+jtB/9yowDY9PU+fbGAzbQerZOv43z6qkAW0SznAAZlVRM
   HZ8PGIDbWdLBFN84a1tSMa63PvqahK95LSyTEMBdnsbqE6y8ittSVr2LB
   JM8j5Z1KMtYZT7jqqjKcvyO3Wtf8hGmMl+vqCcJChsKcHUfNMULQBCDH2
   w==;
X-CSE-ConnectionGUID: lNRTMEPpT5m1R/hS+KCEDg==
X-CSE-MsgGUID: WHIcNY+SQ8uJ2C3jkudKgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92573607"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92573607"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 20:32:12 -0700
X-CSE-ConnectionGUID: 81vSCY/IToSk8iE0NkUjZA==
X-CSE-MsgGUID: HgpwHX6hRoWx5iE5Qg/zvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249826871"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jun 2026 20:32:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVLI0-00000000FVe-1aJd;
	Fri, 05 Jun 2026 03:32:08 +0000
Date: Fri, 05 Jun 2026 11:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:upstream-wireless-next-main 5/5]
 drivers/net/wireless/ath/ath12k/wifi7/hw.c:979 ath12k_wifi7_mac_op_tx()
 error: buffer overflow 'ahsta->link' 15 <= 15
Message-ID: <202606051125.XaYVDQZf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common upstream-wireless-next-main
head:   a26c2a22e7e88b2b5afb1349f3994fc564c988b1
commit: 2f57f737dbf3005951a045eb9d1daaff0095f6c1 [5/5] wifi: ath12k: Add support for 4-address mode
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
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
drivers/net/wireless/ath/ath12k/wifi7/hw.c:979 ath12k_wifi7_mac_op_tx() error: buffer overflow 'ahsta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/wifi7/hw.c:979 ath12k_wifi7_mac_op_tx() error: buffer overflow 'ahsta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/wifi7/hw.c:979 ath12k_wifi7_mac_op_tx() error: buffer overflow 'ahsta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/wifi7/hw.c:979 ath12k_wifi7_mac_op_tx() error: buffer overflow 'ahsta->link' 15 <= 15

vim +979 drivers/net/wireless/ath/ath12k/wifi7/hw.c

d889913205cf7e drivers/net/wireless/ath/ath12k/hw.c       Kalle Valo          2022-11-28   878  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   879  /* Note: called under rcu_read_lock() */
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
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25   980  	}
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25   981  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   982  	/* This is case only for P2P_GO */
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   983  	if (vif->type == NL80211_IFTYPE_AP && vif->p2p)
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   984  		ath12k_mac_add_p2p_noa_ie(ar, vif, skb, is_prb_rsp);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   985  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   986  	dp_pdev = ath12k_dp_to_pdev_dp(ar->ab->dp, ar->pdev_idx);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   987  	if (!dp_pdev) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   988  		ieee80211_free_txskb(hw, skb);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   989  		return;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   990  	}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   991  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   992  	/* Checking if it is a DVLAN frame */
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   993  	if (!test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   994  	    !(skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) &&
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   995  	    !(skb_cb->flags & ATH12K_SKB_CIPHER_SET) &&
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   996  	    ieee80211_has_protected(hdr->frame_control))
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   997  		is_dvlan = true;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   998  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03   999  	if (!vif->valid_links || !is_mcast || is_dvlan ||
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1000  	    (skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) ||
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1001  	    test_bit(ATH12K_FLAG_RAW_MODE, &ar->ab->dev_flags)) {
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25  1002  		ret = ath12k_wifi7_dp_tx(dp_pdev, arvif, arsta, skb, false, 0, is_mcast);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1003  		if (unlikely(ret)) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1004  			ath12k_warn(ar->ab, "failed to transmit frame %d\n", ret);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1005  			ieee80211_free_txskb(ar->ah->hw, skb);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1006  			return;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1007  		}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1008  	} else {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1009  		mcbc_gsn = atomic_inc_return(&ahvif->dp_vif.mcbc_gsn) & 0xfff;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1010  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1011  		links_map = ahvif->links_map;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1012  		for_each_set_bit(link_id, &links_map,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1013  				 IEEE80211_MLD_MAX_NUM_LINKS) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1014  			tmp_arvif = rcu_dereference(ahvif->link[link_id]);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1015  			if (!tmp_arvif || !tmp_arvif->is_up)
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1016  				continue;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1017  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1018  			tmp_ar = tmp_arvif->ar;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1019  			tmp_dp_pdev = ath12k_dp_to_pdev_dp(tmp_ar->ab->dp,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1020  							   tmp_ar->pdev_idx);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1021  			if (!tmp_dp_pdev)
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1022  				continue;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1023  			msdu_copied = skb_copy(skb, GFP_ATOMIC);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1024  			if (!msdu_copied) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1025  				ath12k_err(ar->ab,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1026  					   "skb copy failure link_id 0x%X vdevid 0x%X\n",
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1027  					   link_id, tmp_arvif->vdev_id);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1028  				continue;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1029  			}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1030  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1031  			ath12k_mlo_mcast_update_tx_link_address(vif, link_id,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1032  								msdu_copied,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1033  								info_flags);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1034  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1035  			skb_cb = ATH12K_SKB_CB(msdu_copied);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1036  			skb_cb->link_id = link_id;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1037  			skb_cb->vif = vif;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1038  			skb_cb->ar = tmp_ar;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1039  
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25  1040  			if (ahsta && ahsta->enable_4addr)
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25  1041  				arsta = rcu_dereference(ahsta->link[link_id]);
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25  1042  			else
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25  1043  				arsta = NULL;
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25  1044  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1045  			/* For open mode, skip peer find logic */
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1046  			if (unlikely(!ahvif->dp_vif.key_cipher))
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1047  				goto skip_peer_find;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1048  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1049  			tmp_dp = ath12k_ab_to_dp(tmp_ar->ab);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1050  			spin_lock_bh(&tmp_dp->dp_lock);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1051  			peer = ath12k_dp_link_peer_find_by_addr(tmp_dp,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1052  								tmp_arvif->bssid);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1053  			if (!peer || !peer->dp_peer) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1054  				spin_unlock_bh(&tmp_dp->dp_lock);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1055  				ath12k_warn(tmp_ar->ab,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1056  					    "failed to find peer for vdev_id 0x%X addr %pM link_map 0x%X\n",
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1057  					    tmp_arvif->vdev_id, tmp_arvif->bssid,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1058  					    ahvif->links_map);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1059  				dev_kfree_skb_any(msdu_copied);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1060  				continue;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1061  			}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1062  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1063  			key = peer->dp_peer->keys[peer->dp_peer->mcast_keyidx];
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1064  			if (key) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1065  				skb_cb->cipher = key->cipher;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1066  				skb_cb->flags |= ATH12K_SKB_CIPHER_SET;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1067  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1068  				hdr = (struct ieee80211_hdr *)msdu_copied->data;
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1069  				if (!ieee80211_has_protected(hdr->frame_control))
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1070  					hdr->frame_control |=
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1071  						cpu_to_le16(IEEE80211_FCTL_PROTECTED);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1072  			}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1073  			spin_unlock_bh(&tmp_dp->dp_lock);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1074  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1075  skip_peer_find:
2f57f737dbf300 drivers/net/wireless/ath/ath12k/wifi7/hw.c Tamizh Chelvam Raja 2026-05-25  1076  			ret = ath12k_wifi7_dp_tx(tmp_dp_pdev, tmp_arvif, arsta,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1077  						 msdu_copied, true, mcbc_gsn, is_mcast);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1078  			if (unlikely(ret)) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1079  				if (ret == -ENOMEM) {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1080  					/* Drops are expected during heavy multicast
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1081  					 * frame flood. Print with debug log
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1082  					 * level to avoid lot of console prints
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1083  					 */
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1084  					ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1085  						   "failed to transmit frame %d\n",
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1086  						   ret);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1087  				} else {
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1088  					ath12k_warn(ar->ab,
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1089  						    "failed to transmit frame %d\n",
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1090  						    ret);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1091  				}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1092  
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1093  				dev_kfree_skb_any(msdu_copied);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1094  			}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1095  		}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1096  		ieee80211_free_txskb(ar->ah->hw, skb);
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1097  	}
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1098  }
c26f294fef2a4b drivers/net/wireless/ath/ath12k/wifi7/hw.c Ripan Deuri         2025-11-03  1099  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

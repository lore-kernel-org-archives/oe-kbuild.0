Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD9D443C31
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309970; cv=none; b=AXzHHXu1ui5ovboCJE8Mb4teceBHqKFBttpDXF6ocSdOBo7dItV/ZcLKHIilwQdYKvqtImLYv94VhK/pcs2B66e3/5Lm7jiIfMqgisX+ESd+ng9MNqPFQDjY7IiUSpj1Gnb5v7n/GVbEOjg5B+OSCF633/baCMJxt9BwbqijKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309970; c=relaxed/simple;
	bh=qLWN32O6Z9eivS3f1dz71VLZHkrN8bx47TwWs3MK8is=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rxDp0eytMCbVXQfUbZcd5wno6gM9KWy2chDBSbsON2f8YNq894VTjRpJcTnMNnVHAGj9wUCmGG536ZZ+brIslW4SVvg0yXWPrn+sY6cV/zT4biw8RE24BuNHSby4yVrOZ2hIImbi8QYRYMni12TYK3m27MyMbFegCeV+CFmJt6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1oHWLWp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1oHWLWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309969; x=1823845969;
  h=date:from:to:cc:subject:message-id;
  bh=qLWN32O6Z9eivS3f1dz71VLZHkrN8bx47TwWs3MK8is=;
  b=P1oHWLWpoim1I8j4+Kqvr1RaVi4sdfh8TsJpWYcDcyH5+BTZu0exoAOQ
   IpHG9lA61KyaaEpvxvqoASa/J/YrSBGWL8CemFb9dUo9BnjvyzPzVOI70
   opy5QpnLEFF/yW6aStcKDDmpUtGZ8B7tXUX5qoqrYPzSnUvIuqBI2XRwU
   CpOInMwcQJ30/I8QYcQiF6maKKTiALzaoHesQZOuCy+v4AjgL4Z2CQ5UK
   JKqd78ie+3agstsY+bboiO8ByynqoY0/oW5cVjdcagfAv2LALE7II1nXr
   25fa7KCbLJgoTDAFD3t+VCMQpPOGVHp5tgvTgoAz4g/VcbbvxxApSI3jC
   A==;
X-CSE-ConnectionGUID: zWwN3ta9RJqnyF75OGSYXA==
X-CSE-MsgGUID: +Gk46hKYSoq8Ss+d7rTj2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916702"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916702"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:40 -0700
X-CSE-ConnectionGUID: SoNVG47yQ7CLnoBnpY+BDw==
X-CSE-MsgGUID: zpJosBf2RwaaCrojOjRzKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340808"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh2-000000004xB-3hTN;
	Sun, 18 Oct 2026 07:52:32 +0000
Date: Sun, 18 Oct 2026 09:49:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13462/18293]
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:2488
 mt7925_mcu_uni_add_beacon_offload() error: __builtin_memcpy()
 'req.beacon_tlv.pkt' too small (510 vs 512)
Message-ID: <202610172141.mmRmGqow-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anthony Liu <anthony.liu@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
commit: d4e5ca3483a0ce95ff8417e16d42af99f7a98da4 [13462/18293] wifi: mt76: mt7928: makes struct beacon_tlv 4-byte aligned.
:::::: branch date: 30 hours ago
:::::: commit date: 10 days ago
config: m68k-randconfig-r2201-20261017 (https://download.01.org/0day-ci/archive/20261017/202610172141.mmRmGqow-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610172141.mmRmGqow-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:2488 mt7925_mcu_uni_add_beacon_offload() error: __builtin_memcpy() 'req.beacon_tlv.pkt' too small (510 vs 512)

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:1466 mt7925_mcu_set_mlo_roc() warn: variable dereferenced before check 'mconf' (see line 1431)

vim +2488 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

c948b5da6bbec7 Deren Wu    2023-09-18  2415  
c948b5da6bbec7 Deren Wu    2023-09-18  2416  int
c948b5da6bbec7 Deren Wu    2023-09-18  2417  mt7925_mcu_uni_add_beacon_offload(struct mt792x_dev *dev,
c948b5da6bbec7 Deren Wu    2023-09-18  2418  				  struct ieee80211_hw *hw,
c948b5da6bbec7 Deren Wu    2023-09-18  2419  				  struct ieee80211_vif *vif,
c948b5da6bbec7 Deren Wu    2023-09-18  2420  				  bool enable)
c948b5da6bbec7 Deren Wu    2023-09-18  2421  {
c948b5da6bbec7 Deren Wu    2023-09-18  2422  	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
c948b5da6bbec7 Deren Wu    2023-09-18  2423  	struct ieee80211_mutable_offsets offs;
c948b5da6bbec7 Deren Wu    2023-09-18  2424  	struct {
c948b5da6bbec7 Deren Wu    2023-09-18  2425  		struct req_hdr {
c948b5da6bbec7 Deren Wu    2023-09-18  2426  			u8 bss_idx;
c948b5da6bbec7 Deren Wu    2023-09-18  2427  			u8 pad[3];
c948b5da6bbec7 Deren Wu    2023-09-18  2428  		} __packed hdr;
c948b5da6bbec7 Deren Wu    2023-09-18  2429  		struct bcn_content_tlv {
d4e5ca3483a0ce Anthony Liu 2026-10-05  2430  			/* DW 0 */
c948b5da6bbec7 Deren Wu    2023-09-18  2431  			__le16 tag;
c948b5da6bbec7 Deren Wu    2023-09-18  2432  			__le16 len;
d4e5ca3483a0ce Anthony Liu 2026-10-05  2433  			/* DW 1 */
c948b5da6bbec7 Deren Wu    2023-09-18  2434  			__le16 tim_ie_pos;
c948b5da6bbec7 Deren Wu    2023-09-18  2435  			__le16 csa_ie_pos;
d4e5ca3483a0ce Anthony Liu 2026-10-05  2436  			/* DW 2 */
c948b5da6bbec7 Deren Wu    2023-09-18  2437  			__le16 bcc_ie_pos;
c948b5da6bbec7 Deren Wu    2023-09-18  2438  			/* 0: disable beacon offload
c948b5da6bbec7 Deren Wu    2023-09-18  2439  			 * 1: enable beacon offload
c948b5da6bbec7 Deren Wu    2023-09-18  2440  			 * 2: update probe respond offload
c948b5da6bbec7 Deren Wu    2023-09-18  2441  			 */
c948b5da6bbec7 Deren Wu    2023-09-18  2442  			u8 enable;
c948b5da6bbec7 Deren Wu    2023-09-18  2443  			/* 0: legacy format (TXD + payload)
c948b5da6bbec7 Deren Wu    2023-09-18  2444  			 * 1: only cap field IE
c948b5da6bbec7 Deren Wu    2023-09-18  2445  			 */
c948b5da6bbec7 Deren Wu    2023-09-18  2446  			u8 type;
d4e5ca3483a0ce Anthony Liu 2026-10-05  2447  			/* DW 3~130 */
c948b5da6bbec7 Deren Wu    2023-09-18  2448  			__le16 pkt_len;
d4e5ca3483a0ce Anthony Liu 2026-10-05  2449  			u8 pkt[510];
c948b5da6bbec7 Deren Wu    2023-09-18  2450  		} __packed beacon_tlv;
c948b5da6bbec7 Deren Wu    2023-09-18  2451  	} req = {
c948b5da6bbec7 Deren Wu    2023-09-18  2452  		.hdr = {
30e89baeb01fc7 Deren Wu    2024-06-12  2453  			.bss_idx = mvif->bss_conf.mt76.idx,
c948b5da6bbec7 Deren Wu    2023-09-18  2454  		},
c948b5da6bbec7 Deren Wu    2023-09-18  2455  		.beacon_tlv = {
c948b5da6bbec7 Deren Wu    2023-09-18  2456  			.tag = cpu_to_le16(UNI_BSS_INFO_BCN_CONTENT),
c948b5da6bbec7 Deren Wu    2023-09-18  2457  			.len = cpu_to_le16(sizeof(struct bcn_content_tlv)),
c948b5da6bbec7 Deren Wu    2023-09-18  2458  			.enable = enable,
c948b5da6bbec7 Deren Wu    2023-09-18  2459  			.type = 1,
c948b5da6bbec7 Deren Wu    2023-09-18  2460  		},
c948b5da6bbec7 Deren Wu    2023-09-18  2461  	};
c948b5da6bbec7 Deren Wu    2023-09-18  2462  	struct sk_buff *skb;
c948b5da6bbec7 Deren Wu    2023-09-18  2463  	u8 cap_offs;
c948b5da6bbec7 Deren Wu    2023-09-18  2464  
c948b5da6bbec7 Deren Wu    2023-09-18  2465  	/* support enable/update process only
c948b5da6bbec7 Deren Wu    2023-09-18  2466  	 * disable flow would be handled in bss stop handler automatically
c948b5da6bbec7 Deren Wu    2023-09-18  2467  	 */
c948b5da6bbec7 Deren Wu    2023-09-18  2468  	if (!enable)
c948b5da6bbec7 Deren Wu    2023-09-18  2469  		return -EOPNOTSUPP;
c948b5da6bbec7 Deren Wu    2023-09-18  2470  
c948b5da6bbec7 Deren Wu    2023-09-18  2471  	skb = ieee80211_beacon_get_template(mt76_hw(dev), vif, &offs, 0);
c948b5da6bbec7 Deren Wu    2023-09-18  2472  	if (!skb)
c948b5da6bbec7 Deren Wu    2023-09-18  2473  		return -EINVAL;
c948b5da6bbec7 Deren Wu    2023-09-18  2474  
c948b5da6bbec7 Deren Wu    2023-09-18  2475  	cap_offs = offsetof(struct ieee80211_mgmt, u.beacon.capab_info);
c948b5da6bbec7 Deren Wu    2023-09-18  2476  	if (!skb_pull(skb, cap_offs)) {
c948b5da6bbec7 Deren Wu    2023-09-18  2477  		dev_err(dev->mt76.dev, "beacon format err\n");
c948b5da6bbec7 Deren Wu    2023-09-18  2478  		dev_kfree_skb(skb);
c948b5da6bbec7 Deren Wu    2023-09-18  2479  		return -EINVAL;
c948b5da6bbec7 Deren Wu    2023-09-18  2480  	}
c948b5da6bbec7 Deren Wu    2023-09-18  2481  
c948b5da6bbec7 Deren Wu    2023-09-18  2482  	if (skb->len > 512) {
c948b5da6bbec7 Deren Wu    2023-09-18  2483  		dev_err(dev->mt76.dev, "beacon size limit exceed\n");
c948b5da6bbec7 Deren Wu    2023-09-18  2484  		dev_kfree_skb(skb);
c948b5da6bbec7 Deren Wu    2023-09-18  2485  		return -EINVAL;
c948b5da6bbec7 Deren Wu    2023-09-18  2486  	}
c948b5da6bbec7 Deren Wu    2023-09-18  2487  
c948b5da6bbec7 Deren Wu    2023-09-18 @2488  	memcpy(req.beacon_tlv.pkt, skb->data, skb->len);
c948b5da6bbec7 Deren Wu    2023-09-18  2489  	req.beacon_tlv.pkt_len = cpu_to_le16(skb->len);
c948b5da6bbec7 Deren Wu    2023-09-18  2490  	offs.tim_offset -= cap_offs;
c948b5da6bbec7 Deren Wu    2023-09-18  2491  	req.beacon_tlv.tim_ie_pos = cpu_to_le16(offs.tim_offset);
c948b5da6bbec7 Deren Wu    2023-09-18  2492  
c948b5da6bbec7 Deren Wu    2023-09-18  2493  	if (offs.cntdwn_counter_offs[0]) {
c948b5da6bbec7 Deren Wu    2023-09-18  2494  		u16 csa_offs;
c948b5da6bbec7 Deren Wu    2023-09-18  2495  
c948b5da6bbec7 Deren Wu    2023-09-18  2496  		csa_offs = offs.cntdwn_counter_offs[0] - cap_offs - 4;
c948b5da6bbec7 Deren Wu    2023-09-18  2497  		req.beacon_tlv.csa_ie_pos = cpu_to_le16(csa_offs);
c948b5da6bbec7 Deren Wu    2023-09-18  2498  	}
c948b5da6bbec7 Deren Wu    2023-09-18  2499  	dev_kfree_skb(skb);
c948b5da6bbec7 Deren Wu    2023-09-18  2500  
c948b5da6bbec7 Deren Wu    2023-09-18  2501  	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(BSS_INFO_UPDATE),
c948b5da6bbec7 Deren Wu    2023-09-18  2502  				 &req, sizeof(req), true);
c948b5da6bbec7 Deren Wu    2023-09-18  2503  }
c948b5da6bbec7 Deren Wu    2023-09-18  2504  

:::::: The code at line 2488 was first introduced by commit
:::::: c948b5da6bbec742b433138e3e3f9537a85af2e5 wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips

:::::: TO: Deren Wu <deren.wu@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

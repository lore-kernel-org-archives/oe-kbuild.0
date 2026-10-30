Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793321387;
	b=K5yTePahNSCX6c1AL18QC7k3F2aq7EfVbLEG/a3keVgVtRxWoTnzau9Abm0WP1ksuf7Z
	 B/WU+7itgPT7tKiLlKQpH8JZQc0zQXtSKBX+59O68P+ZYErM7HMS3ifQXVtwYdXwcqQXI
	 4cEMCeYMhB+TwtULqVyLkIgI4j8QVOPxA/aNDVVhR80HGQDfXZ6abu8D1qCr3w9iwFSOe
	 4jaj1YULhv6fuaewznvjkKJvsds0zD/4g91fzjexlSfaHMr50xR6TvJ4cS3AwwZvt7LTs
	 uQUEh3eHKabCURcOwkcS+K8YlZ0NLxp5i8jZbkIyrD8DV2QJKaUq6m3mqbEeQxWmWEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793321387;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8ksMlNRFTgMomq2fa1xZaDperIT89K5u34p296bB1gA=;
	b=alg8HvQ4W73e2edef5DJz0g7VdOIfHqc010Km6S0HKXsMj3Vlo1P4YIQYBxELri2ZWUl
	 ToYf8q66NsccMt33+vIcs+XCmnpB9VZQGcgB6G9ICtReR4weiWNMSBBsR0cuL+VSUDA0y
	 SwFxScHLDPjaWNC1lQOMy6IOTXFhwZlKmc2Zp2LxoiIK8Cu7RJ2DokOjVTNkEwzmWxCxG
	 VuCVUzoSCapy7BoDJEJM6xMeA3UG3NT7n7ODk3l8yxn0BPr5i5ERdTef+EgwHugSLubYr
	 2Hig6QLGDWFbNprzFdDoYwatI1y0pKFdI5L+K7si+3QRD9YW7riSuFZqMdUQeuejDqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="gE58Bh/R";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39BD606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Oct 2026 00:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F39BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gE58Bh/R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793321386; x=1824857386;
  h=date:from:to:cc:subject:message-id;
  bh=xW03gX/cBf7l9q4lDVzsz4vU3a6Ba27jgeCOzaMnXMw=;
  b=gE58Bh/RWBxmRGonnxp4DaQessGrL+OJ+G2fXmI074kIy2q05BQzTaj+
   4QPWb2h2d3yub8cXQmlr8l9owfKtwyuFH02K+1UhXM9c0CYA9pM41xABf
   3eTEuorkVyn7HP9Uw0t8KgreLuy6z2hN0e7sOZPazUZpHx9C5RAT+jP4L
   +iMThWc8XP7Ex9wpcBMbJFu+cidGX8F4/tvmNZ/uNpYrRWLSXkOzubTd8
   /bdarxaG/jlGgRbqvz2dngdD4yQeQMbW0bzONqzlqJW3LYiq5WjwwXA62
   1K54QiDVy2TNWc27kI/xNQDpeqGF2f+y4OZs02VBBl3AbmcKsIfgmv0sm
   w==;
X-CSE-ConnectionGUID: kIEORLZLRJahy3Uk6fYOJw==
X-CSE-MsgGUID: mcZR2HahTWeBl3CLXZxcXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1993224"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1993224"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 17:49:46 -0700
X-CSE-ConnectionGUID: MJO9QYSQQtqphA4fdO2f+w==
X-CSE-MsgGUID: MRn4XrBlT3KLfdFxqpFanQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5699448"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2026 17:49:45 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMaoP-000000005Qz-3vqn;
	Fri, 30 Oct 2026 00:49:41 +0000
Date: Fri, 30 Oct 2026 01:49:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:2488
 mt7925_mcu_uni_add_beacon_offload() error: __memcpy() 'req.beacon_tlv.pkt'
 too small (510 vs 512)
Message-ID: <202610300148.1vEvYAp3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anthony Liu <anthony.liu@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d89e1d186ec9271bf78e62771779e9fc03bf0fc3
commit: d4e5ca3483a0ce95ff8417e16d42af99f7a98da4 wifi: mt76: mt7928: makes struct beacon_tlv 4-byte aligned.
date:   3 weeks ago
:::::: branch date: 42 minutes ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r2201-20261029 (https://download.01.org/0day-ci/archive/20261030/202610300148.1vEvYAp3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d4e5ca3483a0 ("wifi: mt76: mt7928: makes struct beacon_tlv 4-byte aligned.")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610300148.1vEvYAp3-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:2488 mt7925_mcu_uni_add_beacon_offload() error: __memcpy() 'req.beacon_tlv.pkt' too small (510 vs 512)

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

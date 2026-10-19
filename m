Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A47494828
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397662; cv=none; b=UpdicZ11UJWjw4rrq7CiYwLWhiNZKpR9t0Zs4HrLTzk31joPVrP0mbp+VFXtDsREiT1/exiXvrRjg9YO0bXk+OPOlfSUdaR8ubziIb5NPFQjHypbVZZMn6XIdoq6we3GMMFnTLIDI5/PKSHurGSrcgNY+qrvwJ2WVA+dh86YExQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397662; c=relaxed/simple;
	bh=FNPpJhoZHXg84cSDu46rqfnqf0QBzuiIOiLaiCNSMJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ibew42ekGh7h+t4rNShsJJIEv+lWX8hQKMz5VQR14SVFoxQRrOyld6aWUhhM/o2hHlY4Gb59WnW57YECowGvk2ocTPoxlO5m3Mq6R/an/MmjigdxoqRD6wF80j1T7G3f+GCqiHAltlMimgilqYlHDypouwjMhoJY4Vmkp/V6gmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWlB/sfL; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWlB/sfL"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1024697f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 01:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397659; x=1793002459; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwFP/qNqnJhOIec8+p02d7LZbx3mWdFlZsC8wkltnaE=;
        b=IWlB/sfL94mrWIGCy0RGjV0DWvTCnkeGg9uVGh8/xCtVAYRLLOELtAfp0pQgrvzooy
         myg+xKmLY9G9s7UtHXnFyNvx5Es3Ogv2WwpLFNJkQvzwpdfRnZwzKfSIdcQqG5+wOut4
         buYOC2S/ffiTX7s56UdUcrMpkoQnnhq+HFPFLqyPZcQNYLNLvcx+66ZsJOOpPcmV2j9E
         5IuZc6obuDzt0G4bdIb3X+hHPObwEKhKj/N5lxL+Nbco6zE1OoVWOZ/Ex9tOZJ97OnF6
         7SYJSA97AJhInKIsLeBrt7WxlHkycymKPW8eWnkNInZAR9H2eCVJc4Bk6TXZPEkQkeqr
         uPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397659; x=1793002459;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwFP/qNqnJhOIec8+p02d7LZbx3mWdFlZsC8wkltnaE=;
        b=j6vU+kDiSVP7qVr6a/HvCTTPuRxRG+CsNtPuhQ/Jl539EYPfmmyrw67ftlGK8I8GwF
         AmIHikBShitPDkJR069q3+sDbaswe66OuFH/TKpGMaZVl0f1ynQjwl9NClTL2WLUnqLZ
         cOufY3b+n8F/ooS31tJD9QM/IEWImDPEpPS0dnQ+i0ZQ9+ZrPLgUcwMQ9Xbcjyb0jBbm
         LQ4K02y68MJu8yC/aHJ8c2T2LW7xFLSQolbghepHWD0A+IM3oYQm2n/98bv1NO5J2cMW
         nhSqSDj65MIwmZOacHY5GB7j0T/jMaCfPdaSOvKeSa/xsh77hXyAIpSpYk5XwEmi1/z7
         Nzdg==
X-Gm-Message-State: AFq9FYJbrDPOCrzrHrumG9G8lLOO3SI6CGXDk3snfULXovzxlOEUPODt
	uCIzgXVoYsAyUunNC80WcJF8pX1cm1Ec37Ey49z+kQQxIJpcrjKZO5j4Zltj1ED9dCMGC60F
X-Gm-Gg: AYBFou29W11c5kjnDnApHjuSPxmTe5Z2JpmeVUqF+9bYFvQfHsCXkNMvvUDeFPDDy2n
	stmLPsSjVVqCyvbqsLr9RzuaTZ3nrf1UTZ5sOXToiQptiKqRgSkBL7lScD1XSaqUd8lMCrInAwo
	f4F/EBnRu9sTmp7LykJeiXY23eJ14QIavJ3R2A1ckNoWEKTZD/4nHZCf90nc0sZjpyf6xcn5xIZ
	6sZ4O7Ip6dLzN4tG6RbZikjCyKINc1ZbzVsCAdH/yHr91aFwucmZ/cuNggf2fKeMvAzPxMg5BXZ
	UR1TQHGZtb5lGTpO7F2hPh5DmT5niD4/na419fT+ZZG7Wbnl3uny76Td81EhSIh95EUV+KiXBjh
	bnkABdsmn842IRT+ojUCwHr5kFIUEQG3Eo3rnf8Of7Gsfepxx581g56jVT8af3TkUwbn3ujgqzY
	jHMagW6iCauRfZ1C/gP6u6Bp3bGj3Pr8NVNHgd0RPNUyAdmGF5IoK3OxAKA/J2XSmUfg0=
X-Received: by 2002:a05:6000:29cc:b0:48c:43a3:6a74 with SMTP id ffacd0b85a97d-48e07bbd250mr8729676f8f.12.1792397658509;
        Mon, 19 Oct 2026 01:14:18 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bd9sm22482916f8f.35.2026.10.19.01.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:14:17 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:14:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Anthony Liu <anthony.liu@mediatek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>
Subject: [linux-next:master 13462/18293]
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:2488
 mt7925_mcu_uni_add_beacon_offload() error: __builtin_memcpy()
 'req.beacon_tlv.pkt' too small (510 vs 512)
Message-ID: <atXRVRc2T414bLiM@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
commit: d4e5ca3483a0ce95ff8417e16d42af99f7a98da4 [13462/18293] wifi: mt76: mt7928: makes struct beacon_tlv 4-byte aligned.
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

vim +2488 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

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

510 bytes.

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
                                                               ^^^
512 bytes

c948b5da6bbec7 Deren Wu    2023-09-18  2483  		dev_err(dev->mt76.dev, "beacon size limit exceed\n");
c948b5da6bbec7 Deren Wu    2023-09-18  2484  		dev_kfree_skb(skb);
c948b5da6bbec7 Deren Wu    2023-09-18  2485  		return -EINVAL;
c948b5da6bbec7 Deren Wu    2023-09-18  2486  	}
c948b5da6bbec7 Deren Wu    2023-09-18  2487  
c948b5da6bbec7 Deren Wu    2023-09-18 @2488  	memcpy(req.beacon_tlv.pkt, skb->data, skb->len);

2 byte overflow.

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


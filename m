Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5C72AE94
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 09:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156333; cv=none; b=b+rb76CxXkDEhhd3yuCQ8cdOkEKR4PMgreD+QyLHf+WkSehHjF4tCtgpWcDqYkyJYf1ak9N5lrDkYj+LnTZzmUChQbZ5+euPUboD8wCuVY6l9NYb8WSxmNl5GGPjPKgeiYUnXKmZH1IhBpP6TBdKoz1IFqgw3+rDbprmubllZ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156333; c=relaxed/simple;
	bh=7NiZGVok+cOKm7/zFisCEPdz011Mi/UzYrAe5JXeTys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LkcUK+9HqRhR9RyxhsAzyKJQwRHlZOetP24FWGkiHDjQr3O8X1ofu3zBl1th74flrBZjeGDR2x8k0g+auigJolvQBXwE794FrEG4N1nVFcjVDdLT8Bm1QVx5OU6VGtPtJWA84nrAp8RKKHsA4TS2IqOdVZLHul1+lTYamiJSAJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fE0yVKV+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fE0yVKV+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43618283dedso140976955e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 01:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736156329; x=1736761129; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ERu+1pd3NkzrZKSH0UIzKlXmBDroHkPG5tJoiWKzv4=;
        b=fE0yVKV+8XxBTF63MvymT5U+IYidtqGkcz5L8jyZJ2cd5VDHTQ5MIK0qv+GjhOtGAz
         F7yDfcnEK80Wmqly4wwLWInb04wSuSmj4ciA4pQrPw4yJdbk4krvAN7tOuBdeo4WpA23
         IzFJS5s0fKMs5Ri7FyWXeC2tfIAooHV+jVS+aIjE+Eswr+bDzBCBzlknGDbqw1ehmzc2
         EzDQz4eyiUq2l8Cyc/AqsRlq7dsENAcvmej2/Ly4QvdrktZG2VqdvtbyPX4sa9lte/Ry
         58og4JjGgss8sOsXljTtQSgmudIbbGjVIHeYvGQn5zYm6W35W1avyO0qkD9qxK700577
         wR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156329; x=1736761129;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ERu+1pd3NkzrZKSH0UIzKlXmBDroHkPG5tJoiWKzv4=;
        b=bWetog3rcUoqzZdX3VudQC/bhyQr51Y8EsCuoNtGud+3Eas2FKGiFwx6csayP2wEC1
         ECOPn35va//p+c/JuVCGWJiu3w6DJZilvfWdh8ekNMAqXgkzka+rab+jeMCUoGOv+pdz
         kSDIMESnlGyFgFnsXMxZzSVLlhVvKD1XvswUxUjWGFUjblXjfpZZEAOKvslMulzogMnF
         OpuZCY7F1wpbb+BL7ZS5Lmt/UY5m1yElnP+4AMLMJxPn3m+seUI5wHi4LRRI+N7H2t+l
         o2SAdN/VFJztPvfxjPoGOHsgx6UDSd/xzhbgDKCyVTDxEVAk88JSHwDXWfutqlcSkCMi
         607g==
X-Gm-Message-State: AOJu0YxouEGn/bR6hpGVkCx0PukF26HpAfrS5lkP7qxRet14WJEGOQrY
	VU1cV30jKkHN2BIM1gz0nCzazS6QLExsjKPWCfCzQ1Cxxx+Nrtee26k/R/YkJmOx7fIEdM/uYon
	6
X-Gm-Gg: ASbGncsGx8N2LSgVixgP3fvlquSBwHZ5Cm7BNMjkAhERcJhL3i/tymuY0l8G3I7JOlV
	/8Eq72rriF9yJy9Opw8H9keCWx9kePcia2rkOTO7eqMDMEePvt8VVwljeCC60NKX05ifQj9mBjH
	5SVNgihnIhZcugcAPHH3WqKunpzjhWMnX05YAwdr6QamrLPdFZzbs/KHU40qJqQc45W2FDx8Vul
	bp/lwy+C5f12d1cOeI8mtHyeHoutKibi5/z4YGGG2TLkWLPfU20dnZtPQOdRg==
X-Google-Smtp-Source: AGHT+IGajCIBd++u5KMe7mnENnKBvfobcIcM8AKqqqMwcNB6akdjPVH1PN966+eXGu6LkPwfGAerEA==
X-Received: by 2002:a05:600c:4688:b0:435:1b:65ee with SMTP id 5b1f17b1804b1-43668b47ff2mr440998655e9.24.1736156329204;
        Mon, 06 Jan 2025 01:38:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea423sm569633575e9.2.2025.01.06.01.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:38:48 -0800 (PST)
Date: Mon, 6 Jan 2025 12:38:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/mediatek/mt76/mt7915/main.c:283
 mt7915_add_interface() warn: inconsistent returns '&dev->mt76.mutex'.
Message-ID: <01b506dc-d572-4d1c-b206-8de15ab380bf@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bbf9020becbfd8fc2c3da790855b7042fad455b
commit: f3049b88b2b32326df97461813ae73e8bbc296fc wifi: mt76: mt7915: allocate vif wcid in the same range as stations
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231734.srK9iuag-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412231734.srK9iuag-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7915/main.c:283 mt7915_add_interface() warn: inconsistent returns '&dev->mt76.mutex'.

vim +283 drivers/net/wireless/mediatek/mt76/mt7915/main.c

e57b7901469fc0b Ryder Lee        2020-04-25  204  static int mt7915_add_interface(struct ieee80211_hw *hw,
e57b7901469fc0b Ryder Lee        2020-04-25  205  				struct ieee80211_vif *vif)
e57b7901469fc0b Ryder Lee        2020-04-25  206  {
e57b7901469fc0b Ryder Lee        2020-04-25  207  	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
e57b7901469fc0b Ryder Lee        2020-04-25  208  	struct mt7915_dev *dev = mt7915_hw_dev(hw);
e57b7901469fc0b Ryder Lee        2020-04-25  209  	struct mt7915_phy *phy = mt7915_hw_phy(hw);
e57b7901469fc0b Ryder Lee        2020-04-25  210  	struct mt76_txq *mtxq;
e57b7901469fc0b Ryder Lee        2020-04-25  211  	bool ext_phy = phy != &dev->phy;
e57b7901469fc0b Ryder Lee        2020-04-25  212  	int idx, ret = 0;
e57b7901469fc0b Ryder Lee        2020-04-25  213  
e57b7901469fc0b Ryder Lee        2020-04-25  214  	mutex_lock(&dev->mt76.mutex);
e57b7901469fc0b Ryder Lee        2020-04-25  215  
c918c74d06457ee Shayne Chen      2020-12-04  216  	mt76_testmode_reset(phy->mt76, true);
aadf09537c575db Shayne Chen      2020-10-22  217  
aadf09537c575db Shayne Chen      2020-10-22  218  	if (vif->type == NL80211_IFTYPE_MONITOR &&
aadf09537c575db Shayne Chen      2020-10-22  219  	    is_zero_ether_addr(vif->addr))
aadf09537c575db Shayne Chen      2020-10-22  220  		phy->monitor_vif = vif;
aadf09537c575db Shayne Chen      2020-10-22  221  
b619e01380eedf2 Evelyn Tsai      2022-03-17  222  	mvif->mt76.idx = __ffs64(~dev->mt76.vif_mask);
b619e01380eedf2 Evelyn Tsai      2022-03-17  223  	if (mvif->mt76.idx >= (MT7915_MAX_INTERFACES << dev->dbdc_support)) {
e57b7901469fc0b Ryder Lee        2020-04-25  224  		ret = -ENOSPC;
e57b7901469fc0b Ryder Lee        2020-04-25  225  		goto out;
e57b7901469fc0b Ryder Lee        2020-04-25  226  	}
e57b7901469fc0b Ryder Lee        2020-04-25  227  
e57b7901469fc0b Ryder Lee        2020-04-25  228  	idx = get_omac_idx(vif->type, phy->omac_mask);
e57b7901469fc0b Ryder Lee        2020-04-25  229  	if (idx < 0) {
e57b7901469fc0b Ryder Lee        2020-04-25  230  		ret = -ENOSPC;
e57b7901469fc0b Ryder Lee        2020-04-25  231  		goto out;
e57b7901469fc0b Ryder Lee        2020-04-25  232  	}
6cf4392f248903b Lorenzo Bianconi 2021-12-14  233  	mvif->mt76.omac_idx = idx;
1daf2522fa16046 Felix Fietkau    2020-07-26  234  	mvif->phy = phy;
3eb50cc90534376 Ryder Lee        2022-12-01  235  	mvif->mt76.band_idx = phy->mt76->band_idx;
e57b7901469fc0b Ryder Lee        2020-04-25  236  
6cf4392f248903b Lorenzo Bianconi 2021-12-14  237  	mvif->mt76.wmm_idx = vif->type != NL80211_IFTYPE_AP;
92610d6df8a69cb Felix Fietkau    2021-11-25  238  	if (ext_phy)
6cf4392f248903b Lorenzo Bianconi 2021-12-14  239  		mvif->mt76.wmm_idx += 2;
e57b7901469fc0b Ryder Lee        2020-04-25  240  
8aa2c6f4714eccc Felix Fietkau    2020-09-26  241  	ret = mt7915_mcu_add_dev_info(phy, vif, true);
e57b7901469fc0b Ryder Lee        2020-04-25  242  	if (ret)
e57b7901469fc0b Ryder Lee        2020-04-25  243  		goto out;
e57b7901469fc0b Ryder Lee        2020-04-25  244  
b619e01380eedf2 Evelyn Tsai      2022-03-17  245  	dev->mt76.vif_mask |= BIT_ULL(mvif->mt76.idx);
6cf4392f248903b Lorenzo Bianconi 2021-12-14  246  	phy->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
e57b7901469fc0b Ryder Lee        2020-04-25  247  
f3049b88b2b3232 Felix Fietkau    2024-08-27  248  	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, mt7915_wtbl_size(dev));
f3049b88b2b3232 Felix Fietkau    2024-08-27  249  	if (idx < 0)
f3049b88b2b3232 Felix Fietkau    2024-08-27  250  		return -ENOSPC;

ret = -ENOSPC;
goto out;

e57b7901469fc0b Ryder Lee        2020-04-25  251  
1daf2522fa16046 Felix Fietkau    2020-07-26  252  	INIT_LIST_HEAD(&mvif->sta.rc_list);
b73e1d9245eba06 Lorenzo Bianconi 2023-06-22  253  	INIT_LIST_HEAD(&mvif->sta.wcid.poll_list);
e57b7901469fc0b Ryder Lee        2020-04-25  254  	mvif->sta.wcid.idx = idx;
a1a99d7bddad6b8 Lorenzo Bianconi 2022-07-04  255  	mvif->sta.wcid.phy_idx = ext_phy;
e57b7901469fc0b Ryder Lee        2020-04-25  256  	mvif->sta.wcid.hw_key_idx = -1;
e57b7901469fc0b Ryder Lee        2020-04-25  257  	mvif->sta.wcid.tx_info |= MT_WCID_TX_INFO_SET;
0335c034e7265d3 Felix Fietkau    2023-08-29  258  	mt76_wcid_init(&mvif->sta.wcid);
bd1e3e7b693c17a Lorenzo Bianconi 2021-09-13  259  
e57b7901469fc0b Ryder Lee        2020-04-25  260  	mt7915_mac_wtbl_update(dev, idx,
e57b7901469fc0b Ryder Lee        2020-04-25  261  			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
e57b7901469fc0b Ryder Lee        2020-04-25  262  
e57b7901469fc0b Ryder Lee        2020-04-25  263  	if (vif->txq) {
e57b7901469fc0b Ryder Lee        2020-04-25  264  		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
51fb1278aa57ae0 Felix Fietkau    2022-03-25  265  		mtxq->wcid = idx;
e57b7901469fc0b Ryder Lee        2020-04-25  266  	}
e57b7901469fc0b Ryder Lee        2020-04-25  267  
8aa2c6f4714eccc Felix Fietkau    2020-09-26  268  	if (vif->type != NL80211_IFTYPE_AP &&
6cf4392f248903b Lorenzo Bianconi 2021-12-14  269  	    (!mvif->mt76.omac_idx || mvif->mt76.omac_idx > 3))
8aa2c6f4714eccc Felix Fietkau    2020-09-26  270  		vif->offload_flags = 0;
e151d71e503d032 Felix Fietkau    2020-08-21  271  	vif->offload_flags |= IEEE80211_OFFLOAD_ENCAP_4ADDR;
e151d71e503d032 Felix Fietkau    2020-08-21  272  
76be6c076c07748 Ryder Lee        2021-04-27  273  	mt7915_init_bitrate_mask(vif);
02a894046d5ab7d Felix Fietkau    2023-06-29  274  	memset(&mvif->cap, -1, sizeof(mvif->cap));
76be6c076c07748 Ryder Lee        2021-04-27  275  
d3bc111307447a2 Shayne Chen      2022-01-14  276  	mt7915_mcu_add_bss_info(phy, vif, true);
d3bc111307447a2 Shayne Chen      2022-01-14  277  	mt7915_mcu_add_sta(dev, vif, NULL, true);
8e3e7567b8c1216 Shayne Chen      2022-06-22  278  	rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->sta.wcid);
d3bc111307447a2 Shayne Chen      2022-01-14  279  
e57b7901469fc0b Ryder Lee        2020-04-25  280  out:
e57b7901469fc0b Ryder Lee        2020-04-25  281  	mutex_unlock(&dev->mt76.mutex);
e57b7901469fc0b Ryder Lee        2020-04-25  282  
e57b7901469fc0b Ryder Lee        2020-04-25 @283  	return ret;
e57b7901469fc0b Ryder Lee        2020-04-25  284  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


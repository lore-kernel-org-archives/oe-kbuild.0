Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97261E379B
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384513; cv=none; b=lBGim9Uc3oWSZ2kcYwkcfymaBFiOYwUGYBeJLjYzjs6DFp3yimOcei6LE3hzS7wR/Avm5K8H5T6n360NxC9zFwV13ikvPXKY/ZuNne8QMoNtJJ7BC9fMYZ1h0iQVPrv9310CyfEhyQr7ei4CSnne/FqE865JTpEAE9rnPORe8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384513; c=relaxed/simple;
	bh=Ha5VyxWX1v2yrcX5dK9FsTwRu6eevDFrSgCxKrum6kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WaxDIoGfMn+jTntkwQ6LyLpy3W3Qr+MTnkNn7ckAu0IL0vjPiA+C9UGnQAfmgi5tIqDzZWh7Z5wKddVe4hm2W1RdQ9K7JYyzMj0RZsRNN4b4qRDCgaZ/NPVaMCZ2tsot8yLoUlR4tLvKto558o+ZpsfIZ9uWr7jd28v8mD4qLw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClkeHdrm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClkeHdrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737384512; x=1768920512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ha5VyxWX1v2yrcX5dK9FsTwRu6eevDFrSgCxKrum6kc=;
  b=ClkeHdrm8Q2UMExYPekbNT2xrXnyhIYqwAdHksuZG7GPQUUlOyI8hdg2
   o6iQFXbO8zP9Vas7tfZ5YOv7todbQv2c3PHpjhOYlTmwsmEjl9dj41Jan
   A2jOkRX9Vd+iEDrqCe/jdkIr+EVdbnZyb0z2H6RSuGIICb+v1CyETtdNU
   v45zFTJeq8DBFeA0YQrTlxoUSql6pjubU/ByN5jZ5C0NJvQdeBAli7fj4
   8jNCP+GkoilPYhMbOn5IDnj7s2v9CrGbWN+OQe9zzv4BNgHmyCgEItN9J
   n+q0pZseYWmE+1hg8p+mysYlDsndxBZ+N3nutitIySdXfOh2+5kiSqspm
   A==;
X-CSE-ConnectionGUID: 1QmpeNnRSKKI8cHUG2jiTg==
X-CSE-MsgGUID: 4STlCM0sQ+a2cTSbrMq4Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55333723"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="55333723"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 06:48:31 -0800
X-CSE-ConnectionGUID: upASsFdBQ5m6GPjdkV76yg==
X-CSE-MsgGUID: wW5HFyx5TqG7mQoyTTUDqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106977072"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jan 2025 06:48:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZt4l-000We7-0Y;
	Mon, 20 Jan 2025 14:48:27 +0000
Date: Mon, 20 Jan 2025 22:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8392/10024]
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:304
 mt76_connac2_mac_tx_rate_val() warn: variable dereferenced before check
 'conf' (see line 297)
Message-ID: <202501202204.t8DDjjlT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Shayne Chen <shayne.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Bo Jiao <Bo.Jiao@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
commit: a0facfc80ec12e1fe0bb2407bf9970128d167193 [8392/10024] wifi: mt76: connac: rework connac helpers
:::::: branch date: 6 hours ago
:::::: commit date: 6 days ago
config: riscv-randconfig-r073-20250118 (https://download.01.org/0day-ci/archive/20250120/202501202204.t8DDjjlT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501202204.t8DDjjlT-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:304 mt76_connac2_mac_tx_rate_val() warn: variable dereferenced before check 'conf' (see line 297)

vim +/conf +304 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c

9c54548bc9e462 Ryder Lee        2023-04-14  292  
0b8e2d69467f78 Lorenzo Bianconi 2023-01-17  293  u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mphy,
a0facfc80ec12e Shayne Chen      2025-01-02  294  				 struct ieee80211_bss_conf *conf,
182071cdd594bc Lorenzo Bianconi 2022-06-07  295  				 bool beacon, bool mcast)
182071cdd594bc Lorenzo Bianconi 2022-06-07  296  {
a0facfc80ec12e Shayne Chen      2025-01-02 @297  	struct mt76_vif_link *mvif = mt76_vif_conf_link(mphy->dev, conf->vif, conf);
32b1000db221df Sean Wang        2023-09-18  298  	struct cfg80211_chan_def *chandef = mvif->ctx ?
32b1000db221df Sean Wang        2023-09-18  299  					    &mvif->ctx->def : &mphy->chandef;
32b1000db221df Sean Wang        2023-09-18  300  	u8 nss = 0, mode = 0, band = chandef->chan->band;
182071cdd594bc Lorenzo Bianconi 2022-06-07  301  	int rateidx = 0, mcast_rate;
7cac2827b2737e Felix Fietkau    2024-12-30  302  	int offset = 0;
182071cdd594bc Lorenzo Bianconi 2022-06-07  303  
a0facfc80ec12e Shayne Chen      2025-01-02 @304  	if (!conf)
182071cdd594bc Lorenzo Bianconi 2022-06-07  305  		goto legacy;
182071cdd594bc Lorenzo Bianconi 2022-06-07  306  
182071cdd594bc Lorenzo Bianconi 2022-06-07  307  	if (is_mt7921(mphy->dev)) {
a0facfc80ec12e Shayne Chen      2025-01-02  308  		rateidx = ffs(conf->basic_rates) - 1;
182071cdd594bc Lorenzo Bianconi 2022-06-07  309  		goto legacy;
182071cdd594bc Lorenzo Bianconi 2022-06-07  310  	}
182071cdd594bc Lorenzo Bianconi 2022-06-07  311  
182071cdd594bc Lorenzo Bianconi 2022-06-07  312  	if (beacon) {
182071cdd594bc Lorenzo Bianconi 2022-06-07  313  		struct cfg80211_bitrate_mask *mask;
182071cdd594bc Lorenzo Bianconi 2022-06-07  314  
a0facfc80ec12e Shayne Chen      2025-01-02  315  		mask = &conf->beacon_tx_rate;
9c54548bc9e462 Ryder Lee        2023-04-14  316  
9c54548bc9e462 Ryder Lee        2023-04-14  317  		__bitrate_mask_check(he_mcs, HE_SU);
9c54548bc9e462 Ryder Lee        2023-04-14  318  		__bitrate_mask_check(vht_mcs, VHT);
9c54548bc9e462 Ryder Lee        2023-04-14  319  		__bitrate_mask_check(ht_mcs, HT);
9c54548bc9e462 Ryder Lee        2023-04-14  320  
9c54548bc9e462 Ryder Lee        2023-04-14  321  		if (hweight32(mask->control[band].legacy) == 1) {
182071cdd594bc Lorenzo Bianconi 2022-06-07  322  			rateidx = ffs(mask->control[band].legacy) - 1;
182071cdd594bc Lorenzo Bianconi 2022-06-07  323  			goto legacy;
182071cdd594bc Lorenzo Bianconi 2022-06-07  324  		}
182071cdd594bc Lorenzo Bianconi 2022-06-07  325  	}
182071cdd594bc Lorenzo Bianconi 2022-06-07  326  
a0facfc80ec12e Shayne Chen      2025-01-02  327  	mcast_rate = conf->mcast_rate[band];
182071cdd594bc Lorenzo Bianconi 2022-06-07  328  	if (mcast && mcast_rate > 0)
182071cdd594bc Lorenzo Bianconi 2022-06-07  329  		rateidx = mcast_rate - 1;
182071cdd594bc Lorenzo Bianconi 2022-06-07  330  	else
a0facfc80ec12e Shayne Chen      2025-01-02  331  		rateidx = ffs(conf->basic_rates) - 1;
182071cdd594bc Lorenzo Bianconi 2022-06-07  332  
182071cdd594bc Lorenzo Bianconi 2022-06-07  333  legacy:
7cac2827b2737e Felix Fietkau    2024-12-30  334  	if (band != NL80211_BAND_2GHZ)
7cac2827b2737e Felix Fietkau    2024-12-30  335  		offset = 4;
7cac2827b2737e Felix Fietkau    2024-12-30  336  
7cac2827b2737e Felix Fietkau    2024-12-30  337  	/* pick the lowest rate for hidden nodes */
7cac2827b2737e Felix Fietkau    2024-12-30  338  	if (rateidx < 0)
7cac2827b2737e Felix Fietkau    2024-12-30  339  		rateidx = 0;
7cac2827b2737e Felix Fietkau    2024-12-30  340  
7cac2827b2737e Felix Fietkau    2024-12-30  341  	rateidx += offset;
7cac2827b2737e Felix Fietkau    2024-12-30  342  	if (rateidx >= ARRAY_SIZE(mt76_rates))
7cac2827b2737e Felix Fietkau    2024-12-30  343  		rateidx = offset;
7cac2827b2737e Felix Fietkau    2024-12-30  344  
7cac2827b2737e Felix Fietkau    2024-12-30  345  	rateidx = mt76_rates[rateidx].hw_value;
182071cdd594bc Lorenzo Bianconi 2022-06-07  346  	mode = rateidx >> 8;
182071cdd594bc Lorenzo Bianconi 2022-06-07  347  	rateidx &= GENMASK(7, 0);
182071cdd594bc Lorenzo Bianconi 2022-06-07  348  out:
9c54548bc9e462 Ryder Lee        2023-04-14  349  	return FIELD_PREP(MT_TX_RATE_NSS, nss) |
9c54548bc9e462 Ryder Lee        2023-04-14  350  	       FIELD_PREP(MT_TX_RATE_IDX, rateidx) |
182071cdd594bc Lorenzo Bianconi 2022-06-07  351  	       FIELD_PREP(MT_TX_RATE_MODE, mode);
182071cdd594bc Lorenzo Bianconi 2022-06-07  352  }
0b8e2d69467f78 Lorenzo Bianconi 2023-01-17  353  EXPORT_SYMBOL_GPL(mt76_connac2_mac_tx_rate_val);
182071cdd594bc Lorenzo Bianconi 2022-06-07  354  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

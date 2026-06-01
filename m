Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9539FCBF
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 11:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313048; cv=none; b=G/3MuhCpM0TyiKAX8N0Gb8YDxz9KVnBzlaHJ/zpKfQH1XserSg9leSL3RfO0DJfAmIn3LmJSOX854XN8WPvAnq7ku0QnO8wSKSR/eU4vIPWB4K8IkWR1gy2dp+HE3IdR1oJcPEq/qflHnVl6A2xL97/dAWCBnX50qHVD4DpMtLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313048; c=relaxed/simple;
	bh=u2Wg7/wkOYY/zwZKZHdM4GhZp/OBLEav78Qi8gTKzjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t6s77kqhugEtsFHbEdO1ukLihO3JkAWTsymiHKbwjiiVU/HHba01rOwTlIiHpjecUe+OHDvQJ03hZHW8jrYx8HXHuGuOppEUa6iai7mpXYJbMVY8kzRzBmF3KWMbqYfiRPeI/9R7zFrD+eR59Do3XuK08JQ1tazxnLBMWTzHrgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zy6ou+/H; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zy6ou+/H"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68ced97b6eeso1900605a12.0
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Jun 2026 04:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780313046; x=1780917846; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IsruQ+xb754I9A+RmHdRJ+tfp/OEfSP2zbAEjgvAx4=;
        b=Zy6ou+/H5JTtjkFRC/cX+SSjd4SsR8hjx1eC09lketOYmQFTBq7rNVHm15PAiVUC5y
         4+HYU3I12hZqOZ6ngNl0PZSVzCEa0/Ez5qpnZ9zExhW/M/wj0kFPsLnTg5QYb+jIM+XV
         blR1skqjHG4nEt99bDCp2GwsnMa8cHzjcH1EiINu7bQeKzdxqq7Cz7JxCQSCUJX3IG36
         Rlp/sjjFCfG1y6rjUY91tZUTQqif7XrRS8N8qEDrqiRLhPzsj6WmOlGK0mKRUSzeVtye
         36NuTiyAovhW37w/jP0GJCcQ+p/WxI2EJuL1O07qI3zFrsrfEyeTAShd3YbBwLiaqHsV
         dogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313046; x=1780917846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IsruQ+xb754I9A+RmHdRJ+tfp/OEfSP2zbAEjgvAx4=;
        b=QllsbLHqAn7IjiuTLQSk5WWmWC5q5+wTH5sImUy2/kvD5W8rvm/rciqzVXbjFdiLLR
         xJp3zkBJxYuSAukjr3/+E1M8rzjA/K8NjdibBgSCIrHwJ7rdTAPqkFtEm/1qo8sQMniR
         n0MaXVJhJM2lAb6p/W+QyzrcddgSQAVmuYuu4LkhRZxzxH3sxruadqzvyPRX+lx+j0s1
         bzZwCt2TtdOBd+omF6SZvrs0W+ag01ig5cUiN3NCAd+4uEQNHwi5WDsOmtx1jSLuX9ta
         lxhAa7ig071hnWKMF7zdjhYiqy3tKC52hvOTypIJIfkHix4A5Z17Q6T699K3D7eCE1D2
         0hOw==
X-Gm-Message-State: AOJu0Yxe9FgDViZfF/F+C7B67tGRzUwkYxxwwIbvMlVKuQPIY/jwXPn1
	K99dFgggaY7iagz1yvnjYYw2tF+YqHx20A0PwoK6fvStvW46n+XqihQ9zA8g0Q==
X-Gm-Gg: Acq92OHjY+SwLVRHRKlbHG7UjyantsfIQyyRCyQPWlNM97ExR98kuu5er8QsL9WVean
	iassoHBJrtHf7CfLktmwcn57nmGPsz8XqIh6bjLiv+tsxzYpPRzbSn9DL++1Vwkq+oDKsQE6ez2
	nYxMO1jCyeJmncFeA1RKI7prdAkjmBtrycYq94PcckGWqOQSZ8uP2E0HE/XKX4Tv+evurmgIm5+
	Snxt5xheY0GWeId9sqMCNJbuCdARmHNF8AuyBzx7UEWRCNMnW6nsehjKALuu6BPydGavhSk63b3
	P8apdK9tae3X5WRlu4mvXKXk28H45aW5mUsmn1N3FdvoePh1j4A2KaSP9sPgm1EWm8PYUMscojg
	QZvkGXBhj4MJ6PloSIYsOOGAEYu8YzzkOE3aKtISb7wh2JdzU0oJUubV/mZlWexbvnGLSdHiT7j
	wwVVfsN/cCxTndaQaqQcX2RS/y0h+WPA+f42MxSVaEf5Rj
X-Received: by 2002:a17:907:a68b:b0:bd2:aeaf:470c with SMTP id a640c23a62f3a-beab2758bcamr573962666b.40.1780313045324;
        Mon, 01 Jun 2026 04:24:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-beb4356b901sm206634966b.9.2026.06.01.04.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:24:03 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:24:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Javier Tia <floss@jetm.me>
Subject: [nbd168-wireless:mt76 34/42]
 drivers/net/wireless/mediatek/mt76/mt7925/main.c:415
 mt7925_mac_link_bss_add() error: we previously assumed
 'mvif->phy->mt76->chandef.chan' could be null (see line 405)
Message-ID: <202606011203.GwBe93Bo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260601112400._cGP6YvTeajJ3I0KxW3q_rkqwS0JdwqI_Scgw24hErQ@z>

tree:   https://github.com/nbd168/wireless mt76
head:   4913f44167cf35a9536e9eec7352e15b2de0c573
commit: b7ce8a8162e825b541286a4682ca6194e7c15dc2 [34/42] wifi: mt76: mt7925: sync MT7927 BSS band assignment
config: i386-randconfig-141-20260601 (https://download.01.org/0day-ci/archive/20260601/202606011203.GwBe93Bo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606011203.GwBe93Bo-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/main.c:415 mt7925_mac_link_bss_add() error: we previously assumed 'mvif->phy->mt76->chandef.chan' could be null (see line 405)

vim +415 drivers/net/wireless/mediatek/mt76/mt7925/main.c

95977b1d10cfeb Sean Wang      2024-06-12  375  static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
95977b1d10cfeb Sean Wang      2024-06-12  376  				   struct ieee80211_bss_conf *link_conf,
95977b1d10cfeb Sean Wang      2024-06-12  377  				   struct mt792x_link_sta *mlink)
c948b5da6bbec7 Deren Wu       2023-09-18  378  {
95977b1d10cfeb Sean Wang      2024-06-12  379  	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
95977b1d10cfeb Sean Wang      2024-06-12  380  	struct ieee80211_vif *vif = link_conf->vif;
95977b1d10cfeb Sean Wang      2024-06-12  381  	struct mt792x_vif *mvif = mconf->vif;
c948b5da6bbec7 Deren Wu       2023-09-18  382  	struct mt76_txq *mtxq;
c948b5da6bbec7 Deren Wu       2023-09-18  383  	int idx, ret = 0;
c948b5da6bbec7 Deren Wu       2023-09-18  384  
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  385  	if (vif->type == NL80211_IFTYPE_P2P_DEVICE) {
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  386  		mconf->mt76.idx = MT792x_MAX_INTERFACES;
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  387  	} else {
95977b1d10cfeb Sean Wang      2024-06-12  388  		mconf->mt76.idx = __ffs64(~dev->mt76.vif_mask);
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  389  
95977b1d10cfeb Sean Wang      2024-06-12  390  		if (mconf->mt76.idx >= MT792x_MAX_INTERFACES) {
c948b5da6bbec7 Deren Wu       2023-09-18  391  			ret = -ENOSPC;
c948b5da6bbec7 Deren Wu       2023-09-18  392  			goto out;
c948b5da6bbec7 Deren Wu       2023-09-18  393  		}
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  394  	}
c948b5da6bbec7 Deren Wu       2023-09-18  395  
0cb349d742d177 Sean Wang      2024-07-06  396  	mconf->mt76.omac_idx = ieee80211_vif_is_mld(vif) ?
0cb349d742d177 Sean Wang      2024-07-06  397  			       0 : mconf->mt76.idx;
0cb349d742d177 Sean Wang      2024-07-06  398  	mconf->mt76.band_idx = 0xff;
b7ce8a8162e825 Sean Wang      2026-04-25  399  
b7ce8a8162e825 Sean Wang      2026-04-25  400  	if (is_mt7927(&dev->mt76)) {
b7ce8a8162e825 Sean Wang      2026-04-25  401  		struct ieee80211_channel *chan = NULL;
b7ce8a8162e825 Sean Wang      2026-04-25  402  
b7ce8a8162e825 Sean Wang      2026-04-25  403  		if (link_conf->chanreq.oper.chan)
b7ce8a8162e825 Sean Wang      2026-04-25  404  			chan = link_conf->chanreq.oper.chan;
b7ce8a8162e825 Sean Wang      2026-04-25 @405  		else if (mvif->phy->mt76->chandef.chan)
                                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We added this NULL check which is basically a no-op since:
	else
		chan = mvif->phy->mt76->chandef.chan;
would work the same way.

b7ce8a8162e825 Sean Wang      2026-04-25  406  			chan = mvif->phy->mt76->chandef.chan;
b7ce8a8162e825 Sean Wang      2026-04-25  407  
b7ce8a8162e825 Sean Wang      2026-04-25  408  		mconf->mt76.band_idx = mt7927_band_idx(chan->band);
b7ce8a8162e825 Sean Wang      2026-04-25  409  	}
b7ce8a8162e825 Sean Wang      2026-04-25  410  
ac03e5b82bc6b4 Ming Yen Hsieh 2024-12-10  411  	mconf->mt76.wmm_idx = ieee80211_vif_is_mld(vif) ?
ac03e5b82bc6b4 Ming Yen Hsieh 2024-12-10  412  			      0 : mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
4bada9b0a29c18 Ming Yen Hsieh 2025-03-04  413  	mconf->mt76.link_idx = hweight16(mvif->valid_links);
c948b5da6bbec7 Deren Wu       2023-09-18  414  
95977b1d10cfeb Sean Wang      2024-06-12 @415  	if (mvif->phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Then the dereference it without checking.  Should this be "chan->band"
instead, btw?

95977b1d10cfeb Sean Wang      2024-06-12  416  		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL + 4;
c948b5da6bbec7 Deren Wu       2023-09-18  417  	else
95977b1d10cfeb Sean Wang      2024-06-12  418  		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL;
c948b5da6bbec7 Deren Wu       2023-09-18  419  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


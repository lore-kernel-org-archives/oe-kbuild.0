Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC6219A74
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 17:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734716638; cv=none; b=CeNFkvcWYNCNtjyQZ4lLYInQU3ZVWUVsxRzdkWBKpAcOqsrYs1Moxzk5E2uKU4L92TfGVOMC83eF1dnMqGaEpn19n1MCDBhndkc76KzZ+JJ/0TGSnnzCbELrT3YRG79UePT1NcfNAerRZhOwV6myvpfHEOBvMH2bmdpSTPg9DBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734716638; c=relaxed/simple;
	bh=KpGt9podNz/ylgzAoNVNaG98JVAR+WHRABX5UrQBVUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UzLD0ofFKsq8i7NScwKe4QdLYi0deaq4V8KYM9/3Oq/hY/ddZFNsmX3EqNflpUY7yoMo5L4ZdhuFWDE2dDuLc1mDnor8ZHTVaQ1noJ5HZUhmQSux11oydWPlXOvHNNVv8wY7JAx1N1k8mozIQhRoJusF/s9KcyfkuGE5eIDb7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Igp++zDE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Igp++zDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734716637; x=1766252637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KpGt9podNz/ylgzAoNVNaG98JVAR+WHRABX5UrQBVUs=;
  b=Igp++zDElcHEy3wG6CUKEZiFoTUgZZ8MJUFSUAg8yZAIHZ4Vu3K/mTFg
   HN8gD9QRUyIiCGkQvmgvM6mk3vnEEVh9i2lzwdIkgv5RnCWWK+A9McraQ
   xGCLmtuv8xy9E6jMfG7RZGEC63KFKZ7TU3CuS2KzcVf2yOdGMBKpyowxs
   75ri7Zi2Yg7crCQ3Pmn4yXfG77AlWnheMMGzE+TUL4R3I725w7iQkPjP0
   Tii5LM3eWvWUeoGEaHYbAhFp1MinKd01NgFKc7gULLQtEatL6huoy+hsp
   aBASTQjwE9yS4iWDHvqokT7wZHM9nK14RAwwclkzfXfmrpWGtPp5T8j3r
   Q==;
X-CSE-ConnectionGUID: +Lt4eBFQSD2fvCdQGsYpbA==
X-CSE-MsgGUID: LwuUPASTT4KMkMoa1MZsKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35394886"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35394886"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 09:43:56 -0800
X-CSE-ConnectionGUID: x+U4dpTJSjeb3jtzjYLCeg==
X-CSE-MsgGUID: g/2zculER3yUfeTNbvYW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98464856"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2024 09:43:55 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOh2W-0001UR-1i;
	Fri, 20 Dec 2024 17:43:52 +0000
Date: Sat, 21 Dec 2024 01:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:553
 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'dev->mt76.wcid'
 [r] (local cap)
Message-ID: <202412210114.Ie2o2eLO-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>
CC: Sujuan Chen <sujuan.chen@mediatek.com>
CC: Bo Jiao <Bo.Jiao@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: a5d028d668360db991e6da67cd48b9b4443198ed wifi: mt76: mt7996: add wed rro delete session garbage collector
date:   1 year ago
:::::: branch date: 24 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20241215 (https://download.01.org/0day-ci/archive/20241221/202412210114.Ie2o2eLO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412210114.Ie2o2eLO-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:553 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'dev->mt76.wcid' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:560 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'wcid->aggr' [r] (local cap)

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:347 mt7996_mcu_rx_radar_detected() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:349 mt7996_mcu_rx_radar_detected() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:429 mt7996_mcu_ie_countdown() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:436 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:441 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2300 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'sub_elem->data' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2292 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'elem->data' [r] (local cap)

vim +553 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c

98686cd21624c75 Shayne Chen      2022-11-22  528  
a5d028d668360db Lorenzo Bianconi 2023-10-20  529  static void
a5d028d668360db Lorenzo Bianconi 2023-10-20  530  mt7996_mcu_wed_rro_event(struct mt7996_dev *dev, struct sk_buff *skb)
a5d028d668360db Lorenzo Bianconi 2023-10-20  531  {
a5d028d668360db Lorenzo Bianconi 2023-10-20  532  	struct mt7996_mcu_wed_rro_event *event = (void *)skb->data;
a5d028d668360db Lorenzo Bianconi 2023-10-20  533  
a5d028d668360db Lorenzo Bianconi 2023-10-20  534  	if (!dev->has_rro)
a5d028d668360db Lorenzo Bianconi 2023-10-20  535  		return;
a5d028d668360db Lorenzo Bianconi 2023-10-20  536  
a5d028d668360db Lorenzo Bianconi 2023-10-20  537  	skb_pull(skb, sizeof(struct mt7996_mcu_rxd) + 4);
a5d028d668360db Lorenzo Bianconi 2023-10-20  538  
a5d028d668360db Lorenzo Bianconi 2023-10-20  539  	switch (le16_to_cpu(event->tag)) {
a5d028d668360db Lorenzo Bianconi 2023-10-20  540  	case UNI_WED_RRO_BA_SESSION_STATUS: {
a5d028d668360db Lorenzo Bianconi 2023-10-20  541  		struct mt7996_mcu_wed_rro_ba_event *e;
a5d028d668360db Lorenzo Bianconi 2023-10-20  542  
a5d028d668360db Lorenzo Bianconi 2023-10-20  543  		while (skb->len >= sizeof(*e)) {
a5d028d668360db Lorenzo Bianconi 2023-10-20  544  			struct mt76_rx_tid *tid;
a5d028d668360db Lorenzo Bianconi 2023-10-20  545  			struct mt76_wcid *wcid;
a5d028d668360db Lorenzo Bianconi 2023-10-20  546  			u16 idx;
a5d028d668360db Lorenzo Bianconi 2023-10-20  547  
a5d028d668360db Lorenzo Bianconi 2023-10-20  548  			e = (void *)skb->data;
a5d028d668360db Lorenzo Bianconi 2023-10-20  549  			idx = le16_to_cpu(e->wlan_id);
a5d028d668360db Lorenzo Bianconi 2023-10-20  550  			if (idx >= ARRAY_SIZE(dev->mt76.wcid))
a5d028d668360db Lorenzo Bianconi 2023-10-20  551  				break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  552  
a5d028d668360db Lorenzo Bianconi 2023-10-20 @553  			wcid = rcu_dereference(dev->mt76.wcid[idx]);
a5d028d668360db Lorenzo Bianconi 2023-10-20  554  			if (!wcid || !wcid->sta)
a5d028d668360db Lorenzo Bianconi 2023-10-20  555  				break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  556  
a5d028d668360db Lorenzo Bianconi 2023-10-20  557  			if (e->tid >= ARRAY_SIZE(wcid->aggr))
a5d028d668360db Lorenzo Bianconi 2023-10-20  558  				break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  559  
a5d028d668360db Lorenzo Bianconi 2023-10-20 @560  			tid = rcu_dereference(wcid->aggr[e->tid]);
a5d028d668360db Lorenzo Bianconi 2023-10-20  561  			if (!tid)
a5d028d668360db Lorenzo Bianconi 2023-10-20  562  				break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  563  
a5d028d668360db Lorenzo Bianconi 2023-10-20  564  			tid->id = le16_to_cpu(e->id);
a5d028d668360db Lorenzo Bianconi 2023-10-20  565  			skb_pull(skb, sizeof(*e));
a5d028d668360db Lorenzo Bianconi 2023-10-20  566  		}
a5d028d668360db Lorenzo Bianconi 2023-10-20  567  		break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  568  	}
a5d028d668360db Lorenzo Bianconi 2023-10-20  569  	case UNI_WED_RRO_BA_SESSION_DELETE: {
a5d028d668360db Lorenzo Bianconi 2023-10-20  570  		struct mt7996_mcu_wed_rro_ba_delete_event *e;
a5d028d668360db Lorenzo Bianconi 2023-10-20  571  
a5d028d668360db Lorenzo Bianconi 2023-10-20  572  		while (skb->len >= sizeof(*e)) {
a5d028d668360db Lorenzo Bianconi 2023-10-20  573  			struct mt7996_wed_rro_session_id *session;
a5d028d668360db Lorenzo Bianconi 2023-10-20  574  
a5d028d668360db Lorenzo Bianconi 2023-10-20  575  			e = (void *)skb->data;
a5d028d668360db Lorenzo Bianconi 2023-10-20  576  			session = kzalloc(sizeof(*session), GFP_ATOMIC);
a5d028d668360db Lorenzo Bianconi 2023-10-20  577  			if (!session)
a5d028d668360db Lorenzo Bianconi 2023-10-20  578  				break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  579  
a5d028d668360db Lorenzo Bianconi 2023-10-20  580  			session->id = le16_to_cpu(e->session_id);
a5d028d668360db Lorenzo Bianconi 2023-10-20  581  
a5d028d668360db Lorenzo Bianconi 2023-10-20  582  			spin_lock_bh(&dev->wed_rro.lock);
a5d028d668360db Lorenzo Bianconi 2023-10-20  583  			list_add_tail(&session->list, &dev->wed_rro.poll_list);
a5d028d668360db Lorenzo Bianconi 2023-10-20  584  			spin_unlock_bh(&dev->wed_rro.lock);
a5d028d668360db Lorenzo Bianconi 2023-10-20  585  
a5d028d668360db Lorenzo Bianconi 2023-10-20  586  			ieee80211_queue_work(mt76_hw(dev), &dev->wed_rro.work);
a5d028d668360db Lorenzo Bianconi 2023-10-20  587  			skb_pull(skb, sizeof(*e));
a5d028d668360db Lorenzo Bianconi 2023-10-20  588  		}
a5d028d668360db Lorenzo Bianconi 2023-10-20  589  		break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  590  	}
a5d028d668360db Lorenzo Bianconi 2023-10-20  591  	default:
a5d028d668360db Lorenzo Bianconi 2023-10-20  592  		break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  593  	}
a5d028d668360db Lorenzo Bianconi 2023-10-20  594  }
a5d028d668360db Lorenzo Bianconi 2023-10-20  595  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

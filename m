Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3F470816
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 22:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730757646; cv=none; b=lkPQX4H5CpJphCogHLmBc7Zskx02lSUnMglzGiW+tChLk98kn8z0TmCQq8PYmiPjh+kx8KKkN424+euejz2Li4/wuv66fjqBkQASelDF0VNs4uoZjy4HxscEUBfZKJq4uJWQrFr5LGIGHL3ZV7qKwkQTjEhQPbpVeEsLJhMSiqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730757646; c=relaxed/simple;
	bh=sj/oSmHIyzGuc2UH8Lqo2IQ1oP58El2SkVjqT+UStB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RsbaSGy+qyGiMEoWWmP64f96fytYVQgI9M/loc3hsF+0GUCYDN+zHejKE2QXK8giac/8I5q23KHGjieYlxLl446DUSRby49l4LNZP2r8J+YuWOxBLVaSdHyglV1YwP5ModenInPzF2/AyOB1pySYLrDjT3odtev8ZSevbcTe8Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyexGtAC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyexGtAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730757644; x=1762293644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sj/oSmHIyzGuc2UH8Lqo2IQ1oP58El2SkVjqT+UStB0=;
  b=gyexGtACJ+8VPk4VS8O4b5ne+J/+4Mf527mcy1TrfzD0dqd5oRVeFR2n
   YSAbnwAocPhFqtgnRuZGeQLVLsdOO1GtPALQ3lPtyDc79Lh4ONekqkDmq
   aIQieHkTD4B7a1rMWjCx0nrkizhlClwjPYX9zyNvQvC6D1J+HpdCSlV11
   ax2DOvveq+3t04BQ5OOgs9f0/UGm9x0jTws3LAxhaSzG9kIXZujFwaSK2
   Yy7PH32X6ZWRVE4BGmDev2SeXfdKv8H6hMzkbyrq4fzifn7aXgh+zZNAF
   YkcwM91PKh9CJ6Ec3YB1Pt2Vbf+3IeF/hKtdYRAkzsIwzZQfUk6OlL3VV
   w==;
X-CSE-ConnectionGUID: /KO3Ypg7Tli4aSZkHFn/Ug==
X-CSE-MsgGUID: tIzBFKXsSq6w8FtYTlzTNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18097377"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="18097377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 14:00:43 -0800
X-CSE-ConnectionGUID: Tjfl+9FaSTSwQxd8eflkOA==
X-CSE-MsgGUID: Orf+mlfqR1mZ4OZcZOnfKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="84120112"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2024 14:00:42 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t857n-000lJt-1R;
	Mon, 04 Nov 2024 22:00:39 +0000
Date: Tue, 5 Nov 2024 06:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:553
 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'dev->mt76.wcid'
 [r] (local cap)
Message-ID: <202411050534.polvubt4-lkp@intel.com>
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
head:   557329bcecc2f55e134db8974953b32b69db9d15
commit: a5d028d668360db991e6da67cd48b9b4443198ed wifi: mt76: mt7996: add wed rro delete session garbage collector
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: sh-randconfig-r073-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050534.polvubt4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411050534.polvubt4-lkp@intel.com/

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

98686cd21624c7 Shayne Chen      2022-11-22  528  
a5d028d668360d Lorenzo Bianconi 2023-10-20  529  static void
a5d028d668360d Lorenzo Bianconi 2023-10-20  530  mt7996_mcu_wed_rro_event(struct mt7996_dev *dev, struct sk_buff *skb)
a5d028d668360d Lorenzo Bianconi 2023-10-20  531  {
a5d028d668360d Lorenzo Bianconi 2023-10-20  532  	struct mt7996_mcu_wed_rro_event *event = (void *)skb->data;
a5d028d668360d Lorenzo Bianconi 2023-10-20  533  
a5d028d668360d Lorenzo Bianconi 2023-10-20  534  	if (!dev->has_rro)
a5d028d668360d Lorenzo Bianconi 2023-10-20  535  		return;
a5d028d668360d Lorenzo Bianconi 2023-10-20  536  
a5d028d668360d Lorenzo Bianconi 2023-10-20  537  	skb_pull(skb, sizeof(struct mt7996_mcu_rxd) + 4);
a5d028d668360d Lorenzo Bianconi 2023-10-20  538  
a5d028d668360d Lorenzo Bianconi 2023-10-20  539  	switch (le16_to_cpu(event->tag)) {
a5d028d668360d Lorenzo Bianconi 2023-10-20  540  	case UNI_WED_RRO_BA_SESSION_STATUS: {
a5d028d668360d Lorenzo Bianconi 2023-10-20  541  		struct mt7996_mcu_wed_rro_ba_event *e;
a5d028d668360d Lorenzo Bianconi 2023-10-20  542  
a5d028d668360d Lorenzo Bianconi 2023-10-20  543  		while (skb->len >= sizeof(*e)) {
a5d028d668360d Lorenzo Bianconi 2023-10-20  544  			struct mt76_rx_tid *tid;
a5d028d668360d Lorenzo Bianconi 2023-10-20  545  			struct mt76_wcid *wcid;
a5d028d668360d Lorenzo Bianconi 2023-10-20  546  			u16 idx;
a5d028d668360d Lorenzo Bianconi 2023-10-20  547  
a5d028d668360d Lorenzo Bianconi 2023-10-20  548  			e = (void *)skb->data;
a5d028d668360d Lorenzo Bianconi 2023-10-20  549  			idx = le16_to_cpu(e->wlan_id);
a5d028d668360d Lorenzo Bianconi 2023-10-20  550  			if (idx >= ARRAY_SIZE(dev->mt76.wcid))
a5d028d668360d Lorenzo Bianconi 2023-10-20  551  				break;
a5d028d668360d Lorenzo Bianconi 2023-10-20  552  
a5d028d668360d Lorenzo Bianconi 2023-10-20 @553  			wcid = rcu_dereference(dev->mt76.wcid[idx]);
a5d028d668360d Lorenzo Bianconi 2023-10-20  554  			if (!wcid || !wcid->sta)
a5d028d668360d Lorenzo Bianconi 2023-10-20  555  				break;
a5d028d668360d Lorenzo Bianconi 2023-10-20  556  
a5d028d668360d Lorenzo Bianconi 2023-10-20  557  			if (e->tid >= ARRAY_SIZE(wcid->aggr))
a5d028d668360d Lorenzo Bianconi 2023-10-20  558  				break;
a5d028d668360d Lorenzo Bianconi 2023-10-20  559  
a5d028d668360d Lorenzo Bianconi 2023-10-20 @560  			tid = rcu_dereference(wcid->aggr[e->tid]);
a5d028d668360d Lorenzo Bianconi 2023-10-20  561  			if (!tid)
a5d028d668360d Lorenzo Bianconi 2023-10-20  562  				break;
a5d028d668360d Lorenzo Bianconi 2023-10-20  563  
a5d028d668360d Lorenzo Bianconi 2023-10-20  564  			tid->id = le16_to_cpu(e->id);
a5d028d668360d Lorenzo Bianconi 2023-10-20  565  			skb_pull(skb, sizeof(*e));
a5d028d668360d Lorenzo Bianconi 2023-10-20  566  		}
a5d028d668360d Lorenzo Bianconi 2023-10-20  567  		break;
a5d028d668360d Lorenzo Bianconi 2023-10-20  568  	}
a5d028d668360d Lorenzo Bianconi 2023-10-20  569  	case UNI_WED_RRO_BA_SESSION_DELETE: {
a5d028d668360d Lorenzo Bianconi 2023-10-20  570  		struct mt7996_mcu_wed_rro_ba_delete_event *e;
a5d028d668360d Lorenzo Bianconi 2023-10-20  571  
a5d028d668360d Lorenzo Bianconi 2023-10-20  572  		while (skb->len >= sizeof(*e)) {
a5d028d668360d Lorenzo Bianconi 2023-10-20  573  			struct mt7996_wed_rro_session_id *session;
a5d028d668360d Lorenzo Bianconi 2023-10-20  574  
a5d028d668360d Lorenzo Bianconi 2023-10-20  575  			e = (void *)skb->data;
a5d028d668360d Lorenzo Bianconi 2023-10-20  576  			session = kzalloc(sizeof(*session), GFP_ATOMIC);
a5d028d668360d Lorenzo Bianconi 2023-10-20  577  			if (!session)
a5d028d668360d Lorenzo Bianconi 2023-10-20  578  				break;
a5d028d668360d Lorenzo Bianconi 2023-10-20  579  
a5d028d668360d Lorenzo Bianconi 2023-10-20  580  			session->id = le16_to_cpu(e->session_id);
a5d028d668360d Lorenzo Bianconi 2023-10-20  581  
a5d028d668360d Lorenzo Bianconi 2023-10-20  582  			spin_lock_bh(&dev->wed_rro.lock);
a5d028d668360d Lorenzo Bianconi 2023-10-20  583  			list_add_tail(&session->list, &dev->wed_rro.poll_list);
a5d028d668360d Lorenzo Bianconi 2023-10-20  584  			spin_unlock_bh(&dev->wed_rro.lock);
a5d028d668360d Lorenzo Bianconi 2023-10-20  585  
a5d028d668360d Lorenzo Bianconi 2023-10-20  586  			ieee80211_queue_work(mt76_hw(dev), &dev->wed_rro.work);
a5d028d668360d Lorenzo Bianconi 2023-10-20  587  			skb_pull(skb, sizeof(*e));
a5d028d668360d Lorenzo Bianconi 2023-10-20  588  		}
a5d028d668360d Lorenzo Bianconi 2023-10-20  589  		break;
a5d028d668360d Lorenzo Bianconi 2023-10-20  590  	}
a5d028d668360d Lorenzo Bianconi 2023-10-20  591  	default:
a5d028d668360d Lorenzo Bianconi 2023-10-20  592  		break;
a5d028d668360d Lorenzo Bianconi 2023-10-20  593  	}
a5d028d668360d Lorenzo Bianconi 2023-10-20  594  }
a5d028d668360d Lorenzo Bianconi 2023-10-20  595  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

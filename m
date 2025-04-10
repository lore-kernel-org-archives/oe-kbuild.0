Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A3C37160
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Apr 2025 02:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744253137; cv=none; b=Ae4CB5VQR6YkB/nAEtjj8wDGLlPCn9lb1PLybTx5xLR0knL1u2YqpYRh0MFpLWhBdWcgSg+mUBlnDdzeKvdsLuPV7jPo3JcEQzVpJs3ZN0kIYq2IhlNoi+lH2zUmBrQ+ZAda7AQyTUImrl9WwX2n807o6CQkrvS9f0dBeEoqAr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744253137; c=relaxed/simple;
	bh=P+KnQin5Xv31pEkg9qx9D5Ijfesrr5Az4EiYYfTkUoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=huWWkwp+9H6m2gTLP90tfiChtnMDYGmY/EmJujxJCkOi8PGLcEwmvtPj45KCOZNMP4/bfECSafAQ64BqLipE/NNz7EmvmKaL3Ad/cpYoZfVMKs5Pd1KGybtQyT8iEbjWVmlioAS1K+4mw1phwaigULSzcegOAUf+L5R8zNMETAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJlkz7cL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJlkz7cL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744253134; x=1775789134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P+KnQin5Xv31pEkg9qx9D5Ijfesrr5Az4EiYYfTkUoM=;
  b=HJlkz7cLM/r6UMOHd+IFl0nS1AhDe6F0hj6k31bqNGqQDWTcxRpVRJDh
   1hyVtjGJnGcLNvS3pNPp1sTWr00+ZFD7fRsmFkP29RrQ+r4E5Q4UkZNS9
   BPGhKk1iv7eW48zlgwPL5fDtMAlAYG97PKJski8IhNvkDUGSMeLzhasEs
   6x6WKN32gkdkOnhzM9PSz6LbCEN4nXTkLm52C79R+htj2Pdq+628+BQKf
   5u/SLQjG4OuqXVOrGSd7tlRbT6md9ZpkQydZ3biC6/V1jf687QOgplWY7
   CVNpV81UesqNcSt+wAwFQ71bCgAekk+cKk3PC/T7AVkw2VtYoKdL7jgcW
   Q==;
X-CSE-ConnectionGUID: +6sOS7fcQKCotA/CGo/Czg==
X-CSE-MsgGUID: NPm9N9v1RPCGajMiB8639g==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45880680"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45880680"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 19:45:34 -0700
X-CSE-ConnectionGUID: jg5eKZ1mRNCQS9Gz4H3vag==
X-CSE-MsgGUID: P5RRCSbXTI2/wLL01RXHzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133625529"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 19:45:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2hv0-0009Vn-1M;
	Thu, 10 Apr 2025 02:45:30 +0000
Date: Thu, 10 Apr 2025 10:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/main.c:952
 mt7996_mac_sta_add_links() error: uninitialized symbol 'err'.
Message-ID: <202504101051.1ya4Z4va-lkp@intel.com>
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
CC: Bo Jiao <Bo.Jiao@mediatek.com>
CC: Peter Chiu <chui-hao.chiu@mediatek.com>
CC: Shayne Chen <shayne.chen@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b07108ada81a8ebcebf1fe61367b4e436c895bd
commit: dd82a9e02c054052b5899872c1f32805428f6131 wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks
date:   3 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: powerpc64-randconfig-r073-20250409 (https://download.01.org/0day-ci/archive/20250410/202504101051.1ya4Z4va-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504101051.1ya4Z4va-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:952 mt7996_mac_sta_add_links() error: uninitialized symbol 'err'.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:73 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line 71)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:360 mt7996_set_monitor() warn: variable dereferenced before check 'phy' (see line 358)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:1133 mt7996_set_rts_threshold() error: uninitialized symbol 'ret'.

vim +/err +952 drivers/net/wireless/mediatek/mt76/mt7996/main.c

dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  923  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  924  static int
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  925  mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  926  			 struct ieee80211_sta *sta, unsigned long new_links)
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  927  {
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  928  	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  929  	unsigned int link_id;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  930  	int err;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  931  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  932  	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  933  		struct mt7996_vif_link *link;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  934  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  935  		if (rcu_access_pointer(msta->link[link_id]))
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  936  			continue;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  937  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  938  		link = mt7996_vif_link(dev, vif, link_id);
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  939  		if (!link)
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  940  			goto error_unlink;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  941  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  942  		err = mt7996_mac_sta_init_link(dev, vif, link, sta, link_id);
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  943  		if (err)
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  944  			goto error_unlink;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  945  	}
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  946  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  947  	return 0;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  948  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  949  error_unlink:
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  950  	mt7996_mac_sta_remove_links(dev, sta, new_links);
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  951  
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11 @952  	return err;
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  953  }
dd82a9e02c0540 Lorenzo Bianconi 2025-03-11  954  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

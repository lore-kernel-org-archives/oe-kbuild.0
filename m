Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD2C205AAC
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Apr 2025 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520268; cv=none; b=hd1PMJpEofyTB+tm/1ap8j7w6UtQrhUjHqueXJAlTeiwIeBc/LnT9z2XVHKxH469bypqBx5BfFvU7yRzhLYKdWsQHeiv8w7gIKKNOep8e8Q2uhEhIu3ovTunRHIn2V9+NKCcF3r+ObAHr8h1XzRhfBmh3rDELa2DBoSf/B7Zppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520268; c=relaxed/simple;
	bh=xY9TlNOxR6TI2IyW9Uw0yp1wuxNSo0A8WyOaUuJtf7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sN1xk2CpCMR04pbeyCti5QPszwVhOd2OFy/RibDYs/4rhk/rcH1m0fePeYfWslGl71u7F1Sd2cgGqlmKlsdfsjTH++dT9KjDDl/986AtddniFXOIRsqw00IKDYNGrUqU3ecSvOFCotB3XR/aXg5QkJFFVBw9uaAi+jcso/Nc/Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwI12Kar; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwI12Kar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743520267; x=1775056267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xY9TlNOxR6TI2IyW9Uw0yp1wuxNSo0A8WyOaUuJtf7o=;
  b=KwI12KaryKCL8rStH8W/3Roq5079Ja5lvOVupy/dkhhTTZAKIXl/32uH
   iiS6tUShGkYGpQkz1AAVmIZNqmXhwYomWRl/6k+Wu/ROUw2HrnBk7Qxn+
   ZHmOJwf8ZlfcnXFnahXaF0JBa9GokrjABQPh9/mxnh8iJubQ/5ZGowXLx
   dVBEqqVgxn22yqnD+OYQpJOJ61sw+0SiCAnxyOTXZDSTe1UlA6A9efqvX
   M7VPpC4bLlEZ24SmGQ4Pggf+lik7yoEmdaVmNf1UlAQMz3kIGqdG85cOY
   ttqvwlv7K08/tlHoDhqxODUqq+RYg9k6Q8t3aPyryMvbtyIY8hpREDjlM
   Q==;
X-CSE-ConnectionGUID: U5mCMUcjS2SKgoCkW36b7Q==
X-CSE-MsgGUID: dj3JyAiTR2Ku6sq33cq0xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55047520"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="55047520"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 08:11:06 -0700
X-CSE-ConnectionGUID: aLSkqJarSouL3Z8OIE5W0A==
X-CSE-MsgGUID: 1rd0HStNQreP+q64LJHP6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126881608"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Apr 2025 08:11:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzdGZ-0009wy-0r;
	Tue, 01 Apr 2025 15:11:03 +0000
Date: Tue, 1 Apr 2025 23:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/channel.c:307
 mt76_put_vif_phy_link() warn: variable dereferenced before IS_ERR check
 'mlink' (see line 305)
Message-ID: <202504012337.kis2rdgS-lkp@intel.com>
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
TO: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08733088b566b58283f0f12fb73f5db6a9a9de30
commit: 3ba20af886d1f604dceeb4d4c8ff872e2c4e885e wifi: mt76: scan: set vif offchannel link for scanning/roc
date:   13 days ago
:::::: branch date: 13 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20250401 (https://download.01.org/0day-ci/archive/20250401/202504012337.kis2rdgS-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504012337.kis2rdgS-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/channel.c:307 mt76_put_vif_phy_link() warn: variable dereferenced before IS_ERR check 'mlink' (see line 305)

vim +/mlink +307 drivers/net/wireless/mediatek/mt76/channel.c

e411b8190fe7c9 Felix Fietkau 2025-01-02  300  
e411b8190fe7c9 Felix Fietkau 2025-01-02  301  void mt76_put_vif_phy_link(struct mt76_phy *phy, struct ieee80211_vif *vif,
e411b8190fe7c9 Felix Fietkau 2025-01-02  302  			   struct mt76_vif_link *mlink)
e411b8190fe7c9 Felix Fietkau 2025-01-02  303  {
e411b8190fe7c9 Felix Fietkau 2025-01-02  304  	struct mt76_dev *dev = phy->dev;
3ba20af886d1f6 Felix Fietkau 2025-03-11 @305  	struct mt76_vif_data *mvif = mlink->mvif;
e411b8190fe7c9 Felix Fietkau 2025-01-02  306  
e411b8190fe7c9 Felix Fietkau 2025-01-02 @307  	if (IS_ERR_OR_NULL(mlink) || !mlink->offchannel)
e411b8190fe7c9 Felix Fietkau 2025-01-02  308  		return;
e411b8190fe7c9 Felix Fietkau 2025-01-02  309  
3ba20af886d1f6 Felix Fietkau 2025-03-11  310  	rcu_assign_pointer(mvif->offchannel_link, NULL);
e411b8190fe7c9 Felix Fietkau 2025-01-02  311  	dev->drv->vif_link_remove(phy, vif, &vif->bss_conf, mlink);
e411b8190fe7c9 Felix Fietkau 2025-01-02  312  	kfree(mlink);
e411b8190fe7c9 Felix Fietkau 2025-01-02  313  }
a8f424c1287cc7 Felix Fietkau 2025-01-02  314  

:::::: The code at line 307 was first introduced by commit
:::::: e411b8190fe7c969c668eedb5b01f2865c89b1af wifi: mt76: add multi-radio support to scanning code

:::::: TO: Felix Fietkau <nbd@nbd.name>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

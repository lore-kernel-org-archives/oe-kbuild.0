Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B5155314
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727169494; cv=none; b=CZ4YL+4Y8zNeLDymz/r5xUHet5HQN3VRLHWlCi363i1ldD4HWVKPzOZq9Jb0B2Np5mfX0AFZ55OATupx9WaMcyYpTSxikCEJT2lGbteJciCB280x6sOLetjCfTNMAqFoKC1AqQRGLSfobJZe7EEH6x760Tg873urDBVpTOy4woY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727169494; c=relaxed/simple;
	bh=CWNyhGzyExAZY/SGm23aMflgaKEX7oHDsgdpWR4qp0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TU7vAoGMU3nGb6W6lfzsx2J7LgqsdpqQd8svW+APvnRoCaiaK8IOtYuqOMPtRuHpwQStczetbuhY1HBxDInKcgzNulNQmP3YryA8nTqYBr4OKZtdh4GRTVQFqrKOTHz9Ah/3oLOoosOv9zvG8A9R91TWA8OayaVCBt50SnPtViw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kss9WrDe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kss9WrDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727169492; x=1758705492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWNyhGzyExAZY/SGm23aMflgaKEX7oHDsgdpWR4qp0U=;
  b=Kss9WrDeY7uvad6TVI86UfUPyFfV3P5qtE42d0lFLwUy/gj138KQ3snV
   AoHZMbu+wGAw0OnwInTpkdC0I7YHkScEBuGIYCUxXlV4e0KRwF1+9LoXu
   fCkgTIxerveoso7UPPDpkqYClLS6xxLAtkraFiqX+1KlRXa79AmNCr4VM
   CDHeCvW37LUGfzaw3+dyInpj6krZ17IfGbH7O2nQGaFpz89NLDC9/OnX7
   zmH5Np9dP40OI84xhtdAbxKyecBfPeD4pd6UMokmkOVTOdEMtqnRhz5hR
   TnNOKfjwZltBoNs7KJuV/sIpj146wnl39ZJsq0OQME/GhhATPpFn925Q0
   Q==;
X-CSE-ConnectionGUID: tDu12tCQThaQythu5FCCgQ==
X-CSE-MsgGUID: aJ9aJmN3S+SFgXJNeQQCOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37513224"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="37513224"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 02:18:12 -0700
X-CSE-ConnectionGUID: qJbxmDzwSBGn+U7WmSjv3w==
X-CSE-MsgGUID: Ip9+LJC4Rq2t12CTLt1cig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="76277326"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 02:18:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st1gO-000IAV-0H;
	Tue, 24 Sep 2024 09:18:08 +0000
Date: Tue, 24 Sep 2024 17:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/etnaviv/etnaviv_gem.c:335:8-15: ERROR: reference
 preceded by free on line 323
Message-ID: <202409241728.chh20SDb-lkp@intel.com>
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
TO: Lucas Stach <l.stach@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   abf2050f51fdca0fd146388f83cddd95a57a008d
commit: fd4b77e8deea9cced6c1eca8bd64d2f03fc7cc94 drm/etnaviv: don't restrict to certain architectures
date:   6 years ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 years ago
config: i386-randconfig-053-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241728.chh20SDb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409241728.chh20SDb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/etnaviv/etnaviv_gem.c:335:8-15: ERROR: reference preceded by free on line 323

vim +335 drivers/gpu/drm/etnaviv/etnaviv_gem.c

b6325f409959c7 Russell King        2016-01-21  260  
b6325f409959c7 Russell King        2016-01-21  261  struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
b6325f409959c7 Russell King        2016-01-21  262  	struct drm_gem_object *obj, struct etnaviv_gpu *gpu)
a8c21a5451d831 The etnaviv authors 2015-12-03  263  {
a8c21a5451d831 The etnaviv authors 2015-12-03  264  	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
a8c21a5451d831 The etnaviv authors 2015-12-03  265  	struct etnaviv_vram_mapping *mapping;
a8c21a5451d831 The etnaviv authors 2015-12-03  266  	struct page **pages;
a8c21a5451d831 The etnaviv authors 2015-12-03  267  	int ret = 0;
a8c21a5451d831 The etnaviv authors 2015-12-03  268  
a8c21a5451d831 The etnaviv authors 2015-12-03  269  	mutex_lock(&etnaviv_obj->lock);
a8c21a5451d831 The etnaviv authors 2015-12-03  270  	mapping = etnaviv_gem_get_vram_mapping(etnaviv_obj, gpu->mmu);
a8c21a5451d831 The etnaviv authors 2015-12-03  271  	if (mapping) {
a8c21a5451d831 The etnaviv authors 2015-12-03  272  		/*
a8c21a5451d831 The etnaviv authors 2015-12-03  273  		 * Holding the object lock prevents the use count changing
a8c21a5451d831 The etnaviv authors 2015-12-03  274  		 * beneath us.  If the use count is zero, the MMU might be
a8c21a5451d831 The etnaviv authors 2015-12-03  275  		 * reaping this object, so take the lock and re-check that
a8c21a5451d831 The etnaviv authors 2015-12-03  276  		 * the MMU owns this mapping to close this race.
a8c21a5451d831 The etnaviv authors 2015-12-03  277  		 */
a8c21a5451d831 The etnaviv authors 2015-12-03  278  		if (mapping->use == 0) {
a8c21a5451d831 The etnaviv authors 2015-12-03  279  			mutex_lock(&gpu->mmu->lock);
a8c21a5451d831 The etnaviv authors 2015-12-03  280  			if (mapping->mmu == gpu->mmu)
a8c21a5451d831 The etnaviv authors 2015-12-03  281  				mapping->use += 1;
a8c21a5451d831 The etnaviv authors 2015-12-03  282  			else
a8c21a5451d831 The etnaviv authors 2015-12-03  283  				mapping = NULL;
a8c21a5451d831 The etnaviv authors 2015-12-03  284  			mutex_unlock(&gpu->mmu->lock);
a8c21a5451d831 The etnaviv authors 2015-12-03  285  			if (mapping)
a8c21a5451d831 The etnaviv authors 2015-12-03  286  				goto out;
a8c21a5451d831 The etnaviv authors 2015-12-03  287  		} else {
a8c21a5451d831 The etnaviv authors 2015-12-03  288  			mapping->use += 1;
a8c21a5451d831 The etnaviv authors 2015-12-03  289  			goto out;
a8c21a5451d831 The etnaviv authors 2015-12-03  290  		}
a8c21a5451d831 The etnaviv authors 2015-12-03  291  	}
a8c21a5451d831 The etnaviv authors 2015-12-03  292  
a8c21a5451d831 The etnaviv authors 2015-12-03  293  	pages = etnaviv_gem_get_pages(etnaviv_obj);
a8c21a5451d831 The etnaviv authors 2015-12-03  294  	if (IS_ERR(pages)) {
a8c21a5451d831 The etnaviv authors 2015-12-03  295  		ret = PTR_ERR(pages);
a8c21a5451d831 The etnaviv authors 2015-12-03  296  		goto out;
a8c21a5451d831 The etnaviv authors 2015-12-03  297  	}
a8c21a5451d831 The etnaviv authors 2015-12-03  298  
a8c21a5451d831 The etnaviv authors 2015-12-03  299  	/*
a8c21a5451d831 The etnaviv authors 2015-12-03  300  	 * See if we have a reaped vram mapping we can re-use before
a8c21a5451d831 The etnaviv authors 2015-12-03  301  	 * allocating a fresh mapping.
a8c21a5451d831 The etnaviv authors 2015-12-03  302  	 */
a8c21a5451d831 The etnaviv authors 2015-12-03  303  	mapping = etnaviv_gem_get_vram_mapping(etnaviv_obj, NULL);
a8c21a5451d831 The etnaviv authors 2015-12-03  304  	if (!mapping) {
a8c21a5451d831 The etnaviv authors 2015-12-03  305  		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
ed94add00e290e Dan Carpenter       2016-01-04  306  		if (!mapping) {
ed94add00e290e Dan Carpenter       2016-01-04  307  			ret = -ENOMEM;
ed94add00e290e Dan Carpenter       2016-01-04  308  			goto out;
ed94add00e290e Dan Carpenter       2016-01-04  309  		}
a8c21a5451d831 The etnaviv authors 2015-12-03  310  
a8c21a5451d831 The etnaviv authors 2015-12-03  311  		INIT_LIST_HEAD(&mapping->scan_node);
a8c21a5451d831 The etnaviv authors 2015-12-03  312  		mapping->object = etnaviv_obj;
a8c21a5451d831 The etnaviv authors 2015-12-03  313  	} else {
a8c21a5451d831 The etnaviv authors 2015-12-03  314  		list_del(&mapping->obj_node);
a8c21a5451d831 The etnaviv authors 2015-12-03  315  	}
a8c21a5451d831 The etnaviv authors 2015-12-03  316  
a8c21a5451d831 The etnaviv authors 2015-12-03  317  	mapping->mmu = gpu->mmu;
a8c21a5451d831 The etnaviv authors 2015-12-03  318  	mapping->use = 1;
a8c21a5451d831 The etnaviv authors 2015-12-03  319  
a8c21a5451d831 The etnaviv authors 2015-12-03  320  	ret = etnaviv_iommu_map_gem(gpu->mmu, etnaviv_obj, gpu->memory_base,
a8c21a5451d831 The etnaviv authors 2015-12-03  321  				    mapping);
a8c21a5451d831 The etnaviv authors 2015-12-03  322  	if (ret < 0)
a8c21a5451d831 The etnaviv authors 2015-12-03 @323  		kfree(mapping);
a8c21a5451d831 The etnaviv authors 2015-12-03  324  	else
a8c21a5451d831 The etnaviv authors 2015-12-03  325  		list_add_tail(&mapping->obj_node, &etnaviv_obj->vram_list);
a8c21a5451d831 The etnaviv authors 2015-12-03  326  
a8c21a5451d831 The etnaviv authors 2015-12-03  327  out:
a8c21a5451d831 The etnaviv authors 2015-12-03  328  	mutex_unlock(&etnaviv_obj->lock);
a8c21a5451d831 The etnaviv authors 2015-12-03  329  
b6325f409959c7 Russell King        2016-01-21  330  	if (ret)
b6325f409959c7 Russell King        2016-01-21  331  		return ERR_PTR(ret);
b6325f409959c7 Russell King        2016-01-21  332  
a8c21a5451d831 The etnaviv authors 2015-12-03  333  	/* Take a reference on the object */
23d1dd03cc51e2 Cihangir Akturk     2017-08-03  334  	drm_gem_object_get(obj);
b6325f409959c7 Russell King        2016-01-21 @335  	return mapping;
a8c21a5451d831 The etnaviv authors 2015-12-03  336  }
a8c21a5451d831 The etnaviv authors 2015-12-03  337  

:::::: The code at line 335 was first introduced by commit
:::::: b6325f409959c7e1065ef1537f2e54cf4d7ab465 drm: etnaviv: clean up vram_mapping submission/retire path

:::::: TO: Russell King <rmk+kernel@arm.linux.org.uk>
:::::: CC: Lucas Stach <l.stach@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

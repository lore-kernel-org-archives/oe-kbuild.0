Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D05634F486
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742190; cv=none; b=Rz7o6+v6D+cKDEOvq3eWwTjtM9VoeOGuV1tt6yZUX6Y9m9pp/6hwFHpCelgbPtV5FOFoF4SnVUyAuHvVtvqCjL6O/Xhpd2eGSvklI1ZMgNIm87wgVPH1Sf2JoLzXs4jBNQzAQdmtDst4tRnSJoPspQl2bT9Sz9Rq2rsYuovidyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742190; c=relaxed/simple;
	bh=Y0lpEjL3OCD3JUZDojNbQw0Jye0g+0gxf3uYuAgPDj4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CzHcCSc41VnX3zWEfhl/PBY+77QQn0V9pRN43gUAdka5SGFIm3p9ZX0LFwwczXDyzfqVC2PO8cyXt8K/5xoPClm6NMSHzYR3CoRL89lbV1PB/oepSitKQ1m1sY8fRB5TDysVLE+jB+HdcOtEZoA4DGEyOPyA3SpTNK1dCTVoUew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIQaDFNy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIQaDFNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773742185; x=1805278185;
  h=date:from:to:cc:subject:message-id;
  bh=Y0lpEjL3OCD3JUZDojNbQw0Jye0g+0gxf3uYuAgPDj4=;
  b=CIQaDFNyzqiytj4dFXvcxhg4PWc9KNNv3+fi+AeBqD3agXY84MGWKsom
   g8ZO4JOYEqDvKyyIRkSiflnz2v+KQm691XAokvMXkcCwkT/JfdbTLqig2
   GhE9zuXL0h4jSdPBBvYR+LbntcEWdaCfYqWfrHlKAZa4xt0eqZJ2XbqHL
   HVI4SHIpPe4daRErDubrAshigaw0uZelbRnH2fFcyB+FWwxqtyoU6L46Y
   JnX6HMP+NLKlJ+0kcNtnS/UXXNAkQG2Ybu/4UyejCDTQWnuJRQCXZyyR7
   4AB1B0HbhYMdy1JH2JT4WlNdoIAPui6IWMR8zy1Q8Vr7VzIUUdWE0pXdA
   A==;
X-CSE-ConnectionGUID: OX5zPv9yQk6kGnE9fTWBCg==
X-CSE-MsgGUID: OqwXFtpGQZiMtlHGuGUL+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74684378"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74684378"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:09:44 -0700
X-CSE-ConnectionGUID: Z1bzREJtTIqg7m78s0i/tQ==
X-CSE-MsgGUID: P/ex9F2XRDiZFar/tRBbsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221449561"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 03:09:43 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2RMq-000000000DZ-0zxq;
	Tue, 17 Mar 2026 10:09:40 +0000
Date: Tue, 17 Mar 2026 18:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/accel/amdxdna/aie2_ctx.c:783:11-15: ERROR: invalid
 reference to the index variable of the iterator on line 771
Message-ID: <202603171821.yvozqOvZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lizhi Hou <lizhi.hou@amd.com>
CC: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d1373e4246da3b58e1df058374ed6b101804e07
commit: e486147c912f653ef4b60a6c7dbd4168a4c56a9f accel/amdxdna: Add BO import and export
date:   12 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-103-20260317 (https://download.01.org/0day-ci/archive/20260317/202603171821.yvozqOvZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603171821.yvozqOvZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/aie2_ctx.c:783:11-15: ERROR: invalid reference to the index variable of the iterator on line 771

vim +783 drivers/accel/amdxdna/aie2_ctx.c

aac243092b707b Lizhi Hou 2024-11-18  757  
aac243092b707b Lizhi Hou 2024-11-18  758  static int aie2_populate_range(struct amdxdna_gem_obj *abo)
aac243092b707b Lizhi Hou 2024-11-18  759  {
aac243092b707b Lizhi Hou 2024-11-18  760  	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
e486147c912f65 Lizhi Hou 2025-03-25  761  	struct amdxdna_umap *mapp;
aac243092b707b Lizhi Hou 2024-11-18  762  	unsigned long timeout;
e486147c912f65 Lizhi Hou 2025-03-25  763  	struct mm_struct *mm;
e486147c912f65 Lizhi Hou 2025-03-25  764  	bool found;
aac243092b707b Lizhi Hou 2024-11-18  765  	int ret;
aac243092b707b Lizhi Hou 2024-11-18  766  
e486147c912f65 Lizhi Hou 2025-03-25  767  	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
e486147c912f65 Lizhi Hou 2025-03-25  768  again:
e486147c912f65 Lizhi Hou 2025-03-25  769  	found = false;
e486147c912f65 Lizhi Hou 2025-03-25  770  	down_write(&xdna->notifier_lock);
e486147c912f65 Lizhi Hou 2025-03-25 @771  	list_for_each_entry(mapp, &abo->mem.umap_list, node) {
e486147c912f65 Lizhi Hou 2025-03-25  772  		if (mapp->invalid) {
e486147c912f65 Lizhi Hou 2025-03-25  773  			found = true;
e486147c912f65 Lizhi Hou 2025-03-25  774  			break;
e486147c912f65 Lizhi Hou 2025-03-25  775  		}
e486147c912f65 Lizhi Hou 2025-03-25  776  	}
aac243092b707b Lizhi Hou 2024-11-18  777  
e486147c912f65 Lizhi Hou 2025-03-25  778  	if (!found) {
e486147c912f65 Lizhi Hou 2025-03-25  779  		abo->mem.map_invalid = false;
e486147c912f65 Lizhi Hou 2025-03-25  780  		up_write(&xdna->notifier_lock);
e486147c912f65 Lizhi Hou 2025-03-25  781  		return 0;
e486147c912f65 Lizhi Hou 2025-03-25  782  	}
e486147c912f65 Lizhi Hou 2025-03-25 @783  	kref_get(&mapp->refcnt);
e486147c912f65 Lizhi Hou 2025-03-25  784  	up_write(&xdna->notifier_lock);
e486147c912f65 Lizhi Hou 2025-03-25  785  
e486147c912f65 Lizhi Hou 2025-03-25  786  	XDNA_DBG(xdna, "populate memory range %lx %lx",
e486147c912f65 Lizhi Hou 2025-03-25  787  		 mapp->vma->vm_start, mapp->vma->vm_end);
e486147c912f65 Lizhi Hou 2025-03-25  788  	mm = mapp->notifier.mm;
e486147c912f65 Lizhi Hou 2025-03-25  789  	if (!mmget_not_zero(mm)) {
e486147c912f65 Lizhi Hou 2025-03-25  790  		amdxdna_umap_put(mapp);
aac243092b707b Lizhi Hou 2024-11-18  791  		return -EFAULT;
e486147c912f65 Lizhi Hou 2025-03-25  792  	}
aac243092b707b Lizhi Hou 2024-11-18  793  
e486147c912f65 Lizhi Hou 2025-03-25  794  	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
aac243092b707b Lizhi Hou 2024-11-18  795  	mmap_read_lock(mm);
e486147c912f65 Lizhi Hou 2025-03-25  796  	ret = hmm_range_fault(&mapp->range);
aac243092b707b Lizhi Hou 2024-11-18  797  	mmap_read_unlock(mm);
aac243092b707b Lizhi Hou 2024-11-18  798  	if (ret) {
aac243092b707b Lizhi Hou 2024-11-18  799  		if (time_after(jiffies, timeout)) {
aac243092b707b Lizhi Hou 2024-11-18  800  			ret = -ETIME;
aac243092b707b Lizhi Hou 2024-11-18  801  			goto put_mm;
aac243092b707b Lizhi Hou 2024-11-18  802  		}
aac243092b707b Lizhi Hou 2024-11-18  803  
e486147c912f65 Lizhi Hou 2025-03-25  804  		if (ret == -EBUSY) {
e486147c912f65 Lizhi Hou 2025-03-25  805  			amdxdna_umap_put(mapp);
aac243092b707b Lizhi Hou 2024-11-18  806  			goto again;
e486147c912f65 Lizhi Hou 2025-03-25  807  		}
aac243092b707b Lizhi Hou 2024-11-18  808  
aac243092b707b Lizhi Hou 2024-11-18  809  		goto put_mm;
aac243092b707b Lizhi Hou 2024-11-18  810  	}
aac243092b707b Lizhi Hou 2024-11-18  811  
e486147c912f65 Lizhi Hou 2025-03-25  812  	down_write(&xdna->notifier_lock);
e486147c912f65 Lizhi Hou 2025-03-25  813  	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
e486147c912f65 Lizhi Hou 2025-03-25  814  		up_write(&xdna->notifier_lock);
e486147c912f65 Lizhi Hou 2025-03-25  815  		amdxdna_umap_put(mapp);
aac243092b707b Lizhi Hou 2024-11-18  816  		goto again;
aac243092b707b Lizhi Hou 2024-11-18  817  	}
e486147c912f65 Lizhi Hou 2025-03-25  818  	mapp->invalid = false;
e486147c912f65 Lizhi Hou 2025-03-25  819  	up_write(&xdna->notifier_lock);
e486147c912f65 Lizhi Hou 2025-03-25  820  	amdxdna_umap_put(mapp);
e486147c912f65 Lizhi Hou 2025-03-25  821  	goto again;
aac243092b707b Lizhi Hou 2024-11-18  822  
aac243092b707b Lizhi Hou 2024-11-18  823  put_mm:
e486147c912f65 Lizhi Hou 2025-03-25  824  	amdxdna_umap_put(mapp);
aac243092b707b Lizhi Hou 2024-11-18  825  	mmput(mm);
aac243092b707b Lizhi Hou 2024-11-18  826  	return ret;
aac243092b707b Lizhi Hou 2024-11-18  827  }
aac243092b707b Lizhi Hou 2024-11-18  828  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

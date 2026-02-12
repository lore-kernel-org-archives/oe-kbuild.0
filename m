Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8CA2749E6
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Feb 2026 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770931152; cv=none; b=OqO6CO/IVr7NJhVovdkfWm+7ll3G4gs2WmdZ962kbRU2wSjsj+6k7+CJpCxW0d9WWL5o6U4Y4/SEAcEZAd58FCm+zRp9jPS0oP/0GBusMQ4Bp9CEADCSpVhFuIn7mIP4RKaBvrkWNXT7/WIlP6PxsfCQctGg2WkOkfTQa1PtNW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770931152; c=relaxed/simple;
	bh=BuU2yH5N8q3c+zW7wgyDyFMY7zAEZwD1KcHkpqNsTjc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vCb5Z03EQofXn90C7udxa2hextjOYM7u2QN6YI3B2tj2hVShsydPn/OcanC2LJvq6orLg8QVIv8KD+uiuWnbgfQ63Hna4pUGU4dnNDZjuOFA/ygZDAx7yRzXq9e8bsLIEmZEr7BdK27rUBRC0JAgvpUOJsMzpKRBXGCJ6h+l7p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFeX2W/n; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFeX2W/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770931151; x=1802467151;
  h=date:from:to:cc:subject:message-id;
  bh=BuU2yH5N8q3c+zW7wgyDyFMY7zAEZwD1KcHkpqNsTjc=;
  b=iFeX2W/nPgn+Q49KJdCoKWjHrxYZ2AA3Mw+fCToxWKv+eMVyTFAOf1zR
   slFoq4nBV4WWE6ekYrDjy9Af9hiVsdchSk5nkUVY6WwmE3zE3pEWUqa6V
   EjmiMK5AYwB9tEnd4XbclIuwbpY7tpz7W/YlR1avFB8BTu1a+++GOJiin
   fhtNgZLLkBk1Kjvt0oylWFpr+F70WJvtBeZfL9gbdiBL0gad0olMs749P
   hsdJRuyzlk6O+jmexxk8XUyQS0VCj6wZfa2DOdSUrVUBaTNCQufiLycvV
   NUDWx7lZjQ+bCqEhpaIKzLO2zP0kSo80nZn3MhtnVBd0ahV2wPLXfVmEM
   w==;
X-CSE-ConnectionGUID: +O6MaaYzQMGtBzinDndCKw==
X-CSE-MsgGUID: lHA4RYm4Td+sVG1sB7OZGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89530688"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="89530688"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 13:19:11 -0800
X-CSE-ConnectionGUID: rAZ+oN/eTtWpG5ApnGsYHQ==
X-CSE-MsgGUID: GkfnRtWeQAGOGl3m5PTT4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="211991362"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Feb 2026 13:19:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqe5b-00000000tVc-1MGr;
	Thu, 12 Feb 2026 21:19:07 +0000
Date: Fri, 13 Feb 2026 05:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/accel/amdxdna/aie2_ctx.c:783:11-15: ERROR: invalid
 reference to the index variable of the iterator on line 771
Message-ID: <202602130500.8zAtfTvc-lkp@intel.com>
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
head:   541c43310e85dbf35368b43b720c6724bc8ad8ec
commit: e486147c912f653ef4b60a6c7dbd4168a4c56a9f accel/amdxdna: Add BO import and export
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-r062-20260213 (https://download.01.org/0day-ci/archive/20260213/202602130500.8zAtfTvc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602130500.8zAtfTvc-lkp@intel.com/

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

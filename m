Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EDF3A2549
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 05:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777957289; cv=none; b=kKrJPBJOAcbKbzKD4JWwCLOB8U27Q30KGposErUg7z+cclWNMFomSkIMgcTt2i6yZdWO7+Ycu/m9DH57IaiQkyTenRM/rG6k+6IniUamTV8N0/nu9TDfd1tzM4RKK+0KLDjzXK7zS28FQ4HQzeMdjfdFDd9fxvY1sx1tWWjAWk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777957289; c=relaxed/simple;
	bh=stjW/kp0/A0DtGiqf1/qf9TydvDr222W/6HEf1V9vZM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H3nLWMIPpKhufRJ+nVABZeZyTa9mdhcT/1n5Q+RzUIZ40H7+wJNU7Xw7nrWrdkg1nd0sT6CorIdAfVBlCN2CrdyyrlRPN8/Ou3YGqVvY/iUz+YEHpjQOYuIgzksRP5rm2nPOKkmOSyFCWtmlPR8cUzuzsRPBD5xS+WoDYcmRFi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbVOwbz+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbVOwbz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777957287; x=1809493287;
  h=date:from:to:cc:subject:message-id;
  bh=stjW/kp0/A0DtGiqf1/qf9TydvDr222W/6HEf1V9vZM=;
  b=IbVOwbz+wEn0Rf57ikYQsWx01gi6l5zfBxVrbaP0w7CtBVnABuI+dwRr
   qCd1Km7kPfxVu6nIZ1oN1BPEB5SNoke0fiRWNr90Yy6Vsuvoxxa8yCqzB
   P6lFNipNci/R0BFbjqq4KFdXF514PNEbmUVz6yCnUsUIfVLUhei/V6hZw
   38lh3+DlNU7kbiE9u0TxX1WoeBLi8OeBZDDX6sKI/hOhENHxDttaUSCcJ
   NHI2ID6svUlTtFxQqvL7/2kj8b2H5xs3On7xdIDC4/RZdM4Ud9Y3XSy8L
   TgPOV+aDnk3VAdjGyo3UUAWXybDP1mzo0dJYQGoTj14p46RG4pM/gjWrH
   A==;
X-CSE-ConnectionGUID: gU3im7N+SgeqHs9toxyDBA==
X-CSE-MsgGUID: 97aOalVVSPSFHIndLDoZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="90194128"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="90194128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 22:01:26 -0700
X-CSE-ConnectionGUID: rtR644AsR1O3c1enOuZz+A==
X-CSE-MsgGUID: ALktum8bS8+oVrEJCxprNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="266055842"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 May 2026 22:01:25 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK7uD-000000004GX-1qG8;
	Tue, 05 May 2026 05:01:15 +0000
Date: Tue, 05 May 2026 13:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/accel/amdxdna/aie2_ctx.c:783:11-15: ERROR: invalid
 reference to the index variable of the iterator on line 771
Message-ID: <202605051212.pVuQJULr-lkp@intel.com>
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
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: e486147c912f653ef4b60a6c7dbd4168a4c56a9f accel/amdxdna: Add BO import and export
date:   1 year, 1 month ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-104-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051212.pVuQJULr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e486147c912f ("accel/amdxdna: Add BO import and export")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605051212.pVuQJULr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/aie2_ctx.c:783:11-15: ERROR: invalid reference to the index variable of the iterator on line 771

vim +783 drivers/accel/amdxdna/aie2_ctx.c

aac243092b707bb Lizhi Hou 2024-11-18  757  
aac243092b707bb Lizhi Hou 2024-11-18  758  static int aie2_populate_range(struct amdxdna_gem_obj *abo)
aac243092b707bb Lizhi Hou 2024-11-18  759  {
aac243092b707bb Lizhi Hou 2024-11-18  760  	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
e486147c912f653 Lizhi Hou 2025-03-25  761  	struct amdxdna_umap *mapp;
aac243092b707bb Lizhi Hou 2024-11-18  762  	unsigned long timeout;
e486147c912f653 Lizhi Hou 2025-03-25  763  	struct mm_struct *mm;
e486147c912f653 Lizhi Hou 2025-03-25  764  	bool found;
aac243092b707bb Lizhi Hou 2024-11-18  765  	int ret;
aac243092b707bb Lizhi Hou 2024-11-18  766  
e486147c912f653 Lizhi Hou 2025-03-25  767  	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
e486147c912f653 Lizhi Hou 2025-03-25  768  again:
e486147c912f653 Lizhi Hou 2025-03-25  769  	found = false;
e486147c912f653 Lizhi Hou 2025-03-25  770  	down_write(&xdna->notifier_lock);
e486147c912f653 Lizhi Hou 2025-03-25 @771  	list_for_each_entry(mapp, &abo->mem.umap_list, node) {
e486147c912f653 Lizhi Hou 2025-03-25  772  		if (mapp->invalid) {
e486147c912f653 Lizhi Hou 2025-03-25  773  			found = true;
e486147c912f653 Lizhi Hou 2025-03-25  774  			break;
e486147c912f653 Lizhi Hou 2025-03-25  775  		}
e486147c912f653 Lizhi Hou 2025-03-25  776  	}
aac243092b707bb Lizhi Hou 2024-11-18  777  
e486147c912f653 Lizhi Hou 2025-03-25  778  	if (!found) {
e486147c912f653 Lizhi Hou 2025-03-25  779  		abo->mem.map_invalid = false;
e486147c912f653 Lizhi Hou 2025-03-25  780  		up_write(&xdna->notifier_lock);
e486147c912f653 Lizhi Hou 2025-03-25  781  		return 0;
e486147c912f653 Lizhi Hou 2025-03-25  782  	}
e486147c912f653 Lizhi Hou 2025-03-25 @783  	kref_get(&mapp->refcnt);
e486147c912f653 Lizhi Hou 2025-03-25  784  	up_write(&xdna->notifier_lock);
e486147c912f653 Lizhi Hou 2025-03-25  785  
e486147c912f653 Lizhi Hou 2025-03-25  786  	XDNA_DBG(xdna, "populate memory range %lx %lx",
e486147c912f653 Lizhi Hou 2025-03-25  787  		 mapp->vma->vm_start, mapp->vma->vm_end);
e486147c912f653 Lizhi Hou 2025-03-25  788  	mm = mapp->notifier.mm;
e486147c912f653 Lizhi Hou 2025-03-25  789  	if (!mmget_not_zero(mm)) {
e486147c912f653 Lizhi Hou 2025-03-25  790  		amdxdna_umap_put(mapp);
aac243092b707bb Lizhi Hou 2024-11-18  791  		return -EFAULT;
e486147c912f653 Lizhi Hou 2025-03-25  792  	}
aac243092b707bb Lizhi Hou 2024-11-18  793  
e486147c912f653 Lizhi Hou 2025-03-25  794  	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
aac243092b707bb Lizhi Hou 2024-11-18  795  	mmap_read_lock(mm);
e486147c912f653 Lizhi Hou 2025-03-25  796  	ret = hmm_range_fault(&mapp->range);
aac243092b707bb Lizhi Hou 2024-11-18  797  	mmap_read_unlock(mm);
aac243092b707bb Lizhi Hou 2024-11-18  798  	if (ret) {
aac243092b707bb Lizhi Hou 2024-11-18  799  		if (time_after(jiffies, timeout)) {
aac243092b707bb Lizhi Hou 2024-11-18  800  			ret = -ETIME;
aac243092b707bb Lizhi Hou 2024-11-18  801  			goto put_mm;
aac243092b707bb Lizhi Hou 2024-11-18  802  		}
aac243092b707bb Lizhi Hou 2024-11-18  803  
e486147c912f653 Lizhi Hou 2025-03-25  804  		if (ret == -EBUSY) {
e486147c912f653 Lizhi Hou 2025-03-25  805  			amdxdna_umap_put(mapp);
aac243092b707bb Lizhi Hou 2024-11-18  806  			goto again;
e486147c912f653 Lizhi Hou 2025-03-25  807  		}
aac243092b707bb Lizhi Hou 2024-11-18  808  
aac243092b707bb Lizhi Hou 2024-11-18  809  		goto put_mm;
aac243092b707bb Lizhi Hou 2024-11-18  810  	}
aac243092b707bb Lizhi Hou 2024-11-18  811  
e486147c912f653 Lizhi Hou 2025-03-25  812  	down_write(&xdna->notifier_lock);
e486147c912f653 Lizhi Hou 2025-03-25  813  	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
e486147c912f653 Lizhi Hou 2025-03-25  814  		up_write(&xdna->notifier_lock);
e486147c912f653 Lizhi Hou 2025-03-25  815  		amdxdna_umap_put(mapp);
aac243092b707bb Lizhi Hou 2024-11-18  816  		goto again;
aac243092b707bb Lizhi Hou 2024-11-18  817  	}
e486147c912f653 Lizhi Hou 2025-03-25  818  	mapp->invalid = false;
e486147c912f653 Lizhi Hou 2025-03-25  819  	up_write(&xdna->notifier_lock);
e486147c912f653 Lizhi Hou 2025-03-25  820  	amdxdna_umap_put(mapp);
e486147c912f653 Lizhi Hou 2025-03-25  821  	goto again;
aac243092b707bb Lizhi Hou 2024-11-18  822  
aac243092b707bb Lizhi Hou 2024-11-18  823  put_mm:
e486147c912f653 Lizhi Hou 2025-03-25  824  	amdxdna_umap_put(mapp);
aac243092b707bb Lizhi Hou 2024-11-18  825  	mmput(mm);
aac243092b707bb Lizhi Hou 2024-11-18  826  	return ret;
aac243092b707bb Lizhi Hou 2024-11-18  827  }
aac243092b707bb Lizhi Hou 2024-11-18  828  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

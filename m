Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA61D798E
	for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 05:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748409975; cv=none; b=VV68w8onoKz0IWmJl2AviU15ydv+4f7oDKC8DO+dpyeuTpsb1CJQnJUH6yT47CiMSYul8dWbvn3mHT0gg2tuKJ4YNlMbMtg4RDe1QNVaBySGscJyxOBFSUEY9L6lr8HkMO2UL2q8C56oFYM41s/Kh42+al5IyLjOERmAOKRCAwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748409975; c=relaxed/simple;
	bh=rFgjqWSErzxXdGE5MT+rBv4VozNEr6hKCboVB+KBnWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ch1wF9uPwrOakmGR4pcNvph0XyQmApkos0OkvBrwLmxgUb7Vh8+1wyDANRUPohn9cEE80hPC6NUeuG/UEgDzSCPPJMc97FUDPxig9//zlwC1IZnCs1qEJK5vKBzj5Wl2gv9GIGfeTJehB3I38XcJ7vrldtbHyQq976ZqCv8g5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aARykGmw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aARykGmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748409973; x=1779945973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rFgjqWSErzxXdGE5MT+rBv4VozNEr6hKCboVB+KBnWc=;
  b=aARykGmwVAp3/VvKdQ8Ubu/FF+6KdTNMDsoK2dJ4TSCRNoKlTuX7h814
   GpD6vwoy3yZqHKGKy1fKNif9TMRSzEnoR3F7s+8FLF4jzh02ORz/UBIOa
   qE8bdWHjrexHUHX3vWhkDcjnredTawveWrRdVuf6qgSY/UTSPZPyERMNa
   bBORdtYIUOZYG7xaokDlYKaQMZr0om3w6qv6Mi/DxZpwyU0vmnHtDJ9fd
   p1Y+WuDDLFMPkOQPSENT1d0ao9YCAInj7P7X02fcvqHLm/1qDd7CmuCsp
   bAcskCE+dspzuLdD86WkjpJzKrY1qww8HXu/lnijZXw1B4Grr5i2o61kA
   Q==;
X-CSE-ConnectionGUID: P+wjrsUGQ5GregBljiYAxQ==
X-CSE-MsgGUID: 3ysPP4CPReiMBjb1grmEUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="38043496"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="38043496"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 22:26:12 -0700
X-CSE-ConnectionGUID: FVdZ1xhoT3GL33Ji6P+ipg==
X-CSE-MsgGUID: rHUbbs3XQIKC90adtBVtDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143745007"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 May 2025 22:26:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK9Im-000VIK-1p;
	Wed, 28 May 2025 05:26:08 +0000
Date: Wed, 28 May 2025 13:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 925/13594]
 drivers/accel/amdxdna/aie2_ctx.c:783:11-15: ERROR: invalid reference to the
 index variable of the iterator on line 771
Message-ID: <202505281325.z3xXj6QG-lkp@intel.com>
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
TO: Lizhi Hou <lizhi.hou@amd.com>
CC: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fefff2755f2aa4125dce2a1edfe7e545c7c621f2
commit: e486147c912f653ef4b60a6c7dbd4168a4c56a9f [925/13594] accel/amdxdna: Add BO import and export
:::::: branch date: 19 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-101-20250528 (https://download.01.org/0day-ci/archive/20250528/202505281325.z3xXj6QG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505281325.z3xXj6QG-lkp@intel.com/

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

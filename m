Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAE7237180
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 04:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756269174; cv=none; b=oNaRouOPLph6bvrHMItTpQK0SwRl0AkqV4C0aQ83cJmOPtKKLuF0s9xhBTgJluFzws+9x5DcPWuR8MegXRoJ1jIH90XYppI4mfOu3ThCBvXBiOKelspmLhSEUtwk3nhlwTzh3MMnhjfScDHTc67HFgNiUTM68wZnliXnZceMOSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756269174; c=relaxed/simple;
	bh=u4LKtaD2BWXoQzlpk+DtwEeXpOMsa12Bgn1isMP9zjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s9CQj3RVghFr9OqT4malgvbB8KCo7AcI8qhWKAUzZRh7FFTQxLyVERSnt0fCqksjL+zoNekadOZmvx1IPr8OzJwaqIhlCszTcuFbKik8tn5WHwGUY2/ZmlA3Rc/FK0j8epSZviAwIlJmx88cl/Om3zcDj7DRuP+WXzUNyzBJLVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1eG+i0i; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1eG+i0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756269173; x=1787805173;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u4LKtaD2BWXoQzlpk+DtwEeXpOMsa12Bgn1isMP9zjY=;
  b=K1eG+i0iHMYPY33wm/o8MeReLga9iqxWY/ddLwvhCGjNMZQHiWmosr9L
   91ocfiphhAUZ2YIO/RuQAi+KmyVrFfu9498S/33Bn3icEMpuv/MdfjRS1
   WWP7W1+Xiif2Pg5yckAQTrfAZ920PEBZva2hmPMzFa4PT9NehaZBUfhE+
   ys8/RbGKJwVJk9BUbcVMskCw+J2Ws2t88Tv5ByE4XIaka44IMvmJ4u+XU
   NEFYpgeugfjU6SKK9/OF3JPTkMYZrtCRXL3KdyH0TyMCXYfq7RQU1WUYz
   Hsx+gHbcex3u5oSsizU31h1UutYApBYU+n2ioraYLjSJW9Q3bx893tM9B
   w==;
X-CSE-ConnectionGUID: nkL2rCJrRgeg13zhlGSG8g==
X-CSE-MsgGUID: xAJIZ1KURq+PdD3QqvZ85Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61153084"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="61153084"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 21:32:52 -0700
X-CSE-ConnectionGUID: I9w1czkERuOPIc5ji6B24g==
X-CSE-MsgGUID: KnhIKgWSQJaetuKCV6g50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="173912507"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Aug 2025 21:32:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur7pe-000Sfx-1m;
	Wed, 27 Aug 2025 04:32:36 +0000
Date: Wed, 27 Aug 2025 12:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_pt.c:1479 xe_pt_svm_pre_commit() warn:
 iterator 'i' not incremented
Message-ID: <202508271245.1IpS8Iap-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fab1beda7597fac1cecc01707d55eadb6bbe773c
commit: 09ba0a8f06cd69d93eef0dc3bee33546880e46f8 drm/xe/svm: Implement prefetch support for SVM ranges
date:   4 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271245.1IpS8Iap-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508271245.1IpS8Iap-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:1479 xe_pt_svm_pre_commit() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:762 xe_pt_stage_bind() error: we previously assumed 'bo' could be null (see line 753)
drivers/gpu/drm/xe/xe_pt.c:2088 op_prepare() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_pt.c:2307 op_commit() warn: iterator 'i' not incremented

vim +/i +1479 drivers/gpu/drm/xe/xe_pt.c

dd08ebf6c3525a Matthew Brost         2023-03-30  1454  
6c55404d4f7306 Thomas Hellström      2025-03-26  1455  #if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
7d1d48fb1724b3 Matthew Brost         2025-03-05  1456  static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
7d1d48fb1724b3 Matthew Brost         2025-03-05  1457  {
7d1d48fb1724b3 Matthew Brost         2025-03-05  1458  	struct xe_vm *vm = pt_update->vops->vm;
7d1d48fb1724b3 Matthew Brost         2025-03-05  1459  	struct xe_vma_ops *vops = pt_update->vops;
7d1d48fb1724b3 Matthew Brost         2025-03-05  1460  	struct xe_vma_op *op;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1461  	unsigned long i;
7d1d48fb1724b3 Matthew Brost         2025-03-05  1462  	int err;
7d1d48fb1724b3 Matthew Brost         2025-03-05  1463  
7d1d48fb1724b3 Matthew Brost         2025-03-05  1464  	err = xe_pt_pre_commit(pt_update);
7d1d48fb1724b3 Matthew Brost         2025-03-05  1465  	if (err)
7d1d48fb1724b3 Matthew Brost         2025-03-05  1466  		return err;
7d1d48fb1724b3 Matthew Brost         2025-03-05  1467  
7d1d48fb1724b3 Matthew Brost         2025-03-05  1468  	xe_svm_notifier_lock(vm);
7d1d48fb1724b3 Matthew Brost         2025-03-05  1469  
7d1d48fb1724b3 Matthew Brost         2025-03-05  1470  	list_for_each_entry(op, &vops->list, link) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1471  		struct xe_svm_range *range = NULL;
7d1d48fb1724b3 Matthew Brost         2025-03-05  1472  
d1e6efdfabf3e5 Matthew Brost         2025-03-05  1473  		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
d1e6efdfabf3e5 Matthew Brost         2025-03-05  1474  			continue;
d1e6efdfabf3e5 Matthew Brost         2025-03-05  1475  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1476  		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1477  			xe_assert(vm->xe,
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1478  				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13 @1479  			xa_for_each(&op->prefetch_range.range, i, range) {
d92eabb370ceb1 Matthew Brost         2025-03-05  1480  				xe_svm_range_debug(range, "PRE-COMMIT");
d92eabb370ceb1 Matthew Brost         2025-03-05  1481  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1482  				if (!xe_svm_range_pages_valid(range)) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1483  					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1484  					xe_svm_notifier_unlock(vm);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1485  					return -ENODATA;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1486  				}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1487  			}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1488  		} else {
7d1d48fb1724b3 Matthew Brost         2025-03-05  1489  			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
7d1d48fb1724b3 Matthew Brost         2025-03-05  1490  			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1491  			range = op->map_range.range;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1492  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1493  			xe_svm_range_debug(range, "PRE-COMMIT");
7d1d48fb1724b3 Matthew Brost         2025-03-05  1494  
7d1d48fb1724b3 Matthew Brost         2025-03-05  1495  			if (!xe_svm_range_pages_valid(range)) {
d92eabb370ceb1 Matthew Brost         2025-03-05  1496  				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
7d1d48fb1724b3 Matthew Brost         2025-03-05  1497  				xe_svm_notifier_unlock(vm);
7d1d48fb1724b3 Matthew Brost         2025-03-05  1498  				return -EAGAIN;
7d1d48fb1724b3 Matthew Brost         2025-03-05  1499  			}
7d1d48fb1724b3 Matthew Brost         2025-03-05  1500  		}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  1501  	}
7d1d48fb1724b3 Matthew Brost         2025-03-05  1502  
7d1d48fb1724b3 Matthew Brost         2025-03-05  1503  	return 0;
7d1d48fb1724b3 Matthew Brost         2025-03-05  1504  }
6c55404d4f7306 Thomas Hellström      2025-03-26  1505  #endif
7d1d48fb1724b3 Matthew Brost         2025-03-05  1506  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

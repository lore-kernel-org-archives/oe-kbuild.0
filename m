Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D2A189
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 00:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756252916; cv=none; b=reO88iRmRcLIHM7lMXgH8MqtFj3JrSMzkAhrCGFca3wra6tY9//W0JS/Php8OV/++HtvCIjHsYBfMjGOUcZdpcgjxuRmCtQNEySIdHeIyQjvRD8yiMPTrnEprJjZygY7LglliBgITNn7l7jbXeqWCH52+j/MNjNJRcl3rRXWB3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756252916; c=relaxed/simple;
	bh=Eihd/sWnFhpTeq71V8B/d6wsAX19iHWZXVFb7ObMLPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFHrNLiUfVTPA8yqXxRvGTHL9eWkolZspH1g9Ldk3NHuImlcVNOy0NZ0WJIEmsc7aUd+c1KNtSp7qN+ICiiLMqQqaV8h3wroHSXDKPXdSrfotQqPM9odCe8NA4a1zwYV1V0eEgNRobJ9rOMPJ2xZ1nSz57n0N5rgmNe4HcpUQ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrouRgj1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrouRgj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756252915; x=1787788915;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Eihd/sWnFhpTeq71V8B/d6wsAX19iHWZXVFb7ObMLPw=;
  b=nrouRgj1vDUktZrmSs2Mv7F3emZku64hBIAgHJhzwQjRT1LhLkVcIZHA
   w3qT65n/zSejJyl7dIedkV+RtGId34cXdafwFpvoZAlR1aEcersyAbvzg
   W0JelS4JVQyPgr76V+71gJi5YDe+BfQRCDAwDvuGAKZ6trhyHGj4DEruu
   QulE93J/sSCCxYsRtb1IabUwnex1lJ45AB0XcJ4P+rmaDx4mZeAoHyw7g
   ohWVdUAogEkBEJ/gq5dVSPn/pnmzO2A24vjg+fSrZ708I1pqgHrGB9YJ2
   YZIK1geUMxfpKMYkzLD9iWy26TIq3h9aUofBw4wizAUl4B0xTqQGEJOa0
   w==;
X-CSE-ConnectionGUID: 2IpXfhouRoK9A3sl+SPw5A==
X-CSE-MsgGUID: GY1oBWtGSgyg6uLmrbB/Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="76101911"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="76101911"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 17:01:54 -0700
X-CSE-ConnectionGUID: HN3rYyo1QlirqISuq08tfQ==
X-CSE-MsgGUID: 3gNYB14WSeK5xx5jutBZ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="174967685"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Aug 2025 17:01:53 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur3br-000SVk-0t;
	Wed, 27 Aug 2025 00:01:51 +0000
Date: Wed, 27 Aug 2025 08:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/drm_gpusvm.c:918 drm_gpusvm_range_chunk_size()
 error: uninitialized symbol 'end'.
Message-ID: <202508270720.FhntnxAb-lkp@intel.com>
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
TO: Matthew Brost <matthew.brost@intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fab1beda7597fac1cecc01707d55eadb6bbe773c
commit: 0a8d6d424b3e65650942fcb87fe34561dca3500f drm/xe: Select DRM_GPUSVM Kconfig
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20250827 (https://download.01.org/0day-ci/archive/20250827/202508270720.FhntnxAb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508270720.FhntnxAb-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_gpusvm.c:918 drm_gpusvm_range_chunk_size() error: uninitialized symbol 'end'.
drivers/gpu/drm/drm_gpusvm.c:918 drm_gpusvm_range_chunk_size() error: uninitialized symbol 'start'.
drivers/gpu/drm/drm_gpusvm.c:1423 drm_gpusvm_range_get_pages() error: uninitialized symbol 'dpagemap'.

Old smatch warnings:
drivers/gpu/drm/drm_gpusvm.c:1404 drm_gpusvm_range_get_pages() error: uninitialized symbol 'pagemap'.

vim +/end +918 drivers/gpu/drm/drm_gpusvm.c

99624bdff86707 Matthew Brost 2025-03-05  870  
99624bdff86707 Matthew Brost 2025-03-05  871  /**
99624bdff86707 Matthew Brost 2025-03-05  872   * drm_gpusvm_range_chunk_size() - Determine chunk size for GPU SVM range
99624bdff86707 Matthew Brost 2025-03-05  873   * @gpusvm: Pointer to the GPU SVM structure
99624bdff86707 Matthew Brost 2025-03-05  874   * @notifier: Pointer to the GPU SVM notifier structure
99624bdff86707 Matthew Brost 2025-03-05  875   * @vas: Pointer to the virtual memory area structure
99624bdff86707 Matthew Brost 2025-03-05  876   * @fault_addr: Fault address
99624bdff86707 Matthew Brost 2025-03-05  877   * @gpuva_start: Start address of GPUVA which mirrors CPU
99624bdff86707 Matthew Brost 2025-03-05  878   * @gpuva_end: End address of GPUVA which mirrors CPU
99624bdff86707 Matthew Brost 2025-03-05  879   * @check_pages_threshold: Check CPU pages for present threshold
99624bdff86707 Matthew Brost 2025-03-05  880   *
99624bdff86707 Matthew Brost 2025-03-05  881   * This function determines the chunk size for the GPU SVM range based on the
99624bdff86707 Matthew Brost 2025-03-05  882   * fault address, GPU SVM chunk sizes, existing GPU SVM ranges, and the virtual
99624bdff86707 Matthew Brost 2025-03-05  883   * memory area boundaries.
99624bdff86707 Matthew Brost 2025-03-05  884   *
99624bdff86707 Matthew Brost 2025-03-05  885   * Return: Chunk size on success, LONG_MAX on failure.
99624bdff86707 Matthew Brost 2025-03-05  886   */
99624bdff86707 Matthew Brost 2025-03-05  887  static unsigned long
99624bdff86707 Matthew Brost 2025-03-05  888  drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
99624bdff86707 Matthew Brost 2025-03-05  889  			    struct drm_gpusvm_notifier *notifier,
99624bdff86707 Matthew Brost 2025-03-05  890  			    struct vm_area_struct *vas,
99624bdff86707 Matthew Brost 2025-03-05  891  			    unsigned long fault_addr,
99624bdff86707 Matthew Brost 2025-03-05  892  			    unsigned long gpuva_start,
99624bdff86707 Matthew Brost 2025-03-05  893  			    unsigned long gpuva_end,
99624bdff86707 Matthew Brost 2025-03-05  894  			    unsigned long check_pages_threshold)
99624bdff86707 Matthew Brost 2025-03-05  895  {
99624bdff86707 Matthew Brost 2025-03-05  896  	unsigned long start, end;
99624bdff86707 Matthew Brost 2025-03-05  897  	int i = 0;
99624bdff86707 Matthew Brost 2025-03-05  898  
99624bdff86707 Matthew Brost 2025-03-05  899  retry:
99624bdff86707 Matthew Brost 2025-03-05  900  	for (; i < gpusvm->num_chunks; ++i) {
99624bdff86707 Matthew Brost 2025-03-05  901  		start = ALIGN_DOWN(fault_addr, gpusvm->chunk_sizes[i]);
99624bdff86707 Matthew Brost 2025-03-05  902  		end = ALIGN(fault_addr + 1, gpusvm->chunk_sizes[i]);
99624bdff86707 Matthew Brost 2025-03-05  903  
99624bdff86707 Matthew Brost 2025-03-05  904  		if (start >= vas->vm_start && end <= vas->vm_end &&
99624bdff86707 Matthew Brost 2025-03-05  905  		    start >= drm_gpusvm_notifier_start(notifier) &&
99624bdff86707 Matthew Brost 2025-03-05  906  		    end <= drm_gpusvm_notifier_end(notifier) &&
99624bdff86707 Matthew Brost 2025-03-05  907  		    start >= gpuva_start && end <= gpuva_end)
99624bdff86707 Matthew Brost 2025-03-05  908  			break;
99624bdff86707 Matthew Brost 2025-03-05  909  	}
99624bdff86707 Matthew Brost 2025-03-05  910  
99624bdff86707 Matthew Brost 2025-03-05  911  	if (i == gpusvm->num_chunks)
99624bdff86707 Matthew Brost 2025-03-05  912  		return LONG_MAX;
99624bdff86707 Matthew Brost 2025-03-05  913  
99624bdff86707 Matthew Brost 2025-03-05  914  	/*
99624bdff86707 Matthew Brost 2025-03-05  915  	 * If allocation more than page, ensure not to overlap with existing
99624bdff86707 Matthew Brost 2025-03-05  916  	 * ranges.
99624bdff86707 Matthew Brost 2025-03-05  917  	 */
99624bdff86707 Matthew Brost 2025-03-05 @918  	if (end - start != SZ_4K) {
99624bdff86707 Matthew Brost 2025-03-05  919  		struct drm_gpusvm_range *range;
99624bdff86707 Matthew Brost 2025-03-05  920  
99624bdff86707 Matthew Brost 2025-03-05  921  		range = drm_gpusvm_range_find(notifier, start, end);
99624bdff86707 Matthew Brost 2025-03-05  922  		if (range) {
99624bdff86707 Matthew Brost 2025-03-05  923  			++i;
99624bdff86707 Matthew Brost 2025-03-05  924  			goto retry;
99624bdff86707 Matthew Brost 2025-03-05  925  		}
99624bdff86707 Matthew Brost 2025-03-05  926  
99624bdff86707 Matthew Brost 2025-03-05  927  		/*
99624bdff86707 Matthew Brost 2025-03-05  928  		 * XXX: Only create range on pages CPU has faulted in. Without
99624bdff86707 Matthew Brost 2025-03-05  929  		 * this check, or prefault, on BMG 'xe_exec_system_allocator --r
99624bdff86707 Matthew Brost 2025-03-05  930  		 * process-many-malloc' fails. In the failure case, each process
99624bdff86707 Matthew Brost 2025-03-05  931  		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
99624bdff86707 Matthew Brost 2025-03-05  932  		 * ranges. When migrating the SVM ranges, some processes fail in
99624bdff86707 Matthew Brost 2025-03-05  933  		 * drm_gpusvm_migrate_to_devmem with 'migrate.cpages != npages'
99624bdff86707 Matthew Brost 2025-03-05  934  		 * and then upon drm_gpusvm_range_get_pages device pages from
99624bdff86707 Matthew Brost 2025-03-05  935  		 * other processes are collected + faulted in which creates all
99624bdff86707 Matthew Brost 2025-03-05  936  		 * sorts of problems. Unsure exactly how this happening, also
99624bdff86707 Matthew Brost 2025-03-05  937  		 * problem goes away if 'xe_exec_system_allocator --r
99624bdff86707 Matthew Brost 2025-03-05  938  		 * process-many-malloc' mallocs at least 64k at a time.
99624bdff86707 Matthew Brost 2025-03-05  939  		 */
99624bdff86707 Matthew Brost 2025-03-05  940  		if (end - start <= check_pages_threshold &&
99624bdff86707 Matthew Brost 2025-03-05  941  		    !drm_gpusvm_check_pages(gpusvm, notifier, start, end)) {
99624bdff86707 Matthew Brost 2025-03-05  942  			++i;
99624bdff86707 Matthew Brost 2025-03-05  943  			goto retry;
99624bdff86707 Matthew Brost 2025-03-05  944  		}
99624bdff86707 Matthew Brost 2025-03-05  945  	}
99624bdff86707 Matthew Brost 2025-03-05  946  
99624bdff86707 Matthew Brost 2025-03-05  947  	return end - start;
99624bdff86707 Matthew Brost 2025-03-05  948  }
99624bdff86707 Matthew Brost 2025-03-05  949  

:::::: The code at line 918 was first introduced by commit
:::::: 99624bdff8670795b678eafa6509aaad3a5c0175 drm/gpusvm: Add support for GPU Shared Virtual Memory

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Matthew Brost <matthew.brost@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

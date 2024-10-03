Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35E4C8F
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Oct 2024 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727985714; cv=none; b=uI4YJnWwKI205f1zlAgCwTWUWHh3R6jgdFQbReoe84vtWCsXV4sNvMAg2sUIjIbTeExFIXdozncHl9dQVa2oStqBxtPTtj5YgpbcDx+tWw1CIncXm15kwOHVkauFHqTR1Dd5plK8l/qeJbLEUD5Nbpz/Mi10HwQFebXmIZioYjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727985714; c=relaxed/simple;
	bh=d6T5Jy7o1zfjWXqHd0rHb3ihN8dIC0h4nKfCkJ5lhb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ez0GqSdcQsXt8ZejPl5aFPt6y+2jQO+o4OfAH5Hx5t+8Io8xCZiiabDBKtu+/d6K8qWBvvrS7ulwOi57nWSbmcOOzCoy40xMgjzL/FF6NGZ6WR9TE1m/lNwQfim2zHy3cNA8QOGsanIMNZIBvpXK06woksM+xm1jU6BoDEi3jvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyG7X56K; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyG7X56K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727985712; x=1759521712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6T5Jy7o1zfjWXqHd0rHb3ihN8dIC0h4nKfCkJ5lhb0=;
  b=iyG7X56KUBYToRZz9qjwePRbn0RDYRLsZ6ca/b9S/Rw3YCeJWPCel/JY
   yT1JfuZkiGxNn02FXeoey8Lk7rMa8amR+zRoAm30tSF62Or0cYpILMxZe
   4nkhqCGgdDqMRE7AdystTJxjw+V2f6bq2EWARrv0TQ8JzHqAbOm9qpgaM
   SiWfB4Wn91kBwB5ZEU5S9GklTRSkZnTGhkJGoA6bguIROFb8+ccn4qehy
   DCUiVlDmqN4wYhWhmRZS/uSNJNe8cPJ+IuF/O+P8KrIaTtMAaA0Ct2GDw
   AQ6q5KomXUxIN5vxjAW8nNriRQJUQWhcW8j3YlFE8vm4U8NY2IYpC47Fs
   w==;
X-CSE-ConnectionGUID: GpMm6Xz9SueYEoB/f9avyg==
X-CSE-MsgGUID: 7GM5euvyTVm2NDlIMGCW2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="14818240"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="14818240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 13:01:51 -0700
X-CSE-ConnectionGUID: cFwpSN3qQAKk00G2p28ZQA==
X-CSE-MsgGUID: DKs8I/F8Q0SkPHJQr9zFQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="78469383"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Oct 2024 13:01:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swS1E-0000qe-05;
	Thu, 03 Oct 2024 20:01:48 +0000
Date: Fri, 4 Oct 2024 04:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kvm/mmu.c:471 kvm_arch_commit_memory_region() error:
 we previously assumed 'new' could be null (see line 448)
Message-ID: <202410040352.GBavOxoc-lkp@intel.com>
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
TO: Bibo Mao <maobibo@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ec462100ef9142344ddbf86f2c3008b97acddbe
commit: b072cbf0233b1fd9d84730cbe5cd1706dcacd354 LoongArch: KVM: Discard dirty page tracking on readonly memslot
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r071-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040352.GBavOxoc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410040352.GBavOxoc-lkp@intel.com/

New smatch warnings:
arch/loongarch/kvm/mmu.c:471 kvm_arch_commit_memory_region() error: we previously assumed 'new' could be null (see line 448)

Old smatch warnings:
arch/loongarch/kvm/mmu.c:902 kvm_map_page() warn: if statement not indented

vim +/new +471 arch/loongarch/kvm/mmu.c

7ab6fb505b2a74 Bibo Mao     2023-12-19  440  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  441  void kvm_arch_commit_memory_region(struct kvm *kvm,
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  442  				   struct kvm_memory_slot *old,
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  443  				   const struct kvm_memory_slot *new,
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  444  				   enum kvm_mr_change change)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  445  {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  446  	int needs_flush;
b072cbf0233b1f Bibo Mao     2024-07-09  447  	u32 old_flags = old ? old->flags : 0;
b072cbf0233b1f Bibo Mao     2024-07-09 @448  	u32 new_flags = new ? new->flags : 0;
b072cbf0233b1f Bibo Mao     2024-07-09  449  	bool log_dirty_pages = new_flags & KVM_MEM_LOG_DIRTY_PAGES;
b072cbf0233b1f Bibo Mao     2024-07-09  450  
b072cbf0233b1f Bibo Mao     2024-07-09  451  	/* Only track memslot flags changed */
b072cbf0233b1f Bibo Mao     2024-07-09  452  	if (change != KVM_MR_FLAGS_ONLY)
b072cbf0233b1f Bibo Mao     2024-07-09  453  		return;
b072cbf0233b1f Bibo Mao     2024-07-09  454  
b072cbf0233b1f Bibo Mao     2024-07-09  455  	/* Discard dirty page tracking on readonly memslot */
b072cbf0233b1f Bibo Mao     2024-07-09  456  	if ((old_flags & new_flags) & KVM_MEM_READONLY)
b072cbf0233b1f Bibo Mao     2024-07-09  457  		return;
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  458  
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  459  	/*
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  460  	 * If dirty page logging is enabled, write protect all pages in the slot
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  461  	 * ready for dirty logging.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  462  	 *
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  463  	 * There is no need to do this in any of the following cases:
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  464  	 * CREATE:	No dirty mappings will already exist.
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  465  	 * MOVE/DELETE:	The old mappings will already have been cleaned up by
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  466  	 *		kvm_arch_flush_shadow_memslot()
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  467  	 */
b072cbf0233b1f Bibo Mao     2024-07-09  468  	if (!(old_flags & KVM_MEM_LOG_DIRTY_PAGES) && log_dirty_pages) {
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  469  		spin_lock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  470  		/* Write protect GPA page table entries */
752e2cd7b4fb41 Tianrui Zhao 2023-10-02 @471  		needs_flush = kvm_mkclean_gpa_pt(kvm, new->base_gfn,
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  472  					new->base_gfn + new->npages);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  473  		spin_unlock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  474  		if (needs_flush)
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  475  			kvm_flush_remote_tlbs(kvm);
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  476  	}
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  477  }
752e2cd7b4fb41 Tianrui Zhao 2023-10-02  478  

:::::: The code at line 471 was first introduced by commit
:::::: 752e2cd7b4fb412f3e008493e0195e357bab9773 LoongArch: KVM: Implement kvm mmu operations

:::::: TO: Tianrui Zhao <zhaotianrui@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6404A4AED4
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jun 2024 06:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717654452; cv=none; b=ZlP94nRQ/g87BUL+dpfkoFlbjWWxFnJ9ME9A+1gYT7xtG/FaaXylbFAWvdTtGYJkNWXbeO0C/Ls87bEpI1D4zCp8D4xhaTcEPgC6tQyqOG4mbYeuqX+tuzSk1yfFcMlOsb7lLGl/piaWrWNJhcbs84QIrxbYuu4UOZ7sRtkitQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717654452; c=relaxed/simple;
	bh=/c4j7TGMwWf7s+U3OfvxBqjQDxcbOT9c4U5Y5OaWYCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3ihMbcsf6oRcAy9XwhEpP+sZvGBRBhnyuSzCiLgNkc0QYsfOxDJ4cuFAuUG1I+IkPLbig2T2VhDWQdwpFln7QfKldXPxkTtAhD9lOJfS1m72gAa4HzeMZ/kMB16krNgh4jBagaaLccgYukFAJFn1TR3zCY19rDvgr+3f5K0Z+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D48yQIUe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D48yQIUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717654451; x=1749190451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/c4j7TGMwWf7s+U3OfvxBqjQDxcbOT9c4U5Y5OaWYCY=;
  b=D48yQIUebohpscYQpCKTeSTSVxWpo45z6vnDCoOd9VCkFYXigtVVX6BR
   VTDduNARmKWa358W7ToFF0mx5FG4j1Aj1Phxbm3iC2kRGnoBRgfERwxag
   Gym+rYjqCa83V87JwdN3ctm1jCQcYTOhO8vTLNPYyYAjiyASML6X+N2C2
   2c5vl+1biocrVT9FUDeAxUTKyVprGaL/sn9+aCXVS80XGN6F/VdY0VjOJ
   Yp3hXRV8X1QC2C9peg7LaBNYWWMCKtQTsigBHEryR02bJRQIy+Sk9iulC
   Efyz8l4noV32KB7jCrzy1xn2a3Pq+laBUms0KZCw44ZT9SxAhaPYobcoT
   g==;
X-CSE-ConnectionGUID: A0RIyI0zQhOc4kG+vGbtRA==
X-CSE-MsgGUID: IqiU1EDyS6aW5Vu9XhmQ/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39703514"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="39703514"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 23:14:09 -0700
X-CSE-ConnectionGUID: GtoeXdeDQJGLP5Cfw29D4A==
X-CSE-MsgGUID: P1Fz1gEvTcm8vg8Gjo6hww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="42264269"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jun 2024 23:14:08 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF6Nx-0002k7-2q;
	Thu, 06 Jun 2024 06:14:05 +0000
Date: Thu, 6 Jun 2024 14:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] LoongArch: KVM: Discard dirty page tracking on readonly
 memslot
Message-ID: <202406061343.WHIwk2tu-lkp@intel.com>
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
In-Reply-To: <20240604121502.1985410-1-maobibo@loongson.cn>
References: <20240604121502.1985410-1-maobibo@loongson.cn>
TO: Bibo Mao <maobibo@loongson.cn>
TO: Tianrui Zhao <zhaotianrui@loongson.cn>
TO: Huacai Chen <chenhuacai@kernel.org>
CC: WANG Xuerui <kernel@xen0n.name>
CC: kvm@vger.kernel.org
CC: loongarch@lists.linux.dev
CC: linux-kernel@vger.kernel.org

Hi Bibo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2ab79514109578fc4b6df90633d500cf281eb689]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibo-Mao/LoongArch-KVM-Discard-dirty-page-tracking-on-readonly-memslot/20240604-201716
base:   2ab79514109578fc4b6df90633d500cf281eb689
patch link:    https://lore.kernel.org/r/20240604121502.1985410-1-maobibo%40loongson.cn
patch subject: [PATCH] LoongArch: KVM: Discard dirty page tracking on readonly memslot
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r081-20240606 (https://download.01.org/0day-ci/archive/20240606/202406061343.WHIwk2tu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406061343.WHIwk2tu-lkp@intel.com/

New smatch warnings:
arch/loongarch/kvm/mmu.c:471 kvm_arch_commit_memory_region() error: we previously assumed 'new' could be null (see line 448)

Old smatch warnings:
arch/loongarch/kvm/mmu.c:892 kvm_map_page() warn: if statement not indented

vim +/new +471 arch/loongarch/kvm/mmu.c

7ab6fb505b2a744 Bibo Mao     2023-12-19  440  
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  441  void kvm_arch_commit_memory_region(struct kvm *kvm,
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  442  				   struct kvm_memory_slot *old,
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  443  				   const struct kvm_memory_slot *new,
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  444  				   enum kvm_mr_change change)
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  445  {
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  446  	int needs_flush;
dc7bb37c188f620 Bibo Mao     2024-06-04  447  	u32 old_flags = old ? old->flags : 0;
dc7bb37c188f620 Bibo Mao     2024-06-04 @448  	u32 new_flags = new ? new->flags : 0;
dc7bb37c188f620 Bibo Mao     2024-06-04  449  	bool log_dirty_pages = new_flags & KVM_MEM_LOG_DIRTY_PAGES;
dc7bb37c188f620 Bibo Mao     2024-06-04  450  
dc7bb37c188f620 Bibo Mao     2024-06-04  451  	/* only track memslot flags changed */
dc7bb37c188f620 Bibo Mao     2024-06-04  452  	if (change != KVM_MR_FLAGS_ONLY)
dc7bb37c188f620 Bibo Mao     2024-06-04  453  		return;
dc7bb37c188f620 Bibo Mao     2024-06-04  454  
dc7bb37c188f620 Bibo Mao     2024-06-04  455  	/* Discard dirty page tracking on readonly memslot */
dc7bb37c188f620 Bibo Mao     2024-06-04  456  	if ((old_flags & new_flags) & KVM_MEM_READONLY)
dc7bb37c188f620 Bibo Mao     2024-06-04  457  		return;
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  458  
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  459  	/*
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  460  	 * If dirty page logging is enabled, write protect all pages in the slot
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  461  	 * ready for dirty logging.
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  462  	 *
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  463  	 * There is no need to do this in any of the following cases:
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  464  	 * CREATE:	No dirty mappings will already exist.
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  465  	 * MOVE/DELETE:	The old mappings will already have been cleaned up by
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  466  	 *		kvm_arch_flush_shadow_memslot()
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  467  	 */
dc7bb37c188f620 Bibo Mao     2024-06-04  468  	if (!(old_flags & KVM_MEM_LOG_DIRTY_PAGES) && log_dirty_pages) {
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  469  		spin_lock(&kvm->mmu_lock);
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  470  		/* Write protect GPA page table entries */
752e2cd7b4fb412 Tianrui Zhao 2023-10-02 @471  		needs_flush = kvm_mkclean_gpa_pt(kvm, new->base_gfn,
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  472  					new->base_gfn + new->npages);
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  473  		spin_unlock(&kvm->mmu_lock);
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  474  		if (needs_flush)
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  475  			kvm_flush_remote_tlbs(kvm);
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  476  	}
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  477  }
752e2cd7b4fb412 Tianrui Zhao 2023-10-02  478  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

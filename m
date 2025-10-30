Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB4C36E34E
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 19:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761850818; cv=none; b=NMnOhrg0u3lLAoCGBwLmjAoG6WEVWK++RgdmkMMc7rX0CZlBKFUE7nl5bpSQjDq8id8mGQBTFgsbi2w9jHZfiT068mGSYE/Sjpdatpc//FR12c0UM0Zn9E7uD2WUIstcgj6+wR6Jq60kGDv0vj2vfFAjBIL4RtiJzJWwViFYSNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761850818; c=relaxed/simple;
	bh=QGhAbdaBaFRFaBrweRyB2Aq62/I4tBgHhfw04aSgDK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJ5+GETfB/0JAy3pAy4T5dtf6sQf8gJO9wBDVanuRT//uM4gFZV/Du2Bi0KypaewZEWvw+l+j1ipkFe9L3Kjwy9yVWzAwnCAi5B97pY8NP80XXyjmKoQbghSoRTMAobvIA3RIDCbj4+5kTB5toGQ0T8GU2G0//v0yRSYUDFnzNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccCHoIyT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccCHoIyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761850817; x=1793386817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QGhAbdaBaFRFaBrweRyB2Aq62/I4tBgHhfw04aSgDK0=;
  b=ccCHoIyTOw0yaBD5WyzxdsqmXceyJHcm0BChvar1JL9VszEscNW/dMqA
   4tY2Ay8IQBB0Vpz+cyuHyy2jkatTPQif+4EMR78QmHsGD49F4QxMrQmV8
   h/E3/Bz+AXvsdg1EZ1uNTQC4tX2svsJ7M5QSmG1ZZ/I76mSwwHMAOaHsA
   uUQZlVzCNdpFT0r69Hl8lgZAYZdTVUHBsanZm6JfsvMf9KUfKiYeIFjW9
   RN5z1XRol4zSsLQd+CiG7z9hRANz1Sba5zig2asA/xyjehHf7Bo8UWHvJ
   qkUeWpqCnrALK7CvTXibJPTQxAnqn/3y53PEvvWnMfr1zY929dqeLZmhn
   g==;
X-CSE-ConnectionGUID: 4JsgcvCyS0Onpm1fEUhzrg==
X-CSE-MsgGUID: tdgkeDYyRsWZrkv/0TAqlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64036987"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="64036987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 12:00:12 -0700
X-CSE-ConnectionGUID: M20cYqR0STKP7H0LXZ+xAg==
X-CSE-MsgGUID: Nvmmi5bVRDSRxUhWLula7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="191173876"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Oct 2025 12:00:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEXsV-000MQU-32;
	Thu, 30 Oct 2025 19:00:07 +0000
Date: Fri, 31 Oct 2025 02:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] arch/arm64/kvm/rme.c:789
 populate_region() error: uninitialized symbol 'tmp_page'.
Message-ID: <202510310208.Zw9yEOKD-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Xu Raoqing <xuraoqing@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: a74f93b7e7c0d8a2114055ed0c652cc735a7a07b [3064/3064] [backport]rme: populate guest memory region without guest_memfd
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251031/202510310208.Zw9yEOKD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510310208.Zw9yEOKD-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/rme.c:789 populate_region() error: uninitialized symbol 'tmp_page'.

Old smatch warnings:
arch/arm64/kvm/rme.c:380 realm_create_rd() error: uninitialized symbol 'r'.
arch/arm64/kvm/rme.c:384 realm_create_rd() error: uninitialized symbol 'r'.
arch/arm64/kvm/rme.c:553 realm_fold_rtt_level() error: uninitialized symbol 'rtt_granule'.

vim +/tmp_page +789 arch/arm64/kvm/rme.c

e216f77846eeb7 Steven Price 2025-06-14  715  
e216f77846eeb7 Steven Price 2025-06-14  716  static int populate_region(struct kvm *kvm,
e216f77846eeb7 Steven Price 2025-06-14  717  			   phys_addr_t ipa_base,
e216f77846eeb7 Steven Price 2025-06-14  718  			   phys_addr_t ipa_end,
e216f77846eeb7 Steven Price 2025-06-14  719  			   unsigned long data_flags)
e216f77846eeb7 Steven Price 2025-06-14  720  {
e216f77846eeb7 Steven Price 2025-06-14  721  	struct realm *realm = &kvm->arch.realm;
e216f77846eeb7 Steven Price 2025-06-14  722  	struct kvm_memory_slot *memslot;
e216f77846eeb7 Steven Price 2025-06-14  723  	gfn_t base_gfn, end_gfn;
e216f77846eeb7 Steven Price 2025-06-14  724  	int idx;
e216f77846eeb7 Steven Price 2025-06-14  725  	phys_addr_t ipa = ipa_base;
a74f93b7e7c0d8 Steven Price 2025-06-14  726  	struct page *tmp_page;
e216f77846eeb7 Steven Price 2025-06-14  727  	int ret = 0;
e216f77846eeb7 Steven Price 2025-06-14  728  
e216f77846eeb7 Steven Price 2025-06-14  729  	base_gfn = gpa_to_gfn(ipa_base);
e216f77846eeb7 Steven Price 2025-06-14  730  	end_gfn = gpa_to_gfn(ipa_end);
e216f77846eeb7 Steven Price 2025-06-14  731  
e216f77846eeb7 Steven Price 2025-06-14  732  	idx = srcu_read_lock(&kvm->srcu);
e216f77846eeb7 Steven Price 2025-06-14  733  	memslot = gfn_to_memslot(kvm, base_gfn);
e216f77846eeb7 Steven Price 2025-06-14  734  	if (!memslot) {
e216f77846eeb7 Steven Price 2025-06-14  735  		ret = -EFAULT;
e216f77846eeb7 Steven Price 2025-06-14  736  		goto out;
e216f77846eeb7 Steven Price 2025-06-14  737  	}
e216f77846eeb7 Steven Price 2025-06-14  738  
e216f77846eeb7 Steven Price 2025-06-14  739  	/* We require the region to be contained within a single memslot */
e216f77846eeb7 Steven Price 2025-06-14  740  	if (memslot->base_gfn + memslot->npages < end_gfn) {
e216f77846eeb7 Steven Price 2025-06-14  741  		ret = -EINVAL;
e216f77846eeb7 Steven Price 2025-06-14  742  		goto out;
e216f77846eeb7 Steven Price 2025-06-14  743  	}
e216f77846eeb7 Steven Price 2025-06-14  744  
a74f93b7e7c0d8 Steven Price 2025-06-14  745  	tmp_page = alloc_page(GFP_KERNEL);
a74f93b7e7c0d8 Steven Price 2025-06-14  746  	if (!tmp_page) {
a74f93b7e7c0d8 Steven Price 2025-06-14  747  		ret = -ENOMEM;
e216f77846eeb7 Steven Price 2025-06-14  748  		goto out;
e216f77846eeb7 Steven Price 2025-06-14  749  	}
e216f77846eeb7 Steven Price 2025-06-14  750  
a74f93b7e7c0d8 Steven Price 2025-06-14  751  	mmap_read_lock(current->mm);
a74f93b7e7c0d8 Steven Price 2025-06-14  752  
e216f77846eeb7 Steven Price 2025-06-14  753  	while (ipa < ipa_end) {
e216f77846eeb7 Steven Price 2025-06-14  754  		struct vm_area_struct *vma;
e216f77846eeb7 Steven Price 2025-06-14  755  		unsigned long hva;
e216f77846eeb7 Steven Price 2025-06-14  756  		struct page *page;
e216f77846eeb7 Steven Price 2025-06-14  757  		kvm_pfn_t pfn;
e216f77846eeb7 Steven Price 2025-06-14  758  
e216f77846eeb7 Steven Price 2025-06-14  759  		hva = gfn_to_hva_memslot(memslot, gpa_to_gfn(ipa));
e216f77846eeb7 Steven Price 2025-06-14  760  		vma = vma_lookup(current->mm, hva);
e216f77846eeb7 Steven Price 2025-06-14  761  		if (!vma) {
e216f77846eeb7 Steven Price 2025-06-14  762  			ret = -EFAULT;
e216f77846eeb7 Steven Price 2025-06-14  763  			break;
e216f77846eeb7 Steven Price 2025-06-14  764  		}
e216f77846eeb7 Steven Price 2025-06-14  765  
a74f93b7e7c0d8 Steven Price 2025-06-14  766  		pfn = gfn_to_pfn_memslot(memslot, gpa_to_gfn(ipa));
e216f77846eeb7 Steven Price 2025-06-14  767  
e216f77846eeb7 Steven Price 2025-06-14  768  		if (is_error_pfn(pfn)) {
e216f77846eeb7 Steven Price 2025-06-14  769  			ret = -EFAULT;
e216f77846eeb7 Steven Price 2025-06-14  770  			break;
e216f77846eeb7 Steven Price 2025-06-14  771  		}
e216f77846eeb7 Steven Price 2025-06-14  772  
a74f93b7e7c0d8 Steven Price 2025-06-14  773  		page = pfn_to_page(pfn);
e216f77846eeb7 Steven Price 2025-06-14  774  
e216f77846eeb7 Steven Price 2025-06-14  775  		ret = realm_create_protected_data_page(realm, ipa,
a74f93b7e7c0d8 Steven Price 2025-06-14  776  						       page,
a74f93b7e7c0d8 Steven Price 2025-06-14  777  						       tmp_page,
e216f77846eeb7 Steven Price 2025-06-14  778  						       data_flags);
a74f93b7e7c0d8 Steven Price 2025-06-14  779  		if (ret) {
e216f77846eeb7 Steven Price 2025-06-14  780  			kvm_release_page_clean(page);
e216f77846eeb7 Steven Price 2025-06-14  781  			break;
a74f93b7e7c0d8 Steven Price 2025-06-14  782  		}
e216f77846eeb7 Steven Price 2025-06-14  783  
e216f77846eeb7 Steven Price 2025-06-14  784  		ipa += PAGE_SIZE;
a74f93b7e7c0d8 Steven Price 2025-06-14  785  		kvm_release_pfn_dirty(pfn);
e216f77846eeb7 Steven Price 2025-06-14  786  	}
e216f77846eeb7 Steven Price 2025-06-14  787  out:
a74f93b7e7c0d8 Steven Price 2025-06-14  788  	mmap_read_unlock(current->mm);
a74f93b7e7c0d8 Steven Price 2025-06-14 @789  	__free_page(tmp_page);
e216f77846eeb7 Steven Price 2025-06-14  790  	srcu_read_unlock(&kvm->srcu, idx);
e216f77846eeb7 Steven Price 2025-06-14  791  	return ret;
e216f77846eeb7 Steven Price 2025-06-14  792  }
e216f77846eeb7 Steven Price 2025-06-14  793  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

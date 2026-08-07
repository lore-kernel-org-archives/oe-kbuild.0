Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F8B411A05
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104287; cv=none; b=icwhoNbNSv56Lt4pFi8aLFsb4AleGGhGB8nTx7QSdswIispeNy3/Q+JIFvBTzCBu4tkSb9D/KS0JPesHS5ZnewY5iY6W0v+Qm7b8gprJ6IUVLveYLF6IGteqmV7Z6+pnn8rLIKjOMVgg1TDxazGTQF6fF9WZFpjCybByjHPzcUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104287; c=relaxed/simple;
	bh=H10LER3m4EdjWa7lbdhShxVnzXNYCtqCMpV1o1S+0Ps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hG7pQdkNNnii7a9jNmqIJgY6H0UVUAuahzO3F1X47Cmljuz826VbCBM9jw7FQfMP0j8AfUOAONDnNfIV3V2G2ULnUqdLCM8T7vml/i18eASsOGiaVgmioa2FJ2FzNcqoaAqe8bQr36S7M2lgPJTiEgkTDB6R6rPtFupXezfQL/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtDWeW8q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtDWeW8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786104274; x=1817640274;
  h=date:from:to:cc:subject:message-id;
  bh=H10LER3m4EdjWa7lbdhShxVnzXNYCtqCMpV1o1S+0Ps=;
  b=CtDWeW8qs9Yrx+/n1vJMVmC1t1jE/LeWixsPsL8j1cOT67icWlJtO7m+
   EqtoHA8vYAWMBot1vup500YOx79Op6orKBxM4VamxfWjuIl0oo/IPuLaz
   LcAQD/Gon+1oLFjseNV618ig5TP+7I5oF9DIurCGRWsZ6DaDjTMxrkCml
   n55WP4aUK79sQtrUQkFLoIj563HKnWEr0MlR5u6fX4CkreC6rDhLjyR/Q
   QRS3Ob9d2K3h0VIA7g4/iHroUhSFeztWf7uCfefl5aKgkjOlNvGH2RVC/
   xgcFXN3IHcbhaprklyRQg7Bng3LHIpxTnaGNNw+idV+U/aBusoq8N160s
   Q==;
X-CSE-ConnectionGUID: uzcT1JUURaixQps6d1HtNg==
X-CSE-MsgGUID: E76KMjjYScaHlpIEZl7JkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97864491"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="97864491"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:04:30 -0700
X-CSE-ConnectionGUID: bHPRnw/USYKjLp3jE16JNw==
X-CSE-MsgGUID: MGvejJ0rQz+j9z7tFdsPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259049619"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2026 05:04:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsJJK-00000000I5V-1OOb;
	Fri, 07 Aug 2026 12:04:26 +0000
Date: Fri, 07 Aug 2026 20:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11276/13479]
 arch/s390/kvm/kvm-s390.c:5857 kvm_arch_commit_memory_region() error: we
 previously assumed 'old' could be null (see line 5849)
Message-ID: <202608071937.ZHB4HrAF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Claudio Imbrenda <imbrenda@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea2bff00da89d7767d677bb68470130ba96f4928
commit: ec215346270512db60478e45e8dff2de950225aa [11276/13479] KVM: s390: cmma: Fix dirty tracking when removing memslot
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: s390-randconfig-r072-20260807 (https://download.01.org/0day-ci/archive/20260807/202608071937.ZHB4HrAF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608071937.ZHB4HrAF-lkp@intel.com/

New smatch warnings:
arch/s390/kvm/kvm-s390.c:5857 kvm_arch_commit_memory_region() error: we previously assumed 'old' could be null (see line 5849)

Old smatch warnings:
arch/s390/kvm/kvm-s390.c:5788 kvm_arch_prepare_memory_region() error: we previously assumed 'new' could be null (see line 5774)

vim +/old +5857 arch/s390/kvm/kvm-s390.c

ec215346270512 Claudio Imbrenda      2026-08-03  5827  
f7784b8ec9b6a0 Marcelo Tosatti       2009-12-23  5828  void kvm_arch_commit_memory_region(struct kvm *kvm,
9d4c197c0e94c3 Sean Christopherson   2020-02-18  5829  				struct kvm_memory_slot *old,
f36f3f2846b557 Paolo Bonzini         2015-05-18  5830  				const struct kvm_memory_slot *new,
8482644aea11e0 Takuya Yoshikawa      2013-02-27  5831  				enum kvm_mr_change change)
f7784b8ec9b6a0 Marcelo Tosatti       2009-12-23  5832  {
ec215346270512 Claudio Imbrenda      2026-08-03  5833  	const struct dat_walk_ops ops = { .pte_entry = cmma_d_count_pte, };
ec215346270512 Claudio Imbrenda      2026-08-03  5834  	struct kvm_s390_mmu_cache *mc __free(kvm_s390_mmu_cache) = NULL;
19ec166c3f39fe Christian Borntraeger 2019-05-24  5835  	int rc = 0;
598841ca9919d0 Carsten Otte          2011-07-24  5836  
ec215346270512 Claudio Imbrenda      2026-08-03  5837  	guard(mutex)(&kvm->slots_arch_lock);
ec215346270512 Claudio Imbrenda      2026-08-03  5838  
e38c884df92119 Claudio Imbrenda      2026-02-04  5839  	if (change == KVM_MR_FLAGS_ONLY)
413c98f24c63b3 Claudio Imbrenda      2025-01-23  5840  		return;
413c98f24c63b3 Claudio Imbrenda      2025-01-23  5841  
e38c884df92119 Claudio Imbrenda      2026-02-04  5842  	mc = kvm_s390_new_mmu_cache();
e38c884df92119 Claudio Imbrenda      2026-02-04  5843  	if (!mc) {
e38c884df92119 Claudio Imbrenda      2026-02-04  5844  		rc = -ENOMEM;
e38c884df92119 Claudio Imbrenda      2026-02-04  5845  		goto out;
e38c884df92119 Claudio Imbrenda      2026-02-04  5846  	}
e38c884df92119 Claudio Imbrenda      2026-02-04  5847  
e38c884df92119 Claudio Imbrenda      2026-02-04  5848  	scoped_guard(write_lock, &kvm->mmu_lock) {
ec215346270512 Claudio Imbrenda      2026-08-03 @5849  		if (kvm->arch.migration_mode && kvm->arch.use_cmma && old) {
ec215346270512 Claudio Imbrenda      2026-08-03  5850  			_dat_walk_gfn_range(old->base_gfn, old->base_gfn + old->npages,
ec215346270512 Claudio Imbrenda      2026-08-03  5851  					    kvm->arch.gmap->asce, &ops, DAT_WALK_IGN_HOLES,
ec215346270512 Claudio Imbrenda      2026-08-03  5852  					    &kvm->arch.cmma_dirty_pages);
ec215346270512 Claudio Imbrenda      2026-08-03  5853  		}
ec215346270512 Claudio Imbrenda      2026-08-03  5854  
19ec166c3f39fe Christian Borntraeger 2019-05-24  5855  		switch (change) {
19ec166c3f39fe Christian Borntraeger 2019-05-24  5856  		case KVM_MR_DELETE:
e38c884df92119 Claudio Imbrenda      2026-02-04 @5857  			rc = dat_delete_slot(mc, kvm->arch.gmap->asce, old->base_gfn, old->npages);
19ec166c3f39fe Christian Borntraeger 2019-05-24  5858  			break;
19ec166c3f39fe Christian Borntraeger 2019-05-24  5859  		case KVM_MR_MOVE:
e38c884df92119 Claudio Imbrenda      2026-02-04  5860  			rc = dat_delete_slot(mc, kvm->arch.gmap->asce, old->base_gfn, old->npages);
19ec166c3f39fe Christian Borntraeger 2019-05-24  5861  			if (rc)
19ec166c3f39fe Christian Borntraeger 2019-05-24  5862  				break;
3b684a420bd8a2 Joe Perches           2020-03-10  5863  			fallthrough;
19ec166c3f39fe Christian Borntraeger 2019-05-24  5864  		case KVM_MR_CREATE:
e38c884df92119 Claudio Imbrenda      2026-02-04  5865  			rc = dat_create_slot(mc, kvm->arch.gmap->asce, new->base_gfn, new->npages);
19ec166c3f39fe Christian Borntraeger 2019-05-24  5866  			break;
19ec166c3f39fe Christian Borntraeger 2019-05-24  5867  		case KVM_MR_FLAGS_ONLY:
19ec166c3f39fe Christian Borntraeger 2019-05-24  5868  			break;
19ec166c3f39fe Christian Borntraeger 2019-05-24  5869  		default:
19ec166c3f39fe Christian Borntraeger 2019-05-24  5870  			WARN(1, "Unknown KVM MR CHANGE: %d\n", change);
19ec166c3f39fe Christian Borntraeger 2019-05-24  5871  		}
e38c884df92119 Claudio Imbrenda      2026-02-04  5872  	}
e38c884df92119 Claudio Imbrenda      2026-02-04  5873  out:
598841ca9919d0 Carsten Otte          2011-07-24  5874  	if (rc)
ea2cdd27dce66d David Hildenbrand     2015-05-20  5875  		pr_warn("failed to commit memory region\n");
598841ca9919d0 Carsten Otte          2011-07-24  5876  	return;
b0c632db637d68 Heiko Carstens        2008-03-25  5877  }
b0c632db637d68 Heiko Carstens        2008-03-25  5878  

:::::: The code at line 5857 was first introduced by commit
:::::: e38c884df92119d96f652d51f82661dd2fc0b885 KVM: s390: Switch to new gmap

:::::: TO: Claudio Imbrenda <imbrenda@linux.ibm.com>
:::::: CC: Claudio Imbrenda <imbrenda@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

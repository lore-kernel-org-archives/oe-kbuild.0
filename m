Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BDB441636
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786134320; cv=none; b=sBq+1/5GJ4urbScftUXsp/hOyQHQxC5ss540q64QvM58L35cAAQkWVWbEyaApa8D+IW7FJ0Njj3Xgf6nydWKlDelaFOeDAXYD4Z292fJLOTFB70EuZ/v52Yn+5XXCSvcSjCB8vwyZi+Z5ygdUXNhOgJeDXqb+4yeI7V5lxVzdk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786134320; c=relaxed/simple;
	bh=TwjUHX8KJhWMcdXo74XGwyZmpyco7K0GvQU/yEuGCDs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hcgh/5nOEdp5P7DKwZmtrn0DwYG5zDytyTgLVbMpNN0QDrBpMrcxQ2jJWAr+Vd2RW8nw8k4/H157J/bdiZpQp/ZagxZxS5IExAB0DrDp0ZcWMyVFYsMaeNJPNGL2GqSNEACbRtz+59DIB/AF2dQ5evU7kSM5vHiIT7UGng6wipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1uvQmlV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1uvQmlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786134319; x=1817670319;
  h=date:from:to:cc:subject:message-id;
  bh=TwjUHX8KJhWMcdXo74XGwyZmpyco7K0GvQU/yEuGCDs=;
  b=Y1uvQmlVYytrGqCFEahM3nqGFJ8RSBLUUdXgPNk6woOgmgCyxkUOc2IE
   zofGc9TyWG11d/og+tbZWfIU0jxj5TDBQRVFftQLV7Xm4i54Y7p+ZNSOk
   2iMSeU/rXJ9stdgbXeQtj2095d90qvJLQOeRTlgS0XR/8agk7JG8IZH4Q
   qQxBkfU3ZsG3/wbJWBFmmconR5AqgRV4RQmn0qCV11jZrP0/9H1dezLAB
   wxWcwh+qA+I/CrnXYxbkONGsQIbYuQDLdqZzDKSU/sVr7V1kkzlU09h0q
   nkQTFw70xZIJ/XZmj3bqci439wYiaI1iUvCdOLo009w97rd5N5LtA/HD2
   Q==;
X-CSE-ConnectionGUID: t9T2F5HNQd+L6uueHzLFNA==
X-CSE-MsgGUID: oW9zJSEvRAiPWcVeqzzSSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90428317"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90428317"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 13:25:18 -0700
X-CSE-ConnectionGUID: 8USkMMkAQvCW1V889E2N8g==
X-CSE-MsgGUID: CGJ2fb7GSjCpEmNYrde8Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="260736242"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Aug 2026 13:25:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsR7z-00000000JAl-0DJC;
	Fri, 07 Aug 2026 20:25:15 +0000
Date: Sat, 08 Aug 2026 04:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kvm/kvm-s390.c:5857
 kvm_arch_commit_memory_region() error: we previously assumed 'old' could be
 null (see line 5849)
Message-ID: <202608080458.eIveSLM1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Claudio Imbrenda <imbrenda@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a13307e97d5c54b65720bb71fa379960ded1e51a
commit: ec215346270512db60478e45e8dff2de950225aa KVM: s390: cmma: Fix dirty tracking when removing memslot
date:   4 days ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 days ago
config: s390-randconfig-r072-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080458.eIveSLM1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ec2153462705 ("KVM: s390: cmma: Fix dirty tracking when removing memslot")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608080458.eIveSLM1-lkp@intel.com/

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

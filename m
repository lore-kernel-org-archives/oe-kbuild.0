Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B03D345EB4
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786724766; cv=none; b=GkEM4qevwtlBK2Es3V/yVyKcGDDA6kvPXRMO9rLkd8kJVAv4dx19WyoNQAyRf9Ji1ZQARh4z69Z9CnHMnEZR0qc59jGfKg+JraH719TxhggwO8V1YhepH7Q83wFBj0RttBqSuAeUl+Ox3hidZCcfBidd4kDeBRZg8v/+o18zepA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786724766; c=relaxed/simple;
	bh=N+bMfUtKYyRHYufi3bgBChlPbyyI8bTo+hhoIlwr2f8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Srm8KfGFRjOJC1ExyMqSzHke4URJf6SBgBIfnbNemyRF+ihim0MG+Wum5f+i+aKggSgDkYohRy9cCvsJtzxwu9MeLxvHP+P6/k0bSyrAOB+B+fvL+IHz830879JmzgRMm+PUtSd7vkHM6XbL5eHCSHXDH/+oqE8bGZFMUdh3Bx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cC1hilGM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cC1hilGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786724764; x=1818260764;
  h=date:from:to:cc:subject:message-id;
  bh=N+bMfUtKYyRHYufi3bgBChlPbyyI8bTo+hhoIlwr2f8=;
  b=cC1hilGMaXJmxZaXyz68z80OD+ZR0AbAdtpFALuTdVWGUNxJM/70pqhH
   MCeQRNdPsVhL7OC6jj+SOP2jkWKZLKF6+0yCpLWrxnkOASRvV6eU7txVU
   Y9pK5CiRigk8fob+cqwjs1LY4jvASiwcuuvU1AReO3dzOz5ejAPETVLQY
   kXYKGvhBSRj3lkD+kMP6tDZgSCKGddWi5DGX2x3l9rcKwR8z3eO7SsfIJ
   4mrfdZ8KlW8n9R6aowpA1IAkEf9/UsDx/Y8l11K0o3Ny2e+rzN0i0SlWs
   EikvGIgzrK3kaL2OCr0cw1VqZe3zt2X9wzj0uB7xZSowidXVBUd/sxW47
   Q==;
X-CSE-ConnectionGUID: 67ToOXcrRdS029YcQefH7w==
X-CSE-MsgGUID: qR0UcTkUQo2jRODrUP1ZSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98819570"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98819570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 09:26:03 -0700
X-CSE-ConnectionGUID: Y5lnCNHyTbi2Kc47NU/sow==
X-CSE-MsgGUID: O4HAti8kTYqaY/VxruQIYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="261622736"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Aug 2026 09:26:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuujG-00000000ZWi-47Gu;
	Fri, 14 Aug 2026 16:25:58 +0000
Date: Sat, 15 Aug 2026 00:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kvms390:next 21/32] arch/s390/kvm/s390/../gmap/kvm_mmu.c:64
 s390_kvm_mmu_prepare_memory_region() error: we previously assumed 'new' could
 be null (see line 50)
Message-ID: <202608150012.N5OBMtFy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-s390@vger.kernel.org
TO: Steffen Eiden <seiden@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>

Hi Steffen,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
head:   dd6f4ef6f8a37412909ad787c837332fb070159c
commit: d487a24041c2ea9999ff6e8384002b874de64c94 [21/32] KVM: s390: Prepare gmap for a second KVM implementation
:::::: branch date: 26 hours ago
:::::: commit date: 33 hours ago
config: s390-randconfig-r071-20260814 (https://download.01.org/0day-ci/archive/20260815/202608150012.N5OBMtFy-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608150012.N5OBMtFy-lkp@intel.com/

smatch warnings:
arch/s390/kvm/s390/../gmap/kvm_mmu.c:64 s390_kvm_mmu_prepare_memory_region() error: we previously assumed 'new' could be null (see line 50)

vim +/new +64 arch/s390/kvm/s390/../gmap/kvm_mmu.c

d487a24041c2ea9 Steffen Eiden 2026-04-02  44  
d487a24041c2ea9 Steffen Eiden 2026-04-02  45  int s390_kvm_mmu_prepare_memory_region(struct kvm *kvm,
d487a24041c2ea9 Steffen Eiden 2026-04-02  46  				       const struct kvm_memory_slot *old,
d487a24041c2ea9 Steffen Eiden 2026-04-02  47  				       struct kvm_memory_slot *new,
d487a24041c2ea9 Steffen Eiden 2026-04-02  48  				       enum kvm_mr_change change)
d487a24041c2ea9 Steffen Eiden 2026-04-02  49  {
d487a24041c2ea9 Steffen Eiden 2026-04-02 @50  	if (kvm_is_ucontrol(kvm) && new && new->id < KVM_USER_MEM_SLOTS)
d487a24041c2ea9 Steffen Eiden 2026-04-02  51  		return -EINVAL;
d487a24041c2ea9 Steffen Eiden 2026-04-02  52  
d487a24041c2ea9 Steffen Eiden 2026-04-02  53  	/* When we are protected, we should not change the memory slots */
d487a24041c2ea9 Steffen Eiden 2026-04-02  54  	if (kvm_s390_pv_get_handle(kvm))
d487a24041c2ea9 Steffen Eiden 2026-04-02  55  		return -EINVAL;
d487a24041c2ea9 Steffen Eiden 2026-04-02  56  
d487a24041c2ea9 Steffen Eiden 2026-04-02  57  	if (change != KVM_MR_DELETE && change != KVM_MR_FLAGS_ONLY) {
d487a24041c2ea9 Steffen Eiden 2026-04-02  58  		/*
d487a24041c2ea9 Steffen Eiden 2026-04-02  59  		 * A few sanity checks. The memory in userland is ok to be
d487a24041c2ea9 Steffen Eiden 2026-04-02  60  		 * fragmented into various different vmas. It is okay to mmap()
d487a24041c2ea9 Steffen Eiden 2026-04-02  61  		 * and munmap() stuff in this slot after doing this call at any
d487a24041c2ea9 Steffen Eiden 2026-04-02  62  		 * time.
d487a24041c2ea9 Steffen Eiden 2026-04-02  63  		 */
d487a24041c2ea9 Steffen Eiden 2026-04-02 @64  		if (new->userspace_addr & ~PAGE_MASK)
d487a24041c2ea9 Steffen Eiden 2026-04-02  65  			return -EINVAL;
d487a24041c2ea9 Steffen Eiden 2026-04-02  66  		if ((new->base_gfn + new->npages) * PAGE_SIZE > kvm->arch.mem_limit)
d487a24041c2ea9 Steffen Eiden 2026-04-02  67  			return -EINVAL;
d487a24041c2ea9 Steffen Eiden 2026-04-02  68  		if (!asce_contains_gfn(kvm->arch.gmap->asce, new->base_gfn + new->npages - 1))
d487a24041c2ea9 Steffen Eiden 2026-04-02  69  			return -EINVAL;
d487a24041c2ea9 Steffen Eiden 2026-04-02  70  	}
d487a24041c2ea9 Steffen Eiden 2026-04-02  71  
d487a24041c2ea9 Steffen Eiden 2026-04-02  72  	if (!kvm_s390_is_migration_mode(kvm))
d487a24041c2ea9 Steffen Eiden 2026-04-02  73  		return 0;
d487a24041c2ea9 Steffen Eiden 2026-04-02  74  
d487a24041c2ea9 Steffen Eiden 2026-04-02  75  	/*
d487a24041c2ea9 Steffen Eiden 2026-04-02  76  	 * Turn off migration mode when:
d487a24041c2ea9 Steffen Eiden 2026-04-02  77  	 * - userspace creates a new memslot with dirty logging off,
d487a24041c2ea9 Steffen Eiden 2026-04-02  78  	 * - userspace modifies an existing memslot (MOVE or FLAGS_ONLY) and
d487a24041c2ea9 Steffen Eiden 2026-04-02  79  	 *   dirty logging is turned off.
d487a24041c2ea9 Steffen Eiden 2026-04-02  80  	 * Migration mode expects dirty page logging being enabled to store
d487a24041c2ea9 Steffen Eiden 2026-04-02  81  	 * its dirty bitmap.
d487a24041c2ea9 Steffen Eiden 2026-04-02  82  	 */
d487a24041c2ea9 Steffen Eiden 2026-04-02  83  	if (change != KVM_MR_DELETE &&
d487a24041c2ea9 Steffen Eiden 2026-04-02  84  	    !(new->flags & KVM_MEM_LOG_DIRTY_PAGES))
d487a24041c2ea9 Steffen Eiden 2026-04-02  85  		WARN(kvm_s390_vm_stop_migration(kvm),
d487a24041c2ea9 Steffen Eiden 2026-04-02  86  		     "Failed to stop migration mode");
d487a24041c2ea9 Steffen Eiden 2026-04-02  87  
d487a24041c2ea9 Steffen Eiden 2026-04-02  88  	return 0;
d487a24041c2ea9 Steffen Eiden 2026-04-02  89  }
d487a24041c2ea9 Steffen Eiden 2026-04-02  90  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

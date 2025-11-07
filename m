Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341BD125B2
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 04:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762489866; cv=none; b=SadZi5HfX/UNyN09s973+sV3XnrSREcvk5+DIWXwE709fu7MVfPDdlW4gTYAVit6grpgIo8Z/gzFtQJ+AbOydBBh9/tRSqC9lDLitPA388Xla+gmiwbl6B1Yi2j9p+bD9HZWjxPp1qms8RsAfaMFFwSHWnJVJgG5BGqJxKKQo+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762489866; c=relaxed/simple;
	bh=IOU3RZDVrW7bhc21pdsi+G63YjwEq5HedBT0D9RqKVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KwVwviIJ/r6lk0+YT1aqueyAIPeSKf9AkK91d88N82vzbuWeD6LGIm+re7qQvWu4yl5pIGQ1od0Q6RxTiPyGYlFUOfAZLhlchxQ3DntQ3dyMqNJCD7u/JSrIPZXZa7xKhN+XX6yOXea6Cz+/wv67wTWnJFDvs/elKvSoq5VQ/Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibqCuzbd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibqCuzbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762489863; x=1794025863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IOU3RZDVrW7bhc21pdsi+G63YjwEq5HedBT0D9RqKVM=;
  b=ibqCuzbd9T2//gs0rhbYl30gyu7C6Z8mUIjaHpTtyGkiHXXLeU4Y05AI
   hYae5V4BgCv8nrH8sZbSj85dxlq3r8N0W7lDmaN3cyNcdgx6kkmDSITCK
   rWsL3R2u/ffwRP1//IYAJdkP+wi1napLGKLlGOTu6VAyB6q+0Gy8CRDdk
   77dlvOcPftA2vMvs17qifbASBr3eb0Hqfwl+bJkZNA0e3gmhItnzS3WvA
   ho324jDtjg+3/KXrR+HPP+kut+PI41NK80huKlLUU5Vaiy+s5Xps2RAmS
   31MvTgYwofy+D18AToumiqkXrEayqHEcL/jd/MR7RLwnwWV7QAw0vjw6C
   w==;
X-CSE-ConnectionGUID: g83d9YV3Sa2osKscGYrulw==
X-CSE-MsgGUID: /u3DfJpQQJKC6AnBmQs06A==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68286714"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="68286714"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 20:31:03 -0800
X-CSE-ConnectionGUID: 3qwYPo1TR/m+778S1CS+IQ==
X-CSE-MsgGUID: ABXEwnTZQ2atS/W/yT+QRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="187890729"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2025 20:31:02 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHE7e-000Uhk-1m;
	Fri, 07 Nov 2025 04:30:53 +0000
Date: Fri, 7 Nov 2025 12:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/pmu-emul.c:1039 kvm_arm_set_nr_counters() warn:
 iterator 'i' not incremented
Message-ID: <202511071246.IbDx7VA9-lkp@intel.com>
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
TO: Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oliver.upton@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a0c9b3391999818e2c5b93719699b255be1f682
commit: c8823e51b534d490ec27d372596eb35d2bb7193c KVM: arm64: Fix MDCR_EL2.HPMN reset value
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r072-20251107 (https://download.01.org/0day-ci/archive/20251107/202511071246.IbDx7VA9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511071246.IbDx7VA9-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/pmu-emul.c:1039 kvm_arm_set_nr_counters() warn: iterator 'i' not incremented

Old smatch warnings:
arch/arm64/kvm/pmu-emul.c:992 pmu_irq_is_valid() warn: iterator 'i' not incremented

vim +/i +1039 arch/arm64/kvm/pmu-emul.c

4d20debf9ca160 Raghavendra Rao Ananta 2023-10-20  1029  
c8823e51b534d4 Marc Zyngier           2025-02-17  1030  static void kvm_arm_set_nr_counters(struct kvm *kvm, unsigned int nr)
c8823e51b534d4 Marc Zyngier           2025-02-17  1031  {
c8823e51b534d4 Marc Zyngier           2025-02-17  1032  	kvm->arch.nr_pmu_counters = nr;
c8823e51b534d4 Marc Zyngier           2025-02-17  1033  
c8823e51b534d4 Marc Zyngier           2025-02-17  1034  	/* Reset MDCR_EL2.HPMN behind the vcpus' back... */
c8823e51b534d4 Marc Zyngier           2025-02-17  1035  	if (test_bit(KVM_ARM_VCPU_HAS_EL2, kvm->arch.vcpu_features)) {
c8823e51b534d4 Marc Zyngier           2025-02-17  1036  		struct kvm_vcpu *vcpu;
c8823e51b534d4 Marc Zyngier           2025-02-17  1037  		unsigned long i;
c8823e51b534d4 Marc Zyngier           2025-02-17  1038  
c8823e51b534d4 Marc Zyngier           2025-02-17 @1039  		kvm_for_each_vcpu(i, vcpu, kvm) {
c8823e51b534d4 Marc Zyngier           2025-02-17  1040  			u64 val = __vcpu_sys_reg(vcpu, MDCR_EL2);
c8823e51b534d4 Marc Zyngier           2025-02-17  1041  			val &= ~MDCR_EL2_HPMN;
c8823e51b534d4 Marc Zyngier           2025-02-17  1042  			val |= FIELD_PREP(MDCR_EL2_HPMN, kvm->arch.nr_pmu_counters);
c8823e51b534d4 Marc Zyngier           2025-02-17  1043  			__vcpu_sys_reg(vcpu, MDCR_EL2) = val;
c8823e51b534d4 Marc Zyngier           2025-02-17  1044  		}
c8823e51b534d4 Marc Zyngier           2025-02-17  1045  	}
c8823e51b534d4 Marc Zyngier           2025-02-17  1046  }
c8823e51b534d4 Marc Zyngier           2025-02-17  1047  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

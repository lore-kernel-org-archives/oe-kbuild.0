Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B67532C305
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761814785; cv=none; b=fKumuIgFPEIF+LddSBNWPnJH9isT73FcSk+J493FxbuobpBEyjbt/Qln2bUQr319dSxyY14SGzndvt2bBT6R4qBB9QE5TtkV6zY89XK6Z8kb1APoSdocVrupogT7ItFRPHEBcZ+OSweye8Sh0PUtWzN07/9eCtOVigIScSNHtcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761814785; c=relaxed/simple;
	bh=/RdqK7h4Z/YueOQkwgqymH524pZIywpBpFyITFsIDm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mo1FDrU8lecC+zXcfQFiCAGS0eE1B4e0EnAn8Artv4fMhohI59awwVCiFeefke2Xe6Jzw1VyLhaJ3szkPEBRZSztt+1BN6lR/qQC66Uxe7ESm7r2R9Giz+HhQqW08LDaCgq5cQq2FHK3rtkM9r8op0yCme5rDTdocbtHb1vRmj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5O83cGC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5O83cGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761814783; x=1793350783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/RdqK7h4Z/YueOQkwgqymH524pZIywpBpFyITFsIDm0=;
  b=K5O83cGCLXYUboT6wce+NPVVGG1laSSU51ywk2q20oq0NhFdP6SKz4/o
   1HkA5dxaiv3lUonLUECrh+CYDjscgoteeUX2Q9fS9wd1OFPBmR3AjvULH
   fMKIIBzTsdD/p9G43TmSc+3/9HBFXOKAbuv6seTkIboafklNxvJZP2HYt
   V089B3hRhkWfQSqZXIwYPGDa/Yl40m6hgkfyE7/Pxjf2X+rUlg9ss0wSh
   QUpUZR4Byq0QkUFB+8UfqbL9bfv+HNZyBnsulXqC6F6f+vC+LIXmWavix
   yMk4K7GDt6KAAdhVgKrDxkof3w4m5WDx8NzGIpKnmt9niyN4mbMkHf/iy
   w==;
X-CSE-ConnectionGUID: xxPk4wgjSnupp9gUsXUvpA==
X-CSE-MsgGUID: jUPs7YoBS0e+N3ti75L99w==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="89417135"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="89417135"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 01:59:42 -0700
X-CSE-ConnectionGUID: eNjqmxLPQ0ueBifBP256EA==
X-CSE-MsgGUID: hjVNvR7tTmueaXvfw6OT6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="186642420"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Oct 2025 01:59:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEOVP-000LjI-0g;
	Thu, 30 Oct 2025 08:59:39 +0000
Date: Thu, 30 Oct 2025 16:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] arch/arm64/kvm/arm.c:1849
 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
Message-ID: <202510301658.9yiQCJKC-lkp@intel.com>
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
TO: Zhenyu Ye <yezhenyu2@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bc2ee8a789087459d9852f01e10d2f31abf5a13d
commit: 6d60015590c3f56b0188b2409cfb3ad9e05ded00 [3064/3064] arm64/kvm: support to handle the HDBSSF event
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251030/202510301658.9yiQCJKC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510301658.9yiQCJKC-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/arm.c:1849 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented

Old smatch warnings:
arch/arm64/kvm/arm.c:177 kvm_cap_arm_enable_hdbss() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:899 kvm_arm_halt_guest() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:909 kvm_arm_resume_guest() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:2692 kvm_mpidr_to_vcpu() warn: iterator 'i' not incremented

vim +/i +1849 arch/arm64/kvm/arm.c

749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  1837  
0dff084607bd55 virt/kvm/arm/arm.c   Sean Christopherson 2020-02-18  1838  void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  1839  {
6d60015590c3f5 arch/arm64/kvm/arm.c eillon              2025-04-02  1840  	/*
6d60015590c3f5 arch/arm64/kvm/arm.c eillon              2025-04-02  1841  	 * Flush all CPUs' dirty log buffers to the dirty_bitmap.  Called
6d60015590c3f5 arch/arm64/kvm/arm.c eillon              2025-04-02  1842  	 * before reporting dirty_bitmap to userspace.  KVM flushes the buffers
6d60015590c3f5 arch/arm64/kvm/arm.c eillon              2025-04-02  1843  	 * on all VM-Exits, thus we only need to kick running vCPUs to force a
6d60015590c3f5 arch/arm64/kvm/arm.c eillon              2025-04-02  1844  	 * VM-Exit.
6d60015590c3f5 arch/arm64/kvm/arm.c eillon              2025-04-02  1845  	 */
6d60015590c3f5 arch/arm64/kvm/arm.c eillon              2025-04-02  1846  	struct kvm_vcpu *vcpu;
6d60015590c3f5 arch/arm64/kvm/arm.c eillon              2025-04-02  1847  	unsigned long i;
53c810c364d7a2 arch/arm/kvm/arm.c   Mario Smarduch      2015-01-15  1848  
6d60015590c3f5 arch/arm64/kvm/arm.c eillon              2025-04-02 @1849  	kvm_for_each_vcpu(i, vcpu, kvm)
6d60015590c3f5 arch/arm64/kvm/arm.c eillon              2025-04-02  1850  		kvm_vcpu_kick(vcpu);
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  1851  }
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  1852  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

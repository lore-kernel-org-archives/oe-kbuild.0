Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5528937A3CB
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761806206; cv=none; b=pvjoDkyz4euBeC2SzoTjMyaQcSvPwcGFEsNJy4uWsbLbrq8Pk/XfHHHUdDgqgmV4s3z55GIXqCOJr8b2KDh4lW3V1PgWhAsdToNNoKFotbUM2oMqQgOfSh3fV2E0OF+yjLhBE2BsYpQYE1Q59KHPbz3s5/Rnpy6szTzeCBt9IQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761806206; c=relaxed/simple;
	bh=KZSMomokyKY3/9SlayELOZDYRdwgmuugoQWmIfKWaT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YqipyaG8+aLzYY5sGHR4jYFxPFeXNoKzjQhV1gZWYnP5s3TmLPouYjeuG21ncN1iiIrcgdyr7OUqEdmGnOMCyYqQKoOuNO31G35bqRROZ5/fERDXqC3daVVQa0U9g5X7qQILmDmmGa7cRWSFSiJ8IBF/qsJhYcX/up4eUTFEsP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBnHoxpS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBnHoxpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761806204; x=1793342204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZSMomokyKY3/9SlayELOZDYRdwgmuugoQWmIfKWaT8=;
  b=dBnHoxpSF26rLYWdJ5rrda7BurAS7svygCxiHGGwnFJPn4P34IZPc3Bh
   1ww5xcqylcSxGwtvhb3OTmW9wBUORaeUI61+qcWO2nA1v6IK6ZRTszkpY
   E0zfyPSEuR4+/oK+ruy1NM9CdJ66ZieZjpIXe4CShS83eiP1EgWlLCg17
   lC8m0QQJLm01LBCjNFPIKqRx4i2bK9TTT8E66XQkG65EQp44CQEaJCplQ
   MS5T5LpLOJ78qgnktqXwwEaCb/c6Mw0dYo1MVfR2lHWwNJFT8m+Tb+e7I
   cYpsHPyF7ee29W7To1s8NqKmC3HCMa8vGVJRWdFwS0icRkWrRRGcZ1MCT
   g==;
X-CSE-ConnectionGUID: ZmskPZQURE6dvCdb6UZahQ==
X-CSE-MsgGUID: GbeYi6aWQCWc17Rvo147Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74230343"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="74230343"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:36:43 -0700
X-CSE-ConnectionGUID: epwaxbF7QnGk34z5fKr/WA==
X-CSE-MsgGUID: WK9N6RKDSOCfB7aKr0f5cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185567618"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2025 23:36:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEMH2-000LYE-0n;
	Thu, 30 Oct 2025 06:36:40 +0000
Date: Thu, 30 Oct 2025 14:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] arch/arm64/kvm/arm.c:177
 kvm_cap_arm_enable_hdbss() warn: iterator 'i' not incremented
Message-ID: <202510301418.ngVZneV0-lkp@intel.com>
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
commit: bd6106e348d70cafe3f030ba6f60fb010f09b82e [3064/3064] arm64/kvm: using ioctl to enable/disable the HDBSS feature
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251030/202510301418.ngVZneV0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510301418.ngVZneV0-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/arm.c:177 kvm_cap_arm_enable_hdbss() warn: iterator 'i' not incremented

Old smatch warnings:
arch/arm64/kvm/arm.c:899 kvm_arm_halt_guest() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:909 kvm_arm_resume_guest() warn: iterator 'i' not incremented
arch/arm64/kvm/arm.c:2682 kvm_mpidr_to_vcpu() warn: iterator 'i' not incremented

vim +/i +177 arch/arm64/kvm/arm.c

749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  131  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  132  static int kvm_cap_arm_enable_hdbss(struct kvm *kvm,
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  133  				    struct kvm_enable_cap *cap)
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  134  {
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  135  	unsigned long i;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  136  	struct kvm_vcpu *vcpu;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  137  	struct page *hdbss_pg;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  138  	int size = cap->args[0];
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  139  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  140  	if (!system_supports_hdbss()) {
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  141  		kvm_err("This system does not support HDBSS!\n");
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  142  		return -EINVAL;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  143  	}
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  144  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  145  	if (size < 0 || size > HDBSS_MAX_SIZE) {
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  146  		kvm_err("Invalid HDBSS buffer size: %d!\n", size);
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  147  		return -EINVAL;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  148  	}
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  149  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  150  	/* Enable the HDBSS feature if size > 0, otherwise disable it. */
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  151  	if (size) {
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  152  		kvm->enable_hdbss = true;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  153  		kvm->arch.vtcr |= VTCR_EL2_HD | VTCR_EL2_HDBSS;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  154  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  155  		kvm_for_each_vcpu(i, vcpu, kvm) {
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  156  			hdbss_pg = alloc_pages(GFP_KERNEL, size);
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  157  			if (!hdbss_pg) {
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  158  				kvm_err("Alloc HDBSS buffer failed!\n");
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  159  				return -EINVAL;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  160  			}
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  161  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  162  			vcpu->arch.hdbss.br_el2 = HDBSSBR_EL2(page_to_phys(hdbss_pg), size);
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  163  			vcpu->arch.hdbss.prod_el2 = 0;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  164  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  165  			/*
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  166  			 * We should kick vcpus out of guest mode here to
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  167  			 * load new vtcr value to vtcr_el2 register when
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  168  			 * re-enter guest mode.
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  169  			 */
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  170  			kvm_vcpu_kick(vcpu);
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  171  		}
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  172  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  173  		kvm_info("Enable HDBSS success, HDBSS buffer size: %d\n", size);
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  174  	} else if (kvm->enable_hdbss) {
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  175  		kvm->arch.vtcr &= ~(VTCR_EL2_HD | VTCR_EL2_HDBSS);
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  176  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02 @177  		kvm_for_each_vcpu(i, vcpu, kvm) {
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  178  			/* Kick vcpus to flush hdbss buffer. */
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  179  			kvm_vcpu_kick(vcpu);
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  180  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  181  			hdbss_pg = phys_to_page(HDBSSBR_BADDR(vcpu->arch.hdbss.br_el2));
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  182  			if (hdbss_pg)
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  183  				__free_pages(hdbss_pg, HDBSSBR_SZ(vcpu->arch.hdbss.br_el2));
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  184  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  185  			vcpu->arch.hdbss.br_el2 = 0;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  186  			vcpu->arch.hdbss.prod_el2 = 0;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  187  		}
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  188  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  189  		kvm->enable_hdbss = false;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  190  		kvm_info("Disable HDBSS success\n");
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  191  	}
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  192  
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  193  	return 0;
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  194  }
bd6106e348d70c arch/arm64/kvm/arm.c eillon           2025-04-02  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

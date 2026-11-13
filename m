Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607852;
	b=fPuG4Mvq6n9kwk1B/gsG4Hcd74a2BIH2eQPXSr+h8DnE5chm4hcDS20LUZ6TpYIWZdIE
	 m1Wfd80f/hNQyCfL0ZIY4SOWQrwyyY0Yg4bh6hOGmrkHgRR86zGb3UWCUtISit8Jg3vOe
	 iThw7LFneXyWHMoJ7Php/M8UZ8gKu91GMzTWMnxxcGytfxxPdYR6qfN14mIPRcMTDs1ZO
	 uasfUMO0ZKHbH95Rz9s1ecifz4NTaoiBZjCfasiA9QmpjoG86TH8m1vMDJmtIFMP2xjNS
	 8Kuhjmf79IfDhMWmTRmi38KCEBJz+RMNqzKFQo8a9j2iO/bt5qaoAE9eCEkgehA1vmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607852;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RES+lVxrJJtBJJ/p0lR+yNCssdABsdwyPf1BpbQsYVs=;
	b=FO0X9d1B2UaHdm2DNysVnGBA3XPi6yajLe/Innibv71HfpftERK+Ml7FOWus5bkyP6H7
	 FjAGSrZhTBfObvfezlRAif+S1Z3x08WMXYpHs3EiDKQAsadTV5IHR5mHUmhj5Tpgge93Z
	 nte03YVryQlliixuFkQStGeXv7TidKzWq9yqe6ZNKuJkQukq8WniQ8/GtZ3ovwkbtuBrW
	 tkyq2LqEuyIgMLsGZlt4XcHDi/lk73QP4icqwjMQfHkULMLtQavLmSsM2dI1KOi4Xyyhr
	 swaxvRUoY9yCPKs/acuUiyGlQq3AlrJl34SBGKHW7+9tErk0a7ofap6pZmyG/cC1XAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fXXvLxhw;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3F606A329
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 22:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F3F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fXXvLxhw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794607852; x=1826143852;
  h=date:from:to:cc:subject:message-id;
  bh=qpbSTifqV5wtDUY0ywi7mNmApWLJUjaFnbWX9e96bQY=;
  b=fXXvLxhwz22Yhf3W3eaxOGTxH4rBJApI6gd6DaaKdXvKsYQRnHH/MHA2
   +cWp7Iq+1QIRLL3EWK1jBgblcyPLOKtDAVUr9ryJm6Y82nUNdVtd0FbAe
   2YO8rLSeglxy40atbN0RljabVEkoOjMKfOtH10oj0Nj6Wv6y3MBnmyBQI
   wBUNeA2jCMi2bNI0VJRMwC02TAcM4jTFeUXhwgukFA+y796X51S3+JdN9
   q8C6gtIN31DGi2P5O21v7UeVoTY1mS0399FQHRGaZ7bDCGLbZEuh+jShe
   whXU1xPhiqh/PS4GuxoRCclQKGXyAUCZPnXWD2AUWBSL7ZjgMIjrIxb+F
   w==;
X-CSE-ConnectionGUID: DRdhMIpiSz2AJ1BJkxEU3Q==
X-CSE-MsgGUID: xneHR+XuTUifzn/KQdCbYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3460466"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3460466"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:10:51 -0800
X-CSE-ConnectionGUID: 37uRtHDQRMyiCXwDPAANzA==
X-CSE-MsgGUID: qm6ODjrGSraZa6ip7sDydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9112887"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2026 14:10:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRzTr-000000001LX-2u28;
	Fri, 13 Nov 2026 22:10:47 +0000
Date: Fri, 13 Nov 2026 23:10:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kvm-riscv:riscv_kvm_fixes 1/7]
 arch/riscv/kvm/aia_device.c:311 aia_init() warn: missing unwind goto?
Message-ID: <202611132302.clUdzKjd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pengpeng Hou <hppiscas@163.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/kvm-riscv/linux.git riscv_kvm_fixes
head:   46740f9f0fab8ecff4895617c79cec33131b13f0
commit: 235a629ef66ed4e7f88a8946749ed4ff6e3764cf [1/7] RISC-V: KVM: Validate AIA MMIO address ranges
:::::: branch date: 10 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611132302.clUdzKjd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611132302.clUdzKjd-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/aia_device.c:311 aia_init() warn: missing unwind goto?

vim +311 arch/riscv/kvm/aia_device.c

89d01306e34d6ac Anup Patel          2023-06-15  250  
89d01306e34d6ac Anup Patel          2023-06-15  251  static int aia_init(struct kvm *kvm)
89d01306e34d6ac Anup Patel          2023-06-15  252  {
89d01306e34d6ac Anup Patel          2023-06-15  253  	int ret, i;
89d01306e34d6ac Anup Patel          2023-06-15  254  	unsigned long idx;
89d01306e34d6ac Anup Patel          2023-06-15  255  	struct kvm_vcpu *vcpu;
89d01306e34d6ac Anup Patel          2023-06-15  256  	struct kvm_vcpu_aia *vaia;
89d01306e34d6ac Anup Patel          2023-06-15  257  	struct kvm_aia *aia = &kvm->arch.aia;
89d01306e34d6ac Anup Patel          2023-06-15  258  	gpa_t base_ppn = KVM_RISCV_AIA_UNDEF_ADDR;
89d01306e34d6ac Anup Patel          2023-06-15  259  
89d01306e34d6ac Anup Patel          2023-06-15  260  	/* Irqchip can be initialized only once */
89d01306e34d6ac Anup Patel          2023-06-15  261  	if (kvm_riscv_aia_initialized(kvm))
89d01306e34d6ac Anup Patel          2023-06-15  262  		return -EBUSY;
89d01306e34d6ac Anup Patel          2023-06-15  263  
89d01306e34d6ac Anup Patel          2023-06-15  264  	/* We might be in the middle of creating a VCPU? */
10f4082b754f18e Sean Christopherson 2026-09-21  265  	if (kvm_is_vcpu_creation_in_progress(kvm))
89d01306e34d6ac Anup Patel          2023-06-15  266  		return -EBUSY;
89d01306e34d6ac Anup Patel          2023-06-15  267  
89d01306e34d6ac Anup Patel          2023-06-15  268  	/* Number of sources should be less than or equals number of IDs */
89d01306e34d6ac Anup Patel          2023-06-15  269  	if (aia->nr_ids < aia->nr_sources)
89d01306e34d6ac Anup Patel          2023-06-15  270  		return -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  271  
89d01306e34d6ac Anup Patel          2023-06-15  272  	/* APLIC base is required for non-zero number of sources */
89d01306e34d6ac Anup Patel          2023-06-15  273  	if (aia->nr_sources && aia->aplic_addr == KVM_RISCV_AIA_UNDEF_ADDR)
89d01306e34d6ac Anup Patel          2023-06-15  274  		return -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  275  
235a629ef66ed4e Pengpeng Hou        2026-09-20  276  	/* The GPA width may change after setting APLIC's address on an empty VM. */
235a629ef66ed4e Pengpeng Hou        2026-09-20  277  	if (aia->nr_sources) {
235a629ef66ed4e Pengpeng Hou        2026-09-20  278  		ret = aia_check_addr_range(kvm, aia->aplic_addr,
235a629ef66ed4e Pengpeng Hou        2026-09-20  279  					   KVM_DEV_RISCV_APLIC_ALIGN,
235a629ef66ed4e Pengpeng Hou        2026-09-20  280  					   KVM_DEV_RISCV_APLIC_SIZE);
235a629ef66ed4e Pengpeng Hou        2026-09-20  281  		if (ret)
235a629ef66ed4e Pengpeng Hou        2026-09-20  282  			return ret;
235a629ef66ed4e Pengpeng Hou        2026-09-20  283  	}
235a629ef66ed4e Pengpeng Hou        2026-09-20  284  
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  285  	/* Group index bits must not overlap guest and HART index bits. */
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  286  	if (aia->nr_group_bits &&
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  287  	    aia->nr_group_shift < (IMSIC_MMIO_PAGE_SHIFT +
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  288  	    			   aia->nr_guest_bits + aia->nr_hart_bits))
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  289  		return -EINVAL;
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  290  
89d01306e34d6ac Anup Patel          2023-06-15  291  	/* Initialize APLIC */
89d01306e34d6ac Anup Patel          2023-06-15  292  	ret = kvm_riscv_aia_aplic_init(kvm);
89d01306e34d6ac Anup Patel          2023-06-15  293  	if (ret)
89d01306e34d6ac Anup Patel          2023-06-15  294  		return ret;
89d01306e34d6ac Anup Patel          2023-06-15  295  
89d01306e34d6ac Anup Patel          2023-06-15  296  	/* Iterate over each VCPU */
89d01306e34d6ac Anup Patel          2023-06-15  297  	kvm_for_each_vcpu(idx, vcpu, kvm) {
89d01306e34d6ac Anup Patel          2023-06-15  298  		vaia = &vcpu->arch.aia_context;
89d01306e34d6ac Anup Patel          2023-06-15  299  
89d01306e34d6ac Anup Patel          2023-06-15  300  		/* IMSIC base is required */
89d01306e34d6ac Anup Patel          2023-06-15  301  		if (vaia->imsic_addr == KVM_RISCV_AIA_UNDEF_ADDR) {
89d01306e34d6ac Anup Patel          2023-06-15  302  			ret = -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  303  			goto fail_cleanup_imsics;
89d01306e34d6ac Anup Patel          2023-06-15  304  		}
89d01306e34d6ac Anup Patel          2023-06-15  305  
235a629ef66ed4e Pengpeng Hou        2026-09-20  306  		/* The GPA width may change after setting IMSIC addresses on an empty VM. */
235a629ef66ed4e Pengpeng Hou        2026-09-20  307  		ret = aia_check_addr_range(kvm, vaia->imsic_addr,
235a629ef66ed4e Pengpeng Hou        2026-09-20  308  					   KVM_DEV_RISCV_IMSIC_ALIGN,
235a629ef66ed4e Pengpeng Hou        2026-09-20  309  					   KVM_DEV_RISCV_IMSIC_SIZE);
235a629ef66ed4e Pengpeng Hou        2026-09-20  310  		if (ret)
235a629ef66ed4e Pengpeng Hou        2026-09-20 @311  			return ret;
235a629ef66ed4e Pengpeng Hou        2026-09-20  312  
89d01306e34d6ac Anup Patel          2023-06-15  313  		/* All IMSICs should have matching base PPN */
89d01306e34d6ac Anup Patel          2023-06-15  314  		if (base_ppn == KVM_RISCV_AIA_UNDEF_ADDR)
89d01306e34d6ac Anup Patel          2023-06-15  315  			base_ppn = aia_imsic_ppn(aia, vaia->imsic_addr);
89d01306e34d6ac Anup Patel          2023-06-15  316  		if (base_ppn != aia_imsic_ppn(aia, vaia->imsic_addr)) {
89d01306e34d6ac Anup Patel          2023-06-15  317  			ret = -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  318  			goto fail_cleanup_imsics;
89d01306e34d6ac Anup Patel          2023-06-15  319  		}
89d01306e34d6ac Anup Patel          2023-06-15  320  
89d01306e34d6ac Anup Patel          2023-06-15  321  		/* Update HART index of the IMSIC based on IMSIC base */
89d01306e34d6ac Anup Patel          2023-06-15  322  		vaia->hart_index = aia_imsic_hart_index(aia,
89d01306e34d6ac Anup Patel          2023-06-15  323  							vaia->imsic_addr);
89d01306e34d6ac Anup Patel          2023-06-15  324  
89d01306e34d6ac Anup Patel          2023-06-15  325  		/* Initialize IMSIC for this VCPU */
89d01306e34d6ac Anup Patel          2023-06-15  326  		ret = kvm_riscv_vcpu_aia_imsic_init(vcpu);
89d01306e34d6ac Anup Patel          2023-06-15  327  		if (ret)
89d01306e34d6ac Anup Patel          2023-06-15  328  			goto fail_cleanup_imsics;
89d01306e34d6ac Anup Patel          2023-06-15  329  	}
89d01306e34d6ac Anup Patel          2023-06-15  330  
89d01306e34d6ac Anup Patel          2023-06-15  331  	/* Set the initialized flag */
89d01306e34d6ac Anup Patel          2023-06-15  332  	kvm->arch.aia.initialized = true;
89d01306e34d6ac Anup Patel          2023-06-15  333  
89d01306e34d6ac Anup Patel          2023-06-15  334  	return 0;
89d01306e34d6ac Anup Patel          2023-06-15  335  
89d01306e34d6ac Anup Patel          2023-06-15  336  fail_cleanup_imsics:
89d01306e34d6ac Anup Patel          2023-06-15  337  	for (i = idx - 1; i >= 0; i--) {
89d01306e34d6ac Anup Patel          2023-06-15  338  		vcpu = kvm_get_vcpu(kvm, i);
89d01306e34d6ac Anup Patel          2023-06-15  339  		if (!vcpu)
89d01306e34d6ac Anup Patel          2023-06-15  340  			continue;
89d01306e34d6ac Anup Patel          2023-06-15  341  		kvm_riscv_vcpu_aia_imsic_cleanup(vcpu);
89d01306e34d6ac Anup Patel          2023-06-15  342  	}
89d01306e34d6ac Anup Patel          2023-06-15  343  	kvm_riscv_aia_aplic_cleanup(kvm);
89d01306e34d6ac Anup Patel          2023-06-15  344  	return ret;
89d01306e34d6ac Anup Patel          2023-06-15  345  }
89d01306e34d6ac Anup Patel          2023-06-15  346  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

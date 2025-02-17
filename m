Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0DD136349
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 08:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739779806; cv=none; b=OCZpV6wbOYfZHLNQhJCr7EGDhAMY+DuJB1tTNLi0qLzcUe3J2VcHpk7fFweWYAU99ksL1q21PG6vktncj0aE7IRkqxXAg4C61D+gSASBNTlCy7DglI5zO6GjHgviVkeqgOn3gxvmv/LNF1fcZwfX9feLO4AgXxvsy83alhPJNgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739779806; c=relaxed/simple;
	bh=Fj9Kb6g2ascqh8MHEfRUSTobszZgr5qymcItc8AQ8uc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4Ik5nZneo7xbOP29IK8cvldhFbD35y5Vvq2vuulb1CZyN0b6Zznx5YACvFGBDY9/7vxwgWVUfnDVY0aMLutgtISGIbTsURjCvvMJpQVpB/CY3P4kDlOAux1I5piIfUTrqJpcaa1uk6pxhzrIwArb7SXKbPq4xyO8NbmUXtr6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIbwON4y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIbwON4y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739779804; x=1771315804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fj9Kb6g2ascqh8MHEfRUSTobszZgr5qymcItc8AQ8uc=;
  b=dIbwON4yYI+KKZJ4mkm9cvkXXKmwuZauewhrogxuw0l93Szq9oWNtgXD
   X0gfTHXn8nGSUnCAeJe+E6WCgk+QkkU+EblM+8MaqMWFjtDQWocFLDuyE
   O/Nlcb0fjPSdIg5Q2c2AuxFgjsB3cTjTwoaQ3TI85HKwv54vRFG9ul2gA
   5bQHRUbELgNUhJFp+wla7f+yzoEbj7tFfIV8o4+ltfXk0e4JjDu9aBvD2
   hXWrfptWpWDYQWNiHruIhwKNedJHM8Qpwy9MbZWFIHp0nveNzyn3fTWLf
   Qhpm1T+/yQ06yRJR2N79BCTaVDi440XR31HWmz6EBy+Jgv/a4adPaunZC
   Q==;
X-CSE-ConnectionGUID: xHVxuCpRRUqi+Czb+KIzxQ==
X-CSE-MsgGUID: KTy0ahACQ6yXebHa3aoCIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="39640229"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="39640229"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 00:10:03 -0800
X-CSE-ConnectionGUID: o7mEQvdbTwmz6jN4mKTkaQ==
X-CSE-MsgGUID: wxspExfvQ0agOIbjTkKeXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137299058"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Feb 2025 00:10:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjwCW-001Clz-0u;
	Mon, 17 Feb 2025 08:10:00 +0000
Date: Mon, 17 Feb 2025 16:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kvm/vcpu_sbi_system.c:38 kvm_sbi_ext_susp_handler() warn:
 iterator 'i' not incremented
Message-ID: <202502171610.Jv7mRW6F-lkp@intel.com>
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
TO: Andrew Jones <ajones@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ad2507d5d93f39619fc42372c347d6006b64319
commit: 023c15151fbb65f8dde23e28af1d6d4382404d58 RISC-V: KVM: Add SBI system suspend support
date:   7 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250217/202502171610.Jv7mRW6F-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502171610.Jv7mRW6F-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/vcpu_sbi_system.c:38 kvm_sbi_ext_susp_handler() warn: iterator 'i' not incremented

vim +/i +38 arch/riscv/kvm/vcpu_sbi_system.c

023c15151fbb65 Andrew Jones 2024-10-17  10  
023c15151fbb65 Andrew Jones 2024-10-17  11  static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
023c15151fbb65 Andrew Jones 2024-10-17  12  				    struct kvm_vcpu_sbi_return *retdata)
023c15151fbb65 Andrew Jones 2024-10-17  13  {
023c15151fbb65 Andrew Jones 2024-10-17  14  	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
023c15151fbb65 Andrew Jones 2024-10-17  15  	struct kvm_cpu_context *reset_cntx;
023c15151fbb65 Andrew Jones 2024-10-17  16  	unsigned long funcid = cp->a6;
023c15151fbb65 Andrew Jones 2024-10-17  17  	unsigned long hva, i;
023c15151fbb65 Andrew Jones 2024-10-17  18  	struct kvm_vcpu *tmp;
023c15151fbb65 Andrew Jones 2024-10-17  19  
023c15151fbb65 Andrew Jones 2024-10-17  20  	switch (funcid) {
023c15151fbb65 Andrew Jones 2024-10-17  21  	case SBI_EXT_SUSP_SYSTEM_SUSPEND:
023c15151fbb65 Andrew Jones 2024-10-17  22  		if (cp->a0 != SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM) {
023c15151fbb65 Andrew Jones 2024-10-17  23  			retdata->err_val = SBI_ERR_INVALID_PARAM;
023c15151fbb65 Andrew Jones 2024-10-17  24  			return 0;
023c15151fbb65 Andrew Jones 2024-10-17  25  		}
023c15151fbb65 Andrew Jones 2024-10-17  26  
023c15151fbb65 Andrew Jones 2024-10-17  27  		if (!(cp->sstatus & SR_SPP)) {
023c15151fbb65 Andrew Jones 2024-10-17  28  			retdata->err_val = SBI_ERR_FAILURE;
023c15151fbb65 Andrew Jones 2024-10-17  29  			return 0;
023c15151fbb65 Andrew Jones 2024-10-17  30  		}
023c15151fbb65 Andrew Jones 2024-10-17  31  
023c15151fbb65 Andrew Jones 2024-10-17  32  		hva = kvm_vcpu_gfn_to_hva_prot(vcpu, cp->a1 >> PAGE_SHIFT, NULL);
023c15151fbb65 Andrew Jones 2024-10-17  33  		if (kvm_is_error_hva(hva)) {
023c15151fbb65 Andrew Jones 2024-10-17  34  			retdata->err_val = SBI_ERR_INVALID_ADDRESS;
023c15151fbb65 Andrew Jones 2024-10-17  35  			return 0;
023c15151fbb65 Andrew Jones 2024-10-17  36  		}
023c15151fbb65 Andrew Jones 2024-10-17  37  
023c15151fbb65 Andrew Jones 2024-10-17 @38  		kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
023c15151fbb65 Andrew Jones 2024-10-17  39  			if (tmp == vcpu)
023c15151fbb65 Andrew Jones 2024-10-17  40  				continue;
023c15151fbb65 Andrew Jones 2024-10-17  41  			if (!kvm_riscv_vcpu_stopped(tmp)) {
023c15151fbb65 Andrew Jones 2024-10-17  42  				retdata->err_val = SBI_ERR_DENIED;
023c15151fbb65 Andrew Jones 2024-10-17  43  				return 0;
023c15151fbb65 Andrew Jones 2024-10-17  44  			}
023c15151fbb65 Andrew Jones 2024-10-17  45  		}
023c15151fbb65 Andrew Jones 2024-10-17  46  
023c15151fbb65 Andrew Jones 2024-10-17  47  		spin_lock(&vcpu->arch.reset_cntx_lock);
023c15151fbb65 Andrew Jones 2024-10-17  48  		reset_cntx = &vcpu->arch.guest_reset_context;
023c15151fbb65 Andrew Jones 2024-10-17  49  		reset_cntx->sepc = cp->a1;
023c15151fbb65 Andrew Jones 2024-10-17  50  		reset_cntx->a0 = vcpu->vcpu_id;
023c15151fbb65 Andrew Jones 2024-10-17  51  		reset_cntx->a1 = cp->a2;
023c15151fbb65 Andrew Jones 2024-10-17  52  		spin_unlock(&vcpu->arch.reset_cntx_lock);
023c15151fbb65 Andrew Jones 2024-10-17  53  
023c15151fbb65 Andrew Jones 2024-10-17  54  		kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
023c15151fbb65 Andrew Jones 2024-10-17  55  
023c15151fbb65 Andrew Jones 2024-10-17  56  		/* userspace provides the suspend implementation */
023c15151fbb65 Andrew Jones 2024-10-17  57  		kvm_riscv_vcpu_sbi_forward(vcpu, run);
023c15151fbb65 Andrew Jones 2024-10-17  58  		retdata->uexit = true;
023c15151fbb65 Andrew Jones 2024-10-17  59  		break;
023c15151fbb65 Andrew Jones 2024-10-17  60  	default:
023c15151fbb65 Andrew Jones 2024-10-17  61  		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
023c15151fbb65 Andrew Jones 2024-10-17  62  		break;
023c15151fbb65 Andrew Jones 2024-10-17  63  	}
023c15151fbb65 Andrew Jones 2024-10-17  64  
023c15151fbb65 Andrew Jones 2024-10-17  65  	return 0;
023c15151fbb65 Andrew Jones 2024-10-17  66  }
023c15151fbb65 Andrew Jones 2024-10-17  67  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

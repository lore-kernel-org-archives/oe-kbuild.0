Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3644052ED2F
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176359; cv=none; b=XvjbdOl7sDNBQCyOTzVRKfv1BzH7djh4BhOpv6yQkjwEiP5Raok6z6Pnl+ycNVx294jX3wX8eY702Br/RL75NUVDcKsEDDq/Bw5mN1EJnUpy8XlKBuz7GMr24STrO1TJY0LpYKMIGZuSUbjVBHuaqhxZdcuSmiypAVveQ1UcSG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176359; c=relaxed/simple;
	bh=I+M7gcNrxuIKLo6BvcxqyrWEqikx19iYOtSUkjR0rwI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kfz5qT3EeaThlQxNhhFOB1xNoyW85mqiGW7etDIDiZ9xUsHSDFycKRz2bT6btbruycIPZ5wOELZ8gJQ+Ug7eG8X9MS2pn+NabVAPtSPHX65TYZKM4aIY0Ixdbj+dG6u5gSne0wd+j0VIcYGyoze8I5M5IEe3TTLIknIj8rgSUz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/l+g6zx; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/l+g6zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790176357; x=1821712357;
  h=date:from:to:cc:subject:message-id;
  bh=I+M7gcNrxuIKLo6BvcxqyrWEqikx19iYOtSUkjR0rwI=;
  b=H/l+g6zxidtZMyq2fX3lRkw+tmANQxL1umcWY2qrVSWj1ZWD4KDaegW7
   g52CHhLshzP7XYCmUKIpv3I6RpJTcBZE7emaowTBI1RX4wmMcQANKj5xY
   ygKmvsMiiNHwnplDyyTmUw+hRYwu9POtNHKJeqLIhfw1dMMxZ0fz3ZvO1
   FsrGIP+GBzf624i1KU87G9YKVlLND0bCu9N3ycibqz6FJ+WzFtrGrjEB9
   IVjKJmNiwTqOpI4bkJOSbCAXRue7OSbcjibRqErPO5diu22QEPkLt0SyT
   eOi2lntWOR31zIS/kRPgssi2LjuTev88MgIrVmOKDCBwJGUcMmfl4PeS6
   w==;
X-CSE-ConnectionGUID: AHEEp3grSBy7SzbUHuGH0Q==
X-CSE-MsgGUID: nC9vE6y/Rkmq8InOGUeoyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1375897"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1375897"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:12:34 -0700
X-CSE-ConnectionGUID: qXrTe5O3RH6s3xaHgYFTvA==
X-CSE-MsgGUID: 6lHjEc/STYu5ON9NQPt6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="273848702"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Sep 2026 08:12:33 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Oe6-000000000iP-2WVH;
	Wed, 23 Sep 2026 15:12:30 +0000
Date: Wed, 23 Sep 2026 17:12:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/x86/coco/sev/core.c:996:69-74: opportunity for
 str_write_read(write)
Message-ID: <202609231726.xTdfsvWe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Melody Wang <huibo.wang@amd.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Melody-Wang/x86-sev-Make-SVSM-calls-preemption-safe/20260914-005717
head:   65dbde829c5e2d48b15dbe2c9d605d1f1ddbe691
commit: f00a21f19691e20aa2ed7fdfc46805cc7510d9da x86/sev: Route unsupported APIC register accesses to the hypervisor APIC emulation
date:   10 days ago
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-2103-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231726.xTdfsvWe-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609231726.xTdfsvWe-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/coco/sev/core.c:996:69-74: opportunity for str_write_read(write)

vim +996 arch/x86/coco/sev/core.c

39336f4ffb2478 arch/x86/kernel/sev-es.c Tom Lendacky    2020-09-07   974  
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14   975  static u64 __sev_apic_ghcb_msr_rw(u32 reg, u64 value, bool write)
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   976  {
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   977  	u64 msr = APIC_BASE_MSR + (reg >> 4);
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   978  	struct pt_regs regs = { .cx = msr };
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   979  	struct es_em_ctxt ctxt = { .regs = &regs };
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   980  	struct ghcb_state state;
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   981  	enum es_result res;
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   982  	struct ghcb *ghcb;
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   983  
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14   984  	if (write) {
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14   985  		regs.ax = lower_32_bits(value);
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14   986  		regs.dx = upper_32_bits(value);
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14   987  	}
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14   988  
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   989  	guard(irqsave)();
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   990  
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   991  	ghcb = __sev_get_ghcb(&state);
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   992  	vc_ghcb_invalidate(ghcb);
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   993  
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14   994  	res = __vc_handle_msr(ghcb, &ctxt, write);
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   995  	if (res != ES_OK) {
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14  @996  		pr_err("APIC MSR via GHCB (0x%llx) %s returned error (%d)\n", msr, write ? "write" : "read", res);
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14   997  		/* MSR read/write failures are treated as fatal errors */
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14   998  		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_APIC_MSR_FAIL);
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28   999  	}
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28  1000  
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28  1001  	__sev_put_ghcb(&state);
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28  1002  
f00a21f19691e2 arch/x86/coco/sev/core.c Melody Wang     2026-09-14  1003  	/* The return value will be ignored by the caller for a write */
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28  1004  	return regs.ax | regs.dx << 32;
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28  1005  }
ea7d792e11e10f arch/x86/coco/sev/core.c Neeraj Upadhyay 2025-08-28  1006  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

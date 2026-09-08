Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47300492E24
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Sep 2026 23:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908874; cv=none; b=tIQAn9+Kzm9PQcm5wWLRZymiWwFYmn6oyq+OOKwH7Srqs5XenCn5v+wrs2mmTRHrsdqT9dPjykkWttHsS47lvbHu15tP0xgK43AbZUnD8EtXU4lJ6ELhKiVEQ4zt/YoNT0vlJaDEA1TwtolOcIxzau1mfZEMZjoDG0In+pFxvwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908874; c=relaxed/simple;
	bh=cp1e78c3fRjRHw04CI5X6z3HBgxrM6QG35f4z1QA2Y8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XkVVGAXeW6AIA7XWuHJAknymALIRj3wvNCJ1IeuXQxCkyIGhT1jiXoqCTTA97qiMsQDs1NJgVSC0C13K6p4rvvz2x9y8VB2/sIn27blcsSvXtbPjxKLI2e6Zh/PJmm+HCSnzVmGXz5qaDYcsUCIiewc+7nbOrXKkXGtcEeVj4eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHDrzHm/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHDrzHm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788908874; x=1820444874;
  h=date:from:to:cc:subject:message-id;
  bh=cp1e78c3fRjRHw04CI5X6z3HBgxrM6QG35f4z1QA2Y8=;
  b=mHDrzHm/B6s3FQLuw8xeUmYLNRj51a8S+t5rkHpbVa90gI8yTrCgChyJ
   GBsnTY7976tmxoWMScz/sfmy2WgT9BSqkHL6PFWciQE2BNS7S0W+jFtdJ
   ub6h1JK+QaI6VKCA/TvjfNITXlaa3M5mlsvcHHPhyoF0L3jvmcwXiiExi
   U3qTopArYzjdZdNVsG9x6q7jSJncl2qvHDt0nTvrObBwBot6egiLXWAW/
   rFI2ucrFDGUkioP5XnWp8rQSEqGTUzWoPuAXVT9b4z03SHAbXYepVnUJl
   wFmb7wnKTgALuf7wMBXgnaZApx/+iE8ER0lMGsD2VOVXyI0NKrXM1hrP6
   Q==;
X-CSE-ConnectionGUID: WvOhUY50Ssyx8WVo7DnHyw==
X-CSE-MsgGUID: Id0xedOFSjeYefhNQDrusw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99654332"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="99654332"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 16:07:53 -0700
X-CSE-ConnectionGUID: IdA76VblTm6vAypOxIP3Bw==
X-CSE-MsgGUID: MIxi/9nRQjaRv8E3tdvXWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="271124496"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Sep 2026 16:07:52 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x44ur-0000000010x-0vuK;
	Tue, 08 Sep 2026 23:07:49 +0000
Date: Wed, 09 Sep 2026 07:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kvm/s390/interrupt.c:1282 kvm_s390_handle_wait()
 warn: shift has higher precedence than mask 'gisa_get_ipm_or_restore_iam(gi)'
 & 'vcpu->arch.sie_block->gcr[6] >> 24'
Message-ID: <202609090603.I4ZYaeel-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Steffen Eiden <seiden@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>

Hi Steffen,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   893e11787f78e43b534e252249ac3fff4d1333f8
commit: 1b09c13c90ccd908e62f82b309fade358b41cd21 KVM: s390: Move s390 kvm code into a subdirectory
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: s390-randconfig-r073-20260909 (https://download.01.org/0day-ci/archive/20260909/202609090603.I4ZYaeel-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1b09c13c90cc ("KVM: s390: Move s390 kvm code into a subdirectory")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609090603.I4ZYaeel-lkp@intel.com/

smatch warnings:
arch/s390/kvm/s390/interrupt.c:1282 kvm_s390_handle_wait() warn: shift has higher precedence than mask 'gisa_get_ipm_or_restore_iam(gi)' & 'vcpu->arch.sie_block->gcr[6] >> 24'
arch/s390/kvm/s390/interrupt.c:1679 get_io_int() error: buffer overflow 'fi->lists' 10 <= s32max
arch/s390/kvm/s390/../../../../virt/kvm/kvm_main.c:1708 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1701)
arch/s390/kvm/s390/../../../../virt/kvm/kvm_main.c:1710 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1702)

vim +1282 arch/s390/kvm/s390/interrupt.c

b3c17f10fa2cfc arch/s390/kvm/interrupt.c David Hildenbrand     2016-02-22  1264  
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1265  int kvm_s390_handle_wait(struct kvm_vcpu *vcpu)
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1266  {
9f30f62163786a arch/s390/kvm/interrupt.c Michael Mueller       2019-01-31  1267  	struct kvm_s390_gisa_interrupt *gi = &vcpu->kvm->arch.gisa_int;
b3c17f10fa2cfc arch/s390/kvm/interrupt.c David Hildenbrand     2016-02-22  1268  	u64 sltime;
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1269  
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1270  	vcpu->stat.exit_wait_state++;
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1271  
0759d0681cae27 arch/s390/kvm/interrupt.c David Hildenbrand     2014-05-13  1272  	/* fast path */
118b862b153190 arch/s390/kvm/interrupt.c David Hildenbrand     2015-09-23  1273  	if (kvm_arch_vcpu_runnable(vcpu))
0759d0681cae27 arch/s390/kvm/interrupt.c David Hildenbrand     2014-05-13  1274  		return 0;
e52b2af541bcb2 arch/s390/kvm/interrupt.c Carsten Otte          2008-05-21  1275  
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1276  	if (psw_interrupts_disabled(vcpu)) {
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1277  		VCPU_EVENT(vcpu, 3, "%s", "disabled wait");
b8e660b83d5051 arch/s390/kvm/interrupt.c Heiko Carstens        2010-02-26  1278  		return -EOPNOTSUPP; /* disabled wait */
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1279  	}
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1280  
9f30f62163786a arch/s390/kvm/interrupt.c Michael Mueller       2019-01-31  1281  	if (gi->origin &&
9f30f62163786a arch/s390/kvm/interrupt.c Michael Mueller       2019-01-31 @1282  	    (gisa_get_ipm_or_restore_iam(gi) &
9f30f62163786a arch/s390/kvm/interrupt.c Michael Mueller       2019-01-31  1283  	     vcpu->arch.sie_block->gcr[6] >> 24))
9f30f62163786a arch/s390/kvm/interrupt.c Michael Mueller       2019-01-31  1284  		return 0;
9f30f62163786a arch/s390/kvm/interrupt.c Michael Mueller       2019-01-31  1285  
b3c17f10fa2cfc arch/s390/kvm/interrupt.c David Hildenbrand     2016-02-22  1286  	if (!ckc_interrupts_enabled(vcpu) &&
b3c17f10fa2cfc arch/s390/kvm/interrupt.c David Hildenbrand     2016-02-22  1287  	    !cpu_timer_interrupts_enabled(vcpu)) {
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1288  		VCPU_EVENT(vcpu, 3, "%s", "enabled wait w/o timer");
bda343ef149bc0 arch/s390/kvm/interrupt.c David Hildenbrand     2014-12-12  1289  		__set_cpu_idle(vcpu);
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1290  		goto no_timer;
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1291  	}
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1292  
b3c17f10fa2cfc arch/s390/kvm/interrupt.c David Hildenbrand     2016-02-22  1293  	sltime = __calculate_sltime(vcpu);
b3c17f10fa2cfc arch/s390/kvm/interrupt.c David Hildenbrand     2016-02-22  1294  	if (!sltime)
bda343ef149bc0 arch/s390/kvm/interrupt.c David Hildenbrand     2014-12-12  1295  		return 0;
bda343ef149bc0 arch/s390/kvm/interrupt.c David Hildenbrand     2014-12-12  1296  
bda343ef149bc0 arch/s390/kvm/interrupt.c David Hildenbrand     2014-12-12  1297  	__set_cpu_idle(vcpu);
8b0e195314fabd arch/s390/kvm/interrupt.c Thomas Gleixner       2016-12-25  1298  	hrtimer_start(&vcpu->arch.ckc_timer, sltime, HRTIMER_MODE_REL);
b3c17f10fa2cfc arch/s390/kvm/interrupt.c David Hildenbrand     2016-02-22  1299  	VCPU_EVENT(vcpu, 4, "enabled wait: %llu ns", sltime);
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1300  no_timer:
2031f2876896d8 arch/s390/kvm/interrupt.c Sean Christopherson   2022-04-15  1301  	kvm_vcpu_srcu_read_unlock(vcpu);
352ccf890a3e91 arch/s390/kvm/interrupt.c Christian Borntraeger 2025-09-04  1302  	vcpu->kvm->arch.float_int.last_sleep_cpu = vcpu->vcpu_idx;
91b99ea7065786 arch/s390/kvm/interrupt.c Sean Christopherson   2021-10-08  1303  	kvm_vcpu_halt(vcpu);
75c89e5272fba7 arch/s390/kvm/interrupt.c Sean Christopherson   2021-10-08  1304  	vcpu->valid_wakeup = false;
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1305  	__unset_cpu_idle(vcpu);
2031f2876896d8 arch/s390/kvm/interrupt.c Sean Christopherson   2022-04-15  1306  	kvm_vcpu_srcu_read_lock(vcpu);
800c1065c3207a arch/s390/kvm/interrupt.c Thomas Huth           2013-09-12  1307  
2d00f759427bb3 arch/s390/kvm/interrupt.c David Hildenbrand     2014-12-11  1308  	hrtimer_cancel(&vcpu->arch.ckc_timer);
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1309  	return 0;
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1310  }
ba5c1e9b6ceebd arch/s390/kvm/interrupt.c Carsten Otte          2008-03-25  1311  

:::::: The code at line 1282 was first introduced by commit
:::::: 9f30f62163786a0b80e0886046b5c66e714e7e71 KVM: s390: add gib_alert_irq_handler()

:::::: TO: Michael Mueller <mimu@linux.ibm.com>
:::::: CC: Christian Borntraeger <borntraeger@de.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

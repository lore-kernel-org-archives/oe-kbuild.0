Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A341487ED
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 19:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728849190; cv=none; b=sHf4EC56Ss35ignWLmNLdB3T1XzZLvfA08z+uZhTBRkjWPEAh6xsp96tQR4+6V/ILxcoRW2WN1vS8Ie21R/hiY+iIdYCVZmhVUXOQxXkQH2SCmaJrZXLkMEjDkw++5Kw80O1vhUQ9G1DbTrz5OP6hQptA4xvJoRfSiH3BrMtWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728849190; c=relaxed/simple;
	bh=6rdE+GYePniyP8c48nQbV1CDboKV6SC/jeTgpYfUBJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7JBD0Lu2Mmx43TWV84marAhG9YkucJ7gV1p6RkomCh2Tq9B/etYW7YsnwxIjtnhCtP+0aoJlMh2UX0hgQ4hL9n0fYh2HNlL1u2nDOKkkB5DAEMNSwx0k0WvQfD4g7STGuImqchyfKE5rkhPtsp6eXRNf0lSJlZebPUPXW7cj44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zdl8fLjV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zdl8fLjV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728849188; x=1760385188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6rdE+GYePniyP8c48nQbV1CDboKV6SC/jeTgpYfUBJc=;
  b=Zdl8fLjVekiTN4sonwnajDp85rJ2xJR6BZ79Xq2WfIVA2MDF0rhyCUav
   Z9rcs5N7G0laB266EhvxT/ucvpYk+HL6jLjwh9Vwj51zsoy27VVbvbdOI
   /S6u8Va6F9lbawLwPGtRb6tpRcVgP8NQzHjCDNC8ibzbb8ljjcQlqInZS
   12IqJDJIXRHYoBI3ozYG2bW6iSBdJUTyabm8ItoB0kNzA5Tpz2VKlkTRt
   E5gAaNI9BIfNUANKqX2zCAHTNEozEyqVJTh87rXH7279nXKvA588oUB9e
   TSjG4m7mvw5cyQhYElHZ+jj3F2yFZi4OGIn6fJEtIPqakj40K3SjqsDl5
   w==;
X-CSE-ConnectionGUID: HbZzwIVISpqg3mcyaHIvSA==
X-CSE-MsgGUID: T4hJ/trRSLeAxKkmkBTlvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28276631"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="28276631"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 12:53:05 -0700
X-CSE-ConnectionGUID: P+iFuVsmSzyccWuQ8q5s0g==
X-CSE-MsgGUID: VaDx7WrXR4GNF0r6QVnewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="82405730"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Oct 2024 12:53:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t04eC-000Eet-38;
	Sun, 13 Oct 2024 19:53:00 +0000
Date: Mon, 14 Oct 2024 03:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/loongarch/kernel/paravirt.c:61:13-14: WARNING opportunity for
 max()
Message-ID: <202410140356.GES2Y6D1-lkp@intel.com>
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
TO: Bibo Mao <maobibo@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba01565ced22c04749a6f71aa8a658d3a64734bc
commit: 74c16b2e2b0c3b193324f47300fd30cf03a606b7 LoongArch: KVM: Add PV IPI support on guest side
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r052-20241013 (https://download.01.org/0day-ci/archive/20241014/202410140356.GES2Y6D1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410140356.GES2Y6D1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/paravirt.c:61:13-14: WARNING opportunity for max()

vim +61 arch/loongarch/kernel/paravirt.c

74c16b2e2b0c3b Bibo Mao 2024-05-06  35  
74c16b2e2b0c3b Bibo Mao 2024-05-06  36  static void pv_send_ipi_mask(const struct cpumask *mask, unsigned int action)
74c16b2e2b0c3b Bibo Mao 2024-05-06  37  {
74c16b2e2b0c3b Bibo Mao 2024-05-06  38  	int i, cpu, min = 0, max = 0, old;
74c16b2e2b0c3b Bibo Mao 2024-05-06  39  	__uint128_t bitmap = 0;
74c16b2e2b0c3b Bibo Mao 2024-05-06  40  	irq_cpustat_t *info;
74c16b2e2b0c3b Bibo Mao 2024-05-06  41  
74c16b2e2b0c3b Bibo Mao 2024-05-06  42  	if (cpumask_empty(mask))
74c16b2e2b0c3b Bibo Mao 2024-05-06  43  		return;
74c16b2e2b0c3b Bibo Mao 2024-05-06  44  
74c16b2e2b0c3b Bibo Mao 2024-05-06  45  	action = BIT(action);
74c16b2e2b0c3b Bibo Mao 2024-05-06  46  	for_each_cpu(i, mask) {
74c16b2e2b0c3b Bibo Mao 2024-05-06  47  		info = &per_cpu(irq_stat, i);
74c16b2e2b0c3b Bibo Mao 2024-05-06  48  		old = atomic_fetch_or(action, &info->message);
74c16b2e2b0c3b Bibo Mao 2024-05-06  49  		if (old)
74c16b2e2b0c3b Bibo Mao 2024-05-06  50  			continue;
74c16b2e2b0c3b Bibo Mao 2024-05-06  51  
74c16b2e2b0c3b Bibo Mao 2024-05-06  52  		cpu = cpu_logical_map(i);
74c16b2e2b0c3b Bibo Mao 2024-05-06  53  		if (!bitmap) {
74c16b2e2b0c3b Bibo Mao 2024-05-06  54  			min = max = cpu;
74c16b2e2b0c3b Bibo Mao 2024-05-06  55  		} else if (cpu < min && cpu > (max - KVM_IPI_CLUSTER_SIZE)) {
74c16b2e2b0c3b Bibo Mao 2024-05-06  56  			/* cpu < min, and bitmap still enough */
74c16b2e2b0c3b Bibo Mao 2024-05-06  57  			bitmap <<= min - cpu;
74c16b2e2b0c3b Bibo Mao 2024-05-06  58  			min = cpu;
74c16b2e2b0c3b Bibo Mao 2024-05-06  59  		} else if (cpu > min && cpu < (min + KVM_IPI_CLUSTER_SIZE)) {
74c16b2e2b0c3b Bibo Mao 2024-05-06  60  			/* cpu > min, and bitmap still enough */
74c16b2e2b0c3b Bibo Mao 2024-05-06 @61  			max = cpu > max ? cpu : max;
74c16b2e2b0c3b Bibo Mao 2024-05-06  62  		} else {
74c16b2e2b0c3b Bibo Mao 2024-05-06  63  			/*
74c16b2e2b0c3b Bibo Mao 2024-05-06  64  			 * With cpu, bitmap will exceed KVM_IPI_CLUSTER_SIZE,
74c16b2e2b0c3b Bibo Mao 2024-05-06  65  			 * send IPI here directly and skip the remaining CPUs.
74c16b2e2b0c3b Bibo Mao 2024-05-06  66  			 */
74c16b2e2b0c3b Bibo Mao 2024-05-06  67  			kvm_hypercall3(KVM_HCALL_FUNC_IPI, (unsigned long)bitmap,
74c16b2e2b0c3b Bibo Mao 2024-05-06  68  				      (unsigned long)(bitmap >> BITS_PER_LONG), min);
74c16b2e2b0c3b Bibo Mao 2024-05-06  69  			min = max = cpu;
74c16b2e2b0c3b Bibo Mao 2024-05-06  70  			bitmap = 0;
74c16b2e2b0c3b Bibo Mao 2024-05-06  71  		}
74c16b2e2b0c3b Bibo Mao 2024-05-06  72  		__set_bit(cpu - min, (unsigned long *)&bitmap);
74c16b2e2b0c3b Bibo Mao 2024-05-06  73  	}
74c16b2e2b0c3b Bibo Mao 2024-05-06  74  
74c16b2e2b0c3b Bibo Mao 2024-05-06  75  	if (bitmap)
74c16b2e2b0c3b Bibo Mao 2024-05-06  76  		kvm_hypercall3(KVM_HCALL_FUNC_IPI, (unsigned long)bitmap,
74c16b2e2b0c3b Bibo Mao 2024-05-06  77  			      (unsigned long)(bitmap >> BITS_PER_LONG), min);
74c16b2e2b0c3b Bibo Mao 2024-05-06  78  }
74c16b2e2b0c3b Bibo Mao 2024-05-06  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

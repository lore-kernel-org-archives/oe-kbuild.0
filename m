Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5049913D245
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 11:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728817670; cv=none; b=oxNI5mdS0wm9QBG2yuwBNY9nb4/56nBRUXStRuKXOi/W8yNaxF4Bc0VZmCVSf+bB+OhyfsvU3gu8lpU2u6ZYUanZAdMnEWxSp9Kxwpw89UWy1I8JOA39aJP1nLKf/8/tZal4Rz09fyMYULNH1GQQZJZMk2EFvwFiPe9/GdxmIXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728817670; c=relaxed/simple;
	bh=Yz3a1KRJI9q81BC6TEEqnIjXRpGQzJVQ99/sX65Cav4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YrdWrTzXqw/XuMuoqVKGETk3nIRbpgHpj1SB3VddLaSPSnJ2NiT4ZM77Z/IE1UghqNoQXUCYGFoennTtY3p9k19nvog9qHE4Cl3dSsBdH3ukQy9x2YsH9xKrDhZLrw1V8ly0XZTNcWAtjPR/IBjkfe5nEFy7tad22fxJwVttD8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSHmqqz6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSHmqqz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728817668; x=1760353668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yz3a1KRJI9q81BC6TEEqnIjXRpGQzJVQ99/sX65Cav4=;
  b=YSHmqqz6LSPEdSv3JRB0h54DMxfmbYqY0F96IeSzCQmG4r/9WxIF5NVl
   dJHEukjvGEFSGc4uualVIV5FYRlo2uajjC/wBgnwzODU2MC5JG2AxcdGm
   AjJgHLABsy6PyzSN6UmjxOcNYZlw5NEyV8y11Kw9L1cZl0GuyyoxyJJEJ
   aRP6KUSJPqs+RYpo3T7ECcYUiG2J002Rz92k7zphabbyAauDIk1ilafls
   U28l8F/YbCgqC2A3MOcXkxNOxVTxA73x6lWxIkbrMyMY1dDomVAatttLb
   YwXoN8p+YpXtK0ptRJodvt9Ig3uL6nmODcnlRaVTDyZEQocA98Yjvm6/9
   Q==;
X-CSE-ConnectionGUID: pD9S9TC5QqOb6b3AHaN3tw==
X-CSE-MsgGUID: dDSMLR/UQ9iNwVvPY++DoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38729803"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="38729803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 04:07:45 -0700
X-CSE-ConnectionGUID: M6pj//2uQJ6eogvX8mdOYQ==
X-CSE-MsgGUID: K20Bgdj0RoiGSNA89IrAOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="114767804"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Oct 2024 04:07:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szwRq-000EJV-0K;
	Sun, 13 Oct 2024 11:07:42 +0000
Date: Sun, 13 Oct 2024 19:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/loongarch/kernel/paravirt.c:61:13-14: WARNING opportunity for
 max()
Message-ID: <202410131945.z59XY5rJ-lkp@intel.com>
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
head:   36c254515dc6592c44db77b84908358979dd6b50
commit: 74c16b2e2b0c3b193324f47300fd30cf03a606b7 LoongArch: KVM: Add PV IPI support on guest side
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r052-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131945.z59XY5rJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410131945.z59XY5rJ-lkp@intel.com/

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

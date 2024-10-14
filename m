Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87929231CA6
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 03:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728877414; cv=none; b=E5DKs7cpTh8bh5gMPxF/YPtEe12gNOwJ3o9PG8e+Te47wPqwSiPw+TIqCGGCIHu4V+MJqPsS2vxU3c1pVswJmJZ7KjYIgDHX7TEQ0cLCXeNCF+SRJFD6lxjsE0TVB/Mii5Ijl+WLAt/Cr6Db6rz2D5Bbo5qmHxw4w6RckPxS0vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728877414; c=relaxed/simple;
	bh=HsJ13VlFrHyB7xj0PcqOqpOIVU1a0pr7SO6XFRO7pNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DSrd7Ij9ez9eBJiT3p70VY0BhyWaWYLZgpp58Cs8h2vfmmWTqCcCpKJXdsTMcTGFydQ2qKm9BMxg0aiJnXYye1lFNcfZItzUPn6B2b85syReCh2UgrcAgD25REkk7T44s6VXALxvHF+TRaHq0mCpsyohjiyZmfY4GSTQfNq+rgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6DgwUXr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6DgwUXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728877413; x=1760413413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HsJ13VlFrHyB7xj0PcqOqpOIVU1a0pr7SO6XFRO7pNo=;
  b=h6DgwUXrAOM09ssaEb1ZG7Gr6w2fUZ5/eTzM+wq/3JH6SYhvv/q+BUfV
   zB4qbtSmgiq5cfytj5iv94Eoed0++dltoMZ2iiTvLv5mWEMX5DVwTpNAi
   9DCLd+yo8RpFU+6Y19q8dXRpNy11M4rEVFzcOO5Vcs3AzR+P1AoF5g3+M
   yU6rUJU/rUZQJSU+itvh5LXwL5AEBGMb0/nSDycYsVI3R4AUsef0H3Iyx
   yQ3cPKlAbyo+pzv4eXhVTAULXlWRZFjlThuj90Tgq9B8vMNj9xsUpZ9z5
   fi7/peUnYbxipQEMzaa8DI/2qyWif6D0U+czqq8esr4DJWPUcWW45Wr75
   A==;
X-CSE-ConnectionGUID: y3kwf76YTNK9NKGGfQwvyQ==
X-CSE-MsgGUID: vAmtOX92QXa73UOcmU8i/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="38787659"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="38787659"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 20:43:32 -0700
X-CSE-ConnectionGUID: DEueAZl9QTCUsVzNBxaVzw==
X-CSE-MsgGUID: cdsJqs+bSgWft2wEkVxZlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77461056"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Oct 2024 20:43:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0BzU-000Esk-2X;
	Mon, 14 Oct 2024 03:43:28 +0000
Date: Mon, 14 Oct 2024 11:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/loongarch/kernel/paravirt.c:61:13-14: WARNING opportunity for
 max()
Message-ID: <202410141120.P7A2IBq2-lkp@intel.com>
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
head:   6485cf5ea253d40d507cd71253c9568c5470cd27
commit: 74c16b2e2b0c3b193324f47300fd30cf03a606b7 LoongArch: KVM: Add PV IPI support on guest side
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r052-20241013 (https://download.01.org/0day-ci/archive/20241014/202410141120.P7A2IBq2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410141120.P7A2IBq2-lkp@intel.com/

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

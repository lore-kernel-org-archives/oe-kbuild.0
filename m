Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5D26FA9
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jan 2024 05:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706420058; cv=none; b=BDE/SzCfHl5w+KAtyXBOfytyI1mVSw1ZR01S4tO70MWqxy3OgvWLM1X4Oh288g7M2d7Zg/aDRO7jZuOxhxcZLZ5aprexBxcPxJaxrPJ9H0P3MgLTnSSd78m4ZvgN0BEgEep8hqa7Gh/nTn2V+fACNFak1IYo4ArWKcKB4qq6hGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706420058; c=relaxed/simple;
	bh=/rhgAKAjBrSGUVAWF7NvaebjcHcZDWs06NIf0awwZ8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P79On79nVozRjPaSZVLNRlgrU1Sn9d+Ce39SJnHZrqv7ze6OUL+8CbtikpfeyTl07D2W8fBhfky+ntwwwXqLoYNgdvBbSMjNQSPj1RsDuy28sFbUKnZnKWuVf3WHl+vtQLC7Jp28vg7ePJWdLfk58hthf3rYIamlrPHJJNeqR8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsjd+way; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsjd+way"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706420056; x=1737956056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/rhgAKAjBrSGUVAWF7NvaebjcHcZDWs06NIf0awwZ8U=;
  b=jsjd+wayZ27JRPDQjAJjYaGPMb6bK3DartunOvY3eBS4WsXtkHrjLkFu
   /w+KCdH8nBNswx6pPD/sqCiFN1mFXd/gZuIw/mMU6ZiLxSrDQ9fZ0z4tM
   8Q/ocUdzFvCP1hReiYwyJcu4nyejj/hkHAkFyPLpsMfieYdvzROH2kP7n
   nxmSyCfnVBMF4lFbueYH5JJYmgjEPXL0t9/bGkOFDU5qr0tLMhaAz3lMw
   1utaj8stjgxOAzRvP0VSPdyod+hQoFW14RHxnEanR2K2cD/QlZzR65kc7
   Oh4uRznlcRuzxjlcLYH/zB+MBbyHVXWXNEaAlK1F27lGMfDtwA4egr+bI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="24212928"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="24212928"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 21:34:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3067963"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2024 21:34:14 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTxo4-000372-24;
	Sun, 28 Jan 2024 05:34:12 +0000
Date: Sun, 28 Jan 2024 13:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3 6/6] LoongArch: Add pv ipi support on LoongArch system
Message-ID: <202401281355.FJwI5T0j-lkp@intel.com>
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
In-Reply-To: <20240122100313.1589372-7-maobibo@loongson.cn>
References: <20240122100313.1589372-7-maobibo@loongson.cn>
TO: Bibo Mao <maobibo@loongson.cn>
TO: Huacai Chen <chenhuacai@kernel.org>
TO: Tianrui Zhao <zhaotianrui@loongson.cn>
TO: Juergen Gross <jgross@suse.com>
TO: Paolo Bonzini <pbonzini@redhat.com>
CC: loongarch@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: virtualization@lists.linux.dev
CC: kvm@vger.kernel.org

Hi Bibo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7a396820222d6d4c02057f41658b162bdcdadd0e]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibo-Mao/LoongArch-smp-Refine-ipi-ops-on-LoongArch-platform/20240122-220556
base:   7a396820222d6d4c02057f41658b162bdcdadd0e
patch link:    https://lore.kernel.org/r/20240122100313.1589372-7-maobibo%40loongson.cn
patch subject: [PATCH v3 6/6] LoongArch: Add pv ipi support on LoongArch system
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: loongarch-randconfig-r064-20240128 (https://download.01.org/0day-ci/archive/20240128/202401281355.FJwI5T0j-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401281355.FJwI5T0j-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/paravirt.c:57:13-14: WARNING opportunity for max()

vim +57 arch/loongarch/kernel/paravirt.c

7a64be55833676 Bibo Mao 2024-01-22  35  
7a64be55833676 Bibo Mao 2024-01-22  36  #define KVM_IPI_CLUSTER_SIZE		(2 * BITS_PER_LONG)
7a64be55833676 Bibo Mao 2024-01-22  37  static void pv_send_ipi_mask(const struct cpumask *mask, unsigned int action)
7a64be55833676 Bibo Mao 2024-01-22  38  {
7a64be55833676 Bibo Mao 2024-01-22  39  	unsigned int cpu, i, min = 0, max = 0, old;
7a64be55833676 Bibo Mao 2024-01-22  40  	__uint128_t bitmap = 0;
7a64be55833676 Bibo Mao 2024-01-22  41  	irq_cpustat_t *info;
7a64be55833676 Bibo Mao 2024-01-22  42  
7a64be55833676 Bibo Mao 2024-01-22  43  	if (cpumask_empty(mask))
7a64be55833676 Bibo Mao 2024-01-22  44  		return;
7a64be55833676 Bibo Mao 2024-01-22  45  
7a64be55833676 Bibo Mao 2024-01-22  46  	action = BIT(action);
7a64be55833676 Bibo Mao 2024-01-22  47  	for_each_cpu(i, mask) {
7a64be55833676 Bibo Mao 2024-01-22  48  		info = &per_cpu(irq_stat, i);
7a64be55833676 Bibo Mao 2024-01-22  49  		old = atomic_fetch_or(action, &info->messages);
7a64be55833676 Bibo Mao 2024-01-22  50  		if (old)
7a64be55833676 Bibo Mao 2024-01-22  51  			continue;
7a64be55833676 Bibo Mao 2024-01-22  52  
7a64be55833676 Bibo Mao 2024-01-22  53  		cpu = cpu_logical_map(i);
7a64be55833676 Bibo Mao 2024-01-22  54  		if (!bitmap) {
7a64be55833676 Bibo Mao 2024-01-22  55  			min = max = cpu;
7a64be55833676 Bibo Mao 2024-01-22  56  		} else if (cpu > min && cpu < min + KVM_IPI_CLUSTER_SIZE) {
7a64be55833676 Bibo Mao 2024-01-22 @57  			max = cpu > max ? cpu : max;
7a64be55833676 Bibo Mao 2024-01-22  58  		} else if (cpu < min && (max - cpu) < KVM_IPI_CLUSTER_SIZE) {
7a64be55833676 Bibo Mao 2024-01-22  59  			bitmap <<= min - cpu;
7a64be55833676 Bibo Mao 2024-01-22  60  			min = cpu;
7a64be55833676 Bibo Mao 2024-01-22  61  		} else {
7a64be55833676 Bibo Mao 2024-01-22  62  			/*
7a64be55833676 Bibo Mao 2024-01-22  63  			 * Physical cpuid is sorted in ascending order ascend
7a64be55833676 Bibo Mao 2024-01-22  64  			 * for the next mask calculation, send IPI here
7a64be55833676 Bibo Mao 2024-01-22  65  			 * directly and skip the remainding cpus
7a64be55833676 Bibo Mao 2024-01-22  66  			 */
7a64be55833676 Bibo Mao 2024-01-22  67  			kvm_hypercall3(KVM_HC_FUNC_IPI, (unsigned long)bitmap,
7a64be55833676 Bibo Mao 2024-01-22  68  				(unsigned long)(bitmap >> BITS_PER_LONG), min);
7a64be55833676 Bibo Mao 2024-01-22  69  			min = max = cpu;
7a64be55833676 Bibo Mao 2024-01-22  70  			bitmap = 0;
7a64be55833676 Bibo Mao 2024-01-22  71  		}
7a64be55833676 Bibo Mao 2024-01-22  72  		__set_bit(cpu - min, (unsigned long *)&bitmap);
7a64be55833676 Bibo Mao 2024-01-22  73  	}
7a64be55833676 Bibo Mao 2024-01-22  74  
7a64be55833676 Bibo Mao 2024-01-22  75  	if (bitmap)
7a64be55833676 Bibo Mao 2024-01-22  76  		kvm_hypercall3(KVM_HC_FUNC_IPI, (unsigned long)bitmap,
7a64be55833676 Bibo Mao 2024-01-22  77  				(unsigned long)(bitmap >> BITS_PER_LONG), min);
7a64be55833676 Bibo Mao 2024-01-22  78  }
7a64be55833676 Bibo Mao 2024-01-22  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812C92EAEA
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 16:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700210; cv=none; b=lnsPR/qu5esLTe3Cc17BVWRJfZMOAU6OndXCsXqifrXDn2W/QmfudDG2+/8Mo7QWfAB0sZjec0aIRKrKOtl508HVY2KTZeoyeQR2MQlgK93g066fpnvpZZKXMB4hJit7h/Wz+DX/tSwTBE5dnSyMPsu62eIZsuZ4Lt2PMKf4TPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700210; c=relaxed/simple;
	bh=5YpytxSHY0n6cCxFEmUewhWdDuD+bJwAe+GptqumZBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hnbeLC/o11PADIOmMJHVQaGYyMYP25qMYrGJzQ+xKRj8qB+RQDA+oH3LJNYs89G9R26cGoxJyEPy3gwmHbrEqqp/7i6Y+uyGqTp/zqOiL/5E/14P3p9ypTZKLbuBOfI0zpwCvVcYrG5urkxgua+7hX2RTWYO5PyvT9oXBMeoLc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+ERezMW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+ERezMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729700208; x=1761236208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5YpytxSHY0n6cCxFEmUewhWdDuD+bJwAe+GptqumZBM=;
  b=h+ERezMWRDfk+rrAkUr5JLAhE1U9rn3W4JLArRJQrqs0U8LXblYMFTG2
   T78et4aO7XEPcIfWzFX/E7ZrpKBc9yop847NAjy+POasCOnIz00nSD1M1
   bdJlHCcVDppTZYuaZ/W+1Ao6lgSH2j+9jm59XSqRR39c6Kc1HfgWwyy65
   kCCR4DHQZ26b3LzJ4Ni1s62+EyCarYHWPLUnVZwQw4BjVgxMuGHJbcWui
   MV7B+3lQbrqk56EtsbU4mjxLFYGM/WgEbbgbJ9iXAy+oTglACmFEwTzxh
   bNPjfQy9Sfy/F+totJZbDJ3hv2sv8nv+HEtXfjqlrajfk6IPLPjdLIQTP
   A==;
X-CSE-ConnectionGUID: vXUS0y8DQ5y1BPeULSI4KQ==
X-CSE-MsgGUID: qqgEbX+6RcS+Tp3znNw/HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29459902"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29459902"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 09:16:47 -0700
X-CSE-ConnectionGUID: obENzCkORSawbhrMS0v+yQ==
X-CSE-MsgGUID: BE6WJvWSSvCIkK6H0hSHhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80201746"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 09:16:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3e2O-000V8S-0t;
	Wed, 23 Oct 2024 16:16:44 +0000
Date: Thu, 24 Oct 2024 00:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2] LoongArch: Fix cpu hotplug issue
Message-ID: <202410240011.yyn65q8W-lkp@intel.com>
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
In-Reply-To: <20241021080418.644342-1-maobibo@loongson.cn>
References: <20241021080418.644342-1-maobibo@loongson.cn>
TO: Bibo Mao <maobibo@loongson.cn>
TO: Huacai Chen <chenhuacai@kernel.org>
TO: Jianmin Lv <lvjianmin@loongson.cn>
CC: loongarch@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: lixianglai@loongson.cn
CC: WANG Xuerui <kernel@xen0n.name>

Hi Bibo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 42f7652d3eb527d03665b09edac47f85fb600924]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibo-Mao/LoongArch-Fix-cpu-hotplug-issue/20241021-160525
base:   42f7652d3eb527d03665b09edac47f85fb600924
patch link:    https://lore.kernel.org/r/20241021080418.644342-1-maobibo%40loongson.cn
patch subject: [PATCH v2] LoongArch: Fix cpu hotplug issue
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r051-20241023 (https://download.01.org/0day-ci/archive/20241024/202410240011.yyn65q8W-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410240011.yyn65q8W-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/smp.c:295:6-9: WARNING: Unsigned expression compared with zero: cpu < 0

vim +295 arch/loongarch/kernel/smp.c

316863cb62fe7aa Bibo Mao    2024-05-06  279  
88d4d957edc707e Binbin Zhou 2022-12-10  280  static void __init fdt_smp_setup(void)
88d4d957edc707e Binbin Zhou 2022-12-10  281  {
88d4d957edc707e Binbin Zhou 2022-12-10  282  #ifdef CONFIG_OF
88d4d957edc707e Binbin Zhou 2022-12-10  283  	unsigned int cpu, cpuid;
88d4d957edc707e Binbin Zhou 2022-12-10  284  	struct device_node *node = NULL;
88d4d957edc707e Binbin Zhou 2022-12-10  285  
88d4d957edc707e Binbin Zhou 2022-12-10  286  	for_each_of_cpu_node(node) {
88d4d957edc707e Binbin Zhou 2022-12-10  287  		if (!of_device_is_available(node))
88d4d957edc707e Binbin Zhou 2022-12-10  288  			continue;
88d4d957edc707e Binbin Zhou 2022-12-10  289  
88d4d957edc707e Binbin Zhou 2022-12-10  290  		cpuid = of_get_cpu_hwid(node, 0);
88d4d957edc707e Binbin Zhou 2022-12-10  291  		if (cpuid >= nr_cpu_ids)
88d4d957edc707e Binbin Zhou 2022-12-10  292  			continue;
88d4d957edc707e Binbin Zhou 2022-12-10  293  
1c3dd9a636b13c7 Bibo Mao    2024-10-21  294  		cpu = topo_add_cpu(cpuid);
1c3dd9a636b13c7 Bibo Mao    2024-10-21 @295  		if (cpu < 0)
1c3dd9a636b13c7 Bibo Mao    2024-10-21  296  			continue;
88d4d957edc707e Binbin Zhou 2022-12-10  297  
88d4d957edc707e Binbin Zhou 2022-12-10  298  		num_processors++;
88d4d957edc707e Binbin Zhou 2022-12-10  299  		set_cpu_possible(cpu, true);
88d4d957edc707e Binbin Zhou 2022-12-10  300  		set_cpu_present(cpu, true);
88d4d957edc707e Binbin Zhou 2022-12-10  301  		__cpu_number_map[cpuid] = cpu;
88d4d957edc707e Binbin Zhou 2022-12-10  302  		__cpu_logical_map[cpu] = cpuid;
3de9c42d02a79a5 Jiaxun Yang 2024-06-03  303  
1c3dd9a636b13c7 Bibo Mao    2024-10-21  304  		early_numa_add_cpu(cpuid, 0);
3de9c42d02a79a5 Jiaxun Yang 2024-06-03  305  		set_cpuid_to_node(cpuid, 0);
88d4d957edc707e Binbin Zhou 2022-12-10  306  	}
88d4d957edc707e Binbin Zhou 2022-12-10  307  
88d4d957edc707e Binbin Zhou 2022-12-10  308  	loongson_sysconf.nr_cpus = num_processors;
ce68ff3528e6eff Huacai Chen 2024-01-17  309  	set_bit(0, loongson_sysconf.cores_io_master);
88d4d957edc707e Binbin Zhou 2022-12-10  310  #endif
88d4d957edc707e Binbin Zhou 2022-12-10  311  }
88d4d957edc707e Binbin Zhou 2022-12-10  312  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

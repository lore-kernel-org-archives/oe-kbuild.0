Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6BA1B86EF
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729615012; cv=none; b=MU4YwM5OG+iOxF5/azVLKSOSidoH8iQU4MXlLaQFXkPiYF5H1/zfqw9Oqykm2t1gwP9JenWKvXEB03GzRj8H+ScimdrUkrWfr2sz8ufN+nMLF6k7phlZ4nF0UcppEPFOUeZQRRTfvqU+JWRQd8rpbMzsmK75RsT1nRycqjrLjVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729615012; c=relaxed/simple;
	bh=nlHZqitwM0kwjbNsiecdh1UItzH41Y4iLnbsNHzDqAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MnjvdHLGCTP7qUuGL9eAcpPb6m/M0RrUW4DMzkfFhGnkCZRgHeCTKihtmU3ApuqHmQfe1Ib5i2Ii4+58N1ryY7lMiiXqnR+DExWLN3UqbLQcKbqdIB9ONxLwaFfQXWUYF+IdJAdDlrHPp33PbCcCBfhroSrrWrXpuClT8d0k4mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQbnNf0l; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQbnNf0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729615010; x=1761151010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nlHZqitwM0kwjbNsiecdh1UItzH41Y4iLnbsNHzDqAE=;
  b=XQbnNf0lLspY4u+IKdSXvwEr16CVTUaxlYbpgMCzK0CjIkxwymjDkJWw
   Augt1o63Vqbcx2Efe+tWVUNybIMONd6sIIgg9z+m/0G6epDZvUyCFKAKn
   Rbwpl3mlDqZ7bXecnrXpU7/1KIYvFPOwI5qT8pewbBvG7fs2zLMj4fBn+
   Ly1MGO5/JCB8Mjs6LUJA0fVmU7fzqBypsjTuAQ9DGiVPXGiWeK6NV2shl
   lPIhmUhkjW8Ed/kzpadsjvky5kxuKeajFP4JKXnI0UKzAXwMUGbXaeChq
   WP0RsVaxMYcHJCO4a1hor8pzunOCDozt0K288wu1qeVPWoiqa3XTz8EaW
   Q==;
X-CSE-ConnectionGUID: lTuaPIgISXaFUd4VI7Gdjg==
X-CSE-MsgGUID: UHsdOKbHT7eTFpch8DWFFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39746260"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="39746260"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 09:36:50 -0700
X-CSE-ConnectionGUID: rV06dkOjQpK6MB3FcJMTZA==
X-CSE-MsgGUID: +mGC0K9/SsmtqZkiQwutWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79502030"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2024 09:36:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3HsE-000Tox-1h;
	Tue, 22 Oct 2024 16:36:46 +0000
Date: Wed, 23 Oct 2024 00:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kernel/hw_breakpoint.c:510 arch_hw_breakpoint_init()
 warn: we never enter this loop
Message-ID: <202410230002.sbJRhNZY-lkp@intel.com>
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
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: 5685d7fcb55fd729d7e0452c157a0ac8d72ca7b6 LoongArch: Give a chance to build with !CONFIG_SMP
date:   5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r071-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230002.sbJRhNZY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410230002.sbJRhNZY-lkp@intel.com/

smatch warnings:
arch/loongarch/kernel/hw_breakpoint.c:510 arch_hw_breakpoint_init() warn: we never enter this loop

vim +510 arch/loongarch/kernel/hw_breakpoint.c

edffa33c7bb5a7 Qing Zhang 2023-02-25  499  
edffa33c7bb5a7 Qing Zhang 2023-02-25  500  static int __init arch_hw_breakpoint_init(void)
edffa33c7bb5a7 Qing Zhang 2023-02-25  501  {
edffa33c7bb5a7 Qing Zhang 2023-02-25  502  	int cpu;
edffa33c7bb5a7 Qing Zhang 2023-02-25  503  
edffa33c7bb5a7 Qing Zhang 2023-02-25  504  	boot_cpu_data.watch_ireg_count = get_num_brps();
edffa33c7bb5a7 Qing Zhang 2023-02-25  505  	boot_cpu_data.watch_dreg_count = get_num_wrps();
edffa33c7bb5a7 Qing Zhang 2023-02-25  506  
edffa33c7bb5a7 Qing Zhang 2023-02-25  507  	pr_info("Found %d breakpoint and %d watchpoint registers.\n",
edffa33c7bb5a7 Qing Zhang 2023-02-25  508  		boot_cpu_data.watch_ireg_count, boot_cpu_data.watch_dreg_count);
edffa33c7bb5a7 Qing Zhang 2023-02-25  509  
edffa33c7bb5a7 Qing Zhang 2023-02-25 @510  	for (cpu = 1; cpu < NR_CPUS; cpu++) {
edffa33c7bb5a7 Qing Zhang 2023-02-25  511  		cpu_data[cpu].watch_ireg_count = boot_cpu_data.watch_ireg_count;
edffa33c7bb5a7 Qing Zhang 2023-02-25  512  		cpu_data[cpu].watch_dreg_count = boot_cpu_data.watch_dreg_count;
edffa33c7bb5a7 Qing Zhang 2023-02-25  513  	}
edffa33c7bb5a7 Qing Zhang 2023-02-25  514  
edffa33c7bb5a7 Qing Zhang 2023-02-25  515  	return 0;
edffa33c7bb5a7 Qing Zhang 2023-02-25  516  }
edffa33c7bb5a7 Qing Zhang 2023-02-25  517  arch_initcall(arch_hw_breakpoint_init);
edffa33c7bb5a7 Qing Zhang 2023-02-25  518  

:::::: The code at line 510 was first introduced by commit
:::::: edffa33c7bb5a73e90c754c7a497162b77d7c55f LoongArch: Add hardware breakpoints/watchpoints support

:::::: TO: Qing Zhang <zhangqing@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

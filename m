Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CB22248A4
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 05:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765948995; cv=none; b=pv/08yHKlDUmOw10XOjTUtK5dGT8Wd0eRbcHIZueOnSM52Uwk0uXqS1WkMPoVeNJS3spoNE9S6gpIo2Pr/Z1YtUWmrCRgAxYW2UC6BonFmDz7ZksoGjaMyXfJVaFdYiaa3v6/4G80++zpEkYDHBRMJ8jJWSTeSX2LgxGDN0/VqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765948995; c=relaxed/simple;
	bh=AwueVn/Cbb66ajWCnX77iGLRPoSLix9EIRt2ml4thb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tP3uVrg906rRwmKexlJHGBk3RhoMbUSvXobKgZujQyc7PSTcvBYeXPYHX3egg4oEqYVGWI908ApvpWnKscdFLlHaFwfYJrv4fKBVAjfIu3UYDOFYjvXcHg7TQbWTajhR08GcD3QQD/j+GeLYWUVK3DpmZ79h8vN2nIIYi1a/SuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSKFEEwh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSKFEEwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765948993; x=1797484993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AwueVn/Cbb66ajWCnX77iGLRPoSLix9EIRt2ml4thb0=;
  b=GSKFEEwhsY7a/jIpQeoJbyZkp7E5j3VAQ73+1oL6InJL0NrhGKK5y4wg
   owqvYbXwTsjs8wU2f6QDnoL6F2C7gI/CCa+xwWdAKf/qq9vkjwChjsktH
   j9AqqkT6RYpqckyL4UFN/cQaT++NAeG5qgXJUTzqtkDlbBYDZlwzEu5ED
   VhmGDb9tEIi6qNsb3Wyxcq4IYhoyuxfXVk9h8+2EJ1UtoWkA6QB9xPlh1
   YR/RwVkDWuSgiGV+PYAiUyfe0JD6SgrEQt3edC/NuwIAmBQuvKdgOXlEV
   wOsByum4m1klUsho8j5Anxkp6sCUrQddQ7Y/ARUmPXf1xSLenF5fbUI0+
   g==;
X-CSE-ConnectionGUID: k2pKylc0Q2WQJNbTeI5zOg==
X-CSE-MsgGUID: UET5t1QcSEmOKyM4jRGP5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="93353162"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="93353162"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 21:23:12 -0800
X-CSE-ConnectionGUID: H0tucOeXT3OKX9sZxxfxYg==
X-CSE-MsgGUID: ibvVdktEQ1iyH7FYBA/ebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="202403610"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Dec 2025 21:23:10 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVk0C-00000000023-0ph6;
	Wed, 17 Dec 2025 05:23:08 +0000
Date: Wed, 17 Dec 2025 13:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kernel/machine_kexec_file.c:77 prepare_elf_headers()
 warn: iterator 'i' not incremented
Message-ID: <202512171351.wAFn8Cg2-lkp@intel.com>
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
TO: Youling Tang <tangyouling@kylinos.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
commit: 1bcca8620a915d2f98ad7641f82d799c17f04b93 LoongArch: Add crash dump support for kexec_file
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r071-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171351.wAFn8Cg2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512171351.wAFn8Cg2-lkp@intel.com/

smatch warnings:
arch/loongarch/kernel/machine_kexec_file.c:77 prepare_elf_headers() warn: iterator 'i' not incremented

vim +/i +77 arch/loongarch/kernel/machine_kexec_file.c

1bcca8620a915d Youling Tang 2025-10-02   59  
1bcca8620a915d Youling Tang 2025-10-02   60  static int prepare_elf_headers(void **addr, unsigned long *sz)
1bcca8620a915d Youling Tang 2025-10-02   61  {
1bcca8620a915d Youling Tang 2025-10-02   62  	int ret, nr_ranges;
1bcca8620a915d Youling Tang 2025-10-02   63  	uint64_t i;
1bcca8620a915d Youling Tang 2025-10-02   64  	phys_addr_t start, end;
1bcca8620a915d Youling Tang 2025-10-02   65  	struct crash_mem *cmem;
1bcca8620a915d Youling Tang 2025-10-02   66  
1bcca8620a915d Youling Tang 2025-10-02   67  	nr_ranges = 2; /* for exclusion of crashkernel region */
1bcca8620a915d Youling Tang 2025-10-02   68  	for_each_mem_range(i, &start, &end)
1bcca8620a915d Youling Tang 2025-10-02   69  		nr_ranges++;
1bcca8620a915d Youling Tang 2025-10-02   70  
1bcca8620a915d Youling Tang 2025-10-02   71  	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
1bcca8620a915d Youling Tang 2025-10-02   72  	if (!cmem)
1bcca8620a915d Youling Tang 2025-10-02   73  		return -ENOMEM;
1bcca8620a915d Youling Tang 2025-10-02   74  
1bcca8620a915d Youling Tang 2025-10-02   75  	cmem->max_nr_ranges = nr_ranges;
1bcca8620a915d Youling Tang 2025-10-02   76  	cmem->nr_ranges = 0;
1bcca8620a915d Youling Tang 2025-10-02  @77  	for_each_mem_range(i, &start, &end) {
1bcca8620a915d Youling Tang 2025-10-02   78  		cmem->ranges[cmem->nr_ranges].start = start;
1bcca8620a915d Youling Tang 2025-10-02   79  		cmem->ranges[cmem->nr_ranges].end = end - 1;
1bcca8620a915d Youling Tang 2025-10-02   80  		cmem->nr_ranges++;
1bcca8620a915d Youling Tang 2025-10-02   81  	}
1bcca8620a915d Youling Tang 2025-10-02   82  
1bcca8620a915d Youling Tang 2025-10-02   83  	/* Exclude crashkernel region */
1bcca8620a915d Youling Tang 2025-10-02   84  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
1bcca8620a915d Youling Tang 2025-10-02   85  	if (ret < 0)
1bcca8620a915d Youling Tang 2025-10-02   86  		goto out;
1bcca8620a915d Youling Tang 2025-10-02   87  
1bcca8620a915d Youling Tang 2025-10-02   88  	if (crashk_low_res.end) {
1bcca8620a915d Youling Tang 2025-10-02   89  		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
1bcca8620a915d Youling Tang 2025-10-02   90  		if (ret < 0)
1bcca8620a915d Youling Tang 2025-10-02   91  			goto out;
1bcca8620a915d Youling Tang 2025-10-02   92  	}
1bcca8620a915d Youling Tang 2025-10-02   93  
1bcca8620a915d Youling Tang 2025-10-02   94  	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
1bcca8620a915d Youling Tang 2025-10-02   95  
1bcca8620a915d Youling Tang 2025-10-02   96  out:
1bcca8620a915d Youling Tang 2025-10-02   97  	kfree(cmem);
1bcca8620a915d Youling Tang 2025-10-02   98  	return ret;
1bcca8620a915d Youling Tang 2025-10-02   99  }
1bcca8620a915d Youling Tang 2025-10-02  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63313191F6C
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 23:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729295113; cv=none; b=KMS7ppHUdBwo3UTG+WaCxJFkkuBG5AZCxvSMo2crqxh4LXKUzWRggMaFfc2v6j9C2g3KgTDas6XxN2StUh0375lj2ACFLT1QoMlsTEBQDwPQNSIe8WfpWWKit4dai+Pxhv++yxLBkMTXSuf2SXxjWEhYNSGGMlR8YOt6eCEXM6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729295113; c=relaxed/simple;
	bh=/EgmrCpTgH9ZXJp2AG8m0fuwv82k0StfiS8NvmOgYNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+pmiFlu8R+63LW5HJKn0iVIqAkjSu4v+66/y6T9ijACxU46Wc2g2u7WBLnwlECP35X0EQPtn31ROr/Fvh+rCvdO3peeube9bEr02g8IE0dmbvRFrmXWPwqiTp9GnsBfEJ8kPb76FD4l/NpNmO7xdgje/0HMwSkuUoig16i8c94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JREghzI3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JREghzI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729295110; x=1760831110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EgmrCpTgH9ZXJp2AG8m0fuwv82k0StfiS8NvmOgYNk=;
  b=JREghzI3qQvf7NCV6iFxOiO+noRjvXggBBxbti7UR6ym9rNJ/2gIXQb0
   b5qD/YGWbSpQp66B9KKIhXFKNG97EmHBKpK7EjlmsqoYim0zOf23+63mq
   9VIbPpqm96j3GqyhiwajFLVPlfaI7c8fWJkt2vJZuOrgVgDfSGi2gyiF7
   QjmgcVmLri8c5u/LrhqMe5MTNT8SxTGyguKCCDK2h9IynalvlkvfPkHoS
   ZvreO10tf6aEcgXOpcgMWGgcTB7MJJIrHN5qNjB4qniVWitHO7eX8cGKk
   Xf0sRywhbCS7/fLcvLbt5kuyyJz4bnX/oh9LS04MRijNtZMar8iX0hWVy
   w==;
X-CSE-ConnectionGUID: 82d1XCDgTQaoEY+PmvYAOA==
X-CSE-MsgGUID: +nml5sVXQ96eNuw7i4W/iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28799595"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28799595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 16:45:10 -0700
X-CSE-ConnectionGUID: AjKZF+49Q0m8BT5OzdoKZQ==
X-CSE-MsgGUID: CgbWyg8KQEeMxJdtqDkusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="78968391"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2024 16:45:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1weY-000OQZ-1n;
	Fri, 18 Oct 2024 23:45:06 +0000
Date: Sat, 19 Oct 2024 07:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/cgroup/misc.c:338 misc_cg_peak_show() warn: we never enter
 this loop
Message-ID: <202410190730.0Nu5gEQ4-lkp@intel.com>
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
TO: Xiu Jianfeng <xiujianfeng@huawei.com>
CC: Tejun Heo <tj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b04ae0f45168973edb658ac2385045ac13c5aca7
commit: 1028f391d5f9d4248e2f49193e6de2516ad630f8 cgroup/misc: Introduce misc.peak
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: xtensa-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241019/202410190730.0Nu5gEQ4-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410190730.0Nu5gEQ4-lkp@intel.com/

smatch warnings:
kernel/cgroup/misc.c:338 misc_cg_peak_show() warn: we never enter this loop

vim +338 kernel/cgroup/misc.c

a72232eabdfcfe Vipin Sharma 2021-03-29  323  
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  324  /**
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  325   * misc_cg_peak_show() - Show the peak usage of the misc cgroup.
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  326   * @sf: Interface file
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  327   * @v: Arguments passed
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  328   *
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  329   * Context: Any context.
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  330   * Return: 0 to denote successful print.
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  331   */
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  332  static int misc_cg_peak_show(struct seq_file *sf, void *v)
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  333  {
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  334  	int i;
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  335  	u64 watermark;
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  336  	struct misc_cg *cg = css_misc(seq_css(sf));
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  337  
1028f391d5f9d4 Xiu Jianfeng 2024-07-03 @338  	for (i = 0; i < MISC_CG_RES_TYPES; i++) {
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  339  		watermark = atomic64_read(&cg->res[i].watermark);
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  340  		if (READ_ONCE(misc_res_capacity[i]) || watermark)
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  341  			seq_printf(sf, "%s %llu\n", misc_res_name[i], watermark);
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  342  	}
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  343  
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  344  	return 0;
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  345  }
1028f391d5f9d4 Xiu Jianfeng 2024-07-03  346  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

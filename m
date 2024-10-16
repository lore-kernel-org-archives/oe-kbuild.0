Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA8187850
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729066331; cv=none; b=CkXnQJDS05l8jRxh4H5jHj4PVSxM7gcV8OrGsxCydyCxG3fBYso/A64CGoO0voF6z2Nsma4iYksPxHuADTcKrFgWnFscgyo9RSyWP2VUzTaLTOXYdyvORsTviGesIagoxHAHv0RLDwMRfrntcb7+Bl5JR4jva78uVCQTXPqUsxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729066331; c=relaxed/simple;
	bh=5w6Y6HSPq5rwM3MhU+XL6nzD4PHeiTJ2114zxdXKWDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKzKZHtQgnmQEjGXhakJPckv0fhSH3Nkk6iPif29otlw5OduXTpfMIXQpxen+MIeiguS+Rsj4mHClcwxZApparsPYEruOQITEZo7okJeN+1QtkAogKWSOHhUbARsR5MafRkbWK20oADKmOca2YxqV9sBOL+IUSSG/z8KpH/zCeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNQuNjdZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNQuNjdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729066329; x=1760602329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5w6Y6HSPq5rwM3MhU+XL6nzD4PHeiTJ2114zxdXKWDA=;
  b=SNQuNjdZp9rjVDenHgehj1zdMaAwHQG/UB+7bX/qvgWu8mteXe/mIwP2
   g4JDo1NunQ+o5V0NRSndCv9a0Ru7obi+aWYsePgWpwXxk6noazzcARhiI
   oUjKNNRM2K2TKmqeXejFZKhDziDFqoTvVyeSUO9vd6OKfeZxarB1Idjhh
   OBWYko+8h+lSLnNB5zFroQ6Mn+XAQn+++0bdjiyFxK3u16dHxzGsGSwoQ
   hr8rouLjAUs4zEASV3KdhcI7tCjqKesNzY7YTTxxw94cT+oQxeFICOOMc
   znq80Vox7vLbutw7gDzvgOSB6xZcxxos/J5AxAmkPs0yM6vrUWJdq4NZ/
   Q==;
X-CSE-ConnectionGUID: DWoa5Tu7RzabUtYzL7jYdw==
X-CSE-MsgGUID: ILh0iCgUQx2RcatdG3jI3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32191951"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32191951"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 01:12:08 -0700
X-CSE-ConnectionGUID: ebm6GNN/Qq++zNsQ4/l6OA==
X-CSE-MsgGUID: Kd4rg6PIScqsdT2hkB3aQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78100224"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Oct 2024 01:12:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0z8W-000Ka7-2Q;
	Wed, 16 Oct 2024 08:12:04 +0000
Date: Wed, 16 Oct 2024 16:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/cgroup/misc.c:338 misc_cg_peak_show() warn: we never enter
 this loop
Message-ID: <202410161651.xrk376Cp-lkp@intel.com>
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
head:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
commit: 1028f391d5f9d4248e2f49193e6de2516ad630f8 cgroup/misc: Introduce misc.peak
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: xtensa-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241016/202410161651.xrk376Cp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410161651.xrk376Cp-lkp@intel.com/

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

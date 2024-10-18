Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B7C183CBB
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729232954; cv=none; b=OWWC0z/l80lXxvo/hkiwdicKO78FO2CPdS6mn4fPqMRrgyrL5jP3B41JPSFdC4pDefWq6M66F6VugcBJJz8XSpa3Gyqyk80iOTCzqMP8CcgvPbU2ekiytJCRyMroyazCLpU4NMOzlNU2wTlS6xOMxAPBcVCFkfe3j91pXD5aYYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729232954; c=relaxed/simple;
	bh=Ueo0S1HAg0CxzXvDz/H+UdEwNm1+Cu3mCZvtnlSZ58E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gifOCzd8IYkHT0fwMn2FXhg5wJHX4PTuv5MfVwtWFoXMMz4ihtINWm/YfunzdibF5iutyCVioua6/KhEiEjx4u+0YhACNLflfP+H6ppgbMpTC1J9xBQigV3/vevvGOKRV2Es8jwZFBSsb6Cr/kHmz4S1+OpnUjH5/Lak+Lv9lMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fB4LdQVU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fB4LdQVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729232952; x=1760768952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ueo0S1HAg0CxzXvDz/H+UdEwNm1+Cu3mCZvtnlSZ58E=;
  b=fB4LdQVU8nopJwWlleX4fDj9LD1QLXsmhwQfcS6z4aCjBYHzgy0NXj5o
   khZh/c+t5SulkVgpEZVWYuOefH2dEn6cus+/uQfQizccgc0quu/Q+TT+N
   RbB1NJrUR9GnMhnCwKITkRcybdr/3FiGka80Jml/M8g7mVZzf2MXhLaYG
   YXSydxIpdL0FdERNKwm6Wx2mmyaMJ7kGngSD96OHukxLEl8plO+Gqb6IA
   HQWtaVyNoPCwq+lsv99HKNteD/ijrm2VLrYlPlGUR8Jkh+p6ssotPxoL7
   ILiLaEJ0K+F/qlIQp7gLS7lGVhOLQX+Dp9Y6AWOiZQy1C+lSBStfTOWt0
   Q==;
X-CSE-ConnectionGUID: 4EYa+1/lQsCze6boqbN/WA==
X-CSE-MsgGUID: B7pyMNaFSySKZWjPSUMyqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40115613"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="40115613"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 23:29:11 -0700
X-CSE-ConnectionGUID: lUUU+S8zTqCYgVjULJWBCA==
X-CSE-MsgGUID: w+Ray/QXRW6F6fFBJFH9hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="78440072"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Oct 2024 23:29:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1gU0-000NMf-0o;
	Fri, 18 Oct 2024 06:29:08 +0000
Date: Fri, 18 Oct 2024 14:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/cgroup/misc.c:338 misc_cg_peak_show() warn: we never enter
 this loop
Message-ID: <202410181457.ewYC5PYf-lkp@intel.com>
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
head:   4d939780b70592e0f4bc6c397e52e518f8fb7916
commit: 1028f391d5f9d4248e2f49193e6de2516ad630f8 cgroup/misc: Introduce misc.peak
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: xtensa-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241018/202410181457.ewYC5PYf-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410181457.ewYC5PYf-lkp@intel.com/

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

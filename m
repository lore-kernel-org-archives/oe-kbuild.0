Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CA4197A6C
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 11:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732792737; cv=none; b=l5LMYxbh+LA6+fqO1Piparwewuee6Q6UcnhdLJoWfywhrz4KrgVHxKhNVPjWtn9NKAJtTZmARL3PPztz/dY9RIz3+KeMPTOoTPx74XpSViXVmbbwHqnFta3oRZZrOhifAGEkRHtIjkPloGcqQH0ZmWckLy6qhCDWeMhKrc8K1P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732792737; c=relaxed/simple;
	bh=wQfR5IqUAmbq1DuxmIHPJNJkbgmWODwskxhGuP21c60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iAWgma4TSr1Dti2bRzyqB3Lgo9FY64i5xm4w6rZaOfkWY6v3LNGvHBKa0mLm15W0DlQiDNcOgoV0fdu/Ckmr+e6jw64wVIXvcEn/3hXvLhqw1l82H+9IJdQWwU+cm1PkCireKscJbrE+mP+uvPbznpQn6UVu7/L5ft+WBkXsixc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IW9zkgVY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IW9zkgVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732792734; x=1764328734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQfR5IqUAmbq1DuxmIHPJNJkbgmWODwskxhGuP21c60=;
  b=IW9zkgVY/20iceDdoxpMpQ+I3I+l9Tfl8NhOpVzj0OOKmmQfUkZ1YJSZ
   kq5dgbyXkpXQt5PgTJyY75bFuzTDmzZvSI+hWMFUBdXTbnGTGHVZUpVxE
   xLvG1Y153oNaF/hiFCaNEqlEOY2uijgDuohuTK2DiwEoooZ10WKqcQ3dA
   kXd7tAjM39ePpi9Py+d/0P7WOhAnb1z27mqZM3kqkyhZzOPWvdVWeTSl6
   z7e9tSxEN6aZ9fMo7Cl4k3+nGiFwQgT9/DynblZLWIxdocvfwJV1OUQyH
   XDfZE0VwAIKmld9XQTdOepj+dPMmZRXCBrHS0WchJjhHrM2UA+04F01NQ
   w==;
X-CSE-ConnectionGUID: 4jYuuHuySq6RRcR7s9V99w==
X-CSE-MsgGUID: LrKZSc0fSlOcRu4Vn7m6Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="36806622"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="36806622"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 03:18:53 -0800
X-CSE-ConnectionGUID: O0b46Fc5Rli6fV53h6MteQ==
X-CSE-MsgGUID: AyGtVI9HQtKKg/jhem/DNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92143105"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Nov 2024 03:18:53 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGcXq-0009Vv-0Y;
	Thu, 28 Nov 2024 11:18:50 +0000
Date: Thu, 28 Nov 2024 19:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2483/2483]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:100
 isst_if_get_tpmi_instance_count() warn: potential spectre issue
 'isst_common.sst_inst' [r] (local cap)
Message-ID: <202411281956.6jwCAjSW-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Yingbao Jia <yingbao.jia@intel.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1a47bbfaad6fcbfb4fe3935cb7408d843caf3760
commit: 4dc4d762dd6ed4cb851209a87e79d7d936b3fb4c [2483/2483] platform/x86: ISST: Enumerate TPMI SST and create framework
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241126 (https://download.01.org/0day-ci/archive/20241128/202411281956.6jwCAjSW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411281956.6jwCAjSW-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:100 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:104 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +100 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c

4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   87  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   88  static int isst_if_get_tpmi_instance_count(void __user *argp)
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   89  {
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   90  	struct isst_tpmi_instance_count tpmi_inst;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   91  	struct tpmi_sst_struct *sst_inst;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   92  	int i;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   93  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   94  	if (copy_from_user(&tpmi_inst, argp, sizeof(tpmi_inst)))
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   95  		return -EFAULT;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   96  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   97  	if (tpmi_inst.socket_id >= topology_max_packages())
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   98  		return -EINVAL;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   99  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07 @100  	tpmi_inst.count = isst_common.sst_inst[tpmi_inst.socket_id]->number_of_power_domains;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  101  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  102  	sst_inst = isst_common.sst_inst[tpmi_inst.socket_id];
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  103  	tpmi_inst.valid_mask = 0;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07 @104  	for (i = 0; i < sst_inst->number_of_power_domains; ++i) {
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  105  		struct tpmi_per_power_domain_info *power_domain_info;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  106  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  107  		power_domain_info = &sst_inst->power_domain_info[i];
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  108  		if (power_domain_info->sst_base)
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  109  			tpmi_inst.valid_mask |= BIT(i);
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  110  	}
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  111  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  112  	if (copy_to_user(argp, &tpmi_inst, sizeof(tpmi_inst)))
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  113  		return -EFAULT;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  114  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  115  	return 0;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  116  }
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  117  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

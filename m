Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B66D192D80
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 08:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739004150; cv=none; b=cmgeb8eJ86YR6QYT3GpwTuh9XjKUOFk2hQo5U8NOaj6vZhTsqJmTGgNNOrbRv/2RiitByd41ItUFpEhWX5i1exD4cOdne4mpDQtROfpzJJzhRJeACdgsA/qlBJxDl8bhrEmMJl4He0ROj263OGXyKOiRHWyKoeB9qC8TsR8GrOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739004150; c=relaxed/simple;
	bh=WFHFGlWf4wxDBs1sIFAQYIsppCrWONYBN8whqI80570=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aNoZqevP1jk5D1SK1GdcTkwoF30nNAvCTELwFPztgl+m3L2Zi1LqG97bFms5TIph8ahZioecSBd+DYXtsJs0uxqcOZmt4wWuw0emlQoE6idp0aPACmbAq0mPr7h0Z7OeXJWhN2Q3J9ofvaYf9nl7Ha0TDwowfGYpPKsuQBsUwiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=As/gO4m/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="As/gO4m/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739004148; x=1770540148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFHFGlWf4wxDBs1sIFAQYIsppCrWONYBN8whqI80570=;
  b=As/gO4m/2DrtgrheGDl1qiX1A1l+mk8Di2Gbj89G4B+EgWCUojgmf+QW
   LezFHFfCwVY2ItknU+lxGLDZCMsLpdKv0wYaivvES3P/81lSXQwI75z9y
   oYelAnsyb+W14n0O45jModBfLoPcsnNmcBq9x+BjO0kgFY6BjadxspkpF
   fl7ksvTgfxoMYmZV4PFY7sAjZV4ku4qUhN0O3PuIspXSfjVYnlP6/VMbh
   RWT/5XOk+R0xlYFhzyN4KgpxGaxAw4yrU59i7gFucEERTkwEbzgQJ2cYr
   noPX+KC6L1hstXRCU/m8AmZH/W9zK3KiIUUCEwkkL96hvvzsGSzYjqi+S
   A==;
X-CSE-ConnectionGUID: iUqrj9GNQaWNJcM7hsyJ3w==
X-CSE-MsgGUID: xpTmpxSQRPC1Sp+uxqAXAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39910067"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="39910067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 00:42:28 -0800
X-CSE-ConnectionGUID: TbJMV+jqSYC+HulDtfeSKA==
X-CSE-MsgGUID: R6C0GpKTQBGmk9vIndZDvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111578305"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2025 00:42:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tggPw-000zlH-10;
	Sat, 08 Feb 2025 08:42:24 +0000
Date: Sat, 8 Feb 2025 16:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 6/7] clk: clk-imx8mp-audiomix: use the auxiliary
 device creation helper
Message-ID: <202502081655.FlCrxpYN-lkp@intel.com>
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
In-Reply-To: <20250206-aux-device-create-helper-v2-6-fa6a0f326527@baylibre.com>
References: <20250206-aux-device-create-helper-v2-6-fa6a0f326527@baylibre.com>
TO: Jerome Brunet <jbrunet@baylibre.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Dave Ertman <david.m.ertman@intel.com>
TO: Ira Weiny <ira.weiny@intel.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: Jerome Brunet <jbrunet@baylibre.com>
CC: linux-kernel@vger.kernel.org

Hi Jerome,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/driver-core-auxiliary-bus-add-device-creation-helper/20250207-023433
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250206-aux-device-create-helper-v2-6-fa6a0f326527%40baylibre.com
patch subject: [PATCH v2 6/7] clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r071-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081655.FlCrxpYN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502081655.FlCrxpYN-lkp@intel.com/

smatch warnings:
drivers/clk/imx/clk-imx8mp-audiomix.c:241 clk_imx8mp_audiomix_reset_controller_register() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +241 drivers/clk/imx/clk-imx8mp-audiomix.c

1496dd413b2e09 Shengjiu Wang 2024-03-21  230  
c350f4c434316c Jerome Brunet 2025-02-06  231  static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
6f0e817175c5b2 Shengjiu Wang 2024-06-14  232  {
c350f4c434316c Jerome Brunet 2025-02-06  233  	struct auxiliary_device *adev;
6f0e817175c5b2 Shengjiu Wang 2024-06-14  234  
6f0e817175c5b2 Shengjiu Wang 2024-06-14  235  	if (!of_property_present(dev->of_node, "#reset-cells"))
6f0e817175c5b2 Shengjiu Wang 2024-06-14  236  		return 0;
6f0e817175c5b2 Shengjiu Wang 2024-06-14  237  
c350f4c434316c Jerome Brunet 2025-02-06  238  	adev = devm_auxiliary_device_create(dev, KBUILD_MODNAME,
c350f4c434316c Jerome Brunet 2025-02-06  239  					    "reset", NULL, 0);
c350f4c434316c Jerome Brunet 2025-02-06  240  	if (IS_ERR_OR_NULL(adev))
c350f4c434316c Jerome Brunet 2025-02-06 @241  		return PTR_ERR(adev);
6f0e817175c5b2 Shengjiu Wang 2024-06-14  242  
6f0e817175c5b2 Shengjiu Wang 2024-06-14  243  	return 0;
6f0e817175c5b2 Shengjiu Wang 2024-06-14  244  }
6f0e817175c5b2 Shengjiu Wang 2024-06-14  245  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

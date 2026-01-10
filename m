Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B51243968
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768058947; cv=none; b=JM2y5duCrBfimb17dbRZkKby5wZVaR5Erhw4QljPb0lEeBWSTBHvoL/Qy0dhbqsoDA6HpjWyaFKqLpGAqZxxrVOf5lpdKlQNBq62w6hKQTDPvZGvAHFJTtHuS1lw4JmeDySAuyJaPdkAnKOzeol+aWB9UEMFWoGEQ0jwPdGEPvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768058947; c=relaxed/simple;
	bh=p+f8XUBUjYX4jI5dE+wc+AguyQXcYZB0+mAY3i2Qe+U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hipEFplFWQPWEDhyAJP2krGm0TOplJozlvdOSW//xkJYEsW4nGzJ7GtyoA3T82REkwC72f0xLFj9ewGvLJNIrnwR/Dh1yXgtwCBjm5XsILvpdHR2BiH1V7GAV0YZM99CIrrmT54kmnfd/pufiOdr3sYPdiXUm6rQiQMIEA2EIc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XuSc/Xkb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XuSc/Xkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768058945; x=1799594945;
  h=date:from:to:cc:subject:message-id;
  bh=p+f8XUBUjYX4jI5dE+wc+AguyQXcYZB0+mAY3i2Qe+U=;
  b=XuSc/Xkb2xL1HqpX987W6gFQ5/MHXtD42h8DBFUzGB5L2aafXueW7iux
   b+3M3zC0+CHFTIfTXAQhNUTpyUAsEfCKnp9FxNJKwa4fUoc1StUtBmMef
   9jkBrHz9PKAwCc5+hW/ti/pjRWhM5sJtEf6Y9R+RRikDVMu0S/y6ddGgX
   RylWB8/p9JDi0Tc/cH5vMVfNtWGvSOEwmbAc0G3A2ChhbEpE9oaO2iyWJ
   3KUFbwKKTB0XD2uEtIbAjeg502XS17GkYwqq94FTQbriIkoTEAFjXp0Xq
   O+GUbI8D/moQk/AMBz7TzRHPuhtApUX4jlhQJztQvGJ4leDd2fCbThWPr
   Q==;
X-CSE-ConnectionGUID: Qxgpz06MTZGytr5SBzClrA==
X-CSE-MsgGUID: RNkUKx85RSWS6XAS1kZyYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69323149"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69323149"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 07:29:04 -0800
X-CSE-ConnectionGUID: MRSGUCoqRlGb6gfw60lk8w==
X-CSE-MsgGUID: 7QJwbiEnTdmPT1TSjDdyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="234404393"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jan 2026 07:29:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veatg-000000008o1-3qqQ;
	Sat, 10 Jan 2026 15:29:00 +0000
Date: Sat, 10 Jan 2026 23:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sailus-media-tree:devel 2/6]
 drivers/media/i2c/s5kjn1.c:1485:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601102332.UqaWpU5U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/i2c/s5kjn1.c:1485:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   d2432f513e7655050d03fd609a715ea833f5f598
commit: fe2df7edd52ca04c5e88bf0181c48ac3d1d0fe9b [2/6] media: i2c: add Samsung S5KJN1 image sensor device driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-r121-20260110 (https://download.01.org/0day-ci/archive/20260110/202601102332.UqaWpU5U-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601102332.UqaWpU5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601102332.UqaWpU5U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/s5kjn1.c:1485:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/s5kjn1.c:1485:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/i2c/s5kjn1.c:1486:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/s5kjn1.c:1486:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/i2c/s5kjn1.c:1487:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/s5kjn1.c:1487:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1485 drivers/media/i2c/s5kjn1.c

fe2df7edd52ca0 Vladimir Zapolskiy 2025-12-04  1484  
fe2df7edd52ca0 Vladimir Zapolskiy 2025-12-04 @1485  MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

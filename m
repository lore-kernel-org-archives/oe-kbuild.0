Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9C638F84
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAlg8hnH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703005764; x=1734541764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VtHwFh5lVLam40QrKRAOV29W8fZRW04WXCMxcN37LUo=;
  b=cAlg8hnH/gvj9Zq6WwoyT5PZi+dmp2SbW4M0OdG55pa57ggJ91QNuaxV
   11NLffkmSnIneK5pAL1gnzPNFnHFqky3SD144WuBn2nE2rCHqJ2YhLoOI
   YB2GXduxTiZdcRmZIGYKF8vQK1NkkYP6xm3XXGdPzLlqWCp77jigld49i
   mT0JjReSUGq19ZeRQm9EBWw8/uGdnZeWFwXhAtv82g2CM3jI6Usan8+3O
   Dm4WIPeNpTEPb0njCjXr4msyq3gMOuZNQ5p7Q7VzbcGfcAs5DdQ5RPNT0
   ORRZ410MY9tl4a/xRMCx3+bcv77P1/NFiWYEH8VGQIRneqQzLZTh9tS6k
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9135682"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="9135682"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 09:07:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="841948043"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="841948043"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 Dec 2023 09:07:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFdYh-0005iR-2y;
	Tue, 19 Dec 2023 17:07:07 +0000
Date: Wed, 20 Dec 2023 01:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8829/9096] lib/kunit/device.c:138
 kunit_device_register_with_driver() warn: passing zero to 'ERR_CAST'
Message-ID: <202312200124.CkSII1FB-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: davidgow <davidgow@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa4db8324c4d0e67aa4670356df4e9fae14b4d37
commit: d03c720e03bd9bf0b784d80b5d3ede7e2daf3b6e [8829/9096] kunit: Add APIs for managing devices
:::::: branch date: 12 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20231219 (https://download.01.org/0day-ci/archive/20231220/202312200124.CkSII1FB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312200124.CkSII1FB-lkp@intel.com/

smatch warnings:
lib/kunit/device.c:138 kunit_device_register_with_driver() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +138 lib/kunit/device.c

d03c720e03bd9b davidgow@google.com 2023-12-15  126  
d03c720e03bd9b davidgow@google.com 2023-12-15  127  /**
d03c720e03bd9b davidgow@google.com 2023-12-15  128   * Create and register a new KUnit-managed device, using the user-supplied device_driver.
d03c720e03bd9b davidgow@google.com 2023-12-15  129   * On failure, returns an error pointer.
d03c720e03bd9b davidgow@google.com 2023-12-15  130   */
d03c720e03bd9b davidgow@google.com 2023-12-15  131  struct device *kunit_device_register_with_driver(struct kunit *test,
d03c720e03bd9b davidgow@google.com 2023-12-15  132  						 const char *name,
d03c720e03bd9b davidgow@google.com 2023-12-15  133  						 const struct device_driver *drv)
d03c720e03bd9b davidgow@google.com 2023-12-15  134  {
d03c720e03bd9b davidgow@google.com 2023-12-15  135  	struct kunit_device *kunit_dev = kunit_device_register_internal(test, name, drv);
d03c720e03bd9b davidgow@google.com 2023-12-15  136  
d03c720e03bd9b davidgow@google.com 2023-12-15  137  	if (IS_ERR_OR_NULL(kunit_dev))
d03c720e03bd9b davidgow@google.com 2023-12-15 @138  		return ERR_CAST(kunit_dev);
d03c720e03bd9b davidgow@google.com 2023-12-15  139  
d03c720e03bd9b davidgow@google.com 2023-12-15  140  	return &kunit_dev->dev;
d03c720e03bd9b davidgow@google.com 2023-12-15  141  }
d03c720e03bd9b davidgow@google.com 2023-12-15  142  EXPORT_SYMBOL_GPL(kunit_device_register_with_driver);
d03c720e03bd9b davidgow@google.com 2023-12-15  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

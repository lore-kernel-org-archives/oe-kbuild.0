Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350742DEA6E
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Apr 2026 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776513000; cv=none; b=P0eIlXQtDDYVkPEBcDxvGx1j9nRWE8i9N9FPUaiSOGSTTyzXTbCXyYvGbeA9bo6zGtTfv9fcYPsFsii7VvFyTL3a0MGF9dF+7KqbCIAuOxjauqgxMBOhmCiXHFDue/zg5py5bg89VB1uKocYT134n3ek1Ud/BTeZbTijkpTEhk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776513000; c=relaxed/simple;
	bh=T5RMqU9vENhrCum5swv7DtZbTiuJA9NSIWndxFig+kk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XrlkymfGrrhSg/yPu6grU/jRCzNGhXb3pYGdCZyS5NBMndDR128NBBizq3TKXW3L9pO2Qe78Ff5tK+k1CqgLn0e2NKJewLH0HnAVAixm5vJRYPBMDMkSgEghs8sVhenYyhljCWZsnMy+kdEpQoIHYiIEjH3TcWOXI2H8Zqupwkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPKu0srR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPKu0srR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776512997; x=1808048997;
  h=date:from:to:cc:subject:message-id;
  bh=T5RMqU9vENhrCum5swv7DtZbTiuJA9NSIWndxFig+kk=;
  b=bPKu0srR7oAC9nf/04x91WAr2BjlNxWEvzM5SKbCkK9/2sbKB87Gf/a9
   sgj0k1ghVnZ/w/MhMUKdmLS7OhEveFqfPnr1G/fQy3FPDviAs0OUgvAVp
   d7s+2vCcwnJzjAh40JrD8hvX41jre/bBU625dO9y6e5QgjxbcFOVyuyh6
   ohRZMtzTNzR/CQ8vUV0yY96z2ZZ0k9inrZHZBWfF28+TcjoEIoBDjHokc
   yOeBwy2X9pjZ+wm1tSAyrnvIpT1Qf2QDlcuTpleUP9vsppou4OOzVF/2T
   +JOzGwWQ5ArM49NLoeY8SdCLqk2gGmkbHK1nXdFjTHoosWYvG0MTCdKjC
   A==;
X-CSE-ConnectionGUID: Vm5mqIuYSXKU6vdxsgmlyg==
X-CSE-MsgGUID: sq3pqy6WQiO1rxETRCkbhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77375934"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="77375934"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 04:49:56 -0700
X-CSE-ConnectionGUID: Q7DrGgCLSD6hOCQrH3ORwQ==
X-CSE-MsgGUID: 1yzYW18WSsOc1CLO6KjYTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="231540595"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Apr 2026 04:49:55 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wE4BM-000000001C8-2j61;
	Sat, 18 Apr 2026 11:49:52 +0000
Date: Sat, 18 Apr 2026 19:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/platform/chrome/cros_ec_sysfs.c:355:32-49:
 opportunity for str_yes_no(ap_driven_altmode)
Message-ID: <202604181949.qP6Q9LnG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andrei Kuchynski <akuchynski@chromium.org>
CC: "Tzung-Bi Shih" <tzungbi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8541d8f725c673db3bd741947f27974358b2e163
commit: 435a3d78b87a93c52a4f84e36ba4a0857554c958 platform/chrome: cros_ec_sysfs: Expose AP_MODE_ENTRY feature state
date:   1 year, 2 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-102-20260418 (https://download.01.org/0day-ci/archive/20260418/202604181949.qP6Q9LnG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 435a3d78b87a ("platform/chrome: cros_ec_sysfs: Expose AP_MODE_ENTRY feature state")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604181949.qP6Q9LnG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/platform/chrome/cros_ec_sysfs.c:355:32-49: opportunity for str_yes_no(ap_driven_altmode)

vim +355 drivers/platform/chrome/cros_ec_sysfs.c

e6a3215f78716d Andrei Kuchynski 2025-02-03  347  
435a3d78b87a93 Andrei Kuchynski 2025-02-03  348  static ssize_t ap_mode_entry_show(struct device *dev,
435a3d78b87a93 Andrei Kuchynski 2025-02-03  349  			      struct device_attribute *attr, char *buf)
435a3d78b87a93 Andrei Kuchynski 2025-02-03  350  {
435a3d78b87a93 Andrei Kuchynski 2025-02-03  351  	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
435a3d78b87a93 Andrei Kuchynski 2025-02-03  352  	const bool ap_driven_altmode = cros_ec_check_features(
435a3d78b87a93 Andrei Kuchynski 2025-02-03  353  		ec, EC_FEATURE_TYPEC_REQUIRE_AP_MODE_ENTRY);
435a3d78b87a93 Andrei Kuchynski 2025-02-03  354  
435a3d78b87a93 Andrei Kuchynski 2025-02-03 @355  	return sysfs_emit(buf, "%s\n", ap_driven_altmode ? "yes" : "no");
435a3d78b87a93 Andrei Kuchynski 2025-02-03  356  }
435a3d78b87a93 Andrei Kuchynski 2025-02-03  357  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89086182BC
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 03:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748574991; cv=none; b=d+aI75+PJdAdS72bgP9KEgHvIeU4aYd5WSEEUK0enXRn612XRtVaJWW1xwEIGk5qTouUweWW0M+0jed4SOKszn57eOkUeEg5JSWjx8mrojPKikd51Q18MYDjB7st3dX6wpq5SX2swdxCSVZcRA3G868OCHwSrzJH1G1fNTGj+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748574991; c=relaxed/simple;
	bh=OzwDEvNs63wxHZqsOK67XSxXNk1vHn9JMRELbPVlktw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIeDqmtSJ3jqoujLr6p9m9n55wqE+KV6C5mp40eqa8D/AYkHC4tdOlAD8qNQpFoCkr6dtyOuAnEeGr07b4pKG/lxstgPDF03uwnpErLQX1LXUxYjKxMnczEp6zJE9e5NXKEaZy9feUTju2SVDW3hJwiHTNChBaFQD3lhBtlxnBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVwa8VAa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVwa8VAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748574990; x=1780110990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OzwDEvNs63wxHZqsOK67XSxXNk1vHn9JMRELbPVlktw=;
  b=lVwa8VAab9UDmLa3pLWMB+UMLMBLm6QHJGoytvy9rkV3kOkuw3pzn0sl
   4MqBE0CA+7eA5Wgq108/BMGw+NCLLiE3dtYrbkNmKbf+SGtFeCytVdH/x
   SLz74XZUFpxrYkal+pYtWBf5aEH2IsebvpLiVf6TcBFl7VJ7LBN0mMKSB
   i69ReMkGd5M7bZXHrGWoE5/mbT6PmJg04pBD4JoWZsknSIIaEVcxq1ILV
   B1JCRzyYWHcydd5Ec7vUEWqL39y77P6hpERBZ2oySDby7EalrN988KAfK
   5I2AuGuKyoWeq3KP+dJOiaJKOfFeoYOV6RJ6h1CyomV1TZ/oXZxn0u0YY
   Q==;
X-CSE-ConnectionGUID: z1Hhlg2JSvCVoRoztwfGhw==
X-CSE-MsgGUID: IDZ8B+R8QNeSJ71ACYzRHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73192522"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="73192522"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 20:16:29 -0700
X-CSE-ConnectionGUID: +Oq94sx4TTyblkWpsfKF/g==
X-CSE-MsgGUID: 58Nh8hHtS82hGkrX2UA2nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="143575992"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 May 2025 20:16:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKqEL-000XIO-1g;
	Fri, 30 May 2025 03:16:25 +0000
Date: Fri, 30 May 2025 11:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/platform/chrome/cros_ec_sysfs.c:355:32-49: opportunity for
 str_yes_no(ap_driven_altmode)
Message-ID: <202505301127.lmi3y7q1-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   e3e18291d3d62133d3ef23cb34a4eb0919a36a77
commit: dc2136f8c4ed409eb2d06722cc0a3f5a06746095 [1/1] UPSTREAM: platform/chrome: cros_ec_sysfs: Expose AP_MODE_ENTRY feature state
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-r053-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301127.lmi3y7q1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505301127.lmi3y7q1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/platform/chrome/cros_ec_sysfs.c:355:32-49: opportunity for str_yes_no(ap_driven_altmode)

vim +355 drivers/platform/chrome/cros_ec_sysfs.c

1f15db8c29906d Andrei Kuchynski 2025-02-03  347  
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  348  static ssize_t ap_mode_entry_show(struct device *dev,
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  349  			      struct device_attribute *attr, char *buf)
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  350  {
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  351  	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  352  	const bool ap_driven_altmode = cros_ec_check_features(
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  353  		ec, EC_FEATURE_TYPEC_REQUIRE_AP_MODE_ENTRY);
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  354  
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03 @355  	return sysfs_emit(buf, "%s\n", ap_driven_altmode ? "yes" : "no");
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  356  }
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  357  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5869E33F7
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Dec 2024 03:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735096310; cv=none; b=kaslmtPp8qtYd5aR4b1n8NNWQ/23EO5r+74ORJLxzvrCj6lbQhdpiFCDKE5YcOXuxu4QWRjtrDyIg+xz2hxzY7yAsPWdTCH1lRSADWZ52lnlSuitXTeSgYvAeEwla84WQhSBkzdbsuZKqNxDHL+w5HAJtz/J1mhbTXmyLsIqW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735096310; c=relaxed/simple;
	bh=TPo8rNlPd2O6B/JvAJWgoOi9rgYg+rL5BfbVtzWljY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VC8sO1m05IVmvOUjhZBsH1dd1HY2ImedX7oSJ/QG4EV8zDs/XfsRibRRVM41tLMyb1n+jJHcMkorNpQURu+aNBYEzOWWFb6T1lbEKyYU60SvFfVLnIeWHmBDbEscWb4dF6icTnPZlO8AQeJRetuBs1TuzUfIghljU/KuNeiRZNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6a793Zb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6a793Zb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735096308; x=1766632308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPo8rNlPd2O6B/JvAJWgoOi9rgYg+rL5BfbVtzWljY4=;
  b=W6a793ZbNpL2Nnr4+QI2Wkm/rL4/JyAog6WsGM4zqSOnoZoOu3kz7W7S
   FyzjaKDGg7kfy2tJzqKWxgEsbvyex0Xz2zaTD2iyPwHC5KGI1zzaPyVmb
   c4I1xrLYf0yiP6zc/JcZGTv9IEAWFEpYDzd8DBIgKZE//0EHK0OdfIUk3
   3suI2kzybtdEEfGE9xA8D2EwyhOiwG9BHroslvs9twJwaOMh5nrm1MX2J
   sZRUVFSmhUx1+ufzkwLZOLCUma4yY9jTmHXJgBMoYkLNa5y7E1CMxgxTU
   KSdo5P0U4pINLwbbrj8OvSRNpMz5pLA6v2UICio0ZO7tbGVNrxe4AgFCu
   Q==;
X-CSE-ConnectionGUID: SsWUBz4YRNeG7nazBvgWdw==
X-CSE-MsgGUID: J0Vov3tCRlu0+RwJvLdEgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35775576"
X-IronPort-AV: E=Sophos;i="6.12,262,1728975600"; 
   d="scan'208";a="35775576"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 19:11:48 -0800
X-CSE-ConnectionGUID: mItWlgWCQ9WDQA0kC7OBXQ==
X-CSE-MsgGUID: cg3PgJW6S6+ZoV4lnMnQ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,262,1728975600"; 
   d="scan'208";a="99719214"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Dec 2024 19:11:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQHoG-0001cl-1N;
	Wed, 25 Dec 2024 03:11:44 +0000
Date: Wed, 25 Dec 2024 11:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 2/2] kernel/sched/pelt.c:513 (null)()
 warn: (struct ctl_table)->procname cannot be NULL. Expression :
 sched_pelt_sysctls[1]->procname
Message-ID: <202412251143.rM9g4ujJ-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   cc2a6cb2e3103c2718274f27b95bf61fb8225ab6
commit: c07bf26056e9548038d69d8fce8e01dff3c7e1e4 [2/2] FROMLIST: sched/pelt: Introduce PELT multiplier
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241225/202412251143.rM9g4ujJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412251143.rM9g4ujJ-lkp@intel.com/

smatch warnings:
kernel/sched/pelt.c:513 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : sched_pelt_sysctls[1]->procname
kernel/sched/pelt.c:513 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : sched_pelt_sysctls[1]->proc_handler

vim +513 kernel/sched/pelt.c

c07bf26056e9548 Jing-Ting Wu 2023-01-05  512  
c07bf26056e9548 Jing-Ting Wu 2023-01-05 @513  static struct ctl_table sched_pelt_sysctls[] = {
c07bf26056e9548 Jing-Ting Wu 2023-01-05  514  	{
c07bf26056e9548 Jing-Ting Wu 2023-01-05  515  		.procname       = "sched_pelt_multiplier",
c07bf26056e9548 Jing-Ting Wu 2023-01-05  516  		.data           = &sysctl_sched_pelt_multiplier,
c07bf26056e9548 Jing-Ting Wu 2023-01-05  517  		.maxlen         = sizeof(unsigned int),
c07bf26056e9548 Jing-Ting Wu 2023-01-05  518  		.mode           = 0644,
c07bf26056e9548 Jing-Ting Wu 2023-01-05  519  		.proc_handler   = sched_pelt_multiplier,
c07bf26056e9548 Jing-Ting Wu 2023-01-05  520  	},
c07bf26056e9548 Jing-Ting Wu 2023-01-05  521  	{}
c07bf26056e9548 Jing-Ting Wu 2023-01-05  522  };
c07bf26056e9548 Jing-Ting Wu 2023-01-05  523  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

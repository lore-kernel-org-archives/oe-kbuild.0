Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1C97FD
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 01:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730942629; cv=none; b=UTkJRLhap+T4JNfQV2Bq/BPd60rnFUM+47mehVtC9MPhn31pWFWeJmnZ8EtZ6calGexlDuQ+nIYnF6LcMWYDDOoRg+NurKNVoUm4IYRP/j3kXftokNxNbKnJE8urGfsrDq8T+kKdchfegjOLko2/gBI6pUEA5zF8iAse8VdYmBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730942629; c=relaxed/simple;
	bh=FIJM9ZxVma9G6VDC6bGJBn64ZBI+bFm8LgacfkO38Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GdEaPHp0bc2H6wenyPKGXd1VHincav3Wvqiul4evSAFoibaAPIfbVNkMvCy5abrmH7NY4PJQ6HLOxVjvEEnB7XrdYJgV3/UbHZg6zMaYsPInX7CX9fFc5zRLFkV0vrzTO0RU1xalJEUIadyoCyEl5/4weGfHocDpN+ihpu89exs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XclqTaXz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XclqTaXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730942627; x=1762478627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FIJM9ZxVma9G6VDC6bGJBn64ZBI+bFm8LgacfkO38Oo=;
  b=XclqTaXzML9dA/VS8t1xO0nvPWIw93ZoojHItO8pvmMwtm8O9hwXGEOx
   UtgYJNMmYYyetFyeHqhsSgLt5L8McG8o5qaD9v/Q/ObIAf4FOGyODMdSG
   8CdFCy4avophTl/lG3Jo5Xb0ITUM590df9978Q2yKghrCVAOK3bkv8XeQ
   tSE0ScWIWUBVsAOd18EqTc6R11TudT5M/gezEqaSkv4eUoDYIF/c5zNGj
   B7KY3+vuRxqnOcLj3hDRJ46RQOzfUG4fbVjan8g2YyZ1TkwFr8vAd8b+e
   bNiUOyufLfJSxG2e4qF5rWrth/dAdY+spcPxjlS5VVZ5r85rpuzLSEEwk
   A==;
X-CSE-ConnectionGUID: PNa2RPfAQ+GdZyF4hizccQ==
X-CSE-MsgGUID: wYkqyvJMQ6KU7ndCm/dHug==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30926644"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30926644"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:23:46 -0800
X-CSE-ConnectionGUID: 2mMdZ68WQT+23i9Ctebxhg==
X-CSE-MsgGUID: /7W5osUBQzCKjLE7Aya9hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="89704084"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2024 17:23:46 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8rFP-000pcM-1Y;
	Thu, 07 Nov 2024 01:23:43 +0000
Date: Thu, 7 Nov 2024 09:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 22435/30000] kernel/sched/topology.c:1734
 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression :
 sched_cluster_sysctls[1]->procname
Message-ID: <202411070924.MfV068uT-lkp@intel.com>
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
TO: Aubrey Li <aubrey.li@linux.intel.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   99db8adce903def72c36be0dbc5a2f459422b9bc
commit: f4128ae8e6ff03b4c805707fe75d0345797f7f53 [22435/30000] sched: Add cluster scheduler level for x86
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411070924.MfV068uT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411070924.MfV068uT-lkp@intel.com/

smatch warnings:
kernel/sched/topology.c:1734 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : sched_cluster_sysctls[1]->procname
kernel/sched/topology.c:1734 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : sched_cluster_sysctls[1]->proc_handler

vim +1734 kernel/sched/topology.c

8ce3e706b31409 Tim Chen 2021-12-03  1733  
8ce3e706b31409 Tim Chen 2021-12-03 @1734  static struct ctl_table sched_cluster_sysctls[] = {
8ce3e706b31409 Tim Chen 2021-12-03  1735  	{
8ce3e706b31409 Tim Chen 2021-12-03  1736  		.procname       = "sched_cluster",
8ce3e706b31409 Tim Chen 2021-12-03  1737  		.data           = &sysctl_sched_cluster,
8ce3e706b31409 Tim Chen 2021-12-03  1738  		.maxlen         = sizeof(unsigned int),
8ce3e706b31409 Tim Chen 2021-12-03  1739  		.mode           = 0644,
8ce3e706b31409 Tim Chen 2021-12-03  1740  		.proc_handler   = sched_cluster_handler,
8ce3e706b31409 Tim Chen 2021-12-03  1741  		.extra1         = SYSCTL_ZERO,
8ce3e706b31409 Tim Chen 2021-12-03  1742  		.extra2         = SYSCTL_ONE,
8ce3e706b31409 Tim Chen 2021-12-03  1743  	},
8ce3e706b31409 Tim Chen 2021-12-03  1744  	{}
8ce3e706b31409 Tim Chen 2021-12-03  1745  };
8ce3e706b31409 Tim Chen 2021-12-03  1746  

:::::: The code at line 1734 was first introduced by commit
:::::: 8ce3e706b31409147f035c037055caa68e450ce5 scheduler: Add runtime knob sysctl_sched_cluster

:::::: TO: Tim Chen <tim.c.chen@linux.intel.com>
:::::: CC: Jie Liu <liujie375@h-partners.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

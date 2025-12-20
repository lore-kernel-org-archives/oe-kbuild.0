Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE213A1E85
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766244799; cv=none; b=lBpJd6x27WHEbWcOfYjcmwb93vOkE17lnyr9QnxeF0OrOKCdTiXVm9FSVDu8x8wCcxYe0B15KfjQhPuaZd7gxHP3k7q3YtA2I7RpBO+ImmdiQOlGbUVrDwy4KOLVI9Yf0g4i7l7soTdOfifYdnTPlEy2Wwl2VKVJbbgCky6Dns8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766244799; c=relaxed/simple;
	bh=vdvZ0sYrxmztMe9G7I0ooGitaYG17oYSccl+TAshins=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h9PHAUe7DAHckqatrlVQyBnxjnNViEOOS3iwHW85NNYAU1OQ7nWzySdNtx8aQeU6/Vcp75XIVvJ0FptykHJ/igwJaY2oH8sn1JOPLxFvQLdnUQRxYe/SV17dqD5N55PeQq0HGQ98m+D9m6cy6CfXyEAv91HghrbCXiL60pcL6po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdEqJDiJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdEqJDiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766244798; x=1797780798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vdvZ0sYrxmztMe9G7I0ooGitaYG17oYSccl+TAshins=;
  b=DdEqJDiJniRAA3wOi0JlFpPS2EcT6kVU9uG2X1FDyCtjr4ilZtdlp6Se
   0HemOYvLKxbXLarLey4KgxsK+3NYBIMzODtVlFKbHjGvYg02ElU+Q6bz8
   RauVfRpE9nF4Wph0oO6M/3M6cLuhUMUir369e5Gv51j01z3DouGVuC1WG
   Es3m17Jyy3lGUgJXmu8d4hEP0Y9nhMgU6BXgQu4Qh1DrKfhxDB8icdXSN
   g3gclGyRMk8kSCa1EZjvykXaHWMOYJ+PoiSiwd7X0daylgxciMTqygsoM
   zzCwGr6YuPMXVuiIYyVMNtJUZBtI5yWaFS9wG7VMgULJNQEzpADl20BAJ
   w==;
X-CSE-ConnectionGUID: 5GrKv0VdTrGS5NJ8nHXwog==
X-CSE-MsgGUID: 9wPnh4AWRSa2hebzCbxg1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67927101"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67927101"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:33:17 -0800
X-CSE-ConnectionGUID: ZG8NOQnfTJ65SVVMvkBhug==
X-CSE-MsgGUID: +KkrDp0dQ9a6nrvKUKg+Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203569343"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Dec 2025 07:33:16 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyxG-000000004kv-1awP;
	Sat, 20 Dec 2025 15:33:14 +0000
Date: Sat, 20 Dec 2025 23:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:fuse-service-container 33/87] fs/fuse/file_iomap.c:17:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512202354.Q3RJv0kX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/fuse/file_iomap.c:17:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   b93b1c1c321bbf7ffc11f387ca41557005b5db0d
commit: b12a7ff891210a972a6ccd32ec1d16e954d45b81 [33/87] fuse: implement the basic iomap mechanisms
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: alpha-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202354.Q3RJv0kX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202354.Q3RJv0kX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512202354.Q3RJv0kX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/file_iomap.c:17:1: sparse: sparse: bad integer constant expression
   fs/fuse/file_iomap.c:17:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   fs/fuse/file_iomap.c:18:1: sparse: sparse: bad integer constant expression
   fs/fuse/file_iomap.c:18:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"

vim +17 fs/fuse/file_iomap.c

b12a7ff891210a Darrick J. Wong 2025-05-05  10  
b12a7ff891210a Darrick J. Wong 2025-05-05  11  static bool __read_mostly enable_iomap =
b12a7ff891210a Darrick J. Wong 2025-05-05  12  #if IS_ENABLED(CONFIG_FUSE_IOMAP_BY_DEFAULT)
b12a7ff891210a Darrick J. Wong 2025-05-05  13  	true;
b12a7ff891210a Darrick J. Wong 2025-05-05  14  #else
b12a7ff891210a Darrick J. Wong 2025-05-05  15  	false;
b12a7ff891210a Darrick J. Wong 2025-05-05  16  #endif
b12a7ff891210a Darrick J. Wong 2025-05-05 @17  module_param(enable_iomap, bool, 0644);
b12a7ff891210a Darrick J. Wong 2025-05-05  18  MODULE_PARM_DESC(enable_iomap, "Enable file I/O through iomap");
b12a7ff891210a Darrick J. Wong 2025-05-05  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

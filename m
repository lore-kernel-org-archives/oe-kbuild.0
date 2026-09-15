Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811FF42AF8D
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 05:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451613; cv=none; b=PWvt52fewJZ7OTnw+eQwNoL/y8RxynviXn/VSYHKP905Y2YTO5U+AtAsj7VSR08ylWUAdhz2PVCFetbUJb/EIXuRTWZPWQd7MmA7/q7QFEK/wA5W/+iC/38vmEF5cJncm7blcj0zAmIdScpOT0FkRbqMwaMVpTYvdhk8i4heZnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451613; c=relaxed/simple;
	bh=muAs/c/smD+8PrvNM86uWegcze7tv/k0LHoIA5KJztY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DUX0ETHivZreXeyO18jA0gGpnas01x5TER0SnMzyq2OKE4ryR7NU++tycfsxY1ftmIldLIqeSThg63b979Yu25B70ecmqK/7wyyI6CKRc3zME07X0Z6vFJ58d48iQvUe/UTzt+C5wVmWKA3eYM8nVJmoUJvT3AptMlMbD1y5M78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYEnYmlY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYEnYmlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789451612; x=1820987612;
  h=date:from:to:cc:subject:message-id;
  bh=muAs/c/smD+8PrvNM86uWegcze7tv/k0LHoIA5KJztY=;
  b=NYEnYmlYUoa0s1oyz6w8M8q8vhyqyuNIdpA1LQZillP7oOsrxoe4fd5F
   MzJyAByNSTXR4qifBzRNjKqvRkO4N6PKvEXls1G0p3/Gu4RdeQThSitoS
   woPXYwIMdHi1oF3KQQ4q7YoeexJHsbzA5kaXbnX8hxO/gBsKqkydPGobx
   hyAZ4AMi0KIXJdIHZT02CVv1VI25IRrnzAvcdpjAwU0VScBMrPPVNrV3f
   jfrwsFznEFnQOHnVZKmksGkPfAuXGVGK57X2MWvZnWZsQc4HlNaWRIjxc
   s4ofIxQJltz/iXVONsFIXqGIsmYwq4DJsj+gqDpc35aS5R2oXoLypEN2U
   A==;
X-CSE-ConnectionGUID: XoRngktTR0KMZYfYyPCq6w==
X-CSE-MsgGUID: K6Ai8N9QQCSJuMMemDNH4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92315580"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92315580"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:53:32 -0700
X-CSE-ConnectionGUID: 48EyEvUkTo6GSMXY06AAlw==
X-CSE-MsgGUID: ISxt4Hl3T/mMD4W9rYm8Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278131969"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2026 22:53:30 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6M6h-000000000WF-35g1;
	Tue, 15 Sep 2026 05:53:27 +0000
Date: Tue, 15 Sep 2026 07:53:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 64/67] cram_perf_tool.c:293:22: warning: variable 'd1' set but not used
Message-ID: <202609150718.IHlHHIE5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: d4e896495e7d06e84215944451022685a471db99 [64/67] selftests/dax: add the CRAM anon tier tests
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260915/202609150718.IHlHHIE5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150718.IHlHHIE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609150718.IHlHHIE5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cram_perf_tool.c: In function 'arm_batch':
>> cram_perf_tool.c:293:22: warning: variable 'd1' set but not used [-Wunused-but-set-variable]
     293 |         long d0 = 0, d1 = 0;
         |                      ^~
>> cram_perf_tool.c:293:14: warning: variable 'd0' set but not used [-Wunused-but-set-variable]
     293 |         long d0 = 0, d1 = 0;
         |              ^~
--
>> cram_gate_tool.c:36:13: warning: 'read_long' defined but not used [-Wunused-function]
      36 | static long read_long(const char *path)
         |             ^~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

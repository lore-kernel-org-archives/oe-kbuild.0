Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E801F582C
	for <oe-kbuild@lists.linux.dev>; Wed, 14 May 2025 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223602; cv=none; b=tFEjjCNUEFQY7Hg8dmr2nsjSMpmmIf+qhSe2q3u6bmNGltYFIhKDtTaMz9w83A7nMrpO5yT6OXHYWhmmvwcGxXJrzpvSQkouuCiSH7vHSrF+oKKxjYXbrNx4Jn4TEwdgSVYitaiAzCSHuDAeh7Ocfh+M+0WMc/G6149PomPo+Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223602; c=relaxed/simple;
	bh=wtINFRTK2z5vFrdlqCPOecsoJJb0YAGICrFpePdFdVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+94tiwUO6kN0ZH4R9NGP8cKwTJa34MUElvQVsOGMQJ/6sZTbmmYDOj56B8sxfHZHcNSEOvWUqhp+X21e2clVsOHPtBbV4rpcntWgiaLrv9ZsFtRUQwmpg9nklq4DZIclYlI5ZsIzG31dWTnW2mTQHIKj7HLoVPh0wHbTFcTswY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoCegGGP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoCegGGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747223601; x=1778759601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wtINFRTK2z5vFrdlqCPOecsoJJb0YAGICrFpePdFdVM=;
  b=NoCegGGPqKmDoY7kh0PvIn3hpafeLnJSZ50MmoY2tCaeytHZ08ybEyXA
   ubW8ZbNkvWJxhPGqV/2Z11V55J7c//n7ITHPAAg9dtk87XjOCLyhwbbW7
   7l+8UdOXHPdzILOhFS1FXVmsQsdnoR2ebUndWu7GlRAm97yMS/m+vSQ3l
   b+KNviQ/EwaNjWa2OV+zVpl7/6K18kIIzQqSuvYS5k+fLr4QgAbOw2IsR
   pxSj38IYUKZnWVrxmLttNnn79j1KiVQ7MYSAkSaetjG6HD27YEMtgwVCb
   PA38eHyxDUdIiVvrNk3jCvyb5Ewyq6MsS0TsoGdL2TAzivObZlFbjMG7F
   w==;
X-CSE-ConnectionGUID: Et1zhWVJTHmi4HkIrmJlEQ==
X-CSE-MsgGUID: Fs0++CB/T9yWC3W50iZK+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71617774"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="71617774"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 04:53:20 -0700
X-CSE-ConnectionGUID: nlT2fEcVRNC0bppdggw4Xw==
X-CSE-MsgGUID: LZG8llNoQPa5f4pjomTDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138069068"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2025 04:53:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFAfj-000H4V-2n;
	Wed, 14 May 2025 11:53:15 +0000
Date: Wed, 14 May 2025 19:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7305/11093] mm/numa_memblks.c:122
 numa_set_distance() error: we previously assumed 'numa_distance' could be
 null (see line 105)
Message-ID: <202505141953.sGlt3DyX-lkp@intel.com>
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
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Yuquan Wang <wangyuquan1236@phytium.com.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
commit: cb49fa125c0115824233ee3ef167af6c5c8b23db [7305/11093] LoongArch: Introduce the numa_memblks conversion
:::::: branch date: 25 hours ago
:::::: commit date: 11 days ago
config: loongarch-randconfig-r071-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141953.sGlt3DyX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505141953.sGlt3DyX-lkp@intel.com/

smatch warnings:
mm/numa_memblks.c:122 numa_set_distance() error: we previously assumed 'numa_distance' could be null (see line 105)

vim +/numa_distance +122 mm/numa_memblks.c

75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   83) 
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   84) /**
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   85)  * numa_set_distance - Set NUMA distance from one NUMA to another
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   86)  * @from: the 'from' node to set distance
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   87)  * @to: the 'to'  node to set distance
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   88)  * @distance: NUMA distance
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   89)  *
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   90)  * Set the distance from node @from to @to to @distance.  If distance table
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   91)  * doesn't exist, one which is large enough to accommodate all the currently
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   92)  * known nodes will be created.
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   93)  *
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   94)  * If such table cannot be allocated, a warning is printed and further
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   95)  * calls are ignored until the distance table is reset with
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   96)  * numa_reset_distance().
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   97)  *
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   98)  * If @from or @to is higher than the highest known node or lower than zero
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   99)  * at the time of table creation or @distance doesn't make sense, the call
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  100)  * is ignored.
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  101)  * This is to allow simplification of specific NUMA config implementations.
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  102)  */
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  103) void __init numa_set_distance(int from, int to, int distance)
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  104) {
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07 @105) 	if (!numa_distance && numa_alloc_distance() < 0)
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  106) 		return;
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  107) 
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  108) 	if (from >= numa_distance_cnt || to >= numa_distance_cnt ||
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  109) 			from < 0 || to < 0) {
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  110) 		pr_warn_once("Warning: node ids are out of bound, from=%d to=%d distance=%d\n",
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  111) 			     from, to, distance);
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  112) 		return;
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  113) 	}
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  114) 
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  115) 	if ((u8)distance != distance ||
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  116) 	    (from == to && distance != LOCAL_DISTANCE)) {
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  117) 		pr_warn_once("Warning: invalid distance parameter, from=%d to=%d distance=%d\n",
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  118) 			     from, to, distance);
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  119) 		return;
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  120) 	}
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  121) 
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07 @122) 	numa_distance[from * numa_distance_cnt + to] = distance;
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  123) }
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  124) 

:::::: The code at line 122 was first introduced by commit
:::::: 75f9d4cc4eb5e15dd5ce843e33de7f6346a0d4fa mm: move numa_distance and related code from x86 to numa_memblks

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792712304;
	b=QBpLUeEevIM6Ds+Vinav+moyQ2y8NGcDaJrEFafUj/Wl21NI3rv3PMLO5879HUjKKtet
	 Pa/EIYSMbH5l0ptwcxicVq/g0ASNwfRCPtLEofMFk8cy7Ro//TXyvQ5uhaBI6tZGiAyPd
	 D4UNdp4PeWRN3IZewDjBfQtjzxFYs5FpjLcBpC1LLtGkxtXTSP7hUuffNd4TOXaUGUbXG
	 KDhP7ovEZxJbvPjKQBXffYC0RiZsBW8o9TS9SO3dgom9Umz1Zrz85otx+/TIXkt4nSxOk
	 xBDvoSUyg227PGhURQVk8M86W7bA/Tp3ak/iPyB2zE5QPRiOUIq6WrtZLcPDtF1acLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712304;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fAbG9a14ruvEI32uRtCSxWtEuja4sLWprFvjK/uty4g=;
	b=K8k363xDnRJVAyme5O3IYuIpgQcLpwbDp8FGcF4EAPW2vuXjNktCUcTaLsTw9fBuEtlG
	 VTrwOvnqQ0U/RgMXIGNBuiRolUUIBk8g8Mqg0y4EcNC5Q8cON/BMhQa94sJJfLJEQoNYo
	 hssYjXi7ZKPyI+2LZpao8kBoRP1nvkcll3HUMsfpXokWocs08iLI5AGIMvVFRadNDAM0B
	 +lyXKckivLZrspH6JpmTwT+V3nxI8Suw+iZWNbVDu8H5SXauMURLIQby4/pq8PUdwvAM4
	 4G4bhTSEwLZvrvzwmZi/XTT1tRPJqEzHOOuyXcRlynm0oxo/KRPrWdlhHOXagB1rinA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="hk4/981E";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD889606A31D
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Oct 2026 23:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD889606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hk4/981E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792712302; x=1824248302;
  h=date:from:to:cc:subject:message-id;
  bh=UhSudA5jRyjCG0VyerZZxZAdtpEpXBoO+cp8gAZ/0QY=;
  b=hk4/981EYp1NEB/KFOJkko8qahfIp3grOH1d/RTZCfeIoKwEbE687emB
   2yM2dR8QvB/nuufxWCVebMDMuIIN0STU9BoXa7fY+dnnqiod1ITMVIlcJ
   K3V9sJRHhsph4EqQ5YQm3aN8kdKHGS8F314q0hFS+VjdQ7VNxYgK4jQIh
   2HW7yS8h0kohW6E6aHbK5tp8LiGVq4g+omeD0NQcIBJpzrdfQ+dmhA8Yf
   6RCMfzMZxvudpLv8d+NUVn4l07EH7rPAvk3hj2caGnp0qSjO8kE7Ez60y
   YuZ0nKhGqF1BBckwP4ZzM+sqNO39j+FaJ0EMsNy+EUR/OiYSUxrz/UX6e
   w==;
X-CSE-ConnectionGUID: 1n70SpIfSx+c4qQo5EkVCQ==
X-CSE-MsgGUID: 3zQsU3wuSMu9bzcv1ErPWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1480719"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1480719"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 16:38:22 -0700
X-CSE-ConnectionGUID: 5tmH1hz/TwOQ/FrXRuvmRw==
X-CSE-MsgGUID: sAlQ7hFTT4GjyQ7RmKWAtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3880733"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2026 16:38:22 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xK2MV-000000000SR-1PFo;
	Thu, 22 Oct 2026 23:38:19 +0000
Date: Fri, 23 Oct 2026 01:37:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-numa 43/60]
 mm/page_alloc.c:4822 alloc_policy_private() warn: bitwise AND condition is
 false here
Message-ID: <202610230147.crhIrAuz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: "Gregory Price (Meta)" <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-numa
head:   be88f829e80a326906b4001c6c11a8aa63d31c08
commit: c045e1303ba8061703797dfc3ef81e05a2625537 [43/60] mm/page_alloc: return to common zonelists when relaxing a mask
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm-randconfig-r2201-20261022 (https://download.01.org/0day-ci/archive/20261023/202610230147.crhIrAuz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610230147.crhIrAuz-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:4822 alloc_policy_private() warn: bitwise AND condition is false here

vim +4822 mm/page_alloc.c

c045e1303ba806 Gregory Price (Meta  2026-10-13  4818) 
c045e1303ba806 Gregory Price (Meta  2026-10-13  4819) /* A private binding, or an ordinary mask naming a node that became private. */
c045e1303ba806 Gregory Price (Meta  2026-10-13  4820) static bool alloc_policy_private(const struct alloc_context *ac)
c045e1303ba806 Gregory Price (Meta  2026-10-13  4821) {
c045e1303ba806 Gregory Price (Meta  2026-10-13 @4822) 	if (ac->alloc_flags & ALLOC_ZONELIST_PRIVATE)
c045e1303ba806 Gregory Price (Meta  2026-10-13  4823) 		return true;
c045e1303ba806 Gregory Price (Meta  2026-10-13  4824) 	return ac->nodemask &&
c045e1303ba806 Gregory Price (Meta  2026-10-13  4825) 	       nodes_intersects(*ac->nodemask, node_states[N_MEMORY_PRIVATE]);
c045e1303ba806 Gregory Price (Meta  2026-10-13  4826) }
c045e1303ba806 Gregory Price (Meta  2026-10-13  4827) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

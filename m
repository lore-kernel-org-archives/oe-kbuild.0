Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222629;
	b=b+QPJtGJztL2kmkEkMjk7GLjADyZyeDUdDHnLxY3L+PVv9GAmybxLqemVRrl6vRNHSFo
	 UeU61Mf/ENKaIoqmgJCL3+YGggWPDLQPSoo5PiHzExt+HzT2MpNCx/zYUpIIKYFX9LJro
	 Sd7BTGUw6/qXfm3pLRU7ftiPD7hk4yxj8pWojtOiC2H6GZRLeuNBQvWftahNIPZIXM1gi
	 F9pQTPLRUV7dYNKE078FPsCz3oiI+3cYgbkjDtcAmVRFmHs2Sx9zMw7QqxrecC6L5bE2m
	 1BUSDpBRAbK/+l8yt6Tw2L5gw5iGYn2q5Avmt4F+r+BuiZhkrkG4u1+s66Er82ZlhcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222629;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mTk/+xzl6xD58/SoUk/ZBCJz8IbMA3qrJdoG7UE2PCU=;
	b=4C0bATkM5Hw1WbJyzEvWfgq2pZoCgSbkW/ELkFdrNR4YJnxwHSjuFw2JwIxuZDvENNxR
	 7g4zOJNDjkPnWXBP0ZxiBdw45a7LE7+lNR0na0dZDJk4TF9WDrgbhkQvGfnxZUdbn4Dg/
	 5/zSjZzorP/TlMGLEdWZOefwGpowCZ0MMptVfidwHmPDSfhOccN0/5pnd2WwOZRkIaWv/
	 P/pCZKSxDk978d6DwSF6IwXGADNZ11/K+Q7Q7GwtCRQ3diHkmRV6BSK0ggXhE4nFWAvzo
	 vycSY2mgLodzAzvis4Xn/jG/rJOzGFBjRSi/lMhX5jNK1nJpCyWgiTtIw0D6ijDJWgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d58Co+Gu;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91D5606A6A1
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 00:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C91D5606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d58Co+Gu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795222628; x=1826758628;
  h=date:from:to:cc:subject:message-id;
  bh=sfTep2XBngK6LxRqSJXoXE0ciHe4MSIYUbYMM74o5vw=;
  b=d58Co+GuojMZ+mjQUmFG5L+6CxRliZVD7XgNbx9S6h/q4ul4bMeyHXOo
   IgP/FPZqr0lFd/R7gQSDFyRPAimKGYAocdMw2dCz0XXOy/ShDpO74J2oB
   a4k7/SHvdX3fZqlqGld7c0LBtU4knu+ytC6ZZ32JdAiq6vwZNEzOyeqOX
   6UApMov824cY+GDMu90PYzi42w7aT3v/sLVkiyF/rFKUmH5O0yCHh12Al
   o/4DTirZv76doS8Co5Yut16k3SnGrNVrvrZn58FHN46JfPy/H2SGVqDEi
   uTGJnoptGK6kqCwd+fSQQRbtFLK8l6jhla74ddXizfW9IbqzVWdYisrbV
   A==;
X-CSE-ConnectionGUID: Wn4IWw4iTvSqucDZP/3ZHA==
X-CSE-MsgGUID: avAFPN9RTKOkzjYBDqmGRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3992112"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="3992112"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 16:57:08 -0800
X-CSE-ConnectionGUID: MsC7FGsbQn2lwqfaEZZrlQ==
X-CSE-MsgGUID: RlxdcJsUTLqt78N0z2MeAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10905395"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 Nov 2026 16:57:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUZPc-000000004CL-0iMU;
	Sat, 21 Nov 2026 00:57:04 +0000
Date: Sat, 21 Nov 2026 01:56:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gourryinverse:scratch/gourry/managed_nodes/private_nodes_v6
 44/61] mm/page_alloc.c:4061 alloc_is_private() warn: bitwise AND condition is
 false here
Message-ID: <20261121015149.XC961xIr-lkp@intel.com>
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

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/private_nodes_v6
head:   c95a844983fa43dd015dcce0728398acdd355380
commit: a5b7ed29d12f0f055d63f98bf04914c76c8abf0f [44/61] mm/page_alloc: fall back when a bind policy's nodes become private
:::::: branch date: 7 hours ago
:::::: commit date: 10 hours ago
config: openrisc-randconfig-2200-20261120 (https://download.01.org/0day-ci/archive/20261121/20261121015149.XC961xIr-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261121015149.XC961xIr-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:4061 alloc_is_private() warn: bitwise AND condition is false here
mm/page_alloc.c:4079 alloc_private_reachable() warn: bitwise AND condition is false here
mm/page_alloc.c:4818 relax_private_alloc() warn: bitwise AND condition is false here

vim +4061 mm/page_alloc.c

6c18ba7a18997da Michal Hocko         2017-02-22  4057  
a5b7ed29d12f0f0 Gregory Price (Meta  2026-10-13  4058) /* A private request, or a nodemask that names a private node. */
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4059) static bool alloc_is_private(const struct alloc_context *ac)
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4060) {
a5b7ed29d12f0f0 Gregory Price (Meta  2026-10-13 @4061) 	if (ac->alloc_flags & ALLOC_ZONELIST_PRIVATE)
a5b7ed29d12f0f0 Gregory Price (Meta  2026-10-13  4062) 		return true;
a5b7ed29d12f0f0 Gregory Price (Meta  2026-10-13  4063) 	return ac->nodemask &&
a5b7ed29d12f0f0 Gregory Price (Meta  2026-10-13  4064) 	       nodes_intersects(*ac->nodemask, node_states[N_MEMORY_PRIVATE]);
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4065) }
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4066) 
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4067) /*
a5b7ed29d12f0f0 Gregory Price (Meta  2026-10-13  4068)  * Whether a request that names private memory can still allocate: some node in
a5b7ed29d12f0f0 Gregory Price (Meta  2026-10-13  4069)  * its zonelist is in its nodemask and allowed by the cpuset. Any zone type
a5b7ed29d12f0f0 Gregory Price (Meta  2026-10-13  4070)  * counts, so neither a GFP zone restriction nor an exhausted node makes the
a5b7ed29d12f0f0 Gregory Price (Meta  2026-10-13  4071)  * request unsatisfiable.
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4072)  */
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4073) static bool alloc_private_reachable(gfp_t gfp, const struct alloc_context *ac)
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4074) {
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4075) 	struct zoneref *z;
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4076) 	struct zone *zone;
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4077) 
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4078) 	/* A strict local private request keeps its allocation domain. */
a5b7ed29d12f0f0 Gregory Price (Meta  2026-10-13 @4079) 	if ((gfp & __GFP_THISNODE) && (ac->alloc_flags & ALLOC_ZONELIST_PRIVATE))
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4080) 		return true;
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4081) 
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4082) 	for_each_zone_zonelist_nodemask(zone, z, ac->zonelist, MAX_NR_ZONES - 1,
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4083) 					ac->nodemask) {
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4084) 		if (!cpusets_enabled() ||
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4085) 		    node_isset(zone_to_nid(zone), cpuset_current_mems_allowed))
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4086) 			return true;
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4087) 	}
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4088) 	return false;
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4089) }
83d817f673c2dfb Gregory Price (Meta  2026-10-13  4090) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

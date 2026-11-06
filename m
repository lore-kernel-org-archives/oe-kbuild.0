Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950868;
	b=vL4b6XUM5FYX+u4jHwsKp4Ub8jR671JqJr7X6sn/RPwogkunSMlge7OIBlbrBzYEze61
	 0K0KXWkX49McFw076dj0Lvdw3f1Am5oqYc7DmduASONpkQA+ZfUmJo017otFeR1F8yn7S
	 sWVAYYrHgwNd+E+xJVrMaMEs3vJJWUYiEByXFeQeqAqKK8CBzTZXCobrzQ0q4FZUqtzCY
	 nSCwPRospBWvI2LjQ3MpxuGuv9XyzrQs2NJfuccSXA793Z98pLONH6jch3jy3Tgo7V3vx
	 0GJRY5yLVoKpqaDmS+v3HAtdiOI9GA1/K8szuPcAfh6GCOWJLSh0ShCBs/QC5+IDROA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950868;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YwsOtcZ36EMKNeouGSJbYxkHHyUZy/iLPHgk1z2XIPk=;
	b=WhQG6NTc1m9ITYUzUMjzeXphSYb75RQI8ABoAyLEL3EFkHeDoz3H0JQx79iwweLJhBq0
	 En3jvKpNxdwHs3xZDrmF8Z6dm7yGdbtzQoKdTOZ33C7uoEOENntwtgNUJ8u0ajnIk1ryw
	 H7jd3ngV6u5bv3mbEspAsILuJeXH2nIjdkSykOM8UynVY3mWYTY0WMoSgAmequcf0J5uo
	 P/ZMgbmzSde7+Q89k95BQY0fXSAlMtT1obOY6rllXTaVO9RDTx4j2PlzsEEttSvq9SEQT
	 ZdbDtoIPqZYQXseE7G/i5pY2Rs3ORySCEXhrqIT+qQuo5riQTTFDpVUtMhR94LLpevA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fD+AqIlQ;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAE3606A326
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 07:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAE3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fD+AqIlQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793950867; x=1825486867;
  h=date:from:to:cc:subject:message-id;
  bh=EHyIkMuVadfcrPjNXlX+kAC2Qf9tI1TQSPu3Ig+TejI=;
  b=fD+AqIlQILzimhAU6tKf28cjFV8kRS8WjF0K0Kt4Jwgtj4JuidRYrkYT
   DO0G38nztQ2xy/5tv6xGCqsEfALffNhOmlkESPzt3ZNuJno0N5ppOrqBF
   cgs7r+yO9uX0rQBUME1SO6nNYVfWYiRBRT6ni0DgoOuIHa9etdsyeGWs7
   Bsjva0hv/oxWbVdn6iG2ia7rhhxMxPeFFK2cgVf2eWhQBSri0+AW2pAH6
   +myo29RgBXsAAngk1w+BoTxSyvp9GExVQCTmABpYgN+9RHHvyC+/lR5ET
   tbfh30ljNQ9OcNvk3f3TeRzTRhpPk2MjuCXq7yXfLrAnqSHn/hKlns8NU
   A==;
X-CSE-ConnectionGUID: xf09GGVjQziikXB/Nzvhtg==
X-CSE-MsgGUID: xAYMQ9COROSCKAFVLe4Eyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2848369"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2848369"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:41:07 -0800
X-CSE-ConnectionGUID: r3ueziTBSbyWFDE0ntbbbA==
X-CSE-MsgGUID: 8Tz4cKlhTPKbNBz9s4NI6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7091718"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2026 23:41:06 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPEZL-00000000A8R-1X8P;
	Fri, 06 Nov 2026 07:41:03 +0000
Date: Fri, 06 Nov 2026 08:40:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18 1/1] mm/memory.c:96:2:
 sparse: sparse: Unfortunate NUMA and NUMA Balancing config, growing
 page-frame for last_cpupid.
Message-ID: <202611060800.G6eVPKsw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mm/memory.c:96:2: sparse: sparse: Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid."
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b835509d43ba8175031f800f12347f8e8206a471
commit: 9d29ba85d8a2c505b2d049568c3b1d29c4e0c2fd [1/1] ANDROID: mm: mglru: let MADV_WILLNEED pages take extra trip in active list
:::::: branch date: 12 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-r2300-20261106 (https://download.01.org/0day-ci/archive/20261106/202611060800.G6eVPKsw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060800.G6eVPKsw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611060800.G6eVPKsw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memory.c:96:2: sparse: sparse: Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
   mm/memory.c:167:15: sparse: sparse: symbol 'zero_pfn' was not declared. Should it be static?
   mm/memory.c:300:9: sparse: sparse: incompatible types in conditional expression (different base types):
   mm/memory.c:300:9: sparse:    void
   mm/memory.c:300:9: sparse:    int

vim +96 mm/memory.c

42b7772812d15b8 Jan Beulich    2008-07-23  94  
af27d9403f5b806 Arnd Bergmann  2018-02-16  95  #if defined(LAST_CPUPID_NOT_IN_PAGE_FLAGS) && !defined(CONFIG_COMPILE_TEST)
90572890d202527 Peter Zijlstra 2013-10-07 @96  #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
75980e97daccfc6 Peter Zijlstra 2013-02-22  97  #endif
75980e97daccfc6 Peter Zijlstra 2013-02-22  98  

:::::: The code at line 96 was first introduced by commit
:::::: 90572890d202527c366aa9489b32404e88a7c020 mm: numa: Change page last {nid,pid} into {cpu,pid}

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

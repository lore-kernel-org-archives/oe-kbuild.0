Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181EA3ADBA5
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050190; cv=none; b=sm4Uo6XZz43Z/92UVvgLCAnvjZYXyeAhTKPhIIgUK4HUOGpk3cDgWtk8I4PfGej6XL2utbZS+ZBX0msJtBMtiZyYRquhjLEjxahrT3Gq6NUtq4pRCl76IfrRdnkne8Narci8zcX1WllznCzmhSwr0IwPUdYeuMlDurwFK74ZEOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050190; c=relaxed/simple;
	bh=u4KIgMAe9q7yKdMP8vXofKaDfVRTTQPfRSWvvCH80VY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BJvnLZjkUJP4bWdv273EXqYmqkZOyBeE3fOsyC+uc3/WOYGx/4x/cHFLFsvDrYKJl5K8ohpBMYxDIFo0L+gekgjbbgTQ3BmPtKmh7L+VUunU2X847eVPQQM0dCbUvtw6vAKGj7euk64MKsfoZWpdz2LjlPnGtX8AzXGd7yJdQxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIE+/J2U; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIE+/J2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780050188; x=1811586188;
  h=date:from:to:cc:subject:message-id;
  bh=u4KIgMAe9q7yKdMP8vXofKaDfVRTTQPfRSWvvCH80VY=;
  b=LIE+/J2UkeQDZHZrcepVQR6BEJ3ir4N9gmlbezCS6248m+pd7v7AzS9V
   hJtY1M2++Y0OqY7PER/GE4ivX/SbDpBu6O3PguxEp8u9OVnWDEj1RHLdc
   WbIqT5IEzp2jLYaSr3VHwN8fSthSSst8hZtRkO5S9kC0MotRCIOxWRgCu
   elfYFqHL3TOYNyxYYg2HpQ7lza2jYgbInFq94ZDB+NOXNTD/MKEsdqPjD
   e3/T89NXVSNGW73XamX+YOK8wgs8UHIsFkasxxQjniruGvJgeGeSspeKu
   GoUbeG8a8PqhTtPOm9HTO8h8K8CLmtP3SsD7a5vfjx5WQh5d36ZChISqm
   w==;
X-CSE-ConnectionGUID: AGUKqR4hS9uc+mplyCssag==
X-CSE-MsgGUID: o1YJgE9fTUqBww1leXcliQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80753897"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="80753897"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 03:23:07 -0700
X-CSE-ConnectionGUID: vtWjcqDBQAu1I6zfyF0r9w==
X-CSE-MsgGUID: BYtluVyjSjGGKQ2PeswW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247757472"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2026 03:23:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSuMp-0000000075u-2CtR;
	Fri, 29 May 2026 10:23:03 +0000
Date: Fri, 29 May 2026 18:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [glemco:staging_rv_hybrid_automata_enq_lark 10/10]
 include/rv/automata.h:64:22: sparse: sparse: unsigned value that used to be
 signed checked against zero?
Message-ID: <202605291825.yXTGoZwp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/rv/automata.h:64:22: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gabriele Monaco <gmonaco@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata_enq_lark
head:   386880a9f1cbcb69a2013a0a5a92ab3afa62940a
commit: 386880a9f1cbcb69a2013a0a5a92ab3afa62940a [10/10] rv: Add dl_server specific monitors
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-061-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291825.yXTGoZwp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291825.yXTGoZwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605291825.yXTGoZwp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/rv/monitors/boost/boost.c: note: in included file (through include/rv/ha_monitor.h):
>> include/rv/automata.h:64:22: sparse: sparse: unsigned value that used to be signed checked against zero?
   kernel/trace/rv/monitors/boost/boost.c:155:50: sparse: signed value source

vim +64 include/rv/automata.h

30984ccf31b7f0 Gabriele Monaco 2025-11-26  51  
30984ccf31b7f0 Gabriele Monaco 2025-11-26  52  /*
30984ccf31b7f0 Gabriele Monaco 2025-11-26  53   * model_get_next_state - process an automaton event occurrence
30984ccf31b7f0 Gabriele Monaco 2025-11-26  54   *
30984ccf31b7f0 Gabriele Monaco 2025-11-26  55   * Given the current state (curr_state) and the event (event), returns
30984ccf31b7f0 Gabriele Monaco 2025-11-26  56   * the next state, or INVALID_STATE in case of error.
30984ccf31b7f0 Gabriele Monaco 2025-11-26  57   */
fa9b26dfa172d1 Gabriele Monaco 2025-11-26  58  static inline enum states model_get_next_state(enum states curr_state,
30984ccf31b7f0 Gabriele Monaco 2025-11-26  59  					enum events event)
30984ccf31b7f0 Gabriele Monaco 2025-11-26  60  {
30984ccf31b7f0 Gabriele Monaco 2025-11-26  61  	if ((curr_state < 0) || (curr_state >= STATE_MAX))
30984ccf31b7f0 Gabriele Monaco 2025-11-26  62  		return INVALID_STATE;
30984ccf31b7f0 Gabriele Monaco 2025-11-26  63  
30984ccf31b7f0 Gabriele Monaco 2025-11-26 @64  	if ((event < 0) || (event >= EVENT_MAX))
30984ccf31b7f0 Gabriele Monaco 2025-11-26  65  		return INVALID_STATE;
30984ccf31b7f0 Gabriele Monaco 2025-11-26  66  
30984ccf31b7f0 Gabriele Monaco 2025-11-26  67  	return RV_AUTOMATON_NAME.function[curr_state][event];
30984ccf31b7f0 Gabriele Monaco 2025-11-26  68  }
30984ccf31b7f0 Gabriele Monaco 2025-11-26  69  

:::::: The code at line 64 was first introduced by commit
:::::: 30984ccf31b7f0678fad05a22e06bb9f6014c1ce rv: Refactor da_monitor to minimise macros

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

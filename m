Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C7918E025
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 03:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430636; cv=none; b=OlCiGzn+0l2q/wD7EIxjHnz28ajcRsePuCWm1Jl+nhoqOQd+9xapTHyFKJTT7GGl/jGgSaCJh6BLujYxmA2tGWoj0LNTIYctW6W9VIoX9KNFUdgti6sLLwRCduoXERrtMuHn3TCPuNSayagbNSGNsJCMUJoZMoVHnm2/T2Fk7yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430636; c=relaxed/simple;
	bh=yUCPoauZ5ZlFcqO7DKG9zkC5RE8uxgUo7MRSy0jGzrs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AZnZi6NO6zHO5gwaoFGp/oZUPah4yxyZqE4kDYcg0VfNyk1PA5oUEkoRoppevgN8R7vpOmicjcV5GJNJesntz6pNwpncHN3DzfAFkfB3u6gDm2IjEwUEL0yU1ZkujOeDSi+eRzCuwcgaSbj69nUkCQF9MG4KNU8GDurl/aGR0Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XrMOIxW3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrMOIxW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791430634; x=1822966634;
  h=date:from:to:cc:subject:message-id;
  bh=yUCPoauZ5ZlFcqO7DKG9zkC5RE8uxgUo7MRSy0jGzrs=;
  b=XrMOIxW3Jj4Z71cD6XIxv7gMd5E8IQ/s53A/hFlJdeO7omuk5aS4YT7P
   Xjk/RgtNEn97EyhGS90fwsMGtkuyz0CMRGNg0I2b7/Nu1oXt/LIwOReR4
   JCoIHqq6tG958wwJ2fG1AeEmFZz0W0DgIV08jtODTHvQZ7314ldGOnr+q
   h8hWhWA5mUBUMEtIcMKJvLnHHyc00NuZgG71Q3qbXmSktoZYeOE/1g4db
   HP3H7ur1LMdDwliPIhyyG9J3DfNdj8B7nH62DDDhGk8QcoN+6Os883s7I
   yRt8DneG/wtmm790uiIYAgPMnehT1Vf32yKtW2exGpYAdEemS39IbkOUa
   Q==;
X-CSE-ConnectionGUID: 2tqSQGyZTduMGRLz6E/89A==
X-CSE-MsgGUID: jIBejRsHRnyN+J3Rl+ozsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="201093"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="201093"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 20:37:13 -0700
X-CSE-ConnectionGUID: WxfFoMoAQhe3CqqoVO0jAA==
X-CSE-MsgGUID: /qnXhxJ0Sji/43nsBaOSvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="277135269"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 07 Oct 2026 20:37:13 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEewQ-000000004hT-2o1e;
	Thu, 08 Oct 2026 03:37:10 +0000
Date: Thu, 08 Oct 2026 05:36:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:locking/core 1/1] lib/refcount.o: warning: objtool:
 refcount_warn_saturate+0xa8: unreachable instruction
Message-ID: <202610080505.egjB8eUi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Jann Horn <jannh@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   5b5224220747029bbaee8ab851cc6c599c48eded
commit: 5b5224220747029bbaee8ab851cc6c599c48eded [1/1] refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: loongarch-randconfig-r2105-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080505.egjB8eUi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080505.egjB8eUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610080505.egjB8eUi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/refcount.o: warning: objtool: refcount_warn_saturate+0xa8: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

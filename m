Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17923C2769
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 04:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781584661; cv=none; b=nokKSMglwL7judNPDC8fNQxTQaEzErQi9DRAH/fJ3aWbeb/Wk4CYYnW9knIEDpFT1vz7RBjryjxXBJOnwMC/EfQOeuh5Q0ok++s1JDSqan4TPI7qAR688GFPW9br/pPebK976vkC1LuTGSywoRg0Rc/aOuZ2HIh4kIyArLkuhOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781584661; c=relaxed/simple;
	bh=2y+EWGqJUQ0758LJs9CWWJllD/Pdm+xzSCGej/8uSOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gfsWlGtU8bao5jV43wdyK1Rgb/kVJxH3udaJ1c7Yu/FwwMX3iLAuQbaGtSSRP7JHOip1H1YFSZrItr7ktKLtfntw0KfkcE8og2XPH4pppnjA5h2M2Kw1T6G2YSFpt+MEkX10XSrTzMWf1xbLhqbaLOK2FmcSxJYd2Jho/toNihM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFlGesnn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFlGesnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781584659; x=1813120659;
  h=date:from:to:cc:subject:message-id;
  bh=2y+EWGqJUQ0758LJs9CWWJllD/Pdm+xzSCGej/8uSOQ=;
  b=ZFlGesnnWQfig+XkVZ89teWgMQateo4wj1iXd7/tz9jdhpfG7KKhnHO9
   X3arb9mRuBgPk3A971HxBDaoh4L6+nlOhPzCr6MZpAmcRovRgkXx7pzed
   7Nx3g2ua4tMI8dliGqZXogYrGc0qjJrVNvdO0fQgBq+Z9oW7mR+m+9LGQ
   7Nz4F2Pjwd/8xULb6c4sFjzwlA6NFLNytjGz/M1qeeUkKCRdzbr7xCRCd
   MtqmZ+1cjG6zzXwZfQqCJOQkhOIZTfSsPzVq2xdaOzF6OsFN+W3XdJ/QT
   zSRbM5oWnPnq8Wku2+z/fgbDqmBnH1PjCOtio3qrdyMA9IrIUY3tytLpS
   g==;
X-CSE-ConnectionGUID: l8O7stokT8CunYSRNClC1w==
X-CSE-MsgGUID: JjkkqXIHTueeBZ3lQVGN3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="84903729"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="84903729"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 21:37:38 -0700
X-CSE-ConnectionGUID: NxxBus/VT1a69UInJXNxvA==
X-CSE-MsgGUID: auBuCUR+SMWwfCsvDaTogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="246765649"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jun 2026 21:37:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZLYN-00000000Sig-0mDM;
	Tue, 16 Jun 2026 04:37:35 +0000
Date: Tue, 16 Jun 2026 12:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt.o: warning: objtool:
 bnxt_rx_pkt+0xc28: unreachable instruction
Message-ID: <202606161218.UxQOQFVC-lkp@intel.com>
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
TO: Alice Mikityanska <alice@isovalent.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Eric Dumazet <edumazet@google.com>
CC: Michael Chan <michael.chan@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: 3f1bff1d7fd2458c40147275c91650f7f1b4a7a2 bnxt_en: Remove jumbo_remove step from TX path
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r064-20260608 (https://download.01.org/0day-ci/archive/20260616/202606161218.UxQOQFVC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161218.UxQOQFVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3f1bff1d7fd2 ("bnxt_en: Remove jumbo_remove step from TX path")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606161218.UxQOQFVC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_hwrm_ver_get':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10233:22: warning: variable 'max_tmo_secs' set but not used [-Wunused-but-set-variable=]
   10233 |         int rc, len, max_tmo_secs;
         |                      ^~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt.o: warning: objtool: bnxt_rx_pkt+0xc28: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED7405C5B
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 23:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778889260; cv=none; b=LDhL/+Q9SCU7bVL+fQf7h+PgUtCf3pcg4UOwciA2YI/yYtwn9l5GaVvto3vwotYc4ivRWYH9maOMiXvlrUNnLMMVmIAUo8XxnGmE9t1oo1C3X3/F/kK9ezn7d2pOVNJX9jjKZU685yKGRLMwx8ZnP4N6j2PKheVFN4BY7WjX8N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778889260; c=relaxed/simple;
	bh=yIiRNrJxZw50THrDL7Eo35v7d3lelbrro1KYK+wbCEw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gYN2Y7x0M7hndRjkM9wB72uiZGxSniO0z/XfKGzxE/PKdNgM8GaftdnoU65ywmExf66OI71MnOi2wdhkyJ7+fj7aCmuT/83o3sWg0yw86V7vE/vtx7NxIaBMIvNZPZDDiVBMwcEWmtBmdCLL+I8322MxL2dclEt5nYseSOp3U/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWMGK0te; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWMGK0te"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778889260; x=1810425260;
  h=date:from:to:cc:subject:message-id;
  bh=yIiRNrJxZw50THrDL7Eo35v7d3lelbrro1KYK+wbCEw=;
  b=fWMGK0te29Gfk/elSLyQe6YYDRcijNUGqTsmFDLXF89uU2h13oWbs0F1
   ddyzbF7f0gDGVuPerVFkSjjmD3P6zO1K3NwgZQkvouPjjvOPg6sPxtM43
   WDhGIXApi6REc4PoJE7YMGvU1ms7Ck9/XYUN/MRwtH21e5gcTUF1QQO0m
   WNj1vtiYYJDrfeKiw8gStlP7kC16k1SHdPcjgVD8N5AXlXvP9mf60LhuA
   nkcNtmxuYHZQJA9JDNXceIykTqUUcEtPwGn6apXkXL8An6Lrg2RLdTNfl
   EQR1NdioerXXGP8Xow08lokrq6lrKXmMTR/+VnR+leCPDGCh6J56rAxAT
   Q==;
X-CSE-ConnectionGUID: Zkm0OfCYSBGgWwlLAOGrVQ==
X-CSE-MsgGUID: XsWaLWAoSqey+f9ZBj0szg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="80018733"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="80018733"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 16:54:19 -0700
X-CSE-ConnectionGUID: 9efUgTBRShOatei86YF8Tw==
X-CSE-MsgGUID: B/VqSsWyTdSIBSFs2C7Kqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="276927137"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2026 16:54:18 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO2MB-0000000098H-403D;
	Fri, 15 May 2026 23:54:15 +0000
Date: Sat, 16 May 2026 01:54:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: seccomp_notif_inject.c:(.text+0x3405): warning: the use of
 `mktemp' is dangerous, better use `mkstemp' or `mkdtemp'
Message-ID: <202605160129.SPNAAVNH-lkp@intel.com>
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
TO: Cong Wang <cwang@multikernel.io>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/seccomp-add-SECCOMP_IOCTL_NOTIF_INJECT-for-race-free-unotify/20260515-180940
head:   d097e2ffff248ce5ca6256ff90f5a33c3f99d970
commit: 7aff4bdbdf27d35bb39c8ee1eea18ef3e4bbc23f selftests/seccomp: add seccomp_notif_inject coverage
date:   14 hours ago
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260516/202605160129.SPNAAVNH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160129.SPNAAVNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605160129.SPNAAVNH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   /usr/bin/ld: /tmp/ccLVDGuk.o: in function `notif_inject_bind':
>> seccomp_notif_inject.c:(.text+0x3405): warning: the use of `mktemp' is dangerous, better use `mkstemp' or `mkdtemp'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

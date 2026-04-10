Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A83E0258
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839816; cv=none; b=aj/df40vmONLEY8pH5Qed5LFh7f1CLcvmnFASDLTdHj1yA52DSI2vXIIklgCrEnO5TO9SvYBybCsZk0iRj9u6ZDsIG2dwE6ogxO3LiHWfCp8vh1qSJBGvf6QjRI5xRxpaMiITK8Obgh2LSyj3EvBYBBMoN0QcJqAH2POBikB4Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839816; c=relaxed/simple;
	bh=LWB9HjsJ0QkLZD9tZrv1ONyv0cDA4vkFOwgS4unuF7w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qfm2tcbRESCH1/HiQnFJ5nfcuD9LWkpavvkd4ulnB5jiCHLG4uOrDL03pVUEw9dS37nxDBwa9Mky5bwzZoqowyGGywSfsS7VT1LlzDm4UD/TJH+WWgO9ohDlKsHw/9w1EAsl6rPlWa7GKYEYuswoVfvD50ua3jFX8IZI2r+Okwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoDwx/jF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoDwx/jF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775839814; x=1807375814;
  h=date:from:to:cc:subject:message-id;
  bh=LWB9HjsJ0QkLZD9tZrv1ONyv0cDA4vkFOwgS4unuF7w=;
  b=MoDwx/jFzxVJLGt3fTbo3QpkGJ6rDaqA+yKgQlKL+433uGImOibesBT7
   VEGeSc6AQKHyOtXYFhiMYG82gH4Nxa9DLx6vTG01sJzwzRgvoFZb6Ubwe
   HtKJZZFatnCy9tP/p5sJYeQs2IXO/QewgFjmpAbqFhWOMoO/RLnD9ChOU
   AKCqveGkKZ3ahdoY6s0UMQjYY8jcB02gXvMaxYwLZJIF/gTrKagos6R9/
   5mamE6Li+AQc6wjdK20Bd2j/gjD3ntfn28D8L6R2PEPHNFerrv4OuYG6d
   KYs66GlALBzPzigdSFyq2cGTgLb8K47aVU0thYu8AZGTnQUsUNfNIGkgG
   w==;
X-CSE-ConnectionGUID: Dn7FJiJ7QlmfRTYS4yyH8A==
X-CSE-MsgGUID: eRFCI7ZWTpy2Iy6hGS/i5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79449584"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="79449584"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:50:13 -0700
X-CSE-ConnectionGUID: 6OLavWvEQDKdvuIE8VX8pA==
X-CSE-MsgGUID: NDeXOP+ZT+W1LxwOv1xaQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="259589127"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 09:50:10 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBF3Z-00000000AvZ-19T6;
	Fri, 10 Apr 2026 16:50:09 +0000
Date: Fri, 10 Apr 2026 18:49:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:cleanups 25/38] arch/arm64/kernel/time.c:56:22:
 error: static declaration of 'random_get_entropy' follows non-static
 declaration
Message-ID: <202604101823.wCfnGeTA-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   c8e6e3529d3137cb0aba79b565eb04ab8f346829
commit: 547dc92375fef1634a43eeba61247efe222047e4 [25/38] arm64: Select ARCH_HAS_RANDOM_ENTROPY
:::::: branch date: 75 minutes ago
:::::: commit date: 5 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260410/202604101823.wCfnGeTA-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101823.wCfnGeTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604101823.wCfnGeTA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/kernel/time.c:56:22: error: static declaration of 'random_get_entropy' follows non-static declaration
      56 | static unsigned long random_get_entropy(void)
         |                      ^~~~~~~~~~~~~~~~~~
   In file included from ./include/linux/random.h:154,
                    from ./include/linux/nodemask.h:94,
                    from ./include/linux/numa.h:6,
                    from ./include/linux/cpumask.h:15,
                    from ./arch/arm64/include/asm/cpufeature.h:27,
                    from ./arch/arm64/include/asm/ptrace.h:11,
                    from ./arch/arm64/include/asm/irqflags.h:9,
                    from ./include/linux/irqflags.h:18,
                    from ./include/linux/spinlock.h:59,
                    from ./include/linux/debugobjects.h:6,
                    from ./include/linux/timer.h:8,
                    from ./include/linux/clocksource.h:17,
                    from ./include/linux/clockchips.h:14,
                    from arch/arm64/kernel/time.c:10:
   ./arch/arm64/include/asm/random.h:9:15: note: previous declaration of 'random_get_entropy' with type 'long unsigned int(void)'
       9 | unsigned long random_get_entropy(void);
         |               ^~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/time.c:56:22: warning: 'random_get_entropy' defined but not used [-Wunused-function]
      56 | static unsigned long random_get_entropy(void)
         |                      ^~~~~~~~~~~~~~~~~~


vim +/random_get_entropy +56 arch/arm64/kernel/time.c

985c0679dfa459 Marc Zyngier    2012-03-05  55  
547dc92375fef1 Thomas Gleixner 2026-04-09 @56  static unsigned long random_get_entropy(void)
547dc92375fef1 Thomas Gleixner 2026-04-09  57  {
547dc92375fef1 Thomas Gleixner 2026-04-09  58  	return arch_timer_read_counter();
547dc92375fef1 Thomas Gleixner 2026-04-09  59  }
547dc92375fef1 Thomas Gleixner 2026-04-09  60  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

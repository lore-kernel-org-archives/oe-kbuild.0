Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D63C40D56B
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jun 2026 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094359; cv=none; b=MRLKcs7L+0FVvK2pEPHM6IR7kxjpFnGzs83O6ELZ8RabNIrOc9LCwZEyS746oTW598JpfXtVWOi3T///IHAj8aarWpPoVuix97SIcXrEQNengwIfi4F2bDPXZ/tuzTGNMJp5KGl/kQyeCcHfQHT5I4hD/O2qqDRZrIrJbU1HyAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094359; c=relaxed/simple;
	bh=DdAMhNCSYpPwvbt90diOfO+PyIhJvCaTlckqOSc3BDw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a6gScg+I+FJC75N9OqkaQzkauqMFrjLUjRTVMlB0E+GdMp1xTQt0N7vKg0sXcGxq3ooM5u9bqzbJUgIRBLlclj/kNHSssu+Cy9OpixRoWplLcG9Wa3jnKmWBo4Ef8WFViqhjHEeB1hmqSUYSE1rP9S4QGx32+3XyxWlSH+/YVY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6Dwvd6o; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6Dwvd6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781094356; x=1812630356;
  h=date:from:to:cc:subject:message-id;
  bh=DdAMhNCSYpPwvbt90diOfO+PyIhJvCaTlckqOSc3BDw=;
  b=H6Dwvd6oMU/mGaPk7slE913aD2t0zp5hKmPztCpp1cXmYjB49X43E+BD
   DbIwYeci622qx9w8UC/OX3GIIQiw7lWSPR8CKUN51uws+c1+es7BHBIge
   L7sNozQ8S1B96PKaufpd9qYGG6UoQK9FeFjNj3rG7MzUQh4Ysu+O9AAhQ
   E5rjB01zyqJOIw09tcd1hDZ3jw4m1hd1rWINxii5aCvMofgPrURG1aHBE
   YHXPbnJoZxPwHgAknmnYOnyHSGbFj7z5qMhIqozRFAr88q27NRwAr4T3R
   h2HP0FVWSd0iLK7ge2KUk8hPfwyrr0x+KR+ObKfpj75P0vTjQajr3lCcj
   Q==;
X-CSE-ConnectionGUID: JiymFa0+R6G/DnYj+4U6yA==
X-CSE-MsgGUID: keVnw7SzQcWhS/x7pBEmjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85511830"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85511830"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:25:56 -0700
X-CSE-ConnectionGUID: 2c29pmRBTjWxkKlJjISiXw==
X-CSE-MsgGUID: 37QarNmsRGCZiVsDzgY5TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="269834971"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jun 2026 05:25:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXI0G-00000000LPW-35SQ;
	Wed, 10 Jun 2026 12:25:52 +0000
Date: Wed, 10 Jun 2026 20:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/gfs2/log.o: warning: objtool: gfs2_ail1_start_one+0x38c:
 unreachable instruction
Message-ID: <202606102018.jclk9NDB-lkp@intel.com>
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
TO: Andreas Gruenbacher <agruenba@redhat.com>

Hi Andreas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   acb7500801e98639f6d8c2d796ed9f64cba83d3a
commit: 5a90f8d499225512a385585ffe3e28f687263d47 gfs2: Don't start unnecessary transactions during log flush
date:   1 year, 1 month ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r064-20260608 (https://download.01.org/0day-ci/archive/20260610/202606102018.jclk9NDB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606102018.jclk9NDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5a90f8d49922 ("gfs2: Don't start unnecessary transactions during log flush")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606102018.jclk9NDB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/gfs2/log.o: warning: objtool: gfs2_ail1_start_one+0x38c: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

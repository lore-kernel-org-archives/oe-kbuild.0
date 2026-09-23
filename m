Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59C24F4CF3
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180110; cv=none; b=HfIjvpxHXYFnYIfdZaevnUuw1ncTWvl1DxvFoSidw6+68SJ/TH8Ps2+nDiQwi3H/4HH9SB8l3IdV4pi6kuLCXCcUFMrOfGhWub/+oF1a//FU9CGA/vzPbqYH8uGnfLEQB1sMDoJO2J+1ckYKPvTIJ6Aj0TB4vhRExzy/24X/ayE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180110; c=relaxed/simple;
	bh=dp1JVnpWhT370l6fbQz9mi/RM92wQX2pp1rY51eE7Uo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ptd+ifLxMnwZs2Loa/GABHQ264qIINRqzDcYT8zDekSrELIaHu85dbGb6f5vFRuYT9F4UgQuTl7E1sZehu37fFBoQUERh3dsMXvxm+u8KyCslKDzxXnaSJYN56dKjcFTgZOwb/hbFvWtG+UMGqgzP0RH9zxFENDUMfzq4+ER33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KakJI8qL; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KakJI8qL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790180107; x=1821716107;
  h=date:from:to:cc:subject:message-id;
  bh=dp1JVnpWhT370l6fbQz9mi/RM92wQX2pp1rY51eE7Uo=;
  b=KakJI8qLiAM1JOwGIfgSlWXAMfx+ZSp7oDxIiWaqHDld7XM29fMWclFq
   CjNGXZTwpkUxhGcMsjTgs2RpbrQfUk1MWhrbmPFvk8wJEA3tXHQjq1M7d
   zvi8VHSTynZzOfsdSebckUQhO8azYPdamwAhTLwh0VWpdGKDB7VcmfM+q
   fzPj2t/uAV77zpFBp6faNI48q5aLmJ1dqT1uX4xXaK91dALO+87AfpzI+
   cGBq6vT6M6xK/1pZGSc+0zJ0qWpdrTU9/va/tMuGkX7/RKeJOPsSLHsvT
   CoSrfwVnXMPrZ1DZ5jjrd9JQUzTtUguKOx6K/XdgkDTCVdPVKChyOL8v4
   Q==;
X-CSE-ConnectionGUID: zVrZgUmyRXiWuRibyHw/Cw==
X-CSE-MsgGUID: qE2beQHoRgmfd4aF5BcIwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1389045"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1389045"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:15:06 -0700
X-CSE-ConnectionGUID: hRDYviFyTJegB5oKTn70mw==
X-CSE-MsgGUID: NeJ7VWUjSU6Qf7lNDThqOw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 09:15:05 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9PcY-000000000jx-1ijV;
	Wed, 23 Sep 2026 16:14:58 +0000
Date: Wed, 23 Sep 2026 18:14:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: word-at-a-time.h:206:10: fatal error:
 asm-generic/word-at-a-time-instrumented.h: No such file or directory
Message-ID: <202609231856.FRpz24qP-lkp@intel.com>
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
TO: Bill Wendling <morbo@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bill-Wendling/kasan-Add-kunitconfig-for-KUnit-tests/20260911-070339
head:   8eb2e4de44d36f988ae01685852429bab194bbc8
commit: 8eb2e4de44d36f988ae01685852429bab194bbc8 powerpc/word-at-a-time: Instrument load_unaligned_zeropad()
date:   12 days ago
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260923/202609231856.FRpz24qP-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231856.FRpz24qP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609231856.FRpz24qP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from load_unaligned_zeropad.c:26:
>> word-at-a-time.h:206:10: fatal error: asm-generic/word-at-a-time-instrumented.h: No such file or directory
     206 | #include <asm-generic/word-at-a-time-instrumented.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

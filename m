Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E795375ACB
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999884; cv=none; b=MJ1H3awV1NLNu/iRu6y8AJ/3DSqX7frGRSbyrl6j7Tl6jRQmjGIGnI/mI15FU7TILrfB8gt9UxsOvwkhawdcLHoQdFw1zEF2sg0qRThT1A5YTCOmy63YW8NRSGiaIPsv+7TQXNs1CBmllVN//+nJG/gEuEQvDfYQbXjoJkvfSMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999884; c=relaxed/simple;
	bh=yUkBJI0CVudep6hCVEtUboY8ItrS7I6lA2Nncr0yM5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EaCoCDle5gfTGRYh0fuD4nYOvV1E8uXEEBejE6OyCQgvQrmpPl0zzlcM48pQEixvHjRO/xLOB2FamavNH+Vs7Fb+NwPB9g2WxSHADBIk4k01QiHdJpE/bWfJ0M8r0ruri2BlAwnrS361V7BlD5NFh0DvNzRCAFrCL+UwvA+Ta6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcmdtGl9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcmdtGl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785999882; x=1817535882;
  h=date:from:to:cc:subject:message-id;
  bh=yUkBJI0CVudep6hCVEtUboY8ItrS7I6lA2Nncr0yM5w=;
  b=bcmdtGl9xx/KDtnNsZug/gsRdZGJVD+bYv4ivR2geHbakRZeq/RqJwfx
   4ScswMyGVV8ELK+zeQtOjSiNXiIwHFaVEeVQeM5xCx5GZ+/YU5MIufwOJ
   cxBU1a8c2Mx9ZiI5OALcYDBWA9FgJrw1mMfU+5y2DDbkfcd5aLRPOCFIS
   qRwG+fbmDp+TovMiPedJeClJnw47H+ySh8gxwxXhWW9n612UB4bchF0xq
   yj8jSTU7sJBmPfAO8fzWdDmUC5oDO6J1mjglnUGAITPm57rSW8zPWl0vS
   ZEhpqhXRuazej8M4SzUJuH8AXB60/4PVCmTvBbUiFIjXTc9/I1Yaea/ax
   A==;
X-CSE-ConnectionGUID: RMA6lXCQS0Wwfq4ttyTH6g==
X-CSE-MsgGUID: nPot1W4rTWaI99h6dLdu4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86352854"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86352854"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:04:42 -0700
X-CSE-ConnectionGUID: hWcCoy/BTaKZnm+eZMnsPQ==
X-CSE-MsgGUID: tCTasIVWTG23hAg8qMJ55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260257354"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 06 Aug 2026 00:04:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrs9f-000000004Zy-0yqD;
	Thu, 06 Aug 2026 07:04:39 +0000
Date: Thu, 06 Aug 2026 09:03:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:klp-build-arm64 19/21] arch/arm64/special.c:8:6:
 error: no previous prototype for 'arch_alt_ignore_new_reloc'
Message-ID: <202608060905.5iiNmhXg-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   1e3926b801edc0c1b9fb41d28e4a173d3b8ce33d
commit: 252df16fb44722ab711912a1917181d99aa8c607 [19/21] objtool/klp: Introduce objtool for arm64
:::::: branch date: 75 minutes ago
:::::: commit date: 75 minutes ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260806/202608060905.5iiNmhXg-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060905.5iiNmhXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608060905.5iiNmhXg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/special.c:8:6: error: no previous prototype for 'arch_alt_ignore_new_reloc' [-Werror=missing-prototypes]
       8 | bool arch_alt_ignore_new_reloc(struct section *sec, unsigned long offset)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

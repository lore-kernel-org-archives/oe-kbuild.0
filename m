Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7BC357CE8
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Aug 2026 02:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785550504; cv=none; b=n7+kO6+eBw/yBJfyXXqrlBqGHT2nPKZ2XeJW5OxX6WfHbKBdTKS2KfnTYD2errXCrbRXPZPaEJ+gDVyxowI70a15+Sin83ujTqp0pwNs6Mu4AcIRjqTUKC+fUVaP8QvvazzjVZuXBAAYKZjY+NHdAhOANXTrF3cf9KLmMLKBmLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785550504; c=relaxed/simple;
	bh=d1fVuN1QDQAMEkBELlD69EwHsGHAr3R7RrwIrlPHjME=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bKl2Fn/tk0mqPikodXhKWhRBrQHCJ/mm0GYL2Q9aaJfZlGH4jtIXMcMjzWUBl2I1XPa9Rt31Mk7QZPJM6JikgqGPixq6UZ+BpE/813cLYAXTCppW/4ZJ5+k+5+X8svM79kCWbyxjgD4jlx1s40QZ1TrsXbCxfrvMLG51enLVEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMGJ829X; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMGJ829X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785550501; x=1817086501;
  h=date:from:to:cc:subject:message-id;
  bh=d1fVuN1QDQAMEkBELlD69EwHsGHAr3R7RrwIrlPHjME=;
  b=EMGJ829Xpf31t6ykPSRdaUCH5ljmcB9psTUHVqBkfk0Y0oPKZomY5Vys
   PAThab2HAz8Sqk+aHmf36kEl73j4w4uMyAOgxbv6zuCSFy3sS9q7NlWUe
   wBh40uPcEXynmBYZX1NGgG6+FcNukHqeepC6hKTzPp7KIxW/W3ZOCcj4v
   tlkcEefDIDMj+gnKH/O+Ll5TG/y0U9/vzwvz201mbEBqlxeYRS7ZC0sSk
   wOIpklvP4tqmooIJIlWTREFPrvSUwV6jvJlep8MHOmJdh9YwU2K7nXF8D
   26okJtcprpO7i2TxJgv3rTDYqetfnRnbhDzDdcVHgLrUdavQy2RECWAhy
   w==;
X-CSE-ConnectionGUID: NgGORXoFRK+8lcTf4qmWwQ==
X-CSE-MsgGUID: fJ5lTgpQSiCPxvpLwX4kWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86127071"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86127071"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 19:15:01 -0700
X-CSE-ConnectionGUID: zuGjM4B2RLiZF9L1L6CIMg==
X-CSE-MsgGUID: EdRrKn5aQFiXcpEwPnUyig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="290658487"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Jul 2026 19:15:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpzFa-000000002aR-11y9;
	Sat, 01 Aug 2026 02:14:58 +0000
Date: Sat, 01 Aug 2026 10:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/net/bpf_jit_comp.c:550
 bpf_jit_supports_fsession() warn: signedness bug returning '(-95)'
Message-ID: <202608010958.cYfBCQAC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Abhishek Dubey <adubey@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
commit: 92258b5bf1ec10204c23a793793a65dc92d17014 powerpc32/bpf: Add fsession support
date:   4 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
config: powerpc-randconfig-r073-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010958.cYfBCQAC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 92258b5bf1ec ("powerpc32/bpf: Add fsession support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608010958.cYfBCQAC-lkp@intel.com/

smatch warnings:
arch/powerpc/net/bpf_jit_comp.c:550 bpf_jit_supports_fsession() warn: signedness bug returning '(-95)'

vim +550 arch/powerpc/net/bpf_jit_comp.c

156d985123b6d6 Abhishek Dubey 2026-04-01  542  
6fab063bd8d64f Abhishek Dubey 2026-04-01  543  bool bpf_jit_supports_fsession(void)
6fab063bd8d64f Abhishek Dubey 2026-04-01  544  {
92258b5bf1ec10 Abhishek Dubey 2026-04-01  545  	/*
92258b5bf1ec10 Abhishek Dubey 2026-04-01  546  	 * TODO: Remove after validating support
92258b5bf1ec10 Abhishek Dubey 2026-04-01  547  	 * for fsession and trampoline on ppc32.
92258b5bf1ec10 Abhishek Dubey 2026-04-01  548  	 */
92258b5bf1ec10 Abhishek Dubey 2026-04-01  549  	if (IS_ENABLED(CONFIG_PPC32))
92258b5bf1ec10 Abhishek Dubey 2026-04-01 @550  		return -EOPNOTSUPP;
92258b5bf1ec10 Abhishek Dubey 2026-04-01  551  	return true;
6fab063bd8d64f Abhishek Dubey 2026-04-01  552  }
6fab063bd8d64f Abhishek Dubey 2026-04-01  553  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

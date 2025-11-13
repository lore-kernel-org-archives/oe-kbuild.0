Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5768530100E
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009486; cv=none; b=tcHSz/T3+JnIkM32CrBm7EbS9FYuy0NNsc321FnMIewtgiuoLJfVZCUk6ocWZESsNfgLhzJ0rJCrHBmk1n+2TIiWGHXLUP9G1sUMZ/bdIGq/LLik3VNVLxpMcfkQjMS+l7X5N+5CWFEo8dxFD9dSAv9gmuwq3sRXYSMDqvpnhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009486; c=relaxed/simple;
	bh=dReIlp5z9pW9+ALjBt7BydHkF+noD3CF/A9HtSbdwcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V3L5c0qij5yp+UEp0pjJLPzPWYhc6IcDJooc/Idk/MNkDn5+Ttk5ODsTzYQW9AY6S7vN51oee2SfiuWo+uosQI2P0ERb1N7kzggZ5UYS81ierqxfG1hfsjzE7WP9JrIlRCmuaL0BuL9kYk72Z4cT3ylRQdY8Q6D1WOW0VusFfYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrVJcnKi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrVJcnKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009484; x=1794545484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dReIlp5z9pW9+ALjBt7BydHkF+noD3CF/A9HtSbdwcg=;
  b=LrVJcnKiL7pyy3GnMHJdtPT+H9G2qg0ozQDX/a2yj+Qzb3p51R4HBdt/
   g5Zct820h6qeWpuZhidkYEesFumYfL9alM6cTynbz3hhTpgulTZEcXPXj
   PUi9JIhnPM3l2oQZhthh6OUFNbjqh7kstnFBv0+DEmj7kAVHEIVi53Lan
   kbvOa26CUCPsjAzR++2Jvc6VspFxzgAEV2QV3XIoYuPgwPHnOBqtb4K3v
   7ay5T3ijhwaT1bzjilBZm6bKVWEWoh7YYYc+stebFjYl2Kc8w7DCxOILJ
   U4miJTEUbW9EGFiXPqbJ+qmqS4ocyBbo4vGgIOFU6uEbAAiTPulj57brm
   w==;
X-CSE-ConnectionGUID: syaI16EXSoGk4k4kSLxn0w==
X-CSE-MsgGUID: ODd3oNUoR/yK1b2pgDCglg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65008592"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65008592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:51:22 -0800
X-CSE-ConnectionGUID: spSYqbfNTCqTbHCPHdTwlg==
X-CSE-MsgGUID: eIKIIKwrSeCe+UdKOTpQWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="220161058"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2025 20:51:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPIl-0004tN-07;
	Thu, 13 Nov 2025 04:51:19 +0000
Date: Thu, 13 Nov 2025 12:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 14/28] objtool: Improve tracing of alternative
 instructions
Message-ID: <202511130458.4jK2ZjK0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251112160315.2207947-15-alexandre.chartre@oracle.com>
References: <20251112160315.2207947-15-alexandre.chartre@oracle.com>
TO: Alexandre Chartre <alexandre.chartre@oracle.com>
TO: linux-kernel@vger.kernel.org
TO: mingo@kernel.org
TO: jpoimboe@kernel.org
TO: peterz@infradead.org
CC: alexandre.chartre@oracle.com

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc5]
[cannot apply to next-20251112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Chartre/objtool-Move-disassembly-functions-to-a-separated-file/20251113-013604
base:   linus/master
patch link:    https://lore.kernel.org/r/20251112160315.2207947-15-alexandre.chartre%40oracle.com
patch subject: [PATCH v3 14/28] objtool: Improve tracing of alternative instructions
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511130458.4jK2ZjK0-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130458.4jK2ZjK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511130458.4jK2ZjK0-lkp@intel.com/

All errors (new ones prefixed by >>):

   check.c: In function 'validate_insn':
>> check.c:3663:29: error: 'trace' undeclared (first use in this function)
    3663 |                         if (trace) {
         |                             ^~~~~
   check.c:3663:29: note: each undeclared identifier is reported only once for each function it appears in
   make[5]: *** [tools/build/Makefile.build:85: tools/objtool/check.o] Error 1
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:87: tools/objtool/objtool-in.o] Error 2
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:73: objtool] Error 2
   make[2]: *** [Makefile:1449: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

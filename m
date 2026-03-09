Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9736413DBA0
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 00:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773015268; cv=none; b=XGgHbNu9igR+1+jrANcZrsqKV1lFpyZINZt44jG+r6O6T8GgKLET6p/SRagrR0jKcmFMHfrhKx3MHJ3BTa8o3koZa03k2mzbUfOGwBplD9yZL8rulIcSPmKe5Y7l0KmnJe1KVTEw2CddzzEejPQlPk0Sau0u/HeviU+RwNISPTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773015268; c=relaxed/simple;
	bh=PLoTSapWUO7DN1AVQ6QOOTennZQLu82/Z8xN0rhdK+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BURLI1PezJPrzbabVqr8eEB2jaP7bQp1jBK0ICcr/sHCvYS/2igDDJMmVfUcMAV27auMCvH44IS0xQAudyLnBqo3n8OSd836s/x8vA6F3MwRZoTI5vmSawZBGUaIiR6vf7Wdm4ij90Y6PwCJeBHpl8DqHkotenH6oNDZUTqjn8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8oLMyoc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8oLMyoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773015267; x=1804551267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PLoTSapWUO7DN1AVQ6QOOTennZQLu82/Z8xN0rhdK+o=;
  b=B8oLMyocfdH2nJ2gyQ/iirwVLvRspM8AycO7h8yKY5QzHV5lsisZd4MM
   xR3GsQzGHvci7uy6173l0m/iRq0VipDCO7Px92En11p4m7Y1gvk4I1bBK
   h5FgPT8OKgMtmxMpKmTIwQCSjMU1PM1Y/OhzEH5U6H2OtL8eVSocx9ppF
   laW5MYv/nM58RYaDrLb5sugzrdojlDAzlnjvwvoYj6OoliNJ2E2Ydt13v
   ViF6ENXK/BP+fSo0bzWphd0/DcBxaQwFdIzrUCI7fLvqQp8Qax+8BkGcZ
   ErWhmtE3jrdxjhb8AOU1c4lWsBdc4iQN8QesKFYdb8rocDW4Y9AImlWPB
   Q==;
X-CSE-ConnectionGUID: aeYFnScbSsu/Z7ia1ivDpA==
X-CSE-MsgGUID: V25mwuqaTSyLWSE5Ss5tHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74083135"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74083135"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 17:14:27 -0700
X-CSE-ConnectionGUID: qDVhnH7cRem6xa/laKpy/A==
X-CSE-MsgGUID: K+ry+qmSTH2Ki0pOGLA5kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="223686438"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 Mar 2026 17:14:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzOGM-000000002mL-2N7T;
	Mon, 09 Mar 2026 00:14:22 +0000
Date: Mon, 9 Mar 2026 01:13:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] perf utilities: cln_size header
Message-ID: <202603090131.9EqA781s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260308172037.123654-1-ricky.ringler@proton.me>
References: <20260308172037.123654-1-ricky.ringler@proton.me>
TO: Ricky Ringler <ricky.ringler@proton.me>
TO: namhyung@kernel.org
CC: mingo@redhat.com
CC: acme@kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-perf-users@vger.kernel.org
CC: Ricky Ringler <ricky.ringler@proton.me>

Hi Ricky,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools next-20260306]
[cannot apply to acme/perf/core linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricky-Ringler/perf-utilities-cln_size-header/20260309-012303
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260308172037.123654-1-ricky.ringler%40proton.me
patch subject: [PATCH v3] perf utilities: cln_size header
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260309/202603090131.9EqA781s-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090131.9EqA781s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603090131.9EqA781s-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:576: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:963: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1159: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.0.rc1.g9c3e08ac3e9a
   builtin-inject.c: In function 'keep_feat':
>> builtin-inject.c:2137:14: error: 'HEADER_CLNq_SIZE' undeclared (first use in this function); did you mean 'HEADER_CLN_SIZE'?
    2137 |         case HEADER_CLNq_SIZE:
         |              ^~~~~~~~~~~~~~~~
         |              HEADER_CLN_SIZE
   builtin-inject.c:2137:14: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [tools/build/Makefile.build:93: builtin-inject.o] Error 1
   make[3]: *** Waiting for unfinished jobs....
   make[2]: *** [Makefile.perf:770: perf-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

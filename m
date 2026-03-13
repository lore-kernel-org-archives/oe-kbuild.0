Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1243C9ED4
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423500; cv=none; b=QB4rGEQAacWc7Nmx/VFxAM1P2uKBjL5f/OJplAokkqftEuD3r59nqF/a6sAS/H52WOEr4uJUA1suU+5imtEJTx8TP/E+NEt07pQ/ecukU61r+DRiQ7+dYmsJjRqAOuCQm7skosHFSHc8pOqvLQyVVECBTMdIBOkznetb0ACMYIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423500; c=relaxed/simple;
	bh=iFo/PbfI1NnHks3QLNAAwlX3j1JQbgTmTKCKdTh8gH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTiqOfi0Yhw66yxw1BOqJGdUfq60q6wMtdfoTfReicBPcbAuWhSuO/aQSPDNfkwEKu466hVaGmu2aLFgEMdZAEZU2gjs98QMwQldfgNRg/ZjE2R6sL9iu+DOzEAAtJ3me3WBekJFkP0qZeR1qIuyYFtmPDcFI/hWaAnVJjA34fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaKBTWXm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaKBTWXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773423499; x=1804959499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iFo/PbfI1NnHks3QLNAAwlX3j1JQbgTmTKCKdTh8gH4=;
  b=RaKBTWXmaHnvbCvl52+OZiMf1r6oJEB+ecRVcCq9MEyoeVgB4XsX3Vs7
   hwaA5HeqPypv2ifxaUwqRZGqgr2/HMn0V0ySM6+uCXsBNH9P8bDWAeClG
   imHha8tOQHAiE4RBYE3lpAikUMLFCdTH9A7bD5xH+YFOHUh6DOVCO4FjQ
   CWzNLExjdld0+v16YeKMi3OFS33hfmxSyri61B2VZCdI+mkeYo0QzP8h1
   YXZu0fkkxOC1ezP1TV7b6DNmWppa+0yeqeBBe10il94DZXoh9nJy/loPq
   qdjWHvUfAaMi6ZTPAonqNQbIPhwLP4gF1oWZ9qimzrSzKXoTtuVyzPIsw
   w==;
X-CSE-ConnectionGUID: 3ImgD+C7S9aBBLdb0+zqYg==
X-CSE-MsgGUID: 6+tPPONfRsKQQOAHC3lT0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74415614"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74415614"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 10:38:17 -0700
X-CSE-ConnectionGUID: JnrrlYwrS8qZtdioNx+Q5A==
X-CSE-MsgGUID: 59CNpfWcR/i7EB39cQF+sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="226218186"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Mar 2026 10:38:16 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w16Si-000000003gf-0jK3;
	Fri, 13 Mar 2026 17:38:12 +0000
Date: Fri, 13 Mar 2026 18:37:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] perf record: Add support for arch_sdt_arg_parse_op()
 on s390
Message-ID: <202603131803.W3p7lSjw-lkp@intel.com>
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
In-Reply-To: <20260313132302.3347751-1-tmricht@linux.ibm.com>
References: <20260313132302.3347751-1-tmricht@linux.ibm.com>
TO: Thomas Richter <tmricht@linux.ibm.com>
TO: linux-kernel@vger.kernel.org
TO: linux-s390@vger.kernel.org
TO: linux-perf-users@vger.kernel.org
TO: acme@kernel.org
TO: namhyung@kernel.org
TO: dapeng1.mi@linux.intel.com
CC: agordeev@linux.ibm.com
CC: gor@linux.ibm.com
CC: sumanthk@linux.ibm.com
CC: hca@linux.ibm.com
CC: japo@linux.ibm.com
CC: Thomas Richter <tmricht@linux.ibm.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools next-20260313]
[cannot apply to acme/perf/core linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Richter/perf-record-Add-support-for-arch_sdt_arg_parse_op-on-s390/20260313-235725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260313132302.3347751-1-tmricht%40linux.ibm.com
patch subject: [PATCH v2] perf record: Add support for arch_sdt_arg_parse_op() on s390
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260313/202603131803.W3p7lSjw-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603131803.W3p7lSjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603131803.W3p7lSjw-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:576: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:963: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1159: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.0.rc1.gf785b98b5e11
   util/perf-regs-arch/perf_regs_s390.c: In function '__perf_sdt_arg_parse_op_s390':
>> util/perf-regs-arch/perf_regs_s390.c:186:9: error: expected declaration or statement at end of input
     186 |         return SDT_ARG_VALID;
         |         ^~~~~~
   make[5]: *** [tools/build/Makefile.build:93: util/perf-regs-arch/perf_regs_s390.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [tools/build/Makefile.build:156: perf-regs-arch] Error 2
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:156: util] Error 2
   make[2]: *** [Makefile.perf:797: perf-util-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

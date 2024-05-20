Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D39746E
	for <oe-kbuild@lists.linux.dev>; Mon, 20 May 2024 01:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716169154; cv=none; b=iXnxuqyCIV5BUdWoeliYPO+SofNLAzt4XZQ92U+a27a4cpimklcqq8k3zSp/9qSgQc5F4d82BpIXihUESavjMYLi5JPanPq2up81OccxbzI3g6tuDSRZ+Pmeqw4x2QuKiC5211UhyyNNz8lMnZ2lI4Uk6BRLokHhkOxaYGyhwG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716169154; c=relaxed/simple;
	bh=NYlV9afBOibbAC/8gJyISg0dw4baeA+wNPvUHasF5ac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WxGCWrc9/tDRvKCh9QYL4NjBjqemZ6WxQ+8hSJZEWTyuTOdKBhGcRZBDxRj4TJfd9DaCl/FT9PLjKZPkhrdYWs53vcSDXpCwxvSPrN9tXNgV5TbyZRzSm2tyNtL5kdqo9JgBcDv50yQHtz7LTmK9beMWCUrJVYmkXScBnaxQrxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4sJDXK7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4sJDXK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716169152; x=1747705152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NYlV9afBOibbAC/8gJyISg0dw4baeA+wNPvUHasF5ac=;
  b=L4sJDXK7BBjkcTtP4oBQj1kfUyzvioVWmbnQTXN/nXLIUzdU21UCJtHM
   UScl5pSbnlPq9VmXVBk9iNDeBL/ADdeKxdRC6VxMh6Za6TeDVKNOTcdM3
   kR/MwY/QYOQMCsBc4uPBK8yc4uSdRar+WkiZvLv9sTeMNe7aHL89YwIyz
   gLwTF/pVkoQWGx6SCr4JvzvuaJAme8Gp6HDWoBIvMGwArCeCj92dNM7Wh
   RuEwo0CdNvVnRf9bBMyPep4yMKST/6NfqA3NK+g3fXf4hrXsOymSCT/yU
   ufRx9tsLyCGGzzterXGXiI7lSza8cI+LrScGyLWPVN79wE37ccvdSWdq7
   A==;
X-CSE-ConnectionGUID: qlh4YnPsRPm+eiVVGo/1FQ==
X-CSE-MsgGUID: ITAvUM+rS0eFjwg6gK9LpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="34791105"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="34791105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 18:39:12 -0700
X-CSE-ConnectionGUID: LVsLjkx0QvO0bEnW9x6V0Q==
X-CSE-MsgGUID: NKhrMC6RSWOH+dhyc60ccQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32794799"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 May 2024 18:39:12 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8rzP-0004QM-1M;
	Mon, 20 May 2024 01:39:04 +0000
Date: Mon, 20 May 2024 09:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] perf annotate: LLVM-based disassembler
Message-ID: <202405200858.tlZUyYah-lkp@intel.com>
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
In-Reply-To: <20240518165335.3963530-3-sesse@google.com>
References: <20240518165335.3963530-3-sesse@google.com>
TO: "Steinar H. Gunderson" <sesse@google.com>
TO: acme@kernel.org
CC: linux-perf-users@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: irogers@google.com
CC: "Steinar H. Gunderson" <sesse@google.com>

Hi Steinar,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on next-20240517]
[cannot apply to tip/perf/core perf-tools/perf-tools acme/perf/core linus/master v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steinar-H-Gunderson/perf-annotate-split-out-read_symbol/20240519-005620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240518165335.3963530-3-sesse%40google.com
patch subject: [PATCH v2 3/3] perf annotate: LLVM-based disassembler
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405200858.tlZUyYah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405200858.tlZUyYah-lkp@intel.com/

All errors (new ones prefixed by >>):

     PERF_VERSION = 6.9.rc5.g5e3bc11621df
>> util/disasm.c:1615:10: fatal error: llvm-c/Disassembler.h: No such file or directory
    1615 | #include <llvm-c/Disassembler.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/disasm.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2


vim +1615 tools/perf/util/disasm.c

6d17edc113de1e Namhyung Kim         2024-03-29  1613  
5e3bc11621df1e Steinar H. Gunderson 2024-05-18  1614  #ifdef HAVE_LLVM_SUPPORT
5e3bc11621df1e Steinar H. Gunderson 2024-05-18 @1615  #include <llvm-c/Disassembler.h>
5e3bc11621df1e Steinar H. Gunderson 2024-05-18  1616  #include <llvm-c/Target.h>
5e3bc11621df1e Steinar H. Gunderson 2024-05-18  1617  #include "util/llvm-c-helpers.h"
5e3bc11621df1e Steinar H. Gunderson 2024-05-18  1618  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

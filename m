Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC8129A0
	for <oe-kbuild@lists.linux.dev>; Fri, 31 May 2024 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717157340; cv=none; b=SVokb2QcWQZH+lRTal+gy0rqOdoj+5rVppHsD8IKrX8zbZhvwGrvsbykWc+NNPA4H5+LgLNRfsqd6Kyrpd3SUVakqSCdYmggrXrybBEOgYeu2zBXAIph15XJNk/BGrJEWjdJrcfDZHPo4cCHNx2ujnL2p5o+OF0V/IORsOEKrgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717157340; c=relaxed/simple;
	bh=j/puRnM7z6b+cyRo+9TsmcVLWfIIkEflx+T9hFICHPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BkDd0xXP3mx9pZ4Prwz17euTbxvvNm7+vgLT+4MMKtZk0xAbyWWqzM9fHccxBt7NjrBQAcW5yPiBdgqMP82n6S5uQNuj7WeTa5L3CP5tFembBJyigfKhbIT0rxVIiPBEMoZpla6MEbxEx2IjgHQ6j5KFAs84KzFFCrEzpEljH+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZoJVynk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZoJVynk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717157339; x=1748693339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/puRnM7z6b+cyRo+9TsmcVLWfIIkEflx+T9hFICHPw=;
  b=XZoJVynkcy8JRLrLefz9GrRzA2tE/A02zLnTjAKjZaX/BreJ7VsUHl4Q
   Ab87Ub6MHEgkyK6eaTTsuYysNvJlkc1+OXl+6cPcMhiBgk9MtzBp0vePI
   JOwOEknyNFOZzfwpKmD/iWaa8XFs4aTxf99lGPFVOmkiXSmy3UvrE715Y
   Hsy2pw4sSdJFeuYDDFJCGM0xjYbT3Sx2Xh1AyCN4FOzOHlXI7mmeogSLk
   8wRakUJUYU8tl21z0UXD5WZTg0K0g+BOY3rTT7cvFuVJYW1pa1C1D8kMO
   6ZYy0Xhqx4/t23ph+JaYtztpQ0lNVZKNNtyR2fswrhVLqpC+Ty+IHjp2c
   A==;
X-CSE-ConnectionGUID: FYV5UieeSUeV1TRcdjDI1A==
X-CSE-MsgGUID: F3PVfva6SBy9RBjQvOGy8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13819743"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13819743"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 05:08:57 -0700
X-CSE-ConnectionGUID: TFgvf3JNTa+tqMxUgR+Ncw==
X-CSE-MsgGUID: 4hIFBPfxSAyv0zu/pyhwow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36616233"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 31 May 2024 05:08:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD141-000H2a-02;
	Fri, 31 May 2024 12:08:53 +0000
Date: Fri, 31 May 2024 20:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 3/4] perf annotate: LLVM-based disassembler
Message-ID: <202405311907.PGE34stU-lkp@intel.com>
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
In-Reply-To: <20240526182212.544525-3-sesse@google.com>
References: <20240526182212.544525-3-sesse@google.com>
TO: "Steinar H. Gunderson" <sesse@google.com>
TO: acme@kernel.org
CC: linux-perf-users@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: irogers@google.com
CC: "Steinar H. Gunderson" <sesse@google.com>

Hi Steinar,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on perf-tools/perf-tools linus/master v6.10-rc1 next-20240531]
[cannot apply to tip/perf/core acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steinar-H-Gunderson/perf-annotate-split-out-read_symbol/20240527-022403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240526182212.544525-3-sesse%40google.com
patch subject: [PATCH v7 3/4] perf annotate: LLVM-based disassembler
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311907.PGE34stU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405311907.PGE34stU-lkp@intel.com/

All errors (new ones prefixed by >>):

     PERF_VERSION = 6.9.g7df755062682
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
7df755062682af Steinar H. Gunderson 2024-05-26  1614  #ifdef HAVE_LIBLLVM_SUPPORT
7df755062682af Steinar H. Gunderson 2024-05-26 @1615  #include <llvm-c/Disassembler.h>
7df755062682af Steinar H. Gunderson 2024-05-26  1616  #include <llvm-c/Target.h>
7df755062682af Steinar H. Gunderson 2024-05-26  1617  #include "util/llvm-c-helpers.h"
7df755062682af Steinar H. Gunderson 2024-05-26  1618  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

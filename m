Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E910C143739
	for <oe-kbuild@lists.linux.dev>; Thu, 30 May 2024 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717049674; cv=none; b=V3LdAOmQKrWv1BwmGDzsqJDo37cvfhX1FvdN2HvggEy5cZd+bo9OrSo9QqI4AtMuaV0kyTeLKRTh6MoXHnDxZFte+T96NH1PTCGrjaUQkT+R/t4Mp5MG3QH4HDYVwie29uq4OSsS0I24xAzBqYIDzMQhtDxUYiQeQLEh2uth3m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717049674; c=relaxed/simple;
	bh=dHG0301aZnbIKcY4zA5Cy1h/xrwO/idGPQX0zItuJds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V4T4xOs+Xl0z/kLro9DD6B5zWn82vktpD+wHZIwweLTxvuq5L2GMeWxk1S29LIeCCV0EvFgdweiDwMY7Ewkw4iQmE+3vGhERQZ7iSeSBsYiALnUzwrx+o4TRu3sE2kNOf5fjU57UIwya7cpKCf5w0Ch6HRWX+cOBxt7pmKhP2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9sYi/My; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9sYi/My"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717049672; x=1748585672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dHG0301aZnbIKcY4zA5Cy1h/xrwO/idGPQX0zItuJds=;
  b=P9sYi/MywkRhioO0fki8rwml1WhXBokCJ2oNSTsgKkvHnWWf3j6ufGGj
   DR4MHDj+Wcq8+2U6H7K7JNDV/yCV3CmWTYi7wvbcia7Ou5Idw9CRWCbxU
   XQEnqGc5/Cb/2A11czPKok3sZcTMEnw9JaphyX3NBaJAPqBnt9osVKsUT
   x/Gh5xowtMY6RWWrM8hALM0Sf5UxkC6npNBsDOqTm5lOuoHvbmxDg6waX
   5OdZGTyKePt8JZiSrKbSsJyg63b6FTHXt2NXTk4nZOsw3780WdmcMG2uR
   SWi+2aFfniVgrtybeCnPbPxI759TfvXWUQFCu03j3Qws73i2i3wbfiYsN
   w==;
X-CSE-ConnectionGUID: DyDoJh6gRhKlgcCUiQP/gg==
X-CSE-MsgGUID: m54KUmlwRgKx2t8+JkSJHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13323569"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13323569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 23:14:31 -0700
X-CSE-ConnectionGUID: DsYpvHijSjiL7dWk9wav1g==
X-CSE-MsgGUID: h/wqrO0jS3ih5K95dZtW8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40604685"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2024 23:14:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCZ3T-000Erw-2c;
	Thu, 30 May 2024 06:14:27 +0000
Date: Thu, 30 May 2024 14:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 3/4] perf annotate: LLVM-based disassembler
Message-ID: <202405301329.xNbT7amb-lkp@intel.com>
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
[also build test ERROR on perf-tools/perf-tools linus/master v6.10-rc1 next-20240529]
[cannot apply to tip/perf/core acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steinar-H-Gunderson/perf-annotate-split-out-read_symbol/20240527-022403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240526182212.544525-3-sesse%40google.com
patch subject: [PATCH v7 3/4] perf annotate: LLVM-based disassembler
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301329.xNbT7amb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405301329.xNbT7amb-lkp@intel.com/

All errors (new ones prefixed by >>):

     PERF_VERSION = 6.9.g7df755062682
>> util/disasm.c:1615:10: fatal error: 'llvm-c/Disassembler.h' file not found
    1615 | #include <llvm-c/Disassembler.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/disasm.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
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

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C71208CE
	for <oe-kbuild@lists.linux.dev>; Sat, 25 May 2024 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716631088; cv=none; b=QrrjuzK1Fffbyr3AcESau+40pogtyFpzNr1LIjIwuGH/fRFuRgr6LFuV6YfF5nevHejmBfcl013131AjJuEHfgFnoY+M2drsvSDB++Rpt+nfgSUhYGKr8sccykSqlZb5iH+9SKTzaBwoaI8RCNmNdzdmnkuI0V3j3RaJIA3lzjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716631088; c=relaxed/simple;
	bh=VeiusOjGcIYCfVOOSg49+iOkLRTEoTPi+EgsA2fGayM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cB/mmPIWxnCIpRzOW8pvXViWLgVOOxp/DmSg8FeYmfRNqpwIVE4nNYYV9v2fGkqhX+MuLjHpf0eLgI6eWZ7LuVzAlzohvgJcljaowGL8a8Fj2qHOmqidFrMIQ0IQSYOOsm55a1cMrREaW5U3jYbXinqqrkXoaWXSb0iz7rLtaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ah7kPIY9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ah7kPIY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716631086; x=1748167086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VeiusOjGcIYCfVOOSg49+iOkLRTEoTPi+EgsA2fGayM=;
  b=Ah7kPIY9TlzFt61kH5b/J0ljklvAbWHxudA3lMBCspPXC9v85mFhfjXd
   S/V25hqB7eT3tntGzwFAtVCV7YNIU6XdqRV9GbVMm576SUwXKiWLvFdlm
   aDq/y8IUma6gtn786WRL4XjNtJnftwz+7CH4WHZNGb0lAUhiuPvaADVPM
   xcht2dJpkl1KpI0sldjmaSAQBHUh59iAXbYDbXoO3dBM1Ye2kZmHGaZep
   JuiWwMqwRVvTJEkG7o9GL5QEJkn0rDkuTKIi7iGBZbEiSEjSanSy2O6QD
   U20OVPV/RVRX3PgbGQ0MOSrj16zK1G/HP7BTkiOZrAz/x3RbZg81DDaj0
   w==;
X-CSE-ConnectionGUID: 89upg/TdQc29xt3SUWiAaA==
X-CSE-MsgGUID: b2ccZpn4TOmhdM/DvvKuYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24133136"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="24133136"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 02:58:05 -0700
X-CSE-ConnectionGUID: S8F02XA8Tv2IHg5hciasxg==
X-CSE-MsgGUID: 7uosqAUsR2yNmq5s2/mgCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="34358612"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 May 2024 02:58:04 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAoA6-0006nP-1C;
	Sat, 25 May 2024 09:58:02 +0000
Date: Sat, 25 May 2024 17:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 3/3] perf annotate: LLVM-based disassembler
Message-ID: <202405251724.FOc34lcz-lkp@intel.com>
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
In-Reply-To: <20240523092920.3355004-3-sesse@google.com>
References: <20240523092920.3355004-3-sesse@google.com>
TO: "Steinar H. Gunderson" <sesse@google.com>
TO: acme@kernel.org
CC: linux-perf-users@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: irogers@google.com
CC: "Steinar H. Gunderson" <sesse@google.com>

Hi Steinar,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on perf-tools/perf-tools linus/master next-20240523]
[cannot apply to tip/perf/core acme/perf/core v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steinar-H-Gunderson/perf-annotate-split-out-read_symbol/20240523-173421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240523092920.3355004-3-sesse%40google.com
patch subject: [PATCH v5 3/3] perf annotate: LLVM-based disassembler
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405251724.FOc34lcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405251724.FOc34lcz-lkp@intel.com/

All errors (new ones prefixed by >>):

     PERF_VERSION = 6.9.gebd624d5c07b
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
ebd624d5c07b19 Steinar H. Gunderson 2024-05-23  1614  #ifdef HAVE_LLVM_SUPPORT
ebd624d5c07b19 Steinar H. Gunderson 2024-05-23 @1615  #include <llvm-c/Disassembler.h>
ebd624d5c07b19 Steinar H. Gunderson 2024-05-23  1616  #include <llvm-c/Target.h>
ebd624d5c07b19 Steinar H. Gunderson 2024-05-23  1617  #include "util/llvm-c-helpers.h"
ebd624d5c07b19 Steinar H. Gunderson 2024-05-23  1618  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

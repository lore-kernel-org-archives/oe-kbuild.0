Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD71BE71
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 18:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723400716; cv=none; b=beRKMSOf14y7LuR9UNMSd87YnyOm7EW21Lr0X/bI9/kE9FwE9SwIwdJ4Wh5CHJX9avXfRPPjDFquuoaMysY5LELvaPOb1CAfwqzY+wJEFYYJZLE0Pfnvv2UTpYgoJ18UTSIGoX+gXo6+E1bjDqfqpSeqBgvPNrXxY3nyU8fg4vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723400716; c=relaxed/simple;
	bh=gIkKNdqtNy4V/MAqHX5yRqED8PAKY6wiJrgopsnSTjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DB8agSA8uxRw0WoS63i6s1AVMXBwKwCUiHDh7ceRBrIHtXXf1JzZR8UXmXUtXjcNVDihAa+WyWmoOZzosmDf1vtpSP9duxnpMHX/lOja/380sZdH9aVkHfEBeK5PVvyaTAJU549ouWWKEXuCI8fKoJIB7VBPKp4UXbXI3J1Bzho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTO2rG+D; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTO2rG+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723400714; x=1754936714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gIkKNdqtNy4V/MAqHX5yRqED8PAKY6wiJrgopsnSTjA=;
  b=nTO2rG+Dm89yPELZvaqyy6wNjq+aCp0FaURlsVjCNuqxCCCmLAdNIeaT
   OCJ4z/NP9cjiaw6BSq5uTdxPh3QVB+guSJ5N2NjKuJIGRUwhLNiSS2bs9
   xVJnFadIE3RPBRje3JjUb80r0JSPwOnA/9jSZlhGaAuEo9bcAjtNpVgUs
   3tqco0CDhzBUhPtCVHsV8U25eREIIwljRtSKpDu7JO36aMcrcbVX2s2o5
   ytyNgaYbvorBoopu8OEiudoOlHGJRsm99jx6ZjEOCsqiFC8/JoZsre2z9
   de+FpAJ00i3ABZKULd3JJfC1+hh3bHGsPmSRI4j+yrdKyT052tlcm6nLQ
   g==;
X-CSE-ConnectionGUID: pSlJLLTzSuGG9JI4rZsFWA==
X-CSE-MsgGUID: N4ErAaDLQXKRYpA5CODrWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21164360"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21164360"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 11:25:14 -0700
X-CSE-ConnectionGUID: i861OZmWR7GnCbNhGOVObw==
X-CSE-MsgGUID: 4XDkWhvtQs6Kpt7D8famHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="62450521"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Aug 2024 11:25:13 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdDFe-000B2x-3D;
	Sun, 11 Aug 2024 18:25:11 +0000
Date: Mon, 12 Aug 2024 02:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] perf lock contention: Change stack_id type to s32
Message-ID: <202408120233.2JuKgpj9-lkp@intel.com>
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
In-Reply-To: <20240810191704.1948365-1-namhyung@kernel.org>
References: <20240810191704.1948365-1-namhyung@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Kan Liang <kan.liang@linux.intel.com>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Adrian Hunter <adrian.hunter@intel.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>
CC: linux-perf-users@vger.kernel.org
CC: Dan Carpenter <error27@gmail.com>

Hi Namhyung,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.11-rc2 next-20240809]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namhyung-Kim/perf-lock-contention-Change-stack_id-type-to-s32/20240811-031933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240810191704.1948365-1-namhyung%40kernel.org
patch subject: [PATCH] perf lock contention: Change stack_id type to s32
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120233.2JuKgpj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408120233.2JuKgpj9-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc2.gcbe444bb08ed
   In file included from util/bpf_skel/lock_contention.bpf.c:9:
>> util/bpf_skel/lock_data.h:10:2: error: unknown type name 's32'; did you mean 'u32'?
      10 |         s32 stack_id;
         |         ^~~
         |         u32
   util/bpf_skel/vmlinux.h:17:15: note: 'u32' declared here
      17 | typedef __u32 u32;
         |               ^
   In file included from util/bpf_skel/lock_contention.bpf.c:9:
   util/bpf_skel/lock_data.h:14:2: error: unknown type name 's32'; did you mean 'u32'?
      14 |         s32 stack_id;
         |         ^~~
         |         u32
   util/bpf_skel/vmlinux.h:17:15: note: 'u32' declared here
      17 | typedef __u32 u32;
         |               ^
   2 errors generated.
   make[5]: *** [Makefile.perf:1247: tools/perf/util/bpf_skel/.tmp/lock_contention.bpf.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2


vim +10 tools/perf/util/bpf_skel/lock_data.h

fd507d3e359c7e Namhyung Kim 2022-12-09   5  
b44d6653685939 Namhyung Kim 2024-02-27   6  struct tstamp_data {
b44d6653685939 Namhyung Kim 2024-02-27   7  	u64 timestamp;
b44d6653685939 Namhyung Kim 2024-02-27   8  	u64 lock;
b44d6653685939 Namhyung Kim 2024-02-27   9  	u32 flags;
cbe444bb08ed25 Namhyung Kim 2024-08-10 @10  	s32 stack_id;
b44d6653685939 Namhyung Kim 2024-02-27  11  };
b44d6653685939 Namhyung Kim 2024-02-27  12  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

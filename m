Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976E21BF3F
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Jun 2024 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717331894; cv=none; b=WTNJv3MW6SemHBCGHrAPpkIkT1rsGI5BScaH5eCAYNt3Zcr5iu/na7H1+qNKIijUNpWFf5nHdQYxmrkf5RyEsEKCT3RWCyz/X5ylhEWkHZt5lWQHOQElhcWPoRSCGZ7631QKXLUGlHJ6NP+1wOLJoY+UPpdGOs3DwLjRkR75EK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717331894; c=relaxed/simple;
	bh=ILAw2imkBuCFzE0mXy/Ksth2hXJiqmYxan6xMuBST4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LXWEXKkIBugxuN6bo4kyyUUL8ZuJNNYWIJVacfQ3IU5PDGY8xYJH9274HD4vQ5jAYlFdjeGXvB4byFM/ZBOGytIQg42Kj8/zV0kUx8B9PQcofZ4kVw9egjA99w2RvXZj/OrvkqeFp029Ze/X5cxya1LkR1l06vzOiXI7+O6NHfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBmADb44; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBmADb44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717331892; x=1748867892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILAw2imkBuCFzE0mXy/Ksth2hXJiqmYxan6xMuBST4Y=;
  b=NBmADb4439enrXVNI69GhlYP3Y35APBKErMGHGKtpsEmeTk4Wp8wPZj2
   +2sQgW/oWaOSZRbnKrsbdE1RsUt6+nxLruyBwmXTvCnQ+zth8PUsWd1S5
   5xa/pWQKEciXJ77cUwXL4oZ9xw7A4cRah0iwa5/hc4CMsRkADOR6A8Un3
   9ospz8LKyECWNYaTyBBODt3y7lwyC2lzBZj0jHFexe4vBBF+4EU4H9bkg
   bzV0aq4Y/Aju3BcZvTZnDXGw1DBdSQR4nAdnxldk2VAxJJLMo7M3N8GhM
   harS7ajkTEzJ3fU8+PddKWJO3oemMyVOLgfVUsei+6zzh4mQk+iJw6NHS
   Q==;
X-CSE-ConnectionGUID: MYYibdnnSQGdx7xledvxLQ==
X-CSE-MsgGUID: mSiIMy6tRq2+jZNFScl/3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24488615"
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; 
   d="scan'208";a="24488615"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 05:38:11 -0700
X-CSE-ConnectionGUID: zTDHXBMJQFSI1LO+7KAyxw==
X-CSE-MsgGUID: /v2rlnX+RDGPmYoOC89TOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; 
   d="scan'208";a="36715490"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2024 05:38:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDkTK-000K0J-2G;
	Sun, 02 Jun 2024 12:38:07 +0000
Date: Sun, 2 Jun 2024 20:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V7 08/12] perf tools: Parse aux-action
Message-ID: <202406022020.WJ2gdPJF-lkp@intel.com>
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
In-Reply-To: <20240531055731.12541-9-adrian.hunter@intel.com>
References: <20240531055731.12541-9-adrian.hunter@intel.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Heiko Carstens <hca@linux.ibm.com>
CC: Thomas Richter <tmricht@linux.ibm.com>
CC: Hendrik Brueckner <brueckner@linux.ibm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Mike Leach <mike.leach@linaro.org>
CC: James Clark <james.clark@arm.com>
CC: coresight@lists.linaro.org
CC: linux-arm-kernel@lists.infradead.org
CC: Yicong Yang <yangyicong@hisilicon.com>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: Will Deacon <will@kernel.org>
CC: Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Namhyung Kim <namhyung@kernel.org>
CC: Ian Rogers <irogers@google.com>
CC: Andi Kleen <ak@linux.intel.com>
CC: linux-kernel@vger.kernel.org
CC: linux-perf-users@vger.kernel.org

Hi Adrian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on perf-tools/perf-tools linus/master v6.10-rc1 next-20240531]
[cannot apply to tip/perf/core acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Hunter/perf-core-Add-aux_pause-aux_resume-aux_start_paused/20240531-140321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240531055731.12541-9-adrian.hunter%40intel.com
patch subject: [PATCH V7 08/12] perf tools: Parse aux-action
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406022020.WJ2gdPJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406022020.WJ2gdPJF-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:663: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.10.rc1.g6ea7cd12e2e5
>> util/auxtrace.c:821:7: error: missing field 'aux_action' initializer [-Werror,-Wmissing-field-initializers]
     821 |         {NULL},
         |              ^
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/auxtrace.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

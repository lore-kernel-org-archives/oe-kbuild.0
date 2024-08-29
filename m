Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C897515AAB6
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724962001; cv=none; b=F04cwUCXpIOVYQm8lmdCEu7PCdxlNtllpMdeu1d3FXEwE1uwXGXdlT68+D0a3wr13XZDYX201W3L7WQBN6LzkkQqJM8EQPKi5WUKKjMqBWuWNhoOfqnaFg9GxvcEFBhYW26I+/FJOj6UitOppTsswg1h6BL+nZbly5gSp8go0ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724962001; c=relaxed/simple;
	bh=7VX7hP8AeY++b/OkKWL+DOfOlLRy/0cSDQZURbIhh4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AqTbFV8w6F6noqZfzB352FjzV4MSg8N2P74ZWQ8s3FcsCy+BZCZ7B72c3x4Q3OugMGF/URaBf089g1e54ZKfSHm2LMHP97rv4FBF8AnRH6lH1karC48Y4OtBVqIrhkPpljlW0svm88QHQRECdWvChcvYipng4kd0IXAgzmGpwfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kl+cJk2U; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kl+cJk2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724961999; x=1756497999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7VX7hP8AeY++b/OkKWL+DOfOlLRy/0cSDQZURbIhh4g=;
  b=Kl+cJk2UBz05acfx/+OqqYkuMkpLj1ppy+sn4ijfj73YUOc8QYBmnwj/
   FtHB0U4mgnjY4YiLIpRcUYHwOTcgaCJdWKffwPam9ozr9EfvW/Iu3QTdD
   QpdZWwlnxj843eD/zHluYs46DJ6mOnlA4KMwsFZKmMKdnZpxl0/WKOK9Z
   o5hbxiIeoU4nTJVDaHFQwU0O6mMC7o6/g7CA+kys+d2w55U4XADilkMoa
   p+OoK/ZFcTEBxg21MaPFO0VQNwjivCNuAZ/EglVLx56YXoex3zMtTKCCr
   FAnGKg/AyMQDDQysuu7JWGAVN32h+uDqoBL+rpczdgdYP69iWMpUQCRrt
   Q==;
X-CSE-ConnectionGUID: e+KgdTO7RcSzNm/uPByLNA==
X-CSE-MsgGUID: ON1+sZBZSRWN8HVgbW7sZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27460953"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="27460953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 13:06:38 -0700
X-CSE-ConnectionGUID: Nwb5Ke2RTcyKxDhT91/tPg==
X-CSE-MsgGUID: QFBSDjnXROup63MVoo7iBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="94508096"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Aug 2024 13:06:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjlPf-0000gw-0k;
	Thu, 29 Aug 2024 20:06:35 +0000
Date: Fri, 30 Aug 2024 04:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] libperf: Add perf_evsel__id() function
Message-ID: <202408300351.twD2Wj7F-lkp@intel.com>
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
In-Reply-To: <20240823-perf_evsel_get_id-v1-1-0ffa204c4164@rivosinc.com>
References: <20240823-perf_evsel_get_id-v1-1-0ffa204c4164@rivosinc.com>
TO: Charlie Jenkins <charlie@rivosinc.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: linux-perf-users@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Charlie Jenkins <charlie@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on 47ac09b91befbb6a235ab620c32af719f8208399]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/libperf-Add-perf_evsel__id-function/20240826-143619
base:   47ac09b91befbb6a235ab620c32af719f8208399
patch link:    https://lore.kernel.org/r/20240823-perf_evsel_get_id-v1-1-0ffa204c4164%40rivosinc.com
patch subject: [PATCH] libperf: Add perf_evsel__id() function
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408300351.twD2Wj7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408300351.twD2Wj7F-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc4.gfb323f1b6522
>> evsel.c:493:57: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'void *' [-Wint-conversion]
     493 |                 err = perf_evsel__run_ioctl(evsel, PERF_EVENT_IOC_ID, (unsigned long)id, i);
         |                                                                       ^~~~~~~~~~~~~~~~~
   evsel.c:427:22: note: passing argument to parameter 'arg' here
     427 |                                  int ioc,  void *arg,
         |                                                  ^
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/libperf/evsel.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [Makefile:122: tools/perf/libperf/libperf-in.o] Error 2
   make[5]: *** [Makefile.perf:961: tools/perf/libperf/libperf.a] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:290: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

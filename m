Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6858014294
	for <oe-kbuild@lists.linux.dev>; Mon,  6 May 2024 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714975578; cv=none; b=E3X4bK3GLf+fLsXZMeeXRnwl8y1/yt6n3qVip078+eUUrH3ZGOhocq99LT1ssMIsdtnKBE3H5HKWdMzeiBFCpJI+G9R9wX1AHK12IF2s9PrXD6aWk2Gk0mKdpDxgs99KVFnCwfqA7J3zij6IGeJy4cg/REj9lwOk5qH813KPekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714975578; c=relaxed/simple;
	bh=reLSYbBiMFvMZV3L7qPD8HJSc+GemXY2Z0X/ywMJtbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OodrK+DEn/NePUCrak5gke+GGMaX4iSlcjpjQ0D2K2NoBYn4wybExXxwRn8rsPM/18ErqT6yU3FRue1K4BFweEH1w60gRuX2ycblmOtVOAUaquy2HnMSxpRWH7GVHch4nePmW7awHzH32Vjl7bhgpza2a/Z+ir87ddFJK1g/MMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWb8ffuQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWb8ffuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714975576; x=1746511576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=reLSYbBiMFvMZV3L7qPD8HJSc+GemXY2Z0X/ywMJtbQ=;
  b=mWb8ffuQdqm1LyxcIY27Knmnm9By5OOveeazG8Vvn98KIHx8ILWwc0u5
   oQ9xJ8he4vjRERwykg4l89qzTRwMhHIWQWrAr04SXqxbVYTv7A/rpbFS9
   p3UKP8lWF0TpxEM3Js/CNAvOxwjq37w2KpcEkjyHDmT5B7WIjTnQryxyV
   1z7+J9RUgGzqDXkrWzUatEo3BCbATbwueeF3vhcbchbN3vyEf/+GMJAHr
   qu8jlwNraI1EvrjdwbyXIt9FXkqSD3369cCgeJI99/9Z6NJ5VK4hWX2pF
   Lhc2JHtXLWyNbrDKgzlNduM9q2i6nyxQ3fEqSbDAa3+nx/mif5abPQG0g
   Q==;
X-CSE-ConnectionGUID: KHsJy4bzRrGFboe3STUxKA==
X-CSE-MsgGUID: 0+Pcane/QVevzQ2LBZ7+VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="13651572"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="13651572"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 23:06:16 -0700
X-CSE-ConnectionGUID: cpu4KNN0TJKypPgXrECGGw==
X-CSE-MsgGUID: DzmfGyaOQVGka4glRP7UlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32669925"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2024 23:06:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3rUK-0000V1-2H;
	Mon, 06 May 2024 06:06:12 +0000
Date: Mon, 6 May 2024 14:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/2] perf pmus: Sort/merge/aggregate PMUs like
 mrvl_ddr_pmu
Message-ID: <202405061357.4RZaM8jd-lkp@intel.com>
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
In-Reply-To: <20240505031624.299361-2-irogers@google.com>
References: <20240505031624.299361-2-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Thomas Richter <tmricht@linux.ibm.com>
TO: Bhaskara Budiredla <bbudiredla@marvell.com>
TO: Bharat Bhushan <bbhushan2@marvell.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Kan Liang <kan.liang@linux.intel.com>
TO: James Clark <james.clark@arm.com>
TO: Ravi Bangoria <ravi.bangoria@amd.com>
TO: linux-perf-users@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: Will Deacon <will@kernel.org>
TO: Stephane Eranian <eranian@google.com>

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on next-20240503]
[cannot apply to tip/perf/core acme/perf/core linus/master v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-pmus-Sort-merge-aggregate-PMUs-like-mrvl_ddr_pmu/20240505-111807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240505031624.299361-2-irogers%40google.com
patch subject: [PATCH v3 1/2] perf pmus: Sort/merge/aggregate PMUs like mrvl_ddr_pmu
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405061357.4RZaM8jd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405061357.4RZaM8jd-lkp@intel.com/

All errors (new ones prefixed by >>):

     PERF_VERSION = 6.9.rc5.g7926653c7be8
   util/pmus.c: In function 'pmu_name_cmp':
>> util/pmus.c:67:19: error: 'strncmp' specified bound [18446744071562067968, 18446744073709551615] exceeds maximum object size 9223372036854775807 [-Werror=stringop-overread]
      67 |         int ret = strncmp(lhs_pmu_name, rhs_pmu_name,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      68 |                         lhs_pmu_name_len < rhs_pmu_name_len ? lhs_pmu_name_len : rhs_pmu_name_len);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/pmus.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

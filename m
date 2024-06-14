Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829319D8A2
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jun 2024 21:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718399366; cv=none; b=ruelshBgmRdJO1rBHjAoZgk34dA1d0vnQF/+apE6qT5/HHZLUBe4P+KQcFY9ojLnwwsFaZTVUnXpee/AA6B+ZUPQbSYSI/xgwvjq7c3Ruc0BHRsJFk20llKOdw/9YbZ5RY1zB+FBzkmCthE7e3AqE5o/PbactJ64o8fVPMx5KOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718399366; c=relaxed/simple;
	bh=vyhRpyChTd5rZJE+Tar8bNEyuJ+Kz8s7++WnDSuR5Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=saV9GJXZv4NcgpOfYKE5c6q0IG2ZoY07NAXyEBwQ3mgCpxIQpFHQ6GxDKswt28govWhPpato+gype2oYbf8zL9QhrnAAKQelfxOpMw1b1LYnn/gEyIgKgoQl4j3ckvaP+pwkp8ew11s5uTY42VYAwfxAUnP8H+zsUByJaeCy6HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCSxtC1h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCSxtC1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718399365; x=1749935365;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vyhRpyChTd5rZJE+Tar8bNEyuJ+Kz8s7++WnDSuR5Jo=;
  b=NCSxtC1h1gZPDgr5tq1EgvYIBEAfBeZV6y60AljtRJst8dj5qSaFYZ0C
   BbBVNW0PRCwGNlydJ8JCJ4igwKbtfh9/FCTdNlp9vKYSd1dFpURrKqzNg
   GzcDuh7hYtAbpNHZ799Jgcc5FUJRtJO1y4OgYBfU4XOSX1RGAUiLGkBvZ
   hbDPpU0C6XtcAtz3YCG4/nQmubeOrxhuar79bc11WQPGKdh5U87BRY1eh
   zOYrjOWxxpVVMf1/o2nGrrdowFPOwdytsp2GS+WYmjecH66ptrvlX2VqG
   E8irtua3rLIwDBrggezDq6gn5HKWoHG50DgXwLz1xepQ2T7yjlzULbYsW
   g==;
X-CSE-ConnectionGUID: wsezTz2VTNKp6p3fye4CaA==
X-CSE-MsgGUID: XgLXow5KQtSQPWMbsV3w6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15141713"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="15141713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 14:09:24 -0700
X-CSE-ConnectionGUID: 8bDFvs34RiOiEnmkJH3oLw==
X-CSE-MsgGUID: xb5EGorPQRuvmYfH7i3pNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="78095561"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Jun 2024 14:09:23 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIEAi-0001nb-2S;
	Fri, 14 Jun 2024 21:09:20 +0000
Date: Sat, 15 Jun 2024 05:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 5/7] perf util: Make util its own library
Message-ID: <202406150436.AJgQVdTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240612183205.3120248-6-irogers@google.com>
References: <20240612183205.3120248-6-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
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
TO: John Garry <john.g.garry@oracle.com>
TO: Will Deacon <will@kernel.org>
TO: James Clark <james.clark@arm.com>
TO: Mike Leach <mike.leach@linaro.org>
TO: Leo Yan <leo.yan@linux.dev>
TO: Guo Ren <guoren@kernel.org>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Suzuki K Poulose <suzuki.poulose@arm.com>
TO: Yicong Yang <yangyicong@hisilicon.com>
TO: Jonathan Cameron <jonathan.cameron@huawei.com>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Alex Gaynor <alex.gaynor@gmail.com>
TO: Wedson Almeida Filho <wedsonaf@gmail.com>
TO: Boqun Feng <boqun.feng@gmail.com>
TO: Gary Guo <gary@garyguo.net>
TO: "Björn Roy Baron" <bjorn3_gh@protonmail.com>
TO: Benno Lossin <benno.lossin@proton.me>
TO: Andreas Hindborg <a.hindborg@samsung.com>

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on perf-tools/perf-tools linus/master v6.10-rc3 next-20240613]
[cannot apply to tip/perf/core acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-ui-Make-ui-its-own-library/20240613-023829
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240612183205.3120248-6-irogers%40google.com
patch subject: [PATCH v1 5/7] perf util: Make util its own library
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150436.AJgQVdTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406150436.AJgQVdTY-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:663: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.10.rc1.g945b0a0ee11f
>> ld.lld: error: target emulation unknown: -m or at least one .o file required
   make[7]: *** [tools/build/Makefile.build:164: tools/perf/arch/perf-in.o] Error 1
   make[6]: *** [tools/build/Makefile.build:158: arch] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:742: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

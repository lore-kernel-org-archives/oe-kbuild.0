Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F250C13B580
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271494; cv=none; b=G1scqKUrcUguqijOla9oh2qcWST7h3Qbah1aQrg6ed0Jf5hmgqOq2gOYQOEFEuGNuqGyPe8N00ptxVext7gnIoNU/O0RgZbPUaCgUTBT4GAN6KyEPHrnPIJFj/hAqxcJSaYy+M+JG2h1EJ/QSv1GEutB/gslvL39pND4ZkymjX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271494; c=relaxed/simple;
	bh=0dHjnj7WbsQfraGP0XoiSFSeJFmuP4va/Tlf9rbYwA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GgDPupt84iA4GYzfsC0W96HimVHlMIfObGs7NNJKI2KZw+0Fzzkj/LV+VZrFFTZv+9qCSDNov14X2RU7rL0axap4MZboCy1iWWchhJSOHgjEEoxqwSe3RaYJJa3v2dI/Z2R54WwZR+XBq1U7W3U0d6Mbr30jlABBD+qHGJOvKHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8FbGzAS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8FbGzAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725271492; x=1756807492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0dHjnj7WbsQfraGP0XoiSFSeJFmuP4va/Tlf9rbYwA0=;
  b=O8FbGzASh8BzbTC7p5cCOFd8MnyKE0tHqMJLNzwf6y2GcTCp1CHYwMjo
   6BoDocuy62BI1TIwvwX95fbJeDDPj0Qo4qBwYl/DgYtbYr1vKssEu82m9
   WNDUx2Dm3W46xogjLL8kVx8OoafaNbqqT7UCHyGD4ncJCymTA1hT6WKNg
   HHcVl+AOZeL68JEqwXLU5iYLxSB0XBkwdsUassec58iUTOw6aPB3OZaSk
   LUPScTR1u+1WMZFYSQkLgxoOra1W12CGN+9sTPuD2SzOc9X9nWP7pDtHc
   /b27X/g44/X+FgvHna7TruOcxjIFFvVx2gnzFwQyQkvsVVtcOQ2oPKnIR
   g==;
X-CSE-ConnectionGUID: 7AeUbWX9Qve04mxlxZKiEg==
X-CSE-MsgGUID: tdpoHEnnQByZsSVEEDTuOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="26748284"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="26748284"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 03:04:51 -0700
X-CSE-ConnectionGUID: nWM1uHPXRZi8EJFJE2JNUg==
X-CSE-MsgGUID: /BPDWPFXSLqQ4kDoKtVhSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64601751"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2024 03:04:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl3vU-0005L2-0o;
	Mon, 02 Sep 2024 10:04:48 +0000
Date: Mon, 2 Sep 2024 18:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 4/6] perf parse-events: Add default_breakpoint_len
 helper
Message-ID: <202409021757.lo8IJN6Z-lkp@intel.com>
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
In-Reply-To: <20240831070415.506194-5-irogers@google.com>
References: <20240831070415.506194-5-irogers@google.com>
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
TO: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
TO: Dominique Martinet <asmadeus@codewreck.org>
TO: Yang Jihong <yangjihong@bytedance.com>
TO: Colin Ian King <colin.i.king@gmail.com>
TO: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
TO: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
TO: James Clark <james.clark@linaro.org>
TO: John Garry <john.g.garry@oracle.com>
TO: Junhao He <hejunhao3@huawei.com>
TO: David Ahern <dsa@cumulusnetworks.com>
TO: linux-perf-users@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.11-rc6 next-20240830]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-pmus-Fix-name-comparisons-on-32-bit-systems/20240831-150738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240831070415.506194-5-irogers%40google.com
patch subject: [PATCH v1 4/6] perf parse-events: Add default_breakpoint_len helper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021757.lo8IJN6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409021757.lo8IJN6Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc3.gb501bb09c1c6
   tests/bp_signal.c: In function '__event':
>> tests/bp_signal.c:115:28: error: operand of '?:' changes signedness from 'int' to 'long unsigned int' due to unsignedness of other operand [-Werror=sign-compare]
     115 |         pe.bp_len = is_x ? default_breakpoint_len() : sizeof(long);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
   tests/bp_account.c: In function '__event':
>> tests/bp_account.c:54:31: error: operand of '?:' changes signedness from 'int' to 'long unsigned int' due to unsignedness of other operand [-Werror=sign-compare]
      54 |         attr->bp_len = is_x ? default_breakpoint_len() : sizeof(long);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/tests/bp_signal.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/tests/bp_account.o] Error 1
   make[6]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[5]: *** [Makefile.perf:777: tools/perf/perf-test-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2


vim +115 tools/perf/tests/bp_signal.c

5a6bef47b41867 Jiri Olsa                2013-03-10  102  
1ad826bad5bd0b Arnaldo Carvalho de Melo 2016-02-12  103  static int __event(bool is_x, void *addr, int sig)
5a6bef47b41867 Jiri Olsa                2013-03-10  104  {
5a6bef47b41867 Jiri Olsa                2013-03-10  105  	struct perf_event_attr pe;
5a6bef47b41867 Jiri Olsa                2013-03-10  106  	int fd;
5a6bef47b41867 Jiri Olsa                2013-03-10  107  
5a6bef47b41867 Jiri Olsa                2013-03-10  108  	memset(&pe, 0, sizeof(struct perf_event_attr));
5a6bef47b41867 Jiri Olsa                2013-03-10  109  	pe.type = PERF_TYPE_BREAKPOINT;
5a6bef47b41867 Jiri Olsa                2013-03-10  110  	pe.size = sizeof(struct perf_event_attr);
5a6bef47b41867 Jiri Olsa                2013-03-10  111  
5a6bef47b41867 Jiri Olsa                2013-03-10  112  	pe.config = 0;
8fd34e1cce180e Wang Nan                 2016-01-25  113  	pe.bp_type = is_x ? HW_BREAKPOINT_X : HW_BREAKPOINT_W;
8fd34e1cce180e Wang Nan                 2016-01-25  114  	pe.bp_addr = (unsigned long) addr;
b501bb09c1c66d Ian Rogers               2024-08-31 @115  	pe.bp_len = is_x ? default_breakpoint_len() : sizeof(long);
5a6bef47b41867 Jiri Olsa                2013-03-10  116  
5a6bef47b41867 Jiri Olsa                2013-03-10  117  	pe.sample_period = 1;
5a6bef47b41867 Jiri Olsa                2013-03-10  118  	pe.sample_type = PERF_SAMPLE_IP;
5a6bef47b41867 Jiri Olsa                2013-03-10  119  	pe.wakeup_events = 1;
5a6bef47b41867 Jiri Olsa                2013-03-10  120  
5a6bef47b41867 Jiri Olsa                2013-03-10  121  	pe.disabled = 1;
5a6bef47b41867 Jiri Olsa                2013-03-10  122  	pe.exclude_kernel = 1;
5a6bef47b41867 Jiri Olsa                2013-03-10  123  	pe.exclude_hv = 1;
5a6bef47b41867 Jiri Olsa                2013-03-10  124  
57480d2cd93579 Yann Droneaud            2014-06-30  125  	fd = sys_perf_event_open(&pe, 0, -1, -1,
57480d2cd93579 Yann Droneaud            2014-06-30  126  				 perf_event_open_cloexec_flag());
5a6bef47b41867 Jiri Olsa                2013-03-10  127  	if (fd < 0) {
5a6bef47b41867 Jiri Olsa                2013-03-10  128  		pr_debug("failed opening event %llx\n", pe.config);
5a6bef47b41867 Jiri Olsa                2013-03-10  129  		return TEST_FAIL;
5a6bef47b41867 Jiri Olsa                2013-03-10  130  	}
5a6bef47b41867 Jiri Olsa                2013-03-10  131  
5a6bef47b41867 Jiri Olsa                2013-03-10  132  	fcntl(fd, F_SETFL, O_RDWR|O_NONBLOCK|O_ASYNC);
1ad826bad5bd0b Arnaldo Carvalho de Melo 2016-02-12  133  	fcntl(fd, F_SETSIG, sig);
5a6bef47b41867 Jiri Olsa                2013-03-10  134  	fcntl(fd, F_SETOWN, getpid());
5a6bef47b41867 Jiri Olsa                2013-03-10  135  
5a6bef47b41867 Jiri Olsa                2013-03-10  136  	ioctl(fd, PERF_EVENT_IOC_RESET, 0);
5a6bef47b41867 Jiri Olsa                2013-03-10  137  
5a6bef47b41867 Jiri Olsa                2013-03-10  138  	return fd;
5a6bef47b41867 Jiri Olsa                2013-03-10  139  }
5a6bef47b41867 Jiri Olsa                2013-03-10  140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9BC8E3
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686413329; x=1717949329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xssCuGil2PmXZqKusb4FYhimXWul7s/zE41tasaY2YU=;
  b=EAgySZJGw2XpuLx1mZeW+8e2v4KkaHsFk7b9UNF2TFidikpcVll8ICBa
   WAyYbhfp39dKs5WMDvNUQVsInjHr5+xhMX15wb17BpMJc75kHInlgoKMS
   KFYhYJLpyf87I4RObMeMIY3bRutcVDpnV4pXTP1hc+vlkHHil8u0gTG0J
   MEL2c9yUp6DU3Gply+Lk/FydGK+cHA5kQmxpgmj9moqPbLAtUsgdbOtpk
   wA4KXbK40NBquaMBSYmhug5rU6jRHIuELZNWrwzVsnSPDxQdAij37y3C4
   lILlquCOWxJ19IaG9vDSDBt/FMdBmIKrgRJjQ/9dhTOhMRtBAhIGJ0DwF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="386157841"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="386157841"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 09:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="743814403"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="743814403"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Jun 2023 09:08:46 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q818w-000ACq-01;
	Sat, 10 Jun 2023 16:08:46 +0000
Date: Sun, 11 Jun 2023 00:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:core/guards2 49/58] kernel/events/core.c:11553
 perf_init_event() error: uninitialized symbol 'pmu'.
Message-ID: <202306102341.r7oEVdNc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards2
head:   2f378348009384ec621ed31458cad708cdfe1840
commit: 1dde5101280115d1cf6259fc4e655f77b05339c3 [49/58] perf: Simplify perf_init_event()
:::::: branch date: 5 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230610/202306102341.r7oEVdNc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306102341.r7oEVdNc-lkp@intel.com/

smatch warnings:
kernel/events/core.c:11553 perf_init_event() error: uninitialized symbol 'pmu'.

vim +/pmu +11553 kernel/events/core.c

cc34b98bacb0e1 kernel/events/core.c  Mark Rutland              2015-01-07  11512  
18ab2cd3ee9d52 kernel/events/core.c  Geliang Tang              2015-09-27  11513  static struct pmu *perf_init_event(struct perf_event *event)
b0a873ebbf87bf kernel/perf_event.c   Peter Zijlstra            2010-06-11  11514  {
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11515  	bool extended_type = false;
85c617abc786d7 kernel/events/core.c  Dan Carpenter             2017-05-22  11516  	struct pmu *pmu;
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11517  	int type, ret;
76e1d9047e4ede kernel/perf_event.c   Frederic Weisbecker       2010-04-05  11518  
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11519  	guard(srcu)(&pmus_srcu);
2e80a82a49c4c7 kernel/perf_event.c   Peter Zijlstra            2010-11-17  11520  
0d6d062ca27ec7 kernel/events/core.c  Ravi Bangoria             2023-05-04  11521  	/*
0d6d062ca27ec7 kernel/events/core.c  Ravi Bangoria             2023-05-04  11522  	 * Save original type before calling pmu->event_init() since certain
0d6d062ca27ec7 kernel/events/core.c  Ravi Bangoria             2023-05-04  11523  	 * pmus overwrites event->attr.type to forward event to another pmu.
0d6d062ca27ec7 kernel/events/core.c  Ravi Bangoria             2023-05-04  11524  	 */
0d6d062ca27ec7 kernel/events/core.c  Ravi Bangoria             2023-05-04  11525  	event->orig_type = event->attr.type;
0d6d062ca27ec7 kernel/events/core.c  Ravi Bangoria             2023-05-04  11526  
40999312c703f8 kernel/events/core.c  Kan Liang                 2017-01-18  11527  	/* Try parent's PMU first: */
40999312c703f8 kernel/events/core.c  Kan Liang                 2017-01-18  11528  	if (event->parent && event->parent->pmu) {
40999312c703f8 kernel/events/core.c  Kan Liang                 2017-01-18  11529  		pmu = event->parent->pmu;
40999312c703f8 kernel/events/core.c  Kan Liang                 2017-01-18  11530  		ret = perf_try_init_event(pmu, event);
40999312c703f8 kernel/events/core.c  Kan Liang                 2017-01-18  11531  		if (!ret)
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11532  			return pmu;
40999312c703f8 kernel/events/core.c  Kan Liang                 2017-01-18  11533  	}
40999312c703f8 kernel/events/core.c  Kan Liang                 2017-01-18  11534  
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11535  	/*
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11536  	 * PERF_TYPE_HARDWARE and PERF_TYPE_HW_CACHE
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11537  	 * are often aliases for PERF_TYPE_RAW.
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11538  	 */
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11539  	type = event->attr.type;
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11540  	if (type == PERF_TYPE_HARDWARE || type == PERF_TYPE_HW_CACHE) {
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11541  		type = event->attr.config >> PERF_PMU_TYPE_SHIFT;
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11542  		if (!type) {
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11543  			type = PERF_TYPE_RAW;
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11544  		} else {
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11545  			extended_type = true;
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11546  			event->attr.config &= PERF_HW_EVENT_MASK;
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11547  		}
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11548  	}
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11549  
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11550  again:
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11551  	scoped_guard (rcu)
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11552  		pmu = idr_find(&pmu_idr, type);
940c5b2971de44 kernel/perf_event.c   Lin Ming                  2011-02-27 @11553  	if (pmu) {
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11554  		if (event->attr.type != type && type != PERF_TYPE_RAW &&
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11555  		    !(pmu->capabilities & PERF_PMU_CAP_EXTENDED_HW_TYPE))
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11556  			return ERR_PTR(-ENOENT);
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11557  
cc34b98bacb0e1 kernel/events/core.c  Mark Rutland              2015-01-07  11558  		ret = perf_try_init_event(pmu, event);
55bcf6ef314ae8 kernel/events/core.c  Kan Liang                 2021-04-12  11559  		if (ret == -ENOENT && event->attr.type != type && !extended_type) {
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11560  			type = event->attr.type;
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11561  			goto again;
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11562  		}
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11563  
940c5b2971de44 kernel/perf_event.c   Lin Ming                  2011-02-27  11564  		if (ret)
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11565  			return ERR_PTR(ret);
66d258c5b04884 kernel/events/core.c  Peter Zijlstra            2019-10-17  11566  
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11567  		return pmu;
940c5b2971de44 kernel/perf_event.c   Lin Ming                  2011-02-27  11568  	}
2e80a82a49c4c7 kernel/perf_event.c   Peter Zijlstra            2010-11-17  11569  
9f0bff1180efc9 kernel/events/core.c  Sebastian Andrzej Siewior 2019-11-19  11570  	list_for_each_entry_rcu(pmu, &pmus, entry, lockdep_is_held(&pmus_srcu)) {
cc34b98bacb0e1 kernel/events/core.c  Mark Rutland              2015-01-07  11571  		ret = perf_try_init_event(pmu, event);
b0a873ebbf87bf kernel/perf_event.c   Peter Zijlstra            2010-06-11  11572  		if (!ret)
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11573  			return pmu;
76e1d9047e4ede kernel/perf_event.c   Frederic Weisbecker       2010-04-05  11574  
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11575  		if (ret != -ENOENT)
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11576  			return ERR_PTR(ret);
5c92d12411dfe5 kernel/perf_counter.c Ingo Molnar               2008-12-11  11577  	}
15dbf27cc18559 kernel/perf_counter.c Peter Zijlstra            2009-03-13  11578  
1dde5101280115 kernel/events/core.c  Peter Zijlstra            2023-06-09  11579  	return ERR_PTR(-ENOENT);
5c92d12411dfe5 kernel/perf_counter.c Ingo Molnar               2008-12-11  11580  }
5c92d12411dfe5 kernel/perf_counter.c Ingo Molnar               2008-12-11  11581  

:::::: The code at line 11553 was first introduced by commit
:::::: 940c5b2971de443df22eed0441bc74fb0116e9f5 perf: Fix the missing event initialization when pmu is found in idr

:::::: TO: Lin Ming <ming.m.lin@intel.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

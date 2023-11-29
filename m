Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329711D546
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sm3er9Q/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701259318; x=1732795318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ShRID8RV7p4mg3ClwphasCwKbunlegAXmu864j/VI2Q=;
  b=Sm3er9Q/YJc9hwdWAGBcemxvzsshLzi6UHuSefgP73qySTjCzWStw4KQ
   2Rz+guXJAz+MR4osILKP20rgWuvSf5ZrzAHLsu+Gzer6R69mPgu0yOI/d
   V36cp86bSVxYcbv6dmwec/vrefcC6tKYXx/PzowK47dYCGsmrE1F1Z9U7
   BOFhkOHEtM5yju8rgc9r+l50yAFeGVLWo8sVjIbKtmr3d79M7Ap0mCLUf
   DZCoQp7cRYClDmEBRvwRXAGaatNYvLAOCh1QDqCD0pGzMYL/+V2bi1rWW
   2jR6Xhelf+UBENd94nun8SvOKgAy5qipGN5v4JteNF6ScBdElbK2K2Y94
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372515845"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="372515845"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762295551"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="762295551"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Nov 2023 04:01:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8JGI-0000CN-0N;
	Wed, 29 Nov 2023 12:01:50 +0000
Date: Wed, 29 Nov 2023 20:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 1/3] kernel/sched/core.c:10713 cpu_uclamp_print()
 error: uninitialized symbol 'util_clamp'.
Message-ID: <202311291930.SXx3ynxt-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   18caaedaf4c3712ab6821f292598a8f86e6d7972
commit: e4ab322fbaaaf84b23d6cb0e3317a7f68baf36dc [1/3] cleanup: Add conditional guard support
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-r081-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291930.SXx3ynxt-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311291930.SXx3ynxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311291930.SXx3ynxt-lkp@intel.com/

smatch warnings:
kernel/sched/core.c:10713 cpu_uclamp_print() error: uninitialized symbol 'util_clamp'.
kernel/sched/core.c:10718 cpu_uclamp_print() error: potentially dereferencing uninitialized 'tg'.

vim +/util_clamp +10713 kernel/sched/core.c

2480c093130f64 Patrick Bellasi 2019-08-22  10699  
2480c093130f64 Patrick Bellasi 2019-08-22  10700  static inline void cpu_uclamp_print(struct seq_file *sf,
2480c093130f64 Patrick Bellasi 2019-08-22  10701  				    enum uclamp_id clamp_id)
2480c093130f64 Patrick Bellasi 2019-08-22  10702  {
2480c093130f64 Patrick Bellasi 2019-08-22  10703  	struct task_group *tg;
2480c093130f64 Patrick Bellasi 2019-08-22  10704  	u64 util_clamp;
2480c093130f64 Patrick Bellasi 2019-08-22  10705  	u64 percent;
2480c093130f64 Patrick Bellasi 2019-08-22  10706  	u32 rem;
2480c093130f64 Patrick Bellasi 2019-08-22  10707  
0e34600ac9317d Peter Zijlstra  2023-06-09  10708  	scoped_guard (rcu) {
2480c093130f64 Patrick Bellasi 2019-08-22  10709  		tg = css_tg(seq_css(sf));
2480c093130f64 Patrick Bellasi 2019-08-22  10710  		util_clamp = tg->uclamp_req[clamp_id].value;
0e34600ac9317d Peter Zijlstra  2023-06-09  10711  	}
2480c093130f64 Patrick Bellasi 2019-08-22  10712  
2480c093130f64 Patrick Bellasi 2019-08-22 @10713  	if (util_clamp == SCHED_CAPACITY_SCALE) {
2480c093130f64 Patrick Bellasi 2019-08-22  10714  		seq_puts(sf, "max\n");
2480c093130f64 Patrick Bellasi 2019-08-22  10715  		return;
2480c093130f64 Patrick Bellasi 2019-08-22  10716  	}
2480c093130f64 Patrick Bellasi 2019-08-22  10717  
2480c093130f64 Patrick Bellasi 2019-08-22 @10718  	percent = tg->uclamp_pct[clamp_id];
2480c093130f64 Patrick Bellasi 2019-08-22  10719  	percent = div_u64_rem(percent, POW10(UCLAMP_PERCENT_SHIFT), &rem);
2480c093130f64 Patrick Bellasi 2019-08-22  10720  	seq_printf(sf, "%llu.%0*u\n", percent, UCLAMP_PERCENT_SHIFT, rem);
2480c093130f64 Patrick Bellasi 2019-08-22  10721  }
2480c093130f64 Patrick Bellasi 2019-08-22  10722  

:::::: The code at line 10713 was first introduced by commit
:::::: 2480c093130f64ac3a410504fa8b3db1fc4b87ce sched/uclamp: Extend CPU's cgroup controller

:::::: TO: Patrick Bellasi <patrick.bellasi@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

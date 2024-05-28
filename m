Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2D176FAE
	for <oe-kbuild@lists.linux.dev>; Tue, 28 May 2024 19:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716926015; cv=none; b=hay4GaOcGLkLR16QADKiHz6/tXE5izeTMvusowwnuiEUrlUa4ZIcFo65LazTB/sv7zH/w+bNdrfK4bLQszDPVq0WZ55JTEzw31+TVdyWTDcPcIp2xCCMo4mwBkhXRCOWXRye/gowlh0iGFsT9eT9/zKvIj7NaCkuyEwuwdw60nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716926015; c=relaxed/simple;
	bh=aZsKSFuPhobMyshYHyJumq+C+fSdZNJ1lKjb4Ep4yfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EBzW1oQPK+q1URLyt3k2uQrFlBBpVaKl9hpmCAwqZCBTJ7HQ7C5/ziCDqG9/hfD9Ywdqbur00//4yZbhwyC17ux0CYPmm7PNDdBrQJTSFnesC3Y8d2ZXbUrDRO24lCBrWAdNv5exBF9LoLaIwRGLS8QhORwPYqpHOPHsgebLdP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vn9v8Kbe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vn9v8Kbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716926014; x=1748462014;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aZsKSFuPhobMyshYHyJumq+C+fSdZNJ1lKjb4Ep4yfs=;
  b=Vn9v8Kbe93ahhMObUkajVj1bKA4qfAG5q1Q7ffAV1ggeN4BBk5U9Yz+y
   j1vocqUHFlyRj0D/4sXL0EHK2aa7QVWeHePeMIXYe4oRTSgaQ6zWaVtC8
   bFHSYRrragyJCMsm+KHN+QwpxVF5jUenyjyoapvE9LOeEl6Zj2BSLXN8a
   YpB0QQ2QxEzd8Cc25GDNWtTUprfIs5bwcof8hYKAyiLPlLFyvwQjKxkYE
   KOfKAcpZRVI9uGTX4NZ3XyrzL+QHIWYD3bXSChYdjpaiVB9TBxT4JAbik
   jDXTFGAIIzGBubFcEl/V8Ok9KNUfQ2ZKZe7gYQ8fCNHJOxiau/ksRcmbp
   g==;
X-CSE-ConnectionGUID: WVNAfcEnQ2m/yEqMp/89Gw==
X-CSE-MsgGUID: 9etYOtamSwSXrEt9s536mA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38680917"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="38680917"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 12:53:33 -0700
X-CSE-ConnectionGUID: jVG5cdpwSoCPDlOfs2+dSQ==
X-CSE-MsgGUID: 0ZV9nTSeTJSmVHbcYw6+Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="66372821"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2024 12:53:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC2sy-000ChZ-1K;
	Tue, 28 May 2024 19:53:28 +0000
Date: Wed, 29 May 2024 03:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] sched: core: =?utf-8?Q?Remove_?=
 =?utf-8?B?dW5uZWNlc3Nhcnkg4oCYTlVMTOKAmQ==?= values from core_rq
Message-ID: <202405290346.bb26owE0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240528071446.59197-1-zeming@nfschina.com>
References: <20240528071446.59197-1-zeming@nfschina.com>
TO: Li zeming <zeming@nfschina.com>
TO: mingo@redhat.com
TO: peterz@infradead.org
TO: juri.lelli@redhat.com
TO: vincent.guittot@linaro.org
TO: dietmar.eggemann@arm.com
TO: rostedt@goodmis.org
TO: bsegall@google.com
TO: mgorman@suse.de
TO: bristot@redhat.com
TO: vschneid@redhat.com
CC: linux-kernel@vger.kernel.org
CC: Li zeming <zeming@nfschina.com>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.10-rc1 next-20240528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-zeming/sched-core-Remove-unnecessary-NULL-values-from-core_rq/20240528-152109
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20240528071446.59197-1-zeming%40nfschina.com
patch subject: [PATCH] sched: core: Remove unnecessary ‘NULL’ values from core_rq
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-161-20240528 (https://download.01.org/0day-ci/archive/20240529/202405290346.bb26owE0-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405290346.bb26owE0-lkp@intel.com/

smatch warnings:
kernel/sched/core.c:6295 sched_core_cpu_deactivate() error: uninitialized symbol 'core_rq'.

vim +/core_rq +6295 kernel/sched/core.c

3c474b3239f12fe Peter Zijlstra 2021-08-19  6268  
3c474b3239f12fe Peter Zijlstra 2021-08-19  6269  static void sched_core_cpu_deactivate(unsigned int cpu)
3c474b3239f12fe Peter Zijlstra 2021-08-19  6270  {
3c474b3239f12fe Peter Zijlstra 2021-08-19  6271  	const struct cpumask *smt_mask = cpu_smt_mask(cpu);
ca27ccef75e13e4 Li zeming      2024-05-28  6272  	struct rq *rq = cpu_rq(cpu), *core_rq;
3c474b3239f12fe Peter Zijlstra 2021-08-19  6273  	int t;
3c474b3239f12fe Peter Zijlstra 2021-08-19  6274  
7170509cadbb76e Peter Zijlstra 2023-08-01  6275  	guard(core_lock)(&cpu);
3c474b3239f12fe Peter Zijlstra 2021-08-19  6276  
3c474b3239f12fe Peter Zijlstra 2021-08-19  6277  	/* if we're the last man standing, nothing to do */
3c474b3239f12fe Peter Zijlstra 2021-08-19  6278  	if (cpumask_weight(smt_mask) == 1) {
3c474b3239f12fe Peter Zijlstra 2021-08-19  6279  		WARN_ON_ONCE(rq->core != rq);
7170509cadbb76e Peter Zijlstra 2023-08-01  6280  		return;
9edeaea1bc45237 Peter Zijlstra 2020-11-17  6281  	}
3c474b3239f12fe Peter Zijlstra 2021-08-19  6282  
3c474b3239f12fe Peter Zijlstra 2021-08-19  6283  	/* if we're not the leader, nothing to do */
3c474b3239f12fe Peter Zijlstra 2021-08-19  6284  	if (rq->core != rq)
7170509cadbb76e Peter Zijlstra 2023-08-01  6285  		return;
3c474b3239f12fe Peter Zijlstra 2021-08-19  6286  
3c474b3239f12fe Peter Zijlstra 2021-08-19  6287  	/* find a new leader */
3c474b3239f12fe Peter Zijlstra 2021-08-19  6288  	for_each_cpu(t, smt_mask) {
3c474b3239f12fe Peter Zijlstra 2021-08-19  6289  		if (t == cpu)
3c474b3239f12fe Peter Zijlstra 2021-08-19  6290  			continue;
3c474b3239f12fe Peter Zijlstra 2021-08-19  6291  		core_rq = cpu_rq(t);
3c474b3239f12fe Peter Zijlstra 2021-08-19  6292  		break;
9edeaea1bc45237 Peter Zijlstra 2020-11-17  6293  	}
3c474b3239f12fe Peter Zijlstra 2021-08-19  6294  
3c474b3239f12fe Peter Zijlstra 2021-08-19 @6295  	if (WARN_ON_ONCE(!core_rq)) /* impossible */
7170509cadbb76e Peter Zijlstra 2023-08-01  6296  		return;
3c474b3239f12fe Peter Zijlstra 2021-08-19  6297  
3c474b3239f12fe Peter Zijlstra 2021-08-19  6298  	/* copy the shared state to the new leader */
3c474b3239f12fe Peter Zijlstra 2021-08-19  6299  	core_rq->core_task_seq             = rq->core_task_seq;
3c474b3239f12fe Peter Zijlstra 2021-08-19  6300  	core_rq->core_pick_seq             = rq->core_pick_seq;
3c474b3239f12fe Peter Zijlstra 2021-08-19  6301  	core_rq->core_cookie               = rq->core_cookie;
4feee7d12603dec Josh Don       2021-10-18  6302  	core_rq->core_forceidle_count      = rq->core_forceidle_count;
3c474b3239f12fe Peter Zijlstra 2021-08-19  6303  	core_rq->core_forceidle_seq        = rq->core_forceidle_seq;
4feee7d12603dec Josh Don       2021-10-18  6304  	core_rq->core_forceidle_occupation = rq->core_forceidle_occupation;
4feee7d12603dec Josh Don       2021-10-18  6305  
4feee7d12603dec Josh Don       2021-10-18  6306  	/*
4feee7d12603dec Josh Don       2021-10-18  6307  	 * Accounting edge for forced idle is handled in pick_next_task().
4feee7d12603dec Josh Don       2021-10-18  6308  	 * Don't need another one here, since the hotplug thread shouldn't
4feee7d12603dec Josh Don       2021-10-18  6309  	 * have a cookie.
4feee7d12603dec Josh Don       2021-10-18  6310  	 */
4feee7d12603dec Josh Don       2021-10-18  6311  	core_rq->core_forceidle_start = 0;
3c474b3239f12fe Peter Zijlstra 2021-08-19  6312  
3c474b3239f12fe Peter Zijlstra 2021-08-19  6313  	/* install new leader */
3c474b3239f12fe Peter Zijlstra 2021-08-19  6314  	for_each_cpu(t, smt_mask) {
3c474b3239f12fe Peter Zijlstra 2021-08-19  6315  		rq = cpu_rq(t);
3c474b3239f12fe Peter Zijlstra 2021-08-19  6316  		rq->core = core_rq;
3c474b3239f12fe Peter Zijlstra 2021-08-19  6317  	}
3c474b3239f12fe Peter Zijlstra 2021-08-19  6318  }
3c474b3239f12fe Peter Zijlstra 2021-08-19  6319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

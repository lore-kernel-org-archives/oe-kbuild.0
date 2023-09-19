Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD8E5237
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Sep 2023 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695139637; x=1726675637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KmJR9BWbidtt8IKo986cUyg/zKfdz9xLvA0zViMMDbU=;
  b=oDK0bhdTiYOCAz5FJdCIBDPyrXBTid6gaEXUTvZF3r8EwKakTC1/qCn0
   QnOgQucQ4uIN6HlpSwgWYbxiG+3c8l12UduNsuW3zFc2NaKAVrAHJkXZM
   dt/862rFUMWTTVTdFmkaXBEOaycldDBmx6E0IbbWxP3sYmF8u0KWhFTvR
   suEnzQLH9ZamVnaekF0LBWbNnY71JHehR9Ec6zhqQHcYMwfS3MNgem29t
   EbcdQnMPFzCA6SIYKkZs7ZkCkqPz9MHkeYY4ydALdeD7IeYczPTpQzT1o
   9UiRMtHWtLZQye7vWYkkj8zQMcMF4fs7TZhyEaVPhBTDpeoNDeuiCV/P7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="444069033"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="444069033"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 09:02:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695963095"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="695963095"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Sep 2023 09:02:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qidBc-0007bf-09;
	Tue, 19 Sep 2023 16:02:52 +0000
Date: Wed, 20 Sep 2023 00:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] sched/rt: move back to RT_GROUP_SCHED and rename it child
Message-ID: <202309192327.wgPCfQQt-lkp@intel.com>
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
In-Reply-To: <20230919035114.2364567-1-yajun.deng@linux.dev>
References: <20230919035114.2364567-1-yajun.deng@linux.dev>
TO: Yajun Deng <yajun.deng@linux.dev>
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
CC: Yajun Deng <yajun.deng@linux.dev>

Hi Yajun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.6-rc2 next-20230919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yajun-Deng/sched-rt-move-back-to-RT_GROUP_SCHED-and-rename-it-child/20230919-115216
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20230919035114.2364567-1-yajun.deng%40linux.dev
patch subject: [PATCH] sched/rt: move back to RT_GROUP_SCHED and rename it child
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-141-20230919 (https://download.01.org/0day-ci/archive/20230919/202309192327.wgPCfQQt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230919/202309192327.wgPCfQQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309192327.wgPCfQQt-lkp@intel.com/

smatch warnings:
kernel/sched/rt.c:1498 dequeue_rt_stack() error: uninitialized symbol 'root'.

vim +/root +1498 kernel/sched/rt.c

6f505b16425a51 kernel/sched_rt.c Peter Zijlstra         2008-01-25  1485  
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra         2008-01-25  1486  /*
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra         2008-01-25  1487   * Because the prio of an upper entry depends on the lower
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra         2008-01-25  1488   * entries, we must remove entries top - down.
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra         2008-01-25  1489   */
ff77e468535987 kernel/sched/rt.c Peter Zijlstra         2016-01-18  1490  static void dequeue_rt_stack(struct sched_rt_entity *rt_se, unsigned int flags)
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra         2008-01-25  1491  {
fad3ec52f4bb59 kernel/sched/rt.c Yajun Deng             2023-09-19  1492  	struct sched_rt_entity *root;
5c66d1b9b30f73 kernel/sched/rt.c Nicolas Saenz Julienne 2022-06-28  1493  	unsigned int rt_nr_running;
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra         2008-01-25  1494  
fad3ec52f4bb59 kernel/sched/rt.c Yajun Deng             2023-09-19  1495  	for_each_sched_rt_entity(rt_se)
fad3ec52f4bb59 kernel/sched/rt.c Yajun Deng             2023-09-19  1496  		root = rt_se;
58d6c2d72f8628 kernel/sched_rt.c Peter Zijlstra         2008-04-19  1497  
fad3ec52f4bb59 kernel/sched/rt.c Yajun Deng             2023-09-19 @1498  	rt_nr_running = rt_rq_of_se(root)->rt_nr_running;
f4ebcbc0d7e009 kernel/sched/rt.c Kirill Tkhai           2014-03-15  1499  
fad3ec52f4bb59 kernel/sched/rt.c Yajun Deng             2023-09-19  1500  	rt_se = root;
fad3ec52f4bb59 kernel/sched/rt.c Yajun Deng             2023-09-19  1501  	for_each_sched_rt_entity_reverse(rt_se) {
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra         2008-01-25  1502  		if (on_rt_rq(rt_se))
ff77e468535987 kernel/sched/rt.c Peter Zijlstra         2016-01-18  1503  			__dequeue_rt_entity(rt_se, flags);
ad2a3f13b7258a kernel/sched_rt.c Peter Zijlstra         2008-06-19  1504  	}
5c66d1b9b30f73 kernel/sched/rt.c Nicolas Saenz Julienne 2022-06-28  1505  
fad3ec52f4bb59 kernel/sched/rt.c Yajun Deng             2023-09-19  1506  	dequeue_top_rt_rq(rt_rq_of_se(root), rt_nr_running);
ad2a3f13b7258a kernel/sched_rt.c Peter Zijlstra         2008-06-19  1507  }
ad2a3f13b7258a kernel/sched_rt.c Peter Zijlstra         2008-06-19  1508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C831F95C
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 01:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741311182; cv=none; b=VtwgWLkj0+iaegpKmwFUgz2A+7KijTOFhOz2CyD6Vvmveon+s/zL47fLAkw4+wYQ4ch7fmRvz6324NHuzyjwoTNtyMbXY2FngDRLodWFqKj0wZKZHlX+Q6ZPLwPnm8Zm78SeNTyQDuVICihJGz7YA3xO69FSgzux14kGqX9gIQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741311182; c=relaxed/simple;
	bh=S5qwX3LKmk2zZ8soQhc+Okb51IjQqS3xK3Ynk2mfwuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VLcb9vurWfkOHXHiWDwjaZiQL1Y+lV5ReMxLoB/EztM9J+lVmUoOcTiZs3fu4zCMapHUnE8b5Vh+C+FGjMikrTXXTSCUAlLbtHdBVrSeXFyDcMGM1Aqcv3K8cACTsv3nWwk494oZ/GNJ76KdhBgrGf4yBYrhjmlM6ZDhqpgn9vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6x3eb+B; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6x3eb+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741311180; x=1772847180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5qwX3LKmk2zZ8soQhc+Okb51IjQqS3xK3Ynk2mfwuA=;
  b=J6x3eb+BVUDQ1gQYEcgZw76yyCUl1lHQLFB5c+5IMx9A0s1y6IoFrMtF
   mH/G03tDDCjburXah4RZIuNRuJKaFzio/z8tYufXbEKU6438sVjEamAhq
   hFtAnjRgVKPOteAxgKJLWnF4F0bzE/0IrX0w+8lEnpveMCoRUfxR2Mk5F
   +L4HhsFaIEUIkbpLslHNqBoMmEm8pC1xo0GgjFT/c++uAbO1GpWqZZigD
   u8X3SnH/iyiuCzm3CIW8x0RJsfw/JZAhQLp6QrqgIwuO7HZRUgU/9k+Yj
   GrqfbkbGiM/sLEz4iw7f6qXvcmhdEW6Ub0WBmFECu4BOoRIRB1ygnwJ7m
   A==;
X-CSE-ConnectionGUID: 71OlMwK/RMmzN2E5pjNluQ==
X-CSE-MsgGUID: u+vtR73zSKa8GDg9EQHzOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53741472"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="53741472"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 17:32:59 -0800
X-CSE-ConnectionGUID: TpsIMnNmQkyGWdkFnpZ94w==
X-CSE-MsgGUID: +kFOghexTzWIEHSIBzHr5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="124218323"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2025 17:32:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqMa7-000Nt0-2F;
	Fri, 07 Mar 2025 01:32:55 +0000
Date: Fri, 7 Mar 2025 09:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] sched: address a potential NULL pointer dereference in
 the GRED scheduler.
Message-ID: <202503070956.I8Z06FRE-lkp@intel.com>
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
In-Reply-To: <20250304141858.3392957-2-juny24602@gmail.com>
References: <20250304141858.3392957-2-juny24602@gmail.com>
TO: kwqcheii <juny24602@gmail.com>
TO: netdev@vger.kernel.org
CC: kwqcheii <juny24602@gmail.com>

Hi kwqcheii,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kwqcheii/sched-address-a-potential-NULL-pointer-dereference-in-the-GRED-scheduler/20250304-224144
base:   linus/master
patch link:    https://lore.kernel.org/r/20250304141858.3392957-2-juny24602%40gmail.com
patch subject: [PATCH] sched: address a potential NULL pointer dereference in the GRED scheduler.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r072-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070956.I8Z06FRE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503070956.I8Z06FRE-lkp@intel.com/

New smatch warnings:
net/sched/sch_gred.c:330 gred_offload() error: we previously assumed 'opt' could be null (see line 320)

Old smatch warnings:
net/sched/sch_gred.c:474 gred_change_table_def() warn: potential spectre issue 'table->tab' [w]

vim +/opt +330 net/sched/sch_gred.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  310  
890d8d23ec3c9e Jakub Kicinski 2018-11-19  311  static void gred_offload(struct Qdisc *sch, enum tc_gred_command command)
890d8d23ec3c9e Jakub Kicinski 2018-11-19  312  {
890d8d23ec3c9e Jakub Kicinski 2018-11-19  313  	struct gred_sched *table = qdisc_priv(sch);
890d8d23ec3c9e Jakub Kicinski 2018-11-19  314  	struct net_device *dev = qdisc_dev(sch);
f25c0515c52137 Arnd Bergmann  2021-10-26  315  	struct tc_gred_qopt_offload *opt = table->opt;
890d8d23ec3c9e Jakub Kicinski 2018-11-19  316  
890d8d23ec3c9e Jakub Kicinski 2018-11-19  317  	if (!tc_can_offload(dev) || !dev->netdev_ops->ndo_setup_tc)
890d8d23ec3c9e Jakub Kicinski 2018-11-19  318  		return;
890d8d23ec3c9e Jakub Kicinski 2018-11-19  319  
8eb926feee9101 kwqcheii       2025-03-04 @320  	if (opt) {
f25c0515c52137 Arnd Bergmann  2021-10-26  321  		memset(opt, 0, sizeof(*opt));
f25c0515c52137 Arnd Bergmann  2021-10-26  322  		opt->command = command;
f25c0515c52137 Arnd Bergmann  2021-10-26  323  		opt->handle = sch->handle;
f25c0515c52137 Arnd Bergmann  2021-10-26  324  		opt->parent = sch->parent;
8eb926feee9101 kwqcheii       2025-03-04  325  	}
f25c0515c52137 Arnd Bergmann  2021-10-26  326  
890d8d23ec3c9e Jakub Kicinski 2018-11-19  327  	if (command == TC_GRED_REPLACE) {
890d8d23ec3c9e Jakub Kicinski 2018-11-19  328  		unsigned int i;
890d8d23ec3c9e Jakub Kicinski 2018-11-19  329  
f25c0515c52137 Arnd Bergmann  2021-10-26 @330  		opt->set.grio_on = gred_rio_mode(table);
f25c0515c52137 Arnd Bergmann  2021-10-26  331  		opt->set.wred_on = gred_wred_mode(table);
f25c0515c52137 Arnd Bergmann  2021-10-26  332  		opt->set.dp_cnt = table->DPs;
f25c0515c52137 Arnd Bergmann  2021-10-26  333  		opt->set.dp_def = table->def;
890d8d23ec3c9e Jakub Kicinski 2018-11-19  334  
890d8d23ec3c9e Jakub Kicinski 2018-11-19  335  		for (i = 0; i < table->DPs; i++) {
890d8d23ec3c9e Jakub Kicinski 2018-11-19  336  			struct gred_sched_data *q = table->tab[i];
890d8d23ec3c9e Jakub Kicinski 2018-11-19  337  
890d8d23ec3c9e Jakub Kicinski 2018-11-19  338  			if (!q)
890d8d23ec3c9e Jakub Kicinski 2018-11-19  339  				continue;
f25c0515c52137 Arnd Bergmann  2021-10-26  340  			opt->set.tab[i].present = true;
f25c0515c52137 Arnd Bergmann  2021-10-26  341  			opt->set.tab[i].limit = q->limit;
f25c0515c52137 Arnd Bergmann  2021-10-26  342  			opt->set.tab[i].prio = q->prio;
f25c0515c52137 Arnd Bergmann  2021-10-26  343  			opt->set.tab[i].min = q->parms.qth_min >> q->parms.Wlog;
f25c0515c52137 Arnd Bergmann  2021-10-26  344  			opt->set.tab[i].max = q->parms.qth_max >> q->parms.Wlog;
f25c0515c52137 Arnd Bergmann  2021-10-26  345  			opt->set.tab[i].is_ecn = gred_use_ecn(q);
f25c0515c52137 Arnd Bergmann  2021-10-26  346  			opt->set.tab[i].is_harddrop = gred_use_harddrop(q);
f25c0515c52137 Arnd Bergmann  2021-10-26  347  			opt->set.tab[i].probability = q->parms.max_P;
f25c0515c52137 Arnd Bergmann  2021-10-26  348  			opt->set.tab[i].backlog = &q->backlog;
890d8d23ec3c9e Jakub Kicinski 2018-11-19  349  		}
f25c0515c52137 Arnd Bergmann  2021-10-26  350  		opt->set.qstats = &sch->qstats;
890d8d23ec3c9e Jakub Kicinski 2018-11-19  351  	}
890d8d23ec3c9e Jakub Kicinski 2018-11-19  352  
f25c0515c52137 Arnd Bergmann  2021-10-26  353  	dev->netdev_ops->ndo_setup_tc(dev, TC_SETUP_QDISC_GRED, opt);
890d8d23ec3c9e Jakub Kicinski 2018-11-19  354  }
890d8d23ec3c9e Jakub Kicinski 2018-11-19  355  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

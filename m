Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F781D1E88
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729520375; cv=none; b=dEEn2r+GrB+DezAEcNmq164iReWiQgyFa6lUv+Nuvp/j9nHTbsHIA0l7RRPNXI6fO96tUsPekAGif8lB+H+msltHYXvsI2TfudlNwtYX2k63wIXsnTLPQlIaHY+5370kGhSC+wDI8Mdcf5NAUMlCwTvw4yfBjVjXw30uPLxvmvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729520375; c=relaxed/simple;
	bh=UwHaEWe3P558gpzlhMuQdCPu/eqEbdg4+ru09GBphVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JfZxEQfJcNtfVCbW+LLr10DKuatSSPpqBGs9Elt+HYXs04AeEDhbY3N9fqzP2+N5QvQuqhQijP40X8JV2Yb3M0H+2TbADGZxvd+4frDmjepLC8VXwNMdrNSMJOHkhuAbm4WUT4+X8Cjtf/bbG5GkBBquUACweWx7lrW6lHL2OnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoAG6c1l; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoAG6c1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729520373; x=1761056373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UwHaEWe3P558gpzlhMuQdCPu/eqEbdg4+ru09GBphVQ=;
  b=QoAG6c1lgNkv+MKwLWZxflZFAIoxvKUa8LGoUTHRmTg4yqM5Bst8zIxL
   bnzPxy6d0lBSUEBdP2c54ko5u/6lkcTgznwHFXcLLo53Qd0PeXXoKCYQL
   SVz8+SKDwfy0FSZNujvE2WezzfRDvkkGNCtJga2wgklXIM2G7lqaUa2se
   t9NOp8gTJYyeKWzHwciPAFffwL+tsP/CSXL6LOKwlObm1es7YkKcbfdMD
   MWIAZXh/6IECp9zaXxZe0eBQTh0ji1JEH4KmEKBEqZ+DMCZNjb5nE+mSS
   IoETfn20l58CNThdTM6LHvfyMFsFwmG4/JqS11ugGpkNbu+m6Ml0u8VZ5
   Q==;
X-CSE-ConnectionGUID: EvKSSS70QQCbnwH0RrMdLA==
X-CSE-MsgGUID: BLvL75BWSgCdCqFfUoZ6dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29102881"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="29102881"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 07:19:32 -0700
X-CSE-ConnectionGUID: iLSvVA84SD6n2b8Q3CluhA==
X-CSE-MsgGUID: 5hr08D0KR0yhiJ6lq87ejA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79487616"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Oct 2024 07:19:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2tFl-000SGA-2z;
	Mon, 21 Oct 2024 14:19:25 +0000
Date: Mon, 21 Oct 2024 22:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 22791/30000] kernel/sched/topology.c:1734
 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression :
 sched_cluster_sysctls[1]->procname
Message-ID: <202410212221.65cVVMvV-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Aubrey Li <aubrey.li@linux.intel.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   950c74b8b6db893114b092f9fd2548037daa73f7
commit: f4128ae8e6ff03b4c805707fe75d0345797f7f53 [22791/30000] sched: Add cluster scheduler level for x86
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20241013 (https://download.01.org/0day-ci/archive/20241021/202410212221.65cVVMvV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410212221.65cVVMvV-lkp@intel.com/

smatch warnings:
kernel/sched/topology.c:1734 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : sched_cluster_sysctls[1]->procname
kernel/sched/topology.c:1734 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : sched_cluster_sysctls[1]->proc_handler

vim +1734 kernel/sched/topology.c

8ce3e706b314091 Tim Chen 2021-12-03  1733  
8ce3e706b314091 Tim Chen 2021-12-03 @1734  static struct ctl_table sched_cluster_sysctls[] = {
8ce3e706b314091 Tim Chen 2021-12-03  1735  	{
8ce3e706b314091 Tim Chen 2021-12-03  1736  		.procname       = "sched_cluster",
8ce3e706b314091 Tim Chen 2021-12-03  1737  		.data           = &sysctl_sched_cluster,
8ce3e706b314091 Tim Chen 2021-12-03  1738  		.maxlen         = sizeof(unsigned int),
8ce3e706b314091 Tim Chen 2021-12-03  1739  		.mode           = 0644,
8ce3e706b314091 Tim Chen 2021-12-03  1740  		.proc_handler   = sched_cluster_handler,
8ce3e706b314091 Tim Chen 2021-12-03  1741  		.extra1         = SYSCTL_ZERO,
8ce3e706b314091 Tim Chen 2021-12-03  1742  		.extra2         = SYSCTL_ONE,
8ce3e706b314091 Tim Chen 2021-12-03  1743  	},
8ce3e706b314091 Tim Chen 2021-12-03  1744  	{}
8ce3e706b314091 Tim Chen 2021-12-03  1745  };
8ce3e706b314091 Tim Chen 2021-12-03  1746  

:::::: The code at line 1734 was first introduced by commit
:::::: 8ce3e706b31409147f035c037055caa68e450ce5 scheduler: Add runtime knob sysctl_sched_cluster

:::::: TO: Tim Chen <tim.c.chen@linux.intel.com>
:::::: CC: Jie Liu <liujie375@h-partners.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

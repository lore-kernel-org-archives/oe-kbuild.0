Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1404374E71
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518634; cv=none; b=cWAiiT8dnJ74kRKsI9pxWnyOyuFieAITJfbSQwrtJeEKMBL1k1Q1UukYkspnoQp6q01RBD77SbS/5OThEsyfT1pZ+lyxt3QOQo4l4eqHcVbq9aDH4NGaxshiBJowNgVCJF8T8uFeU2td6zTTaSiDm0aszskRNT9MvyYItXYKMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518634; c=relaxed/simple;
	bh=ByQ5oGLgfxgHuYPXxoofCN5//MKHPLmkTJjLh+H4BQI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PLjJnxH60epiLwXNsTa6Ad3piTYeZmT0Cr9Rn2Z2GDB+HfajlBEGHz5ZlahAQxlPpHuA3D3fEUmdY6TAWciZNC5Ew8kd0FUnXTkSmvwWSW7ZUnDtdIM6b6fHSfOdQ91LOrlW54nzJqwli5F1bHU5uvce/CQPF99CApsKvS3OrnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZ3fDETj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZ3fDETj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778518632; x=1810054632;
  h=date:from:to:cc:subject:message-id;
  bh=ByQ5oGLgfxgHuYPXxoofCN5//MKHPLmkTJjLh+H4BQI=;
  b=QZ3fDETjgK1rIGla3ZqUqXIXBMLELKagnEk0sYL+gCQufn78QFiVWWjU
   oNqIEp9/YFuy2wNM9J/DiatSVNRPuOWFAeH5wcKSZeY9k098tVbedVAp9
   ioLvYSeFZkCy23R+lVx049YZC975ZFA+HbnrWN3tkrOg3PNlBcyGhKKMn
   BTxLP8gbdw/qFM0zeai8gDTXyfkHnrSZbvwn6qHFyQ3f1zU8XAh6a4Cxd
   7/ONGu8PsUcdkLo1H+nC+xa0pBLHfVixr/I2VpkynL7itetB+gSWV8pvz
   fknmFoIdaEhp/LdDyaYBVfHyv38MyAcNGVOw3FmV3g45OuUBGQWTBfJGf
   g==;
X-CSE-ConnectionGUID: hzda7Ba6R+G4dUau7I0aDw==
X-CSE-MsgGUID: SQxgL1IFSsqcLkNoRJe7dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83260774"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83260774"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 09:57:12 -0700
X-CSE-ConnectionGUID: 1LpvG9nFQOa6haarRbdLWA==
X-CSE-MsgGUID: 11oREpMDTJeD2SuszkeXog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="236667060"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 11 May 2026 09:57:11 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMTwK-000000007yr-2bln;
	Mon, 11 May 2026 16:57:08 +0000
Date: Mon, 11 May 2026 18:56:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/helpers.c:2833:35: error: implicit declaration of
 function 'cgroup_psi'; did you mean 'cgroup_put'?
Message-ID: <202605111839.DdMq2rZn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vernon Yang <yanglincheng@kylinos.cn>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/psi-add-psi_group_flush_stats-function/20260511-160117
head:   935bf63d5c33c8fc0d26f2092de20e4720f4b2ae
commit: 46f204179b5fd01c11fa4999b7a94beccfe84ea4 bpf: add bpf_cgroup_{flush_stats,stall} function
date:   9 hours ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260511/202605111839.DdMq2rZn-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111839.DdMq2rZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605111839.DdMq2rZn-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/helpers.c:2831:49: warning: 'enum psi_states' declared inside parameter list will not be visible outside of this definition or declaration
    2831 |                                            enum psi_states states)
         |                                                 ^~~~~~~~~~
   kernel/bpf/helpers.c:2831:60: error: parameter 2 ('states') has incomplete type
    2831 |                                            enum psi_states states)
         |                                            ~~~~~~~~~~~~~~~~^~~~~~
   kernel/bpf/helpers.c:2830:27: error: function declaration isn't a prototype [-Werror=strict-prototypes]
    2830 | __bpf_kfunc unsigned long bpf_cgroup_stall(struct cgroup *cgrp,
         |                           ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c: In function 'bpf_cgroup_stall':
>> kernel/bpf/helpers.c:2833:35: error: implicit declaration of function 'cgroup_psi'; did you mean 'cgroup_put'? [-Wimplicit-function-declaration]
    2833 |         struct psi_group *group = cgroup_psi(cgrp);
         |                                   ^~~~~~~~~~
         |                                   cgroup_put
>> kernel/bpf/helpers.c:2833:35: error: initialization of 'struct psi_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   kernel/bpf/helpers.c:2835:29: error: 'struct psi_group' has no member named 'total'
    2835 |         return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
         |                             ^~
   kernel/bpf/helpers.c:2835:37: error: 'PSI_AVGS' undeclared (first use in this function)
    2835 |         return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
         |                                     ^~~~~~~~
   kernel/bpf/helpers.c:2835:37: note: each undeclared identifier is reported only once for each function it appears in
   kernel/bpf/helpers.c: In function 'bpf_cgroup_flush_stats':
   kernel/bpf/helpers.c:2844:35: error: initialization of 'struct psi_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2844 |         struct psi_group *group = cgroup_psi(cgrp);
         |                                   ^~~~~~~~~~
   kernel/bpf/helpers.c:2846:9: error: implicit declaration of function 'psi_group_flush_stats'; did you mean 'bpf_cgroup_flush_stats'? [-Wimplicit-function-declaration]
    2846 |         psi_group_flush_stats(group);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         bpf_cgroup_flush_stats
   kernel/bpf/helpers.c: In function 'bpf_cgroup_stall':
   kernel/bpf/helpers.c:2836:1: warning: control reaches end of non-void function [-Wreturn-type]
    2836 | }
         | ^
   cc1: some warnings being treated as errors


vim +2833 kernel/bpf/helpers.c

b5ad4cdc46c7d6 Feng Zhou   2023-05-06  2822  
46f204179b5fd0 Vernon Yang 2026-05-04  2823  /**
46f204179b5fd0 Vernon Yang 2026-05-04  2824   * bpf_cgroup_stall - acquire the total stall time of cgroup
46f204179b5fd0 Vernon Yang 2026-05-04  2825   * @cgrp: cgroup struct
46f204179b5fd0 Vernon Yang 2026-05-04  2826   * @states: psi states
46f204179b5fd0 Vernon Yang 2026-05-04  2827   *
46f204179b5fd0 Vernon Yang 2026-05-04  2828   * Return the total stall time.
46f204179b5fd0 Vernon Yang 2026-05-04  2829   */
46f204179b5fd0 Vernon Yang 2026-05-04 @2830  __bpf_kfunc unsigned long bpf_cgroup_stall(struct cgroup *cgrp,
46f204179b5fd0 Vernon Yang 2026-05-04 @2831  					   enum psi_states states)
46f204179b5fd0 Vernon Yang 2026-05-04  2832  {
46f204179b5fd0 Vernon Yang 2026-05-04 @2833  	struct psi_group *group = cgroup_psi(cgrp);
46f204179b5fd0 Vernon Yang 2026-05-04  2834  
46f204179b5fd0 Vernon Yang 2026-05-04  2835  	return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
46f204179b5fd0 Vernon Yang 2026-05-04  2836  }
46f204179b5fd0 Vernon Yang 2026-05-04  2837  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

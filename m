Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAAB38C2AE
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 21:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778362059; cv=none; b=L/Z7anIEhGyqdEFNNPOsUAioBnUNUnWD8x5P0go1Do0Xy9C4KhobIECiuk2WumhmR43eB+5ZwBJ8rO089wjc6xLV3xTimX8roW7OAEUMZ/2Eo1sWRKj89OJZsoSECloBypU8kiB2Ofgsa50Szu9vAKtQ5B0pAbVNUDE+wCNmiV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778362059; c=relaxed/simple;
	bh=/OuMNF4QZCk4oU8o27czxbYwT5hK7lVgxQ5kXV9opN0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A3MmFsQTw95Q+lPdpDh99wf7vz34eesPNfGepjy/NPNV0iKHhuiWQ0/Tl97JtkgGPTnjidlkXSDhLkpvRmcYw6KxWbg/7PcRnydZRqtSDHdxVy7Xl4ltNGiYu8ZT71th3VlGPsw/KkPwjnKKoVTPk65Gn2t4QTt+z3lsHCkJxCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKktWbxw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKktWbxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778362057; x=1809898057;
  h=date:from:to:cc:subject:message-id;
  bh=/OuMNF4QZCk4oU8o27czxbYwT5hK7lVgxQ5kXV9opN0=;
  b=GKktWbxwIhDQWyqfoUFbSK51k5NsM/eh8p6lcVZTFwCsilu6Ev0u4YB8
   3Yv6drPGIQepbY1et+jeEpi6Sh2RrKwBDvMUjDVGa5egu3ZzPwI8x5dZS
   m9gJaPEQUoNF/5j9ZlMPRJQluK2rl+wes5yXQyMdsdhQ+gYFhiO8LX2OS
   OrUP0CuMpKlTGebXC2y+99nSXU/QooATWE6wfl0ocOQpgKD7rPZHfynAG
   uQAouHiVy87KVAPZOy/b9uiGqMYG+/LaBN4PKfL49sR6IBLU9PHgBzR+S
   Gn/v4c5MF4A7R1Jk1vfiiuNtEn3PA6AXGUavtoIBMa2/9bDjU3pohlh7C
   w==;
X-CSE-ConnectionGUID: 3TmO+wTgQTeS6I7M2sh6Bg==
X-CSE-MsgGUID: y1ck5V1TQ1KpMwp7Fsawvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="82919694"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="82919694"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 14:27:37 -0700
X-CSE-ConnectionGUID: efToj+oeTOmg3enwYiLnSA==
X-CSE-MsgGUID: 1f+vKiINQzupT+4H/yLENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="232741185"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2026 14:27:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLpCr-000000007Y9-30t3;
	Sat, 09 May 2026 21:27:29 +0000
Date: Sat, 09 May 2026 23:27:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/helpers.c:2893:71: error: parameter 2 ('states')
 has incomplete type
Message-ID: <202605092332.XSLv5Bnu-lkp@intel.com>
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

tree:   https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/psi-add-psi_group_flush_stats-function/20260509-210713
head:   4a4580a71f5884e16d331476b601322cc2d41af7
commit: edf653aa3964af51ae2f2b180bcb0f6cfa26c8f7 bpf: add bpf_cgroup_{flush_stats,stall} function
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260509/202605092332.XSLv5Bnu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605092332.XSLv5Bnu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605092332.XSLv5Bnu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:2893:60: warning: 'enum psi_states' declared inside parameter list will not be visible outside of this definition or declaration
    2893 | __bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
         |                                                            ^~~~~~~~~~
>> kernel/bpf/helpers.c:2893:71: error: parameter 2 ('states') has incomplete type
    2893 | __bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
         |                                                       ~~~~~~~~~~~~~~~~^~~~~~
>> kernel/bpf/helpers.c:2893:17: error: function declaration isn't a prototype [-Werror=strict-prototypes]
    2893 | __bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
         |                 ^~~~~~~~~~~~~~~~
   In file included from ./include/uapi/linux/filter.h:9,
                    from ./include/linux/bpf.h:8,
                    from kernel/bpf/helpers.c:4:
   kernel/bpf/helpers.c: In function 'bpf_cgroup_stall':
>> kernel/bpf/helpers.c:2897:47: error: 'NR_PSI_STATES' undeclared (first use in this function); did you mean 'NR_NODE_STATES'?
    2897 |         if (unlikely(!group || (u32)states >= NR_PSI_STATES - 1))
         |                                               ^~~~~~~~~~~~~
   ./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/bpf/helpers.c:2897:47: note: each undeclared identifier is reported only once for each function it appears in
    2897 |         if (unlikely(!group || (u32)states >= NR_PSI_STATES - 1))
         |                                               ^~~~~~~~~~~~~
   ./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> kernel/bpf/helpers.c:2900:29: error: 'struct psi_group' has no member named 'total'
    2900 |         return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
         |                             ^~
>> kernel/bpf/helpers.c:2900:37: error: 'PSI_AVGS' undeclared (first use in this function)
    2900 |         return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
         |                                     ^~~~~~~~
   kernel/bpf/helpers.c: In function 'bpf_cgroup_flush_stats':
>> kernel/bpf/helpers.c:2914:9: error: implicit declaration of function 'psi_group_flush_stats'; did you mean 'bpf_cgroup_flush_stats'? [-Wimplicit-function-declaration]
    2914 |         psi_group_flush_stats(group);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         bpf_cgroup_flush_stats
   kernel/bpf/helpers.c: In function 'bpf_cgroup_stall':
>> kernel/bpf/helpers.c:2901:1: warning: control reaches end of non-void function [-Wreturn-type]
    2901 | }
         | ^
   cc1: some warnings being treated as errors


vim +2893 kernel/bpf/helpers.c

edf653aa3964af Vernon Yang  2026-05-08  2885  
edf653aa3964af Vernon Yang  2026-05-08  2886  /**
edf653aa3964af Vernon Yang  2026-05-08  2887   * bpf_cgroup_stall - acquire the total stall time of cgroup
edf653aa3964af Vernon Yang  2026-05-08  2888   * @cgrp: cgroup struct
edf653aa3964af Vernon Yang  2026-05-08  2889   * @states: psi states
edf653aa3964af Vernon Yang  2026-05-08  2890   *
edf653aa3964af Vernon Yang  2026-05-08  2891   * Return the total stall time.
edf653aa3964af Vernon Yang  2026-05-08  2892   */
edf653aa3964af Vernon Yang  2026-05-08 @2893  __bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
edf653aa3964af Vernon Yang  2026-05-08  2894  {
edf653aa3964af Vernon Yang  2026-05-08  2895  	struct psi_group *group = cgroup_psi(cgrp);
edf653aa3964af Vernon Yang  2026-05-08  2896  
edf653aa3964af Vernon Yang  2026-05-08 @2897  	if (unlikely(!group || (u32)states >= NR_PSI_STATES - 1))
edf653aa3964af Vernon Yang  2026-05-08  2898  		return (u64)-1;
edf653aa3964af Vernon Yang  2026-05-08  2899  
edf653aa3964af Vernon Yang  2026-05-08 @2900  	return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
edf653aa3964af Vernon Yang  2026-05-08 @2901  }
edf653aa3964af Vernon Yang  2026-05-08  2902  
edf653aa3964af Vernon Yang  2026-05-08  2903  /**
edf653aa3964af Vernon Yang  2026-05-08  2904   * bpf_cgroup_flush_stats - Flush cgroup's statistics
edf653aa3964af Vernon Yang  2026-05-08  2905   * @cgrp: cgroup struct
edf653aa3964af Vernon Yang  2026-05-08  2906   */
edf653aa3964af Vernon Yang  2026-05-08  2907  __bpf_kfunc void bpf_cgroup_flush_stats(struct cgroup *cgrp)
edf653aa3964af Vernon Yang  2026-05-08  2908  {
edf653aa3964af Vernon Yang  2026-05-08  2909  	struct psi_group *group = cgroup_psi(cgrp);
edf653aa3964af Vernon Yang  2026-05-08  2910  
edf653aa3964af Vernon Yang  2026-05-08  2911  	if (unlikely(!group))
edf653aa3964af Vernon Yang  2026-05-08  2912  		return;
edf653aa3964af Vernon Yang  2026-05-08  2913  
edf653aa3964af Vernon Yang  2026-05-08 @2914  	psi_group_flush_stats(group);
edf653aa3964af Vernon Yang  2026-05-08  2915  }
fda01efc61605a David Vernet 2022-11-21  2916  #endif /* CONFIG_CGROUPS */
fda01efc61605a David Vernet 2022-11-21  2917  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

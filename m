Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B951BC3F
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Jun 2025 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750003824; cv=none; b=NzWDIPZKS6T8+PPnka2gT50GFHajwKFuZ80p3I//PesqsCmEQGjfZks/EunkWlQmn2l/Dp7foHgyWB5LrtHx14+qMu2EBFWyU0ghuTWoEPT4TmU/G1WdKWB1tCn0h+ixrmbgzeEHkvVW1Rsdu2p+x4amnJokItTh+ByL38EkB/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750003824; c=relaxed/simple;
	bh=iDEJFagjkioWNwLFXnEbUEwZpZtEzsM4CxRjXzB0EPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cjXszjH7uu5wyxwXFq2wpoZ5GPJlMm0kAhPCaQaOaq3rigdOSL1FaftlL9BQJbonJbKYMY/zRuY4p2gfaGR/FFjlxqKVvkRcjP3I7IAYpCoXuJ4EhpHqMxJBFuOMY3oAmgDkeeXN5+Fdz6B0aYogu8y7hn8tuYlzAIAZie4M+f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yxzu57D6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yxzu57D6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750003822; x=1781539822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iDEJFagjkioWNwLFXnEbUEwZpZtEzsM4CxRjXzB0EPk=;
  b=Yxzu57D61wuXl7SXbecULm8Cx8BNq6GlfHnnucxkVv6FDIQMY7/Pa7TE
   FzjJYKqd/e+O5LhjfkAkwz8am1UGO621Gz+imF80JbaKK4UQ2h6dvCfl/
   TuMS03q8WhsINRRXIsqi0j3dXswNBPpASZKuR4Kl0xxOwkXgxm1xqQFuJ
   1X2MzsHB5a6bNOFCOb+zoQW3SMFeDA9hfUzH63bs9+WfaTQ7Bto8ZRJQo
   bv2+2PRP5J8M9tymU0w2uHrwe+DdUNQSV3mwnrrR83FJ0QsTQDeZNF0Fs
   rlYsQeoFXq9Gh3AMO8cvrX6YtGBZTQgFntN+8mN1w6KgKVskytOHd3y9h
   A==;
X-CSE-ConnectionGUID: LjfJN0dWTnqrlbDEf/f/kQ==
X-CSE-MsgGUID: AOzc5EiFR/y59Oknqnw0uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51376885"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="51376885"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 09:10:22 -0700
X-CSE-ConnectionGUID: gVtfcuKIT3aIWbD8ytUy8Q==
X-CSE-MsgGUID: UqXzZg8pQrG5z77SCd1lLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="148150130"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jun 2025 09:10:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQpw2-000EPg-0N;
	Sun, 15 Jun 2025 16:10:18 +0000
Date: Mon, 16 Jun 2025 00:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v14 13/32] fs/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters per domain
Message-ID: <202506152337.QnpVwzbV-lkp@intel.com>
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
In-Reply-To: <1a3ed4abaaebbcf2399068ef5004760e8722d9e0.1749848715.git.babu.moger@amd.com>
References: <1a3ed4abaaebbcf2399068ef5004760e8722d9e0.1749848715.git.babu.moger@amd.com>
TO: Babu Moger <babu.moger@amd.com>
TO: babu.moger@amd.com
TO: corbet@lwn.net
TO: tony.luck@intel.com
TO: reinette.chatre@intel.com
TO: Dave.Martin@arm.com
TO: james.morse@arm.com
TO: tglx@linutronix.de
TO: mingo@redhat.com
TO: bp@alien8.de
TO: dave.hansen@linux.intel.com
CC: x86@kernel.org
CC: hpa@zytor.com
CC: akpm@linux-foundation.org
CC: rostedt@goodmis.org
CC: paulmck@kernel.org
CC: thuth@redhat.com
CC: ardb@kernel.org
CC: gregkh@linuxfoundation.org
CC: seanjc@google.com
CC: thomas.lendacky@amd.com
CC: pawan.kumar.gupta@linux.intel.com
CC: manali.shukla@amd.com
CC: perry.yuan@amd.com
CC: kai.huang@intel.com
CC: peterz@infradead.org
CC: xiaoyao.li@intel.com
CC: kan.liang@linux.intel.com
CC: mario.limonciello@amd.com
CC: xin3.li@intel.com
CC: gautham.shenoy@amd.com

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.16-rc1 next-20250613]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-fs-resctrl-Remove-unappropriate-references-to-cacheinfo-in-the-resctrl-subsystem/20250614-051344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/1a3ed4abaaebbcf2399068ef5004760e8722d9e0.1749848715.git.babu.moger%40amd.com
patch subject: [PATCH v14 13/32] fs/resctrl: Introduce mbm_cntr_cfg to track assignable counters per domain
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250615 (https://download.01.org/0day-ci/archive/20250615/202506152337.QnpVwzbV-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506152337.QnpVwzbV-lkp@intel.com/

smatch warnings:
fs/resctrl/rdtgroup.c:4181 domain_setup_mon_state() error: uninitialized symbol 'idx'.

vim +/idx +4181 fs/resctrl/rdtgroup.c

7168ae330e8105 James Morse 2025-05-15  4135  
7168ae330e8105 James Morse 2025-05-15  4136  /**
7168ae330e8105 James Morse 2025-05-15  4137   * domain_setup_mon_state() -  Initialise domain monitoring structures.
7168ae330e8105 James Morse 2025-05-15  4138   * @r:	The resource for the newly online domain.
7168ae330e8105 James Morse 2025-05-15  4139   * @d:	The newly online domain.
7168ae330e8105 James Morse 2025-05-15  4140   *
7168ae330e8105 James Morse 2025-05-15  4141   * Allocate monitor resources that belong to this domain.
7168ae330e8105 James Morse 2025-05-15  4142   * Called when the first CPU of a domain comes online, regardless of whether
7168ae330e8105 James Morse 2025-05-15  4143   * the filesystem is mounted.
7168ae330e8105 James Morse 2025-05-15  4144   * During boot this may be called before global allocations have been made by
7168ae330e8105 James Morse 2025-05-15  4145   * resctrl_mon_resource_init().
7168ae330e8105 James Morse 2025-05-15  4146   *
7168ae330e8105 James Morse 2025-05-15  4147   * Returns 0 for success, or -ENOMEM.
7168ae330e8105 James Morse 2025-05-15  4148   */
7168ae330e8105 James Morse 2025-05-15  4149  static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain *d)
7168ae330e8105 James Morse 2025-05-15  4150  {
7168ae330e8105 James Morse 2025-05-15  4151  	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
cc090e096f5c8a Tony Luck   2025-06-13  4152  	size_t tsize = sizeof(*d->mbm_states[0]);
cc090e096f5c8a Tony Luck   2025-06-13  4153  	enum resctrl_event_id eventid;
cc090e096f5c8a Tony Luck   2025-06-13  4154  	int idx;
7168ae330e8105 James Morse 2025-05-15  4155  
e2b61edf2a3412 Tony Luck   2025-06-13  4156  	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
7168ae330e8105 James Morse 2025-05-15  4157  		d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
7168ae330e8105 James Morse 2025-05-15  4158  		if (!d->rmid_busy_llc)
7168ae330e8105 James Morse 2025-05-15  4159  			return -ENOMEM;
7168ae330e8105 James Morse 2025-05-15  4160  	}
cc090e096f5c8a Tony Luck   2025-06-13  4161  
cc090e096f5c8a Tony Luck   2025-06-13  4162  	for_each_mbm_event_id(eventid) {
cc090e096f5c8a Tony Luck   2025-06-13  4163  		if (!resctrl_is_mon_event_enabled(eventid))
cc090e096f5c8a Tony Luck   2025-06-13  4164  			continue;
cc090e096f5c8a Tony Luck   2025-06-13  4165  		idx = MBM_STATE_IDX(eventid);
cc090e096f5c8a Tony Luck   2025-06-13  4166  		d->mbm_states[idx] = kcalloc(idx_limit, tsize, GFP_KERNEL);
cc090e096f5c8a Tony Luck   2025-06-13  4167  		if (!d->mbm_states[idx])
cc090e096f5c8a Tony Luck   2025-06-13  4168  			goto cleanup;
7168ae330e8105 James Morse 2025-05-15  4169  	}
cc090e096f5c8a Tony Luck   2025-06-13  4170  
484a3872292c5e Babu Moger  2025-06-13  4171  	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
484a3872292c5e Babu Moger  2025-06-13  4172  		tsize = sizeof(*d->cntr_cfg);
484a3872292c5e Babu Moger  2025-06-13  4173  		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
484a3872292c5e Babu Moger  2025-06-13  4174  		if (!d->cntr_cfg)
484a3872292c5e Babu Moger  2025-06-13  4175  			goto cleanup;
484a3872292c5e Babu Moger  2025-06-13  4176  	}
484a3872292c5e Babu Moger  2025-06-13  4177  
cc090e096f5c8a Tony Luck   2025-06-13  4178  	return 0;
cc090e096f5c8a Tony Luck   2025-06-13  4179  cleanup:
7168ae330e8105 James Morse 2025-05-15  4180  	bitmap_free(d->rmid_busy_llc);
cc090e096f5c8a Tony Luck   2025-06-13 @4181  	while (--idx >= 0) {
cc090e096f5c8a Tony Luck   2025-06-13  4182  		kfree(d->mbm_states[idx]);
cc090e096f5c8a Tony Luck   2025-06-13  4183  		d->mbm_states[idx] = NULL;
7168ae330e8105 James Morse 2025-05-15  4184  	}
7168ae330e8105 James Morse 2025-05-15  4185  
cc090e096f5c8a Tony Luck   2025-06-13  4186  	return -ENOMEM;
7168ae330e8105 James Morse 2025-05-15  4187  }
7168ae330e8105 James Morse 2025-05-15  4188  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

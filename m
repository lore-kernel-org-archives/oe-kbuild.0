Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1666A2D
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 00:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725841336; cv=none; b=hIpO8ICxX3wQWsJzy63gtdxwRknTfL236eciuzNmYqyJ+UwEb+aijrAEXdjCRWj/uo7FSOexqpWay5S19k4kVNt7pRykTmUbb+AtnHGlq+d2N8zXdu3q6Gx9INtNxZJv07rhUXAwCxZe1h3zPVZI7kwijCUexNIJhS/4IUZ5fXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725841336; c=relaxed/simple;
	bh=T6kBA5s92tF2KrGV+a8dqN4ARfilvFXm8zEtc7pXZ1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOqEXJh+Mp8yGBNE2S60V0IHVCOJxJLFOXMh7brjEkNuubgIGnVA+aIKCP08iH1f3k8AzCn32o4WyRtiqIcJUoniuY03oVL9TlMgwEf2893jUB1qGUgJ+91l4xETBzCepvpEKqalY2qZ81Qd7P6wTjGA+wAa6LccJRdiFKbflL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhUW/sWt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhUW/sWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725841334; x=1757377334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T6kBA5s92tF2KrGV+a8dqN4ARfilvFXm8zEtc7pXZ1o=;
  b=LhUW/sWtKjYJcJY8mgLxGD+XwdVdU9OVJv04PTvJRAkvsiFyt4NWw504
   TLYiO0J2M8px6yQFDyvPOZOS0gKov5SExX8Gi7Fv8Pet5n5SAD6vDipAH
   PrN/2QLyLfQkP1Ekh8R1C1gSGjHC1oQfy3sZj1w6YQyCjVcMvqN5w/y0b
   J0OTzIjpk0sti4k85PDPDFx7zyN+NLR8D2zKyT1SVJvqgwZWLVOennOBM
   6CMJ7g5bLdXDHzj+Mp6LYw3JLhvLwRU/oD7EbwsSNcI6v85WZBrc8EmoY
   IQvhh1A91k7/aO+mU+19bPu04A7AgKt5t8uy6witCFv0zlet+026iWW8x
   Q==;
X-CSE-ConnectionGUID: TlPO7KIJRGSgNJS4WTsleQ==
X-CSE-MsgGUID: hSCFkLZKRj6UAU60V6Jq6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24066449"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24066449"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 17:22:10 -0700
X-CSE-ConnectionGUID: TY4Jre8SRgehIGZfjHpFpw==
X-CSE-MsgGUID: DKJxGxWwTdioWD460r92SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66488261"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2024 17:22:09 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snSAQ-000E6q-2R;
	Mon, 09 Sep 2024 00:22:06 +0000
Date: Mon, 9 Sep 2024 08:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/s390/kernel/perf_pai_crypto.c:255:27-32: ERROR: reference
 preceded by free on line 248
Message-ID: <202409090851.Y720zTPA-lkp@intel.com>
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
TO: Thomas Richter <tmricht@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
commit: 60f8f641f3db85edf20f9612f4801563119d7fd6 s390/pai_crypto: dynamically allocate percpu pai crypto map data structure
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-r054-20240909 (https://download.01.org/0day-ci/archive/20240909/202409090851.Y720zTPA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409090851.Y720zTPA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/s390/kernel/perf_pai_crypto.c:255:27-32: ERROR: reference preceded by free on line 248

vim +255 arch/s390/kernel/perf_pai_crypto.c

39d62336f5c126 Thomas Richter 2022-05-04  158  
39d62336f5c126 Thomas Richter 2022-05-04  159  /* Used to avoid races in checking concurrent access of counting and
39d62336f5c126 Thomas Richter 2022-05-04  160   * sampling for crypto events
39d62336f5c126 Thomas Richter 2022-05-04  161   *
39d62336f5c126 Thomas Richter 2022-05-04  162   * Only one instance of event pai_crypto/CRYPTO_ALL/ for sampling is
39d62336f5c126 Thomas Richter 2022-05-04  163   * allowed and when this event is running, no counting event is allowed.
39d62336f5c126 Thomas Richter 2022-05-04  164   * Several counting events are allowed in parallel, but no sampling event
39d62336f5c126 Thomas Richter 2022-05-04  165   * is allowed while one (or more) counting events are running.
39d62336f5c126 Thomas Richter 2022-05-04  166   *
39d62336f5c126 Thomas Richter 2022-05-04  167   * This function is called in process context and it is save to block.
39d62336f5c126 Thomas Richter 2022-05-04  168   * When the event initialization functions fails, no other call back will
39d62336f5c126 Thomas Richter 2022-05-04  169   * be invoked.
39d62336f5c126 Thomas Richter 2022-05-04  170   *
39d62336f5c126 Thomas Richter 2022-05-04  171   * Allocate the memory for the event.
39d62336f5c126 Thomas Richter 2022-05-04  172   */
60f8f641f3db85 Thomas Richter 2023-08-21  173  static struct paicrypt_map *paicrypt_busy(struct perf_event *event)
39d62336f5c126 Thomas Richter 2022-05-04  174  {
60f8f641f3db85 Thomas Richter 2023-08-21  175  	struct perf_event_attr *a = &event->attr;
60f8f641f3db85 Thomas Richter 2023-08-21  176  	struct paicrypt_map *cpump = NULL;
60f8f641f3db85 Thomas Richter 2023-08-21  177  	struct paicrypt_mapptr *mp;
60f8f641f3db85 Thomas Richter 2023-08-21  178  	int rc;
39d62336f5c126 Thomas Richter 2022-05-04  179  
39d62336f5c126 Thomas Richter 2022-05-04  180  	mutex_lock(&pai_reserve_mutex);
60f8f641f3db85 Thomas Richter 2023-08-21  181  
60f8f641f3db85 Thomas Richter 2023-08-21  182  	/* Allocate root node */
60f8f641f3db85 Thomas Richter 2023-08-21  183  	rc = paicrypt_root_alloc();
60f8f641f3db85 Thomas Richter 2023-08-21  184  	if (rc)
60f8f641f3db85 Thomas Richter 2023-08-21  185  		goto unlock;
60f8f641f3db85 Thomas Richter 2023-08-21  186  
60f8f641f3db85 Thomas Richter 2023-08-21  187  	/* Allocate node for this event */
60f8f641f3db85 Thomas Richter 2023-08-21  188  	mp = per_cpu_ptr(paicrypt_root.mapptr, event->cpu);
60f8f641f3db85 Thomas Richter 2023-08-21  189  	cpump = mp->mapptr;
60f8f641f3db85 Thomas Richter 2023-08-21  190  	if (!cpump) {			/* Paicrypt_map allocated? */
60f8f641f3db85 Thomas Richter 2023-08-21  191  		cpump = kzalloc(sizeof(*cpump), GFP_KERNEL);
60f8f641f3db85 Thomas Richter 2023-08-21  192  		if (!cpump) {
60f8f641f3db85 Thomas Richter 2023-08-21  193  			rc = -ENOMEM;
60f8f641f3db85 Thomas Richter 2023-08-21  194  			goto free_root;
60f8f641f3db85 Thomas Richter 2023-08-21  195  		}
60f8f641f3db85 Thomas Richter 2023-08-21  196  	}
60f8f641f3db85 Thomas Richter 2023-08-21  197  
39d62336f5c126 Thomas Richter 2022-05-04  198  	if (a->sample_period) {		/* Sampling requested */
d3db4ac3c761de Thomas Richter 2022-10-20  199  		if (cpump->mode != PAI_MODE_NONE)
39d62336f5c126 Thomas Richter 2022-05-04  200  			rc = -EBUSY;	/* ... sampling/counting active */
39d62336f5c126 Thomas Richter 2022-05-04  201  	} else {			/* Counting requested */
d3db4ac3c761de Thomas Richter 2022-10-20  202  		if (cpump->mode == PAI_MODE_SAMPLING)
39d62336f5c126 Thomas Richter 2022-05-04  203  			rc = -EBUSY;	/* ... and sampling active */
39d62336f5c126 Thomas Richter 2022-05-04  204  	}
60f8f641f3db85 Thomas Richter 2023-08-21  205  	/*
60f8f641f3db85 Thomas Richter 2023-08-21  206  	 * This error case triggers when there is a conflict:
60f8f641f3db85 Thomas Richter 2023-08-21  207  	 * Either sampling requested and counting already active, or visa
60f8f641f3db85 Thomas Richter 2023-08-21  208  	 * versa. Therefore the struct paicrypto_map for this CPU is
60f8f641f3db85 Thomas Richter 2023-08-21  209  	 * needed or the error could not have occurred. Only adjust root
60f8f641f3db85 Thomas Richter 2023-08-21  210  	 * node refcount.
60f8f641f3db85 Thomas Richter 2023-08-21  211  	 */
39d62336f5c126 Thomas Richter 2022-05-04  212  	if (rc)
60f8f641f3db85 Thomas Richter 2023-08-21  213  		goto free_root;
39d62336f5c126 Thomas Richter 2022-05-04  214  
39d62336f5c126 Thomas Richter 2022-05-04  215  	/* Allocate memory for counter page and counter extraction.
39d62336f5c126 Thomas Richter 2022-05-04  216  	 * Only the first counting event has to allocate a page.
39d62336f5c126 Thomas Richter 2022-05-04  217  	 */
ecc758cee6a108 Thomas Richter 2023-04-24  218  	if (cpump->page) {
ecc758cee6a108 Thomas Richter 2023-04-24  219  		refcount_inc(&cpump->refcnt);
39d62336f5c126 Thomas Richter 2022-05-04  220  		goto unlock;
ecc758cee6a108 Thomas Richter 2023-04-24  221  	}
39d62336f5c126 Thomas Richter 2022-05-04  222  
39d62336f5c126 Thomas Richter 2022-05-04  223  	rc = -ENOMEM;
39d62336f5c126 Thomas Richter 2022-05-04  224  	cpump->page = (unsigned long *)get_zeroed_page(GFP_KERNEL);
39d62336f5c126 Thomas Richter 2022-05-04  225  	if (!cpump->page)
60f8f641f3db85 Thomas Richter 2023-08-21  226  		goto free_paicrypt_map;
39d62336f5c126 Thomas Richter 2022-05-04  227  	cpump->save = kvmalloc_array(paicrypt_cnt + 1,
39d62336f5c126 Thomas Richter 2022-05-04  228  				     sizeof(struct pai_userdata), GFP_KERNEL);
39d62336f5c126 Thomas Richter 2022-05-04  229  	if (!cpump->save) {
39d62336f5c126 Thomas Richter 2022-05-04  230  		free_page((unsigned long)cpump->page);
39d62336f5c126 Thomas Richter 2022-05-04  231  		cpump->page = NULL;
60f8f641f3db85 Thomas Richter 2023-08-21  232  		goto free_paicrypt_map;
39d62336f5c126 Thomas Richter 2022-05-04  233  	}
60f8f641f3db85 Thomas Richter 2023-08-21  234  
60f8f641f3db85 Thomas Richter 2023-08-21  235  	/* Set mode and reference count */
39d62336f5c126 Thomas Richter 2022-05-04  236  	rc = 0;
ecc758cee6a108 Thomas Richter 2023-04-24  237  	refcount_set(&cpump->refcnt, 1);
60f8f641f3db85 Thomas Richter 2023-08-21  238  	cpump->mode = a->sample_period ? PAI_MODE_SAMPLING : PAI_MODE_COUNTING;
60f8f641f3db85 Thomas Richter 2023-08-21  239  	mp->mapptr = cpump;
d3db4ac3c761de Thomas Richter 2022-10-20  240  	debug_sprintf_event(cfm_dbg, 5, "%s sample_period %#llx users %d"
ecc758cee6a108 Thomas Richter 2023-04-24  241  			    " mode %d refcnt %u page %#lx save %p rc %d\n",
58354c7d35d35d Thomas Richter 2022-10-20  242  			    __func__, a->sample_period, cpump->active_events,
ecc758cee6a108 Thomas Richter 2023-04-24  243  			    cpump->mode, refcount_read(&cpump->refcnt),
39d62336f5c126 Thomas Richter 2022-05-04  244  			    (unsigned long)cpump->page, cpump->save, rc);
60f8f641f3db85 Thomas Richter 2023-08-21  245  	goto unlock;
60f8f641f3db85 Thomas Richter 2023-08-21  246  
60f8f641f3db85 Thomas Richter 2023-08-21  247  free_paicrypt_map:
60f8f641f3db85 Thomas Richter 2023-08-21 @248  	kfree(cpump);
60f8f641f3db85 Thomas Richter 2023-08-21  249  	mp->mapptr = NULL;
60f8f641f3db85 Thomas Richter 2023-08-21  250  free_root:
60f8f641f3db85 Thomas Richter 2023-08-21  251  	paicrypt_root_free();
60f8f641f3db85 Thomas Richter 2023-08-21  252  
60f8f641f3db85 Thomas Richter 2023-08-21  253  unlock:
39d62336f5c126 Thomas Richter 2022-05-04  254  	mutex_unlock(&pai_reserve_mutex);
60f8f641f3db85 Thomas Richter 2023-08-21 @255  	return rc ? ERR_PTR(rc) : cpump;
39d62336f5c126 Thomas Richter 2022-05-04  256  }
39d62336f5c126 Thomas Richter 2022-05-04  257  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

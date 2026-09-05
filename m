Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B0A26AF4
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Sep 2026 22:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788645854; cv=none; b=NXYF3PGMEToHbfvNdIq3ln/Vvy626yoPGMLx3bGB8EwB9uaXVV/4GqnlED843Nqt+DZJfFsRCoMjVhaxLMWBtLtdsSPzH54rIh19OO1cZ6jFxN+bO3rLpadzPfirk4XE5SH2qL0VyPz+mnLJ9MLtJbRItykQ/8QjcHD53xxaKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788645854; c=relaxed/simple;
	bh=p50nLtUDo4ZXx7o0xwVJNylSbf5y00NkQ6r5h0u6Mdo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OOlarojVRDDUjgSrShieSWvnD688DUVF5eoHEI/7W9slJxtXRsW/FgKt3mhP+z44CLaXFVa7SrZ/SlNIUeUBGWwcJyBIAzO06LwVxARPmCF9TXmcEvnM5VPLPOh+UhyeW8ySGGK/l56XGUeKVI+pj7sP/VB2ESzAdJdvgrMMwxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlxrrN9O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlxrrN9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788645852; x=1820181852;
  h=date:from:to:cc:subject:message-id;
  bh=p50nLtUDo4ZXx7o0xwVJNylSbf5y00NkQ6r5h0u6Mdo=;
  b=OlxrrN9OX8RTqT38HVEfSKbXLIBkxfOWrDSOm54Vxeh7dDoXcR5EbLOZ
   uwB/uq4kvwEvawjrcIanxI1IHb26GNLRP9wkMYkv8rxnbA+u1DWBOXpwT
   bpbUTF90x1+BK9meFb3hGgD7xMliUEJqYFUdJPqfdX4MfRUmmLcv1lkQg
   pS6VWtmWk82h/QJM3upCy5gf3W2thJWUPzAh3DUr8qMYqG6vlbMNH7ZxJ
   YI0/jppJtTGCh0CymG1FVh8N+A/UaT2F73MmY78Kr7vWEvPAGvKsnMI8s
   SgO1wDJm+Jekoczhkf9F7CIPnE4xKfyV5cfhZX4RSvL+DitcNcJMEfDUh
   w==;
X-CSE-ConnectionGUID: H3Rv0PmbQhevReZhfI7dvA==
X-CSE-MsgGUID: p+P2a7PbTUiTcGXoXCUSzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="99439188"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="99439188"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 15:04:12 -0700
X-CSE-ConnectionGUID: 7BCH0oZ0SKakxVSqMmGfTw==
X-CSE-MsgGUID: BtnBWtiZQbiFl9J30kz7QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="275645840"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Sep 2026 15:04:10 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2yUZ-0000000018F-38vQ;
	Sat, 05 Sep 2026 22:04:07 +0000
Date: Sun, 06 Sep 2026 06:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [paulmck-rcu:dev.2026.08.26b 52/70]
 kernel/rcu/srcutree.c:1973:3-9: preceding lock on line 1953
Message-ID: <202609060521.ZcMw4fGR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.08.26b
head:   02d3dbb63ea80cac75734d77309015f13d5e73c9
commit: e473ba35dc1c19ba17fb717920ebd8c6f880a825 [52/70] srcutree: Suppress srcu_advance_state() mutex_lock in atomic
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: i386-randconfig-053-20260906 (https://download.01.org/0day-ci/archive/20260906/202609060521.ZcMw4fGR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609060521.ZcMw4fGR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/rcu/srcutree.c:1973:3-9: preceding lock on line 1953
   kernel/rcu/srcutree.c:1982:3-9: preceding lock on line 1953
   kernel/rcu/srcutree.c:1991:3-9: preceding lock on line 1953

vim +1973 kernel/rcu/srcutree.c

dad81a2026841b5 Paul E. McKenney 2017-03-25  1940  
dad81a2026841b5 Paul E. McKenney 2017-03-25  1941  /*
da915ad5cf25b5f Paul E. McKenney 2017-04-05  1942   * Core SRCU state machine.  Push state bits of ->srcu_gp_seq
da915ad5cf25b5f Paul E. McKenney 2017-04-05  1943   * to SRCU_STATE_SCAN2, and invoke srcu_gp_end() when scan has
e473ba35dc1c19b Paul E. McKenney 2026-08-18  1944   * completed in that state.  Set is_atomic to indicate that
e473ba35dc1c19b Paul E. McKenney 2026-08-18  1945   * the caller is excluding other calls so that ->srcu_gp_mutex
e473ba35dc1c19b Paul E. McKenney 2026-08-18  1946   * is not needed, and to indicate that blocking is forbidden.
dad81a2026841b5 Paul E. McKenney 2017-03-25  1947   */
e473ba35dc1c19b Paul E. McKenney 2026-08-18  1948  static void srcu_advance_state(struct srcu_struct *ssp, bool is_atomic)
dad81a2026841b5 Paul E. McKenney 2017-03-25  1949  {
dad81a2026841b5 Paul E. McKenney 2017-03-25  1950  	int idx;
dad81a2026841b5 Paul E. McKenney 2017-03-25  1951  
e473ba35dc1c19b Paul E. McKenney 2026-08-18  1952  	if (!is_atomic)
e3a6ab25cfa0fcd Paul E. McKenney 2023-03-17 @1953  		mutex_lock(&ssp->srcu_sup->srcu_gp_mutex);
da915ad5cf25b5f Paul E. McKenney 2017-04-05  1954  
dad81a2026841b5 Paul E. McKenney 2017-03-25  1955  	/*
dad81a2026841b5 Paul E. McKenney 2017-03-25  1956  	 * Because readers might be delayed for an extended period after
821ca6fa15d8649 Paul E. McKenney 2024-12-19  1957  	 * fetching ->srcu_ctrp for their index, at any point in time there
dad81a2026841b5 Paul E. McKenney 2017-03-25  1958  	 * might well be readers using both idx=0 and idx=1.  We therefore
dad81a2026841b5 Paul E. McKenney 2017-03-25  1959  	 * need to wait for readers to clear from both index values before
dad81a2026841b5 Paul E. McKenney 2017-03-25  1960  	 * invoking a callback.
dad81a2026841b5 Paul E. McKenney 2017-03-25  1961  	 *
dad81a2026841b5 Paul E. McKenney 2017-03-25  1962  	 * The load-acquire ensures that we see the accesses performed
dad81a2026841b5 Paul E. McKenney 2017-03-25  1963  	 * by the prior grace period.
dad81a2026841b5 Paul E. McKenney 2017-03-25  1964  	 */
03200b5ca3b4d4e Paul E. McKenney 2023-03-17  1965  	idx = rcu_seq_state(smp_load_acquire(&ssp->srcu_sup->srcu_gp_seq)); /* ^^^ */
dad81a2026841b5 Paul E. McKenney 2017-03-25  1966  	if (idx == SRCU_STATE_IDLE) {
175b45ed343a9c5 Paul E. McKenney 2026-03-14  1967  		raw_spin_lock_irq_rcu_node(ssp->srcu_sup);
03200b5ca3b4d4e Paul E. McKenney 2023-03-17  1968  		if (ULONG_CMP_GE(ssp->srcu_sup->srcu_gp_seq, ssp->srcu_sup->srcu_gp_seq_needed)) {
03200b5ca3b4d4e Paul E. McKenney 2023-03-17  1969  			WARN_ON_ONCE(rcu_seq_state(ssp->srcu_sup->srcu_gp_seq));
175b45ed343a9c5 Paul E. McKenney 2026-03-14  1970  			raw_spin_unlock_irq_rcu_node(ssp->srcu_sup);
e473ba35dc1c19b Paul E. McKenney 2026-08-18  1971  			if (!is_atomic)
e3a6ab25cfa0fcd Paul E. McKenney 2023-03-17  1972  				mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
dad81a2026841b5 Paul E. McKenney 2017-03-25 @1973  			return;
dad81a2026841b5 Paul E. McKenney 2017-03-25  1974  		}
03200b5ca3b4d4e Paul E. McKenney 2023-03-17  1975  		idx = rcu_seq_state(READ_ONCE(ssp->srcu_sup->srcu_gp_seq));
dad81a2026841b5 Paul E. McKenney 2017-03-25  1976  		if (idx == SRCU_STATE_IDLE)
aacb5d91ab1bfbb Paul E. McKenney 2018-10-28  1977  			srcu_gp_start(ssp);
175b45ed343a9c5 Paul E. McKenney 2026-03-14  1978  		raw_spin_unlock_irq_rcu_node(ssp->srcu_sup);
da915ad5cf25b5f Paul E. McKenney 2017-04-05  1979  		if (idx != SRCU_STATE_IDLE) {
e473ba35dc1c19b Paul E. McKenney 2026-08-18  1980  			if (!is_atomic)
e3a6ab25cfa0fcd Paul E. McKenney 2023-03-17  1981  				mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
dad81a2026841b5 Paul E. McKenney 2017-03-25  1982  			return; /* Someone else started the grace period. */
dad81a2026841b5 Paul E. McKenney 2017-03-25  1983  		}
da915ad5cf25b5f Paul E. McKenney 2017-04-05  1984  	}
dad81a2026841b5 Paul E. McKenney 2017-03-25  1985  
03200b5ca3b4d4e Paul E. McKenney 2023-03-17  1986  	if (rcu_seq_state(READ_ONCE(ssp->srcu_sup->srcu_gp_seq)) == SRCU_STATE_SCAN1) {
821ca6fa15d8649 Paul E. McKenney 2024-12-19  1987  		idx = !(ssp->srcu_ctrp - &ssp->sda->srcu_ctrs[0]);
aacb5d91ab1bfbb Paul E. McKenney 2018-10-28  1988  		if (!try_check_zero(ssp, idx, 1)) {
e473ba35dc1c19b Paul E. McKenney 2026-08-18  1989  			if (!is_atomic)
e3a6ab25cfa0fcd Paul E. McKenney 2023-03-17  1990  				mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
dad81a2026841b5 Paul E. McKenney 2017-03-25  1991  			return; /* readers present, retry later. */
da915ad5cf25b5f Paul E. McKenney 2017-04-05  1992  		}
aacb5d91ab1bfbb Paul E. McKenney 2018-10-28  1993  		srcu_flip(ssp);
175b45ed343a9c5 Paul E. McKenney 2026-03-14  1994  		raw_spin_lock_irq_rcu_node(ssp->srcu_sup);
03200b5ca3b4d4e Paul E. McKenney 2023-03-17  1995  		rcu_seq_set_state(&ssp->srcu_sup->srcu_gp_seq, SRCU_STATE_SCAN2);
3b46679c623c276 Paul E. McKenney 2023-03-17  1996  		ssp->srcu_sup->srcu_n_exp_nodelay = 0;
175b45ed343a9c5 Paul E. McKenney 2026-03-14  1997  		raw_spin_unlock_irq_rcu_node(ssp->srcu_sup);
dad81a2026841b5 Paul E. McKenney 2017-03-25  1998  	}
dad81a2026841b5 Paul E. McKenney 2017-03-25  1999  
03200b5ca3b4d4e Paul E. McKenney 2023-03-17  2000  	if (rcu_seq_state(READ_ONCE(ssp->srcu_sup->srcu_gp_seq)) == SRCU_STATE_SCAN2) {
dad81a2026841b5 Paul E. McKenney 2017-03-25  2001  
dad81a2026841b5 Paul E. McKenney 2017-03-25  2002  		/*
dad81a2026841b5 Paul E. McKenney 2017-03-25  2003  		 * SRCU read-side critical sections are normally short,
dad81a2026841b5 Paul E. McKenney 2017-03-25  2004  		 * so check at least twice in quick succession after a flip.
dad81a2026841b5 Paul E. McKenney 2017-03-25  2005  		 */
821ca6fa15d8649 Paul E. McKenney 2024-12-19  2006  		idx = !(ssp->srcu_ctrp - &ssp->sda->srcu_ctrs[0]);
aacb5d91ab1bfbb Paul E. McKenney 2018-10-28  2007  		if (!try_check_zero(ssp, idx, 2)) {
e473ba35dc1c19b Paul E. McKenney 2026-08-18  2008  			if (!is_atomic)
e3a6ab25cfa0fcd Paul E. McKenney 2023-03-17  2009  				mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex);
da915ad5cf25b5f Paul E. McKenney 2017-04-05  2010  			return; /* readers present, retry later. */
da915ad5cf25b5f Paul E. McKenney 2017-04-05  2011  		}
3b46679c623c276 Paul E. McKenney 2023-03-17  2012  		ssp->srcu_sup->srcu_n_exp_nodelay = 0;
aacb5d91ab1bfbb Paul E. McKenney 2018-10-28  2013  		srcu_gp_end(ssp);  /* Releases ->srcu_gp_mutex. */
dad81a2026841b5 Paul E. McKenney 2017-03-25  2014  	}
dad81a2026841b5 Paul E. McKenney 2017-03-25  2015  }
dad81a2026841b5 Paul E. McKenney 2017-03-25  2016  

:::::: The code at line 1973 was first introduced by commit
:::::: dad81a2026841b5e2651aab58a7398c13cc05847 srcu: Introduce CLASSIC_SRCU Kconfig option

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0081B7081F
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 03:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773803600; cv=none; b=En1CS9sk7fziWgZKVN6Qd6cqmApiqAc2tMDW4EPvT3uKYYR/Rq6D1/c4sv+g6RquXhi89EhKDLBBk1AY+ztdZ8gE015sseZ+wgxzg5watcM26IMCnMtQtD7BNRodpyqFKd6nAgq+YZwBTkTaW5MVQWTR6ILZGBQBmkUm8nqe1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773803600; c=relaxed/simple;
	bh=yR7kmSMyy706Nbt4p2Sl1rT56TGKUMdS3p/eiZ4FTIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksnvz7NgbX7i7bSnBpXj8XaHyhRODV8IqADNqu0sdaTrfrjqkqQhunhwxglXqTDZ/ig+zIXBMTVTbVOsHD+PNTwDj8uZkWlggceguxZNk4TvRNT/iHjtxOs2bq38itNae1ZEWagAZXZTKY8TjZuUl8MWtXHSUwcVKiF+Yja4+v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOT8LNT+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOT8LNT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773803599; x=1805339599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yR7kmSMyy706Nbt4p2Sl1rT56TGKUMdS3p/eiZ4FTIA=;
  b=DOT8LNT+bGJdxDcG0yWWlgixML0TpB+PpscuEDJ7sMOoxA23bZV5EW/y
   oIkoKONVBivcR7XFM0Sz5sLg0tNSvnMSCoFkAHpoPpdaMbcuV3Li27grY
   fjBCTft+wIySWNF8WZakbtQrbsG0neDGEX3Dt3xwGqX8FhLVQRd8hO5Kq
   N1o3XpD/CunMcorwKASmLmiAXBDDdCWm30X+8HsT4IOihMWf0fdEQmyth
   yzR6S22xhHdcb14EM0AYxFaVsNfsRD1kcw2hr0u6IFWqDeFRwRBPUskMv
   XahBMPzDuib+ThNVhcD32p5qRESrGrm6XxB4EkrWRbuxmRwd9IYKFqOpq
   w==;
X-CSE-ConnectionGUID: E0h8CVuaRpqt6Py7VHaX5w==
X-CSE-MsgGUID: GPVIIk9QQvqSvSiJoLZtjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74971352"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74971352"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 20:13:18 -0700
X-CSE-ConnectionGUID: T2IKR14xSOWe3MllYwa9YQ==
X-CSE-MsgGUID: 4esRb+DGT3OS38BjmqMVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="218094381"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Mar 2026 20:13:17 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2hLN-000000002PN-37Mz;
	Wed, 18 Mar 2026 03:13:13 +0000
Date: Wed, 18 Mar 2026 11:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 15/15] rv: Add dl_server specific monitors
Message-ID: <202603181103.41vCG1ZQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/rv/automata.h:64:22: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260310105627.332044-16-gmonaco@redhat.com>
References: <20260310105627.332044-16-gmonaco@redhat.com>
TO: Gabriele Monaco <gmonaco@redhat.com>
TO: linux-kernel@vger.kernel.org
TO: Steven Rostedt <rostedt@goodmis.org>
TO: Nam Cao <namcao@linutronix.de>
TO: Juri Lelli <jlelli@redhat.com>
TO: Gabriele Monaco <gmonaco@redhat.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Masami Hiramatsu <mhiramat@kernel.org>
TO: linux-trace-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: Peter Zijlstra <peterz@infradead.org>
CC: Tomas Glozar <tglozar@redhat.com>
CC: Clark Williams <williams@redhat.com>
CC: John Kacur <jkacur@redhat.com>

Hi Gabriele,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/rv-Unify-DA-event-handling-functions-across-monitor-types/20260310-191222
base:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
patch link:    https://lore.kernel.org/r/20260310105627.332044-16-gmonaco%40redhat.com
patch subject: [PATCH v7 15/15] rv: Add dl_server specific monitors
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arc-randconfig-r112-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181103.41vCG1ZQ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181103.41vCG1ZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603181103.41vCG1ZQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/rv/monitors/boost/boost.c: note: in included file (through include/rv/ha_monitor.h):
>> include/rv/automata.h:64:22: sparse: sparse: unsigned value that used to be signed checked against zero?
   kernel/trace/rv/monitors/boost/boost.c:155:50: sparse: signed value source

vim +64 include/rv/automata.h

30984ccf31b7f0 Gabriele Monaco 2025-11-26  51  
30984ccf31b7f0 Gabriele Monaco 2025-11-26  52  /*
30984ccf31b7f0 Gabriele Monaco 2025-11-26  53   * model_get_next_state - process an automaton event occurrence
30984ccf31b7f0 Gabriele Monaco 2025-11-26  54   *
30984ccf31b7f0 Gabriele Monaco 2025-11-26  55   * Given the current state (curr_state) and the event (event), returns
30984ccf31b7f0 Gabriele Monaco 2025-11-26  56   * the next state, or INVALID_STATE in case of error.
30984ccf31b7f0 Gabriele Monaco 2025-11-26  57   */
fa9b26dfa172d1 Gabriele Monaco 2025-11-26  58  static inline enum states model_get_next_state(enum states curr_state,
30984ccf31b7f0 Gabriele Monaco 2025-11-26  59  					enum events event)
30984ccf31b7f0 Gabriele Monaco 2025-11-26  60  {
30984ccf31b7f0 Gabriele Monaco 2025-11-26  61  	if ((curr_state < 0) || (curr_state >= STATE_MAX))
30984ccf31b7f0 Gabriele Monaco 2025-11-26  62  		return INVALID_STATE;
30984ccf31b7f0 Gabriele Monaco 2025-11-26  63  
30984ccf31b7f0 Gabriele Monaco 2025-11-26 @64  	if ((event < 0) || (event >= EVENT_MAX))
30984ccf31b7f0 Gabriele Monaco 2025-11-26  65  		return INVALID_STATE;
30984ccf31b7f0 Gabriele Monaco 2025-11-26  66  
30984ccf31b7f0 Gabriele Monaco 2025-11-26  67  	return RV_AUTOMATON_NAME.function[curr_state][event];
30984ccf31b7f0 Gabriele Monaco 2025-11-26  68  }
30984ccf31b7f0 Gabriele Monaco 2025-11-26  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

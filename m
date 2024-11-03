Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58D2F2E
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Nov 2024 06:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730616623; cv=none; b=Kyll1vvKMJjQxi4KCw2rp9UKa1Ag4eUlKMcl1Y7JNKEzeNx3We1da1HaVr5j2NdvZcnmTw9yrW3uFW+aDCk5qgbdvR6ToORufsfj1Nfadf9+nxhFJa39UjwaepQ1HRFPY+Qvc1XnOZnIMgFHhgfYEZX8EH4gwX2ICwbb/t29Bjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730616623; c=relaxed/simple;
	bh=v32LrNDhD1ZtEaN/ZXw4VX125DvjFwSKlGSmKehAkVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AEadMYPE+uvzleBdaCcF1mz3xfqlOJfe3/hB3CWeWfRFgt/y2ABmF8ryRWLQ8bNE8KOfZF4flUqUGRJCH0xZSrNg7WSkTIdYZT0am8PVhCZyiWrrs/N7ZBqHqHasgmRS6FRAhJtu+TeWPkBkvZ+QymX4jewS2sKyXKmE39/QWXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCb3EuGI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCb3EuGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730616622; x=1762152622;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=v32LrNDhD1ZtEaN/ZXw4VX125DvjFwSKlGSmKehAkVA=;
  b=jCb3EuGI9DE2Azc/NeP+HTvWkIgNka8WZBSgMGotykpoeF2biNJHgBNb
   Q3rSYjqE+AA6Ib4mjb2iYqAbc4tHfVhguKsO5ud4Fm5f3GO2RULojjyHY
   OpcqRmOJ+j/Rf6PfpoKUkJvPnGsKBLEvzbJi14tQe5FlhBKXHuP9ufTzk
   AFRfYtvcehufv+v1EnPV7fcSYULDc6JO2HzdlUCXgd8PfSX8kYCADNVTy
   JK7ZwMcQOZSAhzLhT/GSc8H4ZAlLKjw9y5iQJp0f/Alm98g1XXN1oTqsl
   9bFhlaeNGPBnWE+Y2YimH/Z8VcPrSx5E0JmNcewvb+Nx4MEdSZphWf6k8
   Q==;
X-CSE-ConnectionGUID: bLn3A8g5TsS6yiKKKb8Wjg==
X-CSE-MsgGUID: XY8GmZ3eTAKJ0YTH7DPj0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="40907427"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="40907427"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 23:50:18 -0700
X-CSE-ConnectionGUID: c5AjlFqjQZefrx9ahDFYtg==
X-CSE-MsgGUID: eU1W4AtoT2eUw0z7oMHSQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="87860931"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Nov 2024 23:50:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7URC-000jlN-1H;
	Sun, 03 Nov 2024 06:50:14 +0000
Date: Sun, 3 Nov 2024 14:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/3] futex: Use explicit sizes for
 compat_exit_robust_list
Message-ID: <202411031424.iuL1KR5o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241101162147.284993-2-andrealmeid@igalia.com>
References: <20241101162147.284993-2-andrealmeid@igalia.com>
TO: "André Almeida" <andrealmeid@igalia.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Darren Hart <dvhart@infradead.org>
TO: Davidlohr Bueso <dave@stgolabs.net>
TO: Arnd Bergmann <arnd@arndb.de>
TO: sonicadvance1@gmail.com
CC: linux-kernel@vger.kernel.org
CC: kernel-dev@igalia.com
CC: linux-api@vger.kernel.org
CC: Nathan Chancellor <nathan@kernel.org>
CC: "André Almeida" <andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on tip/sched/core linus/master tip/x86/asm v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-Use-explicit-sizes-for-compat_exit_robust_list/20241102-002419
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20241101162147.284993-2-andrealmeid%40igalia.com
patch subject: [PATCH v2 1/3] futex: Use explicit sizes for compat_exit_robust_list
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241102 (https://download.01.org/0day-ci/archive/20241103/202411031424.iuL1KR5o-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411031424.iuL1KR5o-lkp@intel.com/

smatch warnings:
kernel/futex/core.c:839 exit_robust_list64() warn: check for integer overflow 'futex_offset'

vim +/futex_offset +839 kernel/futex/core.c

0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  792  
3b56fe6b46cffe kernel/futex/core.c André Almeida      2024-11-01  793  #ifdef CONFIG_64BIT
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  794  /*
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  795   * Walk curr->robust_list (very carefully, it's a userspace list!)
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  796   * and mark any locks found there dead, and notify any waiters.
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  797   *
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  798   * We silently return on any sign of list-walking problem.
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  799   */
3b56fe6b46cffe kernel/futex/core.c André Almeida      2024-11-01  800  static void exit_robust_list64(struct task_struct *curr)
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  801  {
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  802  	struct robust_list_head __user *head = curr->robust_list;
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  803  	struct robust_list __user *entry, *next_entry, *pending;
4c115e951d80af kernel/futex.c      Darren Hart        2010-11-04  804  	unsigned int limit = ROBUST_LIST_LIMIT, pi, pip;
3f649ab728cda8 kernel/futex.c      Kees Cook          2020-06-03  805  	unsigned int next_pi;
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  806  	unsigned long futex_offset;
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  807  	int rc;
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  808  
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  809  	/*
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  810  	 * Fetch the list head (which was registered earlier, via
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  811  	 * sys_set_robust_list()):
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  812  	 */
e3f2ddeac718c7 kernel/futex.c      Ingo Molnar        2006-07-29  813  	if (fetch_robust_entry(&entry, &head->list.next, &pi))
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  814  		return;
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  815  	/*
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  816  	 * Fetch the relative futex offset:
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  817  	 */
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  818  	if (get_user(futex_offset, &head->futex_offset))
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  819  		return;
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  820  	/*
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  821  	 * Fetch any possibly pending lock-add first, and handle it
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  822  	 * if it exists:
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  823  	 */
e3f2ddeac718c7 kernel/futex.c      Ingo Molnar        2006-07-29  824  	if (fetch_robust_entry(&pending, &head->list_op_pending, &pip))
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  825  		return;
e3f2ddeac718c7 kernel/futex.c      Ingo Molnar        2006-07-29  826  
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  827  	next_entry = NULL;	/* avoid warning with gcc */
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  828  	while (entry != &head->list) {
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  829  		/*
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  830  		 * Fetch the next entry in the list before calling
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  831  		 * handle_futex_death:
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  832  		 */
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  833  		rc = fetch_robust_entry(&next_entry, &entry->next, &next_pi);
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  834  		/*
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  835  		 * A pending lock might already be on the list, so
c87e2837be82df kernel/futex.c      Ingo Molnar        2006-06-27  836  		 * don't process it twice:
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  837  		 */
ca16d5bee59807 kernel/futex.c      Yang Tao           2019-11-06  838  		if (entry != pending) {
ba46df984b8e81 kernel/futex.c      Al Viro            2006-10-10 @839  			if (handle_futex_death((void __user *)entry + futex_offset,
ca16d5bee59807 kernel/futex.c      Yang Tao           2019-11-06  840  						curr, pi, HANDLE_DEATH_LIST))
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  841  				return;
ca16d5bee59807 kernel/futex.c      Yang Tao           2019-11-06  842  		}
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  843  		if (rc)
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  844  			return;
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  845  		entry = next_entry;
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  846  		pi = next_pi;
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  847  		/*
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  848  		 * Avoid excessively long or circular lists:
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  849  		 */
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  850  		if (!--limit)
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  851  			break;
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  852  
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  853  		cond_resched();
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  854  	}
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  855  
ca16d5bee59807 kernel/futex.c      Yang Tao           2019-11-06  856  	if (pending) {
9f96cb1e8bca17 kernel/futex.c      Martin Schwidefsky 2007-10-01  857  		handle_futex_death((void __user *)pending + futex_offset,
ca16d5bee59807 kernel/futex.c      Yang Tao           2019-11-06  858  				   curr, pip, HANDLE_DEATH_PENDING);
ca16d5bee59807 kernel/futex.c      Yang Tao           2019-11-06  859  	}
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  860  }
3b56fe6b46cffe kernel/futex/core.c André Almeida      2024-11-01  861  #else
3b56fe6b46cffe kernel/futex/core.c André Almeida      2024-11-01  862  static void exit_robust_list64(struct task_struct *curr)
3b56fe6b46cffe kernel/futex/core.c André Almeida      2024-11-01  863  {
3b56fe6b46cffe kernel/futex/core.c André Almeida      2024-11-01  864  	pr_warn("32bit kernel should not allow ROBUST_LIST_64BIT");
3b56fe6b46cffe kernel/futex/core.c André Almeida      2024-11-01  865  	return;
3b56fe6b46cffe kernel/futex/core.c André Almeida      2024-11-01  866  }
3b56fe6b46cffe kernel/futex/core.c André Almeida      2024-11-01  867  #endif
0771dfefc9e538 kernel/futex.c      Ingo Molnar        2006-03-27  868  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

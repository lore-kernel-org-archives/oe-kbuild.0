Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795235393;
	b=5slvrH/H712nMHeAJiNQITaBhYSalnZwikhSIQKDu1mhbZ4lW1xc4A0smK3WeNC2euKV
	 KNNKXZc6PrLqX256Y4uOpKvuJwF/jTYI1rUG4bSjin2o+kQkwt9ayOlxKgkc4DWz6iJU3
	 tzHvAd7sPF/rNEdQAUFZtZ1BxWwvwO/AH5DPzavUdOqWapw1tcDw3GxBUI3/vFaFYodK0
	 MZ4QaVvtnqhMdp0Oo9Wp5u/hvVRIu3TfqrXxDXciQpHorJ9Jncupjq/C5GRm9nS20zllp
	 Qjeh6uDjJKo+PAp/NBWdUZ6VjZa4N1QmWJB1SplhgsHAqE6AG7NeYERCnXeYXH7dMTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795235393;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=Oeg5twX5Eu9hnchwNPeFIPvt1rE/vBWcMAZOG4rudA0=;
	b=qm/mxbOjVj1WQzh+PRh104i86aw8GMeIbDfUO8bWojbVJ5EMdRbukGqA/QUDqKsteRlQ
	 Eo/qD6jgJpjbzePoDxOUIizP2f96sT6uQTqJExU2jwqvqNBs54JIxYLb4A+j8+UiSwxAu
	 jSuPjsHDHYuprS0ACur6FYt8zzkNW5LdnC2lnomJlCZLH7OZrgpAkglc+u3THs/rRSt2v
	 N3xBthwiuMF6oQHKBI1HrjyeKAsPncqlFhQLg2pcecJCEEQBS47elfTN+dwLrGNz3MP6F
	 /RInCNFmTyjkbUhMp4V7N+dpN71jeK6Mkn9wKPc1c4v3nks/VtmRqww9T4+dDQHJFzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QoCVps5C;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A54B606A6BD
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 04:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A54B606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QoCVps5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795235391; x=1826771391;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NFpQuk607abQoKhGsEKfpIobowQjDrEhaLVo06XEDig=;
  b=QoCVps5CQ+Ww18HCIHEhdZ71dXZVCCkbT98VWBGcR1n7jnJweixddoim
   DD0NiQ6dW4/BA46gPPrSR/mc4kCEZRQ3dokuzEXLZJ//LHU96Bcg5y1Rq
   915WAUooVkLjwG0+X6LQzJXFlT/uOtUj6tipbYq1mf0K/q7TfuWgpEPAW
   /uLUsqBdOKP89PCX5J2n406liadIlenj4AVpFx7pBS+/hKRizb4nU+5+B
   +jQdM6NfzMj2pkjvTzFck+Pgv/aMnACu7dXMtlNdw1tpRdQhsRx1emP8E
   NO20b3IEUgCyyWrmSmw0EPqI0cSK+CLwqNB2bEbh8WMZc/wdwnkozAyie
   g==;
X-CSE-ConnectionGUID: gHiwX9geT8O+ptNEQxvIuA==
X-CSE-MsgGUID: 5UZVsnfQQnaAAfOhY/SLPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4123183"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4123183"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 20:29:51 -0800
X-CSE-ConnectionGUID: /ztTjvjSRrusUd2Q9UEchg==
X-CSE-MsgGUID: ofCS3kC+SPidy2rrhkLMQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10759128"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 20 Nov 2026 20:29:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUcjR-000000004Ef-397D;
	Sat, 21 Nov 2026 04:29:45 +0000
Date: Sat, 21 Nov 2026 05:29:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 05/10] futex: Create get_robust_list2() syscall
Message-ID: <20261121051836.KdlAcGYi-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261115-tonyk-robust_futex-v8-5-a4fe47333a28@igalia.com>
References: <20261115-tonyk-robust_futex-v8-5-a4fe47333a28@igalia.com>
TO: "André Almeida" <andrealmeid@igalia.com>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Darren Hart <dvhart@infradead.org>
TO: Davidlohr Bueso <dave@stgolabs.net>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
TO: Waiman Long <longman@redhat.com>
TO: Ryan Houdek <Sonicadvance1@gmail.com>
TO: Thomas Gleixner <tglx@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: linux-api@vger.kernel.org
CC: kernel-dev@igalia.com
CC: "André Almeida" <andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9f74092fda91ef93c2b07585785c1dc83cd7971f]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-Skip-test_futex_robust_unlock-if-not-supported/20261115-143110
base:   9f74092fda91ef93c2b07585785c1dc83cd7971f
patch link:    https://lore.kernel.org/r/20261115-tonyk-robust_futex-v8-5-a4fe47333a28%40igalia.com
patch subject: [PATCH v8 05/10] futex: Create get_robust_list2() syscall
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: microblaze-randconfig-r2306-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121051836.KdlAcGYi-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121051836.KdlAcGYi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121051836.KdlAcGYi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/futex/syscalls.c:119:46: sparse: sparse: dereference of noderef expression
   kernel/futex/syscalls.c:216:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct robust_list_head *head @@     got struct robust_list_head [noderef] __user * @@
   kernel/futex/syscalls.c:216:14: sparse:     expected struct robust_list_head *head
   kernel/futex/syscalls.c:216:14: sparse:     got struct robust_list_head [noderef] __user *
>> kernel/futex/syscalls.c:218:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *volatile __pu_val @@     got struct robust_list_head *head @@
   kernel/futex/syscalls.c:218:16: sparse:     expected void [noderef] __user *volatile __pu_val
   kernel/futex/syscalls.c:218:16: sparse:     got struct robust_list_head *head

vim +218 kernel/futex/syscalls.c

af8cc9600bbf22 Peter Zijlstra 2021-09-23  115  
5384a6aeaf2edf André Almeida  2026-11-15  116  SYSCALL_DEFINE4(set_robust_list2, struct robust_list_head * __user, head, unsigned int,
5384a6aeaf2edf André Almeida  2026-11-15  117  		cmd, unsigned int, index, unsigned int, flags)
5384a6aeaf2edf André Almeida  2026-11-15  118  {
5384a6aeaf2edf André Almeida  2026-11-15 @119  	uintptr_t entry = (__force uintptr_t)head;
5384a6aeaf2edf André Almeida  2026-11-15  120  	size_t align = sizeof(u32);
5384a6aeaf2edf André Almeida  2026-11-15  121  	int ret;
5384a6aeaf2edf André Almeida  2026-11-15  122  
5384a6aeaf2edf André Almeida  2026-11-15  123  	if (flags)
5384a6aeaf2edf André Almeida  2026-11-15  124  		return -EINVAL;
5384a6aeaf2edf André Almeida  2026-11-15  125  
5384a6aeaf2edf André Almeida  2026-11-15  126  	if (cmd >= FUTEX_ROBUST_LIST_CMD_USER_MAX)
5384a6aeaf2edf André Almeida  2026-11-15  127  		return -EINVAL;
5384a6aeaf2edf André Almeida  2026-11-15  128  
5384a6aeaf2edf André Almeida  2026-11-15  129  	if (cmd == FUTEX_ROBUST_LIST_CMD_CREATE_64 ||
5384a6aeaf2edf André Almeida  2026-11-15  130  	    cmd == FUTEX_ROBUST_LIST_CMD_MODIFY_64) {
5384a6aeaf2edf André Almeida  2026-11-15  131  		if (futex_in_32bit_syscall())
5384a6aeaf2edf André Almeida  2026-11-15  132  			return -EOPNOTSUPP;
5384a6aeaf2edf André Almeida  2026-11-15  133  		align = sizeof(u64);
5384a6aeaf2edf André Almeida  2026-11-15  134  	}
5384a6aeaf2edf André Almeida  2026-11-15  135  
5384a6aeaf2edf André Almeida  2026-11-15  136  	switch (cmd) {
5384a6aeaf2edf André Almeida  2026-11-15  137  	case FUTEX_ROBUST_LIST_CMD_CREATE_64:
5384a6aeaf2edf André Almeida  2026-11-15  138  	case FUTEX_ROBUST_LIST_CMD_CREATE_32:
5384a6aeaf2edf André Almeida  2026-11-15  139  		if (index)
5384a6aeaf2edf André Almeida  2026-11-15  140  			return -EINVAL;
5384a6aeaf2edf André Almeida  2026-11-15  141  
5384a6aeaf2edf André Almeida  2026-11-15  142  		if (entry % align)
5384a6aeaf2edf André Almeida  2026-11-15  143  			return -EINVAL;
5384a6aeaf2edf André Almeida  2026-11-15  144  
5384a6aeaf2edf André Almeida  2026-11-15  145  		/*
5384a6aeaf2edf André Almeida  2026-11-15  146  		 * The first two indexes are reserved for the kernel to be used
5384a6aeaf2edf André Almeida  2026-11-15  147  		 * with the legacy syscall, so we hide them from userspace.
5384a6aeaf2edf André Almeida  2026-11-15  148  		 *
5384a6aeaf2edf André Almeida  2026-11-15  149  		 * We map [0, FUTEX_ROBUST_LISTS_PER_USER) to
5384a6aeaf2edf André Almeida  2026-11-15  150  		 *  [FUTEX_ROBUST_LIST2_IDX, FUTEX_ROBUST_LIST2_MAX_IDX)
5384a6aeaf2edf André Almeida  2026-11-15  151  		 */
5384a6aeaf2edf André Almeida  2026-11-15  152  		ret = futex_robust_list_create(entry, cmd);
5384a6aeaf2edf André Almeida  2026-11-15  153  
5384a6aeaf2edf André Almeida  2026-11-15  154  		if (ret >= 0)
5384a6aeaf2edf André Almeida  2026-11-15  155  			ret -= FUTEX_ROBUST_LIST2_IDX;
5384a6aeaf2edf André Almeida  2026-11-15  156  
5384a6aeaf2edf André Almeida  2026-11-15  157  		return ret;
5384a6aeaf2edf André Almeida  2026-11-15  158  
5384a6aeaf2edf André Almeida  2026-11-15  159  	case FUTEX_ROBUST_LIST_CMD_MODIFY_64:
5384a6aeaf2edf André Almeida  2026-11-15  160  	case FUTEX_ROBUST_LIST_CMD_MODIFY_32:
5384a6aeaf2edf André Almeida  2026-11-15  161  		if (entry % align)
5384a6aeaf2edf André Almeida  2026-11-15  162  			return -EINVAL;
5384a6aeaf2edf André Almeida  2026-11-15  163  		return futex_robust_list_modify(entry, cmd, index);
5384a6aeaf2edf André Almeida  2026-11-15  164  	case FUTEX_ROBUST_LIST_CMD_LIST_LIMIT:
5384a6aeaf2edf André Almeida  2026-11-15  165  		return FUTEX_ROBUST_LISTS_PER_USER;
5384a6aeaf2edf André Almeida  2026-11-15  166  	}
5384a6aeaf2edf André Almeida  2026-11-15  167  
5384a6aeaf2edf André Almeida  2026-11-15  168  	return -EINVAL;
5384a6aeaf2edf André Almeida  2026-11-15  169  }
5384a6aeaf2edf André Almeida  2026-11-15  170  
5588aabbe40841 André Almeida  2026-11-15  171  SYSCALL_DEFINE4(get_robust_list2, int, pid,
5588aabbe40841 André Almeida  2026-11-15  172  		void __user * __user *, head_ptr,
5588aabbe40841 André Almeida  2026-11-15  173  		unsigned int, index, unsigned int, flags)
5588aabbe40841 André Almeida  2026-11-15  174  {
5588aabbe40841 André Almeida  2026-11-15  175  	struct robust_list_head *head;
5588aabbe40841 André Almeida  2026-11-15  176  	void __user *entry_ptr;
5588aabbe40841 André Almeida  2026-11-15  177  	uintptr_t entry;
5588aabbe40841 André Almeida  2026-11-15  178  
5588aabbe40841 André Almeida  2026-11-15  179  	if (index >= FUTEX_ROBUST_LISTS_PER_USER)
5588aabbe40841 André Almeida  2026-11-15  180  		return -EINVAL;
5588aabbe40841 André Almeida  2026-11-15  181  
5588aabbe40841 André Almeida  2026-11-15  182  	if (flags)
5588aabbe40841 André Almeida  2026-11-15  183  		return -EINVAL;
5588aabbe40841 André Almeida  2026-11-15  184  
5588aabbe40841 André Almeida  2026-11-15  185  	/*
5588aabbe40841 André Almeida  2026-11-15  186  	 * The first two indexes are reserved for the kernel to be used with the
5588aabbe40841 André Almeida  2026-11-15  187  	 * legacy syscall, so we hide them from userspace.
5588aabbe40841 André Almeida  2026-11-15  188  	 *
5588aabbe40841 André Almeida  2026-11-15  189  	 * We map [0, FUTEX_ROBUST_LISTS_PER_USER) to
5588aabbe40841 André Almeida  2026-11-15  190  	 *  [FUTEX_ROBUST_LIST2_IDX, FUTEX_ROBUST_LIST2_MAX_IDX)
5588aabbe40841 André Almeida  2026-11-15  191  	 */
5588aabbe40841 André Almeida  2026-11-15  192  	index += FUTEX_ROBUST_LIST2_IDX;
5588aabbe40841 André Almeida  2026-11-15  193  
5588aabbe40841 André Almeida  2026-11-15  194  	entry_ptr = futex_get_robust_list_common(pid, false, index);
5588aabbe40841 André Almeida  2026-11-15  195  	if (IS_ERR(entry_ptr))
5588aabbe40841 André Almeida  2026-11-15  196  		return PTR_ERR(entry_ptr);
5588aabbe40841 André Almeida  2026-11-15  197  
5588aabbe40841 André Almeida  2026-11-15  198  	entry = (uintptr_t) entry_ptr;
5588aabbe40841 André Almeida  2026-11-15  199  
5588aabbe40841 André Almeida  2026-11-15  200  	if (futex_in_32bit_syscall()) {
5588aabbe40841 André Almeida  2026-11-15  201  		u32 entry32;
5588aabbe40841 André Almeida  2026-11-15  202  
5588aabbe40841 André Almeida  2026-11-15  203  		if (entry && !(entry & FUTEX_ROBUST_LIST_ENTRY_32BIT))
5588aabbe40841 André Almeida  2026-11-15  204  			return -EOPNOTSUPP;
5588aabbe40841 André Almeida  2026-11-15  205  
5588aabbe40841 André Almeida  2026-11-15  206  		entry32 = (u32)entry;
5588aabbe40841 André Almeida  2026-11-15  207  		entry32 &= FUTEX_ROBUST_LIST_ENTRY_MASK;
5588aabbe40841 André Almeida  2026-11-15  208  
5588aabbe40841 André Almeida  2026-11-15  209  		if (copy_to_user(head_ptr, &entry32, sizeof(entry32)))
5588aabbe40841 André Almeida  2026-11-15  210  			return -EFAULT;
5588aabbe40841 André Almeida  2026-11-15  211  
5588aabbe40841 André Almeida  2026-11-15  212  		return 0;
5588aabbe40841 André Almeida  2026-11-15  213  	}
5588aabbe40841 André Almeida  2026-11-15  214  
5588aabbe40841 André Almeida  2026-11-15  215  	entry &= FUTEX_ROBUST_LIST_ENTRY_MASK;
5588aabbe40841 André Almeida  2026-11-15  216  	head = (__force struct robust_list_head __user *)entry;
5588aabbe40841 André Almeida  2026-11-15  217  
5588aabbe40841 André Almeida  2026-11-15 @218  	return put_user(head, head_ptr);
5588aabbe40841 André Almeida  2026-11-15  219  }
5588aabbe40841 André Almeida  2026-11-15  220  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53FA1DF991
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Apr 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282908; cv=none; b=dTxq2Z4fRqPME+Jf87TAY5JgzmxDQOKQnpUIEY7YxuwxOiZ5PLCIdQXeZWvn80WI4TN/ht7mXPsqWBx5N+QjcmG14BtFZB+RkJFb+mBRWVKKZIA81ATanYcjYpCPjOMA4q7f8K6bsINqer6m/kn8uVTF2XUAbgfZlOoZdAnJb9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282908; c=relaxed/simple;
	bh=heW8OLDxh0101gtdiHs26IeQsqda5lhz3fiLX1kReos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZSAlHKeBbK5mGdyUxbNP105nrO+PCwzwtUC58ti6uP5fzGNpc1hDFpsAG8daaMCVhIUtBn4G8r8rBEngrKWrVsWyT7vQexbyfh2uhEwbZL5MYBi8CH7ThTN4gnbaE19WKbUrVzTbBabvuCNnIUX17bVisVe9yY4sgZJONDgHTBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Td7wW6MU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Td7wW6MU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744282906; x=1775818906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=heW8OLDxh0101gtdiHs26IeQsqda5lhz3fiLX1kReos=;
  b=Td7wW6MUOQekbI6fLpaQGsg1bmKrIosUhF0+SubOv8iHJIp2sqiIUca8
   QuY+7kAPXHmqnXR/w9PjYR8jCdZklc1+scEvs1GxB9k8xNChKhv2t2W0o
   ozd9h6A4gA/HRJUuR6XnVyFvInbkFWvQ0imh2RINf08+kawczFLtiBR3P
   +M/vIB9LfZ9bPoJX7+cbr5Xsf/jV0p2uNino+gswhbb3wTOpPWj6xHiET
   Mh3YZVmtexpgeq43kAM5i5xwg82jAHx5EacVE8VIhk5KyInksFP3CeJLV
   ptd4l9GJH9SLgNXXcHa3jQof334LBqRPromnpcylIbBD7yrEAcienqN+z
   g==;
X-CSE-ConnectionGUID: BnL3XWVUSsGDaBooH3NQiA==
X-CSE-MsgGUID: Js8WKAuUTNi0xzAidEg/Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="44934648"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="44934648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 04:01:45 -0700
X-CSE-ConnectionGUID: kcOgYoF3RKOsMWFMjh8Phg==
X-CSE-MsgGUID: YElEVx+VSBCZfcmVHXk4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133992850"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2025 04:01:44 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2pfB-0009yF-18;
	Thu, 10 Apr 2025 11:01:41 +0000
Date: Thu, 10 Apr 2025 19:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ast-bpf:trylock 2/7] kernel/kcov.c:865 kcov_remote_start() warn:
 statement has no effect 31
Message-ID: <202504101818.Q7rbiK2C-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>
CC: Shakeel Butt <shakeel.butt@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   d809b75828b32fca381d054bf0dbe2fd661a0a37
commit: 1a3651c92680654bbdbd212e40eb5384bcc27fc9 [2/7] locking/local_lock, mm: Replace localtry_ helpers with local_trylock_t type
:::::: branch date: 10 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101818.Q7rbiK2C-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504101818.Q7rbiK2C-lkp@intel.com/

smatch warnings:
kernel/kcov.c:865 kcov_remote_start() warn: statement has no effect 31
kernel/kcov.c:1007 kcov_remote_stop() warn: statement has no effect 31

vim +865 kernel/kcov.c

5ff3b30ab57da8 Andrey Konovalov          2020-06-04   848  
eec028c9386ed1 Andrey Konovalov          2019-12-04   849  void kcov_remote_start(u64 handle)
eec028c9386ed1 Andrey Konovalov          2019-12-04   850  {
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04   851  	struct task_struct *t = current;
eec028c9386ed1 Andrey Konovalov          2019-12-04   852  	struct kcov_remote *remote;
67b3d3cca38550 Andrey Konovalov          2020-06-04   853  	struct kcov *kcov;
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04   854  	unsigned int mode;
eec028c9386ed1 Andrey Konovalov          2019-12-04   855  	void *area;
eec028c9386ed1 Andrey Konovalov          2019-12-04   856  	unsigned int size;
eec028c9386ed1 Andrey Konovalov          2019-12-04   857  	int sequence;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   858  	unsigned long flags;
eec028c9386ed1 Andrey Konovalov          2019-12-04   859  
eec028c9386ed1 Andrey Konovalov          2019-12-04   860  	if (WARN_ON(!kcov_check_handle(handle, true, true, true)))
eec028c9386ed1 Andrey Konovalov          2019-12-04   861  		return;
7d4df2dad312f2 Andrey Konovalov          2024-07-29   862  	if (!in_task() && !in_softirq_really())
eec028c9386ed1 Andrey Konovalov          2019-12-04   863  		return;
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04   864  
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  @865  	local_lock_irqsave(&kcov_percpu_data.lock, flags);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   866  
eec028c9386ed1 Andrey Konovalov          2019-12-04   867  	/*
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   868  	 * Check that kcov_remote_start() is not called twice in background
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   869  	 * threads nor called by user tasks (with enabled kcov).
eec028c9386ed1 Andrey Konovalov          2019-12-04   870  	 */
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04   871  	mode = READ_ONCE(t->kcov_mode);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   872  	if (WARN_ON(in_task() && kcov_mode_enabled(mode))) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08   873  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
eec028c9386ed1 Andrey Konovalov          2019-12-04   874  		return;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   875  	}
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   876  	/*
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   877  	 * Check that kcov_remote_start() is not called twice in softirqs.
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   878  	 * Note, that kcov_remote_start() can be called from a softirq that
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   879  	 * happened while collecting coverage from a background thread.
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   880  	 */
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   881  	if (WARN_ON(in_serving_softirq() && t->kcov_softirq)) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08   882  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   883  		return;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   884  	}
eec028c9386ed1 Andrey Konovalov          2019-12-04   885  
eec028c9386ed1 Andrey Konovalov          2019-12-04   886  	spin_lock(&kcov_remote_lock);
eec028c9386ed1 Andrey Konovalov          2019-12-04   887  	remote = kcov_remote_find(handle);
eec028c9386ed1 Andrey Konovalov          2019-12-04   888  	if (!remote) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08   889  		spin_unlock(&kcov_remote_lock);
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08   890  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
eec028c9386ed1 Andrey Konovalov          2019-12-04   891  		return;
eec028c9386ed1 Andrey Konovalov          2019-12-04   892  	}
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   893  	kcov_debug("handle = %llx, context: %s\n", handle,
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   894  			in_task() ? "task" : "softirq");
67b3d3cca38550 Andrey Konovalov          2020-06-04   895  	kcov = remote->kcov;
eec028c9386ed1 Andrey Konovalov          2019-12-04   896  	/* Put in kcov_remote_stop(). */
67b3d3cca38550 Andrey Konovalov          2020-06-04   897  	kcov_get(kcov);
eec028c9386ed1 Andrey Konovalov          2019-12-04   898  	/*
eec028c9386ed1 Andrey Konovalov          2019-12-04   899  	 * Read kcov fields before unlock to prevent races with
eec028c9386ed1 Andrey Konovalov          2019-12-04   900  	 * KCOV_DISABLE / kcov_remote_reset().
eec028c9386ed1 Andrey Konovalov          2019-12-04   901  	 */
67b3d3cca38550 Andrey Konovalov          2020-06-04   902  	mode = kcov->mode;
67b3d3cca38550 Andrey Konovalov          2020-06-04   903  	sequence = kcov->sequence;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   904  	if (in_task()) {
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   905  		size = kcov->remote_size;
eec028c9386ed1 Andrey Konovalov          2019-12-04   906  		area = kcov_remote_area_get(size);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   907  	} else {
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   908  		size = CONFIG_KCOV_IRQ_AREA_SIZE;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   909  		area = this_cpu_ptr(&kcov_percpu_data)->irq_area;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   910  	}
22036abe17c9f6 Sebastian Andrzej Siewior 2021-11-08   911  	spin_unlock(&kcov_remote_lock);
eec028c9386ed1 Andrey Konovalov          2019-12-04   912  
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   913  	/* Can only happen when in_task(). */
eec028c9386ed1 Andrey Konovalov          2019-12-04   914  	if (!area) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08   915  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
eec028c9386ed1 Andrey Konovalov          2019-12-04   916  		area = vmalloc(size * sizeof(unsigned long));
eec028c9386ed1 Andrey Konovalov          2019-12-04   917  		if (!area) {
67b3d3cca38550 Andrey Konovalov          2020-06-04   918  			kcov_put(kcov);
eec028c9386ed1 Andrey Konovalov          2019-12-04   919  			return;
eec028c9386ed1 Andrey Konovalov          2019-12-04   920  		}
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08   921  		local_lock_irqsave(&kcov_percpu_data.lock, flags);
22036abe17c9f6 Sebastian Andrzej Siewior 2021-11-08   922  	}
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   923  
eec028c9386ed1 Andrey Konovalov          2019-12-04   924  	/* Reset coverage size. */
eec028c9386ed1 Andrey Konovalov          2019-12-04   925  	*(u64 *)area = 0;
eec028c9386ed1 Andrey Konovalov          2019-12-04   926  
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   927  	if (in_serving_softirq()) {
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   928  		kcov_remote_softirq_start(t);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   929  		t->kcov_softirq = 1;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   930  	}
76484b1c77242b Andrey Konovalov          2020-06-04   931  	kcov_start(t, kcov, size, area, mode, sequence);
eec028c9386ed1 Andrey Konovalov          2019-12-04   932  
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08   933  	local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04   934  
eec028c9386ed1 Andrey Konovalov          2019-12-04   935  }
eec028c9386ed1 Andrey Konovalov          2019-12-04   936  EXPORT_SYMBOL(kcov_remote_start);
eec028c9386ed1 Andrey Konovalov          2019-12-04   937  
eec028c9386ed1 Andrey Konovalov          2019-12-04   938  static void kcov_move_area(enum kcov_mode mode, void *dst_area,
eec028c9386ed1 Andrey Konovalov          2019-12-04   939  				unsigned int dst_area_size, void *src_area)
eec028c9386ed1 Andrey Konovalov          2019-12-04   940  {
eec028c9386ed1 Andrey Konovalov          2019-12-04   941  	u64 word_size = sizeof(unsigned long);
eec028c9386ed1 Andrey Konovalov          2019-12-04   942  	u64 count_size, entry_size_log;
eec028c9386ed1 Andrey Konovalov          2019-12-04   943  	u64 dst_len, src_len;
eec028c9386ed1 Andrey Konovalov          2019-12-04   944  	void *dst_entries, *src_entries;
eec028c9386ed1 Andrey Konovalov          2019-12-04   945  	u64 dst_occupied, dst_free, bytes_to_move, entries_moved;
eec028c9386ed1 Andrey Konovalov          2019-12-04   946  
eec028c9386ed1 Andrey Konovalov          2019-12-04   947  	kcov_debug("%px %u <= %px %lu\n",
eec028c9386ed1 Andrey Konovalov          2019-12-04   948  		dst_area, dst_area_size, src_area, *(unsigned long *)src_area);
eec028c9386ed1 Andrey Konovalov          2019-12-04   949  
eec028c9386ed1 Andrey Konovalov          2019-12-04   950  	switch (mode) {
eec028c9386ed1 Andrey Konovalov          2019-12-04   951  	case KCOV_MODE_TRACE_PC:
eec028c9386ed1 Andrey Konovalov          2019-12-04   952  		dst_len = READ_ONCE(*(unsigned long *)dst_area);
eec028c9386ed1 Andrey Konovalov          2019-12-04   953  		src_len = *(unsigned long *)src_area;
eec028c9386ed1 Andrey Konovalov          2019-12-04   954  		count_size = sizeof(unsigned long);
eec028c9386ed1 Andrey Konovalov          2019-12-04   955  		entry_size_log = __ilog2_u64(sizeof(unsigned long));
eec028c9386ed1 Andrey Konovalov          2019-12-04   956  		break;
eec028c9386ed1 Andrey Konovalov          2019-12-04   957  	case KCOV_MODE_TRACE_CMP:
eec028c9386ed1 Andrey Konovalov          2019-12-04   958  		dst_len = READ_ONCE(*(u64 *)dst_area);
eec028c9386ed1 Andrey Konovalov          2019-12-04   959  		src_len = *(u64 *)src_area;
eec028c9386ed1 Andrey Konovalov          2019-12-04   960  		count_size = sizeof(u64);
eec028c9386ed1 Andrey Konovalov          2019-12-04   961  		BUILD_BUG_ON(!is_power_of_2(KCOV_WORDS_PER_CMP));
eec028c9386ed1 Andrey Konovalov          2019-12-04   962  		entry_size_log = __ilog2_u64(sizeof(u64) * KCOV_WORDS_PER_CMP);
eec028c9386ed1 Andrey Konovalov          2019-12-04   963  		break;
eec028c9386ed1 Andrey Konovalov          2019-12-04   964  	default:
eec028c9386ed1 Andrey Konovalov          2019-12-04   965  		WARN_ON(1);
eec028c9386ed1 Andrey Konovalov          2019-12-04   966  		return;
eec028c9386ed1 Andrey Konovalov          2019-12-04   967  	}
eec028c9386ed1 Andrey Konovalov          2019-12-04   968  
eec028c9386ed1 Andrey Konovalov          2019-12-04   969  	/* As arm can't divide u64 integers use log of entry size. */
eec028c9386ed1 Andrey Konovalov          2019-12-04   970  	if (dst_len > ((dst_area_size * word_size - count_size) >>
eec028c9386ed1 Andrey Konovalov          2019-12-04   971  				entry_size_log))
eec028c9386ed1 Andrey Konovalov          2019-12-04   972  		return;
eec028c9386ed1 Andrey Konovalov          2019-12-04   973  	dst_occupied = count_size + (dst_len << entry_size_log);
eec028c9386ed1 Andrey Konovalov          2019-12-04   974  	dst_free = dst_area_size * word_size - dst_occupied;
eec028c9386ed1 Andrey Konovalov          2019-12-04   975  	bytes_to_move = min(dst_free, src_len << entry_size_log);
eec028c9386ed1 Andrey Konovalov          2019-12-04   976  	dst_entries = dst_area + dst_occupied;
eec028c9386ed1 Andrey Konovalov          2019-12-04   977  	src_entries = src_area + count_size;
eec028c9386ed1 Andrey Konovalov          2019-12-04   978  	memcpy(dst_entries, src_entries, bytes_to_move);
eec028c9386ed1 Andrey Konovalov          2019-12-04   979  	entries_moved = bytes_to_move >> entry_size_log;
eec028c9386ed1 Andrey Konovalov          2019-12-04   980  
eec028c9386ed1 Andrey Konovalov          2019-12-04   981  	switch (mode) {
eec028c9386ed1 Andrey Konovalov          2019-12-04   982  	case KCOV_MODE_TRACE_PC:
eec028c9386ed1 Andrey Konovalov          2019-12-04   983  		WRITE_ONCE(*(unsigned long *)dst_area, dst_len + entries_moved);
eec028c9386ed1 Andrey Konovalov          2019-12-04   984  		break;
eec028c9386ed1 Andrey Konovalov          2019-12-04   985  	case KCOV_MODE_TRACE_CMP:
eec028c9386ed1 Andrey Konovalov          2019-12-04   986  		WRITE_ONCE(*(u64 *)dst_area, dst_len + entries_moved);
eec028c9386ed1 Andrey Konovalov          2019-12-04   987  		break;
eec028c9386ed1 Andrey Konovalov          2019-12-04   988  	default:
eec028c9386ed1 Andrey Konovalov          2019-12-04   989  		break;
eec028c9386ed1 Andrey Konovalov          2019-12-04   990  	}
eec028c9386ed1 Andrey Konovalov          2019-12-04   991  }
eec028c9386ed1 Andrey Konovalov          2019-12-04   992  
eec028c9386ed1 Andrey Konovalov          2019-12-04   993  /* See the comment before kcov_remote_start() for usage details. */
eec028c9386ed1 Andrey Konovalov          2019-12-04   994  void kcov_remote_stop(void)
eec028c9386ed1 Andrey Konovalov          2019-12-04   995  {
eec028c9386ed1 Andrey Konovalov          2019-12-04   996  	struct task_struct *t = current;
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04   997  	struct kcov *kcov;
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04   998  	unsigned int mode;
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04   999  	void *area;
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04  1000  	unsigned int size;
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04  1001  	int sequence;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1002  	unsigned long flags;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1003  
7d4df2dad312f2 Andrey Konovalov          2024-07-29  1004  	if (!in_task() && !in_softirq_really())
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1005  		return;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1006  
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08 @1007  	local_lock_irqsave(&kcov_percpu_data.lock, flags);
eec028c9386ed1 Andrey Konovalov          2019-12-04  1008  
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04  1009  	mode = READ_ONCE(t->kcov_mode);
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04  1010  	barrier();
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1011  	if (!kcov_mode_enabled(mode)) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  1012  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
eec028c9386ed1 Andrey Konovalov          2019-12-04  1013  		return;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1014  	}
3021e69219e2f3 Andrey Konovalov          2020-06-10  1015  	/*
3021e69219e2f3 Andrey Konovalov          2020-06-10  1016  	 * When in softirq, check if the corresponding kcov_remote_start()
3021e69219e2f3 Andrey Konovalov          2020-06-10  1017  	 * actually found the remote handle and started collecting coverage.
3021e69219e2f3 Andrey Konovalov          2020-06-10  1018  	 */
3021e69219e2f3 Andrey Konovalov          2020-06-10  1019  	if (in_serving_softirq() && !t->kcov_softirq) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  1020  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
3021e69219e2f3 Andrey Konovalov          2020-06-10  1021  		return;
3021e69219e2f3 Andrey Konovalov          2020-06-10  1022  	}
3021e69219e2f3 Andrey Konovalov          2020-06-10  1023  	/* Make sure that kcov_softirq is only set when in softirq. */
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1024  	if (WARN_ON(!in_serving_softirq() && t->kcov_softirq)) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  1025  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1026  		return;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1027  	}
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1028  
3021e69219e2f3 Andrey Konovalov          2020-06-10  1029  	kcov = t->kcov;
3021e69219e2f3 Andrey Konovalov          2020-06-10  1030  	area = t->kcov_area;
3021e69219e2f3 Andrey Konovalov          2020-06-10  1031  	size = t->kcov_size;
3021e69219e2f3 Andrey Konovalov          2020-06-10  1032  	sequence = t->kcov_sequence;
3021e69219e2f3 Andrey Konovalov          2020-06-10  1033  
eec028c9386ed1 Andrey Konovalov          2019-12-04  1034  	kcov_stop(t);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1035  	if (in_serving_softirq()) {
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1036  		t->kcov_softirq = 0;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1037  		kcov_remote_softirq_stop(t);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1038  	}
eec028c9386ed1 Andrey Konovalov          2019-12-04  1039  
eec028c9386ed1 Andrey Konovalov          2019-12-04  1040  	spin_lock(&kcov->lock);
eec028c9386ed1 Andrey Konovalov          2019-12-04  1041  	/*
eec028c9386ed1 Andrey Konovalov          2019-12-04  1042  	 * KCOV_DISABLE could have been called between kcov_remote_start()
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1043  	 * and kcov_remote_stop(), hence the sequence check.
eec028c9386ed1 Andrey Konovalov          2019-12-04  1044  	 */
eec028c9386ed1 Andrey Konovalov          2019-12-04  1045  	if (sequence == kcov->sequence && kcov->remote)
eec028c9386ed1 Andrey Konovalov          2019-12-04  1046  		kcov_move_area(kcov->mode, kcov->area, kcov->size, area);
eec028c9386ed1 Andrey Konovalov          2019-12-04  1047  	spin_unlock(&kcov->lock);
eec028c9386ed1 Andrey Konovalov          2019-12-04  1048  
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1049  	if (in_task()) {
eec028c9386ed1 Andrey Konovalov          2019-12-04  1050  		spin_lock(&kcov_remote_lock);
eec028c9386ed1 Andrey Konovalov          2019-12-04  1051  		kcov_remote_area_put(area, size);
eec028c9386ed1 Andrey Konovalov          2019-12-04  1052  		spin_unlock(&kcov_remote_lock);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1053  	}
eec028c9386ed1 Andrey Konovalov          2019-12-04  1054  
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  1055  	local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1056  
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  1057  	/* Get in kcov_remote_start(). */
eec028c9386ed1 Andrey Konovalov          2019-12-04  1058  	kcov_put(kcov);
eec028c9386ed1 Andrey Konovalov          2019-12-04  1059  }
eec028c9386ed1 Andrey Konovalov          2019-12-04  1060  EXPORT_SYMBOL(kcov_remote_stop);
eec028c9386ed1 Andrey Konovalov          2019-12-04  1061  

:::::: The code at line 865 was first introduced by commit
:::::: d5d2c51f1e5f56ed01d2c773974630c007e5e5f5 kcov: replace local_irq_save() with a local_lock_t

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

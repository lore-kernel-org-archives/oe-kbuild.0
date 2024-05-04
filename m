Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871DF4E7
	for <oe-kbuild@lists.linux.dev>; Sat,  4 May 2024 03:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714794438; cv=none; b=W741LYKvREObd9njCw/YDcsG1wBXv3l4IPj0Mu+j39tyLwokgvMkA0yjHFqp2Nt0eXpdI/8WTtoMTXIrApTlnu4NW4eEdacHjlvS1ZQsu86SPjNDeEuKH7JXBP4XnSbuSibhfNqVb3MJ8sEQkiOJY1HuszJPgYB+m0WDYstUG3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714794438; c=relaxed/simple;
	bh=eewW3R9mxlpfoF6XMWXhbDPQJGyMzy9+EhZyn6SKnFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3kjl/7Biyv/rQOW9FceS9uqW+venEWaxJeImoMYbnvSZ19iHNf1aX1UDGqHwuyw6YUW5BhkDtlkLk63cyZ4sMhemiOVD7AtimnVgNmNAzAg05k18FueX+vyYMlF0sU6Y9V57t/Juz6+j9fWoyyk3rrRFzN/YYmygv89zDz92v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCPM5GiF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCPM5GiF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714794437; x=1746330437;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eewW3R9mxlpfoF6XMWXhbDPQJGyMzy9+EhZyn6SKnFg=;
  b=YCPM5GiF30AhT6UoW0uG1TZdLy04zQ5JGoQlJF5AddCxB6LxiNyJgxBa
   tTbekjkhUv7rXe1h3lL7YSkgPsF8lQZTQ/jemkAAMzGeTM5PSEW/3uv/v
   Q7yV3q5eU2ZRzbZvnMqyF2Ha8lgpqqntuCdTa12CDMmbhrgHjYvvKFCJ/
   DreuKM0WhnNks4IHdVZce8MPEeJjc9JIhXvHJcVYnsBfz5Fojh8utyYiC
   h7c8Mq3hSBkaOjsdITOK5SF1UMxHZ2M+KUWNM0pliejUyksvG846dxKeS
   jyGs+89atQeSE08gFvwsLJEC8HxqKZmrkInzsPCbT6zWP+Y1hpj/zx5yn
   g==;
X-CSE-ConnectionGUID: M4Iew/6LQEW20cXrYYMVlQ==
X-CSE-MsgGUID: 712bxo4dTc2xTTIYJvbpOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10491735"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="10491735"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 20:47:16 -0700
X-CSE-ConnectionGUID: hpAGbmVsRSi/syRFI+g7BA==
X-CSE-MsgGUID: jDvfnuT0QTeHO3Sku1MULQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="50824606"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2024 20:47:14 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s36Mi-000CQ4-1v;
	Sat, 04 May 2024 03:47:12 +0000
Date: Sat, 4 May 2024 11:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] Patch to Fix deadlocks in queue and stack
 maps
Message-ID: <202405041108.2Up5HT0H-lkp@intel.com>
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
In-Reply-To: <20240429165658.1305969-1-sidchintamaneni@gmail.com>
References: <20240429165658.1305969-1-sidchintamaneni@gmail.com>
TO: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
TO: bpf@vger.kernel.org
CC: alexei.starovoitov@gmail.com
CC: daniel@iogearbox.net
CC: olsajiri@gmail.com
CC: andrii@kernel.org
CC: yonghong.song@linux.dev
CC: rjsu26@vt.edu
CC: sairoop@vt.edu
CC: Siddharth Chintamaneni <sidchintamaneni@vt.edu>
CC: syzbot+8bdfc2c53fb2b63e1871@syzkaller.appspotmail.com

Hi Siddharth,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Chintamaneni/Added-selftests-to-check-deadlocks-in-queue-and-stack-map/20240430-142201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240429165658.1305969-1-sidchintamaneni%40gmail.com
patch subject: [PATCH bpf-next 1/2] Patch to Fix deadlocks in queue and stack maps
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240504 (https://download.01.org/0day-ci/archive/20240504/202405041108.2Up5HT0H-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405041108.2Up5HT0H-lkp@intel.com/

smatch warnings:
kernel/bpf/queue_stack_maps.c:273 queue_stack_map_push_elem() warn: inconsistent returns 'irq_flags'.

vim +/irq_flags +273 kernel/bpf/queue_stack_maps.c

f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  219  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  220  /* Called from syscall or from eBPF program */
d7ba4cc900bf1e JP Kobryn              2023-03-22  221  static long queue_stack_map_push_elem(struct bpf_map *map, void *value,
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  222  				      u64 flags)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  223  {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  224  	struct bpf_queue_stack *qs = bpf_queue_stack(map);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  225  	unsigned long irq_flags;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  226  	int err = 0;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  227  	void *dst;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  228  
568ce03b978beb Siddharth Chintamaneni 2024-04-29  229  	preempt_disable();
568ce03b978beb Siddharth Chintamaneni 2024-04-29  230  	local_irq_save(irq_flags);
568ce03b978beb Siddharth Chintamaneni 2024-04-29  231  	if (unlikely(__this_cpu_inc_return(*(qs->map_locked)) != 1)) {
568ce03b978beb Siddharth Chintamaneni 2024-04-29  232  		__this_cpu_dec(*(qs->map_locked));
568ce03b978beb Siddharth Chintamaneni 2024-04-29  233  		local_irq_restore(irq_flags);
568ce03b978beb Siddharth Chintamaneni 2024-04-29  234  		preempt_enable();
568ce03b978beb Siddharth Chintamaneni 2024-04-29  235  		return -EBUSY;
568ce03b978beb Siddharth Chintamaneni 2024-04-29  236  	}
568ce03b978beb Siddharth Chintamaneni 2024-04-29  237  	preempt_enable();
568ce03b978beb Siddharth Chintamaneni 2024-04-29  238  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  239  	/* BPF_EXIST is used to force making room for a new element in case the
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  240  	 * map is full
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  241  	 */
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  242  	bool replace = (flags & BPF_EXIST);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  243  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  244  	/* Check supported flags for queue and stack maps */
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  245  	if (flags & BPF_NOEXIST || flags > BPF_EXIST)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  246  		return -EINVAL;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  247  
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  248  	if (in_nmi()) {
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  249  		if (!raw_spin_trylock_irqsave(&qs->lock, irq_flags))
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  250  			return -EBUSY;
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  251  	} else {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  252  		raw_spin_lock_irqsave(&qs->lock, irq_flags);
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  253  	}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  254  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  255  	if (queue_stack_map_is_full(qs)) {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  256  		if (!replace) {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  257  			err = -E2BIG;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  258  			goto out;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  259  		}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  260  		/* advance tail pointer to overwrite oldest element */
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  261  		if (unlikely(++qs->tail >= qs->size))
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  262  			qs->tail = 0;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  263  	}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  264  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  265  	dst = &qs->elements[qs->head * qs->map.value_size];
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  266  	memcpy(dst, value, qs->map.value_size);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  267  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  268  	if (unlikely(++qs->head >= qs->size))
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  269  		qs->head = 0;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  270  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  271  out:
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  272  	raw_spin_unlock_irqrestore(&qs->lock, irq_flags);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18 @273  	return err;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  274  }
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD57F1C16
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jan 2024 02:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwvhSDxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704940406; x=1736476406;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i0/+hG5TVa1i3K9VR27MzsVrHB4gfdL/MuseHV/8tyA=;
  b=iwvhSDxBq7cwvIN8pL7Vhn4xMiv/UWaz8Sw3r2xQ33NOtAHXb5OtyRCb
   RzS7Ab9r6cP7F9aL1vBI7MC9GtXioH9byC2dvObBRMB1DfZCb6vsHaBgO
   GAwTD/ufCULvx5Eml5dD36VG1sLYeR5K6wIcscLbeYJ+oQawSL1yLdyYV
   kQv4ZF6yHksjY/mzAXXGXWeXpS54rC4/+kzAkzVpy790J2V2jItoUc66z
   HtNWCYdVSmJmiShxQJGc8Ey+BY6UuSa5xwnpIUJyoJM4VpQyOR4k7sfJJ
   gHpnSgKOBxQDCLr/K2QVpYdqOZ1CaJhhCNJG5rMhk/1mJc+YyN5JSEqTF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397587620"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="397587620"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 18:33:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="732045705"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="732045705"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 18:33:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNksj-0007im-12;
	Thu, 11 Jan 2024 02:33:21 +0000
Date: Thu, 11 Jan 2024 10:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/bpf/queue_stack_maps.c:123 __queue_map_get() error:
 uninitialized symbol 'flags'.
Message-ID: <202401111011.U3iwXGEg-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Toke Høiland-Jørgensen" <toke@redhat.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   acc657692aed438e9931438f8c923b2b107aebf9
commit: a34a9f1a19afe9c60ca0ea61dfeee63a1c2baac8 bpf: Avoid deadlock when using queue and stack maps from NMI
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: microblaze-randconfig-r071-20231115 (https://download.01.org/0day-ci/archive/20240111/202401111011.U3iwXGEg-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401111011.U3iwXGEg-lkp@intel.com/

New smatch warnings:
kernel/bpf/queue_stack_maps.c:123 __queue_map_get() error: uninitialized symbol 'flags'.
kernel/bpf/queue_stack_maps.c:160 __stack_map_get() error: uninitialized symbol 'flags'.
kernel/bpf/queue_stack_maps.c:230 queue_stack_map_push_elem() error: uninitialized symbol 'irq_flags'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +/flags +123 kernel/bpf/queue_stack_maps.c

f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18   93  
d7ba4cc900bf1e JP Kobryn              2023-03-22   94  static long __queue_map_get(struct bpf_map *map, void *value, bool delete)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18   95  {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18   96  	struct bpf_queue_stack *qs = bpf_queue_stack(map);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18   97  	unsigned long flags;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18   98  	int err = 0;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18   99  	void *ptr;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  100  
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  101  	if (in_nmi()) {
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  102  		if (!raw_spin_trylock_irqsave(&qs->lock, flags))
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  103  			return -EBUSY;
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  104  	} else {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  105  		raw_spin_lock_irqsave(&qs->lock, flags);
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  106  	}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  107  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  108  	if (queue_stack_map_is_empty(qs)) {
d3f66e4116aff8 Daniel Borkmann        2018-10-24  109  		memset(value, 0, qs->map.value_size);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  110  		err = -ENOENT;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  111  		goto out;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  112  	}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  113  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  114  	ptr = &qs->elements[qs->tail * qs->map.value_size];
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  115  	memcpy(value, ptr, qs->map.value_size);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  116  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  117  	if (delete) {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  118  		if (unlikely(++qs->tail >= qs->size))
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  119  			qs->tail = 0;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  120  	}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  121  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  122  out:
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18 @123  	raw_spin_unlock_irqrestore(&qs->lock, flags);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  124  	return err;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  125  }
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  126  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  127  
d7ba4cc900bf1e JP Kobryn              2023-03-22  128  static long __stack_map_get(struct bpf_map *map, void *value, bool delete)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  129  {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  130  	struct bpf_queue_stack *qs = bpf_queue_stack(map);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  131  	unsigned long flags;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  132  	int err = 0;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  133  	void *ptr;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  134  	u32 index;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  135  
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  136  	if (in_nmi()) {
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  137  		if (!raw_spin_trylock_irqsave(&qs->lock, flags))
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  138  			return -EBUSY;
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  139  	} else {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  140  		raw_spin_lock_irqsave(&qs->lock, flags);
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  141  	}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  142  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  143  	if (queue_stack_map_is_empty(qs)) {
d3f66e4116aff8 Daniel Borkmann        2018-10-24  144  		memset(value, 0, qs->map.value_size);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  145  		err = -ENOENT;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  146  		goto out;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  147  	}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  148  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  149  	index = qs->head - 1;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  150  	if (unlikely(index >= qs->size))
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  151  		index = qs->size - 1;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  152  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  153  	ptr = &qs->elements[index * qs->map.value_size];
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  154  	memcpy(value, ptr, qs->map.value_size);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  155  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  156  	if (delete)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  157  		qs->head = index;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  158  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  159  out:
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18 @160  	raw_spin_unlock_irqrestore(&qs->lock, flags);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  161  	return err;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  162  }
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  163  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  164  /* Called from syscall or from eBPF program */
d7ba4cc900bf1e JP Kobryn              2023-03-22  165  static long queue_map_peek_elem(struct bpf_map *map, void *value)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  166  {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  167  	return __queue_map_get(map, value, false);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  168  }
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  169  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  170  /* Called from syscall or from eBPF program */
d7ba4cc900bf1e JP Kobryn              2023-03-22  171  static long stack_map_peek_elem(struct bpf_map *map, void *value)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  172  {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  173  	return __stack_map_get(map, value, false);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  174  }
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  175  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  176  /* Called from syscall or from eBPF program */
d7ba4cc900bf1e JP Kobryn              2023-03-22  177  static long queue_map_pop_elem(struct bpf_map *map, void *value)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  178  {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  179  	return __queue_map_get(map, value, true);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  180  }
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  181  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  182  /* Called from syscall or from eBPF program */
d7ba4cc900bf1e JP Kobryn              2023-03-22  183  static long stack_map_pop_elem(struct bpf_map *map, void *value)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  184  {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  185  	return __stack_map_get(map, value, true);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  186  }
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  187  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  188  /* Called from syscall or from eBPF program */
d7ba4cc900bf1e JP Kobryn              2023-03-22  189  static long queue_stack_map_push_elem(struct bpf_map *map, void *value,
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  190  				      u64 flags)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  191  {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  192  	struct bpf_queue_stack *qs = bpf_queue_stack(map);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  193  	unsigned long irq_flags;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  194  	int err = 0;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  195  	void *dst;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  196  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  197  	/* BPF_EXIST is used to force making room for a new element in case the
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  198  	 * map is full
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  199  	 */
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  200  	bool replace = (flags & BPF_EXIST);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  201  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  202  	/* Check supported flags for queue and stack maps */
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  203  	if (flags & BPF_NOEXIST || flags > BPF_EXIST)
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  204  		return -EINVAL;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  205  
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  206  	if (in_nmi()) {
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  207  		if (!raw_spin_trylock_irqsave(&qs->lock, irq_flags))
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  208  			return -EBUSY;
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  209  	} else {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  210  		raw_spin_lock_irqsave(&qs->lock, irq_flags);
a34a9f1a19afe9 Toke Høiland-Jørgensen 2023-09-11  211  	}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  212  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  213  	if (queue_stack_map_is_full(qs)) {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  214  		if (!replace) {
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  215  			err = -E2BIG;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  216  			goto out;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  217  		}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  218  		/* advance tail pointer to overwrite oldest element */
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  219  		if (unlikely(++qs->tail >= qs->size))
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  220  			qs->tail = 0;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  221  	}
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  222  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  223  	dst = &qs->elements[qs->head * qs->map.value_size];
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  224  	memcpy(dst, value, qs->map.value_size);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  225  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  226  	if (unlikely(++qs->head >= qs->size))
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  227  		qs->head = 0;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  228  
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  229  out:
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18 @230  	raw_spin_unlock_irqrestore(&qs->lock, irq_flags);
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  231  	return err;
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  232  }
f1a2e44a3aeccb Mauricio Vasquez B     2018-10-18  233  

:::::: The code at line 123 was first introduced by commit
:::::: f1a2e44a3aeccb3ff18d3ccc0b0203e70b95bd92 bpf: add queue and stack maps

:::::: TO: Mauricio Vasquez B <mauricio.vasquez@polito.it>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

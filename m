Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33021BE4F
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Feb 2024 00:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709167294; cv=none; b=dtOGyaymqMbQ7FaSKGaUOllrjUtd8KbWBTlMJp3M2mWTq8oSZUV8FbZQNn7VtcUlG12Is16Tr5DKceg8uFCjuFU4hLwAN5lJv97tfjUBnJJF2UtQzxiQJmXnzS+hhyRqkM4qbVinGtgYtooCrT61li/Rsl8o0xLKE8JZdagcSdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709167294; c=relaxed/simple;
	bh=xxu08rxPMJ8wk6tmdlk0AWor7ri4EQBwMARenI0V63k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b+2U8NV6eHe6LTG43KJaYPTIqT2gwkifvFr94a+GPqTJnUQ4QDJXNPbxd7tasc3v3RV71r2xi/eVBHwUtvLzpmcD0koVaXrNdBBAyzXg018wdnMIBx/h6rlqRZAn6Y4kRIa0F6CytIH0nJdtc0AaS20aJVLfo6RieelNyAPLaKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qokl26Ls; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qokl26Ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709167292; x=1740703292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xxu08rxPMJ8wk6tmdlk0AWor7ri4EQBwMARenI0V63k=;
  b=Qokl26LsHuQNpGtlmY4T2OGgDkzMKWHJ4zokh7fyu7sxXTkJ2juBCGPk
   rMxDbMEmwVuAhnsbzRYUImsW6binEgOG/vI+WPr/zH0XR0UjPsFh+5c1+
   Otk8UBQrq36qBZ3+Mt6ebzyOEYHAIONkYPNodTCOVvs2coVPjFj4Kuqrd
   LPGuUhangIe+8ZxERe7IpRvM9V+8vy/CZ2//lHQtlmYwmqW5wO+9p0ODV
   ikVEb6R39GJwN6rTXBCit/MoCU5QfQu681/q+gU0XRnHQ17A9mgS/fLOd
   Iw7725bfz/VQvZZO5RLVqlOGtEAtBJDF8kRZRFVTrjbONyf5Wu72YRVgH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7440604"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7440604"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7562980"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 Feb 2024 16:41:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfUUC-000CVl-35;
	Thu, 29 Feb 2024 00:41:20 +0000
Date: Thu, 29 Feb 2024 08:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10500/10830] fs/bcachefs/snapshot.c:155
 __snapshot_t_mut() error: kvzalloc() does not make sense for no sleep code
Message-ID: <202402290836.zZxT4dgo-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
commit: 211ec89ce404de50f19bccf444644d6b4c7d592c [10500/10830] mm: enumerate all gfp flags
:::::: branch date: 20 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20240228 (https://download.01.org/0day-ci/archive/20240229/202402290836.zZxT4dgo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402290836.zZxT4dgo-lkp@intel.com/

New smatch warnings:
fs/bcachefs/snapshot.c:155 __snapshot_t_mut() error: kvzalloc() does not make sense for no sleep code
drivers/scsi/sd_zbc.c:868 sd_zbc_revalidate_zones() error: kvcalloc() does not make sense for no sleep code
fs/proc/proc_sysctl.c:578 proc_sys_call_handler() error: kvzalloc() does not make sense for no sleep code
sound/soc/intel/atom/sst/sst.c:469 intel_sst_suspend() error: kvzalloc() does not make sense for no sleep code
drivers/gpu/drm/ttm/ttm_tt.c:100 ttm_tt_alloc_page_directory() error: kvcalloc() does not make sense for no sleep code
drivers/gpu/drm/ttm/ttm_tt.c:109 ttm_dma_tt_alloc_page_directory() error: kvcalloc() does not make sense for no sleep code
drivers/gpu/drm/ttm/ttm_tt.c:120 ttm_sg_tt_alloc_page_directory() error: kvcalloc() does not make sense for no sleep code
drivers/gpu/drm/drm_property.c:565 drm_property_create_blob() error: kvzalloc() does not make sense for no sleep code
kernel/resource.c:449 walk_system_ram_res_rev() error: kvcalloc() does not make sense for no sleep code
net/ethtool/common.c:553 ethtool_get_max_rxnfc_channel() error: kvzalloc() does not make sense for no sleep code
sound/core/info.c:330 snd_info_text_entry_write() error: kvzalloc() does not make sense for no sleep code
io_uring/filetable.c:41 io_alloc_file_tables() error: kvcalloc() does not make sense for no sleep code
fs/exfat/nls.c:662 exfat_load_upcase_table() error: kvcalloc() does not make sense for no sleep code
fs/exfat/nls.c:718 exfat_load_default_upcase_table() error: kvcalloc() does not make sense for no sleep code
drivers/video/fbdev/core/fb_defio.c:284 fb_deferred_io_init() error: kvcalloc() does not make sense for no sleep code
sound/core/memalloc.c:775 snd_dma_sg_fallback_alloc() error: kvcalloc() does not make sense for no sleep code
drivers/acpi/property.c:413 acpi_data_add_buffer_props() error: kvzalloc() does not make sense for no sleep code
net/ipv4/fib_semantics.c:1447 fib_create_info() error: kvzalloc() does not make sense for no sleep code
drivers/md/dm-zone.c:203 dm_zone_revalidate_cb() error: kvcalloc() does not make sense for no sleep code
net/ipv4/tcp_metrics.c:1026 tcp_metrics_hash_alloc() error: kvzalloc() does not make sense for no sleep code
drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c:243 vmw_bo_dirty_add() error: kvzalloc() does not make sense for no sleep code
lib/stackdepot.c:224 stack_depot_init() error: kvcalloc() does not make sense for no sleep code
fs/pstore/ram.c:272 ramoops_pstore_read() error: kvzalloc() does not make sense for no sleep code
fs/pstore/ram.c:838 ramoops_probe() error: kvzalloc() does not make sense for no sleep code
drivers/md/dm-snap-persistent.c:629 persistent_read_metadata() error: kvcalloc() does not make sense for no sleep code

Old smatch warnings:
fs/proc/proc_sysctl.c:586 proc_sys_call_handler() warn: potential spectre issue 'kbuf' [w]
sound/soc/intel/atom/sst/sst.c:474 intel_sst_suspend() error: kvzalloc() does not make sense for no sleep code
sound/soc/intel/atom/sst/sst.c:479 intel_sst_suspend() error: kvzalloc() does not make sense for no sleep code
sound/soc/intel/atom/sst/sst.c:485 intel_sst_suspend() error: kvzalloc() does not make sense for no sleep code
sound/core/memalloc.c:776 snd_dma_sg_fallback_alloc() error: kvcalloc() does not make sense for no sleep code
drivers/acpi/property.c:1052 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.
drivers/acpi/property.c:1058 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.
drivers/acpi/property.c:1064 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.
drivers/acpi/property.c:1071 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.
net/ipv4/fib_semantics.c:1448 fib_create_info() error: kvzalloc() does not make sense for no sleep code

vim +155 fs/bcachefs/snapshot.c

8e877caaad8185 Kent Overstreet 2023-08-16  146  
8e877caaad8185 Kent Overstreet 2023-08-16  147  static noinline struct snapshot_t *__snapshot_t_mut(struct bch_fs *c, u32 id)
8e877caaad8185 Kent Overstreet 2023-08-16  148  {
8e877caaad8185 Kent Overstreet 2023-08-16  149  	size_t idx = U32_MAX - id;
8e877caaad8185 Kent Overstreet 2023-08-16  150  	size_t new_size;
8e877caaad8185 Kent Overstreet 2023-08-16  151  	struct snapshot_table *new, *old;
8e877caaad8185 Kent Overstreet 2023-08-16  152  
8e877caaad8185 Kent Overstreet 2023-08-16  153  	new_size = max(16UL, roundup_pow_of_two(idx + 1));
8e877caaad8185 Kent Overstreet 2023-08-16  154  
8e877caaad8185 Kent Overstreet 2023-08-16 @155  	new = kvzalloc(struct_size(new, s, new_size), GFP_KERNEL);
8e877caaad8185 Kent Overstreet 2023-08-16  156  	if (!new)
8e877caaad8185 Kent Overstreet 2023-08-16  157  		return NULL;
8e877caaad8185 Kent Overstreet 2023-08-16  158  
8e877caaad8185 Kent Overstreet 2023-08-16  159  	old = rcu_dereference_protected(c->snapshots, true);
8e877caaad8185 Kent Overstreet 2023-08-16  160  	if (old)
8e877caaad8185 Kent Overstreet 2023-08-16  161  		memcpy(new->s,
8e877caaad8185 Kent Overstreet 2023-08-16  162  		       rcu_dereference_protected(c->snapshots, true)->s,
8e877caaad8185 Kent Overstreet 2023-08-16  163  		       sizeof(new->s[0]) * c->snapshot_table_size);
8e877caaad8185 Kent Overstreet 2023-08-16  164  
8e877caaad8185 Kent Overstreet 2023-08-16  165  	rcu_assign_pointer(c->snapshots, new);
8e877caaad8185 Kent Overstreet 2023-08-16  166  	c->snapshot_table_size = new_size;
d04fdf5c1017b9 Kent Overstreet 2023-09-20  167  	kvfree_rcu_mightsleep(old);
8e877caaad8185 Kent Overstreet 2023-08-16  168  
8e877caaad8185 Kent Overstreet 2023-08-16  169  	return &rcu_dereference_protected(c->snapshots, true)->s[idx];
8e877caaad8185 Kent Overstreet 2023-08-16  170  }
8e877caaad8185 Kent Overstreet 2023-08-16  171  

:::::: The code at line 155 was first introduced by commit
:::::: 8e877caaad818595ecb6754355cea2058fd9848e bcachefs: Split out snapshot.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

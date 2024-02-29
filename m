Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2366D52F
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Feb 2024 23:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709249399; cv=none; b=e8MAvXMOAg3jJTtoXG2HhdErJzkwEq0fY1Y4ui6LTZ10H7UXO4BRi8XkwriYN2sNxnEChpZ8hpHRHl05g6m8YmV5ItiOJNiylmU0zbCT/A1RaxelfLKJJXhwtrX7/vrLy6R4/s/Uz5UIvgvM01lsptsAT9+V7VGHHJgsFLPVaDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709249399; c=relaxed/simple;
	bh=hSDbfiIJdU78XgRG/dtft+LMgy7SztK3AleHNv/0epo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fucVeGPoPthXtmVAQfFztqLCgDG/iym5P1e6jGpZG71Q8JJEeHJ40HxTM2YqRpU0siXnD2PpSMHTOgWJnZ3CDAC0ZrnfZII3dFcKtM9tQ/hsFFGsw/C5PIO1M3K7WocHMaOgeFOk85B48p50zzMf/Xv9DyqcyTU6OrqirX4ioxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFOUDBw5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFOUDBw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709249398; x=1740785398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hSDbfiIJdU78XgRG/dtft+LMgy7SztK3AleHNv/0epo=;
  b=TFOUDBw5SqrxIS20qYwRejBN2U0PKRwHz454ITS2rtpl+DSOpbVmm/M7
   lUQZvSHaQwAfSGYhBBo5ytNMXJQWQ6DzDYVO4bvBEuDhKlQMCBawmZ9hI
   OPPKUdaHhbZ4E7sXusNtBRfsbXp4qnJO6PLnlSAw/8vzw96upMRaTXFIe
   ZvdkfqJpTr1WO1uRnCly3pIbAz/C94IaVMO/qInDwA+JOjwsO/4UXOhKa
   /7d1V9qFjrZVmSfNYbEnqqF4sp0NysKj7ATBMgfpiQX8AKaqR+PDuYu60
   8oP6eQtqrnT+yHui5AmoWi2+Xc9VTozMl0ys5uiGqpc8zPzpo/0EfI2gM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3620392"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3620392"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 15:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7947578"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Feb 2024 15:29:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfpq8-000DMB-00;
	Thu, 29 Feb 2024 23:29:36 +0000
Date: Fri, 1 Mar 2024 07:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10500/10830] net/ipv4/tcp_metrics.c:1026
 tcp_metrics_hash_alloc() error: kvzalloc() does not make sense for no sleep
 code
Message-ID: <202403010710.uun8a16d-lkp@intel.com>
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
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 211ec89ce404de50f19bccf444644d6b4c7d592c [10500/10830] mm: enumerate all gfp flags
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240228 (https://download.01.org/0day-ci/archive/20240301/202403010710.uun8a16d-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403010710.uun8a16d-lkp@intel.com/

New smatch warnings:
net/ipv4/tcp_metrics.c:1026 tcp_metrics_hash_alloc() error: kvzalloc() does not make sense for no sleep code
drivers/gpu/drm/ttm/ttm_tt.c:100 ttm_tt_alloc_page_directory() error: kvcalloc() does not make sense for no sleep code
drivers/gpu/drm/ttm/ttm_tt.c:109 ttm_dma_tt_alloc_page_directory() error: kvcalloc() does not make sense for no sleep code
drivers/gpu/drm/ttm/ttm_tt.c:120 ttm_sg_tt_alloc_page_directory() error: kvcalloc() does not make sense for no sleep code
fs/pstore/ram.c:272 ramoops_pstore_read() error: kvzalloc() does not make sense for no sleep code
fs/pstore/ram.c:838 ramoops_probe() error: kvzalloc() does not make sense for no sleep code
fs/bcachefs/snapshot.c:155 __snapshot_t_mut() error: kvzalloc() does not make sense for no sleep code
drivers/scsi/sd_zbc.c:868 sd_zbc_revalidate_zones() error: kvcalloc() does not make sense for no sleep code
net/ipv4/fib_semantics.c:1447 fib_create_info() error: kvzalloc() does not make sense for no sleep code
fs/proc/proc_sysctl.c:578 proc_sys_call_handler() error: kvzalloc() does not make sense for no sleep code
drivers/md/dm-snap-persistent.c:629 persistent_read_metadata() error: kvcalloc() does not make sense for no sleep code
sound/core/info.c:330 snd_info_text_entry_write() error: kvzalloc() does not make sense for no sleep code
sound/soc/intel/atom/sst/sst.c:469 intel_sst_suspend() error: kvzalloc() does not make sense for no sleep code
drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c:243 vmw_bo_dirty_add() error: kvzalloc() does not make sense for no sleep code
io_uring/filetable.c:41 io_alloc_file_tables() error: kvcalloc() does not make sense for no sleep code
lib/stackdepot.c:224 stack_depot_init() error: kvcalloc() does not make sense for no sleep code
kernel/resource.c:449 walk_system_ram_res_rev() error: kvcalloc() does not make sense for no sleep code
sound/core/memalloc.c:775 snd_dma_sg_fallback_alloc() error: kvcalloc() does not make sense for no sleep code
drivers/video/fbdev/core/fb_defio.c:284 fb_deferred_io_init() error: kvcalloc() does not make sense for no sleep code
net/ethtool/common.c:553 ethtool_get_max_rxnfc_channel() error: kvzalloc() does not make sense for no sleep code
drivers/acpi/property.c:413 acpi_data_add_buffer_props() error: kvzalloc() does not make sense for no sleep code
drivers/md/dm-zone.c:203 dm_zone_revalidate_cb() error: kvcalloc() does not make sense for no sleep code
fs/exfat/nls.c:662 exfat_load_upcase_table() error: kvcalloc() does not make sense for no sleep code
fs/exfat/nls.c:718 exfat_load_default_upcase_table() error: kvcalloc() does not make sense for no sleep code
drivers/gpu/drm/drm_property.c:565 drm_property_create_blob() error: kvzalloc() does not make sense for no sleep code

Old smatch warnings:
net/ipv4/fib_semantics.c:1448 fib_create_info() error: kvzalloc() does not make sense for no sleep code
fs/proc/proc_sysctl.c:586 proc_sys_call_handler() warn: potential spectre issue 'kbuf' [w]
sound/soc/intel/atom/sst/sst.c:474 intel_sst_suspend() error: kvzalloc() does not make sense for no sleep code
sound/soc/intel/atom/sst/sst.c:479 intel_sst_suspend() error: kvzalloc() does not make sense for no sleep code
sound/soc/intel/atom/sst/sst.c:485 intel_sst_suspend() error: kvzalloc() does not make sense for no sleep code
sound/core/memalloc.c:776 snd_dma_sg_fallback_alloc() error: kvcalloc() does not make sense for no sleep code
drivers/acpi/property.c:1052 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.
drivers/acpi/property.c:1058 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.
drivers/acpi/property.c:1064 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.
drivers/acpi/property.c:1071 acpi_data_prop_read_single() error: uninitialized symbol 'obj'.

vim +1026 net/ipv4/tcp_metrics.c

51c5d0c4b169bf David S. Miller   2012-07-10  1010  
c4a6b2da4b59d4 Eric Dumazet      2023-08-03  1011  static void __init tcp_metrics_hash_alloc(void)
51c5d0c4b169bf David S. Miller   2012-07-10  1012  {
c4a6b2da4b59d4 Eric Dumazet      2023-08-03  1013  	unsigned int slots = tcpmhash_entries;
5815d5e7aae3cc Eric Dumazet      2012-07-19  1014  	size_t size;
51c5d0c4b169bf David S. Miller   2012-07-10  1015  
51c5d0c4b169bf David S. Miller   2012-07-10  1016  	if (!slots) {
ca79b0c211af63 Arun KS           2018-12-28  1017  		if (totalram_pages() >= 128 * 1024)
51c5d0c4b169bf David S. Miller   2012-07-10  1018  			slots = 16 * 1024;
51c5d0c4b169bf David S. Miller   2012-07-10  1019  		else
51c5d0c4b169bf David S. Miller   2012-07-10  1020  			slots = 8 * 1024;
51c5d0c4b169bf David S. Miller   2012-07-10  1021  	}
51c5d0c4b169bf David S. Miller   2012-07-10  1022  
098a697b497e31 Eric W. Biederman 2015-03-13  1023  	tcp_metrics_hash_log = order_base_2(slots);
098a697b497e31 Eric W. Biederman 2015-03-13  1024  	size = sizeof(struct tcpm_hash_bucket) << tcp_metrics_hash_log;
51c5d0c4b169bf David S. Miller   2012-07-10  1025  
752ade68cbd81d Michal Hocko      2017-05-08 @1026  	tcp_metrics_hash = kvzalloc(size, GFP_KERNEL);
098a697b497e31 Eric W. Biederman 2015-03-13  1027  	if (!tcp_metrics_hash)
c4a6b2da4b59d4 Eric Dumazet      2023-08-03  1028  		panic("Could not allocate the tcp_metrics hash table\n");
51c5d0c4b169bf David S. Miller   2012-07-10  1029  }
51c5d0c4b169bf David S. Miller   2012-07-10  1030  

:::::: The code at line 1026 was first introduced by commit
:::::: 752ade68cbd81d0321dfecc188f655a945551b25 treewide: use kv[mz]alloc* rather than opencoded variants

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0090C4407
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 01:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpI/yUSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700704511; x=1732240511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b4gWCbuh2UQn52Akn48w23jWQkkHL8WptHOokxWX6x4=;
  b=QpI/yUSwb7sDKopMY71fQE11trenvVL6uDRkEvFmxXjQKMbjECvlzwuL
   0zd1KtWFvMHsvw3k0zW04mUxMhWEyJLeaT+F59/lQL9Q4A20tR1dPiS5e
   s+6fU2FuZEjJ8ZFSiIlUtiBEWKC8sZyAQQsgUTm4eZvn64tOFGJGdxtkI
   Jjg6QN8vKAGDnyMKeAGpwbEDZo1Nyj7Gi18gRejh9ql5fes34qTrS56d4
   EMEI/nqcNLc2OODeVjZWwIjUbHt6/dCUwdMoAfA3+udQqwsPn+HyjBNPE
   vSsAQ9uzcdyFpzc9hCafaG6Ur/9E3/nnG+1xHB3e9xt0tI3HXGszSOOWU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13737164"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="13737164"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:55:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801909596"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="801909596"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Nov 2023 17:55:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5yvq-000163-0H;
	Thu, 23 Nov 2023 01:55:06 +0000
Date: Thu, 23 Nov 2023 09:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-vfs:b4/vfs-eventfd-signal 5/5] fs/eventfd.c:57: warning:
 expecting prototype for eventfd_signal(). Prototype was for
 eventfd_signal_mask() instead
Message-ID: <202311230426.b0wY1x1o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-eventfd-signal
head:   57ceaa6ec25fff4e0d916e587377a96ffa209507
commit: 1e2d01f4ec1da4b0a16fc8c3b28f6db33c9672b0 [5/5] eventfd: make eventfd_signal{_mask}() void
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230426.b0wY1x1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311230426.b0wY1x1o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/locking/qspinlock_paravirt.h: In function 'pv_wait_node':
   kernel/locking/qspinlock_paravirt.h:298:14: warning: variable 'wait_early' set but not used [-Wunused-but-set-variable]
     298 |         bool wait_early;
         |              ^~~~~~~~~~
   drivers/acpi/sleep.c:519: warning: Function parameter or member 'acpi_state' not described in 'acpi_pm_start'
   drivers/acpi/sleep.c:559: warning: Function parameter or member 'pm_state' not described in 'acpi_suspend_begin'
   drivers/acpi/sleep.c:692: warning: Function parameter or member 'pm_state' not described in 'acpi_suspend_begin_old'
   drivers/acpi/sleep.c:988: warning: Function parameter or member 'stage' not described in 'acpi_hibernation_begin_old'
   kernel/power/snapshot.c:468: warning: Function parameter or member 'zone' not described in 'add_rtree_block'
   kernel/power/snapshot.c:468: warning: Function parameter or member 'gfp_mask' not described in 'add_rtree_block'
   kernel/power/snapshot.c:468: warning: Function parameter or member 'safe_needed' not described in 'add_rtree_block'
   kernel/power/snapshot.c:468: warning: Function parameter or member 'ca' not described in 'add_rtree_block'
   kernel/power/snapshot.c:541: warning: Function parameter or member 'gfp_mask' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:541: warning: Function parameter or member 'safe_needed' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:541: warning: Function parameter or member 'ca' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:541: warning: Function parameter or member 'start' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:541: warning: Function parameter or member 'end' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:576: warning: Function parameter or member 'zone' not described in 'free_zone_bm_rtree'
   kernel/power/snapshot.c:576: warning: Function parameter or member 'clear_nosave_free' not described in 'free_zone_bm_rtree'
   kernel/power/snapshot.c:684: warning: Function parameter or member 'bm' not described in 'memory_bm_create'
   kernel/power/snapshot.c:684: warning: Function parameter or member 'gfp_mask' not described in 'memory_bm_create'
   kernel/power/snapshot.c:684: warning: Function parameter or member 'safe_needed' not described in 'memory_bm_create'
   kernel/power/snapshot.c:726: warning: Function parameter or member 'clear_nosave_free' not described in 'memory_bm_free'
   kernel/power/snapshot.c:748: warning: Function parameter or member 'bm' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:748: warning: Function parameter or member 'pfn' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:748: warning: Function parameter or member 'addr' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:748: warning: Function parameter or member 'bit_nr' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:996: warning: Function parameter or member 'start_pfn' not described in 'register_nosave_region'
   kernel/power/snapshot.c:996: warning: Function parameter or member 'end_pfn' not described in 'register_nosave_region'
   kernel/power/snapshot.c:1320: warning: Function parameter or member 'zone' not described in 'saveable_highmem_page'
   kernel/power/snapshot.c:1320: warning: Function parameter or member 'pfn' not described in 'saveable_highmem_page'
   kernel/power/snapshot.c:1384: warning: Function parameter or member 'zone' not described in 'saveable_page'
   kernel/power/snapshot.c:1384: warning: Function parameter or member 'pfn' not described in 'saveable_page'
   kernel/power/snapshot.c:1461: warning: Function parameter or member 'dst' not described in 'safe_copy_page'
   kernel/power/snapshot.c:1461: warning: Function parameter or member 's_page' not described in 'safe_copy_page'
   kernel/power/snapshot.c:1702: warning: Function parameter or member 'x' not described in '__fraction'
   kernel/power/snapshot.c:1702: warning: Function parameter or member 'multiplier' not described in '__fraction'
   kernel/power/snapshot.c:1702: warning: Function parameter or member 'base' not described in '__fraction'
   kernel/power/snapshot.c:2000: warning: Function parameter or member 'nr_highmem' not described in 'count_pages_for_highmem'
   kernel/power/snapshot.c:2018: warning: Function parameter or member 'nr_pages' not described in 'enough_free_mem'
   kernel/power/snapshot.c:2018: warning: Function parameter or member 'nr_highmem' not described in 'enough_free_mem'
   kernel/power/snapshot.c:2041: warning: Function parameter or member 'safe_needed' not described in 'get_highmem_buffer'
   kernel/power/snapshot.c:2054: warning: Function parameter or member 'bm' not described in 'alloc_highmem_pages'
   kernel/power/snapshot.c:2054: warning: Function parameter or member 'nr_highmem' not described in 'alloc_highmem_pages'
   kernel/power/snapshot.c:2089: warning: Function parameter or member 'copy_bm' not described in 'swsusp_alloc'
   kernel/power/snapshot.c:2089: warning: Function parameter or member 'nr_pages' not described in 'swsusp_alloc'
   kernel/power/snapshot.c:2089: warning: Function parameter or member 'nr_highmem' not described in 'swsusp_alloc'
   kernel/power/snapshot.c:2311: warning: Function parameter or member 'bm' not described in 'mark_unsafe_pages'
   kernel/power/snapshot.c:2346: warning: Function parameter or member 'info' not described in 'load_header'
   kernel/power/snapshot.c:2515: warning: Function parameter or member 'page' not described in 'get_highmem_page_buffer'
   kernel/power/snapshot.c:2515: warning: Function parameter or member 'ca' not described in 'get_highmem_page_buffer'
   kernel/power/snapshot.c:2725: warning: Function parameter or member 'bm' not described in 'get_buffer'
   kernel/power/snapshot.c:2725: warning: Function parameter or member 'ca' not described in 'get_buffer'
   kernel/power/snapshot.c:2862: warning: Function parameter or member 'handle' not described in 'snapshot_write_finalize'
   kernel/power/swap.c:544: warning: Function parameter or member 'handle' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or member 'snapshot' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or member 'nr_to_write' not described in 'save_image'
   kernel/power/swap.c:891: warning: Function parameter or member 'nr_pages' not described in 'enough_swap'
   kernel/power/swap.c:1062: warning: Function parameter or member 'handle' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'snapshot' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'nr_to_read' not described in 'load_image'
   kernel/power/swap.c:1573: warning: Excess function parameter 'exclusive' description in 'swsusp_close'
   net/sunrpc/clnt.c: In function 'rpc_create':
   net/sunrpc/clnt.c:576:75: warning: '%s' directive output may be truncated writing up to 107 bytes into a region of size 48 [-Wformat-truncation=]
     576 |                                 snprintf(servername, sizeof(servername), "%s",
         |                                                                           ^~
   net/sunrpc/clnt.c:576:33: note: 'snprintf' output between 1 and 108 bytes into a destination of size 48
     576 |                                 snprintf(servername, sizeof(servername), "%s",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     577 |                                          sun->sun_path);
         |                                          ~~~~~~~~~~~~~~
   drivers/acpi/dock.c:388: warning: Function parameter or member 'ds' not described in 'handle_eject_request'
   drivers/acpi/dock.c:388: warning: Function parameter or member 'event' not described in 'handle_eject_request'
   kernel/irq/irqdomain.c:117: warning: Function parameter or member 'fwnode' not described in 'irq_domain_free_fwnode'
   kernel/irq/irqdomain.c:985: warning: Function parameter or member 'd' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:985: warning: Function parameter or member 'ctrlr' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:985: warning: Function parameter or member 'intspec' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:985: warning: Function parameter or member 'intsize' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:985: warning: Function parameter or member 'out_hwirq' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:985: warning: Function parameter or member 'out_type' not described in 'irq_domain_xlate_onecell'
   kernel/irq/irqdomain.c:1004: warning: Function parameter or member 'd' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:1004: warning: Function parameter or member 'ctrlr' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:1004: warning: Function parameter or member 'intspec' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:1004: warning: Function parameter or member 'intsize' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:1004: warning: Function parameter or member 'out_hwirq' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:1004: warning: Function parameter or member 'out_type' not described in 'irq_domain_xlate_twocell'
   kernel/irq/irqdomain.c:1027: warning: Function parameter or member 'd' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:1027: warning: Function parameter or member 'ctrlr' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:1027: warning: Function parameter or member 'intspec' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:1027: warning: Function parameter or member 'intsize' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:1027: warning: Function parameter or member 'out_hwirq' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:1027: warning: Function parameter or member 'out_type' not described in 'irq_domain_xlate_onetwocell'
   kernel/irq/irqdomain.c:1052: warning: Function parameter or member 'd' not described in 'irq_domain_translate_onecell'
   kernel/irq/irqdomain.c:1052: warning: Function parameter or member 'fwspec' not described in 'irq_domain_translate_onecell'
   kernel/irq/irqdomain.c:1052: warning: Function parameter or member 'out_hwirq' not described in 'irq_domain_translate_onecell'
   kernel/irq/irqdomain.c:1052: warning: Function parameter or member 'out_type' not described in 'irq_domain_translate_onecell'
   kernel/irq/irqdomain.c:1073: warning: Function parameter or member 'd' not described in 'irq_domain_translate_twocell'
   kernel/irq/irqdomain.c:1073: warning: Function parameter or member 'fwspec' not described in 'irq_domain_translate_twocell'
   kernel/irq/irqdomain.c:1073: warning: Function parameter or member 'out_hwirq' not described in 'irq_domain_translate_twocell'
   kernel/irq/irqdomain.c:1073: warning: Function parameter or member 'out_type' not described in 'irq_domain_translate_twocell'
>> fs/eventfd.c:57: warning: expecting prototype for eventfd_signal(). Prototype was for eventfd_signal_mask() instead
   drivers/iommu/intel/dmar.c: In function 'alloc_iommu':
   drivers/iommu/intel/dmar.c:1062:35: warning: '%d' directive writing between 1 and 10 bytes into a region of size 9 [-Wformat-overflow=]
    1062 |         sprintf(iommu->name, "dmar%d", iommu->seq_id);
         |                                   ^~
   drivers/iommu/intel/dmar.c:1062:30: note: directive argument in the range [0, 2147483647]
    1062 |         sprintf(iommu->name, "dmar%d", iommu->seq_id);
         |                              ^~~~~~~~
   drivers/iommu/intel/dmar.c:1062:9: note: 'sprintf' output between 6 and 15 bytes into a destination of size 13
    1062 |         sprintf(iommu->name, "dmar%d", iommu->seq_id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c: In function 'register_vlan_device':
   net/8021q/vlan.c:247:46: warning: '%i' directive output may be truncated writing between 1 and 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                              ^~
   net/8021q/vlan.c:247:42: note: directive argument in the range [0, 4094]
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                          ^~~~~~~
   net/8021q/vlan.c:247:17: note: 'snprintf' output between 3 and 21 bytes into a destination of size 16
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c:235:46: warning: '%.4i' directive output may be truncated writing 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                              ^~~~
   net/8021q/vlan.c:235:42: note: directive argument in the range [0, 4094]
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                          ^~~~~~~~~
   net/8021q/vlan.c:235:17: note: 'snprintf' output between 6 and 21 bytes into a destination of size 16
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/string_helpers.c: In function 'string_get_size':
   lib/string_helpers.c:121:46: warning: '%03u' directive output may be truncated writing between 3 and 10 bytes into a region of size 7 [-Wformat-truncation=]
     121 |                 snprintf(tmp, sizeof(tmp), ".%03u", remainder);
         |                                              ^~~~
   lib/string_helpers.c:121:44: note: directive argument in the range [0, 4294966295]
     121 |                 snprintf(tmp, sizeof(tmp), ".%03u", remainder);
         |                                            ^~~~~~~
   lib/string_helpers.c:121:17: note: 'snprintf' output between 5 and 12 bytes into a destination of size 8
     121 |                 snprintf(tmp, sizeof(tmp), ".%03u", remainder);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpi_watchdog.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Returns true if this system should prefer ACPI based watchdog instead of
   kernel/stacktrace.c:138: warning: Function parameter or member 'tsk' not described in 'stack_trace_save_tsk'
   kernel/stacktrace.c:138: warning: Excess function parameter 'task' description in 'stack_trace_save_tsk'
   arch/x86/kernel/cpu/mtrr/generic.c:434: warning: Function parameter or member 'var' not described in 'mtrr_overwrite_state'
   arch/x86/kernel/cpu/mtrr/generic.c:434: warning: Function parameter or member 'num_var' not described in 'mtrr_overwrite_state'
   arch/x86/kernel/cpu/mtrr/generic.c:434: warning: Function parameter or member 'def_type' not described in 'mtrr_overwrite_state'
   arch/x86/kernel/cpu/mtrr/generic.c:504: warning: Function parameter or member 'start' not described in 'mtrr_type_lookup'
   arch/x86/kernel/cpu/mtrr/generic.c:504: warning: Function parameter or member 'end' not described in 'mtrr_type_lookup'
   arch/x86/kernel/cpu/mtrr/generic.c:504: warning: Function parameter or member 'uniform' not described in 'mtrr_type_lookup'
   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   kernel/time/hrtimer.c: In function '__run_hrtimer':
   kernel/time/hrtimer.c:1651:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1651 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or member 'priv' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or member 'heap_devt' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or member 'list' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or member 'heap_cdev' not described in 'dma_heap'
   kernel/time/timekeeping.c:2423: warning: Function parameter or member 'txc' not described in 'do_adjtimex'
   kernel/time/timekeeping.c:2491: warning: Function parameter or member 'phase_ts' not described in 'hardpps'
   kernel/time/timekeeping.c:2491: warning: Function parameter or member 'raw_ts' not described in 'hardpps'
   arch/x86/kernel/cpu/sgx/main.c:740: warning: Function parameter or member 'low' not described in 'sgx_calc_section_metric'
   arch/x86/kernel/cpu/sgx/main.c:740: warning: Function parameter or member 'high' not described in 'sgx_calc_section_metric'
   arch/x86/kernel/cpu/sgx/main.c:740: warning: expecting prototype for A section metric is concatenated in a way that @low bits 12(). Prototype was for sgx_calc_section_metric() instead
   arch/x86/kernel/apic/apic.c:2170: warning: Function parameter or member 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ'
   arch/x86/kernel/apic/apic.c:2170: warning: expecting prototype for spurious_interrupt(). Prototype was for DEFINE_IDTENTRY_IRQ() instead
   In file included from include/linux/kernel.h:31,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/scsi/scsi_devinfo.c:3:
   drivers/scsi/scsi_devinfo.c: In function 'scsi_dev_info_list_add_str':
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \


vim +57 fs/eventfd.c

e1ad7468c77ddb9 Davide Libenzi    2007-05-10  45  
1e2d01f4ec1da4b Christian Brauner 2023-11-22  46  /**
1e2d01f4ec1da4b Christian Brauner 2023-11-22  47   * eventfd_signal - Adds @n to the eventfd counter.
1e2d01f4ec1da4b Christian Brauner 2023-11-22  48   * @ctx: [in] Pointer to the eventfd context.
1e2d01f4ec1da4b Christian Brauner 2023-11-22  49   * @mask: [in] poll mask
1e2d01f4ec1da4b Christian Brauner 2023-11-22  50   *
1e2d01f4ec1da4b Christian Brauner 2023-11-22  51   * This function is supposed to be called by the kernel in paths that do not
1e2d01f4ec1da4b Christian Brauner 2023-11-22  52   * allow sleeping. In this function we allow the counter to reach the ULLONG_MAX
1e2d01f4ec1da4b Christian Brauner 2023-11-22  53   * value, and we signal this as overflow condition by returning a EPOLLERR
1e2d01f4ec1da4b Christian Brauner 2023-11-22  54   * to poll(2).
1e2d01f4ec1da4b Christian Brauner 2023-11-22  55   */
1e2d01f4ec1da4b Christian Brauner 2023-11-22  56  void eventfd_signal_mask(struct eventfd_ctx *ctx, __poll_t mask)
e1ad7468c77ddb9 Davide Libenzi    2007-05-10 @57  {
e1ad7468c77ddb9 Davide Libenzi    2007-05-10  58  	unsigned long flags;
e1ad7468c77ddb9 Davide Libenzi    2007-05-10  59  
b5e683d5cab8cd4 Jens Axboe        2020-02-02  60  	/*
b5e683d5cab8cd4 Jens Axboe        2020-02-02  61  	 * Deadlock or stack overflow issues can happen if we recurse here
b5e683d5cab8cd4 Jens Axboe        2020-02-02  62  	 * through waitqueue wakeup handlers. If the caller users potentially
b5e683d5cab8cd4 Jens Axboe        2020-02-02  63  	 * nested waitqueues with custom wakeup handlers, then it should
b542e383d8c005f Thomas Gleixner   2021-07-29  64  	 * check eventfd_signal_allowed() before calling this function. If
b542e383d8c005f Thomas Gleixner   2021-07-29  65  	 * it returns false, the eventfd_signal() call should be deferred to a
b5e683d5cab8cd4 Jens Axboe        2020-02-02  66  	 * safe context.
b5e683d5cab8cd4 Jens Axboe        2020-02-02  67  	 */
9f0deaa12d832f4 Dylan Yudaken     2022-08-16  68  	if (WARN_ON_ONCE(current->in_eventfd))
1e2d01f4ec1da4b Christian Brauner 2023-11-22  69  		return;
b5e683d5cab8cd4 Jens Axboe        2020-02-02  70  
d48eb2331595224 Davide Libenzi    2007-05-18  71  	spin_lock_irqsave(&ctx->wqh.lock, flags);
9f0deaa12d832f4 Dylan Yudaken     2022-08-16  72  	current->in_eventfd = 1;
1e2d01f4ec1da4b Christian Brauner 2023-11-22  73  	if (ctx->count < ULLONG_MAX)
1e2d01f4ec1da4b Christian Brauner 2023-11-22  74  		ctx->count++;
e1ad7468c77ddb9 Davide Libenzi    2007-05-10  75  	if (waitqueue_active(&ctx->wqh))
03e02acda8e267a Jens Axboe        2022-11-20  76  		wake_up_locked_poll(&ctx->wqh, EPOLLIN | mask);
9f0deaa12d832f4 Dylan Yudaken     2022-08-16  77  	current->in_eventfd = 0;
d48eb2331595224 Davide Libenzi    2007-05-18  78  	spin_unlock_irqrestore(&ctx->wqh.lock, flags);
03e02acda8e267a Jens Axboe        2022-11-20  79  }
1e2d01f4ec1da4b Christian Brauner 2023-11-22  80  EXPORT_SYMBOL_GPL(eventfd_signal_mask);
e1ad7468c77ddb9 Davide Libenzi    2007-05-10  81  

:::::: The code at line 57 was first introduced by commit
:::::: e1ad7468c77ddb94b0615d5f50fa255525fde0f0 signal/timer/event: eventfd core

:::::: TO: Davide Libenzi <davidel@xmailserver.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

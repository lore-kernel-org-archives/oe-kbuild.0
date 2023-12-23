Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACC763C7
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Dec 2023 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTX9iU+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703313935; x=1734849935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sda1hEeX1M0nNlVeexzr2a3YyL/yR3FZWxdvgqDy/LU=;
  b=MTX9iU+OUxvmFmHTHwqC+oHrO7d684dx871FLuugEx6YbJW7SeiQBLOA
   DUGHuY57PCKsl3pEFyh8PVdrOJNktJvkiSbkB/iu000FEBJ/vMXNBu0Ip
   BwvIUcNDHyoVswUX9M+N8hmpu+mCC5yrKNm2h3DJcc4gzs7OTjNJSwpEa
   t4d8lt1HHTvAvee7fftx59KsB1/fQLs/z9a5F2PLEToQedip6uJ4Un2C7
   U1qbeB7DoKfMYTMYSnamwcTlDJOeCX6Ysu7Kv27rcIM1+TBhfTVJaAV2D
   uzV1vMmbLnXUQCB9TD5yiAnPEovx1llNqRcRlBeR7bR45X+NZgTIaYdB8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="376326822"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="376326822"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 22:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="727073784"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="727073784"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Dec 2023 22:45:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGvlG-000AOF-2w;
	Sat, 23 Dec 2023 06:45:28 +0000
Date: Sat, 23 Dec 2023 14:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpio/gpiolib-cdev.c:576: warning: Excess struct member
 'lines' description in 'linereq'
Message-ID: <202312231455.iCuOLpmP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "kernel-doc warning due to __counted_by"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Andy Shevchenko <andy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5254c0cbc92d2a08e75443bdb914f1c4839cdf5a
commit: a512635da9f7223b97262a5f376c7f1c3e9f6f7d gpiolib: cdev: annotate struct linereq with __counted_by
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312231455.iCuOLpmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312231455.iCuOLpmP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   lib/argv_split.c:36: warning: Function parameter or member 'argv' not described in 'argv_free'
   arch/x86/power/hibernate.c:47: warning: Function parameter or member 'pfn' not described in 'pfn_is_nosave'
   arch/x86/power/hibernate.c:92: warning: Function parameter or member 'max_size' not described in 'arch_hibernation_header_save'
   kernel/fork.c:1406: warning: Function parameter or member 'mm' not described in 'set_mm_exe_file'
   kernel/fork.c:1406: warning: Function parameter or member 'new_exe_file' not described in 'set_mm_exe_file'
   kernel/fork.c:1441: warning: Function parameter or member 'mm' not described in 'replace_mm_exe_file'
   kernel/fork.c:1441: warning: Function parameter or member 'new_exe_file' not described in 'replace_mm_exe_file'
   kernel/fork.c:1491: warning: Function parameter or member 'mm' not described in 'get_mm_exe_file'
   kernel/fork.c:1510: warning: Function parameter or member 'task' not described in 'get_task_exe_file'
   kernel/fork.c:1534: warning: Function parameter or member 'task' not described in 'get_task_mm'
   kernel/fork.c:2109: warning: bad line: 
   kernel/fork.c:2130: warning: Function parameter or member 'ret' not described in '__pidfd_prepare'
   kernel/fork.c:2130: warning: Excess function parameter 'pidfd' description in '__pidfd_prepare'
   kernel/fork.c:2179: warning: Function parameter or member 'ret' not described in 'pidfd_prepare'
   kernel/fork.c:2179: warning: Excess function parameter 'pidfd' description in 'pidfd_prepare'
   kernel/fork.c:3195: warning: expecting prototype for clone3(). Prototype was for sys_clone3() instead
   arch/x86/lib/csum-wrappers_64.c:25: warning: Excess function parameter 'isum' description in 'csum_and_copy_from_user'
   arch/x86/lib/csum-wrappers_64.c:25: warning: Excess function parameter 'errp' description in 'csum_and_copy_from_user'
   arch/x86/lib/csum-wrappers_64.c:49: warning: Excess function parameter 'isum' description in 'csum_and_copy_to_user'
   arch/x86/lib/csum-wrappers_64.c:49: warning: Excess function parameter 'errp' description in 'csum_and_copy_to_user'
   arch/x86/lib/csum-wrappers_64.c:71: warning: Excess function parameter 'sum' description in 'csum_partial_copy_nocheck'
   arch/x86/lib/insn-eval.c:1152: warning: Function parameter or member 'base_offset' not described in 'get_eff_addr_sib'
   arch/x86/lib/insn-eval.c:1152: warning: Excess function parameter 'regoff' description in 'get_eff_addr_sib'
   kernel/panic.c: In function '__warn':
   kernel/panic.c:666:17: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     666 |                 vprintk(args->fmt, args->args);
         |                 ^~~~~~~
   arch/x86/mm/pgtable.c:647: warning: Function parameter or member 'reserve' not described in 'reserve_top_address'
   arch/x86/mm/pgtable.c:696: warning: Function parameter or member 'p4d' not described in 'p4d_set_huge'
   arch/x86/mm/pgtable.c:696: warning: Function parameter or member 'addr' not described in 'p4d_set_huge'
   arch/x86/mm/pgtable.c:696: warning: Function parameter or member 'prot' not described in 'p4d_set_huge'
   arch/x86/mm/pgtable.c:706: warning: Function parameter or member 'p4d' not described in 'p4d_clear_huge'
   arch/x86/mm/pgtable.c:723: warning: Function parameter or member 'pud' not described in 'pud_set_huge'
   arch/x86/mm/pgtable.c:723: warning: Function parameter or member 'addr' not described in 'pud_set_huge'
   arch/x86/mm/pgtable.c:723: warning: Function parameter or member 'prot' not described in 'pud_set_huge'
   arch/x86/mm/pgtable.c:749: warning: Function parameter or member 'pmd' not described in 'pmd_set_huge'
   arch/x86/mm/pgtable.c:749: warning: Function parameter or member 'addr' not described in 'pmd_set_huge'
   arch/x86/mm/pgtable.c:749: warning: Function parameter or member 'prot' not described in 'pmd_set_huge'
   arch/x86/mm/pgtable.c:776: warning: Function parameter or member 'pud' not described in 'pud_clear_huge'
   arch/x86/mm/pgtable.c:791: warning: Function parameter or member 'pmd' not described in 'pmd_clear_huge'
   ipc/sem.c:647: warning: expecting prototype for perform_atomic_semop[_slow](). Prototype was for perform_atomic_semop_slow() instead
   kernel/cpu.c:85: warning: Excess struct member 'cpu' description in 'cpuhp_cpu_state'
   arch/x86/lib/usercopy_64.c:29: warning: Function parameter or member 'addr' not described in 'clean_cache_range'
   arch/x86/lib/usercopy_64.c:29: warning: Excess function parameter 'vaddr' description in 'clean_cache_range'
>> drivers/gpio/gpiolib-cdev.c:576: warning: Excess struct member 'lines' description in 'linereq'
   arch/x86/mm/pat/memtype.c:710: warning: Function parameter or member 'pfn' not described in 'pat_pfn_immune_to_uc_mtrr'
   arch/x86/events/intel/pt.c:747: warning: Function parameter or member 'cpu' not described in 'topa_insert_pages'
   arch/x86/events/intel/pt.c:1215: warning: Function parameter or member 'cpu' not described in 'pt_buffer_init_topa'
   arch/x86/events/intel/pt.c:1215: warning: Function parameter or member 'nr_pages' not described in 'pt_buffer_init_topa'
   arch/x86/events/intel/pt.c:1215: warning: Excess function parameter 'size' description in 'pt_buffer_init_topa'
   arch/x86/events/intel/pt.c:1297: warning: Function parameter or member 'event' not described in 'pt_buffer_setup_aux'
   arch/x86/events/intel/pt.c:1297: warning: Excess function parameter 'cpu' description in 'pt_buffer_setup_aux'
   security/yama/yama_lsm.c:116: warning: Function parameter or member 'work' not described in 'yama_relation_cleanup'
   kernel/task_work.c:89: warning: Function parameter or member 'data' not described in 'task_work_cancel_match'
   kernel/workqueue.c: In function 'create_worker':
   kernel/workqueue.c:2188:54: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 5 and 14 [-Wformat-truncation=]
    2188 |                 snprintf(id_buf, sizeof(id_buf), "%d:%d%s", pool->cpu, id,
         |                                                      ^~
   kernel/workqueue.c:2188:50: note: directive argument in the range [0, 2147483647]
    2188 |                 snprintf(id_buf, sizeof(id_buf), "%d:%d%s", pool->cpu, id,
         |                                                  ^~~~~~~~~
   kernel/workqueue.c:2188:17: note: 'snprintf' output between 4 and 23 bytes into a destination of size 16
    2188 |                 snprintf(id_buf, sizeof(id_buf), "%d:%d%s", pool->cpu, id,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2189 |                          pool->attrs->nice < 0  ? "H" : "");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/pid.c:628: warning: expecting prototype for pidfd_open(). Prototype was for sys_pidfd_open() instead
   drivers/acpi/osl.c: In function 'acpi_os_vprintf':
   drivers/acpi/osl.c:156:9: warning: function 'acpi_os_vprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     156 |         vsprintf(buffer, fmt, args);
         |         ^~~~~~~~
   fs/namespace.c:3046: warning: Function parameter or member 'mp' not described in 'can_move_mount_beneath'
   kernel/reboot.c:224: warning: Function parameter or member 'cmd' not described in 'do_kernel_restart'
   kernel/reboot.c:948: warning: Function parameter or member 'poweroff_delay_ms' not described in 'hw_failure_emergency_poweroff'
   drivers/acpi/sleep.c:519: warning: Function parameter or member 'acpi_state' not described in 'acpi_pm_start'
   drivers/acpi/sleep.c:559: warning: Function parameter or member 'pm_state' not described in 'acpi_suspend_begin'
   drivers/acpi/sleep.c:692: warning: Function parameter or member 'pm_state' not described in 'acpi_suspend_begin_old'
   drivers/acpi/sleep.c:988: warning: Function parameter or member 'stage' not described in 'acpi_hibernation_begin_old'
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1682:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1682 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
   block/disk-events.c:300: warning: Excess function parameter 'events' description in 'disk_force_media_change'
   drivers/acpi/dock.c:388: warning: Function parameter or member 'ds' not described in 'handle_eject_request'
   drivers/acpi/dock.c:388: warning: Function parameter or member 'event' not described in 'handle_eject_request'
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
   drivers/clk/clkdev.c:173:17: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     173 |                 vscnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
         |                 ^~~~~~~~~~
   In file included from kernel/locking/qspinlock.c:586:
   kernel/locking/qspinlock_paravirt.h: In function 'pv_wait_node':
   kernel/locking/qspinlock_paravirt.h:298:14: warning: variable 'wait_early' set but not used [-Wunused-but-set-variable]
     298 |         bool wait_early;
         |              ^~~~~~~~~~
   arch/x86/kernel/tsc.c:1339: warning: Excess function parameter 'cycles' description in 'convert_art_ns_to_tsc'
   arch/x86/kernel/tsc.c:1339: warning: Excess function parameter 'cs' description in 'convert_art_ns_to_tsc'
   arch/x86/kernel/tsc.c:1373: warning: Function parameter or member 'work' not described in 'tsc_refine_calibration_work'
   kernel/power/swap.c:543: warning: Function parameter or member 'handle' not described in 'save_image'
   kernel/power/swap.c:543: warning: Function parameter or member 'snapshot' not described in 'save_image'
   kernel/power/swap.c:543: warning: Function parameter or member 'nr_to_write' not described in 'save_image'
   kernel/power/swap.c:890: warning: Function parameter or member 'nr_pages' not described in 'enough_swap'
   kernel/power/swap.c:1061: warning: Function parameter or member 'handle' not described in 'load_image'
   kernel/power/swap.c:1061: warning: Function parameter or member 'snapshot' not described in 'load_image'
   kernel/power/swap.c:1061: warning: Function parameter or member 'nr_to_read' not described in 'load_image'
   kernel/power/swap.c:1520: warning: Function parameter or member 'snapshot_test' not described in 'swsusp_check'
   kernel/power/swap.c:1570: warning: Function parameter or member 'snapshot_test' not described in 'swsusp_close'
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


vim +576 drivers/gpio/gpiolib-cdev.c

3c0d9c635ae2b2 Kent Gibson         2020-09-28  548  
3c0d9c635ae2b2 Kent Gibson         2020-09-28  549  /**
3c0d9c635ae2b2 Kent Gibson         2020-09-28  550   * struct linereq - contains the state of a userspace line request
3c0d9c635ae2b2 Kent Gibson         2020-09-28  551   * @gdev: the GPIO device the line request pertains to
3c0d9c635ae2b2 Kent Gibson         2020-09-28  552   * @label: consumer label used to tag GPIO descriptors
3c0d9c635ae2b2 Kent Gibson         2020-09-28  553   * @num_lines: the number of lines in the lines array
73e0341992b68b Kent Gibson         2020-09-28  554   * @wait: wait queue that handles blocking reads of events
a0dda508bd66b9 Bartosz Golaszewski 2023-08-17  555   * @device_unregistered_nb: notifier block for receiving gdev unregister events
73e0341992b68b Kent Gibson         2020-09-28  556   * @event_buffer_size: the number of elements allocated in @events
73e0341992b68b Kent Gibson         2020-09-28  557   * @events: KFIFO for the GPIO events
73e0341992b68b Kent Gibson         2020-09-28  558   * @seqno: the sequence number for edge events generated on all lines in
73e0341992b68b Kent Gibson         2020-09-28  559   * this line request.  Note that this is not used when @num_lines is 1, as
73e0341992b68b Kent Gibson         2020-09-28  560   * the line_seqno is then the same and is cheaper to calculate.
a54756cb24eafa Kent Gibson         2020-09-28  561   * @config_mutex: mutex for serializing ioctl() calls to ensure consistency
a54756cb24eafa Kent Gibson         2020-09-28  562   * of configuration, particularly multi-step accesses to desc flags.
3c0d9c635ae2b2 Kent Gibson         2020-09-28  563   * @lines: the lines held by this line request, with @num_lines elements.
3c0d9c635ae2b2 Kent Gibson         2020-09-28  564   */
3c0d9c635ae2b2 Kent Gibson         2020-09-28  565  struct linereq {
3c0d9c635ae2b2 Kent Gibson         2020-09-28  566  	struct gpio_device *gdev;
3c0d9c635ae2b2 Kent Gibson         2020-09-28  567  	const char *label;
3c0d9c635ae2b2 Kent Gibson         2020-09-28  568  	u32 num_lines;
73e0341992b68b Kent Gibson         2020-09-28  569  	wait_queue_head_t wait;
a0dda508bd66b9 Bartosz Golaszewski 2023-08-17  570  	struct notifier_block device_unregistered_nb;
73e0341992b68b Kent Gibson         2020-09-28  571  	u32 event_buffer_size;
73e0341992b68b Kent Gibson         2020-09-28  572  	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
73e0341992b68b Kent Gibson         2020-09-28  573  	atomic_t seqno;
a54756cb24eafa Kent Gibson         2020-09-28  574  	struct mutex config_mutex;
a512635da9f722 Kees Cook           2023-09-22  575  	struct line lines[] __counted_by(num_lines);
3c0d9c635ae2b2 Kent Gibson         2020-09-28 @576  };
3c0d9c635ae2b2 Kent Gibson         2020-09-28  577  

:::::: The code at line 576 was first introduced by commit
:::::: 3c0d9c635ae2b2c6416928271a452017b60e3f98 gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL

:::::: TO: Kent Gibson <warthog618@gmail.com>
:::::: CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

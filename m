Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CAE4F1E7
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 18:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+WE+e9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701974626; x=1733510626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d+7F3r5mXVqEwsIrzAMDhfV3SXKkbFcgKvBJmX087Xo=;
  b=X+WE+e9mfcqdo2B8c/+vQjOQj0xEezVDc1J5wbFEsaKbOyqDFrz2ykWp
   8r6O4TSCDrOpn+Sven7rzmm181MCMKwIQQeo26apjudN4hH+5vU+UJj3q
   wZLAI2lz8MChhD9jjKAvCtewOsP2UgfVTpBZWh6kozusXq4X7DyiKAHbM
   iA0eIUKNX8/HVyCHDnBRlaDCboWfWFCWPSP6PHGujMo4wIyV2BoJXjz8E
   SFFz6lrsOOBZV4iPgC5p28da1yM2cJQBRWZowPC4WHgq0SCbQInZzQ3iy
   C5xpZQjsIYKbwqYyl6JvOlAjcywZuYlGu7KCkYHPIRCd63peB+GPRvH4a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480476364"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="480476364"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 10:43:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="806113513"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="806113513"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Dec 2023 10:43:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBJLY-000CgP-2l;
	Thu, 07 Dec 2023 18:43:40 +0000
Date: Fri, 8 Dec 2023 02:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.11.08a 1/44] ERROR: modpost: vmlinux: local
 symbol 'rcu_cpu_stall_notifiers' was exported
Message-ID: <202312080235.cG9OG2Us-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 68f721e904b253ae9f782db0362f608048225403 was found in branch paulmck-rcu/dev.2023.11.08a, not in new branch paulmck-rcu/dev.2023.12.05a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.11.08a
head:   5434f4f6b4e66545d4c3b29108b41483d2365e36
commit: 68f721e904b253ae9f782db0362f608048225403 [1/44] rcu: Restrict access to RCU CPU stall notifiers
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c033-20221102 (https://download.01.org/0day-ci/archive/20231208/202312080235.cG9OG2Us-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312080235.cG9OG2Us-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312080235.cG9OG2Us-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: local symbol 'irq_chip_unmask_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_eoi_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_set_affinity_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_set_type_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_retrigger_hierarchy' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_set_vcpu_affinity_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_set_wake_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_request_resources_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_release_resources_parent' was exported
ERROR: modpost: vmlinux: local symbol 'dummy_irq_chip' was exported
ERROR: modpost: vmlinux: local symbol 'devm_request_threaded_irq' was exported
ERROR: modpost: vmlinux: local symbol 'devm_request_any_context_irq' was exported
ERROR: modpost: vmlinux: local symbol 'devm_free_irq' was exported
ERROR: modpost: vmlinux: local symbol '__devm_irq_alloc_descs' was exported
ERROR: modpost: vmlinux: local symbol 'devm_irq_alloc_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol 'devm_irq_setup_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_noop' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_mask_disable_reg' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_mask_set_bit' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_mask_clr_bit' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_unmask_enable_reg' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_ack_set_bit' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_set_wake' was exported
ERROR: modpost: vmlinux: local symbol 'irq_alloc_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol '__irq_alloc_domain_generic_chips' was exported
ERROR: modpost: vmlinux: local symbol 'irq_get_domain_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_generic_chip_ops' was exported
ERROR: modpost: vmlinux: local symbol 'irq_setup_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_setup_alt_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_remove_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irqchip_fwnode_ops' was exported
ERROR: modpost: vmlinux: local symbol '__irq_domain_alloc_fwnode' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_free_fwnode' was exported
ERROR: modpost: vmlinux: local symbol '__irq_domain_add' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_remove' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_update_bus_token' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_create_simple' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_add_legacy' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_create_legacy' was exported
ERROR: modpost: vmlinux: local symbol 'irq_find_matching_fwspec' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_default_host' was exported
ERROR: modpost: vmlinux: local symbol 'irq_get_default_host' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_associate' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_associate_many' was exported
ERROR: modpost: vmlinux: local symbol 'irq_create_mapping_affinity' was exported
ERROR: modpost: vmlinux: local symbol 'of_phandle_args_to_fwspec' was exported
ERROR: modpost: vmlinux: local symbol 'irq_create_fwspec_mapping' was exported
ERROR: modpost: vmlinux: local symbol 'irq_create_of_mapping' was exported
ERROR: modpost: vmlinux: local symbol 'irq_dispose_mapping' was exported
ERROR: modpost: vmlinux: local symbol '__irq_resolve_mapping' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_xlate_onecell' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_xlate_twocell' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_xlate_onetwocell' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_simple_ops' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_translate_onecell' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_translate_twocell' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_reset_irq_data' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_create_hierarchy' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_disconnect_hierarchy' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_get_irq_data' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_set_hwirq_and_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_set_info' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_free_irqs_common' was exported
ERROR: modpost: vmlinux: local symbol '__irq_domain_alloc_irqs' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_push_irq' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_pop_irq' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_alloc_irqs_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_free_irqs_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_create_sim' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_remove_sim' was exported
ERROR: modpost: vmlinux: local symbol 'devm_irq_domain_create_sim' was exported
ERROR: modpost: vmlinux: local symbol 'get_cached_msi_msg' was exported
ERROR: modpost: vmlinux: local symbol 'msi_lock_descs' was exported
ERROR: modpost: vmlinux: local symbol 'msi_unlock_descs' was exported
ERROR: modpost: vmlinux: local symbol 'msi_domain_first_desc' was exported
ERROR: modpost: vmlinux: local symbol 'msi_next_desc' was exported
ERROR: modpost: vmlinux: local symbol 'msi_domain_get_virq' was exported
ERROR: modpost: vmlinux: local symbol 'msi_device_has_isolated_msi' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_lock_sched_held' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_gp_is_normal' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_async_should_hurry' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_async_hurry' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_async_relax' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_gp_is_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_expedite_gp' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_unexpedite_gp' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_inkernel_boot_has_ended' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_lock_map' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_bh_lock_map' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_sched_lock_map' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_callback_map' was exported
ERROR: modpost: vmlinux: local symbol 'debug_lockdep_rcu_enabled' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_lock_held' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_lock_bh_held' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_lock_any_held' was exported
ERROR: modpost: vmlinux: local symbol 'wakeme_after_rcu' was exported
ERROR: modpost: vmlinux: local symbol '__wait_rcu_gp' was exported
ERROR: modpost: vmlinux: local symbol 'finish_rcuwait' was exported
ERROR: modpost: vmlinux: local symbol 'do_trace_rcu_torture_read' was exported
ERROR: modpost: vmlinux: local symbol 'torture_sched_setaffinity' was exported
>> ERROR: modpost: vmlinux: local symbol 'rcu_cpu_stall_notifiers' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_cpu_stall_suppress' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_cpu_stall_suppress_at_boot' was exported
ERROR: modpost: vmlinux: local symbol 'get_completed_synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'call_rcu_tasks' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu_tasks' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_barrier_tasks' was exported
ERROR: modpost: vmlinux: local symbol 'show_rcu_tasks_classic_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol 'get_rcu_tasks_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol 'call_rcu_tasks_rude' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu_tasks_rude' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_barrier_tasks_rude' was exported
ERROR: modpost: vmlinux: local symbol 'show_rcu_tasks_rude_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol 'get_rcu_tasks_rude_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_trace_lock_map' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_trc_cmpxchg_need_qs' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_unlock_trace_special' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_tasks_trace_qs_blkd' was exported
ERROR: modpost: vmlinux: local symbol 'call_rcu_tasks_trace' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu_tasks_trace' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_barrier_tasks_trace' was exported
ERROR: modpost: vmlinux: local symbol 'show_rcu_tasks_trace_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol 'get_rcu_tasks_trace_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol '__init_srcu_struct' was exported
ERROR: modpost: vmlinux: local symbol 'cleanup_srcu_struct' was exported
ERROR: modpost: vmlinux: local symbol '__srcu_read_lock' was exported
ERROR: modpost: vmlinux: local symbol '__srcu_read_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'call_srcu' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_srcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_srcu' was exported
ERROR: modpost: vmlinux: local symbol 'get_state_synchronize_srcu' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_srcu' was exported
ERROR: modpost: vmlinux: local symbol 'poll_state_synchronize_srcu' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_barrier' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_batches_completed' was exported
ERROR: modpost: vmlinux: local symbol 'srcutorture_get_gp_data' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_torture_stats_print' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_scheduler_active' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_get_gp_kthreads_prio' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_momentary_dyntick_idle' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_get_gp_seq' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_exp_batches_completed' was exported
ERROR: modpost: vmlinux: local symbol 'rcutorture_get_gp_data' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_is_watching' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_gp_slow_register' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_gp_slow_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_gp_set_torture_wait' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_force_quiescent_state' was exported
ERROR: modpost: vmlinux: local symbol 'call_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'kvfree_call_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'get_completed_synchronize_rcu_full' was exported
ERROR: modpost: vmlinux: local symbol 'get_state_synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'get_state_synchronize_rcu_full' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_rcu_full' was exported
ERROR: modpost: vmlinux: local symbol 'poll_state_synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'poll_state_synchronize_rcu_full' was exported
ERROR: modpost: vmlinux: local symbol 'cond_synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'cond_synchronize_rcu_full' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_barrier' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_exp_jiffies_till_stall_check' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_jiffies_till_stall_check' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_check_boost_fail' was exported
ERROR: modpost: vmlinux: local symbol 'show_rcu_gp_kthreads' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_fwd_progress_check' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_rcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_rcu_expedited_full' was exported
ERROR: modpost: vmlinux: local symbol 'cond_synchronize_rcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'cond_synchronize_rcu_expedited_full' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_note_context_switch' was exported
ERROR: modpost: vmlinux: local symbol '__rcu_read_lock' was exported
ERROR: modpost: vmlinux: local symbol '__rcu_read_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'dmam_free_coherent' was exported
ERROR: modpost: vmlinux: local symbol 'dmam_alloc_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_map_page_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_unmap_page_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_map_sg_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_map_sgtable' was exported
ERROR: modpost: vmlinux: local symbol 'dma_unmap_sg_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_map_resource' was exported
ERROR: modpost: vmlinux: local symbol 'dma_unmap_resource' was exported
ERROR: modpost: vmlinux: local symbol 'dma_sync_single_for_cpu' was exported
ERROR: modpost: vmlinux: local symbol 'dma_sync_single_for_device' was exported
ERROR: modpost: vmlinux: local symbol 'dma_sync_sg_for_cpu' was exported
ERROR: modpost: vmlinux: local symbol 'dma_sync_sg_for_device' was exported
ERROR: modpost: vmlinux: local symbol 'dma_get_sgtable_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_can_mmap' was exported
ERROR: modpost: vmlinux: local symbol 'dma_mmap_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_get_required_mask' was exported
ERROR: modpost: vmlinux: local symbol 'dma_alloc_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_free_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_alloc_pages' was exported
ERROR: modpost: vmlinux: local symbol 'dma_free_pages' was exported
ERROR: modpost: vmlinux: local symbol 'dma_mmap_pages' was exported
ERROR: modpost: vmlinux: local symbol 'dma_alloc_noncontiguous' was exported
ERROR: modpost: vmlinux: local symbol 'dma_free_noncontiguous' was exported
ERROR: modpost: vmlinux: local symbol 'dma_vmap_noncontiguous' was exported
ERROR: modpost: vmlinux: local symbol 'dma_vunmap_noncontiguous' was exported
ERROR: modpost: vmlinux: local symbol 'dma_mmap_noncontiguous' was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

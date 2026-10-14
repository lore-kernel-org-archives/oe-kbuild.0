Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A472C1594
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 04:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950964; cv=none; b=cMw88CcV5qD3540W/fbv38CDawipgG5hgWSX2wJbdogpnLqB2vMLllwRJe5gA19xTgheJK9L6UpO5Z4y3QdvcUiz5S62cuFNfD+KTCA7STxCqhoLsPOuokzAUnOjgw9zrUAtQcJPeHo1MSfDxD2w/FsftgB50iQuWg4g+my3Nys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950964; c=relaxed/simple;
	bh=u/2Nb+VyXxNMlMCZ8Z4l2BV2vmjBPDaafTqar/d/5p4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ptm+t/68Px8xEFcW9hhS2u3B8bKMbx0DVdYeJ6SaR4aLhYL4vh78/VJvsWw2kdVN2oKN8L9+9Zdl1RTudpWtAfmSCZOeVyb8aXHndlLmoe+plrRijWlN+zRtpZW/ngpuj8RzZqQjv42PfAZYkl5RKAepLn1s4EPQrMOPovRHM/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eg+NsiaZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eg+NsiaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791950961; x=1823486961;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u/2Nb+VyXxNMlMCZ8Z4l2BV2vmjBPDaafTqar/d/5p4=;
  b=eg+NsiaZoerlCJqfxtned8IxpAGbcqWKcHjrrPv8VNobtDAOPbDQKbYN
   J0iCmO5Axi0XVOzp4qlk89bjntlpGdGFg87EDlxhPTs8wZcqh7T7CFGFN
   wxrdzoVjgLi5x7rkhMyAR1WQVZ1SKEKIwgU559G+KcAxxJishcM/LNpRm
   sElTM1bolkjjs0SFhc1cB4BUCga+z6xtnwiZMFlYNprCG1FqZ2MY1IQ7r
   Dnla5Y2PFwG726x+gk3XCtuT+X0SN7M4iXVFA9YqnOdMmYM4pockWUTOM
   0LiXtTdsdPUU9I6sjI6S2bqzg01hzSXVRAvzsmn63ZLaD04OSLqgyfisd
   Q==;
X-CSE-ConnectionGUID: doRiirgSSu2H4H6PiVnV2g==
X-CSE-MsgGUID: 2ruk8OJwRNqTmHwfIXuVfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="695761"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="695761"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 21:09:20 -0700
X-CSE-ConnectionGUID: nMNiGV5vQTquevAwkTGKbg==
X-CSE-MsgGUID: 3L9Qsm1lTmO5c5ZdQ52txg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1782054"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Oct 2026 21:09:19 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGqIm-00000000Aqj-2lSy;
	Wed, 14 Oct 2026 04:09:16 +0000
Date: Wed, 14 Oct 2026 06:08:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-error-propagation 3/3] WARNING:
 modpost: vmlinux: EXPORT symbol 'x86_apple_machine' version generation
 failed, symbol will not be versioned.
Message-ID: <202610140645.kN3IWAvp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-error-propagation
head:   e7f0b27fbbf1115d93bd108f00ebe7a0428e7e38
commit: e7f0b27fbbf1115d93bd108f00ebe7a0428e7e38 [3/3] kbuild
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261=
014/202610140645.kN3IWAvp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261014/202610140645.kN3IWAvp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610140645.kN3IWAvp-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: EXPORT symbol 'system_state' version generation =
failed, symbol will not be versioned.
Is 'system_state' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'static_key_initialized' version g=
eneration failed, symbol will not be versioned.
Is 'static_key_initialized' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'reset_devices' version generation=
 failed, symbol will not be versioned.
Is 'reset_devices' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'loops_per_jiffy' version generati=
on failed, symbol will not be versioned.
Is 'loops_per_jiffy' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'perf_assign_events' version gener=
ation failed, symbol will not be versioned.
Is 'perf_assign_events' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'events_sysfs_show' version genera=
tion failed, symbol will not be versioned.
Is 'events_sysfs_show' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'events_hybrid_sysfs_show' version=
 generation failed, symbol will not be versioned.
Is 'events_hybrid_sysfs_show' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'get_ibs_caps' version generation =
failed, symbol will not be versioned.
Is 'get_ibs_caps' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'x86_apple_machine' version gen=
eration failed, symbol will not be versioned.
Is 'x86_apple_machine' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'irq_fpu_usable' version generatio=
n failed, symbol will not be versioned.
Is 'irq_fpu_usable' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kernel_fpu_begin_mask' version ge=
neration failed, symbol will not be versioned.
Is 'kernel_fpu_begin_mask' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kernel_fpu_end' version generatio=
n failed, symbol will not be versioned.
Is 'kernel_fpu_end' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_info' version generation fail=
ed, symbol will not be versioned.
Is 'cpu_info' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'USER_PTR_MAX' version generation =
failed, symbol will not be versioned.
Is 'USER_PTR_MAX' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__max_threads_per_core' version g=
eneration failed, symbol will not be versioned.
Is '__max_threads_per_core' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__max_dies_per_package' version g=
eneration failed, symbol will not be versioned.
Is '__max_dies_per_package' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__max_logical_packages' version g=
eneration failed, symbol will not be versioned.
Is '__max_logical_packages' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__num_nodes_per_package' version =
generation failed, symbol will not be versioned.
Is '__num_nodes_per_package' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__num_cores_per_package' version =
generation failed, symbol will not be versioned.
Is '__num_cores_per_package' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__num_threads_per_package' versio=
n generation failed, symbol will not be versioned.
Is '__num_threads_per_package' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'gdt_page' version generation fail=
ed, symbol will not be versioned.
Is 'gdt_page' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'native_write_cr0' version generat=
ion failed, symbol will not be versioned.
Is 'native_write_cr0' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'load_fixmap_gdt' version generati=
on failed, symbol will not be versioned.
Is 'load_fixmap_gdt' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'current_task' version generation =
failed, symbol will not be versioned.
Is 'current_task' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'const_current_task' version gener=
ation failed, symbol will not be versioned.
Is 'const_current_task' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__preempt_count' version generati=
on failed, symbol will not be versioned.
Is '__preempt_count' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_sibling_map' version generati=
on failed, symbol will not be versioned.
Is 'cpu_sibling_map' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_core_map' version generation =
failed, symbol will not be versioned.
Is 'cpu_core_map' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_die_map' version generation f=
ailed, symbol will not be versioned.
Is 'cpu_die_map' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_clustergroup_mask' version ge=
neration failed, symbol will not be versioned.
Is 'cpu_clustergroup_mask' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'boot_cpu_physical_apicid' version=
 generation failed, symbol will not be versioned.
Is 'boot_cpu_physical_apicid' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'local_apic_timer_c2_ok' version g=
eneration failed, symbol will not be versioned.
Is 'local_apic_timer_c2_ok' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'setup_APIC_eilvt' version generat=
ion failed, symbol will not be versioned.
Is 'setup_APIC_eilvt' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kvm_para_available' version gener=
ation failed, symbol will not be versioned.
Is 'kvm_para_available' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kvm_arch_para_hints' version gene=
ration failed, symbol will not be versioned.
Is 'kvm_arch_para_hints' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'arch_haltpoll_enable' version gen=
eration failed, symbol will not be versioned.
Is 'arch_haltpoll_enable' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'arch_haltpoll_disable' version ge=
neration failed, symbol will not be versioned.
Is 'arch_haltpoll_disable' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'clflush_cache_range' version gene=
ration failed, symbol will not be versioned.
Is 'clflush_cache_range' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_cache_has_invalidate_memregio=
n' version generation failed, symbol will not be versioned.
Is 'cpu_cache_has_invalidate_memregion' prototyped in <asm/asm-prototypes.h=
>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_cache_invalidate_memregion' v=
ersion generation failed, symbol will not be versioned.
Is 'cpu_cache_invalidate_memregion' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'lookup_address' version generatio=
n failed, symbol will not be versioned.
Is 'lookup_address' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'slow_virt_to_phys' version genera=
tion failed, symbol will not be versioned.
Is 'slow_virt_to_phys' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_memory_uc' version generation=
 failed, symbol will not be versioned.
Is 'set_memory_uc' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_memory_wc' version generation=
 failed, symbol will not be versioned.
Is 'set_memory_wc' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_memory_wb' version generation=
 failed, symbol will not be versioned.
Is 'set_memory_wb' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_memory_encrypted' version gen=
eration failed, symbol will not be versioned.
Is 'set_memory_encrypted' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_memory_decrypted' version gen=
eration failed, symbol will not be versioned.
Is 'set_memory_decrypted' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_pages_uc' version generation =
failed, symbol will not be versioned.
Is 'set_pages_uc' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_pages_array_uc' version gener=
ation failed, symbol will not be versioned.
Is 'set_pages_array_uc' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_pages_array_wc' version gener=
ation failed, symbol will not be versioned.
Is 'set_pages_array_wc' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_pages_wb' version generation =
failed, symbol will not be versioned.
Is 'set_pages_wb' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_pages_array_wb' version gener=
ation failed, symbol will not be versioned.
Is 'set_pages_array_wb' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'panic_timeout' version generation=
 failed, symbol will not be versioned.
Is 'panic_timeout' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'panic_notifier_list' version gene=
ration failed, symbol will not be versioned.
Is 'panic_notifier_list' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'panic_blink' version generation f=
ailed, symbol will not be versioned.
Is 'panic_blink' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'panic_try_start' version generati=
on failed, symbol will not be versioned.
Is 'panic_try_start' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'panic_reset' version generation f=
ailed, symbol will not be versioned.
Is 'panic_reset' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'panic_in_progress' version genera=
tion failed, symbol will not be versioned.
Is 'panic_in_progress' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'panic_on_this_cpu' version genera=
tion failed, symbol will not be versioned.
--
WARNING: modpost: vmlinux: EXPORT symbol 'dma_free_noncontiguous' version g=
eneration failed, symbol will not be versioned.
Is 'dma_free_noncontiguous' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_vmap_noncontiguous' version g=
eneration failed, symbol will not be versioned.
Is 'dma_vmap_noncontiguous' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_vunmap_noncontiguous' version=
 generation failed, symbol will not be versioned.
Is 'dma_vunmap_noncontiguous' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_mmap_noncontiguous' version g=
eneration failed, symbol will not be versioned.
Is 'dma_mmap_noncontiguous' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_pci_p2pdma_supported' version=
 generation failed, symbol will not be versioned.
Is 'dma_pci_p2pdma_supported' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_set_mask' version generation =
failed, symbol will not be versioned.
Is 'dma_set_mask' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_set_coherent_mask' version ge=
neration failed, symbol will not be versioned.
Is 'dma_set_coherent_mask' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_addressing_limited' version g=
eneration failed, symbol will not be versioned.
Is 'dma_addressing_limited' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_max_mapping_size' version gen=
eration failed, symbol will not be versioned.
Is 'dma_max_mapping_size' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_opt_mapping_size' version gen=
eration failed, symbol will not be versioned.
Is 'dma_opt_mapping_size' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_get_merge_boundary' version g=
eneration failed, symbol will not be versioned.
Is 'dma_get_merge_boundary' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'register_module_notifier' version=
 generation failed, symbol will not be versioned.
Is 'register_module_notifier' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'unregister_module_notifier' versi=
on generation failed, symbol will not be versioned.
Is 'unregister_module_notifier' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__module_put_and_kthread_exit' ve=
rsion generation failed, symbol will not be versioned.
Is '__module_put_and_kthread_exit' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__tracepoint_module_get' version =
generation failed, symbol will not be versioned.
Is '__tracepoint_module_get' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__traceiter_module_get' version g=
eneration failed, symbol will not be versioned.
Is '__traceiter_module_get' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__SCK__tp_func_module_get' versio=
n generation failed, symbol will not be versioned.
Is '__SCK__tp_func_module_get' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__SCT__tp_func_module_get' versio=
n generation failed, symbol will not be versioned.
Is '__SCT__tp_func_module_get' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'module_refcount' version generati=
on failed, symbol will not be versioned.
Is 'module_refcount' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__symbol_put' version generation =
failed, symbol will not be versioned.
Is '__symbol_put' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'symbol_put_addr' version generati=
on failed, symbol will not be versioned.
Is 'symbol_put_addr' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__module_get' version generation =
failed, symbol will not be versioned.
Is '__module_get' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'try_module_get' version generatio=
n failed, symbol will not be versioned.
Is 'try_module_get' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'module_put' version generation fa=
iled, symbol will not be versioned.
Is 'module_put' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__symbol_get' version generation =
failed, symbol will not be versioned.
Is '__symbol_get' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'sys_tz' version generation failed=
, symbol will not be versioned.
Is 'sys_tz' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mktime64' version generation fail=
ed, symbol will not be versioned.
Is 'mktime64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'ns_to_kernel_old_timeval' version=
 generation failed, symbol will not be versioned.
Is 'ns_to_kernel_old_timeval' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_normalized_timespec64' versio=
n generation failed, symbol will not be versioned.
Is 'set_normalized_timespec64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'ns_to_timespec64' version generat=
ion failed, symbol will not be versioned.
Is 'ns_to_timespec64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__msecs_to_jiffies' version gener=
ation failed, symbol will not be versioned.
Is '__msecs_to_jiffies' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__usecs_to_jiffies' version gener=
ation failed, symbol will not be versioned.
Is '__usecs_to_jiffies' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'timespec64_to_jiffies' version ge=
neration failed, symbol will not be versioned.
Is 'timespec64_to_jiffies' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'jiffies_to_timespec64' version ge=
neration failed, symbol will not be versioned.
Is 'jiffies_to_timespec64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'jiffies_to_clock_t' version gener=
ation failed, symbol will not be versioned.
Is 'jiffies_to_clock_t' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'clock_t_to_jiffies' version gener=
ation failed, symbol will not be versioned.
Is 'clock_t_to_jiffies' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'jiffies_64_to_clock_t' version ge=
neration failed, symbol will not be versioned.
Is 'jiffies_64_to_clock_t' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'jiffies64_to_nsecs' version gener=
ation failed, symbol will not be versioned.
Is 'jiffies64_to_nsecs' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'jiffies64_to_msecs' version gener=
ation failed, symbol will not be versioned.
Is 'jiffies64_to_msecs' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'nsecs_to_jiffies64' version gener=
ation failed, symbol will not be versioned.
Is 'nsecs_to_jiffies64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'nsecs_to_jiffies' version generat=
ion failed, symbol will not be versioned.
Is 'nsecs_to_jiffies' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'timespec64_add_safe' version gene=
ration failed, symbol will not be versioned.
Is 'timespec64_add_safe' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'get_timespec64' version generatio=
n failed, symbol will not be versioned.
Is 'get_timespec64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'put_timespec64' version generatio=
n failed, symbol will not be versioned.
Is 'put_timespec64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'get_old_timespec32' version gener=
ation failed, symbol will not be versioned.
Is 'get_old_timespec32' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'put_old_timespec32' version gener=
ation failed, symbol will not be versioned.
Is 'put_old_timespec32' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'get_itimerspec64' version generat=
ion failed, symbol will not be versioned.
Is 'get_itimerspec64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'put_itimerspec64' version generat=
ion failed, symbol will not be versioned.
Is 'put_itimerspec64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'get_old_itimerspec32' version gen=
eration failed, symbol will not be versioned.
Is 'get_old_itimerspec32' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'put_old_itimerspec32' version gen=
eration failed, symbol will not be versioned.
Is 'put_old_itimerspec32' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'jiffies_64' version generation=
 failed, symbol will not be versioned.
Is 'jiffies_64' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol '__round_jiffies_relative' vers=
ion generation failed, symbol will not be versioned.
Is '__round_jiffies_relative' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'round_jiffies' version generat=
ion failed, symbol will not be versioned.
Is 'round_jiffies' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'round_jiffies_relative' versio=
n generation failed, symbol will not be versioned.
Is 'round_jiffies_relative' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol '__round_jiffies_up_relative' v=
ersion generation failed, symbol will not be versioned.
Is '__round_jiffies_up_relative' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'round_jiffies_up' version gene=
ration failed, symbol will not be versioned.
Is 'round_jiffies_up' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'round_jiffies_up_relative' ver=
sion generation failed, symbol will not be versioned.
Is 'round_jiffies_up_relative' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'timer_init_key' version genera=
tion failed, symbol will not be versioned.
Is 'timer_init_key' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'mod_timer_pending' version gen=
eration failed, symbol will not be versioned.
Is 'mod_timer_pending' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'mod_timer' version generation =
failed, symbol will not be versioned.
Is 'mod_timer' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'timer_reduce' version generati=
on failed, symbol will not be versioned.
Is 'timer_reduce' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'add_timer' version generation =
failed, symbol will not be versioned.
Is 'add_timer' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'add_timer_local' version gener=
ation failed, symbol will not be versioned.
Is 'add_timer_local' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'add_timer_global' version gene=
ration failed, symbol will not be versioned.
Is 'add_timer_global' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'add_timer_on' version generati=
on failed, symbol will not be versioned.
Is 'add_timer_on' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'timer_delete' version generati=
on failed, symbol will not be versioned.
Is 'timer_delete' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'timer_shutdown' version genera=
tion failed, symbol will not be versioned.
Is 'timer_shutdown' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'timer_delete_sync_try' version=
 generation failed, symbol will not be versioned.
Is 'timer_delete_sync_try' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'timer_delete_sync' version gen=
eration failed, symbol will not be versioned.
Is 'timer_delete_sync' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'timer_shutdown_sync' version gene=
ration failed, symbol will not be versioned.
Is 'timer_shutdown_sync' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__ktime_divns' version generation=
 failed, symbol will not be versioned.
Is '__ktime_divns' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'ktime_add_safe' version generatio=
n failed, symbol will not be versioned.
Is 'ktime_add_safe' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_resolution' version gener=
ation failed, symbol will not be versioned.
Is 'hrtimer_resolution' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_update_function' version =
generation failed, symbol will not be versioned.
Is 'hrtimer_update_function' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_forward' version generati=
on failed, symbol will not be versioned.
Is 'hrtimer_forward' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_start_range_ns' version g=
eneration failed, symbol will not be versioned.
Is 'hrtimer_start_range_ns' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_start_range_ns_user' vers=
ion generation failed, symbol will not be versioned.
Is 'hrtimer_start_range_ns_user' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_try_to_cancel' version ge=
neration failed, symbol will not be versioned.
Is 'hrtimer_try_to_cancel' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_cancel' version generatio=
n failed, symbol will not be versioned.
Is 'hrtimer_cancel' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__hrtimer_get_remaining' version =
generation failed, symbol will not be versioned.
Is '__hrtimer_get_remaining' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_cb_get_time' version gene=
ration failed, symbol will not be versioned.
Is 'hrtimer_cb_get_time' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_setup' version generation=
 failed, symbol will not be versioned.
Is 'hrtimer_setup' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_setup_on_stack' version g=
eneration failed, symbol will not be versioned.
Is 'hrtimer_setup_on_stack' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_active' version generatio=
n failed, symbol will not be versioned.
Is 'hrtimer_active' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_sleeper_start_expires' ve=
rsion generation failed, symbol will not be versioned.
Is 'hrtimer_sleeper_start_expires' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'hrtimer_setup_sleeper_on_stack' v=
ersion generation failed, symbol will not be versioned.
Is 'hrtimer_setup_sleeper_on_stack' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'alarm_expires_remaining' version =
generation failed, symbol will not be versioned.
Is 'alarm_expires_remaining' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'alarm_init' version generation fa=
iled, symbol will not be versioned.
Is 'alarm_init' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'alarm_start_timer' version genera=
tion failed, symbol will not be versioned.
Is 'alarm_start_timer' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'alarm_try_to_cancel' version gene=
ration failed, symbol will not be versioned.
Is 'alarm_try_to_cancel' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'alarm_cancel' version generation =
failed, symbol will not be versioned.
Is 'alarm_cancel' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'alarm_forward' version generation=
 failed, symbol will not be versioned.
Is 'alarm_forward' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'alarm_forward_now' version genera=
tion failed, symbol will not be versioned.
Is 'alarm_forward_now' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'smp_call_function_single' version=
 generation failed, symbol will not be versioned.
Is 'smp_call_function_single' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'smp_call_function_single_async' v=
ersion generation failed, symbol will not be versioned.
Is 'smp_call_function_single_async' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'smp_call_function_any' version ge=
neration failed, symbol will not be versioned.
Is 'smp_call_function_any' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'smp_call_function_many' version g=
eneration failed, symbol will not be versioned.
Is 'smp_call_function_many' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'smp_call_function' version genera=
tion failed, symbol will not be versioned.
Is 'smp_call_function' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'setup_max_cpus' version generatio=
n failed, symbol will not be versioned.
Is 'setup_max_cpus' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'nr_cpu_ids' version generation fa=
iled, symbol will not be versioned.
Is 'nr_cpu_ids' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'on_each_cpu_cond_mask' version ge=
neration failed, symbol will not be versioned.
Is 'on_each_cpu_cond_mask' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kick_all_cpus_sync' version gener=
ation failed, symbol will not be versioned.
Is 'kick_all_cpus_sync' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'wake_up_all_idle_cpus' version ge=
neration failed, symbol will not be versioned.
Is 'wake_up_all_idle_cpus' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'smp_call_on_cpu' version generati=
on failed, symbol will not be versioned.
Is 'smp_call_on_cpu' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__put_user_ns' version generation=
 failed, symbol will not be versioned.
Is '__put_user_ns' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'make_kuid' version generation fai=
led, symbol will not be versioned.
Is 'make_kuid' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'from_kuid' version generation fai=
led, symbol will not be versioned.
Is 'from_kuid' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'from_kuid_munged' version generat=
ion failed, symbol will not be versioned.
Is 'from_kuid_munged' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'make_kgid' version generation fai=
led, symbol will not be versioned.
Is 'make_kgid' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'from_kgid' version generation fai=
led, symbol will not be versioned.
Is 'from_kgid' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'from_kgid_munged' version generat=
ion failed, symbol will not be versioned.
Is 'from_kgid_munged' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'make_kprojid' version generation =
failed, symbol will not be versioned.
Is 'make_kprojid' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'from_kprojid' version generation =
failed, symbol will not be versioned.
Is 'from_kprojid' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'from_kprojid_munged' version gene=
ration failed, symbol will not be versioned.
Is 'from_kprojid_munged' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'current_in_userns' version genera=
tion failed, symbol will not be versioned.
Is 'current_in_userns' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'audit_enabled' version generation=
 failed, symbol will not be versioned.
Is 'audit_enabled' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'audit_log_subj_ctx' version gener=
ation failed, symbol will not be versioned.
Is 'audit_log_subj_ctx' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'audit_log_task_context' version g=
eneration failed, symbol will not be versioned.
Is 'audit_log_task_context' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'audit_log_task_info' version gene=
ration failed, symbol will not be versioned.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

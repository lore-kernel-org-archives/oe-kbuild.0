Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649CC547077
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 04:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791952225; cv=none; b=OfvNdK3SBoqDb81FH8YoSvhFG6UiSlhsI8m43xAyrsXgkdnFaHLphNI0v30Xv5+0+RRXRfBchR/ZBvPvfFELmX4kFPG/pvJnuliSc3Cf4u3H7bhQR2C8TApwDEOYJa4CxAReC8n1DCL2PvgQO/mGG9zwXUQjhSlcqV0s7XgvRyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791952225; c=relaxed/simple;
	bh=pikPeOibDV7DX7s8Q2P9bTPNZlbt1iREr++/3BD9Nq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AIQw8Cd3XfHGAQlCPk+5K8BjPQZil/Q6uaPQFKxRvn/fLT/9lbJfLEUbNylMukMQRr/3evo0jHCPsCAx7UaddwXvCxbv+T2hD4I2yo0c2OY/+INCz/pQBxFBOCdMr8+wok3sRyOL3Vqhyr3EDMn7138Lk4PFF1wkjDaRaaDULuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VA3Nv/aM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VA3Nv/aM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791952223; x=1823488223;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pikPeOibDV7DX7s8Q2P9bTPNZlbt1iREr++/3BD9Nq0=;
  b=VA3Nv/aMSMF95IkWw5ypdKhTtW4u+h8O4xnBvXDEym57Fw9mSveijYfI
   b+xbXiXysuBVXUEPkwBHQiuw8BciqbvjR/30m7ODTG7AA6wpV9wf/BmhN
   ezC2FAmaTQ7oFt6KqZ3mXED/1wbiZ3jcTnYAeTYg6tyZNjDpJRuAYQrx8
   kDGME2O8/hBZtIy1wVYOMyNb64Q6a7OLmdLKgJoSTR/NQ+Ol9uckkQOE5
   XOIhPUbAec3Pq/MB6sVHTUdQpKOanLMJTr6lbAnFwz9RLoTx71yxmEOmB
   oRBpngj/0unT8l5rlInVWdZkflujjYvwI6tb7VNklYFhz7NUQBuSb+3R6
   g==;
X-CSE-ConnectionGUID: mhWnMyNVTRCh14ClwxKU8Q==
X-CSE-MsgGUID: xkxL3rkzSXmGhvi1uB1dcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="573767"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="573767"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 21:30:23 -0700
X-CSE-ConnectionGUID: pLnPBLP0Q+q+3WOpdbIEdg==
X-CSE-MsgGUID: XJyt14e2T3a4SzATIeXMWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1269322"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Oct 2026 21:30:22 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGqd9-00000000ArL-2v1L;
	Wed, 14 Oct 2026 04:30:19 +0000
Date: Wed, 14 Oct 2026 06:29:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-error-propagation 3/3] WARNING:
 modpost: vmlinux: EXPORT symbol 'get_ibs_caps' version generation failed,
 symbol will not be versioned.
Message-ID: <202610140618.Jag93D4y-lkp@intel.com>
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
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/202=
61014/202610140618.Jag93D4y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261014/202610140618.Jag93D4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610140618.Jag93D4y-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: EXPORT symbol 'asm_load_gs_index' version genera=
tion failed, symbol will not be versioned.
Is 'asm_load_gs_index' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'get_ibs_caps' version generati=
on failed, symbol will not be versioned.
Is 'get_ibs_caps' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__SCT__WARN_trap' version generat=
ion failed, symbol will not be versioned.
Is '__SCT__WARN_trap' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'irq_stat' version generation fail=
ed, symbol will not be versioned.
Is 'irq_stat' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol '__softirq_pending' version gen=
eration failed, symbol will not be versioned.
Is '__softirq_pending' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'alternatives_patched' version gen=
eration failed, symbol will not be versioned.
Is 'alternatives_patched' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'nop_func' version generation fail=
ed, symbol will not be versioned.
Is 'nop_func' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'BUG_func' version generation fail=
ed, symbol will not be versioned.
Is 'BUG_func' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_tss_rw' version generation fa=
iled, symbol will not be versioned.
Is 'cpu_tss_rw' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__tss_limit_invalid' version gene=
ration failed, symbol will not be versioned.
Is '__tss_limit_invalid' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'boot_option_idle_override' versio=
n generation failed, symbol will not be versioned.
Is 'boot_option_idle_override' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'arch_cpu_idle' version generation=
 failed, symbol will not be versioned.
Is 'arch_cpu_idle' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'x86_spec_ctrl_current' version=
 generation failed, symbol will not be versioned.
Is 'x86_spec_ctrl_current' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'x86_ibpb_exit_to_user' version=
 generation failed, symbol will not be versioned.
Is 'x86_ibpb_exit_to_user' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'spec_ctrl_current' version gen=
eration failed, symbol will not be versioned.
Is 'spec_ctrl_current' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'cpu_buf_idle_clear' version ge=
neration failed, symbol will not be versioned.
Is 'cpu_buf_idle_clear' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'smp_ops' version generation fa=
iled, symbol will not be versioned.
Is 'smp_ops' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'arch_cpu_rescan_dead_smt_sibli=
ngs' version generation failed, symbol will not be versioned.
Is 'arch_cpu_rescan_dead_smt_siblings' prototyped in <asm/asm-prototypes.h>?
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
>> WARNING: modpost: vmlinux: EXPORT symbol 'boot_cpu_physical_apicid' vers=
ion generation failed, symbol will not be versioned.
Is 'boot_cpu_physical_apicid' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'local_apic_timer_c2_ok' versio=
n generation failed, symbol will not be versioned.
Is 'local_apic_timer_c2_ok' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'setup_APIC_eilvt' version gene=
ration failed, symbol will not be versioned.
Is 'setup_APIC_eilvt' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'x2apic_mode' version generatio=
n failed, symbol will not be versioned.
Is 'x2apic_mode' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'IO_APIC_get_PCI_irq_vector' ve=
rsion generation failed, symbol will not be versioned.
Is 'IO_APIC_get_PCI_irq_vector' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'is_hpet_enabled' version generati=
on failed, symbol will not be versioned.
Is 'is_hpet_enabled' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'kvm_para_available' version ge=
neration failed, symbol will not be versioned.
Is 'kvm_para_available' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'kvm_arch_para_hints' version g=
eneration failed, symbol will not be versioned.
Is 'kvm_arch_para_hints' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'arch_haltpoll_enable' version =
generation failed, symbol will not be versioned.
Is 'arch_haltpoll_enable' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'arch_haltpoll_disable' version=
 generation failed, symbol will not be versioned.
Is 'arch_haltpoll_disable' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'unwind_get_return_address' ver=
sion generation failed, symbol will not be versioned.
Is 'unwind_get_return_address' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'unwind_next_frame' version gen=
eration failed, symbol will not be versioned.
Is 'unwind_next_frame' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol '__unwind_start' version genera=
tion failed, symbol will not be versioned.
Is '__unwind_start' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cachemode2protval' version genera=
tion failed, symbol will not be versioned.
Is 'cachemode2protval' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__supported_pte_mask' version gen=
eration failed, symbol will not be versioned.
Is '__supported_pte_mask' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__default_kernel_pte_mask' versio=
n generation failed, symbol will not be versioned.
Is '__default_kernel_pte_mask' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'leave_mm' version generation fail=
ed, symbol will not be versioned.
Is 'leave_mm' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_tlbstate_shared' version gene=
ration failed, symbol will not be versioned.
Is 'cpu_tlbstate_shared' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'clflush_cache_range' version gene=
ration failed, symbol will not be versioned.
Is 'clflush_cache_range' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'arch_invalidate_pmem' version gen=
eration failed, symbol will not be versioned.
Is 'arch_invalidate_pmem' prototyped in <asm/asm-prototypes.h>?
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
WARNING: modpost: vmlinux: EXPORT symbol 'set_mce_nospec' version generatio=
n failed, symbol will not be versioned.
Is 'set_mce_nospec' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'clear_mce_nospec' version generat=
ion failed, symbol will not be versioned.
Is 'clear_mce_nospec' prototyped in <asm/asm-prototypes.h>?
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
WARNING: modpost: vmlinux: EXPORT symbol 'pat_enabled' version generation f=
ailed, symbol will not be versioned.
Is 'pat_enabled' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'arch_io_reserve_memtype_wc' versi=
on generation failed, symbol will not be versioned.
Is 'arch_io_reserve_memtype_wc' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'arch_io_free_memtype_wc' version =
generation failed, symbol will not be versioned.
Is 'arch_io_free_memtype_wc' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'pgprot_writecombine' version gene=
ration failed, symbol will not be versioned.
Is 'pgprot_writecombine' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'pgprot_writethrough' version gene=
ration failed, symbol will not be versioned.
Is 'pgprot_writethrough' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'lockdep_tasklist_lock_is_held' ve=
rsion generation failed, symbol will not be versioned.
Is 'lockdep_tasklist_lock_is_held' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'free_task' version generation fai=
led, symbol will not be versioned.
Is 'free_task' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__mmdrop' version generation fail=
ed, symbol will not be versioned.
Is '__mmdrop' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__put_task_struct' version genera=
tion failed, symbol will not be versioned.
Is '__put_task_struct' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__put_task_struct_rcu_cb' version=
 generation failed, symbol will not be versioned.
Is '__put_task_struct_rcu_cb' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mmput' version generation failed,=
 symbol will not be versioned.
Is 'mmput' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mmput_async' version generation f=
ailed, symbol will not be versioned.
Is 'mmput_async' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'get_task_mm' version generation f=
ailed, symbol will not be versioned.
Is 'get_task_mm' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpuhp_tasks_frozen' version gener=
ation failed, symbol will not be versioned.
Is 'cpuhp_tasks_frozen' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpus_read_lock' version generatio=
n failed, symbol will not be versioned.
Is 'cpus_read_lock' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpus_read_trylock' version genera=
tion failed, symbol will not be versioned.
Is 'cpus_read_trylock' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpus_read_unlock' version generat=
ion failed, symbol will not be versioned.
Is 'cpus_read_unlock' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'lockdep_assert_cpus_held' version=
 generation failed, symbol will not be versioned.
Is 'lockdep_assert_cpus_held' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_hotplug_disable' version gene=
ration failed, symbol will not be versioned.
Is 'cpu_hotplug_disable' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_hotplug_enable' version gener=
ation failed, symbol will not be versioned.
Is 'cpu_hotplug_enable' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cpu_smt_possible' version generat=
ion failed, symbol will not be versioned.
Is 'cpu_smt_possible' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'remove_cpu' version generation fa=
iled, symbol will not be versioned.
Is 'remove_cpu' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'add_cpu' version generation faile=
d, symbol will not be versioned.
Is 'add_cpu' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__cpuhp_state_add_instance' versi=
on generation failed, symbol will not be versioned.
Is '__cpuhp_state_add_instance' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__cpuhp_setup_state_cpuslocked' v=
ersion generation failed, symbol will not be versioned.
Is '__cpuhp_setup_state_cpuslocked' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__cpuhp_setup_state' version gene=
ration failed, symbol will not be versioned.
Is '__cpuhp_setup_state' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__cpuhp_state_remove_instance' ve=
rsion generation failed, symbol will not be versioned.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

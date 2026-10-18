Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A23932C8
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339738; cv=none; b=VE7AkHxr8CJ99QrcJriYv4tiwMKZLcWNvSF+2NK9xzhnARX9xjqVhY71hEF9MCC9/+DS/4G+7O3OL8HBihg1ArudMYO2xRvvJYvUfLep3mc+dZNg3NFuEB3ov7IaX6IUWU+JGHg1THIMbb2Y4+vqvG+diRIUuWpMj+Uo3HD32Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339738; c=relaxed/simple;
	bh=vBv60RMhHGSqFNa1CNAapwLD1kko3aSasX+jrXpVr+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=No0ntvKG1Pph+VuxiqENVL6S/PiXJFvv6aK7wq8uoyvBP5pFPatmJjrsUiED1Avp3X/N8M0ttMvENeBQP4NZDkZyNkVHQJ35XBfdUcv4XgR8P0vbWz3x9nYuqT0/MMcFdsWY72VkunvVpd4JugJRlgYi91m0Oj2EI4MIULL2Xck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjKLi96u; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjKLi96u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792339733; x=1823875733;
  h=date:from:to:cc:subject:message-id;
  bh=vBv60RMhHGSqFNa1CNAapwLD1kko3aSasX+jrXpVr+8=;
  b=NjKLi96uTTtak+T02ka6MqBYUWzJ+WXOKXBqUoQK5Nfb56srCc64u8xF
   NvPGsPRp0+aM4Tx1dZ7ilu9jyRIbr7+gOIRlXQ8LK7PJHapZPKjyJWE5F
   skLrloa/JfQ1ByJSAtMGSrUAs3Jiqh8cnlcw9wMcWZ0ZfeGrWKpX/BSoU
   5JBsEjyiGkVo2XC989axkB+6+wMvnAsMaURKvIVl3QpK402zTMCaAFhCC
   iL9tX6e8EbY8KT9vdnGsb6w4Xfe3eWQY3QKE2w6J6iWg4JVVTLSwUFQjA
   hi/XOT3PpQeVtZiS54mPssmwje6eKBU/uMDwcJQb4kS2YPGn0snMH1t5B
   Q==;
X-CSE-ConnectionGUID: dbJKdv28TtiXVOauwZ+0OQ==
X-CSE-MsgGUID: Pevh1CyFS26pEtY3iYFq3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="920950"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="920950"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 09:08:52 -0700
X-CSE-ConnectionGUID: tl7ETPcfQOayO9BS03dbHg==
X-CSE-MsgGUID: mXAGaVxtQYCGTaEHFVDRKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="4133801"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 18 Oct 2026 09:08:39 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xITR7-000000005AN-25VG;
	Sun, 18 Oct 2026 16:08:37 +0000
Date: Sun, 18 Oct 2026 18:08:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 18009/18293]
 drivers/firmware/efi/runtime-wrappers.c:349 efi_call_rts() warn: statement
 has no effect '__auto_type'
Message-ID: <202610181803.TgvEsRZl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
commit: 002a3f5757e07edd7fbef243d823b565624bc5fb [18009/18293] lkdtm: Add more EFI runtime tests
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-2200-20261017 (https://download.01.org/0day-ci/archive/20261018/202610181803.TgvEsRZl-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610181803.TgvEsRZl-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/runtime-wrappers.c:349 efi_call_rts() warn: statement has no effect '__auto_type'
drivers/firmware/efi/runtime-wrappers.c:358 efi_call_rts() warn: statement has no effect 'struct'
drivers/firmware/efi/runtime-wrappers.c:358 efi_call_rts() warn: inconsistent indenting
drivers/firmware/efi/runtime-wrappers.c:665 (null)() warn: inconsistent indenting

vim +/__auto_type +349 drivers/firmware/efi/runtime-wrappers.c

ecbccdbdab5d31 Breno Leitao   2026-06-16  240  
3eb420e70d879c Sai Praneeth   2018-07-11  241  /*
3eb420e70d879c Sai Praneeth   2018-07-11  242   * Calls the appropriate efi_runtime_service() with the appropriate
3eb420e70d879c Sai Praneeth   2018-07-11  243   * arguments.
3eb420e70d879c Sai Praneeth   2018-07-11  244   */
99280413a5b785 Ard Biesheuvel 2024-06-04  245  static void __nocfi efi_call_rts(struct work_struct *work)
3eb420e70d879c Sai Praneeth   2018-07-11  246  {
c7c7bce093c883 Ard Biesheuvel 2023-07-02  247  	const union efi_rts_args *args = efi_rts_work.args;
3eb420e70d879c Sai Praneeth   2018-07-11  248  	efi_status_t status = EFI_NOT_FOUND;
3c17ae4161093f Ard Biesheuvel 2023-08-08  249  	unsigned long flags;
3c17ae4161093f Ard Biesheuvel 2023-08-08  250  
60618389de9244 Breno Leitao   2026-06-16  251  	if (!efi_enabled(EFI_RUNTIME_SERVICES))
60618389de9244 Breno Leitao   2026-06-16  252  		efi_rts_park_worker();
60618389de9244 Breno Leitao   2026-06-16  253  
a2860501203cf7 Ard Biesheuvel 2025-10-15  254  	efi_runtime_lock_owner = current;
a2860501203cf7 Ard Biesheuvel 2025-10-15  255  
3c17ae4161093f Ard Biesheuvel 2023-08-08  256  	arch_efi_call_virt_setup();
3c17ae4161093f Ard Biesheuvel 2023-08-08  257  	flags = efi_call_virt_save_flags();
3eb420e70d879c Sai Praneeth   2018-07-11  258  
9dbbedaa617124 Sai Praneeth   2018-09-11  259  	switch (efi_rts_work.efi_rts_id) {
5c418dc789a389 Anders Roxell  2019-02-15  260  	case EFI_GET_TIME:
c7c7bce093c883 Ard Biesheuvel 2023-07-02  261  		status = efi_call_virt(get_time,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  262  				       args->GET_TIME.time,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  263  				       args->GET_TIME.capabilities);
3eb420e70d879c Sai Praneeth   2018-07-11  264  		break;
5c418dc789a389 Anders Roxell  2019-02-15  265  	case EFI_SET_TIME:
c7c7bce093c883 Ard Biesheuvel 2023-07-02  266  		status = efi_call_virt(set_time,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  267  				       args->SET_TIME.time);
3eb420e70d879c Sai Praneeth   2018-07-11  268  		break;
5c418dc789a389 Anders Roxell  2019-02-15  269  	case EFI_GET_WAKEUP_TIME:
c7c7bce093c883 Ard Biesheuvel 2023-07-02  270  		status = efi_call_virt(get_wakeup_time,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  271  				       args->GET_WAKEUP_TIME.enabled,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  272  				       args->GET_WAKEUP_TIME.pending,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  273  				       args->GET_WAKEUP_TIME.time);
3eb420e70d879c Sai Praneeth   2018-07-11  274  		break;
5c418dc789a389 Anders Roxell  2019-02-15  275  	case EFI_SET_WAKEUP_TIME:
c7c7bce093c883 Ard Biesheuvel 2023-07-02  276  		status = efi_call_virt(set_wakeup_time,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  277  				       args->SET_WAKEUP_TIME.enable,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  278  				       args->SET_WAKEUP_TIME.time);
3eb420e70d879c Sai Praneeth   2018-07-11  279  		break;
5c418dc789a389 Anders Roxell  2019-02-15  280  	case EFI_GET_VARIABLE:
c7c7bce093c883 Ard Biesheuvel 2023-07-02  281  		status = efi_call_virt(get_variable,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  282  				       args->GET_VARIABLE.name,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  283  				       args->GET_VARIABLE.vendor,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  284  				       args->GET_VARIABLE.attr,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  285  				       args->GET_VARIABLE.data_size,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  286  				       args->GET_VARIABLE.data);
3eb420e70d879c Sai Praneeth   2018-07-11  287  		break;
5c418dc789a389 Anders Roxell  2019-02-15  288  	case EFI_GET_NEXT_VARIABLE:
c7c7bce093c883 Ard Biesheuvel 2023-07-02  289  		status = efi_call_virt(get_next_variable,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  290  				       args->GET_NEXT_VARIABLE.name_size,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  291  				       args->GET_NEXT_VARIABLE.name,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  292  				       args->GET_NEXT_VARIABLE.vendor);
3eb420e70d879c Sai Praneeth   2018-07-11  293  		break;
5c418dc789a389 Anders Roxell  2019-02-15  294  	case EFI_SET_VARIABLE:
c7c7bce093c883 Ard Biesheuvel 2023-07-02  295  		status = efi_call_virt(set_variable,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  296  				       args->SET_VARIABLE.name,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  297  				       args->SET_VARIABLE.vendor,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  298  				       args->SET_VARIABLE.attr,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  299  				       args->SET_VARIABLE.data_size,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  300  				       args->SET_VARIABLE.data);
3eb420e70d879c Sai Praneeth   2018-07-11  301  		break;
5c418dc789a389 Anders Roxell  2019-02-15  302  	case EFI_QUERY_VARIABLE_INFO:
c7c7bce093c883 Ard Biesheuvel 2023-07-02  303  		status = efi_call_virt(query_variable_info,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  304  				       args->QUERY_VARIABLE_INFO.attr,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  305  				       args->QUERY_VARIABLE_INFO.storage_space,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  306  				       args->QUERY_VARIABLE_INFO.remaining_space,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  307  				       args->QUERY_VARIABLE_INFO.max_variable_size);
3eb420e70d879c Sai Praneeth   2018-07-11  308  		break;
5c418dc789a389 Anders Roxell  2019-02-15  309  	case EFI_GET_NEXT_HIGH_MONO_COUNT:
c7c7bce093c883 Ard Biesheuvel 2023-07-02  310  		status = efi_call_virt(get_next_high_mono_count,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  311  				       args->GET_NEXT_HIGH_MONO_COUNT.high_count);
3eb420e70d879c Sai Praneeth   2018-07-11  312  		break;
5c418dc789a389 Anders Roxell  2019-02-15  313  	case EFI_UPDATE_CAPSULE:
3eb420e70d879c Sai Praneeth   2018-07-11  314  		status = efi_call_virt(update_capsule,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  315  				       args->UPDATE_CAPSULE.capsules,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  316  				       args->UPDATE_CAPSULE.count,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  317  				       args->UPDATE_CAPSULE.sg_list);
3eb420e70d879c Sai Praneeth   2018-07-11  318  		break;
5c418dc789a389 Anders Roxell  2019-02-15  319  	case EFI_QUERY_CAPSULE_CAPS:
3eb420e70d879c Sai Praneeth   2018-07-11  320  		status = efi_call_virt(query_capsule_caps,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  321  				       args->QUERY_CAPSULE_CAPS.capsules,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  322  				       args->QUERY_CAPSULE_CAPS.count,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  323  				       args->QUERY_CAPSULE_CAPS.max_size,
c7c7bce093c883 Ard Biesheuvel 2023-07-02  324  				       args->QUERY_CAPSULE_CAPS.reset_type);
3eb420e70d879c Sai Praneeth   2018-07-11  325  		break;
5894cf571e14fb Ard Biesheuvel 2023-07-02  326  	case EFI_ACPI_PRM_HANDLER:
5894cf571e14fb Ard Biesheuvel 2023-07-02  327  #ifdef CONFIG_ACPI_PRMT
5894cf571e14fb Ard Biesheuvel 2023-07-02  328  		status = arch_efi_call_virt(args, ACPI_PRM_HANDLER.acpi_prm_handler,
5894cf571e14fb Ard Biesheuvel 2023-07-02  329  					    args->ACPI_PRM_HANDLER.param_buffer_addr,
5894cf571e14fb Ard Biesheuvel 2023-07-02  330  					    args->ACPI_PRM_HANDLER.context);
5894cf571e14fb Ard Biesheuvel 2023-07-02  331  		break;
5894cf571e14fb Ard Biesheuvel 2023-07-02  332  #endif
3eb420e70d879c Sai Praneeth   2018-07-11  333  	default:
3eb420e70d879c Sai Praneeth   2018-07-11  334  		/*
3eb420e70d879c Sai Praneeth   2018-07-11  335  		 * Ideally, we should never reach here because a caller of this
3eb420e70d879c Sai Praneeth   2018-07-11  336  		 * function should have put the right efi_runtime_service()
3eb420e70d879c Sai Praneeth   2018-07-11  337  		 * function identifier into efi_rts_work->efi_rts_id
3eb420e70d879c Sai Praneeth   2018-07-11  338  		 */
3eb420e70d879c Sai Praneeth   2018-07-11  339  		pr_err("Requested executing invalid EFI Runtime Service.\n");
002a3f5757e07e Ard Biesheuvel 2026-10-11  340  		break;
002a3f5757e07e Ard Biesheuvel 2026-10-11  341  
002a3f5757e07e Ard Biesheuvel 2026-10-11  342  #if IS_ENABLED(CONFIG_LKDTM)
002a3f5757e07e Ard Biesheuvel 2026-10-11  343  	case EFI_LKDTM_RUNTIME_RO_TEST:
002a3f5757e07e Ard Biesheuvel 2026-10-11  344  		/*
002a3f5757e07e Ard Biesheuvel 2026-10-11  345  		 * Call GetTime() with the output argument pointing to
002a3f5757e07e Ard Biesheuvel 2026-10-11  346  		 * executable memory, which should be mapped read-only in the
002a3f5757e07e Ard Biesheuvel 2026-10-11  347  		 * EFI page tables.
002a3f5757e07e Ard Biesheuvel 2026-10-11  348  		 */
002a3f5757e07e Ard Biesheuvel 2026-10-11 @349  		auto t = (efi_time_t *)efi.runtime->set_virtual_address_map;
002a3f5757e07e Ard Biesheuvel 2026-10-11  350  
002a3f5757e07e Ard Biesheuvel 2026-10-11  351  		status = efi_call_virt(get_time, t, NULL);
002a3f5757e07e Ard Biesheuvel 2026-10-11  352  		break;
002a3f5757e07e Ard Biesheuvel 2026-10-11  353  	case EFI_LKDTM_RUNTIME_NX_TEST:
002a3f5757e07e Ard Biesheuvel 2026-10-11  354  		/*
002a3f5757e07e Ard Biesheuvel 2026-10-11  355  		 * Call efi.runtime, which points to a data object in a EFI
002a3f5757e07e Ard Biesheuvel 2026-10-11  356  		 * runtime region, as if it were a function pointer.
002a3f5757e07e Ard Biesheuvel 2026-10-11  357  		 */
002a3f5757e07e Ard Biesheuvel 2026-10-11 @358  		struct { efi_status_t (__efiapi *fn)(int); } s = { (void *)efi.runtime };
002a3f5757e07e Ard Biesheuvel 2026-10-11  359  
002a3f5757e07e Ard Biesheuvel 2026-10-11  360  		status = arch_efi_call_virt((&s), fn, 0);
002a3f5757e07e Ard Biesheuvel 2026-10-11  361  		break;
002a3f5757e07e Ard Biesheuvel 2026-10-11  362  #endif
3eb420e70d879c Sai Praneeth   2018-07-11  363  	}
3c17ae4161093f Ard Biesheuvel 2023-08-08  364  
3c17ae4161093f Ard Biesheuvel 2023-08-08  365  	efi_call_virt_check_flags(flags, efi_rts_work.caller);
3c17ae4161093f Ard Biesheuvel 2023-08-08  366  	arch_efi_call_virt_teardown();
3c17ae4161093f Ard Biesheuvel 2023-08-08  367  
b49be1e7478afd Ard Biesheuvel 2026-10-09  368  	/*
b49be1e7478afd Ard Biesheuvel 2026-10-09  369  	 * EFI runtime services may also have been disabled because the
b49be1e7478afd Ard Biesheuvel 2026-10-09  370  	 * firmware faulted, but the caller is still waiting for us in that
b49be1e7478afd Ard Biesheuvel 2026-10-09  371  	 * case. Only park the worker if the caller has given up on it.
b49be1e7478afd Ard Biesheuvel 2026-10-09  372  	 */
b49be1e7478afd Ard Biesheuvel 2026-10-09  373  	if (READ_ONCE(efi_rts_abandoned))
4b2c033b5bc971 Breno Leitao   2026-06-16  374  		efi_rts_park_worker();
4b2c033b5bc971 Breno Leitao   2026-06-16  375  
9dbbedaa617124 Sai Praneeth   2018-09-11  376  	efi_rts_work.status = status;
9dbbedaa617124 Sai Praneeth   2018-09-11  377  	complete(&efi_rts_work.efi_rts_comp);
a2860501203cf7 Ard Biesheuvel 2025-10-15  378  	efi_runtime_lock_owner = NULL;
3eb420e70d879c Sai Praneeth   2018-07-11  379  }
3eb420e70d879c Sai Praneeth   2018-07-11  380  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

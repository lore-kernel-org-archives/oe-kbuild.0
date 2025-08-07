Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C363B239099
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 07:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754551655; cv=none; b=r9yvrg5iC8MUa0NlwoCO7su7AE6BqMir7FrvLZE9rEVJUxxE/lpkP6NkkBsqRQTRFvHPvHwWR9xU4S8NCMuSI2Kq9dQE8T7y3oGwSH+TDQMALtxHgrfn07708oyXuW/M3klCzKVVC8cAiozFypHGkAGaBwZtJuhdd+50rLvszV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754551655; c=relaxed/simple;
	bh=KTA0qojTBE75XPdOja3cD/H2g4FMgSeEHz4eszeGKvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y6fmYJU+i7S1lQP1lHsXsUGokW06tDRzDVI13d7Ahe5ZYWciWU2eygCyBEjhsqyxblfO+M0fE2TBknpD+pZ5/UbZix9cwd0ASHSIm8jESQOXKMtz9nPhKaMQfdLW6jkL6YCINkfsN1oVOJI+azSw9dg+hNClbgFeYFJBDbec1Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvHxc9Ub; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvHxc9Ub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754551654; x=1786087654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTA0qojTBE75XPdOja3cD/H2g4FMgSeEHz4eszeGKvk=;
  b=jvHxc9UbQ6kJc6LN4rbGbXjq9d6WWLGGE7CLdBcOMJIhGIMBTYeKdELi
   zcoPGHOz/arDslsGJgxxhde9EZcF5r25y+aC0XSH9H6dfqcChOix+OtAa
   5oBk7QNmXVVdUKGbatip+Ctuhg+llJEYTzV+Amj5YNLChjNzqVGZhOnib
   puME6ogf9N78z87LTzKiM+1I80Rw19LzgfMD1z91i/UQSbD8NkQheGZos
   dSsEnaGjkWQ3xxf/afkJUu6qnsa/zKtyNoCd90X6RCnN5P0Yrly1q/p6y
   VyzKABt4v3F1B1o0czu9m/fAcb3vAxwTuPvGZo+aLsQMArM5NOBhgIGx+
   w==;
X-CSE-ConnectionGUID: LuiincqmRbijfK+dIBffEg==
X-CSE-MsgGUID: PmT+9GpKQEaVycWmrF4+ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56794879"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56794879"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 00:27:33 -0700
X-CSE-ConnectionGUID: iBvrQispQU6MSJAzkWPjog==
X-CSE-MsgGUID: 3K42tA5DTGKvwG9Fu3hmHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169448599"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2025 00:27:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujv0L-0002VG-1c;
	Thu, 07 Aug 2025 07:26:45 +0000
Date: Thu, 7 Aug 2025 15:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 23/34] arch/x86/platform/efi/efi_64.c:648
 efi_thunk_set_variable_nonblocking() error: uninitialized symbol 'flags'.
Message-ID: <202508071541.vNirQQSm-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   4402c229e926bc7daad98d65e55297b090302dac
commit: 90b4bcaa42371dbea1578cde5ac0a12bd9f68d35 [23/34] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-161-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071541.vNirQQSm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508071541.vNirQQSm-lkp@intel.com/

New smatch warnings:
arch/x86/platform/efi/efi_64.c:648 efi_thunk_set_variable_nonblocking() error: uninitialized symbol 'flags'.
arch/x86/platform/efi/efi_64.c:766 efi_thunk_query_variable_info_nonblocking() error: uninitialized symbol 'flags'.
drivers/net/ethernet/neterion/s2io.c:3053 tx_intr_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/net/ethernet/neterion/s2io.c:857 init_shared_mem() error: uninitialized symbol 'tmp_p_addr'.
drivers/net/ethernet/neterion/s2io.c:3073 tx_intr_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/neterion/s2io.c:6800 set_rxd_buffer_pointer() warn: missing unwind goto?

vim +/flags +648 arch/x86/platform/efi/efi_64.c

83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  621  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  622  static efi_status_t
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  623  efi_thunk_set_variable_nonblocking(efi_char16_t *name, efi_guid_t *vendor,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  624  				   u32 attr, unsigned long data_size,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  625  				   void *data)
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  626  {
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  627  	u8 buf[24] __aligned(8);
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  628  	efi_guid_t *vnd = PTR_ALIGN((efi_guid_t *)buf, sizeof(*vnd));
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  629  	u32 phys_name, phys_vendor, phys_data;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  630  	efi_status_t status;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  631  	unsigned long flags;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  632  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  633  	if (!spin_trylock_irqsave(&efi_runtime_lock, flags))
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  634  		return EFI_NOT_READY;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  635  
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  636  	*vnd = *vendor;
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  637  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  638  	phys_name = virt_to_phys_or_null_size(name, efi_name_size(name));
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  639  	phys_vendor = virt_to_phys_or_null(vnd);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  640  	phys_data = virt_to_phys_or_null_size(data, data_size);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  641  
a4b81ccfd4caba Gary Lin       2020-04-09  642  	if (!phys_name || (data && !phys_data))
8319e9d5ad98ff Ard Biesheuvel 2020-02-21  643  		status = EFI_INVALID_PARAMETER;
8319e9d5ad98ff Ard Biesheuvel 2020-02-21  644  	else
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  645  		status = efi_thunk(set_variable, phys_name, phys_vendor,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  646  				   attr, data_size, phys_data);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  647  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20 @648  	spin_unlock_irqrestore(&efi_runtime_lock, flags);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  649  
4f9dbcfc40299d Matt Fleming   2014-01-10  650  	return status;
4f9dbcfc40299d Matt Fleming   2014-01-10  651  }
4f9dbcfc40299d Matt Fleming   2014-01-10  652  
4f9dbcfc40299d Matt Fleming   2014-01-10  653  static efi_status_t
4f9dbcfc40299d Matt Fleming   2014-01-10  654  efi_thunk_get_next_variable(unsigned long *name_size,
4f9dbcfc40299d Matt Fleming   2014-01-10  655  			    efi_char16_t *name,
4f9dbcfc40299d Matt Fleming   2014-01-10  656  			    efi_guid_t *vendor)
4f9dbcfc40299d Matt Fleming   2014-01-10  657  {
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  658  	u8 buf[24] __aligned(8);
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  659  	efi_guid_t *vnd = PTR_ALIGN((efi_guid_t *)buf, sizeof(*vnd));
4f9dbcfc40299d Matt Fleming   2014-01-10  660  	efi_status_t status;
4f9dbcfc40299d Matt Fleming   2014-01-10  661  	u32 phys_name_size, phys_name, phys_vendor;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  662  	unsigned long flags;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  663  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  664  	spin_lock_irqsave(&efi_runtime_lock, flags);
4f9dbcfc40299d Matt Fleming   2014-01-10  665  
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  666  	*vnd = *vendor;
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  667  
f6697df36bdf0b Matt Fleming   2016-11-12  668  	phys_name_size = virt_to_phys_or_null(name_size);
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  669  	phys_vendor = virt_to_phys_or_null(vnd);
f6697df36bdf0b Matt Fleming   2016-11-12  670  	phys_name = virt_to_phys_or_null_size(name, *name_size);
4f9dbcfc40299d Matt Fleming   2014-01-10  671  
8319e9d5ad98ff Ard Biesheuvel 2020-02-21  672  	if (!phys_name)
8319e9d5ad98ff Ard Biesheuvel 2020-02-21  673  		status = EFI_INVALID_PARAMETER;
8319e9d5ad98ff Ard Biesheuvel 2020-02-21  674  	else
4f9dbcfc40299d Matt Fleming   2014-01-10  675  		status = efi_thunk(get_next_variable, phys_name_size,
4f9dbcfc40299d Matt Fleming   2014-01-10  676  				   phys_name, phys_vendor);
4f9dbcfc40299d Matt Fleming   2014-01-10  677  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  678  	spin_unlock_irqrestore(&efi_runtime_lock, flags);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  679  
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  680  	*vendor = *vnd;
4f9dbcfc40299d Matt Fleming   2014-01-10  681  	return status;
4f9dbcfc40299d Matt Fleming   2014-01-10  682  }
4f9dbcfc40299d Matt Fleming   2014-01-10  683  
4f9dbcfc40299d Matt Fleming   2014-01-10  684  static efi_status_t
4f9dbcfc40299d Matt Fleming   2014-01-10  685  efi_thunk_get_next_high_mono_count(u32 *count)
4f9dbcfc40299d Matt Fleming   2014-01-10  686  {
f80c9f6476db6c Ard Biesheuvel 2020-02-21  687  	return EFI_UNSUPPORTED;
4f9dbcfc40299d Matt Fleming   2014-01-10  688  }
4f9dbcfc40299d Matt Fleming   2014-01-10  689  
4f9dbcfc40299d Matt Fleming   2014-01-10  690  static void
4f9dbcfc40299d Matt Fleming   2014-01-10  691  efi_thunk_reset_system(int reset_type, efi_status_t status,
4f9dbcfc40299d Matt Fleming   2014-01-10  692  		       unsigned long data_size, efi_char16_t *data)
4f9dbcfc40299d Matt Fleming   2014-01-10  693  {
4f9dbcfc40299d Matt Fleming   2014-01-10  694  	u32 phys_data;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  695  	unsigned long flags;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  696  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  697  	spin_lock_irqsave(&efi_runtime_lock, flags);
4f9dbcfc40299d Matt Fleming   2014-01-10  698  
f6697df36bdf0b Matt Fleming   2016-11-12  699  	phys_data = virt_to_phys_or_null_size(data, data_size);
4f9dbcfc40299d Matt Fleming   2014-01-10  700  
4f9dbcfc40299d Matt Fleming   2014-01-10  701  	efi_thunk(reset_system, reset_type, status, data_size, phys_data);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  702  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  703  	spin_unlock_irqrestore(&efi_runtime_lock, flags);
4f9dbcfc40299d Matt Fleming   2014-01-10  704  }
4f9dbcfc40299d Matt Fleming   2014-01-10  705  
4f9dbcfc40299d Matt Fleming   2014-01-10  706  static efi_status_t
4f9dbcfc40299d Matt Fleming   2014-01-10  707  efi_thunk_update_capsule(efi_capsule_header_t **capsules,
4f9dbcfc40299d Matt Fleming   2014-01-10  708  			 unsigned long count, unsigned long sg_list)
4f9dbcfc40299d Matt Fleming   2014-01-10  709  {
4f9dbcfc40299d Matt Fleming   2014-01-10  710  	/*
4f9dbcfc40299d Matt Fleming   2014-01-10  711  	 * To properly support this function we would need to repackage
4f9dbcfc40299d Matt Fleming   2014-01-10  712  	 * 'capsules' because the firmware doesn't understand 64-bit
4f9dbcfc40299d Matt Fleming   2014-01-10  713  	 * pointers.
4f9dbcfc40299d Matt Fleming   2014-01-10  714  	 */
4f9dbcfc40299d Matt Fleming   2014-01-10  715  	return EFI_UNSUPPORTED;
4f9dbcfc40299d Matt Fleming   2014-01-10  716  }
4f9dbcfc40299d Matt Fleming   2014-01-10  717  
4f9dbcfc40299d Matt Fleming   2014-01-10  718  static efi_status_t
4f9dbcfc40299d Matt Fleming   2014-01-10  719  efi_thunk_query_variable_info(u32 attr, u64 *storage_space,
4f9dbcfc40299d Matt Fleming   2014-01-10  720  			      u64 *remaining_space,
4f9dbcfc40299d Matt Fleming   2014-01-10  721  			      u64 *max_variable_size)
4f9dbcfc40299d Matt Fleming   2014-01-10  722  {
4f9dbcfc40299d Matt Fleming   2014-01-10  723  	efi_status_t status;
4f9dbcfc40299d Matt Fleming   2014-01-10  724  	u32 phys_storage, phys_remaining, phys_max;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  725  	unsigned long flags;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  726  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  727  	if (efi.runtime_version < EFI_2_00_SYSTEM_TABLE_REVISION)
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  728  		return EFI_UNSUPPORTED;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  729  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  730  	spin_lock_irqsave(&efi_runtime_lock, flags);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  731  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  732  	phys_storage = virt_to_phys_or_null(storage_space);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  733  	phys_remaining = virt_to_phys_or_null(remaining_space);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  734  	phys_max = virt_to_phys_or_null(max_variable_size);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  735  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  736  	status = efi_thunk(query_variable_info, attr, phys_storage,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  737  			   phys_remaining, phys_max);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  738  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  739  	spin_unlock_irqrestore(&efi_runtime_lock, flags);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  740  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  741  	return status;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  742  }
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  743  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  744  static efi_status_t
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  745  efi_thunk_query_variable_info_nonblocking(u32 attr, u64 *storage_space,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  746  					  u64 *remaining_space,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  747  					  u64 *max_variable_size)
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  748  {
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  749  	efi_status_t status;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  750  	u32 phys_storage, phys_remaining, phys_max;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  751  	unsigned long flags;
4f9dbcfc40299d Matt Fleming   2014-01-10  752  
4f9dbcfc40299d Matt Fleming   2014-01-10  753  	if (efi.runtime_version < EFI_2_00_SYSTEM_TABLE_REVISION)
4f9dbcfc40299d Matt Fleming   2014-01-10  754  		return EFI_UNSUPPORTED;
4f9dbcfc40299d Matt Fleming   2014-01-10  755  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  756  	if (!spin_trylock_irqsave(&efi_runtime_lock, flags))
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  757  		return EFI_NOT_READY;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  758  
f6697df36bdf0b Matt Fleming   2016-11-12  759  	phys_storage = virt_to_phys_or_null(storage_space);
f6697df36bdf0b Matt Fleming   2016-11-12  760  	phys_remaining = virt_to_phys_or_null(remaining_space);
f6697df36bdf0b Matt Fleming   2016-11-12  761  	phys_max = virt_to_phys_or_null(max_variable_size);
4f9dbcfc40299d Matt Fleming   2014-01-10  762  
9a11040ff96230 Matt Fleming   2014-03-16  763  	status = efi_thunk(query_variable_info, attr, phys_storage,
4f9dbcfc40299d Matt Fleming   2014-01-10  764  			   phys_remaining, phys_max);
4f9dbcfc40299d Matt Fleming   2014-01-10  765  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20 @766  	spin_unlock_irqrestore(&efi_runtime_lock, flags);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  767  
4f9dbcfc40299d Matt Fleming   2014-01-10  768  	return status;
4f9dbcfc40299d Matt Fleming   2014-01-10  769  }
4f9dbcfc40299d Matt Fleming   2014-01-10  770  

:::::: The code at line 648 was first introduced by commit
:::::: 83a0a2ea0b991927e42984be220329e776ce7137 efi/x86: Prevent reentrant firmware calls in mixed mode

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

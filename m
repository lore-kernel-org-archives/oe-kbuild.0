Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D6D23CB
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Feb 2025 20:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740775776; cv=none; b=T24J1rK1qpjKtxrU8rdR6r8BlWs93Z+xgVsZySdu1M/8B08IReZr/PnccXLWUjWJDHW1YSiJWLCGJ5+/cNKF5cMlSfPUOQllClm/EuVBJrMxyRakXQKQfvAxjMYSmRrMwGQl+tox+SoGovY4zh1al8+XXj+xncQU4qSerGsj48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740775776; c=relaxed/simple;
	bh=/POvFdEjtbsU23UOnrgNkOBAjAcMxrjWL0sPHt1wZro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BWHQnJ4LauHx2A/A3we4X3Th+ucJFUDElw8Xtw1kIbpR4bjMvrCIQM10sE4daQvzeYvsUbpKX6jSKv9XHfVaM0H+Ltl/OEDehr7R+Phnfu7XUfuto35UVPSpwA/qGg/M0QHFezuCQBUtGgh7kXrcawqqzZUMZHNPgqcch/2pb3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fshsa2zK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fshsa2zK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740775774; x=1772311774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/POvFdEjtbsU23UOnrgNkOBAjAcMxrjWL0sPHt1wZro=;
  b=Fshsa2zKxu/T1iYbBtqpEO89e6O0kTJ4JJ99DRs+8AbNNycmgi86sl5H
   N/tmPFlM8SG6Jd+bjn9f23At8hnM7DRNgvjh/V64UJlSJmTJm8f68G0hE
   rZyl6WXxXvkgs3fAMK+iGPmyK95IN8pKvsTyZgRt4t0e9amBfiqFOqu6i
   6L43pcJt+MtsETiMJ1XwiCJhfJV9c3vfAQMKR2gczojFbdQUcyDGDxsLO
   U59vxLeJ5EE7SQDSww2P8IYngK6pYumob9TDViZQdYu6sy15WkzquBbcw
   t5ZZsZ9tk0Xnl9IURiWgBxVWmegjkU7uyXBQCWQsVlvvdMkDYf06L4CxZ
   g==;
X-CSE-ConnectionGUID: voD6PJ9hS2C5JcP4QR3cvg==
X-CSE-MsgGUID: /3LWeNTKQPWarhcbcvlngw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="40957255"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="40957255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 12:49:33 -0800
X-CSE-ConnectionGUID: YntfqOoMRK+I/1hjHgX4LQ==
X-CSE-MsgGUID: IhpkAl0ZTRa3dD+w/JahKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="148249281"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Feb 2025 12:49:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to7IX-000FV4-1w;
	Fri, 28 Feb 2025 20:49:29 +0000
Date: Sat, 1 Mar 2025 04:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4815/7423]
 drivers/firmware/efi/libstub/x86-stub.c:861 efi_stub_entry() error: we
 previously assumed 'boot_params' could be null (see line 824)
Message-ID: <202503010421.0CfckCHf-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: dac628e9563640e2de7878decc03a508b1ba319a [4815/7423] x86/efistub: Merge PE and handover entrypoints
:::::: branch date: 13 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20250228 (https://download.01.org/0day-ci/archive/20250301/202503010421.0CfckCHf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503010421.0CfckCHf-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:861 efi_stub_entry() error: we previously assumed 'boot_params' could be null (see line 824)

Old smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:134 setup_efi_pci() error: uninitialized symbol 'num'.
drivers/firmware/efi/libstub/x86-stub.c:168 retrieve_apple_device_properties() error: uninitialized symbol 'p'.
drivers/firmware/efi/libstub/x86-stub.c:168 retrieve_apple_device_properties() error: uninitialized symbol 'p'.
drivers/firmware/efi/libstub/x86-stub.c:186 retrieve_apple_device_properties() error: uninitialized symbol 'new'.
drivers/firmware/efi/libstub/x86-stub.c:186 retrieve_apple_device_properties() error: uninitialized symbol 'new'.
drivers/firmware/efi/libstub/x86-stub.c:254 apple_set_os() error: uninitialized symbol 'set_os'.
drivers/firmware/efi/libstub/x86-stub.c:362 setup_unaccepted_memory() error: uninitialized symbol 'proto'.

vim +/boot_params +861 drivers/firmware/efi/libstub/x86-stub.c

d2d7a54f69b67cd drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  802  
9ca8f72a9297f20 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  803  /*
d2d7a54f69b67cd drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  804   * On success, this routine will jump to the relocated image directly and never
d2d7a54f69b67cd drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  805   * return.  On failure, it will exit to the firmware via efi_exit() instead of
d2d7a54f69b67cd drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  806   * returning.
9ca8f72a9297f20 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  807   */
df9215f15206c2a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  808  void __noreturn efi_stub_entry(efi_handle_t handle,
c3710de5065d63f arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  809  			       efi_system_table_t *sys_table_arg,
796eb8d26a57f91 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2020-01-13  810  			       struct boot_params *boot_params)
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  811  
9ca8f72a9297f20 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  812  {
11078876b7a6a1b drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  813  	efi_guid_t guid = EFI_MEMORY_ATTRIBUTE_PROTOCOL_GUID;
f4dc7fffa9873db drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  814  	const struct linux_efi_initrd *initrd = NULL;
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  815  	unsigned long kernel_entry;
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  816  	struct setup_header *hdr;
9ca8f72a9297f20 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  817  	efi_status_t status;
54b52d872680348 arch/x86/boot/compressed/eboot.c        Matt Fleming               2014-01-10  818  
ccc27ae77494252 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-04-16  819  	efi_system_table = sys_table_arg;
9ca8f72a9297f20 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  820  	/* Check if we were booted by the EFI firmware */
ccc27ae77494252 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-04-16  821  	if (efi_system_table->hdr.signature != EFI_SYSTEM_TABLE_SIGNATURE)
3b8f44fc0810d51 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-16  822  		efi_exit(handle, EFI_INVALID_PARAMETER);
9ca8f72a9297f20 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  823  
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26 @824  	if (!IS_ENABLED(CONFIG_EFI_HANDOVER_PROTOCOL) || !boot_params) {
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  825  		status = efi_allocate_bootparams(handle, &boot_params);
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  826  		if (status != EFI_SUCCESS)
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  827  			efi_exit(handle, status);
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  828  	}
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  829  
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  830  	hdr = &boot_params->hdr;
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  831  
31c77a50992e8dd drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  832  	if (have_unsupported_snp_features())
31c77a50992e8dd drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  833  		efi_exit(handle, EFI_UNSUPPORTED);
31c77a50992e8dd drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  834  
11078876b7a6a1b drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  835  	if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
3ba75c1316390b2 drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  836  		efi_dxe_table = get_efi_config_table(EFI_DXE_SERVICES_TABLE_GUID);
3ba75c1316390b2 drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  837  		if (efi_dxe_table &&
3ba75c1316390b2 drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  838  		    efi_dxe_table->hdr.signature != EFI_DXE_SERVICES_TABLE_SIGNATURE) {
3ba75c1316390b2 drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  839  			efi_warn("Ignoring DXE services table: invalid signature\n");
3ba75c1316390b2 drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  840  			efi_dxe_table = NULL;
3ba75c1316390b2 drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  841  		}
11078876b7a6a1b drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  842  	}
11078876b7a6a1b drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  843  
11078876b7a6a1b drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  844  	/* grab the memory attributes protocol if it exists */
11078876b7a6a1b drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  845  	efi_bs_call(locate_protocol, &guid, NULL, (void **)&memattr);
3ba75c1316390b2 drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  846  
cb1c9e02b0c1303 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  847  	status = efi_setup_5level_paging();
cb1c9e02b0c1303 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  848  	if (status != EFI_SUCCESS) {
cb1c9e02b0c1303 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  849  		efi_err("efi_setup_5level_paging() failed!\n");
cb1c9e02b0c1303 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  850  		goto fail;
cb1c9e02b0c1303 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  851  	}
cb1c9e02b0c1303 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  852  
7dde67f2a23ac11 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  853  #ifdef CONFIG_CMDLINE_BOOL
15aa8fb852f995d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-05-16  854  	status = parse_options(CONFIG_CMDLINE);
055042bedd4e0af drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  855  	if (status != EFI_SUCCESS) {
055042bedd4e0af drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  856  		efi_err("Failed to parse options\n");
055042bedd4e0af drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  857  		goto fail;
055042bedd4e0af drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  858  	}
7dde67f2a23ac11 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  859  #endif
7dde67f2a23ac11 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  860  	if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
7dde67f2a23ac11 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30 @861  		unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
c33ce984435bb61 arch/x86/boot/compressed/eboot.c        Hans de Goede              2018-09-12  862  					       ((u64)boot_params->ext_cmd_line_ptr << 32));
15aa8fb852f995d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-05-16  863  		status = parse_options((char *)cmdline_paddr);
055042bedd4e0af drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  864  		if (status != EFI_SUCCESS) {
055042bedd4e0af drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  865  			efi_err("Failed to parse options\n");
055042bedd4e0af drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  866  			goto fail;
055042bedd4e0af drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  867  		}
7dde67f2a23ac11 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  868  	}
c33ce984435bb61 arch/x86/boot/compressed/eboot.c        Hans de Goede              2018-09-12  869  
cd0d9d92c8bb46e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-02-27  870  	if (efi_mem_encrypt > 0)
cd0d9d92c8bb46e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-02-27  871  		hdr->xloadflags |= XLF_MEM_ENCRYPTION;
cd0d9d92c8bb46e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-02-27  872  
dac628e9563640e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  873  	status = efi_decompress_kernel(&kernel_entry, boot_params);
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  874  	if (status != EFI_SUCCESS) {
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  875  		efi_err("Failed to decompress kernel\n");
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  876  		goto fail;
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  877  	}
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  878  
ec93fc371f014a6 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03  879  	/*
987053a30016a7d drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  880  	 * At this point, an initrd may already have been loaded by the
987053a30016a7d drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  881  	 * bootloader and passed via bootparams. We permit an initrd loaded
987053a30016a7d drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  882  	 * from the LINUX_EFI_INITRD_MEDIA_GUID device path to supersede it.
987053a30016a7d drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  883  	 *
987053a30016a7d drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  884  	 * If the device path is not present, any command-line initrd=
987053a30016a7d drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  885  	 * arguments will be processed only if image is not NULL, which will be
987053a30016a7d drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  886  	 * the case only if we were loaded via the PE entry point.
ec93fc371f014a6 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03  887  	 */
f4dc7fffa9873db drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  888  	status = efi_load_initrd(image, hdr->initrd_addr_max, ULONG_MAX,
f4dc7fffa9873db drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  889  				 &initrd);
20287d56f52dab0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2021-11-19  890  	if (status != EFI_SUCCESS)
ec93fc371f014a6 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03  891  		goto fail;
f4dc7fffa9873db drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  892  	if (initrd && initrd->size > 0) {
f4dc7fffa9873db drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  893  		efi_set_u64_split(initrd->base, &hdr->ramdisk_image,
eed4e0193ee7b00 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  894  				  &boot_params->ext_ramdisk_image);
f4dc7fffa9873db drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  895  		efi_set_u64_split(initrd->size, &hdr->ramdisk_size,
eed4e0193ee7b00 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  896  				  &boot_params->ext_ramdisk_size);
79d3219d4e56b3c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-04  897  	}
ec93fc371f014a6 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03  898  
f4dc7fffa9873db drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  899  
de8cb458625c164 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  900  	/*
de8cb458625c164 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  901  	 * If the boot loader gave us a value for secure_boot then we use that,
de8cb458625c164 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  902  	 * otherwise we ask the BIOS.
de8cb458625c164 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  903  	 */
de8cb458625c164 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  904  	if (boot_params->secure_boot == efi_secureboot_mode_unset)
cd33a5c1d53e43b arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  905  		boot_params->secure_boot = efi_get_secureboot();
ccc829ba3624beb arch/x86/boot/compressed/eboot.c        Matthew Garrett            2017-08-25  906  
ccc829ba3624beb arch/x86/boot/compressed/eboot.c        Matthew Garrett            2017-08-25  907  	/* Ask the firmware to clear memory on unclean shutdown */
cd33a5c1d53e43b arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  908  	efi_enable_reset_attack_mitigation();
0d95981438c3bdb arch/x86/boot/compressed/eboot.c        Dominik Brodowski          2019-11-06  909  
cd33a5c1d53e43b arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  910  	efi_random_get_seed();
0d95981438c3bdb arch/x86/boot/compressed/eboot.c        Dominik Brodowski          2019-11-06  911  
d228814b1913444 drivers/firmware/efi/libstub/x86-stub.c Kuppuswamy Sathyanarayanan 2024-02-15  912  	efi_retrieve_eventlog();
de8cb458625c164 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  913  
9ca8f72a9297f20 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  914  	setup_graphics(boot_params);
291f36325f9f252 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  915  
56394ab8c26893b arch/x86/boot/compressed/eboot.c        Matt Fleming               2014-09-11  916  	setup_efi_pci(boot_params);
dd5fc854de5fd37 arch/x86/boot/compressed/eboot.c        Matthew Garrett            2012-12-05  917  
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  918  	setup_quirks(boot_params);
58c5475aba67706 arch/x86/boot/compressed/eboot.c        Lukas Wunner               2016-11-12  919  
c0461bd16666351 drivers/firmware/efi/libstub/x86-stub.c Dionna Glaze               2023-06-06  920  	setup_unaccepted_memory();
c0461bd16666351 drivers/firmware/efi/libstub/x86-stub.c Dionna Glaze               2023-06-06  921  
aab9593c0cb4454 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2018-07-20  922  	status = exit_boot(boot_params, handle);
fb86b2440de0ec1 arch/x86/boot/compressed/eboot.c        Ulf Winkelvos              2014-07-10  923  	if (status != EFI_SUCCESS) {
36bdd0a78d56831 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  924  		efi_err("exit_boot() failed!\n");
291f36325f9f252 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  925  		goto fail;
fb86b2440de0ec1 arch/x86/boot/compressed/eboot.c        Ulf Winkelvos              2014-07-10  926  	}
291f36325f9f252 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  927  
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  928  	/*
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  929  	 * Call the SEV init code while still running with the firmware's
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  930  	 * GDT/IDT, so #VC exceptions will be handled by EFI.
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  931  	 */
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  932  	sev_enable(boot_params);
cb1c9e02b0c1303 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  933  
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  934  	efi_5level_switch();
d2d7a54f69b67cd drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  935  
a1b87d54f4e45ff drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  936  	enter_kernel(kernel_entry, boot_params);
291f36325f9f252 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  937  fail:
df9215f15206c2a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  938  	efi_err("efi_stub_entry() failed!\n");
90a2186b7df183c arch/x86/boot/compressed/eboot.c        Ingo Molnar                2018-07-11  939  
3b8f44fc0810d51 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-16  940  	efi_exit(handle, status);
291f36325f9f252 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  941  }
df9215f15206c2a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  942  

:::::: The code at line 861 was first introduced by commit
:::::: 7dde67f2a23ac11962b17128d9a71698430ced95 efi/x86: Support builtin command line

:::::: TO: Arvind Sankar <nivedita@alum.mit.edu>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

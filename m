Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C242C1593
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 05:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936234; cv=none; b=Iha4jGGUhGg8tFaMekKMSc69M7cx7HG8b4XWBRCg6ei0MG0LHy/aqNTLaA40aUfwdvww2gWUs/wTJwPhacdR6hpbv02CPRYskOJ/Iz/fs+UCNg4H/ULdfQHnA8tI46BjqFZ+/7BqUK3r+2TdnFqPYk5KPSROs/ouieyTs6lU1Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936234; c=relaxed/simple;
	bh=y//jx9dfVAFvEs0MWP2v1/5QIJCje2LCSLtnCa9neOw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RU1Hjowgo1+hCQKYUW+zjo+RzR97Wayk6I0p343FoloaDfarAZqjYknIVFG33stIforgs6Qk7mnkmI0caB5f6V+gGefaoFMY9x1WpFdayxFOo6FPXGhSSvUg+3tSenScYN7bRaNuYTFmniGHHDK/UzwDouYAIeY8mWn34jJnsf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3rkZc0y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3rkZc0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774936233; x=1806472233;
  h=date:from:to:cc:subject:message-id;
  bh=y//jx9dfVAFvEs0MWP2v1/5QIJCje2LCSLtnCa9neOw=;
  b=k3rkZc0y4Rnp9X8OR/rdoYmDAMhImt+peohrcK/vnuOENxjI22cB94Dr
   WP3oQAGV50SI04EkEeVJH+818svyvgk8dLyHv0grIV2/xCUW0EGceguE/
   UUQcPz1r1lKkDFq+KqzQtr+6aNAyzb3rbAMVNMDu3uZTr8SBiN7Fwg27c
   gyX9Vpm51Sl/b+syTx3SBHPkB7/SYeOznX9wRsAIesv6pAxzmkkY6zvUb
   IU7grzGp1XxuzpKrCEMaOEnLWgUTm+YO4ea7TsrOFEEfBCyna+fQkeT81
   3MGEGy++YLMh0KRa0MKvSZ6wcWqR3vY/T9p061uyokeIF+mXvntNvjURK
   A==;
X-CSE-ConnectionGUID: Lmd20f0eQM60kMd1eLyS0A==
X-CSE-MsgGUID: XtiPMbYmSe2eWWTH3Ynlgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76128586"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="76128586"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 22:50:17 -0700
X-CSE-ConnectionGUID: DQARHVRSQMG3QpQuXmCwgw==
X-CSE-MsgGUID: x+zfhfGoSHC46hnFIeRfiQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2026 22:50:14 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7RzQ-000000002Hp-1hNb;
	Tue, 31 Mar 2026 05:50:12 +0000
Date: Tue, 31 Mar 2026 13:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/x86-stub.c:861 efi_stub_entry()
 error: we previously assumed 'boot_params' could be null (see line 824)
Message-ID: <202603311304.lzOVUXGQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: dac628e9563640e2de7878decc03a508b1ba319a x86/efistub: Merge PE and handover entrypoints
date:   1 year, 1 month ago
:::::: branch date: 9 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-r071-20260330 (https://download.01.org/0day-ci/archive/20260331/202603311304.lzOVUXGQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603311304.lzOVUXGQ-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:861 efi_stub_entry() error: we previously assumed 'boot_params' could be null (see line 824)

vim +/boot_params +861 drivers/firmware/efi/libstub/x86-stub.c

d2d7a54f69b67c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  802  
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  803  /*
d2d7a54f69b67c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  804   * On success, this routine will jump to the relocated image directly and never
d2d7a54f69b67c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  805   * return.  On failure, it will exit to the firmware via efi_exit() instead of
d2d7a54f69b67c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  806   * returning.
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  807   */
df9215f15206c2 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  808  void __noreturn efi_stub_entry(efi_handle_t handle,
c3710de5065d63 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  809  			       efi_system_table_t *sys_table_arg,
796eb8d26a57f9 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2020-01-13  810  			       struct boot_params *boot_params)
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  811  
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  812  {
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  813  	efi_guid_t guid = EFI_MEMORY_ATTRIBUTE_PROTOCOL_GUID;
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  814  	const struct linux_efi_initrd *initrd = NULL;
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  815  	unsigned long kernel_entry;
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  816  	struct setup_header *hdr;
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  817  	efi_status_t status;
54b52d87268034 arch/x86/boot/compressed/eboot.c        Matt Fleming               2014-01-10  818  
ccc27ae7749425 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-04-16  819  	efi_system_table = sys_table_arg;
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  820  	/* Check if we were booted by the EFI firmware */
ccc27ae7749425 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-04-16  821  	if (efi_system_table->hdr.signature != EFI_SYSTEM_TABLE_SIGNATURE)
3b8f44fc0810d5 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-16  822  		efi_exit(handle, EFI_INVALID_PARAMETER);
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  823  
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26 @824  	if (!IS_ENABLED(CONFIG_EFI_HANDOVER_PROTOCOL) || !boot_params) {
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  825  		status = efi_allocate_bootparams(handle, &boot_params);
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  826  		if (status != EFI_SUCCESS)
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  827  			efi_exit(handle, status);
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  828  	}
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  829  
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  830  	hdr = &boot_params->hdr;
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  831  
31c77a50992e8d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  832  	if (have_unsupported_snp_features())
31c77a50992e8d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  833  		efi_exit(handle, EFI_UNSUPPORTED);
31c77a50992e8d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  834  
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  835  	if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  836  		efi_dxe_table = get_efi_config_table(EFI_DXE_SERVICES_TABLE_GUID);
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  837  		if (efi_dxe_table &&
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  838  		    efi_dxe_table->hdr.signature != EFI_DXE_SERVICES_TABLE_SIGNATURE) {
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  839  			efi_warn("Ignoring DXE services table: invalid signature\n");
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  840  			efi_dxe_table = NULL;
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  841  		}
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  842  	}
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  843  
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  844  	/* grab the memory attributes protocol if it exists */
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  845  	efi_bs_call(locate_protocol, &guid, NULL, (void **)&memattr);
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03  846  
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  847  	status = efi_setup_5level_paging();
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  848  	if (status != EFI_SUCCESS) {
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  849  		efi_err("efi_setup_5level_paging() failed!\n");
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  850  		goto fail;
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  851  	}
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  852  
7dde67f2a23ac1 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  853  #ifdef CONFIG_CMDLINE_BOOL
15aa8fb852f995 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-05-16  854  	status = parse_options(CONFIG_CMDLINE);
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  855  	if (status != EFI_SUCCESS) {
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  856  		efi_err("Failed to parse options\n");
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  857  		goto fail;
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  858  	}
7dde67f2a23ac1 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  859  #endif
7dde67f2a23ac1 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  860  	if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
7dde67f2a23ac1 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30 @861  		unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
c33ce984435bb6 arch/x86/boot/compressed/eboot.c        Hans de Goede              2018-09-12  862  					       ((u64)boot_params->ext_cmd_line_ptr << 32));
15aa8fb852f995 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-05-16  863  		status = parse_options((char *)cmdline_paddr);
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  864  		if (status != EFI_SUCCESS) {
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  865  			efi_err("Failed to parse options\n");
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  866  			goto fail;
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  867  		}
7dde67f2a23ac1 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  868  	}
c33ce984435bb6 arch/x86/boot/compressed/eboot.c        Hans de Goede              2018-09-12  869  
cd0d9d92c8bb46 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-02-27  870  	if (efi_mem_encrypt > 0)
cd0d9d92c8bb46 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-02-27  871  		hdr->xloadflags |= XLF_MEM_ENCRYPTION;
cd0d9d92c8bb46 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-02-27  872  
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  873  	status = efi_decompress_kernel(&kernel_entry, boot_params);
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  874  	if (status != EFI_SUCCESS) {
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  875  		efi_err("Failed to decompress kernel\n");
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  876  		goto fail;
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  877  	}
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  878  
ec93fc371f014a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03  879  	/*
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  880  	 * At this point, an initrd may already have been loaded by the
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  881  	 * bootloader and passed via bootparams. We permit an initrd loaded
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  882  	 * from the LINUX_EFI_INITRD_MEDIA_GUID device path to supersede it.
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  883  	 *
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  884  	 * If the device path is not present, any command-line initrd=
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  885  	 * arguments will be processed only if image is not NULL, which will be
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  886  	 * the case only if we were loaded via the PE entry point.
ec93fc371f014a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03  887  	 */
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  888  	status = efi_load_initrd(image, hdr->initrd_addr_max, ULONG_MAX,
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  889  				 &initrd);
20287d56f52dab drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2021-11-19  890  	if (status != EFI_SUCCESS)
ec93fc371f014a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03  891  		goto fail;
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  892  	if (initrd && initrd->size > 0) {
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  893  		efi_set_u64_split(initrd->base, &hdr->ramdisk_image,
eed4e0193ee7b0 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  894  				  &boot_params->ext_ramdisk_image);
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  895  		efi_set_u64_split(initrd->size, &hdr->ramdisk_size,
eed4e0193ee7b0 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  896  				  &boot_params->ext_ramdisk_size);
79d3219d4e56b3 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-04  897  	}
ec93fc371f014a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03  898  
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  899  
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  900  	/*
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  901  	 * If the boot loader gave us a value for secure_boot then we use that,
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  902  	 * otherwise we ask the BIOS.
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  903  	 */
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  904  	if (boot_params->secure_boot == efi_secureboot_mode_unset)
cd33a5c1d53e43 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  905  		boot_params->secure_boot = efi_get_secureboot();
ccc829ba3624be arch/x86/boot/compressed/eboot.c        Matthew Garrett            2017-08-25  906  
ccc829ba3624be arch/x86/boot/compressed/eboot.c        Matthew Garrett            2017-08-25  907  	/* Ask the firmware to clear memory on unclean shutdown */
cd33a5c1d53e43 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  908  	efi_enable_reset_attack_mitigation();
0d95981438c3bd arch/x86/boot/compressed/eboot.c        Dominik Brodowski          2019-11-06  909  
cd33a5c1d53e43 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  910  	efi_random_get_seed();
0d95981438c3bd arch/x86/boot/compressed/eboot.c        Dominik Brodowski          2019-11-06  911  
d228814b191344 drivers/firmware/efi/libstub/x86-stub.c Kuppuswamy Sathyanarayanan 2024-02-15  912  	efi_retrieve_eventlog();
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  913  
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  914  	setup_graphics(boot_params);
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  915  
56394ab8c26893 arch/x86/boot/compressed/eboot.c        Matt Fleming               2014-09-11  916  	setup_efi_pci(boot_params);
dd5fc854de5fd3 arch/x86/boot/compressed/eboot.c        Matthew Garrett            2012-12-05  917  
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  918  	setup_quirks(boot_params);
58c5475aba6770 arch/x86/boot/compressed/eboot.c        Lukas Wunner               2016-11-12  919  
c0461bd1666635 drivers/firmware/efi/libstub/x86-stub.c Dionna Glaze               2023-06-06  920  	setup_unaccepted_memory();
c0461bd1666635 drivers/firmware/efi/libstub/x86-stub.c Dionna Glaze               2023-06-06  921  
aab9593c0cb445 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2018-07-20  922  	status = exit_boot(boot_params, handle);
fb86b2440de0ec arch/x86/boot/compressed/eboot.c        Ulf Winkelvos              2014-07-10  923  	if (status != EFI_SUCCESS) {
36bdd0a78d5683 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  924  		efi_err("exit_boot() failed!\n");
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  925  		goto fail;
fb86b2440de0ec arch/x86/boot/compressed/eboot.c        Ulf Winkelvos              2014-07-10  926  	}
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  927  
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  928  	/*
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  929  	 * Call the SEV init code while still running with the firmware's
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  930  	 * GDT/IDT, so #VC exceptions will be handled by EFI.
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  931  	 */
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  932  	sev_enable(boot_params);
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  933  
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  934  	efi_5level_switch();
d2d7a54f69b67c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  935  
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  936  	enter_kernel(kernel_entry, boot_params);
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  937  fail:
df9215f15206c2 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  938  	efi_err("efi_stub_entry() failed!\n");
90a2186b7df183 arch/x86/boot/compressed/eboot.c        Ingo Molnar                2018-07-11  939  
3b8f44fc0810d5 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-16  940  	efi_exit(handle, status);
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  941  }
df9215f15206c2 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  942  

:::::: The code at line 861 was first introduced by commit
:::::: 7dde67f2a23ac11962b17128d9a71698430ced95 efi/x86: Support builtin command line

:::::: TO: Arvind Sankar <nivedita@alum.mit.edu>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

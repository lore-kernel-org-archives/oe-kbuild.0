Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD31EDA35
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Apr 2025 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743504130; cv=none; b=GNgZ6X9qfmF7u2FsM5CrBLXODCJvRcd+BbjXka5A+KAZaWpjHUbmODbEbvRzTyO5yaSbU9PV5qMIQZsvjow2d8L36k4oB/csWpJKO1OlDrIGIVhD4hkZmwxCbhxPXGlvEZeBNcrpFh2MKkp+7OdNMn/fTMyCqLmVajxUTMHvY40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743504130; c=relaxed/simple;
	bh=F5fYFKnEL7S6TV/xNyEkx+AlMb00tsOJcT6CH8HEdDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hX7SJyqOJ7HJ+ZURnpxIaPEBhuMi9lK0Ti/FT5Pabmn6Q3LHUpE2T7/7NERE6OeYMyEOTdHhX5y/adNYlyTWn6R2MahaeMLf3mshypTzZps7IXeSwGD5AQD9EACUVyp7dk3jixgS4CRgriTOqubiUSmO4CHq0xRMzPjFRuHxxIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUr+rAus; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUr+rAus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743504127; x=1775040127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F5fYFKnEL7S6TV/xNyEkx+AlMb00tsOJcT6CH8HEdDQ=;
  b=WUr+rAusQrlX1OPGId2e1Qt0EiiNC35p1U5af+Cx77/kpfissNerV2WV
   J5JPfgqn8u5GrCx8gau7i/vlTAoozZbfr/td/rB38Na/N/lVLnu47pIs+
   4ihwMqJFP9iTRswlcCqrAVXLGZij3DsWNAxfDXO7Dx/3Xl1R19lVgfhay
   mVMslgtkyPpLMPHhCGY7Y3Vw1GtP8Ab46fx1sYy/YoYvAP4Ogy/14Pyw8
   VBy7T2DpXZ9yNrKpk0k62jjwfrUbG5VLs9s4Hkl9ODDMv7C1fPpJ62MAd
   9nF5jMQdI1u6d9JASfgxJWI8y8c7GqC1Etn8kz9IqCvIFUKtvNZYrr5R2
   A==;
X-CSE-ConnectionGUID: OswM796qRJuWf1RkdahpQA==
X-CSE-MsgGUID: x9bjQO+mQj24NzYYq0dIfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62354166"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="62354166"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 03:42:06 -0700
X-CSE-ConnectionGUID: WjXPZTaNSFqke/VnVJDYLA==
X-CSE-MsgGUID: g6ftq+OVSVSKlfb2UOD+gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126320733"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Apr 2025 03:42:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzZ4D-0009mw-2t;
	Tue, 01 Apr 2025 10:42:01 +0000
Date: Tue, 1 Apr 2025 18:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.14/zen-sauce 8/32] drivers/firmware/efi/cper.c:561:39:
 warning: 'snprintf' output may be truncated before the last format character
Message-ID: <202504011853.WCEeYLg3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 6.14/zen-sauce
head:   53af25ba2daed6e2664a680250e2b32eac46bb89
commit: 17190525fdc9c9f73fe22832ab0631e9e1bbad6d [8/32] ZEN: Disable stack conservation for GCC
:::::: branch date: 12 hours ago
:::::: commit date: 7 days ago
config: arm64-randconfig-003-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011853.WCEeYLg3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011853.WCEeYLg3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504011853.WCEeYLg3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/cper.c: In function 'cper_estatus_print':
>> drivers/firmware/efi/cper.c:561:39: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     snprintf(newpfx, sizeof(newpfx), "%s ", pfx);
                                          ^
   drivers/firmware/efi/cper.c:561:2: note: 'snprintf' output between 2 and 65 bytes into a destination of size 64
     snprintf(newpfx, sizeof(newpfx), "%s ", pfx);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +561 drivers/firmware/efi/cper.c

54ce1927eb787f7 drivers/firmware/efi/cper.c Ira Weiny         2024-01-31  541  
bbcc2e7b642ed24 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  542  static void
bbcc2e7b642ed24 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  543  cper_estatus_print_section(const char *pfx, struct acpi_hest_generic_data *gdata,
bbcc2e7b642ed24 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  544  			   int sec_no)
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  545  {
c0020756315eebe drivers/firmware/efi/cper.c Andy Shevchenko   2017-07-19  546  	guid_t *sec_type = (guid_t *)gdata->section_type;
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  547  	__u16 severity;
f6edea77c8c8376 drivers/acpi/apei/cper.c    Chen, Gong        2013-10-18  548  	char newpfx[64];
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  549  
8a94471fb73fd53 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  550  	if (acpi_hest_get_version(gdata) >= 3)
8a94471fb73fd53 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  551  		cper_print_tstamp(pfx, (struct acpi_hest_generic_data_v300 *)gdata);
8a94471fb73fd53 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  552  
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  553  	severity = gdata->error_severity;
f6edea77c8c8376 drivers/acpi/apei/cper.c    Chen, Gong        2013-10-18  554  	printk("%s""Error %d, type: %s\n", pfx, sec_no,
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  555  	       cper_severity_str(severity));
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  556  	if (gdata->validation_bits & CPER_SEC_VALID_FRU_ID)
c0020756315eebe drivers/firmware/efi/cper.c Andy Shevchenko   2017-07-19  557  		printk("%s""fru_id: %pUl\n", pfx, gdata->fru_id);
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  558  	if (gdata->validation_bits & CPER_SEC_VALID_FRU_TEXT)
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  559  		printk("%s""fru_text: %.20s\n", pfx, gdata->fru_text);
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  560  
75e4fd31ce90e7f drivers/firmware/efi/cper.c Borislav Petkov   2018-05-04 @561  	snprintf(newpfx, sizeof(newpfx), "%s ", pfx);
54ce1927eb787f7 drivers/firmware/efi/cper.c Ira Weiny         2024-01-31  562  
54ce1927eb787f7 drivers/firmware/efi/cper.c Ira Weiny         2024-01-31  563  	for (int i = 0; i < ARRAY_SIZE(ignore_sections); i++) {
54ce1927eb787f7 drivers/firmware/efi/cper.c Ira Weiny         2024-01-31  564  		if (guid_equal(sec_type, &ignore_sections[i].guid)) {
54ce1927eb787f7 drivers/firmware/efi/cper.c Ira Weiny         2024-01-31  565  			printk("%ssection_type: %s\n", newpfx, ignore_sections[i].name);
54ce1927eb787f7 drivers/firmware/efi/cper.c Ira Weiny         2024-01-31  566  			return;
54ce1927eb787f7 drivers/firmware/efi/cper.c Ira Weiny         2024-01-31  567  		}
54ce1927eb787f7 drivers/firmware/efi/cper.c Ira Weiny         2024-01-31  568  	}
54ce1927eb787f7 drivers/firmware/efi/cper.c Ira Weiny         2024-01-31  569  
c0020756315eebe drivers/firmware/efi/cper.c Andy Shevchenko   2017-07-19  570  	if (guid_equal(sec_type, &CPER_SEC_PROC_GENERIC)) {
bbcc2e7b642ed24 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  571  		struct cper_sec_proc_generic *proc_err = acpi_hest_get_payload(gdata);
bbcc2e7b642ed24 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  572  
f6edea77c8c8376 drivers/acpi/apei/cper.c    Chen, Gong        2013-10-18  573  		printk("%s""section_type: general processor error\n", newpfx);
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  574  		if (gdata->error_data_length >= sizeof(*proc_err))
f6edea77c8c8376 drivers/acpi/apei/cper.c    Chen, Gong        2013-10-18  575  			cper_print_proc_generic(newpfx, proc_err);
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  576  		else
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  577  			goto err_section_too_small;
c0020756315eebe drivers/firmware/efi/cper.c Andy Shevchenko   2017-07-19  578  	} else if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM)) {
bbcc2e7b642ed24 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  579  		struct cper_sec_mem_err *mem_err = acpi_hest_get_payload(gdata);
bbcc2e7b642ed24 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  580  
f6edea77c8c8376 drivers/acpi/apei/cper.c    Chen, Gong        2013-10-18  581  		printk("%s""section_type: memory error\n", newpfx);
4c62360d7562a20 drivers/firmware/efi/cper.c Tony Luck         2015-06-30  582  		if (gdata->error_data_length >=
4c62360d7562a20 drivers/firmware/efi/cper.c Tony Luck         2015-06-30  583  		    sizeof(struct cper_sec_mem_err_old))
4c62360d7562a20 drivers/firmware/efi/cper.c Tony Luck         2015-06-30  584  			cper_print_mem(newpfx, mem_err,
4c62360d7562a20 drivers/firmware/efi/cper.c Tony Luck         2015-06-30  585  				       gdata->error_data_length);
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  586  		else
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  587  			goto err_section_too_small;
c0020756315eebe drivers/firmware/efi/cper.c Andy Shevchenko   2017-07-19  588  	} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
bbcc2e7b642ed24 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  589  		struct cper_sec_pcie *pcie = acpi_hest_get_payload(gdata);
bbcc2e7b642ed24 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  590  
f6edea77c8c8376 drivers/acpi/apei/cper.c    Chen, Gong        2013-10-18  591  		printk("%s""section_type: PCIe error\n", newpfx);
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  592  		if (gdata->error_data_length >= sizeof(*pcie))
f6edea77c8c8376 drivers/acpi/apei/cper.c    Chen, Gong        2013-10-18  593  			cper_print_pcie(newpfx, pcie, gdata);
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  594  		else
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  595  			goto err_section_too_small;
2f74f09bce4f8d0 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  596  #if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
e8f4194d9b98aa1 drivers/firmware/efi/cper.c Andy Shevchenko   2018-07-20  597  	} else if (guid_equal(sec_type, &CPER_SEC_PROC_ARM)) {
2f74f09bce4f8d0 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  598  		struct cper_sec_proc_arm *arm_err = acpi_hest_get_payload(gdata);
2f74f09bce4f8d0 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  599  
2f74f09bce4f8d0 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  600  		printk("%ssection_type: ARM processor error\n", newpfx);
2f74f09bce4f8d0 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  601  		if (gdata->error_data_length >= sizeof(*arm_err))
2f74f09bce4f8d0 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  602  			cper_print_proc_arm(newpfx, arm_err);
f9e1bdb9f35f4f5 drivers/firmware/efi/cper.c Yazen Ghannam     2018-05-04  603  		else
f9e1bdb9f35f4f5 drivers/firmware/efi/cper.c Yazen Ghannam     2018-05-04  604  			goto err_section_too_small;
f9e1bdb9f35f4f5 drivers/firmware/efi/cper.c Yazen Ghannam     2018-05-04  605  #endif
f9e1bdb9f35f4f5 drivers/firmware/efi/cper.c Yazen Ghannam     2018-05-04  606  #if defined(CONFIG_UEFI_CPER_X86)
f9e1bdb9f35f4f5 drivers/firmware/efi/cper.c Yazen Ghannam     2018-05-04  607  	} else if (guid_equal(sec_type, &CPER_SEC_PROC_IA)) {
f9e1bdb9f35f4f5 drivers/firmware/efi/cper.c Yazen Ghannam     2018-05-04  608  		struct cper_sec_proc_ia *ia_err = acpi_hest_get_payload(gdata);
f9e1bdb9f35f4f5 drivers/firmware/efi/cper.c Yazen Ghannam     2018-05-04  609  
f9e1bdb9f35f4f5 drivers/firmware/efi/cper.c Yazen Ghannam     2018-05-04  610  		printk("%ssection_type: IA32/X64 processor error\n", newpfx);
f9e1bdb9f35f4f5 drivers/firmware/efi/cper.c Yazen Ghannam     2018-05-04  611  		if (gdata->error_data_length >= sizeof(*ia_err))
f9e1bdb9f35f4f5 drivers/firmware/efi/cper.c Yazen Ghannam     2018-05-04  612  			cper_print_proc_ia(newpfx, ia_err);
2f74f09bce4f8d0 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  613  		else
2f74f09bce4f8d0 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  614  			goto err_section_too_small;
2f74f09bce4f8d0 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  615  #endif
3d8c11efd528d56 drivers/firmware/efi/cper.c Punit Agrawal     2020-05-12  616  	} else if (guid_equal(sec_type, &CPER_SEC_FW_ERR_REC_REF)) {
3d8c11efd528d56 drivers/firmware/efi/cper.c Punit Agrawal     2020-05-12  617  		struct cper_sec_fw_err_rec_ref *fw_err = acpi_hest_get_payload(gdata);
3d8c11efd528d56 drivers/firmware/efi/cper.c Punit Agrawal     2020-05-12  618  
3d8c11efd528d56 drivers/firmware/efi/cper.c Punit Agrawal     2020-05-12  619  		printk("%ssection_type: Firmware Error Record Reference\n",
3d8c11efd528d56 drivers/firmware/efi/cper.c Punit Agrawal     2020-05-12  620  		       newpfx);
3d8c11efd528d56 drivers/firmware/efi/cper.c Punit Agrawal     2020-05-12  621  		/* The minimal FW Error Record contains 16 bytes */
3d8c11efd528d56 drivers/firmware/efi/cper.c Punit Agrawal     2020-05-12  622  		if (gdata->error_data_length >= SZ_16)
3d8c11efd528d56 drivers/firmware/efi/cper.c Punit Agrawal     2020-05-12  623  			cper_print_fw_err(newpfx, gdata, fw_err);
3d8c11efd528d56 drivers/firmware/efi/cper.c Punit Agrawal     2020-05-12  624  		else
3d8c11efd528d56 drivers/firmware/efi/cper.c Punit Agrawal     2020-05-12  625  			goto err_section_too_small;
abdbf1a25daf429 drivers/firmware/efi/cper.c Smita Koralahalli 2022-10-28  626  	} else if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR)) {
abdbf1a25daf429 drivers/firmware/efi/cper.c Smita Koralahalli 2022-10-28  627  		struct cper_sec_prot_err *prot_err = acpi_hest_get_payload(gdata);
abdbf1a25daf429 drivers/firmware/efi/cper.c Smita Koralahalli 2022-10-28  628  
abdbf1a25daf429 drivers/firmware/efi/cper.c Smita Koralahalli 2022-10-28  629  		printk("%ssection_type: CXL Protocol Error\n", newpfx);
abdbf1a25daf429 drivers/firmware/efi/cper.c Smita Koralahalli 2022-10-28  630  		if (gdata->error_data_length >= sizeof(*prot_err))
abdbf1a25daf429 drivers/firmware/efi/cper.c Smita Koralahalli 2022-10-28  631  			cper_print_prot_err(newpfx, prot_err);
abdbf1a25daf429 drivers/firmware/efi/cper.c Smita Koralahalli 2022-10-28  632  		else
abdbf1a25daf429 drivers/firmware/efi/cper.c Smita Koralahalli 2022-10-28  633  			goto err_section_too_small;
0fc300f414519b1 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  634  	} else {
0fc300f414519b1 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  635  		const void *err = acpi_hest_get_payload(gdata);
0fc300f414519b1 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  636  
0fc300f414519b1 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  637  		printk("%ssection type: unknown, %pUl\n", newpfx, sec_type);
0fc300f414519b1 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  638  		printk("%ssection length: %#x\n", newpfx,
0fc300f414519b1 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  639  		       gdata->error_data_length);
0fc300f414519b1 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  640  		print_hex_dump(newpfx, "", DUMP_PREFIX_OFFSET, 16, 4, err,
0fc300f414519b1 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  641  			       gdata->error_data_length, true);
0fc300f414519b1 drivers/firmware/efi/cper.c Tyler Baicar      2017-06-21  642  	}
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  643  
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  644  	return;
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  645  
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  646  err_section_too_small:
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  647  	pr_err(FW_WARN "error section length is too small\n");
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  648  }
f59c55d04b43bd7 drivers/acpi/apei/cper.c    Ying Huang        2010-12-07  649  

:::::: The code at line 561 was first introduced by commit
:::::: 75e4fd31ce90e7f268365cb455381581896e0bca efi/cper: Remove the INDENT_SP silliness

:::::: TO: Borislav Petkov <bp@suse.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

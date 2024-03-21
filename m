Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91C43FB9A
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Mar 2024 06:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711002822; cv=none; b=XWugjANlTL39cmWSnWvogYF2ynmXJ3/sggYB1FdoV6itTPQ3PWD2+hNipq8Ourrj9R7gNUQMyMJnOVAa3vSOrId/wXA9sTCUBFwvUyab4KLWtlG9Tg15SjF0oRBNl5mO5JVkG9j/ZHZzWEMzfoYvbKBRmwllWpv8Q6uTH9jmu60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711002822; c=relaxed/simple;
	bh=1M3F1GZvPy1Q9D3dqwXxU0pFuakYmsmooIlBteD1Fhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msITyCYPSSb8W3SRv85njMrHfViQBN4adeMquUFoTs15KLHcxsnLU9DYTB3j1pOds6hdF3as/Q7QPBar4Glo5kdXvMMcytuBD6esergoWJ3NeE/S44SjGhasU/1sKm11U8ijVj2Ft0ec34PuCJrb5xrYaD9ggPKLG8pPbe2FH0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3C1cfae; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3C1cfae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711002820; x=1742538820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1M3F1GZvPy1Q9D3dqwXxU0pFuakYmsmooIlBteD1Fhc=;
  b=Z3C1cfaevOp6h1Xn2Js+y9DZT0xUQa5+TnIz3nBwe+tqoBoYTy239Ypy
   DR0b8AmtR8s5nApHdYVFfKYVkaiyGt5gmaXb+BK5cwNAe2Pd+W6MPwxIZ
   8rM1lgdvmqFY1XKzzCQnDh15itkWitPOsili88deNJVOq23uSWB68+FS/
   GyfhoaJv70gL0XaIVNOhBqhOZO6GbnMHhYl41tSZ+bbEot+AlGLrux1aP
   M2/RQdQwG4RjjmFzRrKgjxCsk8y7am7nMMJt/eKN19T/jjUy6fjDUcxVQ
   ymzvJl3Wiwi12+RwS7ff4xbCAbO4q8gv54+O86JLRYPqFc+2elof1kyID
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="8922664"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="8922664"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 23:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="14406840"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Mar 2024 23:33:37 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnBzb-000JDV-01;
	Thu, 21 Mar 2024 06:33:35 +0000
Date: Thu, 21 Mar 2024 14:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-tdx:guest-attest 5/6]
 drivers/firmware/efi/libstub/efi-stub-helper.c:240 tcg2_efi_measure() error:
 uninitialized symbol 'evt'.
Message-ID: <202403211414.2Zgm4B9N-lkp@intel.com>
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
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-attest
head:   7a63dba23624686145c7c0fb4b61a086cca62d6f
commit: 0a65f4a9b4ccea9af194490704ca295c172a41b1 [5/6] efi/libstub: Add EFI_CC_MEASUREMENT_PROTOCOL support
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20240321 (https://download.01.org/0day-ci/archive/20240321/202403211414.2Zgm4B9N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403211414.2Zgm4B9N-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/libstub/efi-stub-helper.c:240 tcg2_efi_measure() error: uninitialized symbol 'evt'.
drivers/firmware/efi/libstub/efi-stub-helper.c:286 cc_efi_measure() error: uninitialized symbol 'evt'.

Old smatch warnings:
drivers/firmware/efi/libstub/efi-stub-helper.c:59 efi_parse_options() error: uninitialized symbol 'buf'.
drivers/firmware/efi/libstub/efi-stub-helper.c:571 efi_load_initrd_dev_path() error: uninitialized symbol 'handle'.
drivers/firmware/efi/libstub/efi-stub-helper.c:571 efi_load_initrd_dev_path() error: uninitialized symbol 'handle'.
drivers/firmware/efi/libstub/efi-stub-helper.c:577 efi_load_initrd_dev_path() error: uninitialized symbol 'lf2'.
drivers/firmware/efi/libstub/efi-stub-helper.c:652 efi_load_initrd() error: uninitialized symbol 'tbl'.
drivers/firmware/efi/libstub/efi-stub-helper.c:695 efi_wait_for_key() error: uninitialized symbol 'timer'.
drivers/firmware/efi/libstub/efi-stub-helper.c:695 efi_wait_for_key() error: uninitialized symbol 'timer'.
drivers/firmware/efi/libstub/efi-stub-helper.c:703 efi_wait_for_key() error: uninitialized symbol 'index'.
drivers/firmware/efi/libstub/efi-stub-helper.c:746 efi_remap_image() error: uninitialized symbol 'memattr'.

vim +/evt +240 drivers/firmware/efi/libstub/efi-stub-helper.c

566331696329c2 Ilias Apalodimas           2022-09-16  221  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  222  static efi_status_t tcg2_efi_measure(efi_tcg2_protocol_t *tcg2,
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  223  				     unsigned long load_addr,
566331696329c2 Ilias Apalodimas           2022-09-16  224  				     unsigned long load_size,
566331696329c2 Ilias Apalodimas           2022-09-16  225  				     enum efistub_event event)
566331696329c2 Ilias Apalodimas           2022-09-16  226  {
566331696329c2 Ilias Apalodimas           2022-09-16  227  	struct efi_measured_event {
566331696329c2 Ilias Apalodimas           2022-09-16  228  		efi_tcg2_event_t	event_data;
566331696329c2 Ilias Apalodimas           2022-09-16  229  		efi_tcg2_tagged_event_t tagged_event;
566331696329c2 Ilias Apalodimas           2022-09-16  230  		u8			tagged_event_data[];
566331696329c2 Ilias Apalodimas           2022-09-16  231  	} *evt;
566331696329c2 Ilias Apalodimas           2022-09-16  232  	int size = sizeof(*evt) + events[event].event_data_len;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  233  	efi_status_t status;
566331696329c2 Ilias Apalodimas           2022-09-16  234  
566331696329c2 Ilias Apalodimas           2022-09-16  235  	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, size,
566331696329c2 Ilias Apalodimas           2022-09-16  236  			     (void **)&evt);
566331696329c2 Ilias Apalodimas           2022-09-16  237  	if (status != EFI_SUCCESS)
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  238  		return status;
566331696329c2 Ilias Apalodimas           2022-09-16  239  
566331696329c2 Ilias Apalodimas           2022-09-16 @240  	evt->event_data = (struct efi_tcg2_event){
566331696329c2 Ilias Apalodimas           2022-09-16  241  		.event_size			= size,
566331696329c2 Ilias Apalodimas           2022-09-16  242  		.event_header.header_size	= sizeof(evt->event_data.event_header),
566331696329c2 Ilias Apalodimas           2022-09-16  243  		.event_header.header_version	= EFI_TCG2_EVENT_HEADER_VERSION,
566331696329c2 Ilias Apalodimas           2022-09-16  244  		.event_header.pcr_index		= events[event].pcr_index,
566331696329c2 Ilias Apalodimas           2022-09-16  245  		.event_header.event_type	= EV_EVENT_TAG,
566331696329c2 Ilias Apalodimas           2022-09-16  246  	};
566331696329c2 Ilias Apalodimas           2022-09-16  247  
566331696329c2 Ilias Apalodimas           2022-09-16  248  	evt->tagged_event = (struct efi_tcg2_tagged_event){
566331696329c2 Ilias Apalodimas           2022-09-16  249  		.tagged_event_id		= events[event].event_id,
566331696329c2 Ilias Apalodimas           2022-09-16  250  		.tagged_event_data_size		= events[event].event_data_len,
566331696329c2 Ilias Apalodimas           2022-09-16  251  	};
566331696329c2 Ilias Apalodimas           2022-09-16  252  
566331696329c2 Ilias Apalodimas           2022-09-16  253  	memcpy(evt->tagged_event_data, events[event].event_data,
566331696329c2 Ilias Apalodimas           2022-09-16  254  	       events[event].event_data_len);
566331696329c2 Ilias Apalodimas           2022-09-16  255  
566331696329c2 Ilias Apalodimas           2022-09-16  256  	status = efi_call_proto(tcg2, hash_log_extend_event, 0,
566331696329c2 Ilias Apalodimas           2022-09-16  257  				load_addr, load_size, &evt->event_data);
566331696329c2 Ilias Apalodimas           2022-09-16  258  	efi_bs_call(free_pool, evt);
566331696329c2 Ilias Apalodimas           2022-09-16  259  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  260  	return status;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  261  }
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  262  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  263  static efi_status_t cc_efi_measure(efi_cc_measurement_protocol_t *cc,
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  264  				   unsigned long load_addr,
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  265  				   unsigned long load_size,
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  266  				   enum efistub_event event)
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  267  {
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  268  	efi_cc_mr_index_t mr;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  269  	efi_cc_event_t *evt;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  270  	efi_status_t status;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  271  	size_t size;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  272  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  273  	status = efi_call_proto(cc, map_pcr_to_mr_index, events[event].pcr_index, &mr);
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  274          if (status != EFI_SUCCESS) {
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  275  		efi_err("CC_MEASURE: PCR to MR mapping failed\n");
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  276  		return status;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  277  	}
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  278  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  279  	size = sizeof(*evt) + events[event].event_data_len;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  280  	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, size, (void **)&evt);
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  281          if (status != EFI_SUCCESS) {
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  282  		efi_err("CC_MEASURE: Allocating event struct failed\n");
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  283  		return status;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  284  	}
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  285  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07 @286  	evt->event_size = size;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  287  	evt->event_header.header_size = sizeof(evt->event_header);
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  288  	evt->event_header.header_version = EFI_CC_EVENT_HEADER_VERSION;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  289  	evt->event_header.mr_index = mr;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  290  	evt->event_header.event_type = EV_EVENT_TAG;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  291  	memcpy(evt->event_data, events[event].event_data, events[event].event_data_len);
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  292  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  293  	status = efi_call_proto(cc, hash_log_extend_event, 0, load_addr, load_size, evt);
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  294  	efi_bs_call(free_pool, evt);
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  295  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  296  	return status;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  297  }
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  298  static efi_status_t efi_measure_tagged_event(unsigned long load_addr,
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  299  					     unsigned long load_size,
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  300  					     enum efistub_event event)
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  301  {
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  302  	efi_guid_t tcg2_guid = EFI_TCG2_PROTOCOL_GUID;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  303  	efi_guid_t cc_guid = EFI_CC_MEASUREMENT_PROTOCOL_GUID;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  304  	efi_cc_measurement_protocol_t *cc = NULL;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  305  	efi_tcg2_protocol_t *tcg2 = NULL;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  306  	efi_status_t status;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  307  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  308  	efi_bs_call(locate_protocol, &tcg2_guid, NULL, (void **)&tcg2);
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  309  	if (tcg2) {
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  310  		status = tcg2_efi_measure(tcg2, load_addr, load_size, event);
566331696329c2 Ilias Apalodimas           2022-09-16  311  		if (status != EFI_SUCCESS)
566331696329c2 Ilias Apalodimas           2022-09-16  312  			goto fail;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  313  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  314  		return status;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  315  	}
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  316  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  317  	efi_bs_call(locate_protocol, &cc_guid, NULL, (void **)&cc);
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  318  	if (cc) {
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  319  		status = cc_efi_measure(cc, load_addr, load_size, event);
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  320  		if (status != EFI_SUCCESS)
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  321  			goto fail;
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  322  
0a65f4a9b4ccea Kuppuswamy Sathyanarayanan 2023-06-07  323  		return status;
566331696329c2 Ilias Apalodimas           2022-09-16  324  	}
566331696329c2 Ilias Apalodimas           2022-09-16  325  
566331696329c2 Ilias Apalodimas           2022-09-16  326  	return EFI_UNSUPPORTED;
566331696329c2 Ilias Apalodimas           2022-09-16  327  fail:
566331696329c2 Ilias Apalodimas           2022-09-16  328  	efi_warn("Failed to measure data for event %d: 0x%lx\n", event, status);
566331696329c2 Ilias Apalodimas           2022-09-16  329  	return status;
566331696329c2 Ilias Apalodimas           2022-09-16  330  }
566331696329c2 Ilias Apalodimas           2022-09-16  331  

:::::: The code at line 240 was first introduced by commit
:::::: 566331696329c2f9ca0fe2a55a5dd029ac43d2d2 efi/libstub: refactor the initrd measuring functions

:::::: TO: Ilias Apalodimas <ilias.apalodimas@linaro.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

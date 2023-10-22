Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249647F2
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Oct 2023 01:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTWOVBDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697937337; x=1729473337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlJuLjf9ie8Afr4zWvlkIGgssrSnx4JHtCXNaz0scfY=;
  b=WTWOVBDmgqiXUeXdpnlsFrQVkxweAG6hQaOiV4T5WjSB6Dcc7IiBiSpy
   HFkDxIrs4BNJyqEr2MFmjZI4me6BzFtxifcjX1vSvikgD/tGVmZdQQcGI
   kRUDLSz2KL8E5JxjmN8BSQ/s8PjiIgA54/JZpnT3d+gwW0F4ZPSosk3Hm
   JGyADxccPkhmvZF/nStsn+ZTARMRA7UiaKOSdsGkl8otRL79uU5VgblPz
   GepDwJQoAbmS97uxevtGzVSjk5ZFTArmGue7IBhWb6INPHlsapXA837zT
   HxgSMPI9o5chk9oIi0KjZfgPAPDWQ6fmd+SoJSYYUOGoHs186MHx2y62M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="453143961"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="453143961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 18:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="5448738"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2023 18:14:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quN40-0005S5-3B;
	Sun, 22 Oct 2023 01:15:32 +0000
Date: Sun, 22 Oct 2023 09:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/efi-stub-helper.c:518
 efi_load_initrd_dev_path() error: uninitialized symbol 'lf2'.
Message-ID: <202310220940.0uPeW8v2-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d537ae43f8a107761fb5a85c3f0cfce5ca79bcb1
commit: a61962d8e7d3f11f68cbaebd477fbd8e1f7b9f6d efi: libstub: Permit mixed mode return types other than efi_status_t
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220940.0uPeW8v2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220940.0uPeW8v2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310220940.0uPeW8v2-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/libstub/efi-stub-helper.c:518 efi_load_initrd_dev_path() error: uninitialized symbol 'lf2'.

Old smatch warnings:
drivers/firmware/efi/libstub/efi-stub-helper.c:59 efi_parse_options() error: uninitialized symbol 'buf'.
drivers/firmware/efi/libstub/efi-stub-helper.c:242 efi_measure_tagged_event() error: potentially dereferencing uninitialized 'evt'.
drivers/firmware/efi/libstub/efi-stub-helper.c:512 efi_load_initrd_dev_path() error: uninitialized symbol 'handle'.
drivers/firmware/efi/libstub/efi-stub-helper.c:512 efi_load_initrd_dev_path() error: uninitialized symbol 'handle'.
drivers/firmware/efi/libstub/efi-stub-helper.c:594 efi_load_initrd() error: potentially dereferencing uninitialized 'tbl'.
drivers/firmware/efi/libstub/efi-stub-helper.c:637 efi_wait_for_key() error: uninitialized symbol 'timer'.
drivers/firmware/efi/libstub/efi-stub-helper.c:637 efi_wait_for_key() error: uninitialized symbol 'timer'.
drivers/firmware/efi/libstub/efi-stub-helper.c:645 efi_wait_for_key() error: uninitialized symbol 'index'.

vim +/lf2 +518 drivers/firmware/efi/libstub/efi-stub-helper.c

ec93fc371f014a6 Ard Biesheuvel      2020-02-03  483  
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  484  /**
8c0a839c2bccb75 Heinrich Schuchardt 2020-06-16  485   * efi_load_initrd_dev_path() - load the initrd from the Linux initrd device path
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  486   * @load_addr:	pointer to store the address where the initrd was loaded
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  487   * @load_size:	pointer to store the size of the loaded initrd
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  488   * @max:	upper limit for the initrd memory allocation
8c0a839c2bccb75 Heinrich Schuchardt 2020-06-16  489   *
8c0a839c2bccb75 Heinrich Schuchardt 2020-06-16  490   * Return:
8c0a839c2bccb75 Heinrich Schuchardt 2020-06-16  491   * * %EFI_SUCCESS if the initrd was loaded successfully, in which
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  492   *   case @load_addr and @load_size are assigned accordingly
8c0a839c2bccb75 Heinrich Schuchardt 2020-06-16  493   * * %EFI_NOT_FOUND if no LoadFile2 protocol exists on the initrd device path
8c0a839c2bccb75 Heinrich Schuchardt 2020-06-16  494   * * %EFI_OUT_OF_RESOURCES if memory allocation failed
8c0a839c2bccb75 Heinrich Schuchardt 2020-06-16  495   * * %EFI_LOAD_ERROR in all other cases
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  496   */
f61900fd0ebf6c6 Arvind Sankar       2020-04-30  497  static
f4dc7fffa9873db Ard Biesheuvel      2022-09-16  498  efi_status_t efi_load_initrd_dev_path(struct linux_efi_initrd *initrd,
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  499  				      unsigned long max)
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  500  {
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  501  	efi_guid_t lf2_proto_guid = EFI_LOAD_FILE2_PROTOCOL_GUID;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  502  	efi_device_path_protocol_t *dp;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  503  	efi_load_file2_protocol_t *lf2;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  504  	efi_handle_t handle;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  505  	efi_status_t status;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  506  
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  507  	dp = (efi_device_path_protocol_t *)&initrd_dev_path;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  508  	status = efi_bs_call(locate_device_path, &lf2_proto_guid, &dp, &handle);
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  509  	if (status != EFI_SUCCESS)
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  510  		return status;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  511  
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  512  	status = efi_bs_call(handle_protocol, handle, &lf2_proto_guid,
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  513  			     (void **)&lf2);
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  514  	if (status != EFI_SUCCESS)
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  515  		return status;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  516  
f4dc7fffa9873db Ard Biesheuvel      2022-09-16  517  	initrd->size = 0;
f4dc7fffa9873db Ard Biesheuvel      2022-09-16 @518  	status = efi_call_proto(lf2, load_file, dp, false, &initrd->size, NULL);
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  519  	if (status != EFI_BUFFER_TOO_SMALL)
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  520  		return EFI_LOAD_ERROR;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  521  
f4dc7fffa9873db Ard Biesheuvel      2022-09-16  522  	status = efi_allocate_pages(initrd->size, &initrd->base, max);
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  523  	if (status != EFI_SUCCESS)
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  524  		return status;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  525  
f4dc7fffa9873db Ard Biesheuvel      2022-09-16  526  	status = efi_call_proto(lf2, load_file, dp, false, &initrd->size,
f4dc7fffa9873db Ard Biesheuvel      2022-09-16  527  				(void *)initrd->base);
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  528  	if (status != EFI_SUCCESS) {
f4dc7fffa9873db Ard Biesheuvel      2022-09-16  529  		efi_free(initrd->size, initrd->base);
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  530  		return EFI_LOAD_ERROR;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  531  	}
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  532  	return EFI_SUCCESS;
ec93fc371f014a6 Ard Biesheuvel      2020-02-03  533  }
f61900fd0ebf6c6 Arvind Sankar       2020-04-30  534  

:::::: The code at line 518 was first introduced by commit
:::::: f4dc7fffa9873db50ec25624572f8217a6225de8 efi: libstub: unify initrd loading between architectures

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

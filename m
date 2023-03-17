Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787792C9D
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 23:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679094940; x=1710630940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M1RDgGn2pQl2ReRY9ByLU6e8XlRk4p+FkK15Pa36CbY=;
  b=EjCJhDFwASFLsO/4T71IPYYxWWtkL7CJ052HPqw/YFnPHNZ5Ous8EQ9U
   /oN93b2lwOXHlbDJ008vR24s6zcn6/57tCaK/2e60cQyiwz+m2A43KcE/
   yFKl0AA4qGIW2la2hYZPIinIAURUZrWYhWxna/BJQsy1B7o+jHfv00Uma
   7Sirks+TsKxRmv1k7D14PTCz2k9V2JlCiesCUcyz8bu7lT/El4iNkP6hj
   gLKt1KjfLoKiPuTeZ7wkegOpyeyRjrpppL5XRfGUH/Yci6hgIrcy6dBix
   E7CStJabvTFvoH2d3TpFT9lHwnr3oBLXdNEbax69pyOBejOU5TW7UQlim
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="318036890"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="318036890"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 16:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="673728427"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="673728427"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Mar 2023 16:15:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdJIA-0009e6-1w;
	Fri, 17 Mar 2023 23:15:22 +0000
Date: Sat, 18 Mar 2023 07:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [efi:urgent 12/12]
 drivers/firmware/efi/libstub/efi-stub-helper.c:528 efi_load_initrd_lf2()
 error: uninitialized symbol 'dp'.
Message-ID: <202303180724.UexnVEeA-lkp@intel.com>
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
CC: linux-efi@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Ilias Apalodimas <ilias.apalodimas@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git urgent
head:   86237b46f2b202331c07e4c6c2633ce3d3ba7f13
commit: 86237b46f2b202331c07e4c6c2633ce3d3ba7f13 [12/12] efi: libstub: Look for initrd LoadFile2 protocol on image handle
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230318/202303180724.UexnVEeA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303180724.UexnVEeA-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/efi-stub-helper.c:528 efi_load_initrd_lf2() error: uninitialized symbol 'dp'.

vim +/dp +528 drivers/firmware/efi/libstub/efi-stub-helper.c

ec93fc371f014a Ard Biesheuvel      2020-02-03  483  
ec93fc371f014a Ard Biesheuvel      2020-02-03  484  /**
86237b46f2b202 Ard Biesheuvel      2023-03-10  485   * efi_load_initrd_lf2() - load the initrd from the Linux initrd device path
86237b46f2b202 Ard Biesheuvel      2023-03-10  486   * @image_handle: EFI handle of the loaded image
86237b46f2b202 Ard Biesheuvel      2023-03-10  487   * @initrd:	  pointer of struct to store the address where the initrd was
86237b46f2b202 Ard Biesheuvel      2023-03-10  488   *                loaded and the size of the loaded initrd
ec93fc371f014a Ard Biesheuvel      2020-02-03  489   * @max:	  upper limit for the initrd memory allocation
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  490   *
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  491   * Return:
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  492   * * %EFI_SUCCESS if the initrd was loaded successfully, in which
ec93fc371f014a Ard Biesheuvel      2020-02-03  493   *   case @load_addr and @load_size are assigned accordingly
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  494   * * %EFI_NOT_FOUND if no LoadFile2 protocol exists on the initrd device path
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  495   * * %EFI_OUT_OF_RESOURCES if memory allocation failed
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  496   * * %EFI_LOAD_ERROR in all other cases
ec93fc371f014a Ard Biesheuvel      2020-02-03  497   */
f61900fd0ebf6c Arvind Sankar       2020-04-30  498  static
86237b46f2b202 Ard Biesheuvel      2023-03-10  499  efi_status_t efi_load_initrd_lf2(efi_handle_t image_handle,
86237b46f2b202 Ard Biesheuvel      2023-03-10  500  				 struct linux_efi_initrd *initrd,
ec93fc371f014a Ard Biesheuvel      2020-02-03  501  				 unsigned long max)
ec93fc371f014a Ard Biesheuvel      2020-02-03  502  {
ec93fc371f014a Ard Biesheuvel      2020-02-03  503  	efi_guid_t lf2_proto_guid = EFI_LOAD_FILE2_PROTOCOL_GUID;
86237b46f2b202 Ard Biesheuvel      2023-03-10  504  	efi_guid_t initrd_lf2_proto_guid = LINUX_EFI_INITRD_LF2_PROTOCOL_GUID;
ec93fc371f014a Ard Biesheuvel      2020-02-03  505  	efi_device_path_protocol_t *dp;
ec93fc371f014a Ard Biesheuvel      2020-02-03  506  	efi_load_file2_protocol_t *lf2;
ec93fc371f014a Ard Biesheuvel      2020-02-03  507  	efi_handle_t handle;
ec93fc371f014a Ard Biesheuvel      2020-02-03  508  	efi_status_t status;
ec93fc371f014a Ard Biesheuvel      2020-02-03  509  
86237b46f2b202 Ard Biesheuvel      2023-03-10  510  	/* first look for a initrd loading protocol specific to this image */
86237b46f2b202 Ard Biesheuvel      2023-03-10  511  	status = efi_bs_call(handle_protocol, image_handle, &initrd_lf2_proto_guid,
86237b46f2b202 Ard Biesheuvel      2023-03-10  512  			     (void **)&lf2);
86237b46f2b202 Ard Biesheuvel      2023-03-10  513  	if (status != EFI_SUCCESS) {
86237b46f2b202 Ard Biesheuvel      2023-03-10  514  		/* look for the global singleton initrd loading protocol */
ec93fc371f014a Ard Biesheuvel      2020-02-03  515  		dp = (efi_device_path_protocol_t *)&initrd_dev_path;
86237b46f2b202 Ard Biesheuvel      2023-03-10  516  		status = efi_bs_call(locate_device_path, &lf2_proto_guid, &dp,
86237b46f2b202 Ard Biesheuvel      2023-03-10  517  				     &handle);
ec93fc371f014a Ard Biesheuvel      2020-02-03  518  		if (status != EFI_SUCCESS)
ec93fc371f014a Ard Biesheuvel      2020-02-03  519  			return status;
ec93fc371f014a Ard Biesheuvel      2020-02-03  520  
ec93fc371f014a Ard Biesheuvel      2020-02-03  521  		status = efi_bs_call(handle_protocol, handle, &lf2_proto_guid,
ec93fc371f014a Ard Biesheuvel      2020-02-03  522  				     (void **)&lf2);
ec93fc371f014a Ard Biesheuvel      2020-02-03  523  		if (status != EFI_SUCCESS)
ec93fc371f014a Ard Biesheuvel      2020-02-03  524  			return status;
86237b46f2b202 Ard Biesheuvel      2023-03-10  525  	}
ec93fc371f014a Ard Biesheuvel      2020-02-03  526  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  527  	initrd->size = 0;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16 @528  	status = efi_call_proto(lf2, load_file, dp, false, &initrd->size, NULL);
ec93fc371f014a Ard Biesheuvel      2020-02-03  529  	if (status != EFI_BUFFER_TOO_SMALL)
ec93fc371f014a Ard Biesheuvel      2020-02-03  530  		return EFI_LOAD_ERROR;
ec93fc371f014a Ard Biesheuvel      2020-02-03  531  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  532  	status = efi_allocate_pages(initrd->size, &initrd->base, max);
ec93fc371f014a Ard Biesheuvel      2020-02-03  533  	if (status != EFI_SUCCESS)
ec93fc371f014a Ard Biesheuvel      2020-02-03  534  		return status;
ec93fc371f014a Ard Biesheuvel      2020-02-03  535  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  536  	status = efi_call_proto(lf2, load_file, dp, false, &initrd->size,
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  537  				(void *)initrd->base);
ec93fc371f014a Ard Biesheuvel      2020-02-03  538  	if (status != EFI_SUCCESS) {
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  539  		efi_free(initrd->size, initrd->base);
ec93fc371f014a Ard Biesheuvel      2020-02-03  540  		return EFI_LOAD_ERROR;
ec93fc371f014a Ard Biesheuvel      2020-02-03  541  	}
ec93fc371f014a Ard Biesheuvel      2020-02-03  542  	return EFI_SUCCESS;
ec93fc371f014a Ard Biesheuvel      2020-02-03  543  }
f61900fd0ebf6c Arvind Sankar       2020-04-30  544  

:::::: The code at line 528 was first introduced by commit
:::::: f4dc7fffa9873db50ec25624572f8217a6225de8 efi: libstub: unify initrd loading between architectures

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

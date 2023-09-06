Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543A8107A8
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Sep 2023 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694025054; x=1725561054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I9mBet7O0db93YggmRi8uiyKMTkPJIMnmn7q71KiWwQ=;
  b=h6se0UKkqBfpiXI0V40HHwnl8yXoAnog0oGVhQ4aG3kuHE4biwbsU4gF
   oqjhWXIVgi+YZiLRhG6t5GpYUc+co1Ws2bN/BF+3X8Q//B57R5zpuBRNE
   7esE3ZSDFoN36AEC65aBCYW3EbQ0fLtORVoaqBB/OSJUZnmuKr2Lt6tQ/
   jeIGQBAsBW8Xb7wd2RogGdi/L9bYPA2gKXT2WNTCwX7FoHgqKtv9KpdrZ
   l328sPhC05B4E+z7J1+JXU0TXURilo37kI4Gi0rLg+PFa+fh2Z628b7wh
   3n4/HHRrZTuiWgs2jOP5xC/h2RnBVcHMQ461DVIPojHRpVPTIslEnwjY4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362183706"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="362183706"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="915390864"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="915390864"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Sep 2023 11:30:50 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdxIe-0000UF-0f;
	Wed, 06 Sep 2023 18:30:48 +0000
Date: Thu, 7 Sep 2023 02:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/x86-stub.c:342
 setup_unaccepted_memory() error: uninitialized symbol 'proto'.
Message-ID: <202309070234.5YhutK2L-lkp@intel.com>
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
TO: Dionna Glaze <dionnaglaze@google.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Tom Lendacky <thomas.lendacky@amd.com>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   744a759492b5c57ff24a6e8aabe47b17ad8ee964
commit: c0461bd16666351f0de11578b1e02dcdae4db736 x86/efi: Safely enable unaccepted memory in UEFI
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070234.5YhutK2L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230907/202309070234.5YhutK2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309070234.5YhutK2L-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:342 setup_unaccepted_memory() error: uninitialized symbol 'proto'.

Old smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:188 retrieve_apple_device_properties() error: potentially dereferencing uninitialized 'p'.
drivers/firmware/efi/libstub/x86-stub.c:188 retrieve_apple_device_properties() error: potentially dereferencing uninitialized 'p'.
drivers/firmware/efi/libstub/x86-stub.c:206 retrieve_apple_device_properties() error: potentially dereferencing uninitialized 'new'.
drivers/firmware/efi/libstub/x86-stub.c:206 retrieve_apple_device_properties() error: potentially dereferencing uninitialized 'new'.

vim +/proto +342 drivers/firmware/efi/libstub/x86-stub.c

82e0d6d76a2a74 Baskov Evgeniy 2022-03-03  323  
c0461bd1666635 Dionna Glaze   2023-06-06  324  static void setup_unaccepted_memory(void)
c0461bd1666635 Dionna Glaze   2023-06-06  325  {
c0461bd1666635 Dionna Glaze   2023-06-06  326  	efi_guid_t mem_acceptance_proto = OVMF_SEV_MEMORY_ACCEPTANCE_PROTOCOL_GUID;
c0461bd1666635 Dionna Glaze   2023-06-06  327  	sev_memory_acceptance_protocol_t *proto;
c0461bd1666635 Dionna Glaze   2023-06-06  328  	efi_status_t status;
c0461bd1666635 Dionna Glaze   2023-06-06  329  
c0461bd1666635 Dionna Glaze   2023-06-06  330  	if (!IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
c0461bd1666635 Dionna Glaze   2023-06-06  331  		return;
c0461bd1666635 Dionna Glaze   2023-06-06  332  
c0461bd1666635 Dionna Glaze   2023-06-06  333  	/*
c0461bd1666635 Dionna Glaze   2023-06-06  334  	 * Enable unaccepted memory before calling exit boot services in order
c0461bd1666635 Dionna Glaze   2023-06-06  335  	 * for the UEFI to not accept all memory on EBS.
c0461bd1666635 Dionna Glaze   2023-06-06  336  	 */
c0461bd1666635 Dionna Glaze   2023-06-06  337  	status = efi_bs_call(locate_protocol, &mem_acceptance_proto, NULL,
c0461bd1666635 Dionna Glaze   2023-06-06  338  			     (void **)&proto);
c0461bd1666635 Dionna Glaze   2023-06-06  339  	if (status != EFI_SUCCESS)
c0461bd1666635 Dionna Glaze   2023-06-06  340  		return;
c0461bd1666635 Dionna Glaze   2023-06-06  341  
c0461bd1666635 Dionna Glaze   2023-06-06 @342  	status = efi_call_proto(proto, allow_unaccepted_memory);
c0461bd1666635 Dionna Glaze   2023-06-06  343  	if (status != EFI_SUCCESS)
c0461bd1666635 Dionna Glaze   2023-06-06  344  		efi_err("Memory acceptance protocol failed\n");
c0461bd1666635 Dionna Glaze   2023-06-06  345  }
c0461bd1666635 Dionna Glaze   2023-06-06  346  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

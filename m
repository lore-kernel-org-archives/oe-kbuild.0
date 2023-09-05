Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36292DDD7
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 22:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693953629; x=1725489629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XG/lRTpWRnBoXUJ4xF1HfEV+MC+R6JdeqPOHkzbVtP8=;
  b=nV8d3CKD2/WQMQA2cQ5EY2zn3xnOiPZzYIl5ath4X8+5CDb9qf+Rq/2v
   pxRPIMayZfUo+NJkTRVyA+uZcOsy+ByyGleiDTxAlbtkAhbKARMJZ8M2O
   79dnx1qEDzVHc3JuTWJetuZiadiLDOmbqFDCwMBRPNY2xqXbPvfFPBxsB
   oR1SkpB+JxINsZtmwOZjuH6JUMi7iohLlbaoLPqpBiwDIADQTviuiSvCt
   vZQXwSxITRw9uNkAJcDYvdl8fQE3lgo31VYX3NVXSzfNzNzIwZ4CTqqfP
   fxxOlwq1jJ9KublXIQJtNvglq1wDgM05aH/aOztmMuccR72wMl+JqPoqG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="374309785"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="374309785"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 15:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="864925429"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="864925429"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Sep 2023 15:40:25 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdeia-00029p-0X;
	Tue, 05 Sep 2023 22:40:21 +0000
Date: Wed, 6 Sep 2023 06:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/x86-stub.c:342
 setup_unaccepted_memory() error: uninitialized symbol 'proto'.
Message-ID: <202309060630.aT0wjZFD-lkp@intel.com>
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
head:   65d6e954e37872fd9afb5ef3fc0481bb3c2f20f4
commit: c0461bd16666351f0de11578b1e02dcdae4db736 x86/efi: Safely enable unaccepted memory in UEFI
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20230906 (https://download.01.org/0day-ci/archive/20230906/202309060630.aT0wjZFD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309060630.aT0wjZFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309060630.aT0wjZFD-lkp@intel.com/

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

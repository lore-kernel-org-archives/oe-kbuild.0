Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F181A4C6D
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694175426; x=1725711426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pp6XN9kZJzhKdm5SgOvSpOTCIImCAyDbCcR68YUN1s=;
  b=XntGJX+6LsimYukNX3CL1aQkt8605RCcgmis/JiXLiRpl4lwICmb65VN
   l4ozgh90Ey46TMzBBxtc9oeC0XfoR+3SmU3HOxO4WY5+qVUn//1Yo+N+I
   WAJGSb9sARH+Kl8o+YTVXPrXvjJ1QtZGhMaCwPyGgT8jU3QjTyInLAhPO
   JFIUDFS32/6JGhZ4s8yxEMdHrpbJ8V5OYaJu1aCSyHwxJ3Ymd+096iRfH
   ibUwnxdB4De8QhHIZllhmvbMhq64mPzIfbFyBY3hHkqWVyr9sV8N9pbgD
   V2k786myb4P1RDz/cJZ+kJX5wx/N5qhhQLhA5YKZ+40Y6S86N3r9VWsDU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464007583"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="464007583"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 05:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857379277"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="857379277"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2023 05:17:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeaQ1-0002FS-30;
	Fri, 08 Sep 2023 12:17:01 +0000
Date: Fri, 8 Sep 2023 20:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/x86-stub.c:342
 setup_unaccepted_memory() error: uninitialized symbol 'proto'.
Message-ID: <202309082031.eCX2lE5l-lkp@intel.com>
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
head:   a48fa7efaf1161c1c898931fe4c7f0070964233a
commit: c0461bd16666351f0de11578b1e02dcdae4db736 x86/efi: Safely enable unaccepted memory in UEFI
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20230906 (https://download.01.org/0day-ci/archive/20230908/202309082031.eCX2lE5l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309082031.eCX2lE5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309082031.eCX2lE5l-lkp@intel.com/

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

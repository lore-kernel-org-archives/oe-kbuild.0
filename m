Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A0D10E1
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Oct 2023 07:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPeCszGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697958527; x=1729494527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E8Swuhl+BN55e5iYR5R5p6+eW2f0Cb8n6HAAn/Dvzhc=;
  b=gPeCszGDmrnfWs8p1LiAha5lHa/FzO3+mU5ArydQgHyKgphPKxJW7AEL
   sDPCFsk4xrpiZfJsPIkjv7S9l1yu8W3kH1z/RmzV3wjwHYpTqp8KPYNds
   n5d1oSrMuA504Zoxc484r50v7m7uz5SP4MCdu6m8+mx5KFl37PN+HfWY7
   qzTSCfmqMQnFY/ChpKFlTrrR5MQigwlEBpPlVcwmGdRR5WxpvooGjx9X9
   whiqkljMc0PY/KhjW1qs90yHuGPy6GaidRYtzZ9yDULx/GppqBv/FkEm/
   zJ+YrKBkdFV8XMyOIvF7cs3kW25l7liqA8lAvK/2Z0/QKRAgv42ft7O9H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="385568140"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="385568140"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 00:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1089138653"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="1089138653"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Oct 2023 00:08:45 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quSZn-0005gQ-0E;
	Sun, 22 Oct 2023 07:08:43 +0000
Date: Sun, 22 Oct 2023 15:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/x86-stub.c:342
 setup_unaccepted_memory() error: uninitialized symbol 'proto'.
Message-ID: <202310221428.DR34IWDE-lkp@intel.com>
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
head:   1acfd2bd3f0d9dc34ea1871a445c554220945d9f
commit: c0461bd16666351f0de11578b1e02dcdae4db736 x86/efi: Safely enable unaccepted memory in UEFI
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20231022 (https://download.01.org/0day-ci/archive/20231022/202310221428.DR34IWDE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221428.DR34IWDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310221428.DR34IWDE-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:342 setup_unaccepted_memory() error: uninitialized symbol 'proto'.

Old smatch warnings:
drivers/firmware/efi/libstub/x86-stub.c:188 retrieve_apple_device_properties() error: potentially dereferencing uninitialized 'p'.
drivers/firmware/efi/libstub/x86-stub.c:188 retrieve_apple_device_properties() error: potentially dereferencing uninitialized 'p'.
drivers/firmware/efi/libstub/x86-stub.c:206 retrieve_apple_device_properties() error: potentially dereferencing uninitialized 'new'.
drivers/firmware/efi/libstub/x86-stub.c:206 retrieve_apple_device_properties() error: potentially dereferencing uninitialized 'new'.

vim +/proto +342 drivers/firmware/efi/libstub/x86-stub.c

82e0d6d76a2a74b Baskov Evgeniy 2022-03-03  323  
c0461bd16666351 Dionna Glaze   2023-06-06  324  static void setup_unaccepted_memory(void)
c0461bd16666351 Dionna Glaze   2023-06-06  325  {
c0461bd16666351 Dionna Glaze   2023-06-06  326  	efi_guid_t mem_acceptance_proto = OVMF_SEV_MEMORY_ACCEPTANCE_PROTOCOL_GUID;
c0461bd16666351 Dionna Glaze   2023-06-06  327  	sev_memory_acceptance_protocol_t *proto;
c0461bd16666351 Dionna Glaze   2023-06-06  328  	efi_status_t status;
c0461bd16666351 Dionna Glaze   2023-06-06  329  
c0461bd16666351 Dionna Glaze   2023-06-06  330  	if (!IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
c0461bd16666351 Dionna Glaze   2023-06-06  331  		return;
c0461bd16666351 Dionna Glaze   2023-06-06  332  
c0461bd16666351 Dionna Glaze   2023-06-06  333  	/*
c0461bd16666351 Dionna Glaze   2023-06-06  334  	 * Enable unaccepted memory before calling exit boot services in order
c0461bd16666351 Dionna Glaze   2023-06-06  335  	 * for the UEFI to not accept all memory on EBS.
c0461bd16666351 Dionna Glaze   2023-06-06  336  	 */
c0461bd16666351 Dionna Glaze   2023-06-06  337  	status = efi_bs_call(locate_protocol, &mem_acceptance_proto, NULL,
c0461bd16666351 Dionna Glaze   2023-06-06  338  			     (void **)&proto);
c0461bd16666351 Dionna Glaze   2023-06-06  339  	if (status != EFI_SUCCESS)
c0461bd16666351 Dionna Glaze   2023-06-06  340  		return;
c0461bd16666351 Dionna Glaze   2023-06-06  341  
c0461bd16666351 Dionna Glaze   2023-06-06 @342  	status = efi_call_proto(proto, allow_unaccepted_memory);
c0461bd16666351 Dionna Glaze   2023-06-06  343  	if (status != EFI_SUCCESS)
c0461bd16666351 Dionna Glaze   2023-06-06  344  		efi_err("Memory acceptance protocol failed\n");
c0461bd16666351 Dionna Glaze   2023-06-06  345  }
c0461bd16666351 Dionna Glaze   2023-06-06  346  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

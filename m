Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D446B5668
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688475415; x=1720011415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0UjoYBAi10fZY0HObclAFZ6qJC54L2CJ8pYaNjZXEKQ=;
  b=PFIB/1ay1RS7qp1ROh2wlZPAXnnU+tJZSNmoVc7qS6aEQxdN3Yd/3bsA
   DhHUxhDf0ApeZ23ps/s+mHvWpT4isVMrVAAREAWqYZeZEPODjj1JZ5mlN
   FpWqA7gRRTJ1g9pJnHtaI8vcb+In+7flQsFL6pPXY78aKA5OwUXSAsr9u
   40r4Aqk/W1IQ3RMnGWS6ePBiAVqaAWuH20w+3Bf2I2Mztg02PmCO9umEE
   KCOzG+7qdLkjhVIqGrI2z74HbVnPPDQWNKRWTXS53idKHCkF98QaJVszg
   nQ4MrgcZiSvqA6A92datNq+DP+v9ZlYYUtrdjFP1IZIISVd+Ujs02z4IA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="366596748"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="366596748"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 05:56:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="965499086"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="965499086"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2023 05:56:53 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGfaO-000IGB-1Y;
	Tue, 04 Jul 2023 12:56:52 +0000
Date: Tue, 4 Jul 2023 20:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [steev:lenovo-x13s-linux-6.4.y 126/163]
 drivers/firmware/efi/libstub/efi-stub.c:120
 check_rt_properties_table_override() error: we previously assumed 'table'
 could be null (see line 114)
Message-ID: <202307042036.U4788h2E-lkp@intel.com>
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
CC: Steev Klimaszewski <steev@kali.org>

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.4.y
head:   c573320c2d8100b297c611bb74534c9ac9fdc00a
commit: 95f650ee2fcaa1a2a9144375ace60431fb5f0e49 [126/163] efi: stub: override RT_PROP table supported mask based on EFI variable
:::::: branch date: 3 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230704/202307042036.U4788h2E-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042036.U4788h2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307042036.U4788h2E-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/efi-stub.c:120 check_rt_properties_table_override() error: we previously assumed 'table' could be null (see line 114)

vim +/table +120 drivers/firmware/efi/libstub/efi-stub.c

b844470f22061e drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel 2018-09-21  100  
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  101  static void check_rt_properties_table_override(void)
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  102  {
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  103  	static const efi_guid_t rt_prop_guid = EFI_RT_PROPERTIES_TABLE_GUID;
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  104  	efi_rt_properties_table_t *table;
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  105  	unsigned long size = sizeof(u32);
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  106  	efi_status_t status;
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  107  	u32 override;
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  108  
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  109  	status = get_efi_var(L"OverrideSupported", &rt_prop_guid, NULL, &size, &override);
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  110  	if (status != EFI_SUCCESS || size != sizeof(override))
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  111  		return;
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  112  
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  113  	table = get_efi_config_table(rt_prop_guid);
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06 @114  	if (!table) {
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  115  		/* no table exists yet - allocate a new one */
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  116  		status = efi_bs_call(allocate_pool, EFI_RUNTIME_SERVICES_DATA,
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  117  				     sizeof(*table), (void **)&table);
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  118  		if (status != EFI_SUCCESS)
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  119  			return;
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06 @120  		table->version = EFI_RT_PROPERTIES_TABLE_VERSION;
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  121  		table->length = sizeof(*table);
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  122  		table->runtime_services_supported = EFI_RT_SUPPORTED_ALL;
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  123  
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  124  		status = efi_bs_call(install_configuration_table,
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  125  				     (efi_guid_t *)&rt_prop_guid, table);
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  126  		if (status != EFI_SUCCESS) {
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  127  			efi_warn("Failed to install RT_PROP override table\n");
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  128  			return;
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  129  		}
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  130  	}
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  131  
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  132  	efi_info("Applying RT_PROP table override from EFI variable\n");
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  133  	table->runtime_services_supported &= override;
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  134  }
95f650ee2fcaa1 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DD615A9
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jun 2023 02:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685760079; x=1717296079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GkLVUDOmdvCritlJCx5Zz+OCwpLDy+bTugd1D3RRNEE=;
  b=WEbeQN8y7U2NJP0VE1HR6fpfGoGoI5cGqJEryjPZ7lkwZtETsG+aUyUm
   +G6NxsCc2x9Mx/te7O230APqZapEe8wFVpQpIZTwad+b8JNqhpOW7bRJv
   ORf83rCngNrCcP0ksAv3LRCd08jv3SJNHTpq/P4iNxwcHgREFOP2l+pRd
   gAZvVlRc9x0whHhbkIgn6GiTOrh52kD9TVGZnXAWBuEXGzIOEta5T3cYO
   NGwvXtzQysV3DT/ZS8vYrxafSlQ4D1S4iu+XnX4dvtXumddacHPqGfd4a
   UOgVyZRNFmH6drwP9YiO9GSiPmlT8q2Bnky3wOqXxOGQTn3NthR6uG9vZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="384308021"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="384308021"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 19:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="852358175"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="852358175"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2023 19:41:13 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5HCb-0001C3-03;
	Sat, 03 Jun 2023 02:41:13 +0000
Date: Sat, 3 Jun 2023 10:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [steev:lenovo-x13s-v6.4.0-rc4 117/133]
 drivers/firmware/efi/libstub/efi-stub.c:120
 check_rt_properties_table_override() error: we previously assumed 'table'
 could be null (see line 114)
Message-ID: <202306031025.fO5DDNW6-lkp@intel.com>
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

tree:   https://github.com/steev/linux lenovo-x13s-v6.4.0-rc4
head:   ad5e9b77a2b6838e846a9181596e2f30c1d0be5d
commit: 2ae4c1b343f5838f1a1a36afec442755c050738d [117/133] efi: stub: override RT_PROP table supported mask based on EFI variable
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-m031-20230531 (https://download.01.org/0day-ci/archive/20230603/202306031025.fO5DDNW6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306031025.fO5DDNW6-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/efi-stub.c:120 check_rt_properties_table_override() error: we previously assumed 'table' could be null (see line 114)

vim +/table +120 drivers/firmware/efi/libstub/efi-stub.c

b844470f22061e drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel 2018-09-21  100  
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  101  static void check_rt_properties_table_override(void)
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  102  {
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  103  	static const efi_guid_t rt_prop_guid = EFI_RT_PROPERTIES_TABLE_GUID;
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  104  	efi_rt_properties_table_t *table;
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  105  	unsigned long size = sizeof(u32);
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  106  	efi_status_t status;
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  107  	u32 override;
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  108  
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  109  	status = get_efi_var(L"OverrideSupported", &rt_prop_guid, NULL, &size, &override);
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  110  	if (status != EFI_SUCCESS || size != sizeof(override))
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  111  		return;
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  112  
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  113  	table = get_efi_config_table(rt_prop_guid);
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06 @114  	if (!table) {
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  115  		/* no table exists yet - allocate a new one */
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  116  		status = efi_bs_call(allocate_pool, EFI_RUNTIME_SERVICES_DATA,
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  117  				     sizeof(*table), (void **)&table);
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  118  		if (status != EFI_SUCCESS)
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  119  			return;
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06 @120  		table->version = EFI_RT_PROPERTIES_TABLE_VERSION;
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  121  		table->length = sizeof(*table);
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  122  		table->runtime_services_supported = EFI_RT_SUPPORTED_ALL;
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  123  
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  124  		status = efi_bs_call(install_configuration_table,
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  125  				     (efi_guid_t *)&rt_prop_guid, table);
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  126  		if (status != EFI_SUCCESS) {
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  127  			efi_warn("Failed to install RT_PROP override table\n");
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  128  			return;
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  129  		}
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  130  	}
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  131  
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  132  	efi_info("Applying RT_PROP table override from EFI variable\n");
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  133  	table->runtime_services_supported &= override;
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  134  }
2ae4c1b343f583 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215AC11181
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Nov 2023 06:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXTs7Dvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701151793; x=1732687793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9prx3hxR1Q8JIWYHW4JlcZaUYWdPjJJahGLJcnzvA8A=;
  b=dXTs7DviyMuLb0pxq/IU3NFkY9jSXni4wNKPC8tWWoISz9tzLyLD6bDU
   8OLt0Oir6HLoSCuVnom7kw+nzSiVyCdJjtMXo3S9wBN3Y8LuO+GdzN0NU
   GfOsXwbqKGdTohi5A15pIFlasXrOb0FDe1PbHF8E9UIFMKISF+pqfXsdx
   FlsiFPR40AclIQMZup2D0yQqCNffh3WGhecNJMcIknYtsJBRBuhPDJ/Dt
   hpXfcldrdTHfyTa6lxSj16B8lWmhALJ57RW9tCWpAo8WCiLjZmKGy//3a
   wEDaTQbW3waLZbP2mwLLxSUhAqE2M9VUSOyeAFmywuktNxO0CCQZVvFKt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377886166"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="377886166"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 22:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1015815334"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="1015815334"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Nov 2023 22:09:51 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7rI5-00076m-0d;
	Tue, 28 Nov 2023 06:09:49 +0000
Date: Tue, 28 Nov 2023 14:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [steev:lenovo-x13s-v6.7.0-rc3 74/88]
 drivers/firmware/efi/libstub/efi-stub.c:120
 check_rt_properties_table_override() error: we previously assumed 'table'
 could be null (see line 114)
Message-ID: <202311281303.ke4rXEYj-lkp@intel.com>
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

tree:   https://github.com/steev/linux lenovo-x13s-v6.7.0-rc3
head:   ecb02aa1a2217cd19532d7272a696382d1b4a8e0
commit: 13a4195723a1d404277a13ab9e7c7f1105c5e745 [74/88] efi: stub: override RT_PROP table supported mask based on EFI variable
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-randconfig-r071-20231128 (https://download.01.org/0day-ci/archive/20231128/202311281303.ke4rXEYj-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231128/202311281303.ke4rXEYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311281303.ke4rXEYj-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/efi-stub.c:120 check_rt_properties_table_override() error: we previously assumed 'table' could be null (see line 114)

vim +/table +120 drivers/firmware/efi/libstub/efi-stub.c

b844470f22061e drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel 2018-09-21  100  
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  101  static void check_rt_properties_table_override(void)
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  102  {
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  103  	static const efi_guid_t rt_prop_guid = EFI_RT_PROPERTIES_TABLE_GUID;
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  104  	efi_rt_properties_table_t *table;
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  105  	unsigned long size = sizeof(u32);
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  106  	efi_status_t status;
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  107  	u32 override;
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  108  
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  109  	status = get_efi_var(L"OverrideSupported", &rt_prop_guid, NULL, &size, &override);
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  110  	if (status != EFI_SUCCESS || size != sizeof(override))
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  111  		return;
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  112  
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  113  	table = get_efi_config_table(rt_prop_guid);
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06 @114  	if (!table) {
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  115  		/* no table exists yet - allocate a new one */
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  116  		status = efi_bs_call(allocate_pool, EFI_RUNTIME_SERVICES_DATA,
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  117  				     sizeof(*table), (void **)&table);
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  118  		if (status != EFI_SUCCESS)
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  119  			return;
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06 @120  		table->version = EFI_RT_PROPERTIES_TABLE_VERSION;
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  121  		table->length = sizeof(*table);
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  122  		table->runtime_services_supported = EFI_RT_SUPPORTED_ALL;
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  123  
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  124  		status = efi_bs_call(install_configuration_table,
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  125  				     (efi_guid_t *)&rt_prop_guid, table);
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  126  		if (status != EFI_SUCCESS) {
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  127  			efi_warn("Failed to install RT_PROP override table\n");
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  128  			return;
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  129  		}
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  130  	}
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  131  
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  132  	efi_info("Applying RT_PROP table override from EFI variable\n");
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  133  	table->runtime_services_supported &= override;
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  134  }
13a4195723a1d4 drivers/firmware/efi/libstub/efi-stub.c Ard Biesheuvel 2021-03-06  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

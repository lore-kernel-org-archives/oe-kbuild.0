Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA801C3A
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Oct 2023 02:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+Te4uLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698718666; x=1730254666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KnX+c8h5LQIIShhPpSEIV379SB8I55Q8hFtJx9P/3jU=;
  b=H+Te4uLEWEm1byfwa02Zsk1G/xi3ap/U41juDYC0ISQQ53jaaRAM+uTK
   F4UBmZQydE8ikI5O5siJbG2dunZpykNP6jndAcK1zJk7E2ALiVXjaIX6z
   Yy68L0yXTaXx/Xrdh29oXNzoiWhEkLMSiuNgyu6rPpGQDLGnwgP0QnCJy
   vFAefSArNsnjVAvWkMquXvvTIQMpLzi4cr+IVUfcKwfe+Pc43BwVOHW5m
   gegF4PTZROEyc1Hv0hif/lL5iDBl2hErW2kckke7tJhSW9azf5mySj3yE
   Kwir89hAqnFhmi1FeV/979a8D06ZxR+aBA4UWuLw0FrPabiEfH+OTCfpE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="392061004"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="392061004"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 19:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1091845542"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1091845542"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2023 19:17:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxeK5-000DkV-0j;
	Tue, 31 Oct 2023 02:17:41 +0000
Date: Tue, 31 Oct 2023 10:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 21/21] ACPI: RISC-V: Create PLIC platform device
Message-ID: <202310311026.2FTakVns-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231025202344.581132-22-sunilvl@ventanamicro.com>
References: <20231025202344.581132-22-sunilvl@ventanamicro.com>
TO: Sunil V L <sunilvl@ventanamicro.com>

Hi Sunil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.6]
[cannot apply to rafael-pm/acpi-bus tip/irq/core pci/next pci/for-linus next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunil-V-L/arm64-PCI-Migrate-ACPI-related-functions-to-pci-acpi-c/20231026-042858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231025202344.581132-22-sunilvl%40ventanamicro.com
patch subject: [RFC PATCH v2 21/21] ACPI: RISC-V: Create PLIC platform device
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231031/202310311026.2FTakVns-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311026.2FTakVns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310311026.2FTakVns-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/riscv/irq.c:103:13: warning: no previous prototype for 'riscv_acpi_aplic_platform_init' [-Wmissing-prototypes]
     103 | void __init riscv_acpi_aplic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/irq.c:117:13: warning: no previous prototype for 'riscv_acpi_plic_platform_init' [-Wmissing-prototypes]
     117 | void __init riscv_acpi_plic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_acpi_plic_platform_init +117 drivers/acpi/riscv/irq.c

e501748dc32f47 Sunil V L 2023-10-26  102  
e501748dc32f47 Sunil V L 2023-10-26 @103  void __init riscv_acpi_aplic_platform_init(void)
e501748dc32f47 Sunil V L 2023-10-26  104  {
e501748dc32f47 Sunil V L 2023-10-26  105  	acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, aplic_parse_madt, 0);
e501748dc32f47 Sunil V L 2023-10-26  106  }
417e6dc5b730e7 Sunil V L 2023-10-26  107  
417e6dc5b730e7 Sunil V L 2023-10-26  108  static int __init plic_parse_madt(union acpi_subtable_headers *header,
417e6dc5b730e7 Sunil V L 2023-10-26  109  				  const unsigned long end)
417e6dc5b730e7 Sunil V L 2023-10-26  110  {
417e6dc5b730e7 Sunil V L 2023-10-26  111  	struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
417e6dc5b730e7 Sunil V L 2023-10-26  112  
417e6dc5b730e7 Sunil V L 2023-10-26  113  	return irqchip_add_platform_device("riscv-plic", plic->id, plic->base_addr,
417e6dc5b730e7 Sunil V L 2023-10-26  114  					   plic->size, header);
417e6dc5b730e7 Sunil V L 2023-10-26  115  }
417e6dc5b730e7 Sunil V L 2023-10-26  116  
417e6dc5b730e7 Sunil V L 2023-10-26 @117  void __init riscv_acpi_plic_platform_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

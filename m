Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA5312B6C
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Nov 2023 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMtajGVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698842195; x=1730378195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKCBtJQPrd3tjwTqat0v3n7AyGHJYQi5vMI0mIb3cMc=;
  b=cMtajGVZEw0OmNRgvTqyW6cSr+bNB8aAm671m6lYYsyEjVJLlWVjxGxz
   lsdoowkMBGVC5nb3Svxx0S1kXacheZHlk1WFYOt743P8rc+F4EYv14VPD
   l6Hc/t3JNYOGXNNH6F8oiF1lJ4GrKEAVuhVT5IOVog8PotegGMvm94Mlz
   BEP0dN0+fChCvUhRrOFJKO1wZT0tVRzE/0CuK34BAkMHqjLSga31GyRf3
   jnECwJuC7e1qs1Rg2mvued1ATeY7g94vCib++x4ctBhUVa3te1a9fEAQ4
   BqTpf11bzo7HHQ3iK2vw8mTR87dfMllRJQxt13vtHrTqrIWIIgNKwhXz2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="373526129"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="373526129"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 05:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="877853577"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="877853577"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2023 05:36:33 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyASV-0000o2-13;
	Wed, 01 Nov 2023 12:36:31 +0000
Date: Wed, 1 Nov 2023 20:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 14/21] irqchip: riscv-imsic: Add ACPI support
Message-ID: <202311012045.ic3WPGcE-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231025202344.581132-15-sunilvl@ventanamicro.com>
References: <20231025202344.581132-15-sunilvl@ventanamicro.com>
TO: Sunil V L <sunilvl@ventanamicro.com>

Hi Sunil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/acpi-bus pci/next pci/for-linus v6.6]
[cannot apply to tip/irq/core linus/master next-20231101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunil-V-L/arm64-PCI-Migrate-ACPI-related-functions-to-pci-acpi-c/20231026-042858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231025202344.581132-15-sunilvl%40ventanamicro.com
patch subject: [RFC PATCH v2 14/21] irqchip: riscv-imsic: Add ACPI support
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231101/202311012045.ic3WPGcE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311012045.ic3WPGcE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311012045.ic3WPGcE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-riscv-imsic-state.c:598:10: error: call to undeclared function 'acpi_get_intc_index_hartid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     598 |                 return acpi_get_intc_index_hartid(index, hartid);
         |                        ^
>> drivers/irqchip/irq-riscv-imsic-state.c:618:10: error: call to undeclared function 'acpi_get_imsic_mmio_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     618 |                 return acpi_get_imsic_mmio_info(index, res);
         |                        ^
   drivers/irqchip/irq-riscv-imsic-state.c:618:10: note: did you mean 'acpi_get_system_info'?
   include/acpi/acpixf.h:426:8: note: 'acpi_get_system_info' declared here
     426 |                             acpi_get_system_info(struct acpi_buffer
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   2 errors generated.


vim +/acpi_get_intc_index_hartid +598 drivers/irqchip/irq-riscv-imsic-state.c

33443eaa37d8aa Anup Patel 2023-10-23  590  
33443eaa37d8aa Anup Patel 2023-10-23  591  static int __init imsic_get_parent_hartid(struct fwnode_handle *fwnode,
33443eaa37d8aa Anup Patel 2023-10-23  592  					  u32 index, unsigned long *hartid)
33443eaa37d8aa Anup Patel 2023-10-23  593  {
33443eaa37d8aa Anup Patel 2023-10-23  594  	int rc;
33443eaa37d8aa Anup Patel 2023-10-23  595  	struct of_phandle_args parent;
33443eaa37d8aa Anup Patel 2023-10-23  596  
33443eaa37d8aa Anup Patel 2023-10-23  597  	if (!is_of_node(fwnode))
526591d2c1f700 Sunil V L  2023-10-26 @598  		return acpi_get_intc_index_hartid(index, hartid);
33443eaa37d8aa Anup Patel 2023-10-23  599  
33443eaa37d8aa Anup Patel 2023-10-23  600  	rc = of_irq_parse_one(to_of_node(fwnode), index, &parent);
33443eaa37d8aa Anup Patel 2023-10-23  601  	if (rc)
33443eaa37d8aa Anup Patel 2023-10-23  602  		return rc;
33443eaa37d8aa Anup Patel 2023-10-23  603  
33443eaa37d8aa Anup Patel 2023-10-23  604  	/*
33443eaa37d8aa Anup Patel 2023-10-23  605  	 * Skip interrupts other than external interrupts for
33443eaa37d8aa Anup Patel 2023-10-23  606  	 * current privilege level.
33443eaa37d8aa Anup Patel 2023-10-23  607  	 */
33443eaa37d8aa Anup Patel 2023-10-23  608  	if (parent.args[0] != RV_IRQ_EXT)
33443eaa37d8aa Anup Patel 2023-10-23  609  		return -EINVAL;
33443eaa37d8aa Anup Patel 2023-10-23  610  
33443eaa37d8aa Anup Patel 2023-10-23  611  	return riscv_of_parent_hartid(parent.np, hartid);
33443eaa37d8aa Anup Patel 2023-10-23  612  }
33443eaa37d8aa Anup Patel 2023-10-23  613  
33443eaa37d8aa Anup Patel 2023-10-23  614  static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
33443eaa37d8aa Anup Patel 2023-10-23  615  					  u32 index, struct resource *res)
33443eaa37d8aa Anup Patel 2023-10-23  616  {
33443eaa37d8aa Anup Patel 2023-10-23  617  	if (!is_of_node(fwnode))
526591d2c1f700 Sunil V L  2023-10-26 @618  		return acpi_get_imsic_mmio_info(index, res);
33443eaa37d8aa Anup Patel 2023-10-23  619  
33443eaa37d8aa Anup Patel 2023-10-23  620  	return of_address_to_resource(to_of_node(fwnode), index, res);
33443eaa37d8aa Anup Patel 2023-10-23  621  }
33443eaa37d8aa Anup Patel 2023-10-23  622  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

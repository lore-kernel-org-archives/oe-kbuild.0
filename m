Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB6F1D536
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Oct 2023 23:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQGehQG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698709319; x=1730245319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9DkyLiboS2AEqCDtVObi/QVxQGzcnYPI+Xq231onJk=;
  b=AQGehQG6bM2fUVdOjhI5Jxi3Kysg8os2U6T9+MboCdfh3DWSYgp1VC+f
   ffEx/3Bs8T47DkX7HULk4EkhxktNiTJMOXPzhvT+kdqQ9BfCGmumXlY0K
   3k8EO7c1wNNmLRGFFZYgepT9EA3yPax1vJNqpabnWdphFKvI1TNuvITew
   Q8GV+WOlFkdLEn+QXOXKuaAIZwldVGLvXRIqSTskACWkL+zYbJNAV4lfR
   ozTff6lQb6A3MDQmVvknvRnwG6pxbd2lcJq00LG8//me505UvDiv4Ed08
   RpVU1NnyJQ81qOQ5DH5sX53S3Rl1OCykn2XJb4NhegElMP6nT8AX43/nc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="391058317"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="391058317"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 16:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="8523971"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2023 16:41:58 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxbtL-000Df0-23;
	Mon, 30 Oct 2023 23:41:55 +0000
Date: Tue, 31 Oct 2023 07:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 20/21] ACPI: RISC-V: Create APLIC platform device
Message-ID: <202310310701.nob7BXRv-lkp@intel.com>
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
In-Reply-To: <20231025202344.581132-21-sunilvl@ventanamicro.com>
References: <20231025202344.581132-21-sunilvl@ventanamicro.com>
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
patch link:    https://lore.kernel.org/r/20231025202344.581132-21-sunilvl%40ventanamicro.com
patch subject: [RFC PATCH v2 20/21] ACPI: RISC-V: Create APLIC platform device
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231031/202310310701.nob7BXRv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310701.nob7BXRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310310701.nob7BXRv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/riscv/irq.c:103:13: warning: no previous prototype for 'riscv_acpi_aplic_platform_init' [-Wmissing-prototypes]
     103 | void __init riscv_acpi_aplic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_acpi_aplic_platform_init +103 drivers/acpi/riscv/irq.c

e501748dc32f47 Sunil V L 2023-10-26  102  
e501748dc32f47 Sunil V L 2023-10-26 @103  void __init riscv_acpi_aplic_platform_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

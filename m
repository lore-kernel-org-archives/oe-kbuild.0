Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27791FCB
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Oct 2022 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666876426; x=1698412426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZBUncKp2pUuy3joky5eTu+Z3QWTMhFe6FeCNSFmmUI=;
  b=go2QRUy5yXzLX0hcZgH/W3mXs5fx28w45hh7BD+IoVvu7oeKSSI5OLfs
   UJXbWqN8jWVbUmkPfigcqw3bDyY0G0Po5tzjC+2zzzK/ILFXiWhcsO/Ew
   Us61l0WLIkP0Ft/SV3cctK86wE2e4XLefAfb906wpKQOvXM92WM5lK8Rn
   Yy9dsabCcH8IIGFu25HUIA5RHU/Inmox9b3v5+rQdX/XdG+iGny1L3bwF
   iCLNs+uDcrFmAeUfvmH7GoF1maUxn+Om8/P67qHcS8pq8wtWlCvzQiX/I
   wazkEboypWkHqp995jjMge2OoEg2dhMvrGVuslwXuCQkMLvwWm9TQ7Vuh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334849990"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; 
   d="scan'208";a="334849990"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 06:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="877579297"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; 
   d="scan'208";a="877579297"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Oct 2022 06:13:38 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oo2hV-0008op-2I;
	Thu, 27 Oct 2022 13:13:37 +0000
Date: Thu, 27 Oct 2022 21:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 13/13] microblaze/PCI: Moving PCI iounmap and dependent
 code
Message-ID: <202210272153.WzxB83eP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/microblaze/pci/iomap.c:25:43: warning: Parameter 'address' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20221025065214.4663-14-thippeswamy.havalige@amd.com>
References: <20221025065214.4663-14-thippeswamy.havalige@amd.com>
TO: Thippeswamy Havalige <thippeswamy.havalige@amd.com>
TO: linux-pci@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: krzysztof.kozlowski@linaro.org
CC: bhelgaas@google.com
CC: michals@xilinx.com
CC: robh+dt@kernel.org
CC: lorenzo.pieralisi@arm.com
CC: bharat.kumar.gogada@amd.com
CC: Thippeswamy Havalige <thippeswamy.havalige@amd.com>

Hi Thippeswamy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v6.0]
[also build test WARNING on next-20221027]
[cannot apply to helgaas-pci/next linus/master v6.1-rc2 v6.1-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thippeswamy-Havalige/Remove-unused-microblaze-PCIe-bus-architecture/20221025-145713
patch link:    https://lore.kernel.org/r/20221025065214.4663-14-thippeswamy.havalige%40amd.com
patch subject: [PATCH 13/13] microblaze/PCI: Moving PCI iounmap and dependent code
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 80668bca114af3b6abdfc865101b9247d00add4f
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/microblaze/pci/iomap.c:25:43: warning: Parameter 'address' can be declared as pointer to const [constParameter]
   int pcibios_vaddr_is_ioport(void __iomem *address)
                                             ^

vim +/address +25 arch/microblaze/pci/iomap.c

80668bca114af3 Thippeswamy Havalige 2022-10-25  24  
80668bca114af3 Thippeswamy Havalige 2022-10-25 @25  int pcibios_vaddr_is_ioport(void __iomem *address)
80668bca114af3 Thippeswamy Havalige 2022-10-25  26  {
80668bca114af3 Thippeswamy Havalige 2022-10-25  27  	int ret = 0;
80668bca114af3 Thippeswamy Havalige 2022-10-25  28  	struct pci_controller *hose;
80668bca114af3 Thippeswamy Havalige 2022-10-25  29  	resource_size_t size;
80668bca114af3 Thippeswamy Havalige 2022-10-25  30  
80668bca114af3 Thippeswamy Havalige 2022-10-25  31  	spin_lock(&hose_spinlock);
80668bca114af3 Thippeswamy Havalige 2022-10-25  32  	list_for_each_entry(hose, &hose_list, list_node) {
80668bca114af3 Thippeswamy Havalige 2022-10-25  33  		size = pcibios_io_size(hose);
80668bca114af3 Thippeswamy Havalige 2022-10-25  34  		if (address >= hose->io_base_virt &&
80668bca114af3 Thippeswamy Havalige 2022-10-25  35  		    address < (hose->io_base_virt + size)) {
80668bca114af3 Thippeswamy Havalige 2022-10-25  36  			ret = 1;
80668bca114af3 Thippeswamy Havalige 2022-10-25  37  			break;
80668bca114af3 Thippeswamy Havalige 2022-10-25  38  		}
80668bca114af3 Thippeswamy Havalige 2022-10-25  39  	}
80668bca114af3 Thippeswamy Havalige 2022-10-25  40  	spin_unlock(&hose_spinlock);
80668bca114af3 Thippeswamy Havalige 2022-10-25  41  	return ret;
80668bca114af3 Thippeswamy Havalige 2022-10-25  42  }
80668bca114af3 Thippeswamy Havalige 2022-10-25  43  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

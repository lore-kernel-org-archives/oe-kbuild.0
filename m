Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B149E568A
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Dec 2022 21:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670363422; x=1701899422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KHPH0ZbMgSRfOCVPMeSbgeDWlYp9n2zmKIbWqXIRfxE=;
  b=N0Zak2DAoEQ5lwt+tsXDMAMlmfktxkzhubfEx0kLB4EC44goQp9j33TX
   viHCTRI68YxLIRGzOoriWyX0Ehtbq6gCLFrQPP0X4JYEbS6Y0S7aKp0tS
   J1Gl/8nl+E5Dy439QV7eUTGzdmFqsJw0ULzj0MUc/z4rjvW9P2CtvWGuB
   cwKjiJmT2gJSyAcqn7VPurQFMNK2LDr2efcgb61ffXAcnESad4zOO7gop
   tW5j9/OUIVeTscFJAsP7Rfs8TAwamjefmGo3NrvOL0xu42cXvBQMKTQ2S
   pYcKS4L8pgCNkLQ0SHJecnAhGDX6hioQi3N13GjBHpEEM79PUYriAHc5y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="378901771"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="378901771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 13:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="678900494"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="678900494"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Dec 2022 13:50:21 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p2fpU-0001Gz-1S;
	Tue, 06 Dec 2022 21:50:20 +0000
Date: Wed, 7 Dec 2022 05:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10213/13282] arch/microblaze/pci/iomap.c:25:43:
 warning: Parameter 'address' can be declared as pointer to const
 [constParameter]
Message-ID: <202212070540.jNOiOx7E-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thippeswamy Havalige <thippeswamy.havalige@amd.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5d562c48a21eeb029a8fd3f18e1b31fd83660474
commit: 5cfe469c2654c3a4dda8504b1209abdd8b379e95 [10213/13282] microblaze/PCI: Moving PCI iounmap and dependent code
:::::: branch date: 18 hours ago
:::::: commit date: 11 days ago
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5cfe469c2654c3a4dda8504b1209abdd8b379e95
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/microblaze/pci/iomap.c:25:43: warning: Parameter 'address' can be declared as pointer to const [constParameter]
   int pcibios_vaddr_is_ioport(void __iomem *address)
                                             ^

vim +/address +25 arch/microblaze/pci/iomap.c

5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  24  
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25 @25  int pcibios_vaddr_is_ioport(void __iomem *address)
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  26  {
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  27  	int ret = 0;
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  28  	struct pci_controller *hose;
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  29  	resource_size_t size;
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  30  
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  31  	spin_lock(&hose_spinlock);
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  32  	list_for_each_entry(hose, &hose_list, list_node) {
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  33  		size = pcibios_io_size(hose);
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  34  		if (address >= hose->io_base_virt &&
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  35  		    address < (hose->io_base_virt + size)) {
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  36  			ret = 1;
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  37  			break;
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  38  		}
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  39  	}
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  40  	spin_unlock(&hose_spinlock);
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  41  	return ret;
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  42  }
5cfe469c2654c3 Thippeswamy Havalige 2022-10-25  43  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

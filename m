Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF9415A8
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Dec 2022 03:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671680988; x=1703216988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uV+wZySXPGK481KthkPasqgZW2H+lWbnLIN7CTLWIAE=;
  b=GSYj4dq+pXrd5nAUiG8fKYKpGAnJ6+nWPBNkCxXyoxkWATo3uijoqg2m
   UFSp6KWhQYws4tsQY7o2yGxXuC4e1ZF6yOddGW3svP0eyCeqWxSOlw8pZ
   Ss4nqeC2EsK9UaGvfXVSkdXD+6dLiRYpnF2QgSGbNf5yH7fpEqWGC4n3z
   WmK2MPB+imv0UiJofsjbuIcqTTCT6dRGUvLOAmvh+9JxBLBiQu2c6hJe1
   wSxA5L5ARZdHjhOJz8StRscv4oUqrIKB66MnnI9wirws6gd8rA4qMTEQh
   nn9u1ioY+PVkUK3viFYolxRRB8lZ5zO+XSbFTpjCrcMfACydrGxcNhrgS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="382260102"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="382260102"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 19:49:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="720159962"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="720159962"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Dec 2022 19:49:46 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8CaY-000BDI-15;
	Thu, 22 Dec 2022 03:49:46 +0000
Date: Thu, 22 Dec 2022 11:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/microblaze/pci/iomap.c:25:43: warning: Parameter 'address' can
 be declared as pointer to const [constParameter]
Message-ID: <202212221126.6iPxsezV-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Thippeswamy Havalige <thippeswamy.havalige@amd.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a924817d2ed9396401e0557c6134276d2e26382
commit: 5cfe469c2654c3a4dda8504b1209abdd8b379e95 microblaze/PCI: Moving PCI iounmap and dependent code
date:   4 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 weeks ago
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

Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAC2192
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Dec 2022 23:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671059878; x=1702595878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=29xmQ5uzQA6mhk8M/YPHx4TbqfdDyD2mkqbzKFmmSIo=;
  b=jIr16Vltkgt1qUInBIDr6N0mQv0u44aniyV8vy+Do45Tpbfx8xK48oWR
   SxibZK/4ZZwu4QEUGq2rvccuGfClHbKkByANxIYHOOVKUlZeXZ9/HKy5r
   PHd8RJBZ1pAgC0/UKDj+mvZhGBbo+JWJ01LP2LLEU8EDmQp4nDthHms5H
   SuC83bkecItahompG5fnfGBzKGsCNClGJ6cLqN8/n057IGYwJ39ch4gTj
   YCUtox7qYxcfUHq/KjIpEQxv2QzYN7tPNjgmf1pkHTwKIq3bA9jMCFmTq
   PFf3+aNtFOBrtFTUK3CmY/72wTHa+5CrnFoLbULlVlXEmkkExN7GV7fxL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="345616578"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; 
   d="scan'208";a="345616578"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 15:17:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="894503373"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; 
   d="scan'208";a="894503373"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Dec 2022 15:17:30 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5b0D-0005sM-1t;
	Wed, 14 Dec 2022 23:17:29 +0000
Date: Thu, 15 Dec 2022 07:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/s390/kernel/nmi.c:109:26: warning: Parameter 'mcesad' can be
 declared as pointer to const [constParameter]
Message-ID: <202212150733.yBsIYggi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/s390/kernel/nmi.c:109:26: warning: Parameter 'mcesad' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f1f5caed5bfadd1cc8bdb0563eb8874dc3573ca
commit: c7ed509b21b6566990ff39a6744cd5e214b5dca9 s390/nmi: disable interrupts on extended save area update
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c7ed509b21b6566990ff39a6744cd5e214b5dca9
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/s390/pci/pci_bus.c:409:5: warning: Redundant initialization for 'rc'. The initialized value is overwritten before it is read. [redundantInitialization]
    rc = zpci_bus_add_device(zbus, zdev);
       ^
   arch/s390/pci/pci_bus.c:383:9: note: rc is initialized
    int rc = -EBADF;
           ^
   arch/s390/pci/pci_bus.c:409:5: note: rc is overwritten
    rc = zpci_bus_add_device(zbus, zdev);
       ^
>> arch/s390/kernel/nmi.c:109:26: warning: Parameter 'mcesad' can be declared as pointer to const [constParameter]
   void nmi_free_mcesa(u64 *mcesad)
                            ^

vim +/mcesad +109 arch/s390/kernel/nmi.c

6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  108  
c7ed509b21b656 arch/s390/kernel/nmi.c  Alexander Gordeev  2021-12-10 @109  void nmi_free_mcesa(u64 *mcesad)
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  110  {
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  111  	if (!nmi_needs_mcesa())
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  112  		return;
c7ed509b21b656 arch/s390/kernel/nmi.c  Alexander Gordeev  2021-12-10  113  	kmem_cache_free(mcesa_cache, __va(*mcesad & MCESA_ORIGIN_MASK));
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  114  }
77fa22450de00d drivers/s390/s390mach.c Heiko Carstens     2005-06-25  115  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC2D23AE
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Dec 2022 06:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671691280; x=1703227280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WtUBZY/Nvia01LgNVzAjLsC6sv/xYxLEa0CzUDPaOvU=;
  b=d4DnoIB5R2ovWU7gc3jW5g5t8yOFo5DdOwlXZFaSk8uo1PZOQ509/8wU
   e5eZA8o6E8SgEQl6GQEL01q+jUjhUH9JI4O6Bs/hn0aMeuV1h3BFJWIYs
   4fmsKGBxGqgAXoMPC5e+w5SuwaHGXRGlMNrS+p4HYs2tL3Wxx7RVYSgoy
   ltfJ5sxjsQXaVbcHYGLabzM9exh3FkPy/TkJnief8FzzRMi6DTM4LeS7U
   snywftb1QQiNOc1gL3s79ZncOY/k+tAFyQYWzjF3mKYJraB7QsV8zSy5y
   p2qcNcb7qzz5txaD42PEJHvoEbef6gtFTW5hoFXsx0FTrbWlmRPze3F8i
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="317695626"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="317695626"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 22:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="740435415"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="740435415"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2022 22:41:06 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8FGL-000BK2-2E;
	Thu, 22 Dec 2022 06:41:05 +0000
Date: Thu, 22 Dec 2022 14:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/mm/dma-mapping.c:77:57: warning: Parameter 'virt' can be
 declared as pointer to const [constParameter]
Message-ID: <202212221400.ILMdzV5Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm/mm/dma-mapping.c:77:57: warning: Parameter 'virt' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d2f6060fe4c3b49d0cdc1dce1c99296f33379c8
commit: ae626eb97376148bb63c3f3ca9517fde0f39bec3 ARM/dma-mapping: use dma-direct unconditionally
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ae626eb97376148bb63c3f3ca9517fde0f39bec3
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm/mm/dma-mapping.c:77:57: warning: Parameter 'virt' can be declared as pointer to const [constParameter]
   static struct arm_dma_buffer *arm_dma_buffer_find(void *virt)
                                                           ^
>> arch/arm/mm/dma-mapping.c:84:12: warning: Uninitialized variable: buf->virt [uninitvar]
     if (buf->virt == virt) {
              ^

vim +/virt +77 arch/arm/mm/dma-mapping.c

19e6e5e5392bd6 Rabin Vincent 2016-03-03  76  
19e6e5e5392bd6 Rabin Vincent 2016-03-03 @77  static struct arm_dma_buffer *arm_dma_buffer_find(void *virt)
19e6e5e5392bd6 Rabin Vincent 2016-03-03  78  {
19e6e5e5392bd6 Rabin Vincent 2016-03-03  79  	struct arm_dma_buffer *buf, *found = NULL;
19e6e5e5392bd6 Rabin Vincent 2016-03-03  80  	unsigned long flags;
19e6e5e5392bd6 Rabin Vincent 2016-03-03  81  
19e6e5e5392bd6 Rabin Vincent 2016-03-03  82  	spin_lock_irqsave(&arm_dma_bufs_lock, flags);
19e6e5e5392bd6 Rabin Vincent 2016-03-03  83  	list_for_each_entry(buf, &arm_dma_bufs, list) {
19e6e5e5392bd6 Rabin Vincent 2016-03-03 @84  		if (buf->virt == virt) {
19e6e5e5392bd6 Rabin Vincent 2016-03-03  85  			list_del(&buf->list);
19e6e5e5392bd6 Rabin Vincent 2016-03-03  86  			found = buf;
19e6e5e5392bd6 Rabin Vincent 2016-03-03  87  			break;
19e6e5e5392bd6 Rabin Vincent 2016-03-03  88  		}
19e6e5e5392bd6 Rabin Vincent 2016-03-03  89  	}
19e6e5e5392bd6 Rabin Vincent 2016-03-03  90  	spin_unlock_irqrestore(&arm_dma_bufs_lock, flags);
19e6e5e5392bd6 Rabin Vincent 2016-03-03  91  	return found;
19e6e5e5392bd6 Rabin Vincent 2016-03-03  92  }
19e6e5e5392bd6 Rabin Vincent 2016-03-03  93  

:::::: The code at line 77 was first introduced by commit
:::::: 19e6e5e5392bd646c93d9e2c7b2b58c8558cb041 ARM: 8547/1: dma-mapping: store buffer information

:::::: TO: Rabin Vincent <rabin@rab.in>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

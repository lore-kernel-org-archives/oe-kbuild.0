Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6CD366
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Dec 2022 06:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671951359; x=1703487359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndlbtk0zRs1f0FprWQzGymS5GS/rmJjEWn5zuphiS5w=;
  b=W6tOpVnf2FzaqrtqKP2l02jFw5iNKBuw9l9dND/Znr6b6WV/DeybeocC
   gYEKkrhA6TfRTM90b32vyOz5Bplg7yDxKsKtnh5GCi7tOEicFNZgL+/I2
   vBeSmotO5Mmuy2kbiGddTUZ3Oldsb0b7mk6LEqRW0FywmHPytEuUIprDi
   DRx9urWZ8XwznOe8bxd+KtgdLIi+QIkkJE2qXlzNiredrqBvWbOr1mBQM
   WVDHFO8OYixgajSg3wc3KOyhSyqnICQh6046XHMdV32CbDGcQSWHPkbWO
   74OxoeazB2hYY4PL4FFJk9lo85jgQjHOvJXErK2oo+Hu58p1USwAJ1BIk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="308197427"
X-IronPort-AV: E=Sophos;i="5.96,272,1665471600"; 
   d="scan'208";a="308197427"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2022 22:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="776657434"
X-IronPort-AV: E=Sophos;i="5.96,272,1665471600"; 
   d="scan'208";a="776657434"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Dec 2022 22:55:57 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p9KvM-000DnT-1c;
	Sun, 25 Dec 2022 06:55:56 +0000
Date: Sun, 25 Dec 2022 14:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/mm/dma-mapping.c:77:57: warning: Parameter 'virt' can be
 declared as pointer to const [constParameter]
Message-ID: <202212251402.VxyVb0Ca-lkp@intel.com>
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
head:   72a85e2b0a1e1e6fb4ee51ae902730212b2de25c
commit: ae626eb97376148bb63c3f3ca9517fde0f39bec3 ARM/dma-mapping: use dma-direct unconditionally
date:   6 months ago
:::::: branch date: 32 hours ago
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

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0FC12F
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Aug 2023 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692038453; x=1723574453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GY1JxChYIML1/GjOOkH6IS/iQcmEeyVHxyKZgZd11gE=;
  b=f6r2fRXwAE27+LRfHIKfddpImsKdN1oN74Zulsx5ascedjZCE7w7ItQa
   rag+E6sSDYauQLGIvT1dCJEFMik03TGG0d3vTVyfnfW35wm6Z+cndcYs4
   AmRnwg0N3XkP1kdKtMoVLSDFVpWONrAKi5eUCtxovo0WJxkw4dVU6l7kF
   sq6R69eOZBTKBIQ3JSHXeBWhgcTc2jNKcoLJ5/R+Nm4JeETioSzU51pG7
   SJFHJ5u10jqS+JKZqEN/KhB6YC7yMruGdzNrWxhpEX8txSY0YiVHrWujL
   pV/W5cGwMLtDslI3oYQSEc5VYFEbtur48kpoK8fDPcSgcnmBag3by6G3G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="352439107"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="352439107"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 11:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="877067533"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2023 11:40:43 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVcUY-0000Lt-28;
	Mon, 14 Aug 2023 18:40:38 +0000
Date: Tue, 15 Aug 2023 02:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4030/8441]
 drivers/net/wireless/mediatek/mt76/mt792x_mac.c:362
 mt792x_pm_power_save_work() warn: can 'dev->fw_assert' even be NULL?
Message-ID: <202308150251.nxMwOnTa-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>
CC: Deren Wu <deren.wu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: c21a7f9f406bba3f7ee8ce788ef48592c8c3ba8f [4030/8441] wifi: mt76: mt7921: move shared runtime-pm code on mt792x-lib
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-m001-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150251.nxMwOnTa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150251.nxMwOnTa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308150251.nxMwOnTa-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt792x_mac.c:362 mt792x_pm_power_save_work() warn: can 'dev->fw_assert' even be NULL?

vim +362 drivers/net/wireless/mediatek/mt76/mt792x_mac.c

c21a7f9f406bba Lorenzo Bianconi 2023-06-28  348  
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  349  void mt792x_pm_power_save_work(struct work_struct *work)
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  350  {
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  351  	struct mt792x_dev *dev;
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  352  	unsigned long delta;
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  353  	struct mt76_phy *mphy;
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  354  
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  355  	dev = (struct mt792x_dev *)container_of(work, struct mt792x_dev,
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  356  						pm.ps_work.work);
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  357  	mphy = dev->phy.mt76;
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  358  
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  359  	delta = dev->pm.idle_timeout;
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  360  	if (test_bit(MT76_HW_SCANNING, &mphy->state) ||
c21a7f9f406bba Lorenzo Bianconi 2023-06-28  361  	    test_bit(MT76_HW_SCHED_SCANNING, &mphy->state) ||
c21a7f9f406bba Lorenzo Bianconi 2023-06-28 @362  	    dev->fw_assert)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

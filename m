Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE39723D6
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhF/9VrJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697181625; x=1728717625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8KLkf3UbLeJ0iQ3DzLLg9LUF08CEtLc5dqzvdPgvtK8=;
  b=OhF/9VrJf07hJCU/4KblS7pNn8OPE4kKd6cIlNDACvEpv0Q9kmzDhdEN
   tlJFNAXIrP71FlBf2SnQVFzMBA/ETQo4WCGHv+r2KzaThFknxzZ8MVn9s
   y3MgJ11H1da4JaR1+WVNpegfL+1bYxvKPWzsGq8PruSp0GXmiQ45SUfPy
   8S/29Ju3YdKrK0akReUW+bxhdM8e8WTFEbdzzJBHv7tAynR3v5bC467wJ
   LGuJd27iCWSEv+9Qz+OGrGDUOKj91aGTXviU1vzwPhGvOV85I0R+r/l17
   vmBrzX/GLtG88y/kCmwIE1YkfJJnF2ix4bN2dFeEN9KymRMNuSnVO3CT5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388984979"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="388984979"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 00:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="784042008"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="784042008"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Oct 2023 00:20:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrCT7-0004SH-0n;
	Fri, 13 Oct 2023 07:20:21 +0000
Date: Fri, 13 Oct 2023 15:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt792x_mac.c:362
 mt792x_pm_power_save_work() warn: can 'dev->fw_assert' even be NULL?
Message-ID: <202310131526.Jtv5M5uR-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>
CC: Deren Wu <deren.wu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce583d5fb9d3f4e20473b9d5619d51ea3cc92283
commit: c21a7f9f406bba3f7ee8ce788ef48592c8c3ba8f wifi: mt76: mt7921: move shared runtime-pm code on mt792x-lib
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20231011 (https://download.01.org/0day-ci/archive/20231013/202310131526.Jtv5M5uR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131526.Jtv5M5uR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310131526.Jtv5M5uR-lkp@intel.com/

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

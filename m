Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3038D1361
	for <oe-kbuild@lists.linux.dev>; Mon,  8 May 2023 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683552995; x=1715088995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uMVeJsWLaM4ZD871PZV/nR8mkxUVRowSmrw6RPr27sk=;
  b=NG1p65dy8GKaxKL6gjYy2uryzcHtIP+s5kF7rgCjMvi1THiIklRvBsxD
   p1o2s5qzFzRKPu9CdLNIJChxOJaaNqn31CWyoeluUBPBxQ4Rp6ENXKqIH
   vo2l4ckHb7a4UplD8QpizONVlY6iGfddVn6OUW/Ad1/VgtzhI177pfOON
   AzFtIx1OTgaNWyU2AqvB/VNOu42Nd8i29z7Cdy1wqk8RBw8xU3YIwaig+
   G6WzLFLCMb1rFVsYw6Cw+sc5hw71BIhuKxtBgE1pyeS20lpZbkuex7NXv
   s9tss0TurPlvi08LMZTOGIippSQhxgPgM0rPullqBAFYgYOuHTkyewfHd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="330005953"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="330005953"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 06:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="788097379"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="788097379"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 May 2023 06:36:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pw12W-0001FJ-3D;
	Mon, 08 May 2023 13:36:33 +0000
Date: Mon, 8 May 2023 21:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/leds/rgb/leds-mt6370-rgb.c:605 mt6370_mc_pattern_clear()
 error: uninitialized symbol 'ret'.
Message-ID: <202305082132.vKDjBKmy-lkp@intel.com>
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
TO: ChiYuan Huang <cy_huang@richtek.com>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac9a78681b921877518763ba0e89202254349d1b
commit: 4793b19ef0dc40b4b8fdae9a48f73c818e490046 leds: rgb: mt6370: Fix implicit declaration for FIELD_GET
date:   7 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 weeks ago
config: ia64-randconfig-m031-20230507 (https://download.01.org/0day-ci/archive/20230508/202305082132.vKDjBKmy-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305082132.vKDjBKmy-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-mt6370-rgb.c:605 mt6370_mc_pattern_clear() error: uninitialized symbol 'ret'.

vim +/ret +605 drivers/leds/rgb/leds-mt6370-rgb.c

5c38376ef5b46d ChiYuan Huang 2023-03-10  584  
5c38376ef5b46d ChiYuan Huang 2023-03-10  585  static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
5c38376ef5b46d ChiYuan Huang 2023-03-10  586  {
5c38376ef5b46d ChiYuan Huang 2023-03-10  587  	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
5c38376ef5b46d ChiYuan Huang 2023-03-10  588  	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
5c38376ef5b46d ChiYuan Huang 2023-03-10  589  	struct mt6370_priv *priv = led->priv;
5c38376ef5b46d ChiYuan Huang 2023-03-10  590  	struct mc_subled *subled;
5c38376ef5b46d ChiYuan Huang 2023-03-10  591  	int i, ret;
5c38376ef5b46d ChiYuan Huang 2023-03-10  592  
5c38376ef5b46d ChiYuan Huang 2023-03-10  593  	mutex_lock(&led->priv->lock);
5c38376ef5b46d ChiYuan Huang 2023-03-10  594  
5c38376ef5b46d ChiYuan Huang 2023-03-10  595  	for (i = 0; i < mccdev->num_colors; i++) {
5c38376ef5b46d ChiYuan Huang 2023-03-10  596  		subled = mccdev->subled_info + i;
5c38376ef5b46d ChiYuan Huang 2023-03-10  597  
5c38376ef5b46d ChiYuan Huang 2023-03-10  598  		ret = mt6370_set_led_mode(priv, subled->channel, MT6370_LED_REG_MODE);
5c38376ef5b46d ChiYuan Huang 2023-03-10  599  		if (ret)
5c38376ef5b46d ChiYuan Huang 2023-03-10  600  			break;
5c38376ef5b46d ChiYuan Huang 2023-03-10  601  	}
5c38376ef5b46d ChiYuan Huang 2023-03-10  602  
5c38376ef5b46d ChiYuan Huang 2023-03-10  603  	mutex_unlock(&led->priv->lock);
5c38376ef5b46d ChiYuan Huang 2023-03-10  604  
5c38376ef5b46d ChiYuan Huang 2023-03-10 @605  	return ret;
5c38376ef5b46d ChiYuan Huang 2023-03-10  606  }
5c38376ef5b46d ChiYuan Huang 2023-03-10  607  

:::::: The code at line 605 was first introduced by commit
:::::: 5c38376ef5b46d3091cc9485b95dd70db20f0089 leds: rgb: mt6370: Add MediaTek MT6370 current sink type LED Indicator support

:::::: TO: ChiYuan Huang <cy_huang@richtek.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45714EC9
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 04:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683779095; x=1715315095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pn4cIIHOuokmcBFsV/l6btKd7CbVFf35n3/bfWHAaYg=;
  b=j6fK0G4VMdiR6r95Z4VIk/DlHl4NvcVpXxVFEu9D+qaTrYYPWwCw17Iu
   Wn8ASKR6v8+/Y8V6ZQclyGn3qYGDFoIXf5Tje0bJ7Cb4zDhzgS/LJWHmx
   dmxnlo6ez71i8BTwgXCr+YLThfedrHuCn7bqFOGbG6ExZrBYCFpt/2tPj
   v9KgJGYcmqaPjxyq0xtR4/tWm8X3/cxjxicNamZ5Q19f7EDsgMD3kfKjs
   9GOdvSH61EWaowONSp41p2yLV52i3K8y6QP5gBs1V/SdL1D40kwPiqXrA
   pmO0JxxUnz3TEQk+FU9HPuvA/GjZb/vWqNizqKD2Fcs0GzL8uUHJ4t13R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="349225853"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="349225853"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 21:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="873801439"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="873801439"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2023 21:24:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwxrI-0003lM-1Q;
	Thu, 11 May 2023 04:24:52 +0000
Date: Thu, 11 May 2023 12:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/power/supply/rt9467-charger.c:1026
 rt9467_request_interrupt() warn: passing zero to 'dev_err_probe'
Message-ID: <202305111228.bHLWU6bq-lkp@intel.com>
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
TO: ChiaEn Wu <chiaen_wu@richtek.com>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: ChiYuan Huang <cy_huang@richtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d295b66a7b66ed504a827b58876ad9ea48c0f4a8
commit: 6f7f70e3a8dd1fbce95eaea2a8eff70f01363c00 power: supply: rt9467: Add Richtek RT9467 charger driver
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: m68k-randconfig-m031-20230511 (https://download.01.org/0day-ci/archive/20230511/202305111228.bHLWU6bq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305111228.bHLWU6bq-lkp@intel.com/

smatch warnings:
drivers/power/supply/rt9467-charger.c:1026 rt9467_request_interrupt() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1026 drivers/power/supply/rt9467-charger.c

6f7f70e3a8dd1f ChiaEn Wu 2023-01-03   994  
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03   995  static int rt9467_request_interrupt(struct rt9467_chg_data *data)
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03   996  {
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03   997  	struct device *dev = data->dev;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03   998  	static const struct {
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03   999  		const char *name;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1000  		int hwirq;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1001  		irq_handler_t handler;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1002  	} rt9467_exclusive_irqs[] = {
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1003  		RT9467_IRQ_DESC(statc, statc, RT9467_IRQ_TS_STATC),
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1004  		RT9467_IRQ_DESC(wdt, wdt, RT9467_IRQ_WDTMR),
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1005  		RT9467_IRQ_DESC(attach, usb_state, RT9467_IRQ_ATTACH),
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1006  		RT9467_IRQ_DESC(detach,	usb_state, RT9467_IRQ_DETACH),
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1007  		RT9467_IRQ_DESC(aiclmeas, aiclmeas, RT9467_IRQ_CHG_AICLM),
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1008  	}, rt9466_exclusive_irqs[] = {
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1009  		RT9467_IRQ_DESC(statc, statc, RT9467_IRQ_TS_STATC),
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1010  		RT9467_IRQ_DESC(wdt, wdt, RT9467_IRQ_WDTMR),
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1011  		RT9467_IRQ_DESC(aiclmeas, aiclmeas, RT9467_IRQ_CHG_AICLM),
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1012  	}, *chg_irqs;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1013  	int num_chg_irqs, i, virq, ret;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1014  
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1015  	if (data->vid == RT9466_VID) {
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1016  		chg_irqs = rt9466_exclusive_irqs;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1017  		num_chg_irqs = ARRAY_SIZE(rt9466_exclusive_irqs);
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1018  	} else {
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1019  		chg_irqs = rt9467_exclusive_irqs;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1020  		num_chg_irqs = ARRAY_SIZE(rt9467_exclusive_irqs);
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1021  	}
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1022  
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1023  	for (i = 0; i < num_chg_irqs; i++) {
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1024  		virq = regmap_irq_get_virq(data->irq_chip_data, chg_irqs[i].hwirq);
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1025  		if (virq <= 0)
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03 @1026  			return dev_err_probe(dev, virq, "Failed to get (%s) irq\n",
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1027  					     chg_irqs[i].name);
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1028  
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1029  		ret = devm_request_threaded_irq(dev, virq, NULL, chg_irqs[i].handler,
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1030  						IRQF_ONESHOT, chg_irqs[i].name, data);
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1031  		if (ret)
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1032  			return dev_err_probe(dev, ret, "Failed to request (%s) irq\n",
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1033  					     chg_irqs[i].name);
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1034  	}
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1035  
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1036  	return 0;
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1037  }
6f7f70e3a8dd1f ChiaEn Wu 2023-01-03  1038  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

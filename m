Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE6B17DB
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 03:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679627817; x=1711163817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0axmAtkiVnU4UL9rAi3axMdTV8SuoF67+BeGhYKta3A=;
  b=Mnf9wauNuER6XrXz9VFRx2T7JagdWZWEM/UjabRwbsH47/0MwJvLQ7JE
   bt+i7zvtmuXAzBSTKIufr7pfjj9PIEhBWCK5xPArjBIr0MR0yfqz0WkXj
   N7vicrDhUDvtpEFeGeGNa1Ig2GSb8grEZAjeGb6P0e/OQR21g735mW7fD
   kHTfQMW1MRwbD4mnGfB6l3RqZ8KR+ptTzv/djFvYWuK4bzQLYSAX8ODzh
   +wS90JSGoGobp+QAc3rGm30Lf3Lh+Dq/3CMuGEoZjxGC11AmJC4k4Xe05
   mry1rhgiyWGhNutWbuDcNJarChVc02cFqZFLKUfcr8WMAeOP5nA2zzjTA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="337192117"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="337192117"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 20:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712923537"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="712923537"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 20:16:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfXvD-000Eva-0Q;
	Fri, 24 Mar 2023 03:16:55 +0000
Date: Fri, 24 Mar 2023 11:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-synquacer.c:618 synquacer_i2c_probe() warn:
 'i2c->pclk' from clk_prepare_enable() not released on lines:
 572,577,581,587.
Message-ID: <202303241155.QpI6r7yC-lkp@intel.com>
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
TO: Yang Yingliang <yangyingliang@huawei.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Stefan Roese <sr@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1e760fa3596e8c7f08412712c168288b79670d78
commit: a2537c98a8a3b57002e54a262d180b9490bc7190 i2c: mt7621: fix missing clk_disable_unprepare() on error in mtk_i2c_probe()
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-m041-20230322 (https://download.01.org/0day-ci/archive/20230324/202303241155.QpI6r7yC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303241155.QpI6r7yC-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-synquacer.c:618 synquacer_i2c_probe() warn: 'i2c->pclk' from clk_prepare_enable() not released on lines: 572,577,581,587.

vim +618 drivers/i2c/busses/i2c-synquacer.c

0d676a6c439028 Ard Biesheuvel  2018-04-03  534  
0d676a6c439028 Ard Biesheuvel  2018-04-03  535  static int synquacer_i2c_probe(struct platform_device *pdev)
0d676a6c439028 Ard Biesheuvel  2018-04-03  536  {
0d676a6c439028 Ard Biesheuvel  2018-04-03  537  	struct synquacer_i2c *i2c;
0d676a6c439028 Ard Biesheuvel  2018-04-03  538  	u32 bus_speed;
0d676a6c439028 Ard Biesheuvel  2018-04-03  539  	int ret;
0d676a6c439028 Ard Biesheuvel  2018-04-03  540  
0d676a6c439028 Ard Biesheuvel  2018-04-03  541  	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
0d676a6c439028 Ard Biesheuvel  2018-04-03  542  	if (!i2c)
0d676a6c439028 Ard Biesheuvel  2018-04-03  543  		return -ENOMEM;
0d676a6c439028 Ard Biesheuvel  2018-04-03  544  
0d676a6c439028 Ard Biesheuvel  2018-04-03  545  	bus_speed = i2c_acpi_find_bus_speed(&pdev->dev);
0d676a6c439028 Ard Biesheuvel  2018-04-03  546  	if (!bus_speed)
0d676a6c439028 Ard Biesheuvel  2018-04-03  547  		device_property_read_u32(&pdev->dev, "clock-frequency",
0d676a6c439028 Ard Biesheuvel  2018-04-03  548  					 &bus_speed);
0d676a6c439028 Ard Biesheuvel  2018-04-03  549  
0d676a6c439028 Ard Biesheuvel  2018-04-03  550  	device_property_read_u32(&pdev->dev, "socionext,pclk-rate",
0d676a6c439028 Ard Biesheuvel  2018-04-03  551  				 &i2c->pclkrate);
0d676a6c439028 Ard Biesheuvel  2018-04-03  552  
0d676a6c439028 Ard Biesheuvel  2018-04-03  553  	i2c->pclk = devm_clk_get(&pdev->dev, "pclk");
45586c7078d42b Masahiro Yamada 2020-02-03  554  	if (PTR_ERR(i2c->pclk) == -EPROBE_DEFER)
0d676a6c439028 Ard Biesheuvel  2018-04-03  555  		return -EPROBE_DEFER;
0d676a6c439028 Ard Biesheuvel  2018-04-03  556  	if (!IS_ERR_OR_NULL(i2c->pclk)) {
0d676a6c439028 Ard Biesheuvel  2018-04-03  557  		dev_dbg(&pdev->dev, "clock source %p\n", i2c->pclk);
0d676a6c439028 Ard Biesheuvel  2018-04-03  558  
0d676a6c439028 Ard Biesheuvel  2018-04-03  559  		ret = clk_prepare_enable(i2c->pclk);
0d676a6c439028 Ard Biesheuvel  2018-04-03  560  		if (ret) {
0d676a6c439028 Ard Biesheuvel  2018-04-03  561  			dev_err(&pdev->dev, "failed to enable clock (%d)\n",
0d676a6c439028 Ard Biesheuvel  2018-04-03  562  				ret);
0d676a6c439028 Ard Biesheuvel  2018-04-03  563  			return ret;
0d676a6c439028 Ard Biesheuvel  2018-04-03  564  		}
0d676a6c439028 Ard Biesheuvel  2018-04-03  565  		i2c->pclkrate = clk_get_rate(i2c->pclk);
0d676a6c439028 Ard Biesheuvel  2018-04-03  566  	}
0d676a6c439028 Ard Biesheuvel  2018-04-03  567  
0d676a6c439028 Ard Biesheuvel  2018-04-03  568  	if (i2c->pclkrate < SYNQUACER_I2C_MIN_CLK_RATE ||
0d676a6c439028 Ard Biesheuvel  2018-04-03  569  	    i2c->pclkrate > SYNQUACER_I2C_MAX_CLK_RATE) {
0d676a6c439028 Ard Biesheuvel  2018-04-03  570  		dev_err(&pdev->dev, "PCLK missing or out of range (%d)\n",
0d676a6c439028 Ard Biesheuvel  2018-04-03  571  			i2c->pclkrate);
0d676a6c439028 Ard Biesheuvel  2018-04-03  572  		return -EINVAL;
0d676a6c439028 Ard Biesheuvel  2018-04-03  573  	}
0d676a6c439028 Ard Biesheuvel  2018-04-03  574  
e0442d76213981 Dejin Zheng     2020-04-09  575  	i2c->base = devm_platform_ioremap_resource(pdev, 0);
0d676a6c439028 Ard Biesheuvel  2018-04-03  576  	if (IS_ERR(i2c->base))
0d676a6c439028 Ard Biesheuvel  2018-04-03  577  		return PTR_ERR(i2c->base);
0d676a6c439028 Ard Biesheuvel  2018-04-03  578  
0d676a6c439028 Ard Biesheuvel  2018-04-03  579  	i2c->irq = platform_get_irq(pdev, 0);
e42688ed5cf593 Dejin Zheng     2020-04-16  580  	if (i2c->irq < 0)
8d744da241b81f Sergey Shtylyov 2021-08-12  581  		return i2c->irq;
0d676a6c439028 Ard Biesheuvel  2018-04-03  582  
0d676a6c439028 Ard Biesheuvel  2018-04-03  583  	ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
0d676a6c439028 Ard Biesheuvel  2018-04-03  584  			       0, dev_name(&pdev->dev), i2c);
0d676a6c439028 Ard Biesheuvel  2018-04-03  585  	if (ret < 0) {
0d676a6c439028 Ard Biesheuvel  2018-04-03  586  		dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
0d676a6c439028 Ard Biesheuvel  2018-04-03  587  		return ret;
0d676a6c439028 Ard Biesheuvel  2018-04-03  588  	}
0d676a6c439028 Ard Biesheuvel  2018-04-03  589  
0d676a6c439028 Ard Biesheuvel  2018-04-03  590  	i2c->state = STATE_IDLE;
0d676a6c439028 Ard Biesheuvel  2018-04-03  591  	i2c->dev = &pdev->dev;
0d676a6c439028 Ard Biesheuvel  2018-04-03  592  	i2c->adapter = synquacer_i2c_ops;
0d676a6c439028 Ard Biesheuvel  2018-04-03  593  	i2c_set_adapdata(&i2c->adapter, i2c);
0d676a6c439028 Ard Biesheuvel  2018-04-03  594  	i2c->adapter.dev.parent = &pdev->dev;
95e0cf3caeb11e Ard Biesheuvel  2019-04-30  595  	i2c->adapter.dev.of_node = pdev->dev.of_node;
95e0cf3caeb11e Ard Biesheuvel  2019-04-30  596  	ACPI_COMPANION_SET(&i2c->adapter.dev, ACPI_COMPANION(&pdev->dev));
0d676a6c439028 Ard Biesheuvel  2018-04-03  597  	i2c->adapter.nr = pdev->id;
0d676a6c439028 Ard Biesheuvel  2018-04-03  598  	init_completion(&i2c->completion);
0d676a6c439028 Ard Biesheuvel  2018-04-03  599  
90224e6468e15d Andy Shevchenko 2020-03-24  600  	if (bus_speed < I2C_MAX_FAST_MODE_FREQ)
0d676a6c439028 Ard Biesheuvel  2018-04-03  601  		i2c->speed_khz = SYNQUACER_I2C_SPEED_SM;
0d676a6c439028 Ard Biesheuvel  2018-04-03  602  	else
0d676a6c439028 Ard Biesheuvel  2018-04-03  603  		i2c->speed_khz = SYNQUACER_I2C_SPEED_FM;
0d676a6c439028 Ard Biesheuvel  2018-04-03  604  
0d676a6c439028 Ard Biesheuvel  2018-04-03  605  	synquacer_i2c_hw_init(i2c);
0d676a6c439028 Ard Biesheuvel  2018-04-03  606  
0d676a6c439028 Ard Biesheuvel  2018-04-03  607  	ret = i2c_add_numbered_adapter(&i2c->adapter);
0d676a6c439028 Ard Biesheuvel  2018-04-03  608  	if (ret) {
0d676a6c439028 Ard Biesheuvel  2018-04-03  609  		dev_err(&pdev->dev, "failed to add bus to i2c core\n");
0d676a6c439028 Ard Biesheuvel  2018-04-03  610  		return ret;
0d676a6c439028 Ard Biesheuvel  2018-04-03  611  	}
0d676a6c439028 Ard Biesheuvel  2018-04-03  612  
0d676a6c439028 Ard Biesheuvel  2018-04-03  613  	platform_set_drvdata(pdev, i2c);
0d676a6c439028 Ard Biesheuvel  2018-04-03  614  
0d676a6c439028 Ard Biesheuvel  2018-04-03  615  	dev_info(&pdev->dev, "%s: synquacer_i2c adapter\n",
0d676a6c439028 Ard Biesheuvel  2018-04-03  616  		 dev_name(&i2c->adapter.dev));
0d676a6c439028 Ard Biesheuvel  2018-04-03  617  
0d676a6c439028 Ard Biesheuvel  2018-04-03 @618  	return 0;
0d676a6c439028 Ard Biesheuvel  2018-04-03  619  }
0d676a6c439028 Ard Biesheuvel  2018-04-03  620  

:::::: The code at line 618 was first introduced by commit
:::::: 0d676a6c439028b046610f7593f4ddb62680f1fb i2c: add support for Socionext SynQuacer I2C controller

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

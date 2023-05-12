Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9247EBE54
	for <oe-kbuild@lists.linux.dev>; Fri, 12 May 2023 12:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683894169; x=1715430169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seEnKHr3PceLx8/H6SPEtEzu5w9YYTVIyVE+M46uchg=;
  b=JAXhP2qSQYYOvP7VYyC4y2clehUASEdeGMyfTUfiYWVK62Kab8CrKh7T
   OVWg7cP9FDYKC94k+P/Q5sNmu5QRuuZcwkMBapmi1wPUo61etQZqf62a6
   oQ1Gqbg52cw8VsyEnjZzP/OEmZ0wAmKlnAIx4ymODF0pHirfgvloYrK94
   c9C2QWkRPEng9ZdofroNohmtCxOOU4FBXNHbFjtc3mgykYap/mf0fABgq
   cMtF9bmXSvMQkxBfJKi5JmfWi68yjkco5/BJX1TMyFTWNSxIdNp/TnYHs
   O/NCxk3Yti9+D5vwWUtorSFwk8UqQlRBlQQe0fH+cZwXIf8RGF8dSV16J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="414146657"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="414146657"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 05:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="946608721"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="946608721"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 May 2023 05:22:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxRnK-0004qO-2B;
	Fri, 12 May 2023 12:22:46 +0000
Date: Fri, 12 May 2023 20:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] media: rc: meson-ir: support MMIO regmaps to access
 registers
Message-ID: <202305122010.lGsFA089-lkp@intel.com>
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
In-Reply-To: <20230511034333.26800-1-zelong.dong@amlogic.com>
References: <20230511034333.26800-1-zelong.dong@amlogic.com>
TO: zelong dong <zelong.dong@amlogic.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Sean Young <sean@mess.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Rob Herring <robh+dt@kernel.org>
TO: Jerome Brunet <jbrunet@baylibre.com>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: linux-amlogic@lists.infradead.org
CC: Qianggui.Song@amlogic.com
CC: Yonghui.Yu@amlogic.com
CC: kelvin.zhang@amlogic.com
CC: Zelong Dong <zelong.dong@amlogic.com>

Hi zelong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.3]
[also build test WARNING on linus/master next-20230512]
[cannot apply to media-tree/master v6.4-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zelong-dong/media-rc-meson-ir-support-MMIO-regmaps-to-access-registers/20230511-114604
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230511034333.26800-1-zelong.dong%40amlogic.com
patch subject: [PATCH] media: rc: meson-ir: support MMIO regmaps to access registers
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: parisc-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230512/202305122010.lGsFA089-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305122010.lGsFA089-lkp@intel.com/

New smatch warnings:
drivers/media/rc/meson-ir.c:111 meson_ir_probe() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/media/rc/meson-ir.c:113 meson_ir_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +111 drivers/media/rc/meson-ir.c

12ddbadf383d55 Beniamino Galvani 2014-11-18   94  
12ddbadf383d55 Beniamino Galvani 2014-11-18   95  static int meson_ir_probe(struct platform_device *pdev)
12ddbadf383d55 Beniamino Galvani 2014-11-18   96  {
12ddbadf383d55 Beniamino Galvani 2014-11-18   97  	struct device *dev = &pdev->dev;
12ddbadf383d55 Beniamino Galvani 2014-11-18   98  	struct device_node *node = dev->of_node;
5a048b4c2c04b7 Zelong Dong       2023-05-11   99  	struct resource *res;
5a048b4c2c04b7 Zelong Dong       2023-05-11  100  	void __iomem *res_start;
12ddbadf383d55 Beniamino Galvani 2014-11-18  101  	const char *map_name;
12ddbadf383d55 Beniamino Galvani 2014-11-18  102  	struct meson_ir *ir;
1ffc931c320a8a Heiner Kallweit   2017-04-12  103  	int irq, ret;
12ddbadf383d55 Beniamino Galvani 2014-11-18  104  
12ddbadf383d55 Beniamino Galvani 2014-11-18  105  	ir = devm_kzalloc(dev, sizeof(struct meson_ir), GFP_KERNEL);
12ddbadf383d55 Beniamino Galvani 2014-11-18  106  	if (!ir)
12ddbadf383d55 Beniamino Galvani 2014-11-18  107  		return -ENOMEM;
12ddbadf383d55 Beniamino Galvani 2014-11-18  108  
5a048b4c2c04b7 Zelong Dong       2023-05-11  109  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
5a048b4c2c04b7 Zelong Dong       2023-05-11  110  	if (IS_ERR_OR_NULL(res)) {
5a048b4c2c04b7 Zelong Dong       2023-05-11 @111  		dev_err(&pdev->dev, "get mem resource error, %ld\n",
5a048b4c2c04b7 Zelong Dong       2023-05-11  112  			PTR_ERR(res));
5a048b4c2c04b7 Zelong Dong       2023-05-11  113  		return PTR_ERR(res);
5a048b4c2c04b7 Zelong Dong       2023-05-11  114  	}
5a048b4c2c04b7 Zelong Dong       2023-05-11  115  
5a048b4c2c04b7 Zelong Dong       2023-05-11  116  	res_start = devm_ioremap_resource(&pdev->dev, res);
5a048b4c2c04b7 Zelong Dong       2023-05-11  117  	meson_ir_regmap_config.max_register = resource_size(res) - 4;
5a048b4c2c04b7 Zelong Dong       2023-05-11  118  	ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
5a048b4c2c04b7 Zelong Dong       2023-05-11  119  					&meson_ir_regmap_config);
9e2e4382ec72d9 Ding Xiang        2019-06-18  120  	if (IS_ERR(ir->reg))
12ddbadf383d55 Beniamino Galvani 2014-11-18  121  		return PTR_ERR(ir->reg);
12ddbadf383d55 Beniamino Galvani 2014-11-18  122  
1ffc931c320a8a Heiner Kallweit   2017-04-12  123  	irq = platform_get_irq(pdev, 0);
97299a3035328d Stephen Boyd      2019-07-30  124  	if (irq < 0)
1ffc931c320a8a Heiner Kallweit   2017-04-12  125  		return irq;
12ddbadf383d55 Beniamino Galvani 2014-11-18  126  
705aa578d408f6 Heiner Kallweit   2017-04-12  127  	ir->rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW);
12ddbadf383d55 Beniamino Galvani 2014-11-18  128  	if (!ir->rc) {
12ddbadf383d55 Beniamino Galvani 2014-11-18  129  		dev_err(dev, "failed to allocate rc device\n");
12ddbadf383d55 Beniamino Galvani 2014-11-18  130  		return -ENOMEM;
12ddbadf383d55 Beniamino Galvani 2014-11-18  131  	}
12ddbadf383d55 Beniamino Galvani 2014-11-18  132  
12ddbadf383d55 Beniamino Galvani 2014-11-18  133  	ir->rc->priv = ir;
518f4b26be1ebf Sean Young        2017-07-01  134  	ir->rc->device_name = DRIVER_NAME;
12ddbadf383d55 Beniamino Galvani 2014-11-18  135  	ir->rc->input_phys = DRIVER_NAME "/input0";
12ddbadf383d55 Beniamino Galvani 2014-11-18  136  	ir->rc->input_id.bustype = BUS_HOST;
12ddbadf383d55 Beniamino Galvani 2014-11-18  137  	map_name = of_get_property(node, "linux,rc-map-name", NULL);
12ddbadf383d55 Beniamino Galvani 2014-11-18  138  	ir->rc->map_name = map_name ? map_name : RC_MAP_EMPTY;
6d741bfed5ed06 Sean Young        2017-08-07  139  	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
5a048b4c2c04b7 Zelong Dong       2023-05-11  140  	ir->rc->rx_resolution = MESON_RAW_TRATE;
b358e747aebc4a Sean Young        2018-03-12  141  	ir->rc->min_timeout = 1;
b358e747aebc4a Sean Young        2018-03-12  142  	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
b358e747aebc4a Sean Young        2018-03-12  143  	ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
12ddbadf383d55 Beniamino Galvani 2014-11-18  144  	ir->rc->driver_name = DRIVER_NAME;
12ddbadf383d55 Beniamino Galvani 2014-11-18  145  
12ddbadf383d55 Beniamino Galvani 2014-11-18  146  	spin_lock_init(&ir->lock);
12ddbadf383d55 Beniamino Galvani 2014-11-18  147  	platform_set_drvdata(pdev, ir);
12ddbadf383d55 Beniamino Galvani 2014-11-18  148  
705aa578d408f6 Heiner Kallweit   2017-04-12  149  	ret = devm_rc_register_device(dev, ir->rc);
12ddbadf383d55 Beniamino Galvani 2014-11-18  150  	if (ret) {
12ddbadf383d55 Beniamino Galvani 2014-11-18  151  		dev_err(dev, "failed to register rc device\n");
705aa578d408f6 Heiner Kallweit   2017-04-12  152  		return ret;
12ddbadf383d55 Beniamino Galvani 2014-11-18  153  	}
12ddbadf383d55 Beniamino Galvani 2014-11-18  154  
611ee552a538b0 Heiner Kallweit   2017-04-12  155  	ret = devm_request_irq(dev, irq, meson_ir_irq, 0, NULL, ir);
12ddbadf383d55 Beniamino Galvani 2014-11-18  156  	if (ret) {
12ddbadf383d55 Beniamino Galvani 2014-11-18  157  		dev_err(dev, "failed to request irq\n");
705aa578d408f6 Heiner Kallweit   2017-04-12  158  		return ret;
12ddbadf383d55 Beniamino Galvani 2014-11-18  159  	}
12ddbadf383d55 Beniamino Galvani 2014-11-18  160  
12ddbadf383d55 Beniamino Galvani 2014-11-18  161  	/* Reset the decoder */
5a048b4c2c04b7 Zelong Dong       2023-05-11  162  	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
5a048b4c2c04b7 Zelong Dong       2023-05-11  163  			   IR_DEC_REG1_RESET);
5a048b4c2c04b7 Zelong Dong       2023-05-11  164  	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
6edf27ee258925 Neil Armstrong    2016-08-20  165  
6edf27ee258925 Neil Armstrong    2016-08-20  166  	/* Set general operation mode (= raw/software decoding) */
6edf27ee258925 Neil Armstrong    2016-08-20  167  	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
5a048b4c2c04b7 Zelong Dong       2023-05-11  168  		regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
5a048b4c2c04b7 Zelong Dong       2023-05-11  169  				   FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
6edf27ee258925 Neil Armstrong    2016-08-20  170  	else
5a048b4c2c04b7 Zelong Dong       2023-05-11  171  		regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
5a048b4c2c04b7 Zelong Dong       2023-05-11  172  				   FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
6edf27ee258925 Neil Armstrong    2016-08-20  173  
12ddbadf383d55 Beniamino Galvani 2014-11-18  174  	/* Set rate */
5a048b4c2c04b7 Zelong Dong       2023-05-11  175  	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
5a048b4c2c04b7 Zelong Dong       2023-05-11  176  			   FIELD_PREP(IR_DEC_REG0_BASE_TIME,
5a048b4c2c04b7 Zelong Dong       2023-05-11  177  				      MESON_RAW_TRATE - 1));
12ddbadf383d55 Beniamino Galvani 2014-11-18  178  	/* IRQ on rising and falling edges */
5a048b4c2c04b7 Zelong Dong       2023-05-11  179  	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
5a048b4c2c04b7 Zelong Dong       2023-05-11  180  			   FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
12ddbadf383d55 Beniamino Galvani 2014-11-18  181  	/* Enable the decoder */
5a048b4c2c04b7 Zelong Dong       2023-05-11  182  	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
5a048b4c2c04b7 Zelong Dong       2023-05-11  183  			   IR_DEC_REG1_ENABLE);
12ddbadf383d55 Beniamino Galvani 2014-11-18  184  
12ddbadf383d55 Beniamino Galvani 2014-11-18  185  	dev_info(dev, "receiver initialized\n");
12ddbadf383d55 Beniamino Galvani 2014-11-18  186  
12ddbadf383d55 Beniamino Galvani 2014-11-18  187  	return 0;
12ddbadf383d55 Beniamino Galvani 2014-11-18  188  }
12ddbadf383d55 Beniamino Galvani 2014-11-18  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

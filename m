Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3094E14A4E1
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Nov 2024 05:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731995737; cv=none; b=PBasYFpGsQhA4LhZaWzdBMJrNjKoy8eziDG2C7DpKB2MJ030T517UTYfKRpZ+YrY6C4KZ3ID3pA1RNC9rUHya3TE8x4kBcSrE0aMx/dtb5m5kUbjLgmZOr2M4czYCHcbv2Xkz3NRxvYZNTEq53xSpZ1rxdhR39j+YHgaRaBk9CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731995737; c=relaxed/simple;
	bh=/tkIoPQnaQkw/XONDuW5sveDllnmv9ZwHTS/q86sJAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XUBsJxZdv2Oo5Jmlu4ZC6xpmScp+6yNwThqzAzICO4vLUCuEnwv5+fHiWtEE0SvbSMGq27Pu+bs0nNRhJhlFMZz0SF1YUQsRDudiRW0vgr7b7k66CNsNfLEBYTEFIzL4uYfLntxtbkSoxJzE48xF/cZ1bQLTKayZTQHblIf/ljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPDtlN4M; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPDtlN4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731995734; x=1763531734;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/tkIoPQnaQkw/XONDuW5sveDllnmv9ZwHTS/q86sJAU=;
  b=VPDtlN4MheYM50moVPUMNrZuo08av08IimyqlSOef2ldM7n21xW4oeZu
   kZ1BDV/ZR8Qdp7xB25yGQKWsCee6NKHSoGWS3hkgqJDJqHyDLqLRxbEQs
   SWe1zimBbteIoVLItn+ARV57d+VV8nszUlwcnwQ8ZKJ8c76F9ZbgVsmGm
   TYy3PJlhg7T9K5TSqk0yZ+j1f6Wx01vLnknV0fMqwZ/0ff5VjIisaiDPX
   jneKr+gq+AL0uvVXio4J4nxaRvh5m3+Sns3/vzgMjetj5wreGNLKLpviM
   3ouPU5v0Q7vh0wdz3/VyUa14hcuMzobFKqQBmW2x2yzNmOkEVLRSp6oJL
   g==;
X-CSE-ConnectionGUID: GKi76RyqTLCSuTzg5ZiaKQ==
X-CSE-MsgGUID: GnKxw5FDRuGJQc/XE28Y2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31729625"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31729625"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 21:55:34 -0800
X-CSE-ConnectionGUID: Jo+vmO+fSLib1Tf8B/QFDg==
X-CSE-MsgGUID: C7sQSW9ESO+Fq6yv6e6t3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89467949"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2024 21:55:32 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDHCK-00008Q-2H;
	Tue, 19 Nov 2024 05:55:30 +0000
Date: Tue, 19 Nov 2024 13:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2273/12140] drivers/gpio/gpio-mvebu.c:1301
 mvebu_gpio_probe() warn: 'mvchip->clk' from clk_prepare_enable() not
 released on lines: 1189,1236,1248.
Message-ID: <202411191337.QXumz6Yy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae58226b89ac0cffa05ba7357733776542e40216
commit: 956ee0c5c969c9caf6744e166f5a80526be10c5b [2273/12140] gpio: mvebu: allow building the module with COMPILE_TEST=y
:::::: branch date: 21 hours ago
:::::: commit date: 6 weeks ago
config: nios2-randconfig-r072-20241119 (https://download.01.org/0day-ci/archive/20241119/202411191337.QXumz6Yy-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411191337.QXumz6Yy-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-mvebu.c:1301 mvebu_gpio_probe() warn: 'mvchip->clk' from clk_prepare_enable() not released on lines: 1189,1236,1248.

vim +1301 drivers/gpio/gpio-mvebu.c

644ee70267a934 Bartosz Golaszewski 2023-07-19  1121  
3836309d93462b Bill Pemberton      2012-11-19  1122  static int mvebu_gpio_probe(struct platform_device *pdev)
fefe7b0923459e Thomas Petazzoni    2012-09-19  1123  {
fefe7b0923459e Thomas Petazzoni    2012-09-19  1124  	struct mvebu_gpio_chip *mvchip;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1125  	struct device_node *np = pdev->dev.of_node;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1126  	struct irq_chip_generic *gc;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1127  	struct irq_chip_type *ct;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1128  	unsigned int ngpios;
812d47889a8e41 Jason Gunthorpe     2016-10-19  1129  	bool have_irqs;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1130  	int soc_variant;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1131  	int i, cpu, id;
f1d2d081e8d13b Andrew Lunn         2015-01-10  1132  	int err;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1133  
03a975cbcfcd0b Rob Herring         2023-10-06  1134  	soc_variant = (unsigned long)device_get_match_data(&pdev->dev);
fefe7b0923459e Thomas Petazzoni    2012-09-19  1135  
812d47889a8e41 Jason Gunthorpe     2016-10-19  1136  	/* Some gpio controllers do not provide irq support */
0c21639f5a4b1f Peng Fan            2019-12-04  1137  	err = platform_irq_count(pdev);
0c21639f5a4b1f Peng Fan            2019-12-04  1138  	if (err < 0)
0c21639f5a4b1f Peng Fan            2019-12-04  1139  		return err;
0c21639f5a4b1f Peng Fan            2019-12-04  1140  
0c21639f5a4b1f Peng Fan            2019-12-04  1141  	have_irqs = err != 0;
812d47889a8e41 Jason Gunthorpe     2016-10-19  1142  
a4319a611bcdc3 Andrew Lunn         2015-01-10  1143  	mvchip = devm_kzalloc(&pdev->dev, sizeof(struct mvebu_gpio_chip),
a4319a611bcdc3 Andrew Lunn         2015-01-10  1144  			      GFP_KERNEL);
6c8365f68ab38b Jingoo Han          2014-04-29  1145  	if (!mvchip)
fefe7b0923459e Thomas Petazzoni    2012-09-19  1146  		return -ENOMEM;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1147  
b5b7b487431b01 Thomas Petazzoni    2014-10-24  1148  	platform_set_drvdata(pdev, mvchip);
b5b7b487431b01 Thomas Petazzoni    2014-10-24  1149  
fefe7b0923459e Thomas Petazzoni    2012-09-19  1150  	if (of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios)) {
fefe7b0923459e Thomas Petazzoni    2012-09-19  1151  		dev_err(&pdev->dev, "Missing ngpios OF property\n");
fefe7b0923459e Thomas Petazzoni    2012-09-19  1152  		return -ENODEV;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1153  	}
fefe7b0923459e Thomas Petazzoni    2012-09-19  1154  
fefe7b0923459e Thomas Petazzoni    2012-09-19  1155  	id = of_alias_get_id(pdev->dev.of_node, "gpio");
fefe7b0923459e Thomas Petazzoni    2012-09-19  1156  	if (id < 0) {
fefe7b0923459e Thomas Petazzoni    2012-09-19  1157  		dev_err(&pdev->dev, "Couldn't get OF id\n");
fefe7b0923459e Thomas Petazzoni    2012-09-19  1158  		return id;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1159  	}
fefe7b0923459e Thomas Petazzoni    2012-09-19  1160  
757642f9a584e8 Andrew Lunn         2017-04-14  1161  	mvchip->clk = devm_clk_get(&pdev->dev, NULL);
de88747f514a4e Andrew Lunn         2013-02-03  1162  	/* Not all SoCs require a clock.*/
757642f9a584e8 Andrew Lunn         2017-04-14  1163  	if (!IS_ERR(mvchip->clk))
757642f9a584e8 Andrew Lunn         2017-04-14  1164  		clk_prepare_enable(mvchip->clk);
de88747f514a4e Andrew Lunn         2013-02-03  1165  
fefe7b0923459e Thomas Petazzoni    2012-09-19  1166  	mvchip->soc_variant = soc_variant;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1167  	mvchip->chip.label = dev_name(&pdev->dev);
58383c78425e4e Linus Walleij       2015-11-04  1168  	mvchip->chip.parent = &pdev->dev;
203f0daafdf228 Jonas Gorski        2015-10-11  1169  	mvchip->chip.request = gpiochip_generic_request;
203f0daafdf228 Jonas Gorski        2015-10-11  1170  	mvchip->chip.free = gpiochip_generic_free;
e8dacf5957ea58 Baruch Siach        2019-01-10  1171  	mvchip->chip.get_direction = mvebu_gpio_get_direction;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1172  	mvchip->chip.direction_input = mvebu_gpio_direction_input;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1173  	mvchip->chip.get = mvebu_gpio_get;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1174  	mvchip->chip.direction_output = mvebu_gpio_direction_output;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1175  	mvchip->chip.set = mvebu_gpio_set;
812d47889a8e41 Jason Gunthorpe     2016-10-19  1176  	if (have_irqs)
fefe7b0923459e Thomas Petazzoni    2012-09-19  1177  		mvchip->chip.to_irq = mvebu_gpio_to_irq;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1178  	mvchip->chip.base = id * MVEBU_MAX_GPIO_PER_BANK;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1179  	mvchip->chip.ngpio = ngpios;
9fb1f39eb2d670 Linus Walleij       2013-12-04  1180  	mvchip->chip.can_sleep = false;
a4ba5e1b92b69b Simon Guinot        2013-03-24  1181  	mvchip->chip.dbg_show = mvebu_gpio_dbg_show;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1182  
b6730b20837e74 Gregory CLEMENT     2017-06-12  1183  	if (soc_variant == MVEBU_GPIO_SOC_VARIANT_A8K)
b6730b20837e74 Gregory CLEMENT     2017-06-12  1184  		err = mvebu_gpio_probe_syscon(pdev, mvchip);
b6730b20837e74 Gregory CLEMENT     2017-06-12  1185  	else
b6730b20837e74 Gregory CLEMENT     2017-06-12  1186  		err = mvebu_gpio_probe_raw(pdev, mvchip);
fefe7b0923459e Thomas Petazzoni    2012-09-19  1187  
b6730b20837e74 Gregory CLEMENT     2017-06-12  1188  	if (err)
b6730b20837e74 Gregory CLEMENT     2017-06-12  1189  		return err;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1190  
fefe7b0923459e Thomas Petazzoni    2012-09-19  1191  	/*
fefe7b0923459e Thomas Petazzoni    2012-09-19  1192  	 * Mask and clear GPIO interrupts.
fefe7b0923459e Thomas Petazzoni    2012-09-19  1193  	 */
fefe7b0923459e Thomas Petazzoni    2012-09-19  1194  	switch (soc_variant) {
fefe7b0923459e Thomas Petazzoni    2012-09-19  1195  	case MVEBU_GPIO_SOC_VARIANT_ORION:
b6730b20837e74 Gregory CLEMENT     2017-06-12  1196  	case MVEBU_GPIO_SOC_VARIANT_A8K:
b6730b20837e74 Gregory CLEMENT     2017-06-12  1197  		regmap_write(mvchip->regs,
b6730b20837e74 Gregory CLEMENT     2017-06-12  1198  			     GPIO_EDGE_CAUSE_OFF + mvchip->offset, 0);
b6730b20837e74 Gregory CLEMENT     2017-06-12  1199  		regmap_write(mvchip->regs,
b6730b20837e74 Gregory CLEMENT     2017-06-12  1200  			     GPIO_EDGE_MASK_OFF + mvchip->offset, 0);
b6730b20837e74 Gregory CLEMENT     2017-06-12  1201  		regmap_write(mvchip->regs,
b6730b20837e74 Gregory CLEMENT     2017-06-12  1202  			     GPIO_LEVEL_MASK_OFF + mvchip->offset, 0);
fefe7b0923459e Thomas Petazzoni    2012-09-19  1203  		break;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1204  	case MVEBU_GPIO_SOC_VARIANT_MV78200:
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1205  		regmap_write(mvchip->regs, GPIO_EDGE_CAUSE_OFF, 0);
fefe7b0923459e Thomas Petazzoni    2012-09-19  1206  		for (cpu = 0; cpu < 2; cpu++) {
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1207  			regmap_write(mvchip->regs,
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1208  				     GPIO_EDGE_MASK_MV78200_OFF(cpu), 0);
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1209  			regmap_write(mvchip->regs,
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1210  				     GPIO_LEVEL_MASK_MV78200_OFF(cpu), 0);
fefe7b0923459e Thomas Petazzoni    2012-09-19  1211  		}
fefe7b0923459e Thomas Petazzoni    2012-09-19  1212  		break;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1213  	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1214  		regmap_write(mvchip->regs, GPIO_EDGE_CAUSE_OFF, 0);
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1215  		regmap_write(mvchip->regs, GPIO_EDGE_MASK_OFF, 0);
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1216  		regmap_write(mvchip->regs, GPIO_LEVEL_MASK_OFF, 0);
fefe7b0923459e Thomas Petazzoni    2012-09-19  1217  		for (cpu = 0; cpu < 4; cpu++) {
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1218  			regmap_write(mvchip->percpu_regs,
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1219  				     GPIO_EDGE_CAUSE_ARMADAXP_OFF(cpu), 0);
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1220  			regmap_write(mvchip->percpu_regs,
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1221  				     GPIO_EDGE_MASK_ARMADAXP_OFF(cpu), 0);
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1222  			regmap_write(mvchip->percpu_regs,
2233bf7a92e784 Thomas Petazzoni    2017-05-19  1223  				     GPIO_LEVEL_MASK_ARMADAXP_OFF(cpu), 0);
fefe7b0923459e Thomas Petazzoni    2012-09-19  1224  		}
fefe7b0923459e Thomas Petazzoni    2012-09-19  1225  		break;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1226  	default:
fefe7b0923459e Thomas Petazzoni    2012-09-19  1227  		BUG();
fefe7b0923459e Thomas Petazzoni    2012-09-19  1228  	}
fefe7b0923459e Thomas Petazzoni    2012-09-19  1229  
00b9ab4a25cf5a Laxman Dewangan     2016-02-22  1230  	devm_gpiochip_add_data(&pdev->dev, &mvchip->chip, mvchip);
fefe7b0923459e Thomas Petazzoni    2012-09-19  1231  
7ee1a01e47403f Baruch Siach        2020-12-02  1232  	/* Some MVEBU SoCs have simple PWM support for GPIO lines */
3101b1e4ba3874 Uwe Kleine-König    2023-01-20  1233  	if (IS_REACHABLE(CONFIG_PWM)) {
7ee1a01e47403f Baruch Siach        2020-12-02  1234  		err = mvebu_pwm_probe(pdev, mvchip, id);
7ee1a01e47403f Baruch Siach        2020-12-02  1235  		if (err)
7ee1a01e47403f Baruch Siach        2020-12-02  1236  			return err;
7ee1a01e47403f Baruch Siach        2020-12-02  1237  	}
7ee1a01e47403f Baruch Siach        2020-12-02  1238  
fefe7b0923459e Thomas Petazzoni    2012-09-19  1239  	/* Some gpio controllers do not provide irq support */
812d47889a8e41 Jason Gunthorpe     2016-10-19  1240  	if (!have_irqs)
fefe7b0923459e Thomas Petazzoni    2012-09-19  1241  		return 0;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1242  
812d47889a8e41 Jason Gunthorpe     2016-10-19  1243  	mvchip->domain =
812d47889a8e41 Jason Gunthorpe     2016-10-19  1244  	    irq_domain_add_linear(np, ngpios, &irq_generic_chip_ops, NULL);
812d47889a8e41 Jason Gunthorpe     2016-10-19  1245  	if (!mvchip->domain) {
812d47889a8e41 Jason Gunthorpe     2016-10-19  1246  		dev_err(&pdev->dev, "couldn't allocate irq domain %s (DT).\n",
812d47889a8e41 Jason Gunthorpe     2016-10-19  1247  			mvchip->chip.label);
1945063eb59e64 Uwe Kleine-König    2023-07-17  1248  		return -ENODEV;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1249  	}
fefe7b0923459e Thomas Petazzoni    2012-09-19  1250  
644ee70267a934 Bartosz Golaszewski 2023-07-19  1251  	err = devm_add_action_or_reset(&pdev->dev, mvebu_gpio_remove_irq_domain,
644ee70267a934 Bartosz Golaszewski 2023-07-19  1252  				       mvchip->domain);
644ee70267a934 Bartosz Golaszewski 2023-07-19  1253  	if (err)
644ee70267a934 Bartosz Golaszewski 2023-07-19  1254  		return err;
644ee70267a934 Bartosz Golaszewski 2023-07-19  1255  
812d47889a8e41 Jason Gunthorpe     2016-10-19  1256  	err = irq_alloc_domain_generic_chips(
812d47889a8e41 Jason Gunthorpe     2016-10-19  1257  	    mvchip->domain, ngpios, 2, np->name, handle_level_irq,
812d47889a8e41 Jason Gunthorpe     2016-10-19  1258  	    IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_LEVEL, 0, 0);
812d47889a8e41 Jason Gunthorpe     2016-10-19  1259  	if (err) {
812d47889a8e41 Jason Gunthorpe     2016-10-19  1260  		dev_err(&pdev->dev, "couldn't allocate irq chips %s (DT).\n",
812d47889a8e41 Jason Gunthorpe     2016-10-19  1261  			mvchip->chip.label);
644ee70267a934 Bartosz Golaszewski 2023-07-19  1262  		return err;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1263  	}
fefe7b0923459e Thomas Petazzoni    2012-09-19  1264  
899c37edfedbe1 Ralph Sennhauser    2017-03-16  1265  	/*
899c37edfedbe1 Ralph Sennhauser    2017-03-16  1266  	 * NOTE: The common accessors cannot be used because of the percpu
812d47889a8e41 Jason Gunthorpe     2016-10-19  1267  	 * access to the mask registers
812d47889a8e41 Jason Gunthorpe     2016-10-19  1268  	 */
812d47889a8e41 Jason Gunthorpe     2016-10-19  1269  	gc = irq_get_domain_generic_chip(mvchip->domain, 0);
fefe7b0923459e Thomas Petazzoni    2012-09-19  1270  	gc->private = mvchip;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1271  	ct = &gc->chip_types[0];
fefe7b0923459e Thomas Petazzoni    2012-09-19  1272  	ct->type = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1273  	ct->chip.irq_mask = mvebu_gpio_level_irq_mask;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1274  	ct->chip.irq_unmask = mvebu_gpio_level_irq_unmask;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1275  	ct->chip.irq_set_type = mvebu_gpio_irq_set_type;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1276  	ct->chip.name = mvchip->chip.label;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1277  
fefe7b0923459e Thomas Petazzoni    2012-09-19  1278  	ct = &gc->chip_types[1];
fefe7b0923459e Thomas Petazzoni    2012-09-19  1279  	ct->type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1280  	ct->chip.irq_ack = mvebu_gpio_irq_ack;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1281  	ct->chip.irq_mask = mvebu_gpio_edge_irq_mask;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1282  	ct->chip.irq_unmask = mvebu_gpio_edge_irq_unmask;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1283  	ct->chip.irq_set_type = mvebu_gpio_irq_set_type;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1284  	ct->handler = handle_edge_irq;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1285  	ct->chip.name = mvchip->chip.label;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1286  
899c37edfedbe1 Ralph Sennhauser    2017-03-16  1287  	/*
899c37edfedbe1 Ralph Sennhauser    2017-03-16  1288  	 * Setup the interrupt handlers. Each chip can have up to 4
812d47889a8e41 Jason Gunthorpe     2016-10-19  1289  	 * interrupt handlers, with each handler dealing with 8 GPIO
812d47889a8e41 Jason Gunthorpe     2016-10-19  1290  	 * pins.
812d47889a8e41 Jason Gunthorpe     2016-10-19  1291  	 */
812d47889a8e41 Jason Gunthorpe     2016-10-19  1292  	for (i = 0; i < 4; i++) {
525b0858ff2fdb Chris Packham       2020-03-13  1293  		int irq = platform_get_irq_optional(pdev, i);
fefe7b0923459e Thomas Petazzoni    2012-09-19  1294  
812d47889a8e41 Jason Gunthorpe     2016-10-19  1295  		if (irq < 0)
812d47889a8e41 Jason Gunthorpe     2016-10-19  1296  			continue;
812d47889a8e41 Jason Gunthorpe     2016-10-19  1297  		irq_set_chained_handler_and_data(irq, mvebu_gpio_irq_handler,
fefe7b0923459e Thomas Petazzoni    2012-09-19  1298  						 mvchip);
f1d2d081e8d13b Andrew Lunn         2015-01-10  1299  	}
f1d2d081e8d13b Andrew Lunn         2015-01-10  1300  
f1d2d081e8d13b Andrew Lunn         2015-01-10 @1301  	return 0;
fefe7b0923459e Thomas Petazzoni    2012-09-19  1302  }
fefe7b0923459e Thomas Petazzoni    2012-09-19  1303  

:::::: The code at line 1301 was first introduced by commit
:::::: f1d2d081e8d13b23ea53f32932ae03af76934b9a gpio: mvebu: Fix probe cleanup on error

:::::: TO: Andrew Lunn <andrew@lunn.ch>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

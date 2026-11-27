Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761065;
	b=17tpUecg1R03/WGsdJXXBruPmaiBp13OBK8c1/GQkfOSEmOGXa0lgMOz+lvB4TLMbXtD
	 CCXS0RmNw5ozTYQkQIFBp2W4ov8FlC87e73XC/UujwohsSMVR+aqDIKbIZUkCVruGo/TU
	 6CIrd/VfGOMtjMAbltocldaRAZVG7gWvXPbP1FDRqh34ZsUjcI7AiQDHH6Lt5hFCRlmNF
	 bWSb7FiwdbUmftU96vBEJi7Jbm86Zij4DduPu4RFyR99rGnPAvnXI15x8++F8BQIZ8H4P
	 S8kRCBg1ftJElyNR3/yMIvLNSGUmqcEyRLW1ZdierYXNhqmX1RkqrXLGk1gwm+O1O9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761065;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=e9fvmsElx/zGjEjQEwkBesU8hhHef61fnbD7UXwvC3U=;
	b=NLnwXKxhT3fEhFX1siwjrEo1BorP4RN6m+P8A8UG9GZloR0w1eJShXv8diXaWn3nWvjW
	 VsmJWAUUcEXT1NG1hp5j/N1K6TJOt1uJyEyA5qxHgdexN2l4JctXy8t83cYXBjUalzxy8
	 LCDh3KNLm8WDKRripEJcCJ0jhAb0E0x//5ZqmoaOhRMHH0omM/eUjHQx/hw/gwnJ5ziFH
	 ipAiQXjLnltHoqtOav/ZKcjq4XYmA1we50ps6qir2y2naNn/Rypcq467pD9jMqgwURYMS
	 MskfGBse1VlWepjo9SPUrdMdePO1fNIPt3H3kLGfNZnckZzOuVZLiXB07QuDZbFxL7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Yvl/oEWG";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACE7606A31E
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 06:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACE7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yvl/oEWG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795761064; x=1827297064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bxFrW5Q+8y7vBiWhETnZx/7q/u6aqop9rQHXU1le0N8=;
  b=Yvl/oEWGYJsMIl4m9Hsf0GZEYxT13wr8ar2mNduYFrZpJh0t6Jzh/TY3
   Q0v4AfdCJW+jbWDzkhxDeeGeEZtDXkEkk3+sjwqJQ+gXoahD9NtoyfS/w
   LxqAikEV4gqkI/nDMeWR59zAEG+vGk0lYh2/oa3CeaCQTC7LwkrPtFtBx
   R0+MERoG7914I69yIqro3sAGC5r36L3iugCfHkYsyZajZ9YDo3OF1DBIP
   7xYevjJJAiRWrPigWnaWZU5RLbF2abq8QvioOvoTwIBJtS/EGn3WriPw6
   KgVmJZGyckuDp75f4TFqLN39vYqErUSH8fYl5Qmic+OD2RXxXptZ2xVHj
   A==;
X-CSE-ConnectionGUID: I+km2OD1TjuFtQHVemrB4Q==
X-CSE-MsgGUID: GBgaWSOjRfWq5kUlt1lRKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4755833"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4755833"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 22:31:03 -0800
X-CSE-ConnectionGUID: qIpAkfM3QOCo+XZbnNNrQA==
X-CSE-MsgGUID: TnPv8XipT7mgd6OaxmsL0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12562723"
Received: from igk-lkp-server01.igk.intel.com (HELO cbd2aa73d023) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Nov 2026 22:30:58 -0800
Received: from kbuild by cbd2aa73d023 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWpLT-0000000002Z-06Da;
	Fri, 27 Nov 2026 06:22:07 +0000
Date: Fri, 27 Nov 2026 07:21:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: single: Also free the pinconf table of a
 duplicate function
Message-ID: <20261127055733.cfTQXUs7-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261119232806.4093754-2-alexander.sverdlin@siemens.com>
References: <20261119232806.4093754-2-alexander.sverdlin@siemens.com>
TO: "A. Sverdlin" <alexander.sverdlin@siemens.com>
TO: linux-gpio@vger.kernel.org
CC: Alexander Sverdlin <alexander.sverdlin@siemens.com>
CC: Tony Lindgren <tony@atomide.com>
CC: Haojian Zhuang <haojian.zhuang@linaro.org>
CC: Linus Walleij <linusw@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-omap@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Lee Jones <lee@kernel.org>
CC: stable@vger.kernel.org

Hi Sverdlin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux-review/Lee-Jones/pinctrl-nuvoton-ma35-Unmap-reg_base-and-release-clock-on-probe-error/20261119-204857]

url:    https://github.com/intel-lab-lkp/linux/commits/A-Sverdlin/pinctrl-single-Also-free-the-pinconf-table-of-a-duplicate-function/20261120-002803
base:   https://github.com/intel-lab-lkp/linux Lee-Jones/pinctrl-nuvoton-ma35-Unmap-reg_base-and-release-clock-on-probe-error/20261119-204857
patch link:    https://lore.kernel.org/r/20261119232806.4093754-2-alexander.sverdlin%40siemens.com
patch subject: [PATCH 1/3] pinctrl: single: Also free the pinconf table of a duplicate function
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: sparc-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127055733.cfTQXUs7-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261127055733.cfTQXUs7-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/pinctrl-single.c:1111 pcs_parse_one_pinctrl_entry() error: we previously assumed 'function' could be null (see line 1090)

Old smatch warnings:
drivers/pinctrl/pinctrl-single.c:1038 pcs_parse_one_pinctrl_entry() warn: missing unwind goto?
drivers/pinctrl/pinctrl-single.c:1180 pcs_parse_bits_in_pinctrl_entry() warn: missing unwind goto?
drivers/pinctrl/pinctrl-single.c:1659 pcs_irq_init_chained_handler() warn: 'pcs_soc->irq' from request_irq() not released on lines: 1656.

vim +/function +1111 drivers/pinctrl/pinctrl-single.c

9dddb4df90d1364 Haojian Zhuang         2013-02-17   986  
8b8b091bf07fa7e Tony Lindgren          2012-07-10   987  /**
bc6d201591344aa Drew Fustini           2020-06-17   988   * pcs_parse_one_pinctrl_entry() - parses a device tree mux entry
8b8b091bf07fa7e Tony Lindgren          2012-07-10   989   * @pcs: pinctrl driver instance
8b8b091bf07fa7e Tony Lindgren          2012-07-10   990   * @np: device node of the mux entry
8b8b091bf07fa7e Tony Lindgren          2012-07-10   991   * @map: map entry
9dddb4df90d1364 Haojian Zhuang         2013-02-17   992   * @num_maps: number of map
8b8b091bf07fa7e Tony Lindgren          2012-07-10   993   * @pgnames: pingroup names
8b8b091bf07fa7e Tony Lindgren          2012-07-10   994   *
8b8b091bf07fa7e Tony Lindgren          2012-07-10   995   * Note that this binding currently supports only sets of one register + value.
8b8b091bf07fa7e Tony Lindgren          2012-07-10   996   *
8b8b091bf07fa7e Tony Lindgren          2012-07-10   997   * Also note that this driver tries to avoid understanding pin and function
8b8b091bf07fa7e Tony Lindgren          2012-07-10   998   * names because of the extra bloat they would cause especially in the case of
8b8b091bf07fa7e Tony Lindgren          2012-07-10   999   * a large number of pins. This driver just sets what is specified for the board
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1000   * in the .dts file. Further user space debugging tools can be developed to
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1001   * decipher the pin and function names using debugfs.
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1002   *
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1003   * If you are concerned about the boot time, set up the static pins in
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1004   * the bootloader, and only set up selected pins as device tree entries.
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1005   */
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1006  static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1007  						struct device_node *np,
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1008  						struct pinctrl_map **map,
9dddb4df90d1364 Haojian Zhuang         2013-02-17  1009  						unsigned *num_maps,
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1010  						const char **pgnames)
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1011  {
4622215fb1dda40 Tony Lindgren          2016-11-03  1012  	const char *name = "pinctrl-single,pins";
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1013  	struct pcs_func_vals *vals;
a4ab10860723652 Tony Lindgren          2018-07-05  1014  	int rows, *pins, found = 0, res = -ENOMEM, i, fsel, gsel;
a4ab10860723652 Tony Lindgren          2018-07-05  1015  	struct pcs_function *function = NULL;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1016  
4622215fb1dda40 Tony Lindgren          2016-11-03  1017  	rows = pinctrl_count_index_with_args(np, name);
de7416bcee3f7c9 Axel Haslam            2016-11-09  1018  	if (rows <= 0) {
059a6e630bb9ee2 Colin Ian King         2016-12-23  1019  		dev_err(pcs->dev, "Invalid number of rows: %d\n", rows);
de7416bcee3f7c9 Axel Haslam            2016-11-09  1020  		return -EINVAL;
de7416bcee3f7c9 Axel Haslam            2016-11-09  1021  	}
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1022  
a86854d0c599b32 Kees Cook              2018-06-12  1023  	vals = devm_kcalloc(pcs->dev, rows, sizeof(*vals), GFP_KERNEL);
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1024  	if (!vals)
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1025  		return -ENOMEM;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1026  
a86854d0c599b32 Kees Cook              2018-06-12  1027  	pins = devm_kcalloc(pcs->dev, rows, sizeof(*pins), GFP_KERNEL);
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1028  	if (!pins)
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1029  		goto free_vals;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1030  
4622215fb1dda40 Tony Lindgren          2016-11-03  1031  	for (i = 0; i < rows; i++) {
4622215fb1dda40 Tony Lindgren          2016-11-03  1032  		struct of_phandle_args pinctrl_spec;
4622215fb1dda40 Tony Lindgren          2016-11-03  1033  		unsigned int offset;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1034  		int pin;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1035  
4622215fb1dda40 Tony Lindgren          2016-11-03  1036  		res = pinctrl_parse_index_with_args(np, name, i, &pinctrl_spec);
4622215fb1dda40 Tony Lindgren          2016-11-03  1037  		if (res)
4622215fb1dda40 Tony Lindgren          2016-11-03  1038  			return res;
4622215fb1dda40 Tony Lindgren          2016-11-03  1039  
9b9448f39e83d8e Drew Fustini           2020-09-30  1040  		if (pinctrl_spec.args_count < 2 || pinctrl_spec.args_count > 3) {
4622215fb1dda40 Tony Lindgren          2016-11-03  1041  			dev_err(pcs->dev, "invalid args_count for spec: %i\n",
4622215fb1dda40 Tony Lindgren          2016-11-03  1042  				pinctrl_spec.args_count);
4622215fb1dda40 Tony Lindgren          2016-11-03  1043  			break;
4622215fb1dda40 Tony Lindgren          2016-11-03  1044  		}
4622215fb1dda40 Tony Lindgren          2016-11-03  1045  
4622215fb1dda40 Tony Lindgren          2016-11-03  1046  		offset = pinctrl_spec.args[0];
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1047  		vals[found].reg = pcs->base + offset;
a133954188887a8 Drew Fustini           2020-07-01  1048  
a133954188887a8 Drew Fustini           2020-07-01  1049  		switch (pinctrl_spec.args_count) {
a133954188887a8 Drew Fustini           2020-07-01  1050  		case 2:
4622215fb1dda40 Tony Lindgren          2016-11-03  1051  			vals[found].val = pinctrl_spec.args[1];
a133954188887a8 Drew Fustini           2020-07-01  1052  			break;
a133954188887a8 Drew Fustini           2020-07-01  1053  		case 3:
a133954188887a8 Drew Fustini           2020-07-01  1054  			vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
a133954188887a8 Drew Fustini           2020-07-01  1055  			break;
a133954188887a8 Drew Fustini           2020-07-01  1056  		}
4622215fb1dda40 Tony Lindgren          2016-11-03  1057  
94f4e54cecaf3ec Rob Herring            2018-08-27  1058  		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
f4a2b19c37caf40 Drew Fustini           2020-09-14  1059  			pinctrl_spec.np, offset, vals[found].val);
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1060  
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1061  		pin = pcs_get_pin_by_offset(pcs, offset);
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1062  		if (pin < 0) {
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1063  			dev_err(pcs->dev,
94f4e54cecaf3ec Rob Herring            2018-08-27  1064  				"could not add functions for %pOFn %ux\n",
94f4e54cecaf3ec Rob Herring            2018-08-27  1065  				np, offset);
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1066  			break;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1067  		}
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1068  		pins[found++] = pin;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1069  	}
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1070  
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1071  	pgnames[0] = np->name;
a4ab10860723652 Tony Lindgren          2018-07-05  1072  	mutex_lock(&pcs->mutex);
a4ab10860723652 Tony Lindgren          2018-07-05  1073  	fsel = pcs_add_function(pcs, &function, np->name, vals, found,
a4ab10860723652 Tony Lindgren          2018-07-05  1074  				pgnames, 1);
a4ab10860723652 Tony Lindgren          2018-07-05  1075  	if (fsel < 0) {
a4ab10860723652 Tony Lindgren          2018-07-05  1076  		res = fsel;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1077  		goto free_pins;
712778d02d5c24e Dan Carpenter          2016-11-16  1078  	}
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1079  
a4ab10860723652 Tony Lindgren          2018-07-05  1080  	gsel = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
a4ab10860723652 Tony Lindgren          2018-07-05  1081  	if (gsel < 0) {
a4ab10860723652 Tony Lindgren          2018-07-05  1082  		res = gsel;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1083  		goto free_function;
a4ab10860723652 Tony Lindgren          2018-07-05  1084  	}
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1085  
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1086  	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1087  	(*map)->data.mux.group = np->name;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1088  	(*map)->data.mux.function = np->name;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1089  
a4ab10860723652 Tony Lindgren          2018-07-05 @1090  	if (PCS_HAS_PINCONF && function) {
18442e65d424dc8 Wei Yongjun            2013-05-07  1091  		res = pcs_parse_pinconf(pcs, np, function, map);
f46fe79ff1b6569 Drew Fustini           2020-06-08  1092  		if (res == 0)
9dddb4df90d1364 Haojian Zhuang         2013-02-17  1093  			*num_maps = 2;
f46fe79ff1b6569 Drew Fustini           2020-06-08  1094  		else if (res == -ENOTSUPP)
f46fe79ff1b6569 Drew Fustini           2020-06-08  1095  			*num_maps = 1;
f46fe79ff1b6569 Drew Fustini           2020-06-08  1096  		else
f46fe79ff1b6569 Drew Fustini           2020-06-08  1097  			goto free_pingroups;
9dddb4df90d1364 Haojian Zhuang         2013-02-17  1098  	} else {
9dddb4df90d1364 Haojian Zhuang         2013-02-17  1099  		*num_maps = 1;
9dddb4df90d1364 Haojian Zhuang         2013-02-17  1100  	}
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1101  
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1102  	/*
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1103  	 * The core deduplicates groups/functions by name and keeps the first
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1104  	 * for the controller's lifetime; drop our now-redundant copies when the
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1105  	 * node is mapped again (consumer re-probe). The group is deduplicated
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1106  	 * together with the function, so testing the latter is enough.
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1107  	 */
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1108  	if (pinmux_generic_get_function(pcs->pctl, fsel)->data != function) {
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1109  		devm_kfree(pcs->dev, pins);
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1110  		devm_kfree(pcs->dev, vals);
56403881c93a331 Alexander Sverdlin     2026-11-20 @1111  		devm_kfree(pcs->dev, function->conf);
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1112  		devm_kfree(pcs->dev, function);
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1113  		devm_kfree(pcs->dev, pgnames);
ad2093840ca3bad Alexander Sverdlin     2026-10-01  1114  	}
a4ab10860723652 Tony Lindgren          2018-07-05  1115  	mutex_unlock(&pcs->mutex);
a4ab10860723652 Tony Lindgren          2018-07-05  1116  
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1117  	return 0;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1118  
9dddb4df90d1364 Haojian Zhuang         2013-02-17  1119  free_pingroups:
a4ab10860723652 Tony Lindgren          2018-07-05  1120  	pinctrl_generic_remove_group(pcs->pctl, gsel);
9dddb4df90d1364 Haojian Zhuang         2013-02-17  1121  	*num_maps = 1;
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1122  free_function:
a4ab10860723652 Tony Lindgren          2018-07-05  1123  	pinmux_generic_remove_function(pcs->pctl, fsel);
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1124  free_pins:
673ba5a05ca14c2 Wei Yongjun            2018-07-11  1125  	mutex_unlock(&pcs->mutex);
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1126  	devm_kfree(pcs->dev, pins);
8b8b091bf07fa7e Tony Lindgren          2012-07-10  1127  
4e7e8017a80e181 Manjunathappa, Prakash 2013-05-21  1128  free_vals:
4e7e8017a80e181 Manjunathappa, Prakash 2013-05-21  1129  	devm_kfree(pcs->dev, vals);
4e7e8017a80e181 Manjunathappa, Prakash 2013-05-21  1130  
4e7e8017a80e181 Manjunathappa, Prakash 2013-05-21  1131  	return res;
4e7e8017a80e181 Manjunathappa, Prakash 2013-05-21  1132  }
4e7e8017a80e181 Manjunathappa, Prakash 2013-05-21  1133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

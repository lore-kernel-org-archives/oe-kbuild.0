Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BC810EE
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Nov 2023 01:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETfL/l2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698802964; x=1730338964;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lVBWxgCrB319wvbyL6xm2t+XG7nwjjZDhohAYx9eV4g=;
  b=ETfL/l2hS/1lHBY4JHEVqbuz9sGgHxfiOXPy/YqnZLqJtdP07odWu/Ku
   lR+67QbxLmOWFmwr6O0xBWMqa3W7QX57/IBM5KZ1tWMkiDmq3+FQPTdsv
   1/qPUd9LyvM9BQkHuaJRZ78MhVi9x/RiHPR8m6b9x/0RyGXuLcE0bbMrt
   XHeAFJzJ+skYxAAGbZ0f4eFafQse6q9itDRunxps+qWytyGqWaIZWOIcT
   fmU9kWEV7iHDEpNnlu9tFO7DULw9jzJfpHrezqxiSehryTugEDrFiigQF
   X+1k/l8ilWWvh2JMEy8DJsYmBbMYVgI1v3JjuMy3xW+qGhyeRby/sgUYi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="387297287"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="387297287"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 18:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="710624440"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="710624440"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Oct 2023 18:42:22 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy0FQ-0000WG-1T;
	Wed, 01 Nov 2023 01:42:20 +0000
Date: Wed, 1 Nov 2023 09:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format
 string contains non-ascii character '\x95'
Message-ID: <202311010944.XkkHtrlr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mario Limonciello <mario.limonciello@amd.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a6a09e97199d6600d31383055f9d43fbbcbe86f
commit: 76e55d938c5bfd2b28ee868fe071181cce5353ad pinctrl: amd: Pick some different unicode symbols
date:   1 year, 2 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-c024-20230123 (https://download.01.org/0day-ci/archive/20231101/202311010944.XkkHtrlr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231101/202311010944.XkkHtrlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311010944.XkkHtrlr-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x95'

Old smatch warnings:
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x9a'
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xa1'
drivers/pinctrl/pinctrl-amd.c:320 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
drivers/pinctrl/pinctrl-amd.c:320 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
drivers/pinctrl/pinctrl-amd.c:320 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x91'
drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x93'
drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xf0'
drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x9f'
drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x91'

vim +370 drivers/pinctrl/pinctrl-amd.c

2956b5d94a76b5 Mika Westerberg          2017-01-23  194  
dbad75dd1f25e0 Ken Xue                  2015-03-10  195  #ifdef CONFIG_DEBUG_FS
dbad75dd1f25e0 Ken Xue                  2015-03-10  196  static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
dbad75dd1f25e0 Ken Xue                  2015-03-10  197  {
dbad75dd1f25e0 Ken Xue                  2015-03-10  198  	u32 pin_reg;
39cc1d3397053f Coiby Xu                 2020-11-06  199  	u32 db_cntrl;
dbad75dd1f25e0 Ken Xue                  2015-03-10  200  	unsigned long flags;
dbad75dd1f25e0 Ken Xue                  2015-03-10  201  	unsigned int bank, i, pin_num;
04d36723116256 Linus Walleij            2015-12-08  202  	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
dbad75dd1f25e0 Ken Xue                  2015-03-10  203  
39cc1d3397053f Coiby Xu                 2020-11-06  204  	bool tmr_out_unit;
39cc1d3397053f Coiby Xu                 2020-11-06  205  	bool tmr_large;
39cc1d3397053f Coiby Xu                 2020-11-06  206  
dbad75dd1f25e0 Ken Xue                  2015-03-10  207  	char *level_trig;
dbad75dd1f25e0 Ken Xue                  2015-03-10  208  	char *active_level;
dbad75dd1f25e0 Ken Xue                  2015-03-10  209  	char *interrupt_enable;
dbad75dd1f25e0 Ken Xue                  2015-03-10  210  	char *interrupt_mask;
dbad75dd1f25e0 Ken Xue                  2015-03-10  211  	char *wake_cntrl0;
dbad75dd1f25e0 Ken Xue                  2015-03-10  212  	char *wake_cntrl1;
dbad75dd1f25e0 Ken Xue                  2015-03-10  213  	char *wake_cntrl2;
dbad75dd1f25e0 Ken Xue                  2015-03-10  214  	char *pin_sts;
dbad75dd1f25e0 Ken Xue                  2015-03-10  215  	char *pull_up_sel;
dbad75dd1f25e0 Ken Xue                  2015-03-10  216  	char *pull_up_enable;
dbad75dd1f25e0 Ken Xue                  2015-03-10  217  	char *pull_down_enable;
e8129a076a509c Mario Limonciello        2022-07-22  218  	char *orientation;
39cc1d3397053f Coiby Xu                 2020-11-06  219  	char debounce_value[40];
39cc1d3397053f Coiby Xu                 2020-11-06  220  	char *debounce_enable;
dbad75dd1f25e0 Ken Xue                  2015-03-10  221  
3bfd44306c65d0 Shah, Nehal-bakulchandra 2016-12-06  222  	for (bank = 0; bank < gpio_dev->hwbank_num; bank++) {
e8129a076a509c Mario Limonciello        2022-07-22  223  		unsigned int time = 0;
e8129a076a509c Mario Limonciello        2022-07-22  224  		unsigned int unit = 0;
dbad75dd1f25e0 Ken Xue                  2015-03-10  225  
dbad75dd1f25e0 Ken Xue                  2015-03-10  226  		switch (bank) {
dbad75dd1f25e0 Ken Xue                  2015-03-10  227  		case 0:
dbad75dd1f25e0 Ken Xue                  2015-03-10  228  			i = 0;
dbad75dd1f25e0 Ken Xue                  2015-03-10  229  			pin_num = AMD_GPIO_PINS_BANK0;
dbad75dd1f25e0 Ken Xue                  2015-03-10  230  			break;
dbad75dd1f25e0 Ken Xue                  2015-03-10  231  		case 1:
dbad75dd1f25e0 Ken Xue                  2015-03-10  232  			i = 64;
dbad75dd1f25e0 Ken Xue                  2015-03-10  233  			pin_num = AMD_GPIO_PINS_BANK1 + i;
dbad75dd1f25e0 Ken Xue                  2015-03-10  234  			break;
dbad75dd1f25e0 Ken Xue                  2015-03-10  235  		case 2:
dbad75dd1f25e0 Ken Xue                  2015-03-10  236  			i = 128;
dbad75dd1f25e0 Ken Xue                  2015-03-10  237  			pin_num = AMD_GPIO_PINS_BANK2 + i;
dbad75dd1f25e0 Ken Xue                  2015-03-10  238  			break;
3bfd44306c65d0 Shah, Nehal-bakulchandra 2016-12-06  239  		case 3:
3bfd44306c65d0 Shah, Nehal-bakulchandra 2016-12-06  240  			i = 192;
3bfd44306c65d0 Shah, Nehal-bakulchandra 2016-12-06  241  			pin_num = AMD_GPIO_PINS_BANK3 + i;
3bfd44306c65d0 Shah, Nehal-bakulchandra 2016-12-06  242  			break;
6ac4c1ad2eda7f Linus Walleij            2017-01-03  243  		default:
6ac4c1ad2eda7f Linus Walleij            2017-01-03  244  			/* Illegal bank number, ignore */
6ac4c1ad2eda7f Linus Walleij            2017-01-03  245  			continue;
dbad75dd1f25e0 Ken Xue                  2015-03-10  246  		}
e8129a076a509c Mario Limonciello        2022-07-22  247  		seq_printf(s, "GPIO bank%d\n", bank);
dbad75dd1f25e0 Ken Xue                  2015-03-10  248  		for (; i < pin_num; i++) {
76e55d938c5bfd Mario Limonciello        2022-08-23  249  			seq_printf(s, "#%d\t", i);
229710fecdd805 Julia Cartwright         2017-03-09  250  			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
dbad75dd1f25e0 Ken Xue                  2015-03-10  251  			pin_reg = readl(gpio_dev->base + i * 4);
229710fecdd805 Julia Cartwright         2017-03-09  252  			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
dbad75dd1f25e0 Ken Xue                  2015-03-10  253  
dbad75dd1f25e0 Ken Xue                  2015-03-10  254  			if (pin_reg & BIT(INTERRUPT_ENABLE_OFF)) {
1766e4b7047acf Daniel Kurtz             2018-07-16  255  				u8 level = (pin_reg >> ACTIVE_LEVEL_OFF) &
1766e4b7047acf Daniel Kurtz             2018-07-16  256  						ACTIVE_LEVEL_MASK;
e8129a076a509c Mario Limonciello        2022-07-22  257  				interrupt_enable = "+";
dbad75dd1f25e0 Ken Xue                  2015-03-10  258  
1766e4b7047acf Daniel Kurtz             2018-07-16  259  				if (level == ACTIVE_LEVEL_HIGH)
e8129a076a509c Mario Limonciello        2022-07-22  260  					active_level = "↑";
1766e4b7047acf Daniel Kurtz             2018-07-16  261  				else if (level == ACTIVE_LEVEL_LOW)
e8129a076a509c Mario Limonciello        2022-07-22  262  					active_level = "↓";
1766e4b7047acf Daniel Kurtz             2018-07-16  263  				else if (!(pin_reg & BIT(LEVEL_TRIG_OFF)) &&
1766e4b7047acf Daniel Kurtz             2018-07-16  264  					 level == ACTIVE_LEVEL_BOTH)
e8129a076a509c Mario Limonciello        2022-07-22  265  					active_level = "b";
dbad75dd1f25e0 Ken Xue                  2015-03-10  266  				else
e8129a076a509c Mario Limonciello        2022-07-22  267  					active_level = "?";
dbad75dd1f25e0 Ken Xue                  2015-03-10  268  
dbad75dd1f25e0 Ken Xue                  2015-03-10  269  				if (pin_reg & BIT(LEVEL_TRIG_OFF))
e8129a076a509c Mario Limonciello        2022-07-22  270  					level_trig = "level";
dbad75dd1f25e0 Ken Xue                  2015-03-10  271  				else
e8129a076a509c Mario Limonciello        2022-07-22  272  					level_trig = " edge";
dbad75dd1f25e0 Ken Xue                  2015-03-10  273  
dbad75dd1f25e0 Ken Xue                  2015-03-10  274  			} else {
e8129a076a509c Mario Limonciello        2022-07-22  275  				interrupt_enable = "∅";
e8129a076a509c Mario Limonciello        2022-07-22  276  				active_level = "∅";
e8129a076a509c Mario Limonciello        2022-07-22  277  				level_trig = "    ∅";
dbad75dd1f25e0 Ken Xue                  2015-03-10  278  			}
dbad75dd1f25e0 Ken Xue                  2015-03-10  279  
dbad75dd1f25e0 Ken Xue                  2015-03-10  280  			if (pin_reg & BIT(INTERRUPT_MASK_OFF))
76e55d938c5bfd Mario Limonciello        2022-08-23  281  				interrupt_mask = "😛";
dbad75dd1f25e0 Ken Xue                  2015-03-10  282  			else
76e55d938c5bfd Mario Limonciello        2022-08-23  283  				interrupt_mask = "😷";
76e55d938c5bfd Mario Limonciello        2022-08-23  284  			seq_printf(s, "int %s (%s)| active-%s| %s-⚡| ",
e8129a076a509c Mario Limonciello        2022-07-22  285  				   interrupt_enable,
e8129a076a509c Mario Limonciello        2022-07-22  286  				   interrupt_mask,
e8129a076a509c Mario Limonciello        2022-07-22  287  				   active_level,
e8129a076a509c Mario Limonciello        2022-07-22  288  				   level_trig);
dbad75dd1f25e0 Ken Xue                  2015-03-10  289  
3bfd44306c65d0 Shah, Nehal-bakulchandra 2016-12-06  290  			if (pin_reg & BIT(WAKE_CNTRL_OFF_S0I3))
76e55d938c5bfd Mario Limonciello        2022-08-23  291  				wake_cntrl0 = "⏰";
dbad75dd1f25e0 Ken Xue                  2015-03-10  292  			else
e8129a076a509c Mario Limonciello        2022-07-22  293  				wake_cntrl0 = " ∅";
76e55d938c5bfd Mario Limonciello        2022-08-23  294  			seq_printf(s, "S0i3 %s| ", wake_cntrl0);
dbad75dd1f25e0 Ken Xue                  2015-03-10  295  
3bfd44306c65d0 Shah, Nehal-bakulchandra 2016-12-06  296  			if (pin_reg & BIT(WAKE_CNTRL_OFF_S3))
76e55d938c5bfd Mario Limonciello        2022-08-23  297  				wake_cntrl1 = "⏰";
dbad75dd1f25e0 Ken Xue                  2015-03-10  298  			else
e8129a076a509c Mario Limonciello        2022-07-22  299  				wake_cntrl1 = " ∅";
76e55d938c5bfd Mario Limonciello        2022-08-23  300  			seq_printf(s, "S3 %s| ", wake_cntrl1);
dbad75dd1f25e0 Ken Xue                  2015-03-10  301  
3bfd44306c65d0 Shah, Nehal-bakulchandra 2016-12-06  302  			if (pin_reg & BIT(WAKE_CNTRL_OFF_S4))
76e55d938c5bfd Mario Limonciello        2022-08-23  303  				wake_cntrl2 = "⏰";
dbad75dd1f25e0 Ken Xue                  2015-03-10  304  			else
e8129a076a509c Mario Limonciello        2022-07-22  305  				wake_cntrl2 = " ∅";
76e55d938c5bfd Mario Limonciello        2022-08-23  306  			seq_printf(s, "S4/S5 %s| ", wake_cntrl2);
dbad75dd1f25e0 Ken Xue                  2015-03-10  307  
dbad75dd1f25e0 Ken Xue                  2015-03-10  308  			if (pin_reg & BIT(PULL_UP_ENABLE_OFF)) {
e8129a076a509c Mario Limonciello        2022-07-22  309  				pull_up_enable = "+";
dbad75dd1f25e0 Ken Xue                  2015-03-10  310  				if (pin_reg & BIT(PULL_UP_SEL_OFF))
e8129a076a509c Mario Limonciello        2022-07-22  311  					pull_up_sel = "8k";
dbad75dd1f25e0 Ken Xue                  2015-03-10  312  				else
e8129a076a509c Mario Limonciello        2022-07-22  313  					pull_up_sel = "4k";
dbad75dd1f25e0 Ken Xue                  2015-03-10  314  			} else {
e8129a076a509c Mario Limonciello        2022-07-22  315  				pull_up_enable = "∅";
dbad75dd1f25e0 Ken Xue                  2015-03-10  316  				pull_up_sel = "  ";
dbad75dd1f25e0 Ken Xue                  2015-03-10  317  			}
e8129a076a509c Mario Limonciello        2022-07-22  318  			seq_printf(s, "pull-↑ %s (%s)| ",
e8129a076a509c Mario Limonciello        2022-07-22  319  				   pull_up_enable,
e8129a076a509c Mario Limonciello        2022-07-22  320  				   pull_up_sel);
dbad75dd1f25e0 Ken Xue                  2015-03-10  321  
dbad75dd1f25e0 Ken Xue                  2015-03-10  322  			if (pin_reg & BIT(PULL_DOWN_ENABLE_OFF))
e8129a076a509c Mario Limonciello        2022-07-22  323  				pull_down_enable = "+";
dbad75dd1f25e0 Ken Xue                  2015-03-10  324  			else
e8129a076a509c Mario Limonciello        2022-07-22  325  				pull_down_enable = "∅";
e8129a076a509c Mario Limonciello        2022-07-22  326  			seq_printf(s, "pull-↓ %s| ", pull_down_enable);
dbad75dd1f25e0 Ken Xue                  2015-03-10  327  
dbad75dd1f25e0 Ken Xue                  2015-03-10  328  			if (pin_reg & BIT(OUTPUT_ENABLE_OFF)) {
e8129a076a509c Mario Limonciello        2022-07-22  329  				pin_sts = "output";
dbad75dd1f25e0 Ken Xue                  2015-03-10  330  				if (pin_reg & BIT(OUTPUT_VALUE_OFF))
e8129a076a509c Mario Limonciello        2022-07-22  331  					orientation = "↑";
dbad75dd1f25e0 Ken Xue                  2015-03-10  332  				else
e8129a076a509c Mario Limonciello        2022-07-22  333  					orientation = "↓";
dbad75dd1f25e0 Ken Xue                  2015-03-10  334  			} else {
e8129a076a509c Mario Limonciello        2022-07-22  335  				pin_sts = "input ";
dbad75dd1f25e0 Ken Xue                  2015-03-10  336  				if (pin_reg & BIT(PIN_STS_OFF))
e8129a076a509c Mario Limonciello        2022-07-22  337  					orientation = "↑";
dbad75dd1f25e0 Ken Xue                  2015-03-10  338  				else
e8129a076a509c Mario Limonciello        2022-07-22  339  					orientation = "↓";
dbad75dd1f25e0 Ken Xue                  2015-03-10  340  			}
e8129a076a509c Mario Limonciello        2022-07-22  341  			seq_printf(s, "%s %s| ", pin_sts, orientation);
dbad75dd1f25e0 Ken Xue                  2015-03-10  342  
39cc1d3397053f Coiby Xu                 2020-11-06  343  			db_cntrl = (DB_CNTRl_MASK << DB_CNTRL_OFF) & pin_reg;
39cc1d3397053f Coiby Xu                 2020-11-06  344  			if (db_cntrl) {
39cc1d3397053f Coiby Xu                 2020-11-06  345  				tmr_out_unit = pin_reg & BIT(DB_TMR_OUT_UNIT_OFF);
39cc1d3397053f Coiby Xu                 2020-11-06  346  				tmr_large = pin_reg & BIT(DB_TMR_LARGE_OFF);
39cc1d3397053f Coiby Xu                 2020-11-06  347  				time = pin_reg & DB_TMR_OUT_MASK;
39cc1d3397053f Coiby Xu                 2020-11-06  348  				if (tmr_large) {
39cc1d3397053f Coiby Xu                 2020-11-06  349  					if (tmr_out_unit)
39cc1d3397053f Coiby Xu                 2020-11-06  350  						unit = 62500;
39cc1d3397053f Coiby Xu                 2020-11-06  351  					else
39cc1d3397053f Coiby Xu                 2020-11-06  352  						unit = 15625;
39cc1d3397053f Coiby Xu                 2020-11-06  353  				} else {
39cc1d3397053f Coiby Xu                 2020-11-06  354  					if (tmr_out_unit)
39cc1d3397053f Coiby Xu                 2020-11-06  355  						unit = 244;
39cc1d3397053f Coiby Xu                 2020-11-06  356  					else
39cc1d3397053f Coiby Xu                 2020-11-06  357  						unit = 61;
39cc1d3397053f Coiby Xu                 2020-11-06  358  				}
39cc1d3397053f Coiby Xu                 2020-11-06  359  				if ((DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF) == db_cntrl)
e8129a076a509c Mario Limonciello        2022-07-22  360  					debounce_enable = "b +";
39cc1d3397053f Coiby Xu                 2020-11-06  361  				else if ((DB_TYPE_PRESERVE_LOW_GLITCH << DB_CNTRL_OFF) == db_cntrl)
e8129a076a509c Mario Limonciello        2022-07-22  362  					debounce_enable = "↓ +";
39cc1d3397053f Coiby Xu                 2020-11-06  363  				else
e8129a076a509c Mario Limonciello        2022-07-22  364  					debounce_enable = "↑ +";
39cc1d3397053f Coiby Xu                 2020-11-06  365  
39cc1d3397053f Coiby Xu                 2020-11-06  366  			} else {
e8129a076a509c Mario Limonciello        2022-07-22  367  				debounce_enable = "  ∅";
39cc1d3397053f Coiby Xu                 2020-11-06  368  			}
e8129a076a509c Mario Limonciello        2022-07-22  369  			snprintf(debounce_value, sizeof(debounce_value), "%u", time * unit);
76e55d938c5bfd Mario Limonciello        2022-08-23 @370  			seq_printf(s, "debounce %s (🕑 %sus)| ", debounce_enable, debounce_value);
e8129a076a509c Mario Limonciello        2022-07-22  371  			seq_printf(s, " 0x%x\n", pin_reg);
dbad75dd1f25e0 Ken Xue                  2015-03-10  372  		}
dbad75dd1f25e0 Ken Xue                  2015-03-10  373  	}
dbad75dd1f25e0 Ken Xue                  2015-03-10  374  }
dbad75dd1f25e0 Ken Xue                  2015-03-10  375  #else
dbad75dd1f25e0 Ken Xue                  2015-03-10  376  #define amd_gpio_dbg_show NULL
dbad75dd1f25e0 Ken Xue                  2015-03-10  377  #endif
dbad75dd1f25e0 Ken Xue                  2015-03-10  378  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

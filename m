Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AF71DA5E
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Aug 2024 07:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724485441; cv=none; b=WVEZu2z6P0nr5USja4UNLGYrpU2sPOONAToMriDyC8G0XtTKtrZXGzdQoGQ2ZATYjAg31l9mD9/dVbjUht++nRnGUFZta60/cDw+eXu6iigm9v87SysCCksnEZlpegxxL9ZKnhm7uQ4NVLYnghDJds7BN5G02G3A7gdf65K3+40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724485441; c=relaxed/simple;
	bh=Aglyc4CLcoUGBwjgo7Y5xVhokzcmuOKlY1+jKzkRe+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MEcp02zKTU+5J98y9vx1zKpXMNpaOqf8/gMJUJpNiZ7T4fRhktH65Twf+mCdRvVIhTruucH2d074DNqPG/vURkFXMoutztnhmIpVZD66HfFn7jSIsTb6uWj96DQd+7DcyC0PqzLoe2PB1/RVCbeZ7POoDMpq0ZzMPzhudYayq9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clfiQcPO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clfiQcPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724485439; x=1756021439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aglyc4CLcoUGBwjgo7Y5xVhokzcmuOKlY1+jKzkRe+U=;
  b=clfiQcPOSk5C2NlbtsPGcWbflR3D8eBV0oOBBd2tMB94Crzw0cM923X+
   8KNKPik9HWjypzuZ4GzAXNAdCYjAcPk7QLBJO5WcljcyjKYXzc/gCWPkp
   J8NjV0iMsEjBqRPXrNL8bPnXXrJzjtA45WfiFaUQLdpfmxAYuAsCSadol
   lreMcTkIIFe9YsKGOZM1PTUItx1PibsRLMhhNSQxQCQD8KgOd/808S4C/
   IDYbVwfYEdtqV8py52qBwuhZnD+JUbChbDGQo6zH9oK2xKmrV1BfmzUvy
   fc+yP8cVjcmbGy26Vo0vqb909rr6DXjZH3JAjMshqq6j3E3HjZZEtFj5r
   w==;
X-CSE-ConnectionGUID: 20ZVbDyYTTCviSs7XNh4iA==
X-CSE-MsgGUID: A2fbKxzOR96JV7fDfo+lyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="33588047"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="33588047"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 00:43:58 -0700
X-CSE-ConnectionGUID: Rx95y0CWRjatojDqFI43zw==
X-CSE-MsgGUID: oRUck1wCTA65Gvhpy62q7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="99529616"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Aug 2024 00:43:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shlRC-000EL5-2v;
	Sat, 24 Aug 2024 07:43:54 +0000
Date: Sat, 24 Aug 2024 15:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 1/5] gpio: rockchip: support acpi
Message-ID: <202408241538.j3g0NqRa-lkp@intel.com>
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
In-Reply-To: <20240815071651.3645949-2-ye.zhang@rock-chips.com>
References: <20240815071651.3645949-2-ye.zhang@rock-chips.com>
TO: Ye Zhang <ye.zhang@rock-chips.com>
TO: linus.walleij@linaro.org
TO: brgl@bgdev.pl
TO: heiko@sntech.de
TO: linux-gpio@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: tao.huang@rock-chips.com
CC: finley.xiao@rock-chips.com
CC: tim.chen@rock-chips.com
CC: elaine.zhang@rock-chips.com
CC: Ye Zhang <ye.zhang@rock-chips.com>

Hi Ye,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on brgl/gpio/for-next linus/master v6.11-rc4 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Zhang/gpio-rockchip-support-acpi/20240815-154340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20240815071651.3645949-2-ye.zhang%40rock-chips.com
patch subject: [PATCH v1 1/5] gpio: rockchip: support acpi
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arc-randconfig-r073-20240824 (https://download.01.org/0day-ci/archive/20240824/202408241538.j3g0NqRa-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408241538.j3g0NqRa-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-rockchip.c:797 rockchip_gpio_probe() warn: can 'cfg' even be NULL?

vim +/cfg +797 drivers/gpio/gpio-rockchip.c

371a1b26dd7c7c Ye Zhang       2024-08-15  698  
936ee2675eee1f Jianqun Xu     2021-08-16  699  static int rockchip_gpio_probe(struct platform_device *pdev)
936ee2675eee1f Jianqun Xu     2021-08-16  700  {
936ee2675eee1f Jianqun Xu     2021-08-16  701  	struct device *dev = &pdev->dev;
936ee2675eee1f Jianqun Xu     2021-08-16  702  	struct pinctrl_dev *pctldev = NULL;
936ee2675eee1f Jianqun Xu     2021-08-16  703  	struct rockchip_pin_bank *bank = NULL;
371a1b26dd7c7c Ye Zhang       2024-08-15  704  	int bank_id = 0;
371a1b26dd7c7c Ye Zhang       2024-08-15  705  	int ret;
936ee2675eee1f Jianqun Xu     2021-08-16  706  
371a1b26dd7c7c Ye Zhang       2024-08-15  707  	bank_id = rockchip_gpio_acpi_get_bank_id(dev);
371a1b26dd7c7c Ye Zhang       2024-08-15  708  	if (bank_id < 0) {
371a1b26dd7c7c Ye Zhang       2024-08-15  709  		bank_id = rockchip_gpio_of_get_bank_id(dev);
371a1b26dd7c7c Ye Zhang       2024-08-15  710  		if (bank_id < 0)
371a1b26dd7c7c Ye Zhang       2024-08-15  711  			return bank_id;
371a1b26dd7c7c Ye Zhang       2024-08-15  712  	}
371a1b26dd7c7c Ye Zhang       2024-08-15  713  
371a1b26dd7c7c Ye Zhang       2024-08-15  714  	if (!ACPI_COMPANION(dev)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  715  		struct device_node *pctlnp = of_get_parent(dev->of_node);
936ee2675eee1f Jianqun Xu     2021-08-16  716  
936ee2675eee1f Jianqun Xu     2021-08-16  717  		pctldev = of_pinctrl_get(pctlnp);
371a1b26dd7c7c Ye Zhang       2024-08-15  718  		of_node_put(pctlnp);
936ee2675eee1f Jianqun Xu     2021-08-16  719  		if (!pctldev)
936ee2675eee1f Jianqun Xu     2021-08-16  720  			return -EPROBE_DEFER;
936ee2675eee1f Jianqun Xu     2021-08-16  721  
371a1b26dd7c7c Ye Zhang       2024-08-15  722  		bank = rockchip_gpio_find_bank(pctldev, bank_id);
371a1b26dd7c7c Ye Zhang       2024-08-15  723  		if (!bank)
371a1b26dd7c7c Ye Zhang       2024-08-15  724  			return -ENODEV;
371a1b26dd7c7c Ye Zhang       2024-08-15  725  	}
936ee2675eee1f Jianqun Xu     2021-08-16  726  
371a1b26dd7c7c Ye Zhang       2024-08-15  727  	if (!bank) {
371a1b26dd7c7c Ye Zhang       2024-08-15  728  		bank = devm_kzalloc(dev, sizeof(*bank), GFP_KERNEL);
936ee2675eee1f Jianqun Xu     2021-08-16  729  		if (!bank)
371a1b26dd7c7c Ye Zhang       2024-08-15  730  			return -ENOMEM;
371a1b26dd7c7c Ye Zhang       2024-08-15  731  	}
936ee2675eee1f Jianqun Xu     2021-08-16  732  
371a1b26dd7c7c Ye Zhang       2024-08-15  733  	bank->bank_num = bank_id;
936ee2675eee1f Jianqun Xu     2021-08-16  734  	bank->dev = dev;
371a1b26dd7c7c Ye Zhang       2024-08-15  735  
371a1b26dd7c7c Ye Zhang       2024-08-15  736  	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
371a1b26dd7c7c Ye Zhang       2024-08-15  737  	if (IS_ERR(bank->reg_base))
371a1b26dd7c7c Ye Zhang       2024-08-15  738  		return PTR_ERR(bank->reg_base);
371a1b26dd7c7c Ye Zhang       2024-08-15  739  
371a1b26dd7c7c Ye Zhang       2024-08-15  740  	bank->irq = platform_get_irq(pdev, 0);
371a1b26dd7c7c Ye Zhang       2024-08-15  741  	if (bank->irq < 0)
371a1b26dd7c7c Ye Zhang       2024-08-15  742  		return bank->irq;
936ee2675eee1f Jianqun Xu     2021-08-16  743  
936ee2675eee1f Jianqun Xu     2021-08-16  744  	raw_spin_lock_init(&bank->slock);
936ee2675eee1f Jianqun Xu     2021-08-16  745  
371a1b26dd7c7c Ye Zhang       2024-08-15  746  	if (!ACPI_COMPANION(dev)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  747  		bank->clk = devm_clk_get(dev, "bus");
371a1b26dd7c7c Ye Zhang       2024-08-15  748  		if (IS_ERR(bank->clk)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  749  			bank->clk = of_clk_get(dev->of_node, 0);
371a1b26dd7c7c Ye Zhang       2024-08-15  750  			if (IS_ERR(bank->clk)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  751  				dev_err(dev, "fail to get apb clock\n");
371a1b26dd7c7c Ye Zhang       2024-08-15  752  				return PTR_ERR(bank->clk);
371a1b26dd7c7c Ye Zhang       2024-08-15  753  			}
371a1b26dd7c7c Ye Zhang       2024-08-15  754  		}
371a1b26dd7c7c Ye Zhang       2024-08-15  755  
371a1b26dd7c7c Ye Zhang       2024-08-15  756  		bank->db_clk = devm_clk_get(dev, "db");
371a1b26dd7c7c Ye Zhang       2024-08-15  757  		if (IS_ERR(bank->db_clk)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  758  			bank->db_clk = of_clk_get(dev->of_node, 1);
371a1b26dd7c7c Ye Zhang       2024-08-15  759  			if (IS_ERR(bank->db_clk))
371a1b26dd7c7c Ye Zhang       2024-08-15  760  				bank->db_clk = NULL;
371a1b26dd7c7c Ye Zhang       2024-08-15  761  		}
371a1b26dd7c7c Ye Zhang       2024-08-15  762  	}
371a1b26dd7c7c Ye Zhang       2024-08-15  763  
371a1b26dd7c7c Ye Zhang       2024-08-15  764  	clk_prepare_enable(bank->clk);
371a1b26dd7c7c Ye Zhang       2024-08-15  765  	clk_prepare_enable(bank->db_clk);
371a1b26dd7c7c Ye Zhang       2024-08-15  766  
371a1b26dd7c7c Ye Zhang       2024-08-15  767  	rockchip_gpio_get_ver(bank);
936ee2675eee1f Jianqun Xu     2021-08-16  768  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  769  	/*
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  770  	 * Prevent clashes with a deferred output setting
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  771  	 * being added right at this moment.
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  772  	 */
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  773  	mutex_lock(&bank->deferred_lock);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  774  
936ee2675eee1f Jianqun Xu     2021-08-16  775  	ret = rockchip_gpiolib_register(bank);
936ee2675eee1f Jianqun Xu     2021-08-16  776  	if (ret) {
371a1b26dd7c7c Ye Zhang       2024-08-15  777  		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
371a1b26dd7c7c Ye Zhang       2024-08-15  778  		goto err_unlock;
371a1b26dd7c7c Ye Zhang       2024-08-15  779  	}
371a1b26dd7c7c Ye Zhang       2024-08-15  780  
371a1b26dd7c7c Ye Zhang       2024-08-15  781  	if (!device_property_read_bool(bank->dev, "gpio-ranges") && pctldev) {
371a1b26dd7c7c Ye Zhang       2024-08-15  782  		struct gpio_chip *gc = &bank->gpio_chip;
371a1b26dd7c7c Ye Zhang       2024-08-15  783  
371a1b26dd7c7c Ye Zhang       2024-08-15  784  		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
371a1b26dd7c7c Ye Zhang       2024-08-15  785  					     gc->base, gc->ngpio);
371a1b26dd7c7c Ye Zhang       2024-08-15  786  		if (ret) {
371a1b26dd7c7c Ye Zhang       2024-08-15  787  			dev_err(bank->dev, "Failed to add pin range\n");
371a1b26dd7c7c Ye Zhang       2024-08-15  788  			goto err_unlock;
371a1b26dd7c7c Ye Zhang       2024-08-15  789  		}
936ee2675eee1f Jianqun Xu     2021-08-16  790  	}
936ee2675eee1f Jianqun Xu     2021-08-16  791  
8ce5ef64546850 Caleb Connolly 2022-03-28  792  	while (!list_empty(&bank->deferred_pins)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  793  		struct rockchip_pin_deferred *cfg;
371a1b26dd7c7c Ye Zhang       2024-08-15  794  
8ce5ef64546850 Caleb Connolly 2022-03-28  795  		cfg = list_first_entry(&bank->deferred_pins,
8ce5ef64546850 Caleb Connolly 2022-03-28  796  				       struct rockchip_pin_deferred, head);
371a1b26dd7c7c Ye Zhang       2024-08-15 @797  		if (!cfg)
371a1b26dd7c7c Ye Zhang       2024-08-15  798  			break;
371a1b26dd7c7c Ye Zhang       2024-08-15  799  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  800  		list_del(&cfg->head);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  801  
8ce5ef64546850 Caleb Connolly 2022-03-28  802  		switch (cfg->param) {
8ce5ef64546850 Caleb Connolly 2022-03-28  803  		case PIN_CONFIG_OUTPUT:
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  804  			ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  805  			if (ret)
8ce5ef64546850 Caleb Connolly 2022-03-28  806  				dev_warn(dev, "setting output pin %u to %u failed\n", cfg->pin,
8ce5ef64546850 Caleb Connolly 2022-03-28  807  					 cfg->arg);
8ce5ef64546850 Caleb Connolly 2022-03-28  808  			break;
7ff11357810fd1 Caleb Connolly 2022-03-28  809  		case PIN_CONFIG_INPUT_ENABLE:
7ff11357810fd1 Caleb Connolly 2022-03-28  810  			ret = rockchip_gpio_direction_input(&bank->gpio_chip, cfg->pin);
7ff11357810fd1 Caleb Connolly 2022-03-28  811  			if (ret)
7ff11357810fd1 Caleb Connolly 2022-03-28  812  				dev_warn(dev, "setting input pin %u failed\n", cfg->pin);
7ff11357810fd1 Caleb Connolly 2022-03-28  813  			break;
8ce5ef64546850 Caleb Connolly 2022-03-28  814  		default:
8ce5ef64546850 Caleb Connolly 2022-03-28  815  			dev_warn(dev, "unknown deferred config param %d\n", cfg->param);
8ce5ef64546850 Caleb Connolly 2022-03-28  816  			break;
8ce5ef64546850 Caleb Connolly 2022-03-28  817  		}
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  818  		kfree(cfg);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  819  	}
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  820  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  821  	mutex_unlock(&bank->deferred_lock);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  822  
936ee2675eee1f Jianqun Xu     2021-08-16  823  	platform_set_drvdata(pdev, bank);
371a1b26dd7c7c Ye Zhang       2024-08-15  824  	dev_info(dev, "probed %pfw\n", dev_fwnode(dev));
936ee2675eee1f Jianqun Xu     2021-08-16  825  
936ee2675eee1f Jianqun Xu     2021-08-16  826  	return 0;
371a1b26dd7c7c Ye Zhang       2024-08-15  827  err_unlock:
371a1b26dd7c7c Ye Zhang       2024-08-15  828  	mutex_unlock(&bank->deferred_lock);
371a1b26dd7c7c Ye Zhang       2024-08-15  829  	clk_disable_unprepare(bank->clk);
371a1b26dd7c7c Ye Zhang       2024-08-15  830  	clk_disable_unprepare(bank->db_clk);
371a1b26dd7c7c Ye Zhang       2024-08-15  831  
371a1b26dd7c7c Ye Zhang       2024-08-15  832  	return ret;
936ee2675eee1f Jianqun Xu     2021-08-16  833  }
936ee2675eee1f Jianqun Xu     2021-08-16  834  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

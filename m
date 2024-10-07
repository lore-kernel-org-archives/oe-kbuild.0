Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D11D356C
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728308456; cv=none; b=Kf1lMj85wzTb9eUEW7aOP93MZ0qhdywR8H9E1Top7wWLP9CwqbGb8M3vLXZwCFh5Xx1QZIsGBmYmHWwcKcvSG+lrOLkPkHHbWhAbOQD5HNUdQPsCjqLzbpQxhcdIASYMCxASK34qjFj5bNid9Kc4SLCfJDDMCaIPhEsGAjsdk1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728308456; c=relaxed/simple;
	bh=kyu70truUn2ViYhXGfqyg1q5wf2WZJh8ASgbli7PZeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUOQVy3fy3MeUah+kIJsWL8pf2X6hoTgGu+T77tHipJ8m4smOhu7Jm/crbxhL/OopEmNfIPC7qjelUV9r1CMaDqwrs060GH1lEvm+qic7nO21PNVE3vBCXxq4v1zbJYNnn02aTZa8L2eW1SQXhhmEL9+FmaXalRkB3Mzfe1EFv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqocSHQt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqocSHQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728308455; x=1759844455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kyu70truUn2ViYhXGfqyg1q5wf2WZJh8ASgbli7PZeo=;
  b=kqocSHQtAsGFtRimvjeoG9f/RKqyC42Ks7cC1GL1a8kky/S1sbOMHXn/
   OON8dRwuY55fW9vRF3+LCQTYurqFqUvXe6ZfQ6AKgBr3VuMT2unPUwCcN
   omro781ovj7UsUbEvA7BPjLCygI3lCFaRdF4BPA4bhnbODiUgF2MuEHiw
   sCfOibSWxaSnhKC3Syfm72gDAqHoKPuvDFGywzHdv332QmmYskyPnEAxc
   ivxyst0I7seLQQZ1ANP9fkVWUKbd/GMwy3TNvV8B40SoLI553ihnk56cx
   mUB4L/CV7m1MfQJhVHd+F00+1vUqgFqfkeA2Sxo/fTdKPgp29Adp1GFzy
   g==;
X-CSE-ConnectionGUID: KrrSuibpTqa00jDrl/R/nA==
X-CSE-MsgGUID: FxausQC+S/KonH74RDzDkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31158111"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="31158111"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 06:40:55 -0700
X-CSE-ConnectionGUID: MfJBa+poQhaXJ0NP3MvPQQ==
X-CSE-MsgGUID: +bSAUB3uSrCnKU4uFQzQvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75482229"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Oct 2024 06:40:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxnyk-00052k-2c;
	Mon, 07 Oct 2024 13:40:50 +0000
Date: Mon, 7 Oct 2024 21:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
Message-ID: <202410072108.uG2sVTN4-lkp@intel.com>
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
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
References: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
TO: Drew Fustini <dfustini@tenstorrent.com>
TO: Drew Fustini <drew@pdp7.com>
TO: Guo Ren <guoren@kernel.org>
TO: Fu Wei <wefu@redhat.com>
TO: Linus Walleij <linus.walleij@linaro.org>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Drew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2694868880705e8f6bb61b24b1b25adc42a4a217]

url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/pinctrl-th1520-Convert-to-thp-mutex-to-guarded-mutex/20241006-033647
base:   2694868880705e8f6bb61b24b1b25adc42a4a217
patch link:    https://lore.kernel.org/r/20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00%40tenstorrent.com
patch subject: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded mutex
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r072-20241007 (https://download.01.org/0day-ci/archive/20241007/202410072108.uG2sVTN4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410072108.uG2sVTN4-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/pinctrl-th1520.c:538 th1520_pinctrl_dt_node_to_map() error: uninitialized symbol 'child'.

Old smatch warnings:
drivers/pinctrl/pinctrl-th1520.c:502 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'

vim +/child +538 drivers/pinctrl/pinctrl-th1520.c

bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  413  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  414  static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  415  					 struct device_node *np,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  416  					 struct pinctrl_map **maps,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  417  					 unsigned int *num_maps)
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  418  {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  419  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  420  	struct device_node *child;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  421  	struct pinctrl_map *map;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  422  	unsigned long *configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  423  	unsigned int nconfigs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  424  	unsigned int nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  425  	int ret;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  426  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  427  	nmaps = 0;
fb310b5cb13ad2 Drew Fustini         2024-10-05  428  	for_each_available_child_of_node_scoped(np, child) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  429  		int npins = of_property_count_strings(child, "pins");
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  430  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  431  		if (npins <= 0) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  432  			of_node_put(child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  433  			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  434  				np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  435  			return -EINVAL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  436  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  437  		nmaps += npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  438  		if (of_property_present(child, "function"))
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  439  			nmaps += npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  440  	}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  441  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  442  	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  443  	if (!map)
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  444  		return -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  445  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  446  	nmaps = 0;
fb310b5cb13ad2 Drew Fustini         2024-10-05  447  	guard(mutex)(&thp->mutex);
fb310b5cb13ad2 Drew Fustini         2024-10-05  448  	for_each_available_child_of_node_scoped(np, child) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  449  		unsigned int rollback = nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  450  		enum th1520_muxtype muxtype;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  451  		struct property *prop;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  452  		const char *funcname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  453  		const char **pgnames;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  454  		const char *pinname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  455  		int npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  456  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  457  		ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  458  		if (ret) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  459  			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  460  				np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  461  			goto put_child;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  462  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  463  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  464  		if (!of_property_read_string(child, "function", &funcname)) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  465  			muxtype = th1520_muxtype_get(funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  466  			if (!muxtype) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  467  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  468  					np, child, funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  469  				ret = -EINVAL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  470  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  471  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  472  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  473  			funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  474  						  np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  475  			if (!funcname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  476  				ret = -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  477  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  478  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  479  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  480  			npins = of_property_count_strings(child, "pins");
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  481  			pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  482  			if (!pgnames) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  483  				ret = -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  484  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  485  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  486  		} else {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  487  			funcname = NULL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  488  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  489  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  490  		npins = 0;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  491  		of_property_for_each_string(child, "pins", prop, pinname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  492  			unsigned int i;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  493  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  494  			for (i = 0; i < thp->desc.npins; i++) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  495  				if (!strcmp(pinname, thp->desc.pins[i].name))
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  496  					break;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  497  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  498  			if (i == thp->desc.npins) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  499  				nmaps = rollback;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  500  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  501  					np, child, pinname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  502  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  503  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  504  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  505  			if (nconfigs) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  506  				map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  507  				map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  508  				map[nmaps].data.configs.configs = configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  509  				map[nmaps].data.configs.num_configs = nconfigs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  510  				nmaps += 1;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  511  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  512  			if (funcname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  513  				pgnames[npins++] = thp->desc.pins[i].name;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  514  				map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  515  				map[nmaps].data.mux.function = funcname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  516  				map[nmaps].data.mux.group = thp->desc.pins[i].name;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  517  				nmaps += 1;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  518  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  519  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  520  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  521  		if (funcname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  522  			ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  523  							  npins, (void *)muxtype);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  524  			if (ret < 0) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  525  				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  526  				goto put_child;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  527  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  528  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  529  	}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  530  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  531  	*maps = map;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  532  	*num_maps = nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  533  	return 0;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  534  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  535  free_configs:
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  536  	kfree(configs);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  537  put_child:
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30 @538  	of_node_put(child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  539  	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  540  	return ret;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  541  }
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  542  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F4A40875
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Feb 2024 18:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709145532; cv=none; b=hWI6FrzpJN7wYWoJ9daQM9Ay5AQiwbmlJ6AqgBw9NZnLWysQY34BClWvRucpJ0Qwj6OvwvrDkCeTt6jkN4ytd5wHD20d2z+juoTwbrpuYf3+h4tHVC1btLd4BQeVp4NKxLUV9JhcWsHnF/6oif3ThqPTSqIykzfLWK6ZVDNelfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709145532; c=relaxed/simple;
	bh=Lz0+xmYZpm2m8w6OrFUsHIJiHn6F744LrLn3DM+VQOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InpcKar8tBq5z10C4Kok2GjfnRCiGAq6zv/fj+N9dcOY7dD6oGgnqVZlBjUlzQjPjpYPeuW11ar+I5xZeSOrIttopGITKzAutSqwH/rtEpajduR+ZrX0CmykSlylJtxO4pQePAIq0+/NaKOlHKeawWnEcyh5sHHi6ZUh3RQfto8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kv8TBdlt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kv8TBdlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709145530; x=1740681530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lz0+xmYZpm2m8w6OrFUsHIJiHn6F744LrLn3DM+VQOk=;
  b=Kv8TBdltgwOej7Dg5FnwBgztpOOfj1HGHBIsLMxFGzRKcHzEP4iDX4lG
   wTW8y05QKr0l6JpsHIiqHqRKP7aa1dRHPV/yZcHujmvGJDj5N9RbN0RRo
   JaGNsApU6zIXfAYpmgGmx1QZ0U8hJQhUZqF3UaJBQRWQtIAUwGjbkFkLE
   MPefAV6zhl5qm8CTvpbxwJx3yStib7R25x45+arwg8v9CZOb6ks7Y5gXS
   GnQFdwoaqvf8WxtUtzqMj9kj8KeE8LGVJopP4TCpKtnxTGEtICMufex0U
   bfhkR13ub525JDfXOP8oSQbIfWlIH5rd/dOIC8fo3gy3WoTMHQNQqWVwu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14121296"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="14121296"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 10:38:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="12148544"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Feb 2024 10:38:48 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfOpK-000CJN-0h;
	Wed, 28 Feb 2024 18:38:46 +0000
Date: Thu, 29 Feb 2024 02:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [esmil:th1520 3/29] drivers/pinctrl/pinctrl-th1520.c:499
 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'
Message-ID: <202402290235.AqLIV39I-lkp@intel.com>
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
TO: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   7f2988d92a4ae84f21fa512b2c15c4e007b7a9be
commit: 49128de47348770cd4f872628ce727613204a539 [3/29] pinctrl: Add driver for the T-Head TH1520 SoC
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: powerpc-randconfig-r071-20240227 (https://download.01.org/0day-ci/archive/20240229/202402290235.AqLIV39I-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402290235.AqLIV39I-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-th1520.c:499 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'

vim +/ret +499 drivers/pinctrl/pinctrl-th1520.c

49128de4734877 Emil Renner Berthing 2023-12-05  410  
49128de4734877 Emil Renner Berthing 2023-12-05  411  static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
49128de4734877 Emil Renner Berthing 2023-12-05  412  					 struct device_node *np,
49128de4734877 Emil Renner Berthing 2023-12-05  413  					 struct pinctrl_map **maps,
49128de4734877 Emil Renner Berthing 2023-12-05  414  					 unsigned int *num_maps)
49128de4734877 Emil Renner Berthing 2023-12-05  415  {
49128de4734877 Emil Renner Berthing 2023-12-05  416  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
49128de4734877 Emil Renner Berthing 2023-12-05  417  	struct device_node *child;
49128de4734877 Emil Renner Berthing 2023-12-05  418  	struct pinctrl_map *map;
49128de4734877 Emil Renner Berthing 2023-12-05  419  	unsigned long *configs;
49128de4734877 Emil Renner Berthing 2023-12-05  420  	unsigned int nconfigs;
49128de4734877 Emil Renner Berthing 2023-12-05  421  	unsigned int nmaps;
49128de4734877 Emil Renner Berthing 2023-12-05  422  	int ret;
49128de4734877 Emil Renner Berthing 2023-12-05  423  
49128de4734877 Emil Renner Berthing 2023-12-05  424  	nmaps = 0;
49128de4734877 Emil Renner Berthing 2023-12-05  425  	for_each_available_child_of_node(np, child) {
49128de4734877 Emil Renner Berthing 2023-12-05  426  		int npins = of_property_count_strings(child, "pins");
49128de4734877 Emil Renner Berthing 2023-12-05  427  
49128de4734877 Emil Renner Berthing 2023-12-05  428  		if (npins <= 0) {
49128de4734877 Emil Renner Berthing 2023-12-05  429  			of_node_put(child);
49128de4734877 Emil Renner Berthing 2023-12-05  430  			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
49128de4734877 Emil Renner Berthing 2023-12-05  431  				np, child);
49128de4734877 Emil Renner Berthing 2023-12-05  432  			return -EINVAL;
49128de4734877 Emil Renner Berthing 2023-12-05  433  		}
49128de4734877 Emil Renner Berthing 2023-12-05  434  		nmaps += npins;
49128de4734877 Emil Renner Berthing 2023-12-05  435  		if (of_property_present(child, "function"))
49128de4734877 Emil Renner Berthing 2023-12-05  436  			nmaps += npins;
49128de4734877 Emil Renner Berthing 2023-12-05  437  	}
49128de4734877 Emil Renner Berthing 2023-12-05  438  
49128de4734877 Emil Renner Berthing 2023-12-05  439  	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
49128de4734877 Emil Renner Berthing 2023-12-05  440  	if (!map)
49128de4734877 Emil Renner Berthing 2023-12-05  441  		return -ENOMEM;
49128de4734877 Emil Renner Berthing 2023-12-05  442  
49128de4734877 Emil Renner Berthing 2023-12-05  443  	nmaps = 0;
49128de4734877 Emil Renner Berthing 2023-12-05  444  	mutex_lock(&thp->mutex);
49128de4734877 Emil Renner Berthing 2023-12-05  445  	for_each_available_child_of_node(np, child) {
49128de4734877 Emil Renner Berthing 2023-12-05  446  		unsigned int rollback = nmaps;
49128de4734877 Emil Renner Berthing 2023-12-05  447  		enum th1520_muxtype muxtype;
49128de4734877 Emil Renner Berthing 2023-12-05  448  		struct property *prop;
49128de4734877 Emil Renner Berthing 2023-12-05  449  		const char *funcname;
49128de4734877 Emil Renner Berthing 2023-12-05  450  		const char **pgnames;
49128de4734877 Emil Renner Berthing 2023-12-05  451  		const char *pinname;
49128de4734877 Emil Renner Berthing 2023-12-05  452  		int npins;
49128de4734877 Emil Renner Berthing 2023-12-05  453  
49128de4734877 Emil Renner Berthing 2023-12-05  454  		ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
49128de4734877 Emil Renner Berthing 2023-12-05  455  		if (ret) {
49128de4734877 Emil Renner Berthing 2023-12-05  456  			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
49128de4734877 Emil Renner Berthing 2023-12-05  457  				np, child);
49128de4734877 Emil Renner Berthing 2023-12-05  458  			goto put_child;
49128de4734877 Emil Renner Berthing 2023-12-05  459  		}
49128de4734877 Emil Renner Berthing 2023-12-05  460  
49128de4734877 Emil Renner Berthing 2023-12-05  461  		if (!of_property_read_string(child, "function", &funcname)) {
49128de4734877 Emil Renner Berthing 2023-12-05  462  			muxtype = th1520_muxtype_get(funcname);
49128de4734877 Emil Renner Berthing 2023-12-05  463  			if (!muxtype) {
49128de4734877 Emil Renner Berthing 2023-12-05  464  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
49128de4734877 Emil Renner Berthing 2023-12-05  465  					np, child, funcname);
49128de4734877 Emil Renner Berthing 2023-12-05  466  				ret = -EINVAL;
49128de4734877 Emil Renner Berthing 2023-12-05  467  				goto free_configs;
49128de4734877 Emil Renner Berthing 2023-12-05  468  			}
49128de4734877 Emil Renner Berthing 2023-12-05  469  
49128de4734877 Emil Renner Berthing 2023-12-05  470  			funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
49128de4734877 Emil Renner Berthing 2023-12-05  471  						  np, child);
49128de4734877 Emil Renner Berthing 2023-12-05  472  			if (!funcname) {
49128de4734877 Emil Renner Berthing 2023-12-05  473  				ret = -ENOMEM;
49128de4734877 Emil Renner Berthing 2023-12-05  474  				goto free_configs;
49128de4734877 Emil Renner Berthing 2023-12-05  475  			}
49128de4734877 Emil Renner Berthing 2023-12-05  476  
49128de4734877 Emil Renner Berthing 2023-12-05  477  			npins = of_property_count_strings(child, "pins");
49128de4734877 Emil Renner Berthing 2023-12-05  478  			pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
49128de4734877 Emil Renner Berthing 2023-12-05  479  			if (!pgnames) {
49128de4734877 Emil Renner Berthing 2023-12-05  480  				ret = -ENOMEM;
49128de4734877 Emil Renner Berthing 2023-12-05  481  				goto free_configs;
49128de4734877 Emil Renner Berthing 2023-12-05  482  			}
49128de4734877 Emil Renner Berthing 2023-12-05  483  		} else {
49128de4734877 Emil Renner Berthing 2023-12-05  484  			funcname = NULL;
49128de4734877 Emil Renner Berthing 2023-12-05  485  		}
49128de4734877 Emil Renner Berthing 2023-12-05  486  
49128de4734877 Emil Renner Berthing 2023-12-05  487  		npins = 0;
49128de4734877 Emil Renner Berthing 2023-12-05  488  		of_property_for_each_string(child, "pins", prop, pinname) {
49128de4734877 Emil Renner Berthing 2023-12-05  489  			unsigned int i;
49128de4734877 Emil Renner Berthing 2023-12-05  490  
49128de4734877 Emil Renner Berthing 2023-12-05  491  			for (i = 0; i < thp->desc.npins; i++) {
49128de4734877 Emil Renner Berthing 2023-12-05  492  				if (!strcmp(pinname, thp->desc.pins[i].name))
49128de4734877 Emil Renner Berthing 2023-12-05  493  					break;
49128de4734877 Emil Renner Berthing 2023-12-05  494  			}
49128de4734877 Emil Renner Berthing 2023-12-05  495  			if (i == thp->desc.npins) {
49128de4734877 Emil Renner Berthing 2023-12-05  496  				nmaps = rollback;
49128de4734877 Emil Renner Berthing 2023-12-05  497  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
49128de4734877 Emil Renner Berthing 2023-12-05  498  					np, child, pinname);
49128de4734877 Emil Renner Berthing 2023-12-05 @499  				goto free_configs;
49128de4734877 Emil Renner Berthing 2023-12-05  500  			}
49128de4734877 Emil Renner Berthing 2023-12-05  501  
49128de4734877 Emil Renner Berthing 2023-12-05  502  			if (nconfigs) {
49128de4734877 Emil Renner Berthing 2023-12-05  503  				map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
49128de4734877 Emil Renner Berthing 2023-12-05  504  				map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
49128de4734877 Emil Renner Berthing 2023-12-05  505  				map[nmaps].data.configs.configs = configs;
49128de4734877 Emil Renner Berthing 2023-12-05  506  				map[nmaps].data.configs.num_configs = nconfigs;
49128de4734877 Emil Renner Berthing 2023-12-05  507  				nmaps += 1;
49128de4734877 Emil Renner Berthing 2023-12-05  508  			}
49128de4734877 Emil Renner Berthing 2023-12-05  509  			if (funcname) {
49128de4734877 Emil Renner Berthing 2023-12-05  510  				pgnames[npins++] = thp->desc.pins[i].name;
49128de4734877 Emil Renner Berthing 2023-12-05  511  				map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
49128de4734877 Emil Renner Berthing 2023-12-05  512  				map[nmaps].data.mux.function = funcname;
49128de4734877 Emil Renner Berthing 2023-12-05  513  				map[nmaps].data.mux.group = thp->desc.pins[i].name;
49128de4734877 Emil Renner Berthing 2023-12-05  514  				nmaps += 1;
49128de4734877 Emil Renner Berthing 2023-12-05  515  			}
49128de4734877 Emil Renner Berthing 2023-12-05  516  		}
49128de4734877 Emil Renner Berthing 2023-12-05  517  
49128de4734877 Emil Renner Berthing 2023-12-05  518  		if (funcname) {
49128de4734877 Emil Renner Berthing 2023-12-05  519  			ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
49128de4734877 Emil Renner Berthing 2023-12-05  520  							  npins, (void *)muxtype);
49128de4734877 Emil Renner Berthing 2023-12-05  521  			if (ret < 0) {
49128de4734877 Emil Renner Berthing 2023-12-05  522  				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
49128de4734877 Emil Renner Berthing 2023-12-05  523  				goto put_child;
49128de4734877 Emil Renner Berthing 2023-12-05  524  			}
49128de4734877 Emil Renner Berthing 2023-12-05  525  		}
49128de4734877 Emil Renner Berthing 2023-12-05  526  	}
49128de4734877 Emil Renner Berthing 2023-12-05  527  
49128de4734877 Emil Renner Berthing 2023-12-05  528  	*maps = map;
49128de4734877 Emil Renner Berthing 2023-12-05  529  	*num_maps = nmaps;
49128de4734877 Emil Renner Berthing 2023-12-05  530  	mutex_unlock(&thp->mutex);
49128de4734877 Emil Renner Berthing 2023-12-05  531  	return 0;
49128de4734877 Emil Renner Berthing 2023-12-05  532  
49128de4734877 Emil Renner Berthing 2023-12-05  533  free_configs:
49128de4734877 Emil Renner Berthing 2023-12-05  534  	kfree(configs);
49128de4734877 Emil Renner Berthing 2023-12-05  535  put_child:
49128de4734877 Emil Renner Berthing 2023-12-05  536  	of_node_put(child);
49128de4734877 Emil Renner Berthing 2023-12-05  537  	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
49128de4734877 Emil Renner Berthing 2023-12-05  538  	mutex_unlock(&thp->mutex);
49128de4734877 Emil Renner Berthing 2023-12-05  539  	return ret;
49128de4734877 Emil Renner Berthing 2023-12-05  540  }
49128de4734877 Emil Renner Berthing 2023-12-05  541  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

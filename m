Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43FC1D0E3D
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Oct 2024 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727883985; cv=none; b=IBMhQHd+a3nW3b+A+l9BiHRrB8jewlzZKJPTo5pgqQ2TchQaGpcBZMMnKXVy9M7Oaun+dQlYMIoJc9jNStmy7/pHbIxjcWIURyaZfQLk7jlSLDiYZAAxV3XMHt3faUypLRl1cIIyFk8kxk5zMeUOK1NkW69aVsthnatXAAm/03Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727883985; c=relaxed/simple;
	bh=7Yju/p/YPRjZyJpv6+ZPFBDrp21KVpUbETrqEUz1sCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6whwOv+5VK4gPBcbblnfn3deP76VPVjPDV8mweEskdoDhFm4KbM1s+w5H0viqDihJiyw/241duweZqbBammiDmX9nbjZ1TFr0SOXW9a7GXKN+KhBUfjreZaQ7jdt7HBn2V+K313874BVnEgdCRvv5fnLHGH8sZsj1OtUb+whqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRt9PUZm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRt9PUZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727883984; x=1759419984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Yju/p/YPRjZyJpv6+ZPFBDrp21KVpUbETrqEUz1sCs=;
  b=CRt9PUZmnUBBWEBMNCZWOnLZXH7AZ0zF7Sk41XqI9XP/pCWoZlZDYEXr
   kvSmMQBDmq9PPQzhTNfLMeWofEc7il/m9baeblPE1XWejXNpIFlIh0IhK
   NDMFrlOwm6uqr5CZrvC5i+TFVcyti2XN/56sjutDzp77eoRk+du0lflh5
   iluSjgSV5bxtr19fWLZXO5fnH9UIYUmLTJZzZljWjrcsz88LNvOYFD850
   ThToXDS42TrbpzpHWrS15iqmBq2LgXGmZOh4LXv1/9RNGiJZOykfW7xtO
   6WXH7dexQKHlIO4tDMElivCwP671D6VG/UlL5zrWjvN9WwzwhI6eTb7/1
   w==;
X-CSE-ConnectionGUID: QiKFFPXiRietwkiVhbkPlw==
X-CSE-MsgGUID: CyJX2JLCQ5ec13d79DxK2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="49578272"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="49578272"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 08:46:21 -0700
X-CSE-ConnectionGUID: zKyqRm9KR3uhk139Z7sCPA==
X-CSE-MsgGUID: PwCiI8yJQRujLT9fqJXntg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="74281135"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2024 08:46:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw1YP-000UAt-0p;
	Wed, 02 Oct 2024 15:46:17 +0000
Date: Wed, 2 Oct 2024 23:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
Message-ID: <202410022336.xyWlV0Tf-lkp@intel.com>
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
In-Reply-To: <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>
TO: Drew Fustini <dfustini@tenstorrent.com>

Hi Drew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/dt-bindings-pinctrl-Add-thead-th1520-pinctrl-bindings/20241001-035421
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20240930-th1520-pinctrl-v3-2-32cea2bdbecb%40tenstorrent.com
patch subject: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-r072-20241002 (https://download.01.org/0day-ci/archive/20241002/202410022336.xyWlV0Tf-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410022336.xyWlV0Tf-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-th1520.c:502 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'

vim +/ret +502 drivers/pinctrl/pinctrl-th1520.c

e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  413  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  414  static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  415  					 struct device_node *np,
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  416  					 struct pinctrl_map **maps,
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  417  					 unsigned int *num_maps)
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  418  {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  419  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  420  	struct device_node *child;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  421  	struct pinctrl_map *map;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  422  	unsigned long *configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  423  	unsigned int nconfigs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  424  	unsigned int nmaps;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  425  	int ret;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  426  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  427  	nmaps = 0;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  428  	for_each_available_child_of_node(np, child) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  429  		int npins = of_property_count_strings(child, "pins");
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  430  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  431  		if (npins <= 0) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  432  			of_node_put(child);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  433  			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  434  				np, child);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  435  			return -EINVAL;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  436  		}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  437  		nmaps += npins;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  438  		if (of_property_present(child, "function"))
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  439  			nmaps += npins;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  440  	}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  441  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  442  	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  443  	if (!map)
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  444  		return -ENOMEM;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  445  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  446  	nmaps = 0;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  447  	mutex_lock(&thp->mutex);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  448  	for_each_available_child_of_node(np, child) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  449  		unsigned int rollback = nmaps;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  450  		enum th1520_muxtype muxtype;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  451  		struct property *prop;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  452  		const char *funcname;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  453  		const char **pgnames;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  454  		const char *pinname;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  455  		int npins;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  456  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  457  		ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  458  		if (ret) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  459  			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  460  				np, child);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  461  			goto put_child;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  462  		}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  463  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  464  		if (!of_property_read_string(child, "function", &funcname)) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  465  			muxtype = th1520_muxtype_get(funcname);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  466  			if (!muxtype) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  467  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  468  					np, child, funcname);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  469  				ret = -EINVAL;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  470  				goto free_configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  471  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  472  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  473  			funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  474  						  np, child);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  475  			if (!funcname) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  476  				ret = -ENOMEM;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  477  				goto free_configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  478  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  479  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  480  			npins = of_property_count_strings(child, "pins");
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  481  			pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  482  			if (!pgnames) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  483  				ret = -ENOMEM;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  484  				goto free_configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  485  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  486  		} else {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  487  			funcname = NULL;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  488  		}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  489  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  490  		npins = 0;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  491  		of_property_for_each_string(child, "pins", prop, pinname) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  492  			unsigned int i;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  493  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  494  			for (i = 0; i < thp->desc.npins; i++) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  495  				if (!strcmp(pinname, thp->desc.pins[i].name))
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  496  					break;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  497  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  498  			if (i == thp->desc.npins) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  499  				nmaps = rollback;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  500  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  501  					np, child, pinname);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30 @502  				goto free_configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  503  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  504  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  505  			if (nconfigs) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  506  				map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  507  				map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  508  				map[nmaps].data.configs.configs = configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  509  				map[nmaps].data.configs.num_configs = nconfigs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  510  				nmaps += 1;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  511  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  512  			if (funcname) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  513  				pgnames[npins++] = thp->desc.pins[i].name;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  514  				map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  515  				map[nmaps].data.mux.function = funcname;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  516  				map[nmaps].data.mux.group = thp->desc.pins[i].name;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  517  				nmaps += 1;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  518  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  519  		}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  520  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  521  		if (funcname) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  522  			ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  523  							  npins, (void *)muxtype);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  524  			if (ret < 0) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  525  				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  526  				goto put_child;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  527  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  528  		}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  529  	}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  530  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  531  	*maps = map;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  532  	*num_maps = nmaps;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  533  	mutex_unlock(&thp->mutex);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  534  	return 0;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  535  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  536  free_configs:
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  537  	kfree(configs);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  538  put_child:
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  539  	of_node_put(child);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  540  	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  541  	mutex_unlock(&thp->mutex);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  542  	return ret;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  543  }
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  544  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

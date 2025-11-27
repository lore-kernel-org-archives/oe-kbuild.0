Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471DC2C08C0
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225892; cv=none; b=YIbLfox4tnm3MiNNxVrya36DPekPqXDwH3e7qC6qEpP6lTLPl3kiEXgUvL/6Q/LxBuj5fSS7eqDYYkZl8nrC5Npl8RG7jf+3Tc5aVWln4729+RIX3gwJQ99J9U5r7yT9I8x9U0mQ2lIurqIYjWaSM+rZox5Wo3F0EEIDycYkIU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225892; c=relaxed/simple;
	bh=cKfWWdIiIptO4KDwiZ5QpqvsCpyVGDhaLwDK8IxSxMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5XaedWPUbsr5TFpHgOSq9VZk8LVgnJdVBdMPS1iw3SxdtuihGrKSqbV/dnfCd91O0XGzq0oe479HFe9nDlD+1y2XsrG/24WRM0KWbWIzrPwFwSu+b8uOKFMGzDDJX2JSQNBWqNlXCw2qGaZGuRhPq8o02+a5OmxlEoZfkTm7S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxO7k65k; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxO7k65k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764225891; x=1795761891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cKfWWdIiIptO4KDwiZ5QpqvsCpyVGDhaLwDK8IxSxMY=;
  b=cxO7k65kdoZ7Vls4n5RhWAadS+jZgjEgRMmiix96e+2bBv5aqLlbotFh
   NT5+Elf7csYDeYO/uzXtPiprYxw5J0T57FMazjBRGNPFn4hYTSLwKapem
   8qVI9vXv4OZvS+LrQ6QbxseJZAriWbn7JxrZ92mGI4DfKrTGsO2nCbshY
   duOX+MvGXHycEZcFuvBgO91bla4easrDKlyqIKP5UnqZqxQouRcqAj3Qi
   iGh/hy1SEDBlsrmWyuA6SAFMHbXKyaT44uMoZzoSD4NV5uHwPvj+h2g5j
   S636fhm3urhMM49NKpQ8KmMenBqP4xySMXHjOajaKJtIBO1NSIvRJks8m
   Q==;
X-CSE-ConnectionGUID: 9vEMQSIfSwm4YCneGktlNg==
X-CSE-MsgGUID: c4VlXewgQJu1OpjxRAdU6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77371620"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="77371620"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 22:44:50 -0800
X-CSE-ConnectionGUID: 5bH9jzMZRTKbwCGtIXbx3Q==
X-CSE-MsgGUID: EvPCNgVYTfakRXttIU38/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193609642"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Nov 2025 22:44:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOVkE-000000003nx-1edg;
	Thu, 27 Nov 2025 06:44:46 +0000
Date: Thu, 27 Nov 2025 14:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [conor:pinctrl 21/23] drivers/pinctrl/pinctrl-generic.c:183
 pinctrl_generic_pins_function_dt_node_to_map() error: uninitialized symbol
 'map'.
Message-ID: <202511271435.oSbNsRD6-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a88950bbbc80fe53e2c773353674604d3130c443
commit: c5d18e566a49f4f9a50575259bbdda2118b000e4 [21/23] pinctrl: add polarfire soc mssio pinctrl driver
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: powerpc64-randconfig-r072-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271435.oSbNsRD6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511271435.oSbNsRD6-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/pinctrl-generic.c:183 pinctrl_generic_pins_function_dt_node_to_map() error: uninitialized symbol 'map'.

Old smatch warnings:
drivers/pinctrl/pinctrl-generic.c:187 pinctrl_generic_pins_function_dt_node_to_map() error: uninitialized symbol 'map'.

vim +/map +183 drivers/pinctrl/pinctrl-generic.c

df80616e3dbbe3 Conor Dooley 2025-11-26  103  
df80616e3dbbe3 Conor Dooley 2025-11-26  104  /*
df80616e3dbbe3 Conor Dooley 2025-11-26  105   * For platforms that do not define groups or functions in the driver, but
df80616e3dbbe3 Conor Dooley 2025-11-26  106   * instead use the devicetree to describe them. This function will, unlike
df80616e3dbbe3 Conor Dooley 2025-11-26  107   * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
df80616e3dbbe3 Conor Dooley 2025-11-26  108   * and functions, create them in addition to parsing pinconf properties and
df80616e3dbbe3 Conor Dooley 2025-11-26  109   * adding mappings.
df80616e3dbbe3 Conor Dooley 2025-11-26  110   */
df80616e3dbbe3 Conor Dooley 2025-11-26  111  int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
df80616e3dbbe3 Conor Dooley 2025-11-26  112  						 struct device_node *np,
df80616e3dbbe3 Conor Dooley 2025-11-26  113  						 struct pinctrl_map **maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  114  						 unsigned int *num_maps)
df80616e3dbbe3 Conor Dooley 2025-11-26  115  {
df80616e3dbbe3 Conor Dooley 2025-11-26  116  	struct device *dev = pctldev->dev;
df80616e3dbbe3 Conor Dooley 2025-11-26  117  	struct device_node *child_np;
df80616e3dbbe3 Conor Dooley 2025-11-26  118  	struct pinctrl_map *map;
df80616e3dbbe3 Conor Dooley 2025-11-26  119  	const char **group_names;
df80616e3dbbe3 Conor Dooley 2025-11-26  120  	unsigned int num_reserved_maps = 0;
df80616e3dbbe3 Conor Dooley 2025-11-26  121  	int ngroups = 0;
df80616e3dbbe3 Conor Dooley 2025-11-26  122  	int ret;
df80616e3dbbe3 Conor Dooley 2025-11-26  123  
df80616e3dbbe3 Conor Dooley 2025-11-26  124  	*maps = NULL;
df80616e3dbbe3 Conor Dooley 2025-11-26  125  	*num_maps = 0;
df80616e3dbbe3 Conor Dooley 2025-11-26  126  
df80616e3dbbe3 Conor Dooley 2025-11-26  127  	/*
df80616e3dbbe3 Conor Dooley 2025-11-26  128  	 * Check if this is actually the pins node, or a parent containing
df80616e3dbbe3 Conor Dooley 2025-11-26  129  	 * multiple pins nodes.
df80616e3dbbe3 Conor Dooley 2025-11-26  130  	 */
df80616e3dbbe3 Conor Dooley 2025-11-26  131  	if (!of_property_present(np, "pins"))
df80616e3dbbe3 Conor Dooley 2025-11-26  132  		goto parent;
df80616e3dbbe3 Conor Dooley 2025-11-26  133  
df80616e3dbbe3 Conor Dooley 2025-11-26  134  	group_names = devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
df80616e3dbbe3 Conor Dooley 2025-11-26  135  	if (!group_names)
df80616e3dbbe3 Conor Dooley 2025-11-26  136  		return -ENOMEM;
df80616e3dbbe3 Conor Dooley 2025-11-26  137  
df80616e3dbbe3 Conor Dooley 2025-11-26  138  	ret = pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, np,
df80616e3dbbe3 Conor Dooley 2025-11-26  139  							      &map,num_maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  140  							      &num_reserved_maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  141  							      group_names,
df80616e3dbbe3 Conor Dooley 2025-11-26  142  							      ngroups);
df80616e3dbbe3 Conor Dooley 2025-11-26  143  	if (ret) {
df80616e3dbbe3 Conor Dooley 2025-11-26  144  		pinctrl_utils_free_map(pctldev, map, *num_maps);
df80616e3dbbe3 Conor Dooley 2025-11-26  145  		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
df80616e3dbbe3 Conor Dooley 2025-11-26  146  	}
df80616e3dbbe3 Conor Dooley 2025-11-26  147  
df80616e3dbbe3 Conor Dooley 2025-11-26  148  	ret = pinmux_generic_add_function(pctldev, np->name, group_names, 1, NULL);
df80616e3dbbe3 Conor Dooley 2025-11-26  149  	if (ret < 0) {
df80616e3dbbe3 Conor Dooley 2025-11-26  150  		pinctrl_utils_free_map(pctldev, map, *num_maps);
df80616e3dbbe3 Conor Dooley 2025-11-26  151  		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
df80616e3dbbe3 Conor Dooley 2025-11-26  152  	}
df80616e3dbbe3 Conor Dooley 2025-11-26  153  
df80616e3dbbe3 Conor Dooley 2025-11-26  154  	*maps = map;
df80616e3dbbe3 Conor Dooley 2025-11-26  155  
df80616e3dbbe3 Conor Dooley 2025-11-26  156  	return 0;
df80616e3dbbe3 Conor Dooley 2025-11-26  157  
df80616e3dbbe3 Conor Dooley 2025-11-26  158  parent:
df80616e3dbbe3 Conor Dooley 2025-11-26  159  	for_each_available_child_of_node(np, child_np)
df80616e3dbbe3 Conor Dooley 2025-11-26  160  		ngroups += 1;
df80616e3dbbe3 Conor Dooley 2025-11-26  161  
df80616e3dbbe3 Conor Dooley 2025-11-26  162  	group_names = devm_kcalloc(dev, ngroups, sizeof(*group_names), GFP_KERNEL);
df80616e3dbbe3 Conor Dooley 2025-11-26  163  	if (!group_names)
df80616e3dbbe3 Conor Dooley 2025-11-26  164  		return -ENOMEM;
df80616e3dbbe3 Conor Dooley 2025-11-26  165  
df80616e3dbbe3 Conor Dooley 2025-11-26  166  	ngroups = 0;
df80616e3dbbe3 Conor Dooley 2025-11-26  167  	for_each_available_child_of_node_scoped(np, child_np) {
df80616e3dbbe3 Conor Dooley 2025-11-26  168  		ret = pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, child_np,
df80616e3dbbe3 Conor Dooley 2025-11-26  169  								      &map,num_maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  170  								      &num_reserved_maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  171  								      group_names,
df80616e3dbbe3 Conor Dooley 2025-11-26  172  								      ngroups);
df80616e3dbbe3 Conor Dooley 2025-11-26  173  		if (ret) {
df80616e3dbbe3 Conor Dooley 2025-11-26  174  			pinctrl_utils_free_map(pctldev, map, *num_maps);
df80616e3dbbe3 Conor Dooley 2025-11-26  175  			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
df80616e3dbbe3 Conor Dooley 2025-11-26  176  		}
df80616e3dbbe3 Conor Dooley 2025-11-26  177  
df80616e3dbbe3 Conor Dooley 2025-11-26  178  		ngroups++;
df80616e3dbbe3 Conor Dooley 2025-11-26  179  	}
df80616e3dbbe3 Conor Dooley 2025-11-26  180  
df80616e3dbbe3 Conor Dooley 2025-11-26  181  	ret = pinmux_generic_add_function(pctldev, np->name, group_names, ngroups, NULL);
df80616e3dbbe3 Conor Dooley 2025-11-26  182  	if (ret < 0) {
df80616e3dbbe3 Conor Dooley 2025-11-26 @183  		pinctrl_utils_free_map(pctldev, map, *num_maps);

:::::: The code at line 183 was first introduced by commit
:::::: df80616e3dbbe32d3468ca6c7c5cda486ac2fd63 pinctrl: add generic functions + pins mapper

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

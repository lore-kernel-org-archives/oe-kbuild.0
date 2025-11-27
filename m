Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E52E31987A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234206; cv=none; b=HQFsXpc9Mv6wpWF/3t8C7wRdrD8LepY8EX7LuLOtWa+RIjlFSGDuu8f7zhYb1uDRZbYTKJQ6qfzRUrlwfjQRVZP4/qkeuGdX0Poa4vLrC5RwyfaHtNtK8yDs10D+VX6cm7+qR9HaoOoRNqlEr+8x7VLvLnMbcwjsQ4Gvth0060I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234206; c=relaxed/simple;
	bh=5dlBU1bLUKAUPi8mZvwFnPI+FEnNq50B0iyUmI7CWlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksKTSix3UGboQfdGq4TsdCCsWkziIXhDHbIsV3YcuNYVJxxJfByn6Ft7Xwlv6O6M5BmBijNMPJCnYIhG8nE47yPGLn+S+SsKITnVl6XaQXQsmt79kzSSp9h7R5Snz7OEBVEOFK9Mpmg/ycfOe9Zf8CWe5oYZicsHNKwRj61Prag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQzyVANG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQzyVANG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so6423905e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 01:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764234202; x=1764839002; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JdINPvofPb5s41JcK1QbCB8OCu8A4Xj8jHKRdhRQPg=;
        b=oQzyVANGPRvKUwoqIx/YPhK0dHsl8Fgil1KUMqFKpoAhYuyliXvRYXG6T3rZNsmz7l
         YdzLdI1ezbOUyY81x0kETm9ZigrRxlmoU9+wSzF6qnyDA0Wicd7C8gmxCtVgoh35aRpH
         pwhQKrByNay6UxfJHcKRAVqJhpP4dSwjthd9C8zFpX6vDQYZ3LUadYaud4ZJm1jY6PvC
         wZrFQR/BVPL/OZVuFxHUlbsUoy2jkOuoDuwFEH3udUDfcdCzG3bT4H9UyZEEFRDdp2Q9
         7IWKtA4zi18EfW56jdLnTXsw0+TClRTokgmPAUYfkPNVxjjRg2cNO5lrWBkUAWgVoqzA
         hhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234202; x=1764839002;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JdINPvofPb5s41JcK1QbCB8OCu8A4Xj8jHKRdhRQPg=;
        b=AfsSL9xstYbV/kBM7hKeo8WCz0mKTZl+dFOoxoNYi6GwnNFO46VBs6mrcYToT2Ke0k
         UYuMf6kh8f5SXaaLDI3WybjJ0Nz4kpn+x5xLHMa+Pxz+RXy6UjTaSj4e3NeZb/8xlkWQ
         l8DYsGUzSGFChTbLpaOzNRlX+/F1Un2R0bPYeHaluUtU9j46KfsTrHeC5Xgw1bXctr7L
         X+qcOYXRjDEofbXVNB2tz77YcN6Gs3tmXFL4F9SIw6JXHMQryaFm+qksslL72me0CDOo
         yB/loK0qvxiEJx2owPeatXNy/Fec4NAKeTgV3ROoa0pOIpVMBrlOkiF5HgSuD0AdgHqk
         gbdw==
X-Gm-Message-State: AOJu0YygtAPMLp9ivWQdpZKrE9gl7Gs2X/XEX7cym7LmoBDmUT23WV+a
	DCvxwYGFYJHFLEqg6xiKz8aYIhHP8h1Q7s24/0r3CxGebzNDXtqz0BM3wz0UcFeHqGWi8NiXfge
	tvhnx
X-Gm-Gg: ASbGnctnPQJu6Sw7XcWJZVSgkRDySwUUHbiGGCzNz5e052p+1rB71xiHH9ZBWcBu/0o
	c5FK8aOsILCz1KzXYR39cYk2hFMnaoprF13Ojh7Fdbme/ETTzkahkhiyjV73CHQ3VYDuED1gZEB
	mJCFD45L+pnZCh+dPO12o/hJI8QFCG5j/dKnAUrJ7QbaJw0dDPs6N+krnx1jr7t6xSEzYu6Gvak
	JRje28oiV1j3FM/xZMvKA0EtlMuMBwm9gBdonlgGguFD5MRcq84061JtCdLkVSpV1HfFMO79WyI
	PnSqQ62s+FLl4m0ppxkNJ7gBtr9nkUupJe/0GmJNqjia7O9qWpgw3QQFyNcVAbY2cKp1+TKvpQT
	ugse7jf1KgNNEMh7cdVCcTiVJSsBss+7L3T47xjWvXRnyf2GjxMsaU7kF1QaRUBqtXsHddoz6y+
	Jc3AnZ0tEmvxSCjplS
X-Google-Smtp-Source: AGHT+IFynb9zZlTb1lIry0GmIiL8O+WRck+Tqg2z+IEv8rbf/6IV831qOuOuCwUdLqEfTBJoUemWKQ==
X-Received: by 2002:a05:600c:1c87:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-47904acef12mr111071645e9.3.1764234201059;
        Thu, 27 Nov 2025 01:03:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4791116c3c0sm20418605e9.8.2025.11.27.01.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:03:20 -0800 (PST)
Date: Thu, 27 Nov 2025 12:03:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Conor Dooley <conor+lkp@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
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
Message-ID: <20251127090316.SX8gU1D_2IkJSBV_-WgopmyjU_lUykX0YyZYb0BFG-k@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a88950bbbc80fe53e2c773353674604d3130c443
commit: c5d18e566a49f4f9a50575259bbdda2118b000e4 [21/23] pinctrl: add polarfire soc mssio pinctrl driver
config: powerpc64-randconfig-r072-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271435.oSbNsRD6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511271435.oSbNsRD6-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/pinctrl-generic.c:183 pinctrl_generic_pins_function_dt_node_to_map() error: uninitialized symbol 'map'.

vim +/map +183 drivers/pinctrl/pinctrl-generic.c

df80616e3dbbe3 Conor Dooley 2025-11-26  111  int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
df80616e3dbbe3 Conor Dooley 2025-11-26  112  						 struct device_node *np,
df80616e3dbbe3 Conor Dooley 2025-11-26  113  						 struct pinctrl_map **maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  114  						 unsigned int *num_maps)
df80616e3dbbe3 Conor Dooley 2025-11-26  115  {
df80616e3dbbe3 Conor Dooley 2025-11-26  116  	struct device *dev = pctldev->dev;
df80616e3dbbe3 Conor Dooley 2025-11-26  117  	struct device_node *child_np;
df80616e3dbbe3 Conor Dooley 2025-11-26  118  	struct pinctrl_map *map;

map needs to be set to NULL at the start.  We pass it to
krealloc_array().

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


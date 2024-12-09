Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E36F158534
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718194; cv=none; b=kIg3imsCZgew4gmvIvVBTcX92s7CWejonnbniByclcb71y0AOCv9JFMNfCNSR6Ak8ZiqBD3PbxepS9C8tbGPepCRKtsb9dvs14mqZCukq5F2adF2HTiBL33gKOpWtMfEeP0ChTTzG0DrQ3xu4kE+M0A9OsoXT8jGl3aRyjlm6/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718194; c=relaxed/simple;
	bh=bZOzGvO0q5W38IN8VbH6BlzDjRjXzD+340PUrTcRBVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXMgmyp0GvpvKnLgdtRV3qblgmCHMVI27lONlGpLB2DvX1ljoOtrfSbt3j63SEkoDRPqvA8kp1G/QtG6DTDr+3pzQ4j1uPaMgx3JkiA9dtAIlNjPBE+Lqk+0KFmMurZdfDcYHLTef7K7GaSdtCmou/qJbItuDsof+YSBQ0TnJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mrc42df/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mrc42df/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718193; x=1765254193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bZOzGvO0q5W38IN8VbH6BlzDjRjXzD+340PUrTcRBVo=;
  b=Mrc42df/Yv7Oipukx1FLbCmC6OHuFqkm3tSyZNznnjLXPgqbsp/vtChB
   sqoNkFhp0JcruxsABRYwSfo1A+OqzpXUXWO8kPTdjtWjwdmivK1jvOIJT
   u5gT1VSQ4p08c78u6gW8neLIktzK7XYlB0qYwMU2WN78DPeIwxOT2dlsp
   2SxU5AcHBHcpCEcEmgzxDdkK1uRD4wZrn4p6Qncp5H6h0Vc6CIiogto+U
   /SRQ0PqqwhrkChyqg9ZzRgufR0Rb0+udosyZAti5lJSdGZp9BVY8kZHSQ
   7Lc3MtIG3o1Bj32zRpiW5+gl+MkWZmBeFar3b+oxI5esA5FT6AamsSwRb
   A==;
X-CSE-ConnectionGUID: ilw7zk8URfi03Y/f/zX0IA==
X-CSE-MsgGUID: H/4uqn29S7yenLb3IbTnhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="21591904"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="21591904"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:23:11 -0800
X-CSE-ConnectionGUID: x+p14kAkTK2RTo2IppI3xQ==
X-CSE-MsgGUID: yNJn0A+NT7KoysZQLfmkRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125842602"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2024 20:23:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVIZ-0003qD-0g;
	Mon, 09 Dec 2024 04:23:07 +0000
Date: Mon, 9 Dec 2024 12:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <202412072123.ne7GnRyJ-lkp@intel.com>
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
In-Reply-To: <20241126143125.9980-7-heylenay@4d2.org>
References: <20241126143125.9980-7-heylenay@4d2.org>
TO: Haylen Chu <heylenay@4d2.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Haylen Chu <heylenay@outlook.com>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Inochi Amaoto <inochiama@outlook.com>
CC: Chen Wang <unicornxdotw@foxmail.com>
CC: Jisheng Zhang <jszhang@kernel.org>

Hi Haylen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2d5404caa8c7bb5c4e0435f94b28834ae5456623]

url:    https://github.com/intel-lab-lkp/linux/commits/Haylen-Chu/dt-bindings-clock-spacemit-Add-clock-controllers-of-Spacemit-K1-SoC/20241128-101248
base:   2d5404caa8c7bb5c4e0435f94b28834ae5456623
patch link:    https://lore.kernel.org/r/20241126143125.9980-7-heylenay%404d2.org
patch subject: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1 SoC
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072123.ne7GnRyJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412072123.ne7GnRyJ-lkp@intel.com/

smatch warnings:
drivers/clk/spacemit/ccu-k1.c:1686 k1_ccu_probe() error: uninitialized symbol 'lock_map'.

vim +/lock_map +1686 drivers/clk/spacemit/ccu-k1.c

e71e4621b06cd42 Haylen Chu 2024-11-26  1650  
e71e4621b06cd42 Haylen Chu 2024-11-26  1651  static int k1_ccu_probe(struct platform_device *pdev)
e71e4621b06cd42 Haylen Chu 2024-11-26  1652  {
e71e4621b06cd42 Haylen Chu 2024-11-26  1653  	const struct spacemit_ccu_data *data;
e71e4621b06cd42 Haylen Chu 2024-11-26  1654  	struct regmap *base_map, *lock_map;
e71e4621b06cd42 Haylen Chu 2024-11-26  1655  	struct device *dev = &pdev->dev;
e71e4621b06cd42 Haylen Chu 2024-11-26  1656  	struct spacemit_ccu_priv *priv;
e71e4621b06cd42 Haylen Chu 2024-11-26  1657  	struct device_node *parent;
e71e4621b06cd42 Haylen Chu 2024-11-26  1658  	int ret;
e71e4621b06cd42 Haylen Chu 2024-11-26  1659  
e71e4621b06cd42 Haylen Chu 2024-11-26  1660  	data = of_device_get_match_data(dev);
e71e4621b06cd42 Haylen Chu 2024-11-26  1661  	if (WARN_ON(!data))
e71e4621b06cd42 Haylen Chu 2024-11-26  1662  		return -EINVAL;
e71e4621b06cd42 Haylen Chu 2024-11-26  1663  
e71e4621b06cd42 Haylen Chu 2024-11-26  1664  	parent   = of_get_parent(dev->of_node);
e71e4621b06cd42 Haylen Chu 2024-11-26  1665  	base_map = syscon_node_to_regmap(parent);
e71e4621b06cd42 Haylen Chu 2024-11-26  1666  	of_node_put(parent);
e71e4621b06cd42 Haylen Chu 2024-11-26  1667  
e71e4621b06cd42 Haylen Chu 2024-11-26  1668  	if (IS_ERR(base_map))
e71e4621b06cd42 Haylen Chu 2024-11-26  1669  		return dev_err_probe(dev, PTR_ERR(base_map),
e71e4621b06cd42 Haylen Chu 2024-11-26  1670  				     "failed to get regmap\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1671  
e71e4621b06cd42 Haylen Chu 2024-11-26  1672  	if (data->need_pll_lock) {
e71e4621b06cd42 Haylen Chu 2024-11-26  1673  		lock_map = syscon_regmap_lookup_by_phandle(dev->of_node,
e71e4621b06cd42 Haylen Chu 2024-11-26  1674  							   "spacemit,mpmu");
e71e4621b06cd42 Haylen Chu 2024-11-26  1675  		if (IS_ERR(lock_map))
e71e4621b06cd42 Haylen Chu 2024-11-26  1676  			return dev_err_probe(dev, PTR_ERR(lock_map),
e71e4621b06cd42 Haylen Chu 2024-11-26  1677  					     "failed to get lock regmap\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1678  	}
e71e4621b06cd42 Haylen Chu 2024-11-26  1679  
e71e4621b06cd42 Haylen Chu 2024-11-26  1680  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
e71e4621b06cd42 Haylen Chu 2024-11-26  1681  	if (!priv)
e71e4621b06cd42 Haylen Chu 2024-11-26  1682  		return -ENOMEM;
e71e4621b06cd42 Haylen Chu 2024-11-26  1683  
e71e4621b06cd42 Haylen Chu 2024-11-26  1684  	priv->data	= data;
e71e4621b06cd42 Haylen Chu 2024-11-26  1685  	priv->base	= base_map;
e71e4621b06cd42 Haylen Chu 2024-11-26 @1686  	priv->lock_base	= lock_map;
e71e4621b06cd42 Haylen Chu 2024-11-26  1687  
e71e4621b06cd42 Haylen Chu 2024-11-26  1688  	ret = spacemit_ccu_register(dev, priv);
e71e4621b06cd42 Haylen Chu 2024-11-26  1689  	if (ret)
e71e4621b06cd42 Haylen Chu 2024-11-26  1690  		return dev_err_probe(dev, ret, "failed to register clocks\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1691  
e71e4621b06cd42 Haylen Chu 2024-11-26  1692  	return 0;
e71e4621b06cd42 Haylen Chu 2024-11-26  1693  }
e71e4621b06cd42 Haylen Chu 2024-11-26  1694  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

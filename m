Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90BA375F9C
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 03:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534259; cv=none; b=WBO23ZoJP9nZoDPkbpk7dYJ/8TQmQm1hVJaMTX6Eqd7WbuRzDgkgnfIrlquQ2kjZija7EW+c3483MdjfOVOyZ3voXqjm7kjWDD3zDZ4FVMmJmicBWc/ezFysYaWvAMENVnfiWl+LvJ51QfazIWS1DdyUO3NiK6b0TReO7lUNsb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534259; c=relaxed/simple;
	bh=kcj6JV9qDk6e6LEU0l8fDK8nuCKC6wkA66ga2qT655Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t7xYWGp+T5yu6E/OpA3iPwQKOscZg7pcqLExive7OagOnxMMTeq/tZOJw3+V5ScKK2l2roTbd1op2c1U15/ZLyZAzJQatfOEzy/gM/R4X1IQGiNxSFjXeoTXSdZDM7PZ+MWfJuAoekCYnGcILdKUWA6xL4C6hmEEVzRDedB8Rsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBYN17bb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBYN17bb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534258; x=1807070258;
  h=date:from:to:cc:subject:message-id;
  bh=kcj6JV9qDk6e6LEU0l8fDK8nuCKC6wkA66ga2qT655Y=;
  b=dBYN17bbcbJPmSplOGUgGxQvH6ZOtrzhx282scHx4bP8h7wArg9PLHDQ
   AASWKTqdfeWrJeSVYmXh0X3vYSvfx2dB9Wz3AZXMmh3r1XOFwSZuO6xtg
   nUuwydkXI3uF0c6U0Wc4QlU6DYNtwHBO4p2QZVFEGmDc6siuzPMtwW4FZ
   YztTCPrhEaLXz9cVDIUqW0jMG5mzTjJSRKNGiiWdfsniUW2/tOBrJ5lrm
   BB/AuROF8GPCZ9P3AcMrQdfJyNpyyl13fTHXUc09t5A+X/Txw2+dpm6vw
   QbzWyK/93JUS69bMjpeGtGZ0swpLNi5kjJJpqoQUas2VvTY7A1lhMOP8a
   w==;
X-CSE-ConnectionGUID: zJxkNi2hTRO7Dj0VXxdRAw==
X-CSE-MsgGUID: dMelXeHsQIeBl57gHkBZZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80081093"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80081093"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:57:37 -0700
X-CSE-ConnectionGUID: gFZ7d6GEQ9WEWa6Ir0dUqQ==
X-CSE-MsgGUID: nwphKw7zQTya1wHgbb0BHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227995292"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:57:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xZE-0000000005X-3u5C;
	Tue, 07 Apr 2026 03:57:32 +0000
Date: Tue, 07 Apr 2026 11:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/dwc-tegra194 22/22]
 drivers/pci/controller/dwc/pcie-tegra194.c:1150:29: error: call to
 '__compiletime_assert_520' declared with 'error' attribute: min((
 __builtin_constant_p(us) ? ((us) < 2 ? 0 : 63 - __builtin_clzll(us)) :
 (sizeof(us) <= 4) ? __ilog2_u32(us) : __ilog2_u64(u...
Message-ID: <202604050715.MA13IkPi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Manikanta Maddireddy <mmaddireddy@nvidia.com>
CC: Manivannan Sadhasivam <mani@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/dwc-tegra194
head:   814f4e4b6cceda9e816fbeaf2a6a0f9b50b3f23a
commit: 814f4e4b6cceda9e816fbeaf2a6a0f9b50b3f23a [22/22] PCI: tegra194: Use aspm-l1-entry-delay-ns DT property for L1 entrance latency
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: powerpc-randconfig-002-20260405 (https://download.01.org/0day-ci/archive/20260405/202604050715.MA13IkPi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050715.MA13IkPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604050715.MA13IkPi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-tegra194.c:1150:29: error: call to '__compiletime_assert_520' declared with 'error' attribute: min(( __builtin_constant_p(us) ? ((us) < 2 ? 0 : 63 - __builtin_clzll(us)) : (sizeof(us) <= 4) ? __ilog2_u32(us) : __ilog2_u64(us) ) + 1, 7U) signedness error
    1150 |                 pcie->aspm_l1_enter_lat = min(ilog2(us) + 1, 7U);
         |                                           ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:694:2: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:687:4: note: expanded from macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:39:1: note: expanded from here
      39 | __compiletime_assert_520
         | ^
   1 error generated.


vim +1150 drivers/pci/controller/dwc/pcie-tegra194.c

56e15a238d92788 Vidya Sagar          2019-08-13  1112  
f1ab409d5787528 Vidya Sagar          2022-07-21  1113  static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
56e15a238d92788 Vidya Sagar          2019-08-13  1114  {
d5353c00cfd93b1 Vidya Sagar          2020-11-26  1115  	struct platform_device *pdev = to_platform_device(pcie->dev);
56e15a238d92788 Vidya Sagar          2019-08-13  1116  	struct device_node *np = pcie->dev->of_node;
814f4e4b6cceda9 Manikanta Maddireddy 2026-03-25  1117  	u32 val;
56e15a238d92788 Vidya Sagar          2019-08-13  1118  	int ret;
56e15a238d92788 Vidya Sagar          2019-08-13  1119  
d5353c00cfd93b1 Vidya Sagar          2020-11-26  1120  	pcie->dbi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
d5353c00cfd93b1 Vidya Sagar          2020-11-26  1121  	if (!pcie->dbi_res) {
d5353c00cfd93b1 Vidya Sagar          2020-11-26  1122  		dev_err(pcie->dev, "Failed to find \"dbi\" region\n");
d5353c00cfd93b1 Vidya Sagar          2020-11-26  1123  		return -ENODEV;
d5353c00cfd93b1 Vidya Sagar          2020-11-26  1124  	}
d5353c00cfd93b1 Vidya Sagar          2020-11-26  1125  
56e15a238d92788 Vidya Sagar          2019-08-13  1126  	ret = of_property_read_u32(np, "nvidia,aspm-cmrt-us", &pcie->aspm_cmrt);
56e15a238d92788 Vidya Sagar          2019-08-13  1127  	if (ret < 0) {
56e15a238d92788 Vidya Sagar          2019-08-13  1128  		dev_info(pcie->dev, "Failed to read ASPM T_cmrt: %d\n", ret);
56e15a238d92788 Vidya Sagar          2019-08-13  1129  		return ret;
56e15a238d92788 Vidya Sagar          2019-08-13  1130  	}
56e15a238d92788 Vidya Sagar          2019-08-13  1131  
56e15a238d92788 Vidya Sagar          2019-08-13  1132  	ret = of_property_read_u32(np, "nvidia,aspm-pwr-on-t-us",
56e15a238d92788 Vidya Sagar          2019-08-13  1133  				   &pcie->aspm_pwr_on_t);
56e15a238d92788 Vidya Sagar          2019-08-13  1134  	if (ret < 0)
56e15a238d92788 Vidya Sagar          2019-08-13  1135  		dev_info(pcie->dev, "Failed to read ASPM Power On time: %d\n",
56e15a238d92788 Vidya Sagar          2019-08-13  1136  			 ret);
56e15a238d92788 Vidya Sagar          2019-08-13  1137  
56e15a238d92788 Vidya Sagar          2019-08-13  1138  	ret = of_property_read_u32(np, "nvidia,aspm-l0s-entrance-latency-us",
56e15a238d92788 Vidya Sagar          2019-08-13  1139  				   &pcie->aspm_l0s_enter_lat);
56e15a238d92788 Vidya Sagar          2019-08-13  1140  	if (ret < 0)
56e15a238d92788 Vidya Sagar          2019-08-13  1141  		dev_info(pcie->dev,
56e15a238d92788 Vidya Sagar          2019-08-13  1142  			 "Failed to read ASPM L0s Entrance latency: %d\n", ret);
56e15a238d92788 Vidya Sagar          2019-08-13  1143  
814f4e4b6cceda9 Manikanta Maddireddy 2026-03-25  1144  	/* Default to max latency of 7. */
814f4e4b6cceda9 Manikanta Maddireddy 2026-03-25  1145  	pcie->aspm_l1_enter_lat = 7;
814f4e4b6cceda9 Manikanta Maddireddy 2026-03-25  1146  	ret = of_property_read_u32(np, "aspm-l1-entry-delay-ns", &val);
814f4e4b6cceda9 Manikanta Maddireddy 2026-03-25  1147  	if (!ret) {
814f4e4b6cceda9 Manikanta Maddireddy 2026-03-25  1148  		u32 us = max(val / 1000, 1U);
814f4e4b6cceda9 Manikanta Maddireddy 2026-03-25  1149  
814f4e4b6cceda9 Manikanta Maddireddy 2026-03-25 @1150  		pcie->aspm_l1_enter_lat = min(ilog2(us) + 1, 7U);
814f4e4b6cceda9 Manikanta Maddireddy 2026-03-25  1151  	}
814f4e4b6cceda9 Manikanta Maddireddy 2026-03-25  1152  
56e15a238d92788 Vidya Sagar          2019-08-13  1153  	ret = of_property_read_u32(np, "num-lanes", &pcie->num_lanes);
56e15a238d92788 Vidya Sagar          2019-08-13  1154  	if (ret < 0) {
56e15a238d92788 Vidya Sagar          2019-08-13  1155  		dev_err(pcie->dev, "Failed to read num-lanes: %d\n", ret);
56e15a238d92788 Vidya Sagar          2019-08-13  1156  		return ret;
56e15a238d92788 Vidya Sagar          2019-08-13  1157  	}
56e15a238d92788 Vidya Sagar          2019-08-13  1158  
56e15a238d92788 Vidya Sagar          2019-08-13  1159  	ret = of_property_read_u32_index(np, "nvidia,bpmp", 1, &pcie->cid);
56e15a238d92788 Vidya Sagar          2019-08-13  1160  	if (ret) {
56e15a238d92788 Vidya Sagar          2019-08-13  1161  		dev_err(pcie->dev, "Failed to read Controller-ID: %d\n", ret);
56e15a238d92788 Vidya Sagar          2019-08-13  1162  		return ret;
56e15a238d92788 Vidya Sagar          2019-08-13  1163  	}
56e15a238d92788 Vidya Sagar          2019-08-13  1164  
56e15a238d92788 Vidya Sagar          2019-08-13  1165  	ret = of_property_count_strings(np, "phy-names");
56e15a238d92788 Vidya Sagar          2019-08-13  1166  	if (ret < 0) {
56e15a238d92788 Vidya Sagar          2019-08-13  1167  		dev_err(pcie->dev, "Failed to find PHY entries: %d\n",
56e15a238d92788 Vidya Sagar          2019-08-13  1168  			ret);
56e15a238d92788 Vidya Sagar          2019-08-13  1169  		return ret;
56e15a238d92788 Vidya Sagar          2019-08-13  1170  	}
56e15a238d92788 Vidya Sagar          2019-08-13  1171  	pcie->phy_count = ret;
56e15a238d92788 Vidya Sagar          2019-08-13  1172  
56e15a238d92788 Vidya Sagar          2019-08-13  1173  	if (of_property_read_bool(np, "nvidia,update-fc-fixup"))
56e15a238d92788 Vidya Sagar          2019-08-13  1174  		pcie->update_fc_fixup = true;
56e15a238d92788 Vidya Sagar          2019-08-13  1175  
a54e190737181c1 Vidya Sagar          2022-07-21  1176  	/* RP using an external REFCLK is supported only in Tegra234 */
a54e190737181c1 Vidya Sagar          2022-07-21  1177  	if (pcie->of_data->version == TEGRA194_DWC_IP_VER) {
a54e190737181c1 Vidya Sagar          2022-07-21  1178  		if (pcie->of_data->mode == DW_PCIE_EP_TYPE)
a54e190737181c1 Vidya Sagar          2022-07-21  1179  			pcie->enable_ext_refclk = true;
a54e190737181c1 Vidya Sagar          2022-07-21  1180  	} else {
a54e190737181c1 Vidya Sagar          2022-07-21  1181  		pcie->enable_ext_refclk =
a54e190737181c1 Vidya Sagar          2022-07-21  1182  			of_property_read_bool(pcie->dev->of_node,
a54e190737181c1 Vidya Sagar          2022-07-21  1183  					      "nvidia,enable-ext-refclk");
a54e190737181c1 Vidya Sagar          2022-07-21  1184  	}
a54e190737181c1 Vidya Sagar          2022-07-21  1185  
56e15a238d92788 Vidya Sagar          2019-08-13  1186  	pcie->supports_clkreq =
56e15a238d92788 Vidya Sagar          2019-08-13  1187  		of_property_read_bool(pcie->dev->of_node, "supports-clkreq");
56e15a238d92788 Vidya Sagar          2019-08-13  1188  
56e15a238d92788 Vidya Sagar          2019-08-13  1189  	pcie->enable_cdm_check =
56e15a238d92788 Vidya Sagar          2019-08-13  1190  		of_property_read_bool(np, "snps,enable-cdm-check");
56e15a238d92788 Vidya Sagar          2019-08-13  1191  
a54e190737181c1 Vidya Sagar          2022-07-21  1192  	if (pcie->of_data->version == TEGRA234_DWC_IP_VER)
a54e190737181c1 Vidya Sagar          2022-07-21  1193  		pcie->enable_srns =
a54e190737181c1 Vidya Sagar          2022-07-21  1194  			of_property_read_bool(np, "nvidia,enable-srns");
a54e190737181c1 Vidya Sagar          2022-07-21  1195  
a54e190737181c1 Vidya Sagar          2022-07-21  1196  	if (pcie->of_data->mode == DW_PCIE_RC_TYPE)
c57247f940e8ea1 Vidya Sagar          2020-03-03  1197  		return 0;
c57247f940e8ea1 Vidya Sagar          2020-03-03  1198  
c57247f940e8ea1 Vidya Sagar          2020-03-03  1199  	/* Endpoint mode specific DT entries */
c57247f940e8ea1 Vidya Sagar          2020-03-03  1200  	pcie->pex_rst_gpiod = devm_gpiod_get(pcie->dev, "reset", GPIOD_IN);
c57247f940e8ea1 Vidya Sagar          2020-03-03  1201  	if (IS_ERR(pcie->pex_rst_gpiod)) {
54455238be89f9d Thierry Reding       2020-03-19  1202  		int err = PTR_ERR(pcie->pex_rst_gpiod);
54455238be89f9d Thierry Reding       2020-03-19  1203  		const char *level = KERN_ERR;
54455238be89f9d Thierry Reding       2020-03-19  1204  
54455238be89f9d Thierry Reding       2020-03-19  1205  		if (err == -EPROBE_DEFER)
54455238be89f9d Thierry Reding       2020-03-19  1206  			level = KERN_DEBUG;
54455238be89f9d Thierry Reding       2020-03-19  1207  
54455238be89f9d Thierry Reding       2020-03-19  1208  		dev_printk(level, pcie->dev,
54455238be89f9d Thierry Reding       2020-03-19  1209  			   dev_fmt("Failed to get PERST GPIO: %d\n"),
54455238be89f9d Thierry Reding       2020-03-19  1210  			   err);
54455238be89f9d Thierry Reding       2020-03-19  1211  		return err;
c57247f940e8ea1 Vidya Sagar          2020-03-03  1212  	}
c57247f940e8ea1 Vidya Sagar          2020-03-03  1213  
4ee540f02d5de5c Vidya Sagar          2026-03-25  1214  	pcie->pex_refclk_sel_gpiod = devm_gpiod_get_optional(pcie->dev,
c57247f940e8ea1 Vidya Sagar          2020-03-03  1215  							     "nvidia,refclk-select",
c57247f940e8ea1 Vidya Sagar          2020-03-03  1216  							     GPIOD_OUT_HIGH);
c57247f940e8ea1 Vidya Sagar          2020-03-03  1217  	if (IS_ERR(pcie->pex_refclk_sel_gpiod)) {
54455238be89f9d Thierry Reding       2020-03-19  1218  		int err = PTR_ERR(pcie->pex_refclk_sel_gpiod);
54455238be89f9d Thierry Reding       2020-03-19  1219  		const char *level = KERN_ERR;
54455238be89f9d Thierry Reding       2020-03-19  1220  
54455238be89f9d Thierry Reding       2020-03-19  1221  		if (err == -EPROBE_DEFER)
54455238be89f9d Thierry Reding       2020-03-19  1222  			level = KERN_DEBUG;
54455238be89f9d Thierry Reding       2020-03-19  1223  
54455238be89f9d Thierry Reding       2020-03-19  1224  		dev_printk(level, pcie->dev,
54455238be89f9d Thierry Reding       2020-03-19  1225  			   dev_fmt("Failed to get REFCLK select GPIOs: %d\n"),
54455238be89f9d Thierry Reding       2020-03-19  1226  			   err);
c57247f940e8ea1 Vidya Sagar          2020-03-03  1227  		pcie->pex_refclk_sel_gpiod = NULL;
c57247f940e8ea1 Vidya Sagar          2020-03-03  1228  	}
c57247f940e8ea1 Vidya Sagar          2020-03-03  1229  
56e15a238d92788 Vidya Sagar          2019-08-13  1230  	return 0;
56e15a238d92788 Vidya Sagar          2019-08-13  1231  }
56e15a238d92788 Vidya Sagar          2019-08-13  1232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

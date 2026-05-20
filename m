Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650FF27E045
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779254028; cv=none; b=tOrG+fj2nR6JNcHPDGeQ5uA8JSLY1R1ShByZgQiDEWfKHt6/S/vjq7LGcjLE9oVsOY6hMV77XKvnAFsKQW0M1QhjSo4dy2AUD2NI0CpfZKhnNOpDvsKz4d2mA7RX8pgwi+Rv0To5JYD+AHLKZBWl7hfXAKT9jB5XjDL17vjOsCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779254028; c=relaxed/simple;
	bh=cwRj+cVY5A9r78bHjfa8NzSyK1XryVy/Q0IWjdUvtaI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kDr75r/+u5R+iwLXaBocWzq8yOwhqneyFWv2QLsh4SwmgkIqvQtWttaw2rGP+sH6FSII3pqg472PQ5xQ4vHTx9SCT8BAv5CyWCbmD2TAVWVCt8DXOZyPO7gcuQy96h7/7Ks8P/6Vsl29YWKaBRlwSzKMhPWTSofIlnXJY0/7Knc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hA3jrsZ4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hA3jrsZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779254026; x=1810790026;
  h=date:from:to:cc:subject:message-id;
  bh=cwRj+cVY5A9r78bHjfa8NzSyK1XryVy/Q0IWjdUvtaI=;
  b=hA3jrsZ4lA6KptEbRGklwjLP8JNP24HVT+B5MR8pUT43g4ws9ybN+jQT
   KyoMenCqrzPTY5ZXatKW6TgXo0Q24nCHdb12y+A3NEifSKIwS+ZIIo3Is
   CyaOKUBbMcl/TbWPIyiwKG+bivNXKvwaxvvW1VVRHC9pPsQsQ+HiYkCJ8
   i6AJyWGzOrsYB91U5H0mG/unXY3Z/iU3g+hbmDeKsRAYy6dYYT+GPelC7
   scYxEG8C9VmZIn+txUvT0ipMbgnqVoh/tuWKRTNicXv6QgsYihJLiG4tR
   IRKyY3hjuZfT67U5kbdvXjd/fo4gfMhBqT9R14gZ/uShYIwkDgoouwu+y
   A==;
X-CSE-ConnectionGUID: ltDXf/E3SSWTEAWxP4wDZQ==
X-CSE-MsgGUID: keVVp3HYQNShtWJYCnw10w==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80259973"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80259973"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 22:13:39 -0700
X-CSE-ConnectionGUID: o77wG+mPQ6CTysho+Yqvyg==
X-CSE-MsgGUID: 8BOnSaHtRXqEcYD6JoE13w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="233662533"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 19 May 2026 22:13:37 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPZEx-000000002VD-2oxa;
	Wed, 20 May 2026 05:13:18 +0000
Date: Wed, 20 May 2026 13:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/clk-en7523.c:905:9: warning: variable 'reg' is
 used uninitialized whenever switch case is taken
Message-ID: <202605201357.a5WElF4D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Christian-Marangi/dt-bindings-soc-Add-bindings-for-Airoha-SCU-Serdes-lines/20260520-061218, commit: 19cc8c829b41bd6a99a151cc495aa6423e9cc0fe"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Christian Marangi <ansuelsmth@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-soc-Add-bindings-for-Airoha-SCU-Serdes-lines/20260520-061218
head:   1f05a633d6ddf325b7e30d610a704df7238bf7af
commit: 19cc8c829b41bd6a99a151cc495aa6423e9cc0fe clk: en7523: Add support for selecting the Serdes port in SCU
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: loongarch-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201357.a5WElF4D-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201357.a5WElF4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605201357.a5WElF4D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-en7523.c:905:9: warning: variable 'reg' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     905 |                         case PHY_INTERFACE_MODE_SGMII:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:950:27: note: uninitialized use occurs here
     950 |         val = readl(priv->base + reg);
         |                                  ^~~
   drivers/clk/clk-en7523.c:906:9: warning: variable 'reg' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     906 |                         case PHY_INTERFACE_MODE_1000BASEX:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:950:27: note: uninitialized use occurs here
     950 |         val = readl(priv->base + reg);
         |                                  ^~~
   drivers/clk/clk-en7523.c:907:9: warning: variable 'reg' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     907 |                         case PHY_INTERFACE_MODE_2500BASEX:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:950:27: note: uninitialized use occurs here
     950 |         val = readl(priv->base + reg);
         |                                  ^~~
   drivers/clk/clk-en7523.c:901:9: warning: variable 'reg' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     901 |                         case PHY_INTERFACE_MODE_USXGMII:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:950:27: note: uninitialized use occurs here
     950 |         val = readl(priv->base + reg);
         |                                  ^~~
   drivers/clk/clk-en7523.c:902:9: warning: variable 'reg' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     902 |                         case PHY_INTERFACE_MODE_10GBASER:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:950:27: note: uninitialized use occurs here
     950 |         val = readl(priv->base + reg);
         |                                  ^~~
>> drivers/clk/clk-en7523.c:899:7: warning: variable 'reg' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     899 |                 if (mode == PHY_MODE_ETHERNET) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:950:27: note: uninitialized use occurs here
     950 |         val = readl(priv->base + reg);
         |                                  ^~~
   drivers/clk/clk-en7523.c:899:3: note: remove the 'if' if its condition is always true
     899 |                 if (mode == PHY_MODE_ETHERNET) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     900 |                         switch (submode) {
     901 |                         case PHY_INTERFACE_MODE_USXGMII:
     902 |                         case PHY_INTERFACE_MODE_10GBASER:
     903 |                                 sel = REG_PCIE_XSI1_SEL_XFI;
     904 |                                 break;
     905 |                         case PHY_INTERFACE_MODE_SGMII:
     906 |                         case PHY_INTERFACE_MODE_1000BASEX:
     907 |                         case PHY_INTERFACE_MODE_2500BASEX:
     908 |                                 sel = REG_PCIE_XSI1_SEL_HSGMII;
     909 |                                 break;
     910 |                         default:
     911 |                                 return -EINVAL;
     912 |                         }
     913 |                 } else {
         |                   ~~~~~~
     914 |                         sel = REG_PCIE_XSI1_SEL_PCIE;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:866:9: note: initialize the variable 'reg' to silence this warning
     866 |         u32 reg, mask, sel, val;
         |                ^
         |                 = 0
>> drivers/clk/clk-en7523.c:905:9: warning: variable 'mask' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     905 |                         case PHY_INTERFACE_MODE_SGMII:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:951:10: note: uninitialized use occurs here
     951 |         val &= ~mask;
         |                 ^~~~
   drivers/clk/clk-en7523.c:906:9: warning: variable 'mask' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     906 |                         case PHY_INTERFACE_MODE_1000BASEX:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:951:10: note: uninitialized use occurs here
     951 |         val &= ~mask;
         |                 ^~~~
   drivers/clk/clk-en7523.c:907:9: warning: variable 'mask' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     907 |                         case PHY_INTERFACE_MODE_2500BASEX:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:951:10: note: uninitialized use occurs here
     951 |         val &= ~mask;
         |                 ^~~~
   drivers/clk/clk-en7523.c:901:9: warning: variable 'mask' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     901 |                         case PHY_INTERFACE_MODE_USXGMII:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:951:10: note: uninitialized use occurs here
     951 |         val &= ~mask;
         |                 ^~~~
   drivers/clk/clk-en7523.c:902:9: warning: variable 'mask' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     902 |                         case PHY_INTERFACE_MODE_10GBASER:
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:951:10: note: uninitialized use occurs here
     951 |         val &= ~mask;
         |                 ^~~~
>> drivers/clk/clk-en7523.c:899:7: warning: variable 'mask' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     899 |                 if (mode == PHY_MODE_ETHERNET) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:951:10: note: uninitialized use occurs here
     951 |         val &= ~mask;
         |                 ^~~~
   drivers/clk/clk-en7523.c:899:3: note: remove the 'if' if its condition is always true
     899 |                 if (mode == PHY_MODE_ETHERNET) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     900 |                         switch (submode) {
     901 |                         case PHY_INTERFACE_MODE_USXGMII:
     902 |                         case PHY_INTERFACE_MODE_10GBASER:
     903 |                                 sel = REG_PCIE_XSI1_SEL_XFI;
     904 |                                 break;
     905 |                         case PHY_INTERFACE_MODE_SGMII:
     906 |                         case PHY_INTERFACE_MODE_1000BASEX:
     907 |                         case PHY_INTERFACE_MODE_2500BASEX:
     908 |                                 sel = REG_PCIE_XSI1_SEL_HSGMII;
     909 |                                 break;
     910 |                         default:
     911 |                                 return -EINVAL;
     912 |                         }
     913 |                 } else {
         |                   ~~~~~~
     914 |                         sel = REG_PCIE_XSI1_SEL_PCIE;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-en7523.c:866:15: note: initialize the variable 'mask' to silence this warning
     866 |         u32 reg, mask, sel, val;
         |                      ^
         |                       = 0
   12 warnings generated.


vim +/reg +905 drivers/clk/clk-en7523.c

e0d8ea4ed5fa70f Lorenzo Bianconi  2024-06-27  860  
19cc8c829b41bd6 Christian Marangi 2026-05-20  861  static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
19cc8c829b41bd6 Christian Marangi 2026-05-20  862  				      int submode)
19cc8c829b41bd6 Christian Marangi 2026-05-20  863  {
19cc8c829b41bd6 Christian Marangi 2026-05-20  864  	struct en_serdes_phy_instance *instance = phy_get_drvdata(phy);
19cc8c829b41bd6 Christian Marangi 2026-05-20  865  	struct en_clk_priv *priv = dev_get_drvdata(phy->dev.parent);
19cc8c829b41bd6 Christian Marangi 2026-05-20  866  	u32 reg, mask, sel, val;
19cc8c829b41bd6 Christian Marangi 2026-05-20  867  
19cc8c829b41bd6 Christian Marangi 2026-05-20  868  	switch (instance->serdes_port) {
19cc8c829b41bd6 Christian Marangi 2026-05-20  869  	case AIROHA_SCU_SERDES_PCIE1:
19cc8c829b41bd6 Christian Marangi 2026-05-20  870  		reg = REG_NP_SCU_SSTR;
19cc8c829b41bd6 Christian Marangi 2026-05-20  871  		mask = REG_PCIE_XSI0_SEL_MASK;
19cc8c829b41bd6 Christian Marangi 2026-05-20  872  
19cc8c829b41bd6 Christian Marangi 2026-05-20  873  		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_PCIE)
19cc8c829b41bd6 Christian Marangi 2026-05-20  874  			return -EINVAL;
19cc8c829b41bd6 Christian Marangi 2026-05-20  875  
19cc8c829b41bd6 Christian Marangi 2026-05-20  876  		if (mode == PHY_MODE_ETHERNET) {
19cc8c829b41bd6 Christian Marangi 2026-05-20  877  			switch (submode) {
19cc8c829b41bd6 Christian Marangi 2026-05-20  878  			case PHY_INTERFACE_MODE_USXGMII:
19cc8c829b41bd6 Christian Marangi 2026-05-20  879  			case PHY_INTERFACE_MODE_10GBASER:
19cc8c829b41bd6 Christian Marangi 2026-05-20  880  				sel = REG_PCIE_XSI0_SEL_XFI;
19cc8c829b41bd6 Christian Marangi 2026-05-20  881  				break;
19cc8c829b41bd6 Christian Marangi 2026-05-20  882  			case PHY_INTERFACE_MODE_SGMII:
19cc8c829b41bd6 Christian Marangi 2026-05-20  883  			case PHY_INTERFACE_MODE_1000BASEX:
19cc8c829b41bd6 Christian Marangi 2026-05-20  884  			case PHY_INTERFACE_MODE_2500BASEX:
19cc8c829b41bd6 Christian Marangi 2026-05-20  885  				sel = REG_PCIE_XSI0_SEL_HSGMII;
19cc8c829b41bd6 Christian Marangi 2026-05-20  886  				break;
19cc8c829b41bd6 Christian Marangi 2026-05-20  887  			default:
19cc8c829b41bd6 Christian Marangi 2026-05-20  888  				return -EINVAL;
19cc8c829b41bd6 Christian Marangi 2026-05-20  889  			}
19cc8c829b41bd6 Christian Marangi 2026-05-20  890  		} else {
19cc8c829b41bd6 Christian Marangi 2026-05-20  891  			sel = REG_PCIE_XSI0_SEL_PCIE;
19cc8c829b41bd6 Christian Marangi 2026-05-20  892  		}
19cc8c829b41bd6 Christian Marangi 2026-05-20  893  
19cc8c829b41bd6 Christian Marangi 2026-05-20  894  		break;
19cc8c829b41bd6 Christian Marangi 2026-05-20  895  	case AIROHA_SCU_SERDES_PCIE2:
19cc8c829b41bd6 Christian Marangi 2026-05-20  896  		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_PCIE)
19cc8c829b41bd6 Christian Marangi 2026-05-20  897  			return -EINVAL;
19cc8c829b41bd6 Christian Marangi 2026-05-20  898  
19cc8c829b41bd6 Christian Marangi 2026-05-20 @899  		if (mode == PHY_MODE_ETHERNET) {
19cc8c829b41bd6 Christian Marangi 2026-05-20  900  			switch (submode) {
19cc8c829b41bd6 Christian Marangi 2026-05-20  901  			case PHY_INTERFACE_MODE_USXGMII:
19cc8c829b41bd6 Christian Marangi 2026-05-20  902  			case PHY_INTERFACE_MODE_10GBASER:
19cc8c829b41bd6 Christian Marangi 2026-05-20  903  				sel = REG_PCIE_XSI1_SEL_XFI;
19cc8c829b41bd6 Christian Marangi 2026-05-20  904  				break;
19cc8c829b41bd6 Christian Marangi 2026-05-20 @905  			case PHY_INTERFACE_MODE_SGMII:
19cc8c829b41bd6 Christian Marangi 2026-05-20  906  			case PHY_INTERFACE_MODE_1000BASEX:
19cc8c829b41bd6 Christian Marangi 2026-05-20  907  			case PHY_INTERFACE_MODE_2500BASEX:
19cc8c829b41bd6 Christian Marangi 2026-05-20  908  				sel = REG_PCIE_XSI1_SEL_HSGMII;
19cc8c829b41bd6 Christian Marangi 2026-05-20  909  				break;
19cc8c829b41bd6 Christian Marangi 2026-05-20  910  			default:
19cc8c829b41bd6 Christian Marangi 2026-05-20  911  				return -EINVAL;
19cc8c829b41bd6 Christian Marangi 2026-05-20  912  			}
19cc8c829b41bd6 Christian Marangi 2026-05-20  913  		} else {
19cc8c829b41bd6 Christian Marangi 2026-05-20  914  			sel = REG_PCIE_XSI1_SEL_PCIE;
19cc8c829b41bd6 Christian Marangi 2026-05-20  915  		}
19cc8c829b41bd6 Christian Marangi 2026-05-20  916  
19cc8c829b41bd6 Christian Marangi 2026-05-20  917  		break;
19cc8c829b41bd6 Christian Marangi 2026-05-20  918  	case AIROHA_SCU_SERDES_USB1:
19cc8c829b41bd6 Christian Marangi 2026-05-20  919  		reg = REG_NP_SCU_SSR3;
19cc8c829b41bd6 Christian Marangi 2026-05-20  920  		mask = REG_SSUSB_HSGMII_SEL_MASK;
19cc8c829b41bd6 Christian Marangi 2026-05-20  921  
19cc8c829b41bd6 Christian Marangi 2026-05-20  922  		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_USB_DEVICE &&
19cc8c829b41bd6 Christian Marangi 2026-05-20  923  		    mode != PHY_MODE_USB_DEVICE_SS)
19cc8c829b41bd6 Christian Marangi 2026-05-20  924  			return -EINVAL;
19cc8c829b41bd6 Christian Marangi 2026-05-20  925  
19cc8c829b41bd6 Christian Marangi 2026-05-20  926  		if (mode == PHY_MODE_ETHERNET)
19cc8c829b41bd6 Christian Marangi 2026-05-20  927  			sel = REG_SSUSB_HSGMII_SEL_HSGMII;
19cc8c829b41bd6 Christian Marangi 2026-05-20  928  		else
19cc8c829b41bd6 Christian Marangi 2026-05-20  929  			sel = REG_SSUSB_HSGMII_SEL_USB;
19cc8c829b41bd6 Christian Marangi 2026-05-20  930  
19cc8c829b41bd6 Christian Marangi 2026-05-20  931  		break;
19cc8c829b41bd6 Christian Marangi 2026-05-20  932  	case AIROHA_SCU_SERDES_USB2:
19cc8c829b41bd6 Christian Marangi 2026-05-20  933  		reg = REG_NP_SCU_SSTR;
19cc8c829b41bd6 Christian Marangi 2026-05-20  934  		mask = REG_USB_PCIE_SEL_MASK;
19cc8c829b41bd6 Christian Marangi 2026-05-20  935  
19cc8c829b41bd6 Christian Marangi 2026-05-20  936  		if (mode != PHY_MODE_PCIE && mode != PHY_MODE_USB_DEVICE &&
19cc8c829b41bd6 Christian Marangi 2026-05-20  937  		    mode != PHY_MODE_USB_DEVICE_SS)
19cc8c829b41bd6 Christian Marangi 2026-05-20  938  			return -EINVAL;
19cc8c829b41bd6 Christian Marangi 2026-05-20  939  
19cc8c829b41bd6 Christian Marangi 2026-05-20  940  		if (mode == PHY_MODE_PCIE)
19cc8c829b41bd6 Christian Marangi 2026-05-20  941  			sel = REG_USB_PCIE_SEL_PCIE;
19cc8c829b41bd6 Christian Marangi 2026-05-20  942  		else
19cc8c829b41bd6 Christian Marangi 2026-05-20  943  			sel = REG_USB_PCIE_SEL_USB;
19cc8c829b41bd6 Christian Marangi 2026-05-20  944  
19cc8c829b41bd6 Christian Marangi 2026-05-20  945  		break;
19cc8c829b41bd6 Christian Marangi 2026-05-20  946  	default:
19cc8c829b41bd6 Christian Marangi 2026-05-20  947  		return -EINVAL;
19cc8c829b41bd6 Christian Marangi 2026-05-20  948  	}
19cc8c829b41bd6 Christian Marangi 2026-05-20  949  
19cc8c829b41bd6 Christian Marangi 2026-05-20  950  	val = readl(priv->base + reg);
19cc8c829b41bd6 Christian Marangi 2026-05-20  951  	val &= ~mask;
19cc8c829b41bd6 Christian Marangi 2026-05-20  952  	val |= sel;
19cc8c829b41bd6 Christian Marangi 2026-05-20  953  	writel(val, priv->base + reg);
19cc8c829b41bd6 Christian Marangi 2026-05-20  954  
19cc8c829b41bd6 Christian Marangi 2026-05-20  955  	return 0;
19cc8c829b41bd6 Christian Marangi 2026-05-20  956  }
19cc8c829b41bd6 Christian Marangi 2026-05-20  957  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

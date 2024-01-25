Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A02883D
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jan 2024 05:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706161770; cv=none; b=h4Xa0UxIBlZ711SA6cia/dNMueKJfh2kptlo/zoIJ+JeQEY3vRFdrfoSPevGoCMV8x9ohH9YZCBryH6YTWI/f/w/83kz7EnRL++yaqMuPDkTK7yqNlwnpJNHfNEe79/dXJoE1RnodZYCusAQVbZ4zuO+XiFPze0maO+Etzw6BEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706161770; c=relaxed/simple;
	bh=xgs1eIhloyPTAMuv7n3DQydYGP7wOIMU6ti6c/ombzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M6Vm94LsCCKSxwzt7k0D1lyk2WeUdmOmw51VN/eQvuivb5TFI1gu9FPgf4GoqQBiwdzaAdp5AwP8ELjLqHWHm+QG2Vkg//b07HWs5BwnIJebL0mb2KuzwvOzg+fGYFsWdJ/M4gjsyHyJ7BI3uyZWhKNXZ4dexD6qZZxG48HKTyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEJvKKmL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEJvKKmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706161768; x=1737697768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xgs1eIhloyPTAMuv7n3DQydYGP7wOIMU6ti6c/ombzY=;
  b=dEJvKKmLMWtXPXv1EK3Rc+TBXdEGXBMAWbmSn1/x+xLZ7LL6VYMl+gm8
   lb3d6xy5yeqfRnSzDQtrwKR344T+8DRt5JXuSE97SLzaa2MIgxZf4ekW/
   Fq7bOGoTLsOale5Rq4MqV2oLHJXjXugU1Ko/HCJ/iKPFHdrFj6PG5SpTm
   ogrpYe0DIyuNNVnklHTaT2ttZoDUlMfO/6XWmrgcR9BP5WQ5UuejszRaU
   e6JrVQ/9VYz2JCZKqp3em92l7p1ddB3Cr3WUGZCe/WrfUmVKNBz4xhvEt
   M8iiXUPGgXAmL5yDhREZfHpaWu32yT/SXGfCBLpX6huTgAAFSj7figGA/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8742313"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8742313"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 21:49:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20949764"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jan 2024 21:49:26 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSsc8-0008kT-0Z;
	Thu, 25 Jan 2024 05:49:24 +0000
Date: Thu, 25 Jan 2024 13:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/ipmi/Kconfig:138: syntax error
Message-ID: <202401251345.s8cfi5TX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git master
head:   5aef72f74942091b6d408fce235629dc0620e74e
commit: 2a5847247815412a6d86050ef98cd60cb26afd66 Default disabled Phytium drivers on OpenCloudOS 8.8
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-001-20240125 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251345.s8cfi5TX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401251345.s8cfi5TX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/ipmi/Kconfig:138: syntax error
   drivers/char/ipmi/Kconfig:137:warning: ignoring unsupported character ','
   drivers/char/ipmi/Kconfig:137:warning: ignoring unsupported character '.'
   drivers/char/ipmi/Kconfig:137: unknown statement "device"
   make[2]: *** [scripts/kconfig/Makefile:73: oldconfig] Error 1 shuffle=2473187589
   make[1]: *** [Makefile:597: oldconfig] Error 2 shuffle=2473187589
   make: *** [Makefile:186: sub-make] Error 2 shuffle=2473187589
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/char/ipmi/Kconfig:138: syntax error
   drivers/char/ipmi/Kconfig:137:warning: ignoring unsupported character ','
   drivers/char/ipmi/Kconfig:137:warning: ignoring unsupported character '.'
   drivers/char/ipmi/Kconfig:137: unknown statement "device"
   make[2]: *** [scripts/kconfig/Makefile:73: olddefconfig] Error 1 shuffle=2473187589
   make[1]: *** [Makefile:597: olddefconfig] Error 2 shuffle=2473187589
   make: *** [Makefile:186: sub-make] Error 2 shuffle=2473187589
   make: Target 'olddefconfig' not remade because of errors.


vim +138 drivers/char/ipmi/Kconfig

^590eaf1fec755 Kaixu Xia    2021-03-16   96  
^590eaf1fec755 Kaixu Xia    2021-03-16   97  config IPMI_KCS_BMC
^590eaf1fec755 Kaixu Xia    2021-03-16   98  	tristate
^590eaf1fec755 Kaixu Xia    2021-03-16   99  
^590eaf1fec755 Kaixu Xia    2021-03-16  100  config ASPEED_KCS_IPMI_BMC
^590eaf1fec755 Kaixu Xia    2021-03-16  101  	depends on ARCH_ASPEED || COMPILE_TEST
^590eaf1fec755 Kaixu Xia    2021-03-16  102  	select IPMI_KCS_BMC
^590eaf1fec755 Kaixu Xia    2021-03-16  103  	select REGMAP_MMIO
^590eaf1fec755 Kaixu Xia    2021-03-16  104  	tristate "Aspeed KCS IPMI BMC driver"
^590eaf1fec755 Kaixu Xia    2021-03-16  105  	help
^590eaf1fec755 Kaixu Xia    2021-03-16  106  	  Provides a driver for the KCS (Keyboard Controller Style) IPMI
^590eaf1fec755 Kaixu Xia    2021-03-16  107  	  interface found on Aspeed SOCs (AST2400 and AST2500).
^590eaf1fec755 Kaixu Xia    2021-03-16  108  
^590eaf1fec755 Kaixu Xia    2021-03-16  109  	  The driver implements the BMC side of the KCS contorller, it
^590eaf1fec755 Kaixu Xia    2021-03-16  110  	  provides the access of KCS IO space for BMC side.
^590eaf1fec755 Kaixu Xia    2021-03-16  111  
ccb23948d0a69a LiQian       2023-06-04  112  config PHYTIUM_BT_IPMI_BMC
ccb23948d0a69a LiQian       2023-06-04  113  	depends on ARCH_PHYTIUM
ccb23948d0a69a LiQian       2023-06-04  114  	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
ccb23948d0a69a LiQian       2023-06-04  115  	tristate "PHYTIUM BT BMC driver"
ccb23948d0a69a LiQian       2023-06-04  116  	help
ccb23948d0a69a LiQian       2023-06-04  117  	  Provides a driver for the BT (Block Transfer) interface found
ccb23948d0a69a LiQian       2023-06-04  118  	  on Phytium SOCs. The driver implements the BMC side of
ccb23948d0a69a LiQian       2023-06-04  119  	  the BT interface.
ccb23948d0a69a LiQian       2023-06-04  120  
2a584724781541 Jiakun Shuai 2023-07-25  121  	  This driver is default disabled on OpenCloudOS 8.8. If your 
2a584724781541 Jiakun Shuai 2023-07-25  122  	  device is using e2000 as BMC, please manually enable this module.
2a584724781541 Jiakun Shuai 2023-07-25  123  	  
4d16c334eab3c0 LiQian       2023-06-01  124  config PHYTIUM_KCS_IPMI_BMC
4d16c334eab3c0 LiQian       2023-06-01  125  	depends on ARCH_PHYTIUM
4d16c334eab3c0 LiQian       2023-06-01  126  	select IPMI_KCS_BMC
4d16c334eab3c0 LiQian       2023-06-01  127  	select REGMAP_MMIO
4d16c334eab3c0 LiQian       2023-06-01  128  	tristate "PHYTIUM KCS IPMI BMC driver"
4d16c334eab3c0 LiQian       2023-06-01  129  	help
4d16c334eab3c0 LiQian       2023-06-01  130  	  Provides a driver for the KCS (Keyboard Controller Style) IPMI
4d16c334eab3c0 LiQian       2023-06-01  131  	  interface found on Phytium SOCs.
4d16c334eab3c0 LiQian       2023-06-01  132  
4d16c334eab3c0 LiQian       2023-06-01  133  	  The driver implements the BMC side of the KCS contorller, it
4d16c334eab3c0 LiQian       2023-06-01  134  	  provides the access of KCS IO space for BMC side.
4d16c334eab3c0 LiQian       2023-06-01  135  
2a584724781541 Jiakun Shuai 2023-07-25  136  	  This driver is default disabled on OpenCloudOS 8.8. If your
2a584724781541 Jiakun Shuai 2023-07-25  137        device is using e2000 as BMC, please manually enable this module.
2a584724781541 Jiakun Shuai 2023-07-25 @138  	
^590eaf1fec755 Kaixu Xia    2021-03-16  139  config NPCM7XX_KCS_IPMI_BMC
^590eaf1fec755 Kaixu Xia    2021-03-16  140  	depends on ARCH_NPCM7XX || COMPILE_TEST
^590eaf1fec755 Kaixu Xia    2021-03-16  141  	select IPMI_KCS_BMC
^590eaf1fec755 Kaixu Xia    2021-03-16  142  	select REGMAP_MMIO
^590eaf1fec755 Kaixu Xia    2021-03-16  143  	tristate "NPCM7xx KCS IPMI BMC driver"
^590eaf1fec755 Kaixu Xia    2021-03-16  144  	help
^590eaf1fec755 Kaixu Xia    2021-03-16  145  	  Provides a driver for the KCS (Keyboard Controller Style) IPMI
^590eaf1fec755 Kaixu Xia    2021-03-16  146  	  interface found on Nuvoton NPCM7xx SOCs.
^590eaf1fec755 Kaixu Xia    2021-03-16  147  
^590eaf1fec755 Kaixu Xia    2021-03-16  148  	  The driver implements the BMC side of the KCS contorller, it
^590eaf1fec755 Kaixu Xia    2021-03-16  149  	  provides the access of KCS IO space for BMC side.
^590eaf1fec755 Kaixu Xia    2021-03-16  150  
^590eaf1fec755 Kaixu Xia    2021-03-16  151  	  This support is also available as a module.  If so, the module
^590eaf1fec755 Kaixu Xia    2021-03-16  152  	  will be called kcs_bmc_npcm7xx.
^590eaf1fec755 Kaixu Xia    2021-03-16  153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

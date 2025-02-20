Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A391FECCE
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Feb 2025 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066969; cv=none; b=garWmvNPVYxsgGeOuhFU+m34TAqk8skNW4GsJkTTFtT0wKRpmwHTKFcUGakwBfacITEpSPv7ZCKFqFdt0hFBJpv3PxChKrotTbUOPhk5BimDmDtILJBzQMlDRQW9zvYGpctqssZWuldB+Idu6yqg8tciuRTCZVS2G0DS9GyCRPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066969; c=relaxed/simple;
	bh=inwl9JPNN/5qIvv34Wy09QrIKgpp7JuSCWvTiwndvp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R2Yuwnj28Aboc2Rk/SkNtrqgisyCKSlziFmaGLn5LzXjI5M3xfQVwkze7WyhScwL6Ifao4OMzfk8UeO6SFfu5igHIOERF/MjNriOX57fL4qlYbpj2qFNGovDmRFHjyY+LF+3JTUlHVhh3BwrjFg1M2hQRU5y06LtqebRxA3CHZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmTOIWUu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmTOIWUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740066967; x=1771602967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=inwl9JPNN/5qIvv34Wy09QrIKgpp7JuSCWvTiwndvp4=;
  b=dmTOIWUuH4rbVlsFUPfbVmGg22x615Rt+oWcGA9Sf29TTBqc8S6B836H
   YMiDxwO34IFa3HxdtBNU1UOv0EUg9h8ZTyMrtUWUspbFAFnU/rcm1N9+G
   O9E5h4OqDQ8DZJMNADqF1Sb39jVxqoAIhRl/Hlbj11YPm3I1N+40nI1VM
   NxmB89CqYTksDj64HWG6uoFrQ52EHC33ms6TPKnHySsfho/6RSgF6+XWn
   ++MBxOkZvtgEiAjI8FEjS3rx2CTYIdm2swmgZ2EdwIMNuoq3i5L2dN7jL
   HRQJq1BAqYY2R4KgSh7MZY/JvAYmGGQOqolqMA0rC/kkJA9O+zE3FH2Jf
   g==;
X-CSE-ConnectionGUID: cGPzqCxbTg2cB3zdNIVpuQ==
X-CSE-MsgGUID: 91YQ0aYYR2qkv502donWtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44766872"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="44766872"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:56:03 -0800
X-CSE-ConnectionGUID: vaxQc1YzRhK3N7bKMviVbw==
X-CSE-MsgGUID: W0r4F6/AR2mw40DaJZsWTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120301135"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Feb 2025 07:56:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl8u7-0004St-0M;
	Thu, 20 Feb 2025 15:55:59 +0000
Date: Thu, 20 Feb 2025 23:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:pr/60 1/1] arch/arm/boot/dts/bcm953012k.dts:46.9-49.4:
 Warning (unit_address_vs_reg): /memory: node has a reg or ranges property,
 but no unit name
Message-ID: <202502202340.mrjLEkQE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: abe60a3a7afb4058278864aa18c5faf62094c11a [1/1] ARM: dts: Kill off skeleton{64}.dtsi
:::::: branch date: 3 days ago
:::::: commit date: 6 years ago
config: arm-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250220/202502202340.mrjLEkQE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502202340.mrjLEkQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502202340.mrjLEkQE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm953012k.dts:46.9-49.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
--
   arch/arm/boot/dts/bcm7445.dtsi:66.6-225.4: Warning (unit_address_vs_reg): /rdb: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm7445.dtsi:227.21-298.4: Warning (unit_address_vs_reg): /memory_controllers: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm7445-bcm97445svmb.dts:9.9-14.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm7445.dtsi:255.10-275.5: Warning (simple_bus_reg): /memory_controllers/memc@1: simple-bus unit address format error, expected "80000"
   arch/arm/boot/dts/bcm7445.dtsi:277.10-297.5: Warning (simple_bus_reg): /memory_controllers/memc@2: simple-bus unit address format error, expected "100000"
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts:44.12-54.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts:22.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts:86.12-109.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts:58.12-80.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts:44.12-54.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts:18.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts:45.12-55.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts:19.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts:23.12-39.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts:22.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts:96.12-106.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm11351.dtsi:103.15-108.4: Warning (unit_address_vs_reg): /l2-cache: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm11351.dtsi:228.22-233.5: Warning (unit_address_vs_reg): /clocks/root_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm11351.dtsi:235.20-240.5: Warning (unit_address_vs_reg): /clocks/hub_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm11351.dtsi:242.20-249.5: Warning (unit_address_vs_reg): /clocks/aon_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm11351.dtsi:251.26-262.5: Warning (unit_address_vs_reg): /clocks/master_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm11351.dtsi:264.24-278.5: Warning (unit_address_vs_reg): /clocks/slave_ccu: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm28155-ap.dts:24.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts:69.12-91.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm21664.dtsi:93.15-98.4: Warning (unit_address_vs_reg): /l2-cache: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm21664.dtsi:298.22-303.5: Warning (unit_address_vs_reg): /clocks/root_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm21664.dtsi:305.20-310.5: Warning (unit_address_vs_reg): /clocks/aon_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm21664.dtsi:312.26-324.5: Warning (unit_address_vs_reg): /clocks/master_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm21664.dtsi:326.24-337.5: Warning (unit_address_vs_reg): /clocks/slave_ccu: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm21664-garnet.dts:24.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts:84.12-94.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts:53.12-81.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts:22.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts:60.12-76.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts:18.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts:43.12-53.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm53573.dtsi:35.9-49.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm947189acdbmr.dts:20.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm947189acdbmr.dts:44.12-60.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:464.22-473.4: Warning (avoid_unnecessary_addr_size): /srab@18007000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts:93.12-115.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts:19.9-22.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts:89.12-99.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm953012er.dts:42.9-45.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:464.22-473.4: Warning (avoid_unnecessary_addr_size): /srab@18007000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm953012er.dts:47.12-63.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm53573.dtsi:35.9-49.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts:19.9-22.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts:40.12-50.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts:18.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts:77.12-93.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-netgear-r8500.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-netgear-r8500.dts:65.12-93.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts:99.12-135.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts:20.9-22.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts:24.12-40.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts:22.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts:51.12-61.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm23550.dtsi:374.22-379.5: Warning (unit_address_vs_reg): /clocks/root_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm23550.dtsi:381.20-386.5: Warning (unit_address_vs_reg): /clocks/aon_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm23550.dtsi:388.24-399.5: Warning (unit_address_vs_reg): /clocks/slave_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm23550.dtsi:401.26-413.5: Warning (unit_address_vs_reg): /clocks/master_ccu: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm23550-sparrow.dts:48.9-51.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
--
   arch/arm/boot/dts/bcm53573.dtsi:35.9-49.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47189-tenda-ac9.dts:18.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47189-tenda-ac9.dts:59.12-81.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts:59.12-69.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts:22.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts:91.12-120.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts:18.9-20.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts:44.12-54.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-linksys-panamera.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47094-linksys-panamera.dts:137.15-204.4: Warning (unit_address_vs_reg): /mdio-mii-mux: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:464.22-473.4: Warning (avoid_unnecessary_addr_size): /srab@18007000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-linksys-panamera.dts:25.12-47.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-linksys-panamera.dts:153.13-202.6: Warning (avoid_unnecessary_addr_size): /mdio-mii-mux/mdio-mii@0/switch@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +46 arch/arm/boot/dts/bcm953012k.dts

ccf0b5e37115f86 Jon Mason   2015-11-02  36  
ccf0b5e37115f86 Jon Mason   2015-11-02  37  / {
ccf0b5e37115f86 Jon Mason   2015-11-02  38  	model = "NorthStar SVK (BCM953012K)";
ccf0b5e37115f86 Jon Mason   2015-11-02  39  	compatible = "brcm,bcm953012k", "brcm,brcm53012", "brcm,bcm4708";
ccf0b5e37115f86 Jon Mason   2015-11-02  40  
ccf0b5e37115f86 Jon Mason   2015-11-02  41  	aliases {
ccf0b5e37115f86 Jon Mason   2015-11-02  42  		serial0 = &uart0;
ccf0b5e37115f86 Jon Mason   2015-11-02  43  		serial1 = &uart1;
ccf0b5e37115f86 Jon Mason   2015-11-02  44  	};
ccf0b5e37115f86 Jon Mason   2015-11-02  45  
ccf0b5e37115f86 Jon Mason   2015-11-02 @46  	memory {
abe60a3a7afb405 Rob Herring 2019-01-09  47  		device_type = "memory";
88d1fa70c21d7b4 Jon Mason   2017-02-08  48  		reg = <0x80000000 0x10000000>;
ccf0b5e37115f86 Jon Mason   2015-11-02  49  	};
ccf0b5e37115f86 Jon Mason   2015-11-02  50  };
ccf0b5e37115f86 Jon Mason   2015-11-02  51  

:::::: The code at line 46 was first introduced by commit
:::::: ccf0b5e37115f8675455632f583d06ea94f43539 ARM: dts: bcm5301x: Add BCM SVK DT files

:::::: TO: Jon Mason <jonmason@broadcom.com>
:::::: CC: Florian Fainelli <f.fainelli@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

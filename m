Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA57E383
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720660619; cv=none; b=mz/Gh2Y7jAKCemB67OfW8V/OslLjdwG6gC32GLBiwl+KZpFSILkkrKwkDfp6f6kPaXT4oqVXZwZxvtXnQuWsvKI3Warey2RxXc18Kxkmxmxx6+tWCElCoLgyH76E3j8B0UsAsoWsx9Z7JENmhbgbwXTrfGSYUczmU0HjtQAfygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720660619; c=relaxed/simple;
	bh=L9x/7qvvoIP3toVsWFb56QqH1tKzlMraThdZkUHtM/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+ej1p7iqFt/xxOXHMCucdwYcT91WN7BGtYMbVBk2nfKghVYSFyaadesAipWJdvSRd+F+t0Di1kZlun8h5sjjYIWxA5BACssEk9HVU9+ZhI52rh7kPY9JtwteFTMSr1vxb2gsnCpSH3ebKIppkJHT5wxyfAcSEohs2SZe3d/LqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ewh+6m46; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ewh+6m46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720660618; x=1752196618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L9x/7qvvoIP3toVsWFb56QqH1tKzlMraThdZkUHtM/A=;
  b=Ewh+6m46XlEZR7ZgLvhqYY8tcK4vQJ42VjrS2puyW4nqUj4wnuZW2vji
   3BODEfpxTxQ2hcCMYL5pUjgWnmjcRrH9hNpcHYlRC5OS8SIbAf+tIMmGD
   ICrpBSLIBf99Zk4740RyvRlN5yM+Bw+LoHizNgyxeLbVkzRboivAsjGH1
   lzo990sV0N1QBBe5388sgmld2JR1hLIt3MpbEiIODwwHXlOsLCYRmUN8H
   gYnizF/wQWTagyrZCyChATW9q7kBLbGYR0is8J6qgsxrsjdV3/PP1asLA
   7wWlbXNekpwQlHEw8CXNPp9nLmx6exhpNWNcJBq9Cuhe3mDkr84weIR1g
   g==;
X-CSE-ConnectionGUID: vBWsSMuORueFOAwccevkJQ==
X-CSE-MsgGUID: uo8CstAdRqmBtkP0m+Hpyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="35555909"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="35555909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:16:57 -0700
X-CSE-ConnectionGUID: r55Xi5ltRAal1t9va2RiWw==
X-CSE-MsgGUID: cUDa+KurTxWsAMdUIkmEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48394221"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jul 2024 18:16:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRiQY-000YZu-1d;
	Thu, 11 Jul 2024 01:16:54 +0000
Date: Thu, 11 Jul 2024 09:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb:
 i2c-mux@70: idle-state: [0] is not of type 'integer'
Message-ID: <202407110931.S4axppJr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
CC: Joel Stanley <joel@jms.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9a2f29aefdadc86e450308ff056017a209c755
commit: 2b8d94f4b4a4765dcbe4a48cb0d58b266c158a10 ARM: dts: aspeed: yosemite4: add Facebook Yosemite 4 BMC
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110931.S4axppJr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110931.S4axppJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110931.S4axppJr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@280: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@300: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@380: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@400: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@480: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-mux@70: idle-state: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-mux@70: Unevaluated properties are not allowed ('idle-state' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@500: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-mux@71: idle-state: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-mux@71: Unevaluated properties are not allowed ('idle-state' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@580: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@600: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

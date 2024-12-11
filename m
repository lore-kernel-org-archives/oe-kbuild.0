Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0091F5EA
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 00:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877981; cv=none; b=rMOhNrafXHxMYqSQ2mfaqgWd/qm/+f3blRUXr7rCWHfuXd1jNnhBRmW1HMn98QtWmmEJl1UYnEC0nJkqqQ1NRH4At795hQ11ywhlWqV7c7tRzlcqGwQu82/BijXfBmsfSXCmWHR95b3qJQk6x8+r/1Rp7mjkZzgJ+ur61UxUeDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877981; c=relaxed/simple;
	bh=bPgB5A0mhChhnKhuFuVRT/909DMgcDE/etw1/roqA68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zc9bNR0xpc9SEdrgIZnX4tX4YydJHvbqoubzZSlkfEeuGmb+kUoZjeWMn99zTsYeVeyeUXyNM48QMgjwePKuw2TqObghlBxQUeEffWt8Vda4qgqxrIbm5YM8hDBL97adqVh7dOkuf1u0aseFOsysqy2z99D7kmkfIW7pva9pwwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+NlQmsp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+NlQmsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733877979; x=1765413979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPgB5A0mhChhnKhuFuVRT/909DMgcDE/etw1/roqA68=;
  b=N+NlQmspntExlstFL3iBiqop9HqwXxP2R7LpGLZm7LKNo8S1hnzXRDCX
   oIL73L0KG3Nkqb0AhN4PffnIN/1qHGwz6pD+ejvQuzkOzuW/Of74DCh81
   iVVZ7a/t040F/siQVX02zkut4a8rQNaUtL8E9/3dRa775jpXRFfCWdcdh
   Vm4JeTiX0fhkDv7EkLtbfd845sE8tJujlnYzAbBmwv9P6wMQ4c2jiNMA9
   5TIvobNwRBUfxJi2qRTGftmQrWs4AQYikEjCNMcGIeN0sQIxmZIoIPlVQ
   QELuO+P3Equ48+29K1PppEDIJTqhv5upYG0hXYSo532V+Kxge33KtU9mX
   Q==;
X-CSE-ConnectionGUID: pTG0Ci43Q/ec112zCzROCQ==
X-CSE-MsgGUID: Ey6/GOmCTaWJm17eO6Y3Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34386118"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="34386118"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 16:46:18 -0800
X-CSE-ConnectionGUID: 6X2HfDzKQMimGnJx5jKMmw==
X-CSE-MsgGUID: 48g8+jPlTzu44joUR+Ddmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95287915"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2024 16:46:17 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLArm-00066b-34;
	Wed, 11 Dec 2024 00:46:14 +0000
Date: Wed, 11 Dec 2024 08:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 13/187]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to
 match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3',
 'snps,dwc3']
Message-ID: <202412110835.TbKxKQ2Y-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   5553f8f1fe2a6f02eded3969869311b465aeb258
commit: 9a6f5d1cc973eafc1670cd79b344e74379439769 [13/187] arm64: dts: apple: t8103: Add dwc3 nodes
:::::: branch date: 32 hours ago
:::::: commit date: 13 days ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241211/202412110835.TbKxKQ2Y-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412110835.TbKxKQ2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412110835.TbKxKQ2Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000: iommus: [[89, 0], [90, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000: iommus: [[93, 0], [94, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000: iommus: [[89, 0], [90, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000: iommus: [[93, 0], [94, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000: iommus: [[89, 0], [90, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000: iommus: [[93, 0], [94, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000: iommus: [[89, 0], [90, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000: iommus: [[93, 0], [94, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000: iommus: [[89, 0], [90, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000: iommus: [[93, 0], [94, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06B1653
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734298647; cv=none; b=f6WUvnk5kK6BwMLSWBuzl6pboBX7sD9xAkt7OjyE1/DLco1RCYrue1IBfcPAHHEScdKlUVKq0zJYrPVfO/tdpfDRuUz0oh9PlppddWblmCi4rQYrJYKR5iDAHJ5ztOncTILccEcRrPhSjR33DPWRd14zwmrlzwTB/7RNKQH9WVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734298647; c=relaxed/simple;
	bh=di+f7WfIXHvkr5dZO6t3XyevxtF26nBJi4+K6dJUZFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEaMRnlN7pt19L2Ya+asw0e39qJpTNqAnVs9dz3WaJIMTMKhvGzuvjj58cqCgIMEeykmdfNjXtwgzWzfxo5dSbbHy3BmreTBdYZbVJqe0mX9OvIasd3Gb2OB04mqCOzBKQhAkniz4AqmC/C7aMWrK/j55GWKFbjRCmivvRYpNw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGnnVBT9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGnnVBT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734298644; x=1765834644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=di+f7WfIXHvkr5dZO6t3XyevxtF26nBJi4+K6dJUZFY=;
  b=WGnnVBT9H21we/keatwz74EpSjkKuuG2nd+ZgiN/zQSbBrglRhxF4IhM
   Hcos/dWRNCC5wM17DERP7Cwt41dAsVyiB/7U5pu1iTqfrpRHrPN+PLd/S
   rj9rZQOSInU1j3u4gfzeoOwHGxlGV+MJPSnS5fX8h3TJEy2E1vU9vJmr9
   eTldXsjYDYJW4vU2f8mR5S7UR88swLZObxT4fDNefKlYLFnKBFOnO45O4
   yDXz7slECMCWF8yNAE4Zcgktau/v5Oud4TYbbgOoUaUKow/Cfce9iz6L3
   B3fmyoPjbIfnF/xGVBBw9J50DWIqLwoPLmWA8K/na6w8HgJc22mpYh+5F
   Q==;
X-CSE-ConnectionGUID: NseYL19yQlapABsLbk/G4Q==
X-CSE-MsgGUID: 7bedNDvoTO2wUYK5/W6JXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34412409"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34412409"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 13:37:24 -0800
X-CSE-ConnectionGUID: gkVyPNW1T9OW93Y8uqyDbw==
X-CSE-MsgGUID: ES12LeNMTk21/+VfugDbVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="97082127"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Dec 2024 13:37:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMwIi-000DsG-1Q;
	Sun, 15 Dec 2024 21:37:20 +0000
Date: Mon, 16 Dec 2024 05:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 13/187]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to
 match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3',
 'snps,dwc3']
Message-ID: <202412160523.om2Pi52W-lkp@intel.com>
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
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241216/202412160523.om2Pi52W-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412160523.om2Pi52W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412160523.om2Pi52W-lkp@intel.com/

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

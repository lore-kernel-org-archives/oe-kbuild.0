Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8301DA4E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Dec 2024 22:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734127635; cv=none; b=K8OdRiVCXGLA5rV45egLW97EvVAQrQbZaqqpPYZjMFnCUIQGd8ihsmT5lvj3264QjQRtaq+ToK737BLhouJEI/6CFm+nfi+xupdVzd6CEkSSjlIQfKVTLTCULnEjjuSqeAgllAZHcjsRiu6a6gStC+b5TaIrU4hyLNRtXtYS0Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734127635; c=relaxed/simple;
	bh=G+1HtOpK1IrXhhvrHM2OPH78P7ABtKh6A2iSWe5amLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SJ2iUC2qlNdKb3Fv5b3EEi7k4BfPVXadYdNbH9btgMhiTw+cKWk1VPX6ZWivaBE8TqHuQWNg3Z9P4FSx0kvQuem+xjUs9eTiZ+4vaEu+fBrattXxpVNxFRjyD05I1udHh7uk8HpVdQEQxmyx9PbRoz0DfYJtRjPRPi/FSyHWOeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJd8HyR6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJd8HyR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734127633; x=1765663633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G+1HtOpK1IrXhhvrHM2OPH78P7ABtKh6A2iSWe5amLQ=;
  b=SJd8HyR60bxIW8OgGzJoRst3Z6KCzO4/n9tqYWl2rsvUyX5a6EwKy5Z8
   3myfMS3cYYTITsq9LQ8xEfpW7dK4OXByNrf44uh1R0oQ5/NFTokQ4WdF4
   Utetp3bR8dSwWxprcqG7AL4V6NNdrzUxxukpT4iHzv0jdlhsl2HdZUVe1
   YIkjRPM0kQcQfX9Y9wHZIb9mBL6jJy7dB4c7ROKNa09zfUvvW7NksXXj1
   yAw+GYooHS0VMrzxiMzTKhcggSNO0YNHN6MZl7jtS6zUUcKbD/Qcwweqk
   hH98YVNkdUzEtsLftGk6wvQJe530yx6PuOw+8Aqbn0rdcBdtvuepRnUO7
   Q==;
X-CSE-ConnectionGUID: F6DS2m8xRpmRDJHowreqZg==
X-CSE-MsgGUID: vk9rcjZARgWwKZtG63LPdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46001335"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46001335"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 14:07:12 -0800
X-CSE-ConnectionGUID: hJJPTe1aSxulmbDIn7UbgA==
X-CSE-MsgGUID: 4F2bRmSdQ7y+n4LV/ADCRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101223554"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2024 14:07:11 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMDoS-000CTX-2d;
	Fri, 13 Dec 2024 22:07:08 +0000
Date: Sat, 14 Dec 2024 06:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 13/187]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to
 match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3',
 'snps,dwc3']
Message-ID: <202412140511.Pdldua3N-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241214/202412140511.Pdldua3N-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140511.Pdldua3N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412140511.Pdldua3N-lkp@intel.com/

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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A21E30FC33
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Apr 2026 04:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776312517; cv=none; b=MOUOmVqTXH9znyGavmxiM2WOlH5doDa9YT/wn7DdYoxYOZnlilfnJc15FILkZcOhG/GxRflt4q9e6uxDPnqGmmDRkW7H589SNuyvTX6n6IyzgHb15uQr7qFqpDQ/FEXZo7+Wxcuz5gJ21nNvzM/FOXtfSff4VDLeat+rovOUlV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776312517; c=relaxed/simple;
	bh=wesmMKwNAqBm1wKfD9Mxc+4jfHZcLVQyjiTXDHb++yo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uNqDuBDE8qIZAwBPDN3ci2pd+lb1i+CfSdGaVMHgU31rupOgTyBwglPxcogBUdeeW1FiTCGPMHPJSoC3TjKmLTGkn4gZaeE2L4XWzQe8m4JDxlE0rf231dcCPp7DfCOHTPRwwFPa12Os4lQIgl3ry8Fd9CLb+5sLtNISMdr6X5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXm3kWPE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXm3kWPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776312515; x=1807848515;
  h=date:from:to:cc:subject:message-id;
  bh=wesmMKwNAqBm1wKfD9Mxc+4jfHZcLVQyjiTXDHb++yo=;
  b=kXm3kWPEbwzLSwMJFxKZRzLjNmmUulL19aLCGUMalpHsIrTiKG6+SXoP
   9Wjidi7n9TC4kavoqoEu3XvhyAX1ERZrvAR2ZTZ2Ynq5L2wVNiZTQ9xba
   je7Uu2wg8c8Ove05WnGK5w+g/0uNWdxzZ+m2PmOTjBAwPZDMGfB2PXT99
   VRRjsNJkO61u9Sbk3E6afbvqY9njIt6hYZXjQl/rW6wyj4LhsXAPG0jN/
   RbD5rNnjC9RiIoEpqXZRlbzP337YZSD6YbDR2Sv3EfVTZJdSZgnHUNdyh
   ucyYoeSobBtMrGPH5t/zQjcda2kBcDfwqbCe5OQrpehEcbizhq9xQai3M
   g==;
X-CSE-ConnectionGUID: JWTTrBiKTFavDUHSQgtY5g==
X-CSE-MsgGUID: zX88n3pEQomZV/s1ra94xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88685724"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="88685724"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 21:08:35 -0700
X-CSE-ConnectionGUID: 0TRu0/6LSJW0b4ppYuaw8w==
X-CSE-MsgGUID: tVfZ90BWRGOvDDrfkvLmRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235563026"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 15 Apr 2026 21:08:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDE1m-000000000wn-1T8q;
	Thu, 16 Apr 2026 04:08:30 +0000
Date: Thu, 16 Apr 2026 06:07:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dtb:
 dp-con (dp-connector): 'type' is a required property
Message-ID: <202604160656.2SXGWI3E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dennis Gilmore <dennis@ausil.us>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/dennis-ausil-us/dt-bindings-arm-rockchip-Add-Orange-Pi-5-Pro/20260414-214028
head:   37795ba245d40dc3f4f541b633b4e9a858fc3bbb
commit: 37795ba245d40dc3f4f541b633b4e9a858fc3bbb arm64: dts: rockchip: Add Orange Pi 5 Pro board support
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260415 (https://download.01.org/0day-ci/archive/20260416/202604160656.2SXGWI3E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160656.2SXGWI3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604160656.2SXGWI3E-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dtb: video-codec@fdc38000 (rockchip,rk3588-vdec): reg-names:0: 'function' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip,vdec.yaml
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dtb: video-codec@fdc38000 (rockchip,rk3588-vdec): reg-names:1: 'link' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip,vdec.yaml
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dtb: video-codec@fdc40000 (rockchip,rk3588-vdec): reg-names:0: 'function' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip,vdec.yaml
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dtb: video-codec@fdc40000 (rockchip,rk3588-vdec): reg-names:1: 'link' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip,vdec.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dtb: dp-con (dp-connector): 'type' is a required property
   	from schema $id: http://devicetree.org/schemas/display/connector/dp-connector.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

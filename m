Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31190148FED
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733993291; cv=none; b=mxax+EHSxvyMAZg89+zaD918HYFJQcl8GQjonL0IIwvCMOK7Rf3T7HKFVJH3/7c/xo/LIeOdx0tdYqrMsvuynQO6TCSLgMyNHUVCuL5mVqVmQAhiEjl3JF3txF1npzNQn3TL6eGn6cGOK7pv9yUMzgmMRFNULRl/FUnAw6mibe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733993291; c=relaxed/simple;
	bh=H/huFXpV4okM9nEeF1OEy6bVYE9JuLsvcFm9esc0TOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BA4zHUGqmX/jueRlpeYbgbDI9eFoFCXyl6QRtTYUqQMeDiCD96Z8+mz2XI2lf3h7nhXmThBpcJ5YrGCPteXnu23LJLSxDm7WdSmOkGRRop+9ZbaeXx1zIsQllLTL0nSrao8vsWVrdRs7BhKImInkzJBQR2II0rAbIy6TmPleXBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJIAganO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJIAganO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733993289; x=1765529289;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H/huFXpV4okM9nEeF1OEy6bVYE9JuLsvcFm9esc0TOw=;
  b=hJIAganODg9gxJLae4TeLQvxDvHWudjfjbRss2iGkC+FGbHkeF45DLYW
   FheQx4u/s0V8Rxu/0L2x4zt+xT45SHT0CgYnFH+2ADSKhkUDLlTJJH2Cz
   ttwIqdDTcKIogS1qc/GPlFvgo6LG0PD6URrayIOe5AjW3RtO4v/dXZVvH
   E2iWcPrPqPysuC7o5eoLfoQMsjrcPcfoVGkdbaUEz+Bjq+v0Ne8+FWiUK
   zNU30SNUOTTuv37Zrle0mVhw8lCQrVRHTt8Hs+14K0aHvMWvou2ICfd8w
   s0vE4736JV5cHvvrxamZP9xAku5Ynn6lU1zR67JaRxAaeh1JnXLVKkLKc
   w==;
X-CSE-ConnectionGUID: /NEiucDPT0S0ABXbCVAgdQ==
X-CSE-MsgGUID: icYHjc5MQhGzPuO60xX6nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59800210"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="59800210"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 00:48:07 -0800
X-CSE-ConnectionGUID: 41nSVNs/Q52R6Kqm6wTxfA==
X-CSE-MsgGUID: TxYy7EkJRi2IW5p6yx5VNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100714204"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2024 00:48:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLerc-0007cr-05;
	Thu, 12 Dec 2024 08:48:04 +0000
Date: Thu, 12 Dec 2024 16:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 28/187]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any
 schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
Message-ID: <202412121631.KGhBaMhh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   5553f8f1fe2a6f02eded3969869311b465aeb258
commit: 1dd6eacb938db7f46e9c03ab89282456bd4a40a4 [28/187] arm64: dts: apple: t600x-jxxx: Put in audio nodes
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241212/202412121631.KGhBaMhh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121631.KGhBaMhh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412121631.KGhBaMhh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000: iommus: [[140, 0], [141, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@1302280000: iommus: [[144, 0], [145, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000: iommus: [[154, 0], [155, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@1302280000: iommus: [[158, 0], [159, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

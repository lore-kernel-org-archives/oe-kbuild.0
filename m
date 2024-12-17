Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6592D13D891
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734453843; cv=none; b=d4MkKRf5DbVARORB6FtBsI9MF6UL0951spiKP7zMBsEhrpR8N5274tgI8XquoJMYVN9FHvfgxpWJRVvF0QUgnII9JVdrWXmj5RttXxDHsVlUjpVQTmxGPlJUKNpl/hCSfmT+7fLaoh6DSEEC0mC4NG7W6l6OpwXBVvy/teiMMAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734453843; c=relaxed/simple;
	bh=5md65SpHS6WutCwehb0TAxeZVrBvwlPfXgHL1u5XRZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UI2m4M7wV6yhaXp9IQA4MC6tJTxD9b11F6PmKZkLw0Onlcw/rJQ1szsOetTdDYsSlARTAkWDYNfamX3OWVNQwmYE8MdRsqIF5R1UxvGSipv6RCDl86YUCx0Mn/n+0Zh04YMiTVR1Y5Zxe6Cfm1yGA5wywnJt7WVAVhqDe5FTHIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OX1CFRHD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OX1CFRHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734453841; x=1765989841;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5md65SpHS6WutCwehb0TAxeZVrBvwlPfXgHL1u5XRZk=;
  b=OX1CFRHDcsZqTzIQKwZuODp2Jgb7JtrQUhI2jcC8hpr8UDA1fFrRcANl
   uTeJGNWAFiPr6rbR+Amk5I5fPPsfsSZUGOlmwQmyAvyKoutxD7858ZubE
   kyxQe6rDc6ZDLe09/bg+N4obkn2uIrWdXE5gs/ho7iHChR9h8WNEUnGUG
   bUD5hr1FpCZN/JdYvQDzsrQDxIRpChC89dOt4mF8P2IpBdXNJ+s3DIJwN
   mEZs92jhsRFEAUvfLGqCJkTsEZJOGfNS/SQh7HFXqKBDlDYzbaSsHVx8X
   A81GlMwo2nXmsY/ukaVAf8gwGZrHEpjlJNTySjAybj6EKODmw8nG1+g4X
   g==;
X-CSE-ConnectionGUID: 1fZXInW8TqOPvMdSEdPVsA==
X-CSE-MsgGUID: N7I+9Ui+Tri+/aBCQ4bRNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34768280"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34768280"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 08:44:01 -0800
X-CSE-ConnectionGUID: f0dBuk86T+6NzZThJK6HEw==
X-CSE-MsgGUID: BYrvHPzpSIK0jlH/kOwo+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="98015719"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Dec 2024 08:43:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNaft-000F9Y-0w;
	Tue, 17 Dec 2024 16:43:57 +0000
Date: Wed, 18 Dec 2024 00:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 28/187]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any
 schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
Message-ID: <202412180005.em3HUj8q-lkp@intel.com>
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
:::::: branch date: 8 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241218/202412180005.em3HUj8q-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412180005.em3HUj8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412180005.em3HUj8q-lkp@intel.com/

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

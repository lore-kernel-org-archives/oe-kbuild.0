Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F2121519C
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733734334; cv=none; b=ntMYfOfmQK+Q7M3cOKORDLnCETz3//OJmqK6vrG3GHXr59ZMlzrYa6uu+sMWKJl/0IZJIPFRQJO3c8cf+ofSb2thWVC4+1yjr/srFx/YcaKdsoyJaIcPXyvoPjcHFBfKhghd9ZB03nf0VfvC2kLjWXSb24lDHiIX7RHw7T0vm88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733734334; c=relaxed/simple;
	bh=OX5xXaNWU4ShGdY9GnrnaUAG7ZIcBJMApYiNQjQReqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uGF9KBjYLEv2F/eRsyX4alL8gOJsH4zObjHxFxwnLxga7gKMquQSUsLUxbaezUSldadaTPYb6E6H/wGIbs/7vTbUpKPEh1S3taPeTCZ73OTmPYJoM9ufiKRKx1OddRN5SuktmfZ/lgRl8BZrK5mUc4TcH1nTfLaZ3cKTSg+B3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jssV/ui5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jssV/ui5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733734331; x=1765270331;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OX5xXaNWU4ShGdY9GnrnaUAG7ZIcBJMApYiNQjQReqs=;
  b=jssV/ui5QD1nLJB4LF6DMfZDewcHI8q1QIX6EmWnW5lVAdNmMq01Ujz6
   vFusLtEz0r2ReOYr23zZEp+i3aMEalH5ANOptNzp39RHEEyTddfte1QSd
   lWlfzofOYdzv/0eRPJgFHTlQlseL2t62/yAgX5RYcmejyhaWaPYQO81c/
   X4WN+uUIvdGQYxpGk4QbDNDZpUIkQ+LXKpLHHy9dXLiMxi1yqDUgB1m6+
   2nSSIpQBs887z5tOFQjuoBQqqySrsX2aDD94y4R43pXRPT5KzBUyKTur7
   owIJcPBbFRtNKEmBj5Gq966hGQJIOYbqrOPJs8x/bRRBYxKuqddyoytxp
   A==;
X-CSE-ConnectionGUID: itovjyTyTrKpSlus3IAUBw==
X-CSE-MsgGUID: cXoACUB2T+WswcrCbZVQPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="44490414"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="44490414"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 00:52:11 -0800
X-CSE-ConnectionGUID: WqhStjMjQOeWtTtJ7sttMQ==
X-CSE-MsgGUID: AwwznWrySRSaX0/FuQPheg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99464644"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Dec 2024 00:52:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKZUs-000469-21;
	Mon, 09 Dec 2024 08:52:06 +0000
Date: Mon, 9 Dec 2024 16:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 27/186]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any schema
 with compatible: ['apple,j274-macaudio', 'apple,macaudio']
Message-ID: <202412091655.K9kOkTZl-lkp@intel.com>
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
head:   02d1d4710aa34dc69aed451dab7a261932418c95
commit: 98ede3ed179db03789953777432b719cca16d60d [27/186] arm64: dts: apple: t8103*: Put in audio nodes
:::::: branch date: 2 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241209/202412091655.K9kOkTZl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091655.K9kOkTZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412091655.K9kOkTZl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000: iommus: [[100, 0], [101, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any schema with compatible: ['apple,j274-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any schema with compatible: ['apple,j274-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000: iommus: [[100, 0], [101, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

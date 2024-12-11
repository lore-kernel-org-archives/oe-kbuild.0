Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4F317838C
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 23:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960254; cv=none; b=gQ4xsGyenZ0QerDKBwJRP0w0EyNSy6+GTOqgK0yi1bigz7BHdYgYc7Lz7wBa2J9q7I4FbUHe2AyMlnFdiz/pzA3vAjGkZB+EGdkTjpXSFs8PTjD9nd2gLxSgI8j6pQzuf/5WC1n/8NaEGy1YxptK+hX3ubIZBMd2P9lkNKEUgUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960254; c=relaxed/simple;
	bh=sxvMr0Xz8E1Xj9WfLeEEgE9kDSrAZw2aEuvFAxXftX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cd128Ed/scyC5ajD6CbQvRzJ6M1ShJzwQWUiGF/6lyCmasCOzcOZZUxg96aR477CBxMqmxPW7gnMkh/2M5ltLvRhpmpnvrOHhGCImILY4KrXZtU3/YcTkPOp6jeLJIkxnIqXszWGMuHh4rcW0cAuoYI8I9NmfsnkndN2fcguhRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g768+ZX0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g768+ZX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733960253; x=1765496253;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sxvMr0Xz8E1Xj9WfLeEEgE9kDSrAZw2aEuvFAxXftX0=;
  b=g768+ZX0DyhsWh3BDYGHkfE17kOwgU+br/1upD5IL4asn5AVoXd/2L8P
   6Emu+pZ8s1fI16Z9VG8Q6kkV3oPpao5rljtaJdxegYjqqpeYTNrCU/f0A
   lQ9SvcGeP0biAwvYpi7DqUuuR+j8/0+j41f5ez2s7KhkWr/hOqQbRmZtE
   uNQCLnGCZJe9b3izDAftGCRH1iki6SiPWoKgs3QyE/MksTkTD2ubOxbO8
   CSjpdWUvbHWNXliMyvbU/qTBBMMyL8sGhdVbIhkd0L5KH//b4LVxdaIpZ
   J/V1O0I/gfnPpTYgfKkKw+ZzuQTPLBijIz8HcsF/TX4kARlCuWGTZSrua
   w==;
X-CSE-ConnectionGUID: yqhGhlcwTeC1QmaaUGVNRg==
X-CSE-MsgGUID: 7QxD29x0SG2zWK9bO8ijVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34282181"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34282181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 15:37:31 -0800
X-CSE-ConnectionGUID: ODR0dLsZQ5iBF5K0M/pRuw==
X-CSE-MsgGUID: 6JD+7+nJQoGmP30mstJQYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="101024270"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2024 15:37:29 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLWGl-0007DL-1H;
	Wed, 11 Dec 2024 23:37:27 +0000
Date: Thu, 12 Dec 2024 07:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 27/187]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /sound: failed to match any schema
 with compatible: ['apple,j274-macaudio', 'apple,macaudio']
Message-ID: <202412120753.E6SnG8GE-lkp@intel.com>
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
commit: 98ede3ed179db03789953777432b719cca16d60d [27/187] arm64: dts: apple: t8103*: Put in audio nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241212/202412120753.E6SnG8GE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120753.E6SnG8GE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412120753.E6SnG8GE-lkp@intel.com/

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

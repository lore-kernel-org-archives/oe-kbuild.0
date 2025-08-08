Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568CC238140
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754688638; cv=none; b=plqDmBquVdgygtEP/xWxyjc9ULbCBzk82dG/vjAg/vBI8vtx7asCGGOhN4ECjuFL18qLA1U4+SIzOzlg3Awy2ZtGcmJ2gev3bAP2uxITuT+oZzru8KE34vkUsjr3zOXExh80bHWROD3e6PanQ/6BEZzZpAIvkxQAIT3K9oFAP6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754688638; c=relaxed/simple;
	bh=xde+3gn9+HfOblmbyG0Ez3zCopcEu72SoZD6SDgk9eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocnlIVBQWCNuEyGugnMHRjxV4YxIp2tH+9NBKEUR8A7iBFwZG6dcisEfW5KLUi8opEoH534WZBQdYd/op3cX//VJ/Dk4yfaPFENUzK5pF6Y1etWNksiSgn1qIP/w4+XYhbXxJHWsOdzNlSSWuMZNN70zMpKosmM5ZSs2JY3gpTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NI1UaNsV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NI1UaNsV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754688637; x=1786224637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xde+3gn9+HfOblmbyG0Ez3zCopcEu72SoZD6SDgk9eo=;
  b=NI1UaNsVNbiEDiLChWRKX9dk4miWXvIf9eIDlwegkdvsyqGSRCHDrC8i
   H1wsicsB91LD+eULRZdxzELzL6TID50Q27wAM3Ow+kzp1faT9r2gPPC0P
   BoVl2uYblib4sh+OxEdCZCvv10Y0WcFYDNPORz1/FUQQa7j9xKwFLf/tz
   SHOeIGMBbj0ipMW1ofgv0jVMrz8fwtrFCilQwieYR7PiUFktpt7GEg+pJ
   3t7yV1JO84ny24APj59Lsk7XBWQSOlXv6R+X3x0cxcec91UX6BVwErqcL
   84Zng29OCz+3CStT8U1o8IxC4Gb2N+R/jVJczNagAII9pouWTfISqOGFC
   w==;
X-CSE-ConnectionGUID: NOMosKoyTxuNc3gp1gEhwg==
X-CSE-MsgGUID: C99in3s2SymgVapspheAMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="74623294"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="74623294"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 14:30:37 -0700
X-CSE-ConnectionGUID: NWaFhQb/QWqnoJSrKQnigw==
X-CSE-MsgGUID: wYewBFSsRsa2tcNMYtPZDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164646115"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2025 14:30:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukUfX-0004LY-2c;
	Fri, 08 Aug 2025 21:30:32 +0000
Date: Sat, 9 Aug 2025 05:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 35/208]
 arch/arm64/boot/dts/apple/t8103-j293.dtb: framebuffer@0
 (apple,simple-framebuffer): 'post-init-providers' does not match any of the
 regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
Message-ID: <202508090512.6ODzzjd2-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: 32008a575a0bc302031ecfeeebee4c83d1844373 [35/208] arch: arm64: apple: Add dcp panel node for t8103 based laptops and imacs
:::::: branch date: 5 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-052-20250804 (https://download.01.org/0day-ci/archive/20250809/202508090512.6ODzzjd2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090512.6ODzzjd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508090512.6ODzzjd2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[130, 0], [131, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /sound: failed to match any schema with compatible: ['apple,j293-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[128, 0], [129, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /sound: failed to match any schema with compatible: ['apple,j456-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /sound: failed to match any schema with compatible: ['apple,j456-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

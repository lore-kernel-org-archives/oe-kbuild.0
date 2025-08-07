Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37B726B777
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754585952; cv=none; b=ZjGEEkC0s3TvGEkc8CDJ6sSne3U2POqIAMKybIAX0/vx1gZu9yt4694K24avIVTuGvczmj6owIu/u5wNGLQ9QG3eBsQSJ0VV4HTsdzFTN6DBjXFqtEh5T0XgLb/351J58z0Iziw3bZeaCgAu29mE2NtGCijaWtsELjykLe4xcfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754585952; c=relaxed/simple;
	bh=RLfoDZoZPMM2f5u8GaOjizaVflFuE3PidYzWSCit+aY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tPNkCsxOFrRHvJjdXpU9Gqw1voVdIFLN9aw68a3lqvL6TRcu67aaCR0YQVin1dhdwBdYxajj/TxCXQWoZw+dksy6ZN5MPyCeEDSB6ilYO9s04KCWYDAgk22uU6Aoat0SUsnV2HxnLj8ofuhZM4iR2LhacueMktGqXqpUS/xOV1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpQAhtFh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpQAhtFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754585950; x=1786121950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RLfoDZoZPMM2f5u8GaOjizaVflFuE3PidYzWSCit+aY=;
  b=TpQAhtFhGy1vBqDAgWJ5VvqGnTB1c1vvqnVrthAi4HZQQYYx9/TUEJNw
   Hcbad5Lix/gVF1g+DdVKhhVtJRV+x6vneiFaIDnFhbNV2uv6ZG4202F1G
   0Ur5bhzCIL0G/WfBx9gJLkwPi3lepZEn/+lv2RGmirlulO4EFW62gOioi
   AEV7oDEEv9f6dm4z4Pz2nPm6QmpDp3Ysmo9g4+sz337RazjmEwy42P06H
   fEx+9xlvQ+mbRui72cwW/2dw6fdj3QMTimxhjl/E+rC+zHr8jLhAw5cs/
   SS3fvQ51H1RPsAurzTxTGDWaVWQxg87bxas/83CtXe7DkPMhMBi9Qd30r
   Q==;
X-CSE-ConnectionGUID: C8zsPs2KTOOebgp71hzEYA==
X-CSE-MsgGUID: qYaS6nw6Qnao14A5GpkLtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79482915"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="79482915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:59:09 -0700
X-CSE-ConnectionGUID: yQbOfdJCSRqYxwp/wIbisQ==
X-CSE-MsgGUID: i2ia68A9QkeHcJ8hKgUMJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169349927"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 09:59:08 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk3x9-00031Q-1t;
	Thu, 07 Aug 2025 16:58:58 +0000
Date: Fri, 8 Aug 2025 00:57:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 24/208]
 arch/arm64/boot/dts/apple/t6001-j375c.dtb: pinctrl@39b028000
 (apple,t6000-pinctrl): 'usb_hub_oe-hog', 'usb_hub_rst-hog' do not match any
 of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202508080046.VPdUHUrq-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: 93702e8268653fdd6c16cb5bbfa8755c7c0af49a [24/208] arm64: dts: apple: t6001-j375c: Add USB3 hub GPIO initialization
:::::: branch date: 4 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-052-20250804 (https://download.01.org/0day-ci/archive/20250808/202508080046.VPdUHUrq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080046.VPdUHUrq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080046.VPdUHUrq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@38 (ti,sn012776): compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@38 (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: network@0,1 (pci14e4,5f71): $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: pinctrl@39b028000 (apple,t6000-pinctrl): 'usb_hub_oe-hog', 'usb_hub_rst-hog' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[147, 0], [148, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[151, 0], [152, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

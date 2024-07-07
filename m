Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2387568A
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 04:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720325978; cv=none; b=SW80uGeBWMt2yoLRh5Oxl57ROPqw5CnSs1Xb58PFtV/mpD1XwWwC2BSweXtxYNJT+vskPfa6OiqbL1cv8bV6yPLHWXZWuiLOzBhdXWDM2F/Z9DmKZJj2aMXMB+6mPBEAyDAMscjyf651ZMIuAw9bKn0U24vwvbdV0drKNJCZjD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720325978; c=relaxed/simple;
	bh=R/Gl9v8zCB2qJEKgiXTVQDGQnODBIjRrCIO675xMAIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c6BMuSwfMsIZJnggD9tCPURvKarkr8076Ak3IwJNOJ/JVO8v1u+y2r++t13FRyFYaKWckHe6EeX14FOQSCHdjPaPI6rxAUv9EAHBQpgjmg0rQD0kQnRJ8hAO5Y5qnxnd+Sw4B4MpSORTiskrJjA0wdzERCAWkYj03Tq2TsCwuSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCcpYKmL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCcpYKmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720325975; x=1751861975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R/Gl9v8zCB2qJEKgiXTVQDGQnODBIjRrCIO675xMAIg=;
  b=aCcpYKmLWjo2a4YQs805ybNkAVUJLmNcFRRg9nuRG3KfNW6naSLwf4Q/
   yaV1ufDHmv9Zp0Cw/wz8RzFs1vy5km2SZEDE/M+Hak/4A5ho7s0NRrkCz
   0igm6NlOFqPEkC0E1PvVTmjip0ziehz2B3dUPt6AMVcfwUe9Lv+oZAxbX
   /nQgryjBHIAcQ6CWMoUoSiVV4sR2bFLPXL5PfrvXd431s2ZHZnVHCmyEh
   +9AbE8SXKFRjWqU4yYjnCKTk7pD7Gisdvky4vRhzXoMaOblC/z1F9S1GY
   tr/duwj5PX/e4f2l8aX3MNHqrSbkEMsrUtgJxH3PMjZ7MC0Sv9FGxU53v
   w==;
X-CSE-ConnectionGUID: /OoIWoNfRcK0t3zmkVGBgw==
X-CSE-MsgGUID: 3tWJZvKyT1OckGXTvjoW6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="28709054"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="28709054"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 21:19:34 -0700
X-CSE-ConnectionGUID: lS3xzHe8SoK9c6KazRq3/w==
X-CSE-MsgGUID: WQ9BpsekSzact4eM3BsntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="47851036"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Jul 2024 21:19:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQJN5-000Uam-05;
	Sun, 07 Jul 2024 04:19:31 +0000
Date: Sun, 7 Jul 2024 12:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 145/187]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@231304000: 'apple,dma-range'
 does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202407071208.axvZ24x0-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: d8f59ff14e7c51e9b8dea12e2f139d7b7a66096a [145/187] arm64: dts: apple: t8112: Switch to apple,dma-range
:::::: branch date: 3 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240707/202407071208.axvZ24x0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071208.axvZ24x0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407071208.axvZ24x0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/gpu@206400000: failed to match any schema with compatible: ['apple,agx-t8112', 'apple,agx-g14g']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/gpu@206400000: failed to match any schema with compatible: ['apple,agx-t8112', 'apple,agx-g14g']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8112-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8112-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@231304000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@231304000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@231304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@23130c000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@23130c000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@23130c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: mbox@231c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j413', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j413', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
--
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/gpu@206400000: failed to match any schema with compatible: ['apple,agx-t8112', 'apple,agx-g14g']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/gpu@206400000: failed to match any schema with compatible: ['apple,agx-t8112', 'apple,agx-g14g']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8112-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8112-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@231304000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@231304000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@231304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@23130c000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@23130c000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@23130c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: mbox@231c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j415', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j415', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
--
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/gpu@206400000: failed to match any schema with compatible: ['apple,agx-t8112', 'apple,agx-g14g']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/gpu@206400000: failed to match any schema with compatible: ['apple,agx-t8112', 'apple,agx-g14g']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8112-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8112-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@231304000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@231304000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@231304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@23130c000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@23130c000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@23130c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: mbox@231c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/gpu@206400000: failed to match any schema with compatible: ['apple,agx-t8112', 'apple,agx-g14g']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/display-pipe@228200000: failed to match any schema with compatible: ['apple,t8112-display-pipe', 'apple,h7-display-pipe']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/display-pipe@228200000/panel@0: failed to match any schema with compatible: ['apple,summit']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8112-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8112-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@231304000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@231304000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@231304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@23130c000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@23130c000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@23130c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: mbox@231c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j493', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j493', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

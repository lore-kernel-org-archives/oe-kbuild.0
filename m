Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82BD1A262D
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779632710; cv=none; b=sIWdTp+/V8fVeb7WLlas9au8hagDGvc3iQLqYye8Iwuw0btKz5NljOqqHQ4KyhRov8PICgYh19w2ecNDi50tv8r3Jah88p1qQKmvOskVJR51WGNXbI2VbQoG6UyJHhlnU8jCDVbLjGe64ehBhVYvlJoACI5h3Pnf1f3OBER+iYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779632710; c=relaxed/simple;
	bh=H41LvnmJtkVWC5Q45fpjy7R6n4zt9pkr+0oLxhNkVAw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PcZALETn+rflbp5rv0NGzGvXpjmDALubvMNzKPfDiCVcMpo42RffIbHu+e7xCvB6Ei3JlWD9X95Ivyy7q/wgJbJwPqvXFxIhTN4ODzyvj13lHP+ulls6cqpBVUKnrtDmpPbMJ4Ma3vkyhnlnLQNG10e6nQqjIrUxyu32OP4fiHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOBeqq1T; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOBeqq1T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779632707; x=1811168707;
  h=date:from:to:cc:subject:message-id;
  bh=H41LvnmJtkVWC5Q45fpjy7R6n4zt9pkr+0oLxhNkVAw=;
  b=NOBeqq1Tax034CAwJe43DrmWkg12YERwD6t29OBuFukAyPfErV9NOsuZ
   fqKG2BnPzJKUDdpXqahz+0fK16BsOOpuPvFpIxvXlmbrT67iHb0cXJ1q4
   Mmr9gKIN0m8F3UDvMI1SUWzihlogK0eS9831Rt2uw8GnduRvBWAbZXUge
   OyHR+v7d3VsdD141jB4eSgu4M43KvreV1r7tBBjcnj0mR2bGZB3mamHV0
   GwkszRWcR8HsNhZ6zJwu4cFlq32bYC8Eb9/mKXtAJLQ/MxAugSbFqt3os
   JQ6fyEYvHh7PX6X4FdQOKIQ+7jocW30xZcwoQWJZHq8tcQlhSDCCLyLRu
   g==;
X-CSE-ConnectionGUID: UowJ6GPsTpqji/bm4r5wcA==
X-CSE-MsgGUID: dZv9iKWZQXu0tOsKXYix3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80596805"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="80596805"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 07:25:07 -0700
X-CSE-ConnectionGUID: j5Joj3XWQjab1dWxtHNMXA==
X-CSE-MsgGUID: dPf1wfZzR9+w65I6Jlp2iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="235005884"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 24 May 2026 07:25:06 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR9lH-00000000BzV-3qp0;
	Sun, 24 May 2026 14:25:03 +0000
Date: Sun, 24 May 2026 16:24:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 14/114]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000
 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605241624.YXnkNZya-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 0fe91d70bf9d32cd19576a040059bfb22b6a9b03 [14/114] arm64: dts: apple: t8112: Mark MCA power states as externally-clocked
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260524/202605241624.YXnkNZya-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241624.YXnkNZya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605241624.YXnkNZya-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2c0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2c8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2d0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2d8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2e0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: power-controller@2e8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
--
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2c0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2c8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2d0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2d8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2e0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: power-controller@2e8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
--
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2c0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2c8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2d0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2d8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2e0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: power-controller@2e8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
--
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (apple,t8112-pmgr): power-controller@2e8: 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2c0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2c8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2d0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2d8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2e0 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: power-controller@2e8 (apple,t8112-pmgr-pwrstate): 'apple,externally-clocked' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

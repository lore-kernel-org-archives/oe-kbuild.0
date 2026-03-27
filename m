Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BDE1A683B
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 21:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774648800; cv=none; b=LncBlH+FUG/LZAsudGHb8ZmKC7FlEnZ+H8eoshRJgpgOM9v3rJTQtSC16p1rkJyaSLS2yp4C78CTYE7Kb77oeCb7gYS+vZgZHvwBUUZpq6Y//YTK0a7+07jr225nH6LCIgQuJ5ZJksWpT2/s3rNXJF+HyxJ/JLt01bYm3UV9qWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774648800; c=relaxed/simple;
	bh=v4jcmf+vYzZtgXxYJFC1+P1QnKcRwv8nrcxf9sDoEOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WK3iQL7WpxzoCKPrlVoMH7Jsgii7BSLS5ISV6tHccm6RjZVHH0bYGNltwAiO1Wkl+WJ6tjyUZgbuccXIVgOvzfV7vvOep/JL7i4RiQ3I8VVacIfoslpgpjCc3wxgnkXvDHa2i3pSy0zYoePex9l4suWjfFMlbtPEm/YwGMppm5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wk9l0V0Y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wk9l0V0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774648798; x=1806184798;
  h=date:from:to:cc:subject:message-id;
  bh=v4jcmf+vYzZtgXxYJFC1+P1QnKcRwv8nrcxf9sDoEOc=;
  b=Wk9l0V0Y6d9ZdJyLcZqRtW22au6KgDcWaWfRpmMAo1M/1JHzay/Y7bhx
   X+C2NVZAjgDK3Av9WJgZB94Wqy9/FjkXhc+rqQ/TE4Z/jP9u7UdxxE8f+
   TwEgymIUZBOXDv69wu3Y03nyuRTLhyx6+uaZ3c0WL6xkzM2Y27v0/kY+Y
   w67Mh3eVu3JZ2AMV2+Kzddb5EwjlWCfurLGo83wo8cE/o0qe/T8FiMDZU
   mP9MgOYQi03psDMuVNlnGiD9etvSb93XWZxdDeELuSGqSc7TbVf6UacS3
   X0QvLbvz+VLeEXn7bUh91HV27ruEh7KKBrPVIIbtzDp52gaIRaMwddJu5
   Q==;
X-CSE-ConnectionGUID: rpnjACiLROSzciIxbtcb9g==
X-CSE-MsgGUID: OJz8MoTqQBqK6dIg1QFSIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="78329715"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="78329715"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 14:59:57 -0700
X-CSE-ConnectionGUID: GlXpeI7kSfm2MCdXRl7y1g==
X-CSE-MsgGUID: O6vDhZX6Rt+2CBqWuutfZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="224473952"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Mar 2026 14:59:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6FDe-000000007YT-2jGN;
	Fri, 27 Mar 2026 21:59:54 +0000
Date: Fri, 27 Mar 2026 22:59:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 45/139]
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb:
 system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202603272235.EXXeHyl8-lkp@intel.com>
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
TO: Wig Cheng <onlywig@gmail.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   825b8c7e1d2918d89eb378b761530d1e51dba82e
commit: 3147e56028a4e7afff47ffd77e99178e7fe113f0 [45/139] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
:::::: branch date: 8 hours ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2051-20260326 (https://download.01.org/0day-ci/archive/20260327/202603272235.EXXeHyl8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603272235.EXXeHyl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603272235.EXXeHyl8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

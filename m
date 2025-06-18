Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657B610FD
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 04:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750221121; cv=none; b=MRsWRqP7SIgl6FOHuEC8da4kT9YOJhw+O7oZLKuPHbhsQ168rjNhDre6HhCV9dqJzRuOsqLqOPyhEr2rrOjI49dsw+JOg6T4ZA3Sytc06XN7srP+bcoI2L2uyhr5JHhjvnPMqVHEUY8cARfzdPk8wPijM7HVYrIxScHoZk9m8cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750221121; c=relaxed/simple;
	bh=05vv/pD9n8HeerOj8w3MybGKuzeo5ak7rxe4mdzsZnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CVLZwbs3CmJL4fin2fe8AtbLpfjW2PfczbCNGnPhaEMQFjYZRthg+6fuIkpPkavLWuEJqz6DGGiqCFpcoCSlGlqMYt6r8iBXzQTmuDr2VERjvMj6y+ppcMbmKiP8FN7nS4M81nccJk0a1YM159EOPIEItevRbLJOV/psi6BNC/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mY9UaEET; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mY9UaEET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750221117; x=1781757117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=05vv/pD9n8HeerOj8w3MybGKuzeo5ak7rxe4mdzsZnY=;
  b=mY9UaEETmipDYgw+FHefscmItI1IjJ3mxV6Mo2fIqUa/vF772YRWQUVD
   G8o38WTdl0mAqtCkLCqCp0qia1gCHNxHC0CD8xIXZxbMw/ELPhUo/Qn0z
   F1BqjfNSFh7zQ5Awi8IUtXlasRlLZSpvXTa1ejCkylIjnGRrYMosdpUMJ
   W+RRRL65b1oQ4Jr7g5BG46CIbAmSx02IFdImt6Ygavb2YT/Wlz0NXqc8e
   r2k8ZJt6lx5cSfYFn/wzOsfc6iVQMDRDHfeoG8U20Ypl2/0h4DsoilDDS
   n4e3PmyMF1/ChPLVwr+dYG5HQj2HqTsNCTT+3PeuD8qQ/DaKkbKoodvYT
   Q==;
X-CSE-ConnectionGUID: kMTihS18Q8GMjlPDfFWSXQ==
X-CSE-MsgGUID: TvlXyZASSam9qYoKp6wZLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63079638"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="63079638"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:31:56 -0700
X-CSE-ConnectionGUID: c1dbvBsrTGOySjwG2k2gdA==
X-CSE-MsgGUID: XtFFeLKkSg+B0RN7LL3jSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149758202"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jun 2025 21:31:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRkSn-000JOa-1q;
	Wed, 18 Jun 2025 04:31:53 +0000
Date: Wed, 18 Jun 2025 12:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RESEND v2 1/1] dt-bindings: display: imx: convert fsl,dcu.txt
 to yaml format
Message-ID: <202506181142.clIjs1if-lkp@intel.com>
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
In-Reply-To: <20250616182439.1989840-1-Frank.Li@nxp.com>
References: <20250616182439.1989840-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Stefan Agner <stefan@agner.ch>
TO: Alison Wang <alison.wang@nxp.com>
TO: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: open list <linux-kernel@vger.kernel.org>
CC: imx@lists.linux.dev

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc2 next-20250617]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-display-imx-convert-fsl-dcu-txt-to-yaml-format/20250617-022639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250616182439.1989840-1-Frank.Li%40nxp.com
patch subject: [RESEND v2 1/1] dt-bindings: display: imx: convert fsl,dcu.txt to yaml format
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm-randconfig-052-20250617 (https://download.01.org/0day-ci/archive/20250618/202506181142.clIjs1if-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181142.clIjs1if-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506181142.clIjs1if-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000 (fsl,vf610-sai): Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: dcu@2ce0000 (fsl,ls1021a-dcu): 'display', 'display@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: display-timings: 'mode0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timing'
   	from schema $id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d10000 (fsl,etsec2): queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d10000 (fsl,etsec2): queue-group@2d14000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d10000 (fsl,etsec2): Unevaluated properties are not allowed ('queue-group@2d10000', 'queue-group@2d14000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d50000 (fsl,etsec2): queue-group@2d50000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

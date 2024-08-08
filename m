Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC2D18757F
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723103429; cv=none; b=WBT1HrF2rHB+bz7cMnziUM1TBWbNKtbXTQHncerKlRU4CYpiBVqnozgrk3rUB1AikQ5R3krb1KX0wo09JKVqNqla1g6kOjs9I+O6x5vDFFFC6+CGdEr9piYHFxKZgEtZHxwK/4PoWCeTi2erZrRSvEmwFPJAan88cZ6yGlniaaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723103429; c=relaxed/simple;
	bh=ii0A3u4rooSZ3q1Fc6DXOKKJxlmfz/9QD2FPtzbdA9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mi5qn2zhK+pQWUzfdWahO+QEQatFtY5vtEqSAZLVckEYtIRihzG+dS2sQ+AHOZbtHZQ6qhVWbVS6xgvaG7UGel5Sfr5qqPL2lfNSL2BfFPb5qnvoHwRA7pm5NYN8lmTNV9jHyDOYFFdYymKjXnob31ty+4pJYLAh3HT6DEoYA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvmpNI0T; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvmpNI0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723103427; x=1754639427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ii0A3u4rooSZ3q1Fc6DXOKKJxlmfz/9QD2FPtzbdA9o=;
  b=kvmpNI0TJfo5psj4BbsQTAiscMDi9IQtL/J18aHqkJ4Mz9Tg/DzRMpwn
   YoImJhw9KOMghJ+MbeOdg1OVMF6rE+PMYRFz8l0yjrIBMoBxJvH3BYbRd
   wQErCWsBhUC/+SKTCw8WbBP0GE2UCNTG2W6hD9r2b4c1Fq3h+vpv1lOk+
   HldFawt2NoIX/7KNLeB0OQHjo12ZPn3JN1Mi//9c5Z+IFTQSb/NmpR/NK
   zwoG3q1h/BEUJD94cLHTjcmIyyAr60QXPnOaRI43s2wj83nzVo768pZxB
   CmX7jp5Q59UIwXxP1tfU4neZOB+3YhE2DRDPPtJ7MdK4FJ1Q+tZr8fjbN
   g==;
X-CSE-ConnectionGUID: weblhbFDTguN5z+C5wzd2A==
X-CSE-MsgGUID: zcdCKT1JTyuFyc+Y9bufTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32618826"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="32618826"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 00:50:26 -0700
X-CSE-ConnectionGUID: 6r+q+DRJTmyEI9luIsa15Q==
X-CSE-MsgGUID: 7WGtrsJPQkWFGsojRcLuzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="57059520"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Aug 2024 00:50:25 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbxug-00061g-1O;
	Thu, 08 Aug 2024 07:50:22 +0000
Date: Thu, 8 Aug 2024 15:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/4] dt-bindings: display: panel-lvds: Add compatible for
 Jenson BL-JT60050-01A
Message-ID: <202408081523.UFf8i2Qo-lkp@intel.com>
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
In-Reply-To: <20240806133352.440922-3-frieder@fris.de>
References: <20240806133352.440922-3-frieder@fris.de>
TO: Frieder Schrempf <frieder@fris.de>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: David Airlie <airlied@gmail.com>
TO: devicetree@vger.kernel.org
TO: dri-devel@lists.freedesktop.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: linux-kernel@vger.kernel.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Frieder Schrempf <frieder.schrempf@kontron.de>
CC: Heiko Stuebner <heiko.stuebner@cherry.de>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>
CC: "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>

Hi Frieder,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next drm-tip/drm-tip linus/master v6.11-rc2 next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frieder-Schrempf/dt-bindings-vendor-prefixes-Add-Jenson-Display/20240806-220206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240806133352.440922-3-frieder%40fris.de
patch subject: [PATCH 2/4] dt-bindings: display: panel-lvds: Add compatible for Jenson BL-JT60050-01A
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240808/202408081523.UFf8i2Qo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081523.UFf8i2Qo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408081523.UFf8i2Qo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

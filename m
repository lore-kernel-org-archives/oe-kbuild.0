Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32076179A7
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 17:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731258327; cv=none; b=VwTxM8gNMBQsdWMOQVbWIsXwDXrmSCC/2SK3Jxs7Hple9xfF51GYvfPOb3+w3e//lr+66tiufHLy0I0TBdZCUBaqKKh07/eLPbRwsB9hqdHmPd2BWClAwRcp3Bdn5hWmh4GAVsM0chPrOAf9SursG0/sdBDG4lIRnU5JOs5Aazs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731258327; c=relaxed/simple;
	bh=6s670t5HR/FauZnFSyq6ZXDHHBcUgsyH3THBcKhcLHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+iyU6GifUeOAmJ13WWcg76BwHIe3m+qyyg1WcakqBby3UsNlZBykZ98hPgu3eREEAQhznXLMlQyG8FetREbE6ZPQuQcCS6UFxjruDP8s1omNnNCRiWCr9F8bfZCdAaUAkqZ2iY8a3OzIdtkdFo/cLRLv3vPV25dbFxPc2swCGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgJw8Bgt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgJw8Bgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731258325; x=1762794325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6s670t5HR/FauZnFSyq6ZXDHHBcUgsyH3THBcKhcLHo=;
  b=VgJw8BgtY+g8W77yIzh70w6ym7lfoLXQ3aN96lJUtGua8555AKHgmTai
   vREVJ1Wqr10bHenm9uyMC9qku0Fl0PIxC4wswOTrj96gWAR8liuKqEs3b
   UdbXEV/v8FurK5aNI17jQtlhBss7H6oyC3TXLqlLrjcMhAilHd/tLsdU4
   FnIVETD+ptAWTrQ1mX91fVxxkakgGqOYltYwPyzWdd+QznGN8NsSc78Oz
   hh0JK0Na2fL3LgrHtWdM+vVVlBpBCfzqdy/hn2Kzbk0qLcpbwOpCUHQOt
   6zULb+/BiVpkzhK9Nr7QkS6JnZXFJpyO14y11ma8v1UvsE1G81BJOBmqm
   A==;
X-CSE-ConnectionGUID: jO0amBRtQN+c2x6eWXvy/w==
X-CSE-MsgGUID: Rgzb6w4NR7y3iMXrhsdEiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="42473407"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="42473407"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 09:05:24 -0800
X-CSE-ConnectionGUID: FDIJZGcXRX6lK/lkZYH2xw==
X-CSE-MsgGUID: A3IJX+miQeWa054dRaeKFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="91223581"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Nov 2024 09:05:23 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tABNI-0000GX-37;
	Sun, 10 Nov 2024 17:05:20 +0000
Date: Mon, 11 Nov 2024 01:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 04/10] dt-bindings: display: panel-lvds: Add
 compatible for Samsung LTN070NL01 Panel
Message-ID: <202411110051.nX3YNd5p-lkp@intel.com>
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
In-Reply-To: <20241108200440.7562-5-bavishimithil@gmail.com>
References: <20241108200440.7562-5-bavishimithil@gmail.com>
TO: Mithil Bavishi <bavishimithil@gmail.com>
TO: Aaro Koskinen <aaro.koskinen@iki.fi>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Roger Quadros <rogerq@kernel.org>
TO: Tony Lindgren <tony@atomide.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Jessica Zhang <quic_jesszhan@quicinc.com>
TO: Mithil Bavishi <bavishimithil@gmail.com>
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
TO: Thierry Reding <thierry.reding@gmail.com>
CC: linux-omap@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-hardening@vger.kernel.org

Hi Mithil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on tmlind-omap/for-next linus/master v6.12-rc6]
[cannot apply to next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mithil-Bavishi/ARM-dts-twl6032-Add-DTS-file-for-TWL6032-PMIC/20241109-040817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241108200440.7562-5-bavishimithil%40gmail.com
patch subject: [PATCH v3 04/10] dt-bindings: display: panel-lvds: Add compatible for Samsung LTN070NL01 Panel
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241110 (https://download.01.org/0day-ci/archive/20241111/202411110051.nX3YNd5p-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411110051.nX3YNd5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411110051.nX3YNd5p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'samsung,ltn070nl01', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'samsung,ltn070nl01', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

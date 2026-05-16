Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2335A933
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 19:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958815; cv=none; b=Up3GQuHhuUQQ/E3jczUzDWvH0pgsdevj9bgcXfcORxscSs3iuG0qcVxVudAdVE+liZcIeXMP5djS7OBrKDUt9tBSfamkRs05QLfSS/b9f28sol6D7jApAqp1qqKccVd9QC2z2Qoa5pojuluv5Y4MF3y5e/ytSQEOU07pFpejHdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958815; c=relaxed/simple;
	bh=wOi9LFTfKTGWkLu0GWecKuynyyWhWConIhFf/z3Crcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTt2UW1Fgy2Y7wEPRgEEx56jYPXB7QNRt/iCPzSzv08C7dgPyqrp8zmdegoZziFgJ+VPr3U3Cq3/Pbq75OngVx4g5o3U8UE5xrlpRrQI6J3jQuTqoWpNpeb9WZtfTjw9v6YhTIQbJvzZcjliVIH0vnKEnr7J7UUDdaGM9ob1TZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJe2rYOL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJe2rYOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778958814; x=1810494814;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wOi9LFTfKTGWkLu0GWecKuynyyWhWConIhFf/z3Crcg=;
  b=VJe2rYOL814bxPOEDFuEAje8zv6s/Pqw2/V4/v3Zu5PZ3MhyVOjcFwFX
   AvZVNsPjfSSmTJcBrct56VceTWYH9fviT88bhlpoex7hItxKHopvsqZ+Y
   2iXW3yfcoR73XFd2cF4vvBXuz7RzGmbtrK+CS0WZHpJ3bbCKMlPtL6uXG
   PkqlusxSG7Q9uHQo1xNEFhfCvPXhaWaOhoJ6A7ZYUXrQpPU6YJ6EvH+ny
   82TrIZbshyWM1AX3r26weDPRB37xAFCuwdIXf/xpv7qe5PErmortlqak8
   O7P+EFAqSlpbAr2xjt4rh7jGGX+tQ/J+uTXcyM7F24Fc+QlBB2Hr6tI9d
   g==;
X-CSE-ConnectionGUID: X/VC1CWXRCC03rgJZysK7A==
X-CSE-MsgGUID: U0Qup3saSKuInq8Q+4U82w==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90454402"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90454402"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 12:13:33 -0700
X-CSE-ConnectionGUID: b0RB+IIqQq6Ml8Qm5DDnzw==
X-CSE-MsgGUID: aXtfAIJIQuWY/FRUenXCMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="243003959"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 May 2026 12:13:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOKS1-000000009Mz-1LcX;
	Sat, 16 May 2026 19:13:29 +0000
Date: Sat, 16 May 2026 21:13:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: Fix phandle-array constraints, again
Message-ID: <202605162124.kke51ExO-lkp@intel.com>
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
In-Reply-To: <20260507201749.2605365-1-robh@kernel.org>
References: <20260507201749.2605365-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Maxime Ripard <mripard@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Ulf Hansson <ulfh@kernel.org>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Johannes Berg <johannes@sipsolutions.net>
TO: Jeff Johnson <jjohnson@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
TO: Mark Brown <broonie@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-i2c@vger.kernel.org
CC: linux-mmc@vger.kernel.org
CC: linux-wireless@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on robh/for-next wireless-next/main wireless/main next-20260508]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-Fix-phandle-array-constraints-again/20260513-145940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20260507201749.2605365-1-robh%40kernel.org
patch subject: [PATCH v2] dt-bindings: Fix phandle-array constraints, again
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2054-20260513 (https://download.01.org/0day-ci/archive/20260516/202605162124.kke51ExO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605162124.kke51ExO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605162124.kke51ExO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [99, 100] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent: [[99, 100]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
   arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux4 (i2c-demux-pinctrl): i2c-parent:0: [115, 116] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux4 (i2c-demux-pinctrl): i2c-parent: [[115, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
--
   arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [83, 84] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent: [[83, 84]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
   arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: i2c-mux2 (i2c-demux-pinctrl): i2c-parent:0: [85, 86] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: i2c-mux2 (i2c-demux-pinctrl): i2c-parent: [[85, 86]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
   arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: i2c-mux3 (i2c-demux-pinctrl): i2c-parent:0: [98, 99] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: i2c-mux3 (i2c-demux-pinctrl): i2c-parent: [[98, 99]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
--
   arch/arm/boot/dts/renesas/r8a7791-porter.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [63, 64] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7791-porter.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent: [[63, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
--
   arch/arm/boot/dts/renesas/r8a7793-gose.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [74, 75] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7793-gose.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent: [[74, 75]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
   arch/arm/boot/dts/renesas/r8a7793-gose.dtb: i2c-mux2 (i2c-demux-pinctrl): i2c-parent:0: [86, 87] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7793-gose.dtb: i2c-mux2 (i2c-demux-pinctrl): i2c-parent: [[86, 87]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
--
   arch/arm/boot/dts/renesas/r8a7794-alt.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [56, 57] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7794-alt.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent: [[56, 57]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
   arch/arm/boot/dts/renesas/r8a7794-alt.dtb: i2c-mux2 (i2c-demux-pinctrl): i2c-parent:0: [59, 60] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7794-alt.dtb: i2c-mux2 (i2c-demux-pinctrl): i2c-parent: [[59, 60]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
--
   arch/arm/boot/dts/renesas/r8a7794-silk.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [61, 62] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
>> arch/arm/boot/dts/renesas/r8a7794-silk.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent: [[61, 62]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

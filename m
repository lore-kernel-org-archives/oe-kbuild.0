Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF55417CA04
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Aug 2024 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723189366; cv=none; b=fpTPXHlBuI8Bit1PMPOMSwGvIGgKwQDoSkpZnSOUC14lVP/SezLix18m76tHt6fZ5qKVISJf1zy3a8TAGfWKsgLNP1c9sy0P+VuIFylGa2/c/8NhPJoD4UAHnxZ853PrzGuDmUBD1O0inyqsNx/M/X/a+coi9+Y1TP7XMcRQFCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723189366; c=relaxed/simple;
	bh=JSSfDTS0MUw5LKiQPjqrPmDHAIapXs7822gYdpmDML0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hFa/4BvVrAtbInjSqTuFB2+eW4o3zDnEn1kNXoSJ1NT4PIPeTl8TvNbJYvrg0SafUE596COK6g0lcPzxzb5EDmxlmIm13dPi7XK9qT+MQwEWo6V2mu/ni5hAbXNhynzKSf7eEmKBuIZZ7O+zS1ap4eV+unnjyyCK2DTnGNn/yqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qcza9L4T; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qcza9L4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723189364; x=1754725364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JSSfDTS0MUw5LKiQPjqrPmDHAIapXs7822gYdpmDML0=;
  b=Qcza9L4T07Az9P0M80xk6gJN4w7v63XYdS+3WqONPxFo4mOMZ5zRh0TO
   IdIPlquziDQ1euokjcCTsSQ2m4Fz3MnwlhkXQQG2FfByRTrOIrPAs8Ner
   Y2r991WclCSnD1UnDtpYl0l24SE9W66rr7SD+14AR6a7STq7ydaYvq3oc
   lUiVF+nu9+ioWeWVXqF8FGEnLJBKRU3LibrshDTwRgE+xhlQeTkww4W9Z
   3z4bVhY25ESyOidIPHLTkB27EJbGLx5Yj6u/j+zQE9aQkf1OQ+eSmp+5J
   ivFFKDKSSDcD4bQvbedBZsf1YIXpFHgo9tnxfJ+1P59LqXQgrXrTxUgXU
   A==;
X-CSE-ConnectionGUID: wNee6+XnTieCvmiCq4BZng==
X-CSE-MsgGUID: H/2PjXc6QCSnIBmQWSC89A==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21011147"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="21011147"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 00:42:43 -0700
X-CSE-ConnectionGUID: fQ2Fg8Q1RmaxUTTw/XSJ0g==
X-CSE-MsgGUID: bLw+QwcMT7O/cV30jj+/2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="62129161"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 09 Aug 2024 00:42:42 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scKGm-0007KP-0d;
	Fri, 09 Aug 2024 07:42:40 +0000
Date: Fri, 9 Aug 2024 15:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.1.y 14/91]
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: phy@fe8c0000: reg: [[0,
 4270587904, 0, 131072]] is too short
Message-ID: <202408091536.gTlKqcM9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2a5f985c90ffd8f4e2de3a2fd76f00c3e322aa6f
commit: af52052e79e286b72d81618e6bc9ea37cb2ec2fb [14/91] arm64: dts: rockchip: Add Hardkernel ODROID-M1 board
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408091536.gTlKqcM9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091536.gTlKqcM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408091536.gTlKqcM9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb2phy@fe8a0000: otg-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-inno-usb2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: phy@fe8c0000: reg: [[0, 4270587904, 0, 131072]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

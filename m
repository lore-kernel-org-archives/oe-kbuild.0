Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0814930C154
	for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 19:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779046189; cv=none; b=sEJf/b/xomSr4Ib5dgvOyOLZa0NyPzwOqz4y0vsohW7pIp+94JYOcGWQwHuVD1TREerriFbkA9oPRW4EZGxfX3U8feCq3ZYU9aYrKAH8bQn44/lZ996xCvugR5d7ReaJt173k5DQ/SNY+kWRp6G9NQDy4R+M3vbsOhee+S8I+XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779046189; c=relaxed/simple;
	bh=CfYpA7nCk6PPSaM980qN4f9+YJMbTmkPmHnQI2hJdlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZ/dRvwsLIOKcwNc8i9Aiwnxf/DlwfllewMDyzbK4J9JkIwZ/b6Md0XeUdgrTkSH3sc6y0/jXmxadqYCs6xMD1DS3H/fkYXRAuXaM2edOaBZy+2PfjrUuX9hBXwn288pAirN21arNvYhoXAwK2oJfpMwUE9f8qaP/vpKvErC3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzY9mdTa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzY9mdTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779046186; x=1810582186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CfYpA7nCk6PPSaM980qN4f9+YJMbTmkPmHnQI2hJdlc=;
  b=YzY9mdTa3xNkvzxzfb1kGnnazaRiea4eVZG+Fosi0ermFyTmHxtpv3gl
   u8l5pmuQnho4PpQgpOoLBa7CoooiuW7mtyM9YY626pugDClz+eQZ66xmM
   q0Szd2fmHoDF1j29ypz9IJnDEEeSJphV0hx6kiZbcjgupUNl8gnMQJ+pX
   1HLfeULv52UysqXmxRj0OWtpvDvLl2Vd8N4QCtyfPT5oiJqhObyu5NZ6J
   k9rWHBg6OzXHPdo2/z6kUnjPSZAnAu7YZo4mE8X2cxZl8gKmo63cTtwqO
   bY7qaQ7GeiCXK26k/rUQWX+YTpgQk7/S7jcn4MOBjgS1pcPShf+70ndZ9
   g==;
X-CSE-ConnectionGUID: uaywkEx2QKuHOLsankmfxA==
X-CSE-MsgGUID: vOX+GctrQjWyfsYzg0ok7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83780071"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="83780071"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 12:29:45 -0700
X-CSE-ConnectionGUID: 1/CZD9C0S++Q/naICoTN7g==
X-CSE-MsgGUID: cauVBY3LT6mKYF/M+T/8jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="239466358"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 May 2026 12:29:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOhBG-000000009aL-0V4G;
	Sun, 17 May 2026 19:29:42 +0000
Date: Sun, 17 May 2026 21:29:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: usb: ci-hdrc-usb2: allow up to 3 clocks
 for qcom,ci-hdrc
Message-ID: <202605172111.jOSrJK45-lkp@intel.com>
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
In-Reply-To: <20260516-qcom-ci-hdrc-clock-fix-v2-1-aaec8d33d0aa@smankusors.com>
References: <20260516-qcom-ci-hdrc-clock-fix-v2-1-aaec8d33d0aa@smankusors.com>
TO: Antony Kurniawan Soemardi <linux@smankusors.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Xu Yang <xu.yang_2@nxp.com>
TO: Peng Fan <peng.fan@nxp.com>
CC: MINETTE Alexandre <contact@alex-min.fr>
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: phone-devel@vger.kernel.org
CC: Antony Kurniawan Soemardi <linux@smankusors.com>

Hi Antony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 70390501d1944d4e5b8f7352be180fceb3a44132]

url:    https://github.com/intel-lab-lkp/linux/commits/Antony-Kurniawan-Soemardi/dt-bindings-usb-ci-hdrc-usb2-allow-up-to-3-clocks-for-qcom-ci-hdrc/20260516-185508
base:   70390501d1944d4e5b8f7352be180fceb3a44132
patch link:    https://lore.kernel.org/r/20260516-qcom-ci-hdrc-clock-fix-v2-1-aaec8d33d0aa%40smankusors.com
patch subject: [PATCH v2] dt-bindings: usb: ci-hdrc-usb2: allow up to 3 clocks for qcom,ci-hdrc
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm-randconfig-2051-20260517 (https://download.01.org/0day-ci/archive/20260517/202605172111.jOSrJK45-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605172111.jOSrJK45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605172111.jOSrJK45-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1130.21-1178.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1196.21-1250.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12520000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12520000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12530000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: usb@12530000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1130.21-1178.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1196.21-1250.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12520000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12520000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12530000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: usb@12530000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1130.21-1178.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1196.21-1250.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12520000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12520000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12530000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: usb@12530000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1196.21-1250.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12520000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12520000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12530000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: usb@12530000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1130.21-1178.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1196.21-1250.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12520000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12520000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12530000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: usb@12530000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
>> arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
>> arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

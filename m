Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569267;
	b=Pofh5oT0tJmWNZCPSvAMxajrstnfwa0Uz/qD3s6JR9XY1O0lsd6/NAYtqUKslaAncrp6
	 B7zLiQorSOLkGvCUdVDtrRUeLUi1g28gAmtuVAm1z6W08YpNehQP/1OAX1tdrie+tu+W8
	 cMbLrfN4GOY8OD535wOaVu5vzvYhgtFyd2SaNZuOU5232KNwanWoXp9pvAzwUwvIMOzR5
	 aVYVODeecz8CyWYj217utoRCjgYU3vfPpIrScVo7AnnsdirUSiAf/ErKn2DKy5p8Ibp6d
	 w6eR8Eok/vpsPMAZ6k8wQqv1Dk43DAWIM6Y7RzMcwcBRSrHnAUNgmeEof6C7/r3axWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569267;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kZ8bavZw+XXaGcHcw7Mgw/Eaa3Wfc5F2cKh80fFXZLk=;
	b=VT+jDGYgpiRmsg83WLkLCk9FSWQz9QaGYk2IecQ0svi9i7HaIdE3AsNEzkYFLass2k+w
	 cts3M8c+o14pKNjA07qHZY5EU5+czy8QR9NzsTzl7BZS+sk42amyv0tuAJLLP33C4M8Bs
	 Ms3qA2dNjvQpjzwgR6ZXxPj+Vs/xX2cPSfJz7LPOmGJ0MQ51HPwJIkuQiz27wjo8qrG9J
	 AFtz8tSOGlLV+zZRFuW58Gt9i6ZdhNUChJkDqer1+G3pIyDVaJF8Kg5xlLUCsixL4v88M
	 uS8ktthuXp5DOdgq9wzAYrfD09AkIi/jD7evE5T9zYYHFQEl/zfOfO1q2F/be2ICS8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TlUw4PXn;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE887606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 11:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE887606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TlUw4PXn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569267; x=1826105267;
  h=date:from:to:cc:subject:message-id;
  bh=VhLLR97fYQWhvO31WhzWosTLxsU68Rl720338SPsHfg=;
  b=TlUw4PXn6SuAit0KiIvr/LfYPQQOs4Z/HHpLEvBeBw2CPWAovvjeiYOA
   Vcuh4IBTE3gOh9KguX0vXuJtBfRqh65QQlRCx6cGA9n4RVQ8r4krIha0E
   /wHGe4+mOscE9FKkrELR8gRN5fqrGR1cGGje00GR7BStdtiu9iY2ZBuK4
   hSbzmJ99Kb+qGwb0qop9iQIb8XIoaXypzwhI6TPzM72n+WiH9VZRRNI1M
   BY7fofCjZ9Y7nY+4F+IluI0VihzteP/Na3MF4mLfwizonHkEDyhoxveTK
   XFyXUpqz+sBALGnpbO+6liibFDXsIkCmhSXTWoZd/yatQg5PvSPTzPkRn
   Q==;
X-CSE-ConnectionGUID: Wp64HL9GTMm3JLtBGNEblA==
X-CSE-MsgGUID: MmhS4HqZSACMkqOHHzeCdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3364082"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3364082"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:27:46 -0800
X-CSE-ConnectionGUID: lOnaTMDjRHyObCz7GIOkCg==
X-CSE-MsgGUID: kLhl1ltWTMa232t0Hqy2+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9225632"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2026 03:27:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRpRX-000000001Dj-2ghx;
	Fri, 13 Nov 2026 11:27:43 +0000
Date: Fri, 13 Nov 2026 12:27:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/display-msm-of-graph 8/8]
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: dsi@994000
 (qcom,msm8996-dsi-ctrl): ports:port@1:endpoint: 'remote-endpoint' is a
 required property
Message-ID: <202611131227.fA7ZfXmW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://github.com/krzk/linux b4/display-msm-of-graph
head:   5291f5efa911eab557cfedd3e2ea7ee39430a078
commit: 3e13b445352f505d50e684385725c17773f3a234 [8/8] dt-bindings: display/msm: Require DSI graph endpoint
:::::: branch date: 3 hours ago
:::::: commit date: 20 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261113/202611131227.fA7ZfXmW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131227.fA7ZfXmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611131227.fA7ZfXmW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: dsi@994000 (qcom,msm8996-dsi-ctrl): ports:port@1:endpoint: 'remote-endpoint' is a required property
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@7411000 (qcom,msm8996-qusb2-phy): 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

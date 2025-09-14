Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30FF199EAD
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Sep 2025 19:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757877751; cv=none; b=MoXS3blhSnXoEBGBbiJYfBf44UhAFTtV3gRajxlWfqCa++bIQvOPZ+mh9KFjMSz4Vh+0wEDIv5AjD8O1JCI7RUh7G4jen+8rsA9okpsAhoWLsubI0TTaOFJxBH/CHRgKaNIwwRvgVMKr+e2REN7z9hIwLABq+4DsszAokjIeVHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757877751; c=relaxed/simple;
	bh=t3ZwXTRnyL5Sq04xiR9OtmP6DsTxO/jNTD9HefS4x+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NoJVqGTu2DppgrUAfyOEVmHArsv9Kf85UJAVuWzhSj/PeZV+xC9lYrQRBtFnYOdBHCqGCecYwMu02VDJ3wsG+E2ECjRgjUdzrZVkHjOjWnhRCk0parWb/CuoTt9r6Hy5+iIje1TSea1o8g01z1X7FmUTLj+wUqX35dWHWEHSu4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHyCDY56; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHyCDY56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757877749; x=1789413749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t3ZwXTRnyL5Sq04xiR9OtmP6DsTxO/jNTD9HefS4x+A=;
  b=NHyCDY56wftgKwQA1+b6z0ZmkJkpetZgD9FfpPOZuV/go3xMaIRlLNQP
   OF0u+PolnmzDGNHcfjNvy9pNDfiQ7unqHZq+D+nEZg+8E1svEla7vixMC
   +nJ56Va31hUWGmMtSjX81WwmFvph/2nm8pYZ6YFDq7pv+4S2mSrSxxHvV
   vO4typPQaHHn3lskY1NLI0K2t4xONiufvyvzTkQSdaF/YCkTgo9MPx//h
   8lyT5dBlbBW9D86Ogpbc4pIWtCtTSyw5VPbWSzN6I4nMF2aM01K81+0bA
   ARlaRC7pNpfjrOf6wNTASEPwy/slVw9oe5eJZowclGjA75QK3yqLUSAYL
   A==;
X-CSE-ConnectionGUID: z+Uxcq44RCSuGbKhwY+C6w==
X-CSE-MsgGUID: fJow48olR9uyJLWS2ZeYPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60007232"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="60007232"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 12:22:28 -0700
X-CSE-ConnectionGUID: suIhJlYyR6ywDEhj2xyzdg==
X-CSE-MsgGUID: 2WetB8f5RvqltiYcNrtE7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="173988459"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Sep 2025 12:22:26 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxsIq-0002eG-0F;
	Sun, 14 Sep 2025 19:22:24 +0000
Date: Mon, 15 Sep 2025 03:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 3/3] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Message-ID: <202509150237.lzXpwj0b-lkp@intel.com>
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
In-Reply-To: <20250913-nt35596s-v6-3-b5deb05e04af@ixit.cz>
References: <20250913-nt35596s-v6-3-b5deb05e04af@ixit.cz>
TO: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Molly Sophia <mollysophia379@gmail.com>
CC: Arnaud Ferraris <arnaud.ferraris@collabora.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/drm-panel-nt36672a-Make-some-command-sequences-optional/20250914-032026
base:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
patch link:    https://lore.kernel.org/r/20250913-nt35596s-v6-3-b5deb05e04af%40ixit.cz
patch subject: [PATCH v6 3/3] dt-bindings: display: panel: Add Novatek NT35596S panel bindings
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-051-20250914 (https://download.01.org/0day-ci/archive/20250915/202509150237.lzXpwj0b-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509150237.lzXpwj0b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509150237.lzXpwj0b-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts:471.25-492.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4789.27-4842.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[208, 0], [208, 28], [208, 32], [208, 34], [208, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: panel@0 (jdi,fhd-nt35596s): compatible: 'oneOf' conditional failed, one must be fixed:
   	['jdi,fhd-nt35596s'] is too short
   	'jdi,fhd-nt35596s' is not one of ['tianma,fhd-video']
   	from schema $id: http://devicetree.org/schemas/display/panel/novatek,nt36672a.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: panel@0 (jdi,fhd-nt35596s): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/novatek,nt36672a.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

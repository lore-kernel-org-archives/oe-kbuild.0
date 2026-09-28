Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8E11A6836
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 03:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790566000; cv=none; b=t1NqiYm6vCRPL7A2C6BWDBU+W82x2A+r/aibJZ7HdKWWQPqb5SmvBiCbXnRTOsJFuJHP9stlAIA39pfeo7LJneL8WKwSz1KTsnpS4diNOeF//yoJD55GV34oaEcFGH0YAgCvDiE2APvjMsGMJNPiuQTZfhPF0WUerKTjL1OX+0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790566000; c=relaxed/simple;
	bh=K6u6bMFeTCBiKphirxOOc3APB3vcchEdJwy4kgrVb+g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Meuwud/oxOogEabFVPCAfKLeOZHl1iaD10GaY7HKkw1eVNc8GO8EpsbgpW991D8wRL9xcrawrBaH/lt7G3+hRD3B7bh25ecmiqvSkwGg0XogIKFIB2EoeR614SS2AcNMw/GS1zeq/hVpocRMKRtIpAsQXO9AqXP6AaQM4yrKArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxHl1VWp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxHl1VWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790565999; x=1822101999;
  h=date:from:to:cc:subject:message-id;
  bh=K6u6bMFeTCBiKphirxOOc3APB3vcchEdJwy4kgrVb+g=;
  b=CxHl1VWpRXeyu86+WVVRvrrw1kOYsbQq17+HwIbqNV1BKye8bgmCap5q
   uW5od2CTjM3lMkF32gTwMvuSd03SN4OdBe6AjAaBToxh7NTV4N/+YfHHs
   WlUP2/4s7J1ItzmHRZb4vKfEdxG4sNWRf+3xUU+m6exLcT29/NsN2t5HS
   tX9nPHN3DC1topXbdf2/GioHRCTwiYeB85bm4ly5SzOIRKbewuR47assJ
   AyvP1uj3BiC9CoC4Q0+OuKjPpamuRMvJvoxujeJsiLWsDbsAiT5q/XL76
   jLCrlpxaz++bKa/blcbtzscziHtYMnpU7QGzoZH2o24ZU1lBRzUypoJGb
   g==;
X-CSE-ConnectionGUID: JEHmXc29T9mUvwc6EjCaPA==
X-CSE-MsgGUID: CCUXlFoUTiuuB/To48H1Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101916715"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="101916715"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 20:26:38 -0700
X-CSE-ConnectionGUID: t8doaeilTY6qSBoOOpa7zw==
X-CSE-MsgGUID: fP7E/gwCTa2sLKy3PtQr1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="283002960"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2026 20:26:37 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB20h-000000000qh-1iqy;
	Mon, 28 Sep 2026 03:26:35 +0000
Date: Mon, 28 Sep 2026 05:25:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:clk-for-7.4 40/142]
 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dtb:
 clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required
 property
Message-ID: <202609280546.jQjO29H3-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-7.4
head:   3b651d946ebb756f922bed8a213919af17f58f43
commit: 55388f587b3301dffdb30074d00f069d80d29341 [40/142] dt-bindings: clock: qcom: gcc-sdm845: Require CX power domain
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2404-20260927 (https://download.01.org/0day-ci/archive/20260928/202609280546.jQjO29H3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280546.jQjO29H3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609280546.jQjO29H3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi:45.37-52.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9c000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:2011.27-2066.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dtb: clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml
--
   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi:45.37-52.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9c000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:2011.27-2066.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

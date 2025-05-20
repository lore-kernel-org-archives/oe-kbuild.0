Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AB288A2
	for <oe-kbuild@lists.linux.dev>; Tue, 20 May 2025 15:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755785; cv=none; b=IbghjSpjxcgwXIMGr+oY7ul4m01Jq/O4to/0i4/E0zRFRJJ9k3lUgWn5FREpPXvAO4GftoaNXzvaoVkbrbkS92BtH+k5QRUNyirc2u5UAkTEifHOcw//LUngsP5gGQAp8L/8NEB+6rnktB0jfZuucNCJNoGhSXS/yT0VrbXwD7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755785; c=relaxed/simple;
	bh=FtFUwzJ7Knxq7FbG1maPFzNTL5jzm3+GlJ52wp9XoKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m36EuybSz51uAdhl7croMxhCi+KsnYarDXWjI9Pi83YXWZpqX7lzaRfTFq8t23lPRGKu/QXhV5wOll0Crypj1hgqdGTOeypryBlIx1K+T7Kn+4qb5eFkG4XUKIsUldkTxQyKa1S7N+2Zicca9gQHXzjaK2mGOJKBWLssceZoGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRKSbiY7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRKSbiY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747755783; x=1779291783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FtFUwzJ7Knxq7FbG1maPFzNTL5jzm3+GlJ52wp9XoKc=;
  b=gRKSbiY777HqS2iUGQVrvN+b2OtsP7/ysbWdY4w3EjQJqUedkLpoq2Xm
   rbuIeGwCd1/ktEmwe82EXw4PVcYVpZa4NGcAQK2BrczQLBd9CXniNe3HZ
   +xroyezfbrv2ggXYbHjGTQyXTSd+zqbKGXOewnZelcMoX3kermf9M684n
   nGHJzr3BtFngcDTCGIn6YfiTp82BuZr+W10TvQv0dkqT10oBLD4opOdAh
   yU0kaBspHzaq+aMtNmOSvhdB7jlwPDnM/8bVekHNBiSnpVRc/wicl8nrx
   +2H+MbX6sc6HC1n+Dv7lbefkwBuirQ1pKtoWPI0UDeOyS0rEDEGAO1UHy
   Q==;
X-CSE-ConnectionGUID: stfzct0BT3uI8L9dwCow2w==
X-CSE-MsgGUID: UqU9aGyJSCauX1bBzFqILg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60736100"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60736100"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 08:43:02 -0700
X-CSE-ConnectionGUID: yNcxSWBNS2iCgHAZKfsKOg==
X-CSE-MsgGUID: 29xIuzADQE64zFVfLRgpUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140659945"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2025 08:43:00 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHP7J-0000zP-37;
	Tue, 20 May 2025 15:42:57 +0000
Date: Tue, 20 May 2025 23:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/sm8750-audio-part-3 14/21]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000:
 failed to match any schema with compatible: ['qcom,sm8750-mdss']
Message-ID: <202505202316.zwP3DGib-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/sm8750-audio-part-3
head:   adac035ce9cf16b4bf5bcad64478178ae722e65e
commit: 6d0f5a6bb470e24d5d29869f8e829f0583bf1aef [14/21] arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2054-20250520 (https://download.01.org/0day-ci/archive/20250520/202505202316.zwP3DGib-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505202316.zwP3DGib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505202316.zwP3DGib-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2714.27-2801.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2823.27-2886.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000: failed to match any schema with compatible: ['qcom,sm8750-mdss']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/display-controller@ae01000: failed to match any schema with compatible: ['qcom,sm8750-dpu']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clocks: [[129, 8], [129, 11], [129, 70], [129, 60], [129, 6], [35, 16], [142, 1], [142, 0], [129, 0], [129, 81], [129, 9], [129, 71]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/phy@ae95000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clocks: [[129, 12], [129, 15], [129, 72], [129, 62], [129, 6], [35, 16], [145, 1], [145, 0], [129, 2], [129, 81], [129, 13], [129, 73]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/phy@ae97000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: displayport-controller@af54000 (qcom,sm8750-dp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dp', 'qcom,sm8650-dp'] is too long
   	'qcom,sm8750-dp' is not one of ['qcom,sa8775p-dp', 'qcom,sc7180-dp', 'qcom,sc7280-dp', 'qcom,sc7280-edp', 'qcom,sc8180x-dp', 'qcom,sc8180x-edp', 'qcom,sc8280xp-dp', 'qcom,sc8280xp-edp', 'qcom,sdm845-dp', 'qcom,sm8350-dp', 'qcom,sm8650-dp']
   	'qcom,sm8750-dp' is not one of ['qcom,sm6350-dp', 'qcom,sm8150-dp', 'qcom,sm8250-dp', 'qcom,sm8450-dp', 'qcom,sm8550-dp']
   	'qcom,sm8350-dp' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@af54000: failed to match any schema with compatible: ['qcom,sm8750-dp', 'qcom,sm8650-dp']
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2714.27-2801.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2823.27-2886.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000: failed to match any schema with compatible: ['qcom,sm8750-mdss']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/display-controller@ae01000: failed to match any schema with compatible: ['qcom,sm8750-dpu']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clocks: [[123, 8], [123, 11], [123, 70], [123, 60], [123, 6], [35, 16], [136, 1], [136, 0], [123, 0], [123, 81], [123, 9], [123, 71]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/phy@ae95000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clocks: [[123, 12], [123, 15], [123, 72], [123, 62], [123, 6], [35, 16], [139, 1], [139, 0], [123, 2], [123, 81], [123, 13], [123, 73]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/phy@ae97000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: displayport-controller@af54000 (qcom,sm8750-dp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dp', 'qcom,sm8650-dp'] is too long
   	'qcom,sm8750-dp' is not one of ['qcom,sa8775p-dp', 'qcom,sc7180-dp', 'qcom,sc7280-dp', 'qcom,sc7280-edp', 'qcom,sc8180x-dp', 'qcom,sc8180x-edp', 'qcom,sc8280xp-dp', 'qcom,sc8280xp-edp', 'qcom,sdm845-dp', 'qcom,sm8350-dp', 'qcom,sm8650-dp']
   	'qcom,sm8750-dp' is not one of ['qcom,sm6350-dp', 'qcom,sm8150-dp', 'qcom,sm8250-dp', 'qcom,sm8450-dp', 'qcom,sm8550-dp']
   	'qcom,sm8350-dp' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@af54000: failed to match any schema with compatible: ['qcom,sm8750-dp', 'qcom,sm8650-dp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

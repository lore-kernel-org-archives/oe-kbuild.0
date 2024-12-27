Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60C21F8AD9
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 18:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735324342; cv=none; b=lX/IHvjT5vl32D2K7G6mI7seB0gWVzD941T8VYXaj/YzMCcdyZmmeae/npvDAf8RFbWNEsE7c8uMaaQrRrZF6rJG9DKFmQ9DAeijuFWa03eIIqx8zzuEZTFWfC0VQTtEl4wwQ4xFFKhQnJQDDqbl2PZ9xjSp2qedbAFkGD1609I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735324342; c=relaxed/simple;
	bh=h7tKw+NxW/TDHsekL7U4H179R3RROuEHnoElfmb4LNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEAVLpuqCJHkdVw0lEAdaSS1C6Ct6gr6XrSrAfPZF1hrXUgCBCCGMAYqp65HNrrrrEvhgWMkhIWHy2cHcZwt1/b/zaIvyPEzQk+3kz8e0jDfM68sb1FbeoXmu9RheslN1MYSgjb0xZy0qmbSVc/xmX+bSfO3BWek/6k9W8xDgRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+9CEhF7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+9CEhF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735324340; x=1766860340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h7tKw+NxW/TDHsekL7U4H179R3RROuEHnoElfmb4LNc=;
  b=W+9CEhF7dDO0I8qsZacwIkkBk6wSODnVfieiJiwWise8UuVbd1wqKJZV
   1rQKbNeoWjVqSPBZnPONV+WFmF+wobWtjDK15L3b2WZqsccXw9NIKD/bw
   qxYSZdHcvEfHfmprxNBMYKEnqcto6iLah9QiP+Lkg3CSSGnQxp+j+LRua
   2uti1NUxmpXFTekWHnoYy9Wd8ODaU0i2O8vnuRTVD4ok/RkilQHE5B/RL
   XAjR2qEEqKYMMc5Uj8Ge541HV93lbig+TeoxZeV9mmdLgHgbs0gnGUn1F
   iGyzmHGUpyptG1gqcYy+lWEztMu7YWrioZjj71pPWgo8SpTPvrf7omPpK
   A==;
X-CSE-ConnectionGUID: yswVWsOLR+iIMNVXI/sE0w==
X-CSE-MsgGUID: NdHMdPMzSlWRJifNANHBFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35863514"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35863514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 10:32:18 -0800
X-CSE-ConnectionGUID: C7CW+qVTT0+9Sj8WVE74FQ==
X-CSE-MsgGUID: ng/wTo3vQleeFW1wnOI73Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105222821"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2024 10:32:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRF8B-0003Rk-10;
	Fri, 27 Dec 2024 18:32:15 +0000
Date: Sat, 28 Dec 2024 02:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 96/123]
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: display-subsystem@ae00000:
 interconnects: [[177, 3, 0, 31, 1, 0]] is too short
Message-ID: <202412280218.wa9XZY8c-lkp@intel.com>
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
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: b8591df49cde459e3b84cdc0517d7bf92053d244 [96/123] arm64: dts: qcom: sm8550: correct MDSS interconnects
:::::: branch date: 14 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-052-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280218.wa9XZY8c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280218.wa9XZY8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412280218.wa9XZY8c-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3153.27-3208.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: display-subsystem@ae00000: interconnects: [[177, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3058.27-3132.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3153.27-3208.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: display-subsystem@ae00000: interconnects: [[199, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3153.27-3208.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: display-subsystem@ae00000: interconnects: [[183, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3153.27-3208.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: display-subsystem@ae00000: interconnects: [[190, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3058.27-3132.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3153.27-3208.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: display-subsystem@ae00000: interconnects: [[170, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3058.27-3132.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3153.27-3208.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: display-subsystem@ae00000: interconnects: [[174, 3, 0, 31, 1, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

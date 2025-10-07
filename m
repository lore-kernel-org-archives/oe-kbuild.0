Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0AD22A7E0
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Oct 2025 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759866761; cv=none; b=m76zbeolVRHMdCCliXTQMT3CYi0rx2PullqOPFsI+TFd4vtn8C1KMPcpTnKocQWhr7RlGvH2CMvMSzm/baEGflMqPqAc5Gw6SeRecKY3eTdgIP7D0E6mN1Oejdxq5PnOruuPOuLXqH7O1ekf+zBmbSeAon3DrzzXK+rX/SAt2kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759866761; c=relaxed/simple;
	bh=ix5Ccke7EZA7fI9kYOBANWrrrvU8VQuAcBmxOvx9dAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SU2YWnM9L93wBz4fWqPQ1coA4vJ0wrpKb8j4vC8oMA0j6I9/B6FOsi1x1BB250o5Ec9aHxxawt86SpEDTdcl3sDY00d3wsppNP2mKVYI54xNpp2IOtQhhEGyx/9f5GC0JLJd5mpA6dUcmkdtK8PA0AQO0ltcRY7qo9ZaSnfPd9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNYrWOAL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNYrWOAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759866760; x=1791402760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ix5Ccke7EZA7fI9kYOBANWrrrvU8VQuAcBmxOvx9dAY=;
  b=ZNYrWOALOr48aOf9nlb6hykmUNBlbEa7WdD1Ugfz1dsxC/PFXkxQCvsl
   NC4ciyuKG7Nh4wWz66x9tFubdW7PDWIGTIprYEdnBWGV5eYFL/Puizgy/
   I+zdG2TTupUOOup74pmLh6+n2KVyiMZOYf2Kp/ZbbRkwevKcrEoMP1uD1
   wSCniDrj8NqakjgB5PwPWojgOJaZXZHYW4T0LvAMKLPWmKEZxW9JNy8FB
   EfDjazFLvMNVFZLIRlvDeT/UKV2rRrE4Zk5jTffniTB0a9ZFQ3aBQPOos
   LunEccENzWcO8V9mOtwtzR4BIpF/R/9dk9is70pG1fgsobjjoTlUZdpOs
   g==;
X-CSE-ConnectionGUID: fcqD8PTiQyOT2g0UJL0DDw==
X-CSE-MsgGUID: pFoC5cRgTe2VAp9L9CHz2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73403412"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="73403412"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 12:52:39 -0700
X-CSE-ConnectionGUID: nh0FAcrwQ/2s30zKxwKHAw==
X-CSE-MsgGUID: e/WoBA/sQ2KswU9s0dv9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="184620280"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2025 12:52:38 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v6Djf-000000007x3-2uQt;
	Tue, 07 Oct 2025 19:52:35 +0000
Date: Tue, 7 Oct 2025 21:51:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/sm8750-audio-part-3 8/14]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: displayport-controller@af54000
 (qcom,sm8750-dp): clocks: [[137, 6], [137, 16], [137, 19], [137, 22], [137,
 23]] is too short
Message-ID: <202510072121.bX2uM6KG-lkp@intel.com>
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
head:   bd0d954998f6e91eb21faf9fe48ed212a914af6f
commit: 98b026e549b9ef4b13b45f644f9d258e24c28295 [8/14] arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-2053-20251007 (https://download.01.org/0day-ci/archive/20251007/202510072121.bX2uM6KG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251007/202510072121.bX2uM6KG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510072121.bX2uM6KG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2711.27-2798.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2820.27-2883.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dma-controller@1dc4000 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
   	'qcom,powered-remotely' is a required property
   	'num-channels' is a required property
   	'qcom,num-ees' is a required property
   	'clocks' is a required property
   	'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: displayport-controller@af54000 (qcom,sm8750-dp): clocks: [[137, 6], [137, 16], [137, 19], [137, 22], [137, 23]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2711.27-2798.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2820.27-2883.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dma-controller@1dc4000 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
   	'qcom,powered-remotely' is a required property
   	'num-channels' is a required property
   	'qcom,num-ees' is a required property
   	'clocks' is a required property
   	'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: displayport-controller@af54000 (qcom,sm8750-dp): clocks: [[129, 6], [129, 16], [129, 19], [129, 22], [129, 23]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB25192D8B
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jan 2025 05:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737696955; cv=none; b=sbDSL9Mai4ON0dFVgeo+IbXalkoIYWwzznpO634zFJR8OG9yMv7n3Vmee4vv4XDO021jKzIUaaiotc02SqIlrgxYeaPS9ivAtxVXqi3ytUp7o/M/wkLVlsv6Wgy/GZCF8CMW9p2AwdJANk3K9RMAD4kdJ2Gy6ovX4DeK7LCmSoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737696955; c=relaxed/simple;
	bh=qGidZ6u7jwEpqWd55Hdhke2seTBJsAe0zAKfbdvENFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7GX6utiEhTGvpS7WvSA8PNda87orntOxI7Ej3Xqm4TxVdpUOmjv4mf9j9jO6+04R2SwaS0nKIEG7sIUwRQo0Sz87NUAzjR9JqDcSRGdnD3o0TnRsmBKuMsauKZcfowhoVeDFJqBQ+caKljkwD8+KE9BNbKZP4a4IPdHrcF6368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6C2j6fi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6C2j6fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737696953; x=1769232953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qGidZ6u7jwEpqWd55Hdhke2seTBJsAe0zAKfbdvENFg=;
  b=Z6C2j6fizdd8PvqLzYQeK0i6ioogNvPbfLw3QYtP97++EYDVPYXOz1P4
   w170T/ase08dB3LihPdKGwQ9tr+dw92x+cY81oigR39VHGU/rqVekpPjZ
   8Yx3ypE5UTVgK+kvSnP3csTuIlztM8VX4BbnHQvjkNKOfNNlx1uxAkMRZ
   cylDnDj+DCchLdWjjMWrlo385rS6mBH89061PeYPPIHEZJsZGBjVQf9Yg
   482InuzsLJMD984gaHjlIdsOq7hM5RGAPfZhp2aorswd4UIFu/Lg6dbKx
   f6BlEY+jSTWJYnQi/MMnFZC0j7i//PRvckTrbFsUhOKzAMlVKru852fzz
   w==;
X-CSE-ConnectionGUID: z4GKBMq8RYyDgB1/D7njNg==
X-CSE-MsgGUID: EQR64oS5SauYO2nlP2doHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37428558"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="37428558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 21:35:52 -0800
X-CSE-ConnectionGUID: UNssSmebTZ6KB2uW07sYhw==
X-CSE-MsgGUID: 2e6CfXq6R2+E56tFZP1kxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107524565"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 21:35:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbCM9-000cDs-0u;
	Fri, 24 Jan 2025 05:35:49 +0000
Date: Fri, 24 Jan 2025 13:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 70/74]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: display-subsystem@ae00000:
 interconnects: [[135, 4, 7, 21, 1, 7]] is too short
Message-ID: <202501241329.MnZZzd2f-lkp@intel.com>
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

tree:   https://github.com/krzk/linux b4/sm8750-display-dts-and-panel
head:   4e443a546ffb5a1c936e44e053893ae12804fc13
commit: fbe30c4d7cec45b160138336252258be523894e7 [70/74] WIP: dts: dispcc
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250123 (https://download.01.org/0day-ci/archive/20250124/202501241329.MnZZzd2f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241329.MnZZzd2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501241329.MnZZzd2f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2821.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2926.27-2982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: display-subsystem@ae00000: interconnects: [[135, 4, 7, 21, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000: clocks: [[134, 12], [134, 15], [134, 72], [134, 62], [134, 6], [34, 16]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000: clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2821.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2926.27-2982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: display-subsystem@ae00000: interconnects: [[133, 4, 7, 21, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000: clocks: [[132, 12], [132, 15], [132, 72], [132, 62], [132, 6], [34, 16]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000: clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: remoteproc@32300000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/remoteproc@32300000: failed to match any schema with compatible: ['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

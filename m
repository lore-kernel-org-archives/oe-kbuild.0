Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E55270ED2
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 23:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758585189; cv=none; b=NTCNTOxFwMceNxem1TfM2RULGkSqpGSN/stnlVGdE0j2fNH3hysomlt9xq+pno6CZbxxjCGt06zSaPOoj5VmQ5bETq9YwGBrQpwp6O0yBiMyCtoE23741KivC+hOqTFCB2am24SRru4HXnAL+0Ly+sePl8vcy8vyiSBbVAGsFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758585189; c=relaxed/simple;
	bh=Ff+Cea8sik0kRgGdYHyIKMRkFLxOo2icocaL9GMrGgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZCypJX09Qt2VjjIXJcvpIR49lVs2KAMUME+gKK0zV+qx71Bu+At3VQWzc/tDhBiJBfWB5+iGPp5SaI1du2yW4bf9hY9Kc2xl6RWKgDG2xvvU+gVpC0Hqso4LtgiUbRgyWDCPKenfBeQukE+bUm2w9HjH9lVHfGQk6gX9Znj3pVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yn1gAqul; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yn1gAqul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758585180; x=1790121180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ff+Cea8sik0kRgGdYHyIKMRkFLxOo2icocaL9GMrGgg=;
  b=Yn1gAqulWI4pg6q1bKumhAXuEHNOMLp5bvhwqjxGu9Z/ZioXfYg6f4ZK
   v2a49uAu9RidD2hVs25mF+tsuj1LSPy/kxf2OwXAwrFXONPRAq7o9/HDa
   Yy3mf7BUmJodFiueLg9MDfiWSSMLtFzsYQq0pfEv0teIeUF0klaUEiR5k
   n1rzJaAAMHfWe9t8DeTSYUXqxlHiMyZloTVIigBCwjU61aDNOERqyFaWK
   fmP+NQ9CplIHwrL9Wgom8xqJoncnGKLYlriYxcJ0rTEIUvPZZV9Up9VPF
   SBo1BFzLU5kxUrhcSunyTZRi1YAd85rfA9Cs5BCqh4cVUayUGQboH8O3s
   w==;
X-CSE-ConnectionGUID: 7vyjBZtoReK6p1uGBgTBng==
X-CSE-MsgGUID: Ww/KRErTQgOGdEHtk3c+lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60914683"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="60914683"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 16:53:00 -0700
X-CSE-ConnectionGUID: HpeydndJTO+kQbhfNOCqyA==
X-CSE-MsgGUID: h/UsYfBTR6OK/5kHkhy4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="200315929"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2025 16:52:58 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0qL0-0002ZN-2M;
	Mon, 22 Sep 2025 23:52:54 +0000
Date: Tue, 23 Sep 2025 07:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 265/265]
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb:
 displayport-controller@ae90000 (qcom,sar2130p-dp): assigned-clock-parents:
 [[31, 1], [31, 2], [31, 2]] is too long
Message-ID: <202509230710.SIpW3kuC-lkp@intel.com>
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
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: 2f695d3eac36601d383155e3bba189f06a0f750c [265/265] arm64: dts: qcom: Add MST pixel streams for displayport
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250921 (https://download.01.org/0day-ci/archive/20250923/202509230710.SIpW3kuC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230710.SIpW3kuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509230710.SIpW3kuC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sar2130p.dtsi:2219.27-2294.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sar2130p.dtsi:2315.27-2371.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: displayport-controller@ae90000 (qcom,sar2130p-dp): assigned-clock-parents: [[31, 1], [31, 2], [31, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: displayport-controller@ae90000 (qcom,sar2130p-dp): assigned-clocks: [[120, 16], [120, 20], [120, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: displayport-controller@ae90000 (qcom,sar2130p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: displayport-controller@ae90000 (qcom,sar2130p-dp): clocks: [[120, 2], [120, 12], [120, 15], [120, 18], [120, 19], [120, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clock-parents: [[265, 0], [265, 1], [265, 1], [265, 1], [265, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clocks: [[253, 16], [253, 20], [253, 22], [253, 24], [253, 26]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel', 'stream_2_pixel', 'stream_3_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[253, 1], [253, 11], [253, 15], [253, 18], [253, 19], [253, 21], [253, 23], [253, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156], [0, 183861248, 0, 156], [0, 183865344, 0, 156], [0, 183869440, 0, 572], [0, 183873536, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clock-parents: [[271, 0], [271, 1], [271, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clocks: [[253, 33], [253, 37], [253, 39]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[253, 1], [253, 28], [253, 32], [253, 35], [253, 36], [253, 38]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156], [0, 183894016, 0, 156], [0, 183898112, 0, 156], [0, 183902208, 0, 572], [0, 183906304, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clock-parents: [[52, 1], [52, 2], [52, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clocks: [[196, 16], [196, 20], [196, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[196, 2], [196, 12], [196, 15], [196, 18], [196, 19], [196, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clock-parents: [[281, 0], [281, 1], [281, 1], [281, 1], [281, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clocks: [[267, 16], [267, 20], [267, 22], [267, 24], [267, 26]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel', 'stream_2_pixel', 'stream_3_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[267, 1], [267, 11], [267, 15], [267, 18], [267, 19], [267, 21], [267, 23], [267, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156], [0, 183861248, 0, 156], [0, 183865344, 0, 156], [0, 183869440, 0, 572], [0, 183873536, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clock-parents: [[287, 0], [287, 1], [287, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clocks: [[267, 33], [267, 37], [267, 39]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[267, 1], [267, 28], [267, 32], [267, 35], [267, 36], [267, 38]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156], [0, 183894016, 0, 156], [0, 183898112, 0, 156], [0, 183902208, 0, 572], [0, 183906304, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clock-parents: [[281, 0], [281, 1], [281, 1], [281, 1], [281, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clocks: [[267, 16], [267, 20], [267, 22], [267, 24], [267, 26]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel', 'stream_2_pixel', 'stream_3_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[267, 1], [267, 11], [267, 15], [267, 18], [267, 19], [267, 21], [267, 23], [267, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156], [0, 183861248, 0, 156], [0, 183865344, 0, 156], [0, 183869440, 0, 572], [0, 183873536, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clock-parents: [[287, 0], [287, 1], [287, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clocks: [[267, 33], [267, 37], [267, 39]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[267, 1], [267, 28], [267, 32], [267, 35], [267, 36], [267, 38]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156], [0, 183894016, 0, 156], [0, 183898112, 0, 156], [0, 183902208, 0, 572], [0, 183906304, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4844.27-4917.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4938.27-4992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[213, 1], [213, 2], [213, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[227, 19], [227, 27], [227, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[227, 0], [227, 12], [227, 18], [227, 21], [227, 26], [227, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clock-parents: [[190, 1], [190, 2], [190, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clocks: [[197, 19], [197, 27], [197, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[197, 0], [197, 12], [197, 18], [197, 21], [197, 26], [197, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[148, 18], [148, 22], [148, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[148, 5], [148, 15], [148, 17], [148, 20], [148, 21], [148, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[148, 29], [148, 33], [148, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[148, 5], [148, 26], [148, 28], [148, 31], [148, 32], [148, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[160, 0], [160, 1], [160, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[148, 40], [148, 44], [148, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[148, 5], [148, 37], [148, 39], [148, 42], [148, 43], [148, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[187, 0], [187, 1], [187, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[124, 18], [124, 22], [124, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[124, 5], [124, 15], [124, 17], [124, 20], [124, 21], [124, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[191, 0], [191, 1], [191, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[124, 29], [124, 33], [124, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[124, 5], [124, 26], [124, 28], [124, 31], [124, 32], [124, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[195, 0], [195, 1], [195, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[124, 40], [124, 44], [124, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[124, 5], [124, 37], [124, 39], [124, 42], [124, 43], [124, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[53, 1], [53, 2], [53, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[144, 18], [144, 22], [144, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[144, 5], [144, 15], [144, 17], [144, 20], [144, 21], [144, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[54, 1], [54, 2], [54, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[144, 29], [144, 33], [144, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[144, 5], [144, 26], [144, 28], [144, 31], [144, 32], [144, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[156, 0], [156, 1], [156, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[144, 40], [144, 44], [144, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[144, 5], [144, 37], [144, 39], [144, 42], [144, 43], [144, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[182, 0], [182, 1], [182, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[121, 18], [121, 22], [121, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[121, 5], [121, 15], [121, 17], [121, 20], [121, 21], [121, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[185, 0], [185, 1], [185, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[121, 29], [121, 33], [121, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[121, 5], [121, 26], [121, 28], [121, 31], [121, 32], [121, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[188, 0], [188, 1], [188, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[121, 40], [121, 44], [121, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[121, 5], [121, 37], [121, 39], [121, 42], [121, 43], [121, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clock-parents: [[282, 0], [282, 1], [282, 1], [282, 1], [282, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clocks: [[268, 16], [268, 20], [268, 22], [268, 24], [268, 26]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel', 'stream_2_pixel', 'stream_3_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[268, 1], [268, 11], [268, 15], [268, 18], [268, 19], [268, 21], [268, 23], [268, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156], [0, 183861248, 0, 156], [0, 183865344, 0, 156], [0, 183869440, 0, 572], [0, 183873536, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clock-parents: [[288, 0], [288, 1], [288, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clocks: [[268, 33], [268, 37], [268, 39]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[268, 1], [268, 28], [268, 32], [268, 35], [268, 36], [268, 38]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156], [0, 183894016, 0, 156], [0, 183898112, 0, 156], [0, 183902208, 0, 572], [0, 183906304, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clock-parents: [[282, 0], [282, 1], [282, 1], [282, 1], [282, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clocks: [[268, 16], [268, 20], [268, 22], [268, 24], [268, 26]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel', 'stream_2_pixel', 'stream_3_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[268, 1], [268, 11], [268, 15], [268, 18], [268, 19], [268, 21], [268, 23], [268, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156], [0, 183861248, 0, 156], [0, 183865344, 0, 156], [0, 183869440, 0, 572], [0, 183873536, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clock-parents: [[288, 0], [288, 1], [288, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clocks: [[268, 33], [268, 37], [268, 39]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[268, 1], [268, 28], [268, 32], [268, 35], [268, 36], [268, 38]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156], [0, 183894016, 0, 156], [0, 183898112, 0, 156], [0, 183902208, 0, 572], [0, 183906304, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   	'qcom,sc8180x-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8180x-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8180x-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: dsi@ae96000 (qcom,sc8180x-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8180x-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8180x-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8180x-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8180x-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): assigned-clock-parents: [[99, 1], [99, 2], [99, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): assigned-clocks: [[107, 19], [107, 27], [107, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): clocks: [[107, 0], [107, 12], [107, 18], [107, 21], [107, 26], [107, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): assigned-clock-parents: [[103, 1], [103, 2], [103, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): assigned-clocks: [[107, 15], [107, 25], [107, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): clocks: [[107, 0], [107, 10], [107, 14], [107, 17], [107, 24], [107, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
--
   	'qcom,sc8180x-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8180x-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8180x-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: dsi@ae96000 (qcom,sc8180x-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8180x-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8180x-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8180x-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8180x-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): assigned-clock-parents: [[101, 1], [101, 2], [101, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): assigned-clocks: [[109, 19], [109, 27], [109, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): clocks: [[109, 0], [109, 12], [109, 18], [109, 21], [109, 26], [109, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): assigned-clock-parents: [[105, 1], [105, 2], [105, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): assigned-clocks: [[109, 15], [109, 25], [109, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): clocks: [[109, 0], [109, 10], [109, 14], [109, 17], [109, 24], [109, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[167, 18], [167, 22], [167, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[167, 5], [167, 15], [167, 17], [167, 20], [167, 21], [167, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[167, 29], [167, 33], [167, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[167, 5], [167, 26], [167, 28], [167, 31], [167, 32], [167, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[181, 0], [181, 1], [181, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[167, 40], [167, 44], [167, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[167, 5], [167, 37], [167, 39], [167, 42], [167, 43], [167, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[215, 0], [215, 1], [215, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[142, 18], [142, 22], [142, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[142, 5], [142, 15], [142, 17], [142, 20], [142, 21], [142, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[218, 0], [218, 1], [218, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[142, 29], [142, 33], [142, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[142, 5], [142, 26], [142, 28], [142, 31], [142, 32], [142, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[221, 0], [221, 1], [221, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[142, 40], [142, 44], [142, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[142, 5], [142, 37], [142, 39], [142, 42], [142, 43], [142, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[172, 18], [172, 22], [172, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[172, 5], [172, 15], [172, 17], [172, 20], [172, 21], [172, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[172, 29], [172, 33], [172, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[172, 5], [172, 26], [172, 28], [172, 31], [172, 32], [172, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[186, 0], [186, 1], [186, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[172, 40], [172, 44], [172, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[172, 5], [172, 37], [172, 39], [172, 42], [172, 43], [172, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[220, 0], [220, 1], [220, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[147, 18], [147, 22], [147, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[147, 5], [147, 15], [147, 17], [147, 20], [147, 21], [147, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[223, 0], [223, 1], [223, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[147, 29], [147, 33], [147, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[147, 5], [147, 26], [147, 28], [147, 31], [147, 32], [147, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[226, 0], [226, 1], [226, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[147, 40], [147, 44], [147, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[147, 5], [147, 37], [147, 39], [147, 42], [147, 43], [147, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4541.12-4545.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@88eb000 (qcom,sc8280xp-qmp-usb43dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@8903000 (qcom,sc8280xp-qmp-usb43dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[181, 18], [181, 22], [181, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[181, 5], [181, 15], [181, 17], [181, 20], [181, 21], [181, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[181, 29], [181, 33], [181, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[181, 5], [181, 26], [181, 28], [181, 31], [181, 32], [181, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[195, 0], [195, 1], [195, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[181, 40], [181, 44], [181, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[181, 5], [181, 37], [181, 39], [181, 42], [181, 43], [181, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[231, 0], [231, 1], [231, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[150, 18], [150, 22], [150, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[150, 5], [150, 15], [150, 17], [150, 20], [150, 21], [150, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[234, 0], [234, 1], [234, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[150, 29], [150, 33], [150, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[150, 5], [150, 26], [150, 28], [150, 31], [150, 32], [150, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[237, 0], [237, 1], [237, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[150, 40], [150, 44], [150, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[150, 5], [150, 37], [150, 39], [150, 42], [150, 43], [150, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[152, 18], [152, 22], [152, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[152, 5], [152, 15], [152, 17], [152, 20], [152, 21], [152, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[152, 29], [152, 33], [152, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[152, 5], [152, 26], [152, 28], [152, 31], [152, 32], [152, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[166, 0], [166, 1], [166, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[152, 40], [152, 44], [152, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[152, 5], [152, 37], [152, 39], [152, 42], [152, 43], [152, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[197, 0], [197, 1], [197, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[127, 18], [127, 22], [127, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[127, 5], [127, 15], [127, 17], [127, 20], [127, 21], [127, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[200, 0], [200, 1], [200, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[127, 29], [127, 33], [127, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[127, 5], [127, 26], [127, 28], [127, 31], [127, 32], [127, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[203, 0], [203, 1], [203, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[127, 40], [127, 44], [127, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[127, 5], [127, 37], [127, 39], [127, 42], [127, 43], [127, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[153, 18], [153, 22], [153, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[153, 5], [153, 15], [153, 17], [153, 20], [153, 21], [153, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[153, 29], [153, 33], [153, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[153, 5], [153, 26], [153, 28], [153, 31], [153, 32], [153, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[167, 0], [167, 1], [167, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[153, 40], [153, 44], [153, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[153, 5], [153, 37], [153, 39], [153, 42], [153, 43], [153, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[203, 0], [203, 1], [203, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[131, 18], [131, 22], [131, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[131, 5], [131, 15], [131, 17], [131, 20], [131, 21], [131, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[206, 0], [206, 1], [206, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[131, 29], [131, 33], [131, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[131, 5], [131, 26], [131, 28], [131, 31], [131, 32], [131, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[209, 0], [209, 1], [209, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[131, 40], [131, 44], [131, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[131, 5], [131, 37], [131, 39], [131, 42], [131, 43], [131, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4722.27-4775.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[205, 1], [205, 2], [205, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[219, 33], [219, 38], [219, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[219, 0], [219, 28], [219, 32], [219, 34], [219, 37], [219, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4722.27-4775.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[189, 1], [189, 2], [189, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[203, 33], [203, 38], [203, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[203, 0], [203, 28], [203, 32], [203, 34], [203, 37], [203, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4722.27-4775.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[187, 1], [187, 2], [187, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[201, 33], [201, 38], [201, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[201, 0], [201, 28], [201, 32], [201, 34], [201, 37], [201, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[190, 1], [190, 2], [190, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[204, 33], [204, 38], [204, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[204, 0], [204, 28], [204, 32], [204, 34], [204, 37], [204, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[213, 1], [213, 2], [213, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[207, 33], [207, 38], [207, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[207, 0], [207, 28], [207, 32], [207, 34], [207, 37], [207, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[212, 1], [212, 2], [212, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[206, 33], [206, 38], [206, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[206, 0], [206, 28], [206, 32], [206, 34], [206, 37], [206, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts:602.10-643.4: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pmic@66 (maxim,max77705): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[206, 1], [206, 2], [206, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[220, 33], [220, 38], [220, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[220, 0], [220, 28], [220, 32], [220, 34], [220, 37], [220, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): $nodename:0: 'i2c21' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@60' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: touchscreen@2c (syna,rmi4-i2c): Unevaluated properties are not allowed ('incell-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[205, 1], [205, 2], [205, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[199, 33], [199, 38], [199, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[199, 0], [199, 28], [199, 32], [199, 34], [199, 37], [199, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1562.21-1582.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@894000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[201, 1], [201, 2], [201, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[195, 33], [195, 38], [195, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[195, 0], [195, 28], [195, 32], [195, 34], [195, 37], [195, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: touchscreen@2c (syna,rmi4-i2c): Unevaluated properties are not allowed ('incell-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[205, 1], [205, 2], [205, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[199, 33], [199, 38], [199, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[199, 0], [199, 28], [199, 32], [199, 34], [199, 37], [199, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[200, 1], [200, 2], [200, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[214, 33], [214, 38], [214, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[214, 0], [214, 28], [214, 32], [214, 34], [214, 37], [214, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[200, 1], [200, 2], [200, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[214, 33], [214, 38], [214, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[214, 0], [214, 28], [214, 32], [214, 34], [214, 37], [214, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts:471.25-492.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[214, 1], [214, 2], [214, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[208, 33], [208, 38], [208, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[208, 0], [208, 28], [208, 32], [208, 34], [208, 37], [208, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['jdi,fhd-nt35596s']
--
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts:475.10-496.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/geniqup@8c0000/i2c@894000/touchscreen@38: failed to match any schema with compatible: ['focaltech,fts8719']
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[192, 1], [192, 2], [192, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[206, 33], [206, 38], [206, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[206, 0], [206, 28], [206, 32], [206, 34], [206, 37], [206, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4722.27-4775.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[211, 1], [211, 2], [211, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[232, 33], [232, 38], [232, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[232, 0], [232, 28], [232, 32], [232, 34], [232, 37], [232, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4722.27-4775.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[194, 1], [194, 2], [194, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[208, 33], [208, 38], [208, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[208, 0], [208, 28], [208, 32], [208, 34], [208, 37], [208, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clock-parents: [[187, 1], [187, 2], [187, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clocks: [[193, 19], [193, 27], [193, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[193, 0], [193, 12], [193, 18], [193, 21], [193, 26], [193, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clock-parents: [[180, 1], [180, 2], [180, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clocks: [[185, 19], [185, 27], [185, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[185, 0], [185, 12], [185, 18], [185, 21], [185, 26], [185, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clock-parents: [[179, 1], [179, 2], [179, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clocks: [[184, 19], [184, 27], [184, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[184, 0], [184, 12], [184, 18], [184, 21], [184, 26], [184, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clock-parents: [[179, 1], [179, 2], [179, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clocks: [[184, 19], [184, 27], [184, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[184, 0], [184, 12], [184, 18], [184, 21], [184, 26], [184, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3964.27-4036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4057.27-4110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clock-parents: [[179, 1], [179, 2], [179, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): assigned-clocks: [[184, 19], [184, 27], [184, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[184, 0], [184, 12], [184, 18], [184, 21], [184, 26], [184, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4844.27-4917.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4938.27-4992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[182, 1], [182, 2], [182, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[195, 19], [195, 27], [195, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[195, 0], [195, 12], [195, 18], [195, 21], [195, 26], [195, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4844.27-4917.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4938.27-4992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[182, 1], [182, 2], [182, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[195, 19], [195, 27], [195, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[195, 0], [195, 12], [195, 18], [195, 21], [195, 26], [195, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4844.27-4917.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4938.27-4992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[199, 1], [199, 2], [199, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[193, 19], [193, 27], [193, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[193, 0], [193, 12], [193, 18], [193, 21], [193, 26], [193, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4844.27-4917.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4938.27-4992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[199, 1], [199, 2], [199, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[193, 19], [193, 27], [193, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[193, 0], [193, 12], [193, 18], [193, 21], [193, 26], [193, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4844.27-4917.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4938.27-4992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[194, 1], [194, 2], [194, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[2, 19], [2, 27], [2, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[2, 0], [2, 12], [2, 18], [2, 21], [2, 26], [2, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4844.27-4917.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4938.27-4992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[190, 1], [190, 2], [190, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[2, 19], [2, 27], [2, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[2, 0], [2, 12], [2, 18], [2, 21], [2, 26], [2, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4938.27-4992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:740.9-751.5: Warning (graph_child_address): /soc@0/spmi@c440000/pmic@2/typec@1500/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[214, 1], [214, 2], [214, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[208, 19], [208, 27], [208, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[208, 0], [208, 12], [208, 18], [208, 21], [208, 26], [208, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4938.27-4992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:740.9-751.5: Warning (graph_child_address): /soc@0/spmi@c440000/pmic@2/typec@1500/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[214, 1], [214, 2], [214, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[208, 19], [208, 27], [208, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[208, 0], [208, 12], [208, 18], [208, 21], [208, 26], [208, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4844.27-4917.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4938.27-4992.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[184, 1], [184, 2], [184, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[197, 19], [197, 27], [197, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[197, 0], [197, 12], [197, 18], [197, 21], [197, 26], [197, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2950.27-3028.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3049.27-3127.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): assigned-clock-parents: [[44, 1], [44, 2], [44, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): assigned-clocks: [[142, 19], [142, 27], [142, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clocks: [[142, 0], [142, 12], [142, 18], [142, 21], [142, 26], [142, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2950.27-3028.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3049.27-3127.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): assigned-clock-parents: [[44, 1], [44, 2], [44, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): assigned-clocks: [[125, 19], [125, 27], [125, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clocks: [[125, 0], [125, 12], [125, 18], [125, 21], [125, 26], [125, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2950.27-3028.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3049.27-3127.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): assigned-clock-parents: [[44, 1], [44, 2], [44, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): assigned-clocks: [[125, 19], [125, 27], [125, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clocks: [[125, 0], [125, 12], [125, 18], [125, 21], [125, 26], [125, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2950.27-3028.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3049.27-3127.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): assigned-clock-parents: [[45, 1], [45, 2], [45, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): assigned-clocks: [[129, 19], [129, 27], [129, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clocks: [[129, 0], [129, 12], [129, 18], [129, 21], [129, 26], [129, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2950.27-3028.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3049.27-3127.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): assigned-clock-parents: [[45, 1], [45, 2], [45, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): assigned-clocks: [[131, 19], [131, 27], [131, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clocks: [[131, 0], [131, 12], [131, 18], [131, 21], [131, 26], [131, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3508.27-3581.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3602.27-3656.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): assigned-clock-parents: [[64, 1], [64, 2], [64, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): assigned-clocks: [[222, 15], [222, 19], [222, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[222, 1], [222, 11], [222, 14], [222, 17], [222, 18], [222, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3508.27-3581.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3602.27-3656.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): assigned-clock-parents: [[64, 1], [64, 2], [64, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): assigned-clocks: [[198, 15], [198, 19], [198, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[198, 1], [198, 11], [198, 14], [198, 17], [198, 18], [198, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3508.27-3581.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3602.27-3656.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): assigned-clock-parents: [[64, 1], [64, 2], [64, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): assigned-clocks: [[195, 15], [195, 19], [195, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[195, 1], [195, 11], [195, 14], [195, 17], [195, 18], [195, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3508.27-3581.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3602.27-3656.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): assigned-clock-parents: [[64, 1], [64, 2], [64, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): assigned-clocks: [[203, 15], [203, 19], [203, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[203, 1], [203, 11], [203, 14], [203, 17], [203, 18], [203, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3508.27-3581.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3602.27-3656.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): assigned-clock-parents: [[64, 1], [64, 2], [64, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): assigned-clocks: [[203, 15], [203, 19], [203, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[203, 1], [203, 11], [203, 14], [203, 17], [203, 18], [203, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3833.27-3907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clock-parents: [[52, 1], [52, 2], [52, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clocks: [[218, 16], [218, 20], [218, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[218, 2], [218, 12], [218, 15], [218, 18], [218, 19], [218, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clock-parents: [[52, 1], [52, 2], [52, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clocks: [[202, 16], [202, 20], [202, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[202, 2], [202, 12], [202, 15], [202, 18], [202, 19], [202, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clock-parents: [[52, 1], [52, 2], [52, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clocks: [[209, 16], [209, 20], [209, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[209, 2], [209, 12], [209, 15], [209, 18], [209, 19], [209, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3833.27-3907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clock-parents: [[52, 1], [52, 2], [52, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clocks: [[189, 16], [189, 20], [189, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[189, 2], [189, 12], [189, 15], [189, 18], [189, 19], [189, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3833.27-3907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clock-parents: [[52, 1], [52, 2], [52, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): assigned-clocks: [[193, 16], [193, 20], [193, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[193, 2], [193, 12], [193, 15], [193, 18], [193, 19], [193, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: phy@88e8000 (qcom,sm8550-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5049.22-5140.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5474.27-5549.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5571.27-5627.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: phy@88e8000 (qcom,sm8650-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: displayport-controller@af54000 (qcom,sm8650-dp): assigned-clock-parents: [[74, 1], [74, 2], [74, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: displayport-controller@af54000 (qcom,sm8650-dp): assigned-clocks: [[251, 16], [251, 20], [251, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clocks: [[251, 2], [251, 12], [251, 15], [251, 18], [251, 19], [251, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5049.22-5140.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5571.27-5627.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: phy@88e8000 (qcom,sm8650-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: displayport-controller@af54000 (qcom,sm8650-dp): assigned-clock-parents: [[74, 1], [74, 2], [74, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: displayport-controller@af54000 (qcom,sm8650-dp): assigned-clocks: [[234, 16], [234, 20], [234, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clocks: [[234, 2], [234, 12], [234, 15], [234, 18], [234, 19], [234, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5049.22-5140.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5571.27-5627.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: phy@88e8000 (qcom,sm8650-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: displayport-controller@af54000 (qcom,sm8650-dp): assigned-clock-parents: [[74, 1], [74, 2], [74, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: displayport-controller@af54000 (qcom,sm8650-dp): assigned-clocks: [[243, 16], [243, 20], [243, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clocks: [[243, 2], [243, 12], [243, 15], [243, 18], [243, 19], [243, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clock-parents: [[265, 0], [265, 1], [265, 1], [265, 1], [265, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): assigned-clocks: [[253, 16], [253, 20], [253, 22], [253, 24], [253, 26]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel', 'stream_2_pixel', 'stream_3_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[253, 1], [253, 11], [253, 15], [253, 18], [253, 19], [253, 21], [253, 23], [253, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156], [0, 183861248, 0, 156], [0, 183865344, 0, 156], [0, 183869440, 0, 572], [0, 183873536, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clock-parents: [[271, 0], [271, 1], [271, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): assigned-clocks: [[253, 33], [253, 37], [253, 39]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[253, 1], [253, 28], [253, 32], [253, 35], [253, 36], [253, 38]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156], [0, 183894016, 0, 156], [0, 183898112, 0, 156], [0, 183902208, 0, 572], [0, 183906304, 0, 572]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clock-parents: [[213, 1], [213, 2], [213, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): assigned-clocks: [[227, 19], [227, 27], [227, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[227, 0], [227, 12], [227, 18], [227, 21], [227, 26], [227, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[167, 18], [167, 22], [167, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[167, 5], [167, 15], [167, 17], [167, 20], [167, 21], [167, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[167, 29], [167, 33], [167, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[167, 5], [167, 26], [167, 28], [167, 31], [167, 32], [167, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[181, 0], [181, 1], [181, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[167, 40], [167, 44], [167, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[167, 5], [167, 37], [167, 39], [167, 42], [167, 43], [167, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[215, 0], [215, 1], [215, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[142, 18], [142, 22], [142, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[142, 5], [142, 15], [142, 17], [142, 20], [142, 21], [142, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[218, 0], [218, 1], [218, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[142, 29], [142, 33], [142, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[142, 5], [142, 26], [142, 28], [142, 31], [142, 32], [142, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[221, 0], [221, 1], [221, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[142, 40], [142, 44], [142, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[142, 5], [142, 37], [142, 39], [142, 42], [142, 43], [142, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[172, 18], [172, 22], [172, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[172, 5], [172, 15], [172, 17], [172, 20], [172, 21], [172, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[172, 29], [172, 33], [172, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[172, 5], [172, 26], [172, 28], [172, 31], [172, 32], [172, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[186, 0], [186, 1], [186, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[172, 40], [172, 44], [172, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[172, 5], [172, 37], [172, 39], [172, 42], [172, 43], [172, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[220, 0], [220, 1], [220, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[147, 18], [147, 22], [147, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[147, 5], [147, 15], [147, 17], [147, 20], [147, 21], [147, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[223, 0], [223, 1], [223, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[147, 29], [147, 33], [147, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[147, 5], [147, 26], [147, 28], [147, 31], [147, 32], [147, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[226, 0], [226, 1], [226, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[147, 40], [147, 44], [147, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[147, 5], [147, 37], [147, 39], [147, 42], [147, 43], [147, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@88eb000 (qcom,sc8280xp-qmp-usb43dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@8903000 (qcom,sc8280xp-qmp-usb43dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[181, 18], [181, 22], [181, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[181, 5], [181, 15], [181, 17], [181, 20], [181, 21], [181, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[181, 29], [181, 33], [181, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[181, 5], [181, 26], [181, 28], [181, 31], [181, 32], [181, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[195, 0], [195, 1], [195, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[181, 40], [181, 44], [181, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[181, 5], [181, 37], [181, 39], [181, 42], [181, 43], [181, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[231, 0], [231, 1], [231, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[150, 18], [150, 22], [150, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[150, 5], [150, 15], [150, 17], [150, 20], [150, 21], [150, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[234, 0], [234, 1], [234, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[150, 29], [150, 33], [150, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[150, 5], [150, 26], [150, 28], [150, 31], [150, 32], [150, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[237, 0], [237, 1], [237, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[150, 40], [150, 44], [150, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[150, 5], [150, 37], [150, 39], [150, 42], [150, 43], [150, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[152, 18], [152, 22], [152, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[152, 5], [152, 15], [152, 17], [152, 20], [152, 21], [152, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[152, 29], [152, 33], [152, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[152, 5], [152, 26], [152, 28], [152, 31], [152, 32], [152, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[166, 0], [166, 1], [166, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[152, 40], [152, 44], [152, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[152, 5], [152, 37], [152, 39], [152, 42], [152, 43], [152, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[197, 0], [197, 1], [197, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[127, 18], [127, 22], [127, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[127, 5], [127, 15], [127, 17], [127, 20], [127, 21], [127, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[200, 0], [200, 1], [200, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[127, 29], [127, 33], [127, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[127, 5], [127, 26], [127, 28], [127, 31], [127, 32], [127, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[203, 0], [203, 1], [203, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[127, 40], [127, 44], [127, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[127, 5], [127, 37], [127, 39], [127, 42], [127, 43], [127, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clock-parents: [[47, 1], [47, 2], [47, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): assigned-clocks: [[153, 18], [153, 22], [153, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): clocks: [[153, 5], [153, 15], [153, 17], [153, 20], [153, 21], [153, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clock-parents: [[48, 1], [48, 2], [48, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): assigned-clocks: [[153, 29], [153, 33], [153, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): clocks: [[153, 5], [153, 26], [153, 28], [153, 31], [153, 32], [153, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[167, 0], [167, 1], [167, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): assigned-clocks: [[153, 40], [153, 44], [153, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): clocks: [[153, 5], [153, 37], [153, 39], [153, 42], [153, 43], [153, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clock-parents: [[203, 0], [203, 1], [203, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): assigned-clocks: [[131, 18], [131, 22], [131, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): clocks: [[131, 5], [131, 15], [131, 17], [131, 20], [131, 21], [131, 23]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clock-parents: [[206, 0], [206, 1], [206, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): assigned-clocks: [[131, 29], [131, 33], [131, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): clocks: [[131, 5], [131, 26], [131, 28], [131, 31], [131, 32], [131, 34]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clock-parents: [[209, 0], [209, 1], [209, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): assigned-clocks: [[131, 40], [131, 44], [131, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): clocks: [[131, 5], [131, 37], [131, 39], [131, 42], [131, 43], [131, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: camera@10 (ovti,ov8856): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clock-parents: [[205, 1], [205, 2], [205, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): assigned-clocks: [[219, 33], [219, 38], [219, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[219, 0], [219, 28], [219, 32], [219, 34], [219, 37], [219, 35]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: phy@88e8000 (qcom,sm8650-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: displayport-controller@af54000 (qcom,sm8650-dp): assigned-clock-parents: [[74, 1], [74, 2], [74, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: displayport-controller@af54000 (qcom,sm8650-dp): assigned-clocks: [[251, 16], [251, 20], [251, 22]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clock-names: ['core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel', 'stream_1_pixel'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clocks: [[251, 2], [251, 12], [251, 15], [251, 18], [251, 19], [251, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

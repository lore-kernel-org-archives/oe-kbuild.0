Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B64312FF7B
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 22:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723069174; cv=none; b=nIDs2oHuoA/E7GVl8IlKhgfDdJXvx4Mx9TR2sivFZU/ExtirmSOit8T5UkB8WTlZf7vOGo1A6uDmU0kmV7h/BQQKqKN+vFiMEa+3bt9d6LZ4GZZ3kqQH+f4P5MwAMwrui91NNjE+NRaEBeKP+J2GH6MdlkXgUuPWJzDOjs3hxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723069174; c=relaxed/simple;
	bh=wUKmAYSHvelQ7XsvFG4cJXqPyzqyFvPLAJMbqiYXzWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IHNvnvDWk+O2pyDc/HBvmG8djiLvqRivW+WlnV+p6tc9HtLWGY1eAzjKxYClcwJ9Hj5YKlMXCd+LgFVTzIqVu9NrmszapANWBTGaXHDfVUSORpmYb3N9YaaLQOe0VRQZbyZpUFkmuBegN5A9kKLsrrZwbAIJvU3qWYE0TmI5AN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPkz6Twf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPkz6Twf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723069166; x=1754605166;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wUKmAYSHvelQ7XsvFG4cJXqPyzqyFvPLAJMbqiYXzWU=;
  b=BPkz6TwfWBQIODHygK4REuYYz1rAqU+645+hfvTIN8KBSVqW3aro+L64
   wOxIiChPKXxtDV4Xx5EosEJOJcr6leK6Nup61aY1oMhbp5e5xXNBe4KLi
   PKmZH+Uc+LuO5IoG28aucB7ZXTlw+W9K2UtNLFcxKiBh4abfob983KR51
   ofpEIAzqAMzn4MdMKKYdD5b93OZnWv+27CclbyaswreuXuqdzFXxsFKu7
   ioNRmrELBElmxv2afr//iOO11Zlvvddn21DJYCHRF/XZG78kbIpRreoWH
   TmLETT19GE4jPF/UsMtwZAV9orKXfgW0Rm0N0vHB9pD+vUs/ML0LBC9kb
   w==;
X-CSE-ConnectionGUID: T0VDFR2GQ2mEq4ROXMwfWQ==
X-CSE-MsgGUID: jo/6aNq3ToKlLA6rT82mNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31839789"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="31839789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 15:19:25 -0700
X-CSE-ConnectionGUID: pkCJeG4ETwa+8zd+x9VS6A==
X-CSE-MsgGUID: FdDyd5ajTQi1KGGyozUNiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="56686253"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2024 15:19:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbp05-0005lE-0H;
	Wed, 07 Aug 2024 22:19:21 +0000
Date: Thu, 8 Aug 2024 06:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29904/30000]
 arch/arm64/boot/dts/qcom/x1e80100.dtsi:2989.30-3062.5: Warning
 (avoid_unnecessary_addr_size): /soc@0/video-codec@aa00000: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202408080636.Gl3Q3Gho-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rajendra Nayak <quic_rjendra@quicinc.com>
CC: Abel Vesa <abel.vesa@linaro.org>

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: ea0a29836df3c92a01851d98bdd11d3bdb75274b [29904/30000] fixup: clk: =
qcom: Add Global Clock controller (GCC) driver for x1e80100
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240807 (https://download.01.org/0day-ci/arch=
ive/20240808/202408080636.Gl3Q3Gho-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240808/202408080636.Gl3Q3Gho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408080636.Gl3Q3Gho-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2989.30-3062.5: Warning (avoid_un=
necessary_addr_size): /soc@0/video-codec@aa00000: unnecessary #address-cell=
s/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-s=
leep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.=
yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-s=
leep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.=
yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fd5000: 'vdda-phy-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fd5000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000: 'vdda-phy-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000: 'vdda-phy-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: video-codec@aa00000: reg: [[0=
, 178257920, 0, 983040]] is too short
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.y=
aml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: video-codec@aa00000: 'non-sec=
ure-cb' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.y=
aml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: video-codec@aa00000: '#addres=
s-cells', '#size-cells', 'non_securei_cb' do not match any of the regexes: =
'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.y=
aml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/clock-controller@aaf00=
00: failed to match any schema with compatible: ['qcom,x1e80100-videocc']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names:=
 ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@7: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@7: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@a: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@a: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@b: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2989.30-3062.5: Warning (avoid_un=
necessary_addr_size): /soc@0/video-codec@aa00000: unnecessary #address-cell=
s/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-s=
leep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.=
yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-s=
leep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.=
yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fd5000: 'vdda-phy-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fd5000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fda000: 'vdda-phy-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fda000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fdf000: 'vdda-phy-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fdf000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: video-codec@aa00000: reg: [[0=
, 178257920, 0, 983040]] is too short
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.y=
aml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: video-codec@aa00000: 'non-sec=
ure-cb' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.y=
aml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: video-codec@aa00000: '#addres=
s-cells', '#size-cells', 'non_securei_cb' do not match any of the regexes: =
'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.y=
aml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/clock-controller@aaf00=
00: failed to match any schema with compatible: ['qcom,x1e80100-videocc']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names:=
 ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@7: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@7: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@a: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@a: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@b: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#

vim +2989 arch/arm64/boot/dts/qcom/x1e80100.dtsi

af16b00578a7a1 Rajendra Nayak 2023-12-05    22 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    23  / {
af16b00578a7a1 Rajendra Nayak 2023-12-05    24  	interrupt-parent =3D <&int=
c>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    25 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    26  	#address-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    27  	#size-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    28 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    29  	chosen { };
af16b00578a7a1 Rajendra Nayak 2023-12-05    30 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    31  	clocks {
af16b00578a7a1 Rajendra Nayak 2023-12-05    32  		xo_board: xo-board {
af16b00578a7a1 Rajendra Nayak 2023-12-05    33  			compatible =3D "fixed-cl=
ock";
af16b00578a7a1 Rajendra Nayak 2023-12-05    34  			clock-frequency =3D <768=
00000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    35  			#clock-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    36  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05    37 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    38  		sleep_clk: sleep-clk {
af16b00578a7a1 Rajendra Nayak 2023-12-05    39  			compatible =3D "fixed-cl=
ock";
af16b00578a7a1 Rajendra Nayak 2023-12-05    40  			clock-frequency =3D <320=
00>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    41  			#clock-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    42  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05    43 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    44  		bi_tcxo_div2: bi-tcxo-div=
2-clk {
af16b00578a7a1 Rajendra Nayak 2023-12-05    45  			compatible =3D "fixed-fa=
ctor-clock";
af16b00578a7a1 Rajendra Nayak 2023-12-05    46  			#clock-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    47 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    48  			clocks =3D <&rpmhcc RPMH=
_CXO_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    49  			clock-mult =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    50  			clock-div =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    51  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05    52 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    53  		bi_tcxo_ao_div2: bi-tcxo-=
ao-div2-clk {
af16b00578a7a1 Rajendra Nayak 2023-12-05    54  			compatible =3D "fixed-fa=
ctor-clock";
af16b00578a7a1 Rajendra Nayak 2023-12-05    55  			#clock-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    56 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    57  			clocks =3D <&rpmhcc RPMH=
_CXO_CLK_A>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    58  			clock-mult =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    59  			clock-div =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    60  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05    61  	};
af16b00578a7a1 Rajendra Nayak 2023-12-05    62 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    63  	cpus {
af16b00578a7a1 Rajendra Nayak 2023-12-05    64  		#address-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    65  		#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    66 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    67  		CPU0: cpu@0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05    68  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05    69  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05    70  			reg =3D <0x0 0x0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    71  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05    72  			next-level-cache =3D <&L=
2_0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    73  			power-domains =3D <&CPU_=
PD0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    74  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05    75  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    76 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    77  			L2_0: l2-cache {
af16b00578a7a1 Rajendra Nayak 2023-12-05    78  				compatible =3D "cache";
af16b00578a7a1 Rajendra Nayak 2023-12-05    79  				cache-level =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    80  				cache-unified;
af16b00578a7a1 Rajendra Nayak 2023-12-05    81  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05    82  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05    83 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    84  		CPU1: cpu@100 {
af16b00578a7a1 Rajendra Nayak 2023-12-05    85  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05    86  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05    87  			reg =3D <0x0 0x100>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    88  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05    89  			next-level-cache =3D <&L=
2_0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    90  			power-domains =3D <&CPU_=
PD1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    91  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05    92  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    93  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05    94 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05    95  		CPU2: cpu@200 {
af16b00578a7a1 Rajendra Nayak 2023-12-05    96  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05    97  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05    98  			reg =3D <0x0 0x200>;
af16b00578a7a1 Rajendra Nayak 2023-12-05    99  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   100  			next-level-cache =3D <&L=
2_0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   101  			power-domains =3D <&CPU_=
PD2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   102  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   103  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   104  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   105 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   106  		CPU3: cpu@300 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   107  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05   108  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05   109  			reg =3D <0x0 0x300>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   110  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   111  			next-level-cache =3D <&L=
2_0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   112  			power-domains =3D <&CPU_=
PD3>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   113  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   114  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   115  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   116 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   117  		CPU4: cpu@10000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   118  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05   119  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05   120  			reg =3D <0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   121  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   122  			next-level-cache =3D <&L=
2_1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   123  			power-domains =3D <&CPU_=
PD4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   124  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   125  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   126 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   127  			L2_1: l2-cache {
af16b00578a7a1 Rajendra Nayak 2023-12-05   128  				compatible =3D "cache";
af16b00578a7a1 Rajendra Nayak 2023-12-05   129  				cache-level =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   130  				cache-unified;
af16b00578a7a1 Rajendra Nayak 2023-12-05   131  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   132  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   133 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   134  		CPU5: cpu@10100 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   135  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05   136  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05   137  			reg =3D <0x0 0x10100>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   138  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   139  			next-level-cache =3D <&L=
2_1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   140  			power-domains =3D <&CPU_=
PD5>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   141  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   142  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   143  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   144 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   145  		CPU6: cpu@10200 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   146  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05   147  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05   148  			reg =3D <0x0 0x10200>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   149  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   150  			next-level-cache =3D <&L=
2_1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   151  			power-domains =3D <&CPU_=
PD6>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   152  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   153  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   154  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   155 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   156  		CPU7: cpu@10300 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   157  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05   158  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05   159  			reg =3D <0x0 0x10300>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   160  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   161  			next-level-cache =3D <&L=
2_1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   162  			power-domains =3D <&CPU_=
PD7>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   163  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   164  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   165  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   166 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   167  		CPU8: cpu@20000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   168  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05   169  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05   170  			reg =3D <0x0 0x20000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   171  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   172  			next-level-cache =3D <&L=
2_2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   173  			power-domains =3D <&CPU_=
PD8>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   174  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   175  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   176 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   177  			L2_2: l2-cache {
af16b00578a7a1 Rajendra Nayak 2023-12-05   178  				compatible =3D "cache";
af16b00578a7a1 Rajendra Nayak 2023-12-05   179  				cache-level =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   180  				cache-unified;
af16b00578a7a1 Rajendra Nayak 2023-12-05   181  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   182  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   183 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   184  		CPU9: cpu@20100 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   185  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05   186  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05   187  			reg =3D <0x0 0x20100>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   188  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   189  			next-level-cache =3D <&L=
2_2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   190  			power-domains =3D <&CPU_=
PD9>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   191  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   192  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   193  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   194 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   195  		CPU10: cpu@20200 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   196  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05   197  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05   198  			reg =3D <0x0 0x20200>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   199  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   200  			next-level-cache =3D <&L=
2_2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   201  			power-domains =3D <&CPU_=
PD10>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   202  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   203  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   204  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   205 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   206  		CPU11: cpu@20300 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   207  			device_type =3D "cpu";
af16b00578a7a1 Rajendra Nayak 2023-12-05   208  			compatible =3D "qcom,ory=
on";
af16b00578a7a1 Rajendra Nayak 2023-12-05   209  			reg =3D <0x0 0x20300>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   210  			enable-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   211  			next-level-cache =3D <&L=
2_2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   212  			power-domains =3D <&CPU_=
PD11>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   213  			power-domain-names =3D "=
psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   214  			cpu-idle-states =3D <&CL=
USTER_C4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   215  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   216 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   217  		cpu-map {
af16b00578a7a1 Rajendra Nayak 2023-12-05   218  			cluster0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   219  				core0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   220  					cpu =3D <&CPU0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   221  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   222 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   223  				core1 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   224  					cpu =3D <&CPU1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   225  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   226 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   227  				core2 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   228  					cpu =3D <&CPU2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   229  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   230 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   231  				core3 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   232  					cpu =3D <&CPU3>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   233  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   234  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   235 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   236  			cluster1 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   237  				core0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   238  					cpu =3D <&CPU4>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   239  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   240 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   241  				core1 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   242  					cpu =3D <&CPU5>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   243  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   244 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   245  				core2 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   246  					cpu =3D <&CPU6>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   247  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   248 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   249  				core3 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   250  					cpu =3D <&CPU7>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   251  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   252  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   253 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   254  			cluster2 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   255  				core0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   256  					cpu =3D <&CPU8>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   257  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   258 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   259  				core1 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   260  					cpu =3D <&CPU9>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   261  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   262 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   263  				core2 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   264  					cpu =3D <&CPU10>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   265  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   266 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   267  				core3 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   268  					cpu =3D <&CPU11>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   269  				};
af16b00578a7a1 Rajendra Nayak 2023-12-05   270  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   271  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   272 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   273  		idle-states {
af16b00578a7a1 Rajendra Nayak 2023-12-05   274  			entry-method =3D "psci";
af16b00578a7a1 Rajendra Nayak 2023-12-05   275 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   276  			CLUSTER_C4: cpu-sleep-0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   277  				compatible =3D "arm,idl=
e-state";
af16b00578a7a1 Rajendra Nayak 2023-12-05   278  				idle-state-name =3D "re=
t";
af16b00578a7a1 Rajendra Nayak 2023-12-05   279  				arm,psci-suspend-param =
=3D <0x00000004>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   280  				entry-latency-us =3D <1=
80>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   281  				exit-latency-us =3D <32=
0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   282  				min-residency-us =3D <1=
000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   283  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   284  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   285 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   286  		domain-idle-states {
af16b00578a7a1 Rajendra Nayak 2023-12-05   287  			CLUSTER_CL4: cluster-sle=
ep-0 {
cb939b9b354268 Rajendra Nayak 2024-03-17   288  				compatible =3D "domain-=
idle-state";
af16b00578a7a1 Rajendra Nayak 2023-12-05   289  				idle-state-name =3D "l2=
-ret";
af16b00578a7a1 Rajendra Nayak 2023-12-05   290  				arm,psci-suspend-param =
=3D <0x01000044>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   291  				entry-latency-us =3D <3=
50>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   292  				exit-latency-us =3D <50=
0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   293  				min-residency-us =3D <2=
500>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   294  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   295 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   296  			CLUSTER_CL5: cluster-sle=
ep-1 {
cb939b9b354268 Rajendra Nayak 2024-03-17   297  				compatible =3D "domain-=
idle-state";
af16b00578a7a1 Rajendra Nayak 2023-12-05   298  				idle-state-name =3D "re=
t-pll-off";
af16b00578a7a1 Rajendra Nayak 2023-12-05   299  				arm,psci-suspend-param =
=3D <0x01000054>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   300  				entry-latency-us =3D <2=
200>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   301  				exit-latency-us =3D <25=
00>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   302  				min-residency-us =3D <7=
000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   303  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   304  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   305  	};
af16b00578a7a1 Rajendra Nayak 2023-12-05   306 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   307  	firmware {
af16b00578a7a1 Rajendra Nayak 2023-12-05   308  		scm: scm {
af16b00578a7a1 Rajendra Nayak 2023-12-05   309  			compatible =3D "qcom,scm=
-x1e80100", "qcom,scm";
af16b00578a7a1 Rajendra Nayak 2023-12-05   310  			interconnects =3D <&aggr=
e2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   311  					 &mc_virt SLAVE_EBI1 Q=
COM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   312  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   313  	};
af16b00578a7a1 Rajendra Nayak 2023-12-05   314 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   315  	clk_virt: interconnect-0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   316  		compatible =3D "qcom,x1e8=
0100-clk-virt";
af16b00578a7a1 Rajendra Nayak 2023-12-05   317  		#interconnect-cells =3D <=
2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   318  		qcom,bcm-voters =3D <&app=
s_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   319  	};
af16b00578a7a1 Rajendra Nayak 2023-12-05   320 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   321  	mc_virt: interconnect-1 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   322  		compatible =3D "qcom,x1e8=
0100-mc-virt";
af16b00578a7a1 Rajendra Nayak 2023-12-05   323  		#interconnect-cells =3D <=
2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   324  		qcom,bcm-voters =3D <&app=
s_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   325  	};
af16b00578a7a1 Rajendra Nayak 2023-12-05   326 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   327  	memory@80000000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   328  		device_type =3D "memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05   329  		/* We expect the bootload=
er to fill in the size */
af16b00578a7a1 Rajendra Nayak 2023-12-05   330  		reg =3D <0 0x80000000 0 0=
>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   331  	};
af16b00578a7a1 Rajendra Nayak 2023-12-05   332 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   333  	pmu {
af16b00578a7a1 Rajendra Nayak 2023-12-05   334  		compatible =3D "arm,armv8=
-pmuv3";
af16b00578a7a1 Rajendra Nayak 2023-12-05   335  		interrupts =3D <GIC_PPI 7=
 IRQ_TYPE_LEVEL_LOW>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   336  	};
af16b00578a7a1 Rajendra Nayak 2023-12-05   337 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   338  	psci {
af16b00578a7a1 Rajendra Nayak 2023-12-05   339  		compatible =3D "arm,psci-=
1.0";
af16b00578a7a1 Rajendra Nayak 2023-12-05   340  		method =3D "smc";
af16b00578a7a1 Rajendra Nayak 2023-12-05   341 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   342  		CPU_PD0: power-domain-cpu=
0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   343  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   344  			power-domains =3D <&CLUS=
TER_PD0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   345  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   346 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   347  		CPU_PD1: power-domain-cpu=
1 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   348  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   349  			power-domains =3D <&CLUS=
TER_PD0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   350  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   351 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   352  		CPU_PD2: power-domain-cpu=
2 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   353  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   354  			power-domains =3D <&CLUS=
TER_PD0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   355  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   356 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   357  		CPU_PD3: power-domain-cpu=
3 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   358  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   359  			power-domains =3D <&CLUS=
TER_PD0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   360  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   361 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   362  		CPU_PD4: power-domain-cpu=
4 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   363  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   364  			power-domains =3D <&CLUS=
TER_PD1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   365  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   366 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   367  		CPU_PD5: power-domain-cpu=
5 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   368  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   369  			power-domains =3D <&CLUS=
TER_PD1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   370  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   371 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   372  		CPU_PD6: power-domain-cpu=
6 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   373  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   374  			power-domains =3D <&CLUS=
TER_PD1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   375  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   376 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   377  		CPU_PD7: power-domain-cpu=
7 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   378  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   379  			power-domains =3D <&CLUS=
TER_PD1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   380  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   381 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   382  		CPU_PD8: power-domain-cpu=
8 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   383  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   384  			power-domains =3D <&CLUS=
TER_PD2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   385  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   386 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   387  		CPU_PD9: power-domain-cpu=
9 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   388  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   389  			power-domains =3D <&CLUS=
TER_PD2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   390  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   391 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   392  		CPU_PD10: power-domain-cp=
u10 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   393  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   394  			power-domains =3D <&CLUS=
TER_PD2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   395  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   396 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   397  		CPU_PD11: power-domain-cp=
u11 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   398  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   399  			power-domains =3D <&CLUS=
TER_PD2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   400  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   401 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   402  		CLUSTER_PD0: power-domain=
-cpu-cluster0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   403  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   404  			domain-idle-states =3D <=
&CLUSTER_CL4>, <&CLUSTER_CL5>;
f33767e3cfa5d4 Konrad Dybcio  2024-01-02   405  			power-domains =3D <&SYST=
EM_PD>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   406  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   407 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   408  		CLUSTER_PD1: power-domain=
-cpu-cluster1 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   409  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   410  			domain-idle-states =3D <=
&CLUSTER_CL4>, <&CLUSTER_CL5>;
f33767e3cfa5d4 Konrad Dybcio  2024-01-02   411  			power-domains =3D <&SYST=
EM_PD>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   412  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   413 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   414  		CLUSTER_PD2: power-domain=
-cpu-cluster2 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   415  			#power-domain-cells =3D =
<0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   416  			domain-idle-states =3D <=
&CLUSTER_CL4>, <&CLUSTER_CL5>;
f33767e3cfa5d4 Konrad Dybcio  2024-01-02   417  			power-domains =3D <&SYST=
EM_PD>;
f33767e3cfa5d4 Konrad Dybcio  2024-01-02   418  		};
f33767e3cfa5d4 Konrad Dybcio  2024-01-02   419 =20
f33767e3cfa5d4 Konrad Dybcio  2024-01-02   420  		SYSTEM_PD: power-domain-s=
ystem {
f33767e3cfa5d4 Konrad Dybcio  2024-01-02   421  			#power-domain-cells =3D =
<0>;
f33767e3cfa5d4 Konrad Dybcio  2024-01-02   422  			/* TODO: system-wide idl=
e states */
af16b00578a7a1 Rajendra Nayak 2023-12-05   423  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   424  	};
af16b00578a7a1 Rajendra Nayak 2023-12-05   425 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   426  	reserved-memory {
af16b00578a7a1 Rajendra Nayak 2023-12-05   427  		#address-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   428  		#size-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   429  		ranges;
af16b00578a7a1 Rajendra Nayak 2023-12-05   430 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   431  		gunyah_hyp_mem: gunyah-hy=
p@80000000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   432  			reg =3D <0x0 0x80000000 =
0x0 0x800000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   433  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   434  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   435 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   436  		hyp_elf_package_mem: hyp-=
elf-package@80800000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   437  			reg =3D <0x0 0x80800000 =
0x0 0x200000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   438  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   439  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   440 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   441  		ncc_mem: ncc@80a00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   442  			reg =3D <0x0 0x80a00000 =
0x0 0x400000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   443  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   444  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   445 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   446  		cpucp_log_mem: cpucp-log@=
80e00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   447  			reg =3D <0x0 0x80e00000 =
0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   448  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   449  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   450 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   451  		cpucp_mem: cpucp@80e40000=
 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   452  			reg =3D <0x0 0x80e40000 =
0x0 0x540000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   453  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   454  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   455 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   456  		reserved-region@81380000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   457  			reg =3D <0x0 0x81380000 =
0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   458  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   459  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   460 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   461  		tags_mem: tags-region@814=
00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   462  			reg =3D <0x0 0x81400000 =
0x0 0x1a0000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   463  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   464  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   465 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   466  		xbl_dtlog_mem: xbl-dtlog@=
81a00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   467  			reg =3D <0x0 0x81a00000 =
0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   468  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   469  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   470 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   471  		xbl_ramdump_mem: xbl-ramd=
ump@81a40000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   472  			reg =3D <0x0 0x81a40000 =
0x0 0x1c0000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   473  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   474  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   475 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   476  		aop_image_mem: aop-image@=
81c00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   477  			reg =3D <0x0 0x81c00000 =
0x0 0x60000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   478  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   479  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   480 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   481  		aop_cmd_db_mem: aop-cmd-d=
b@81c60000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   482  			compatible =3D "qcom,cmd=
-db";
af16b00578a7a1 Rajendra Nayak 2023-12-05   483  			reg =3D <0x0 0x81c60000 =
0x0 0x20000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   484  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   485  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   486 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   487  		aop_config_mem: aop-confi=
g@81c80000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   488  			reg =3D <0x0 0x81c80000 =
0x0 0x20000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   489  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   490  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   491 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   492  		tme_crash_dump_mem: tme-c=
rash-dump@81ca0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   493  			reg =3D <0x0 0x81ca0000 =
0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   494  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   495  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   496 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   497  		tme_log_mem: tme-log@81ce=
0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   498  			reg =3D <0x0 0x81ce0000 =
0x0 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   499  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   500  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   501 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   502  		uefi_log_mem: uefi-log@81=
ce4000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   503  			reg =3D <0x0 0x81ce4000 =
0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   504  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   505  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   506 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   507  		secdata_apss_mem: secdata=
-apss@81cff000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   508  			reg =3D <0x0 0x81cff000 =
0x0 0x1000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   509  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   510  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   511 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   512  		pdp_ns_shared_mem: pdp-ns=
-shared@81e00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   513  			reg =3D <0x0 0x81e00000 =
0x0 0x100000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   514  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   515  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   516 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   517  		gpu_prr_mem: gpu-prr@81f0=
0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   518  			reg =3D <0x0 0x81f00000 =
0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   519  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   520  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   521 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   522  		tpm_control_mem: tpm-cont=
rol@81f10000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   523  			reg =3D <0x0 0x81f10000 =
0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   524  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   525  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   526 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   527  		usb_ucsi_shared_mem: usb-=
ucsi-shared@81f20000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   528  			reg =3D <0x0 0x81f20000 =
0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   529  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   530  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   531 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   532  		pld_pep_mem: pld-pep@81f3=
0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   533  			reg =3D <0x0 0x81f30000 =
0x0 0x6000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   534  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   535  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   536 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   537  		pld_gmu_mem: pld-gmu@81f3=
6000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   538  			reg =3D <0x0 0x81f36000 =
0x0 0x1000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   539  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   540  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   541 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   542  		pld_pdp_mem: pld-pdp@81f3=
7000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   543  			reg =3D <0x0 0x81f37000 =
0x0 0x1000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   544  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   545  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   546 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   547  		tz_stat_mem: tz-stat@8270=
0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   548  			reg =3D <0x0 0x82700000 =
0x0 0x100000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   549  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   550  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   551 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   552  		xbl_tmp_buffer_mem: xbl-t=
mp-buffer@82800000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   553  			reg =3D <0x0 0x82800000 =
0x0 0xc00000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   554  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   555  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   556 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   557  		adsp_rpc_remote_heap_mem:=
 adsp-rpc-remote-heap@84b00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   558  			reg =3D <0x0 0x84b00000 =
0x0 0x800000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   559  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   560  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   561 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   562  		spu_secure_shared_memory_=
mem: spu-secure-shared-memory@85300000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   563  			reg =3D <0x0 0x85300000 =
0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   564  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   565  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   566 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   567  		adsp_boot_dtb_mem: adsp-b=
oot-dtb@866c0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   568  			reg =3D <0x0 0x866c0000 =
0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   569  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   570  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   571 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   572  		spss_region_mem: spss-reg=
ion@86700000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   573  			reg =3D <0x0 0x86700000 =
0x0 0x400000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   574  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   575  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   576 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   577  		adsp_boot_mem: adsp-boot@=
86b00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   578  			reg =3D <0x0 0x86b00000 =
0x0 0xc00000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   579  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   580  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   581 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   582  		video_mem: video@87700000=
 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   583  			reg =3D <0x0 0x87700000 =
0x0 0x700000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   584  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   585  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   586 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   587  		adspslpi_mem: adspslpi@87=
e00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   588  			reg =3D <0x0 0x87e00000 =
0x0 0x3a00000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   589  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   590  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   591 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   592  		q6_adsp_dtb_mem: q6-adsp-=
dtb@8b800000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   593  			reg =3D <0x0 0x8b800000 =
0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   594  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   595  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   596 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   597  		cdsp_mem: cdsp@8b900000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   598  			reg =3D <0x0 0x8b900000 =
0x0 0x2000000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   599  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   600  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   601 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   602  		q6_cdsp_dtb_mem: q6-cdsp-=
dtb@8d900000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   603  			reg =3D <0x0 0x8d900000 =
0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   604  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   605  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   606 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   607  		gpu_microcode_mem: gpu-mi=
crocode@8d9fe000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   608  			reg =3D <0x0 0x8d9fe000 =
0x0 0x2000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   609  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   610  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   611 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   612  		cvp_mem: cvp@8da00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   613  			reg =3D <0x0 0x8da00000 =
0x0 0x700000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   614  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   615  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   616 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   617  		camera_mem: camera@8e1000=
00 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   618  			reg =3D <0x0 0x8e100000 =
0x0 0x800000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   619  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   620  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   621 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   622  		av1_encoder_mem: av1-enco=
der@8e900000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   623  			reg =3D <0x0 0x8e900000 =
0x0 0x700000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   624  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   625  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   626 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   627  		reserved-region@8f000000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   628  			reg =3D <0x0 0x8f000000 =
0x0 0xa00000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   629  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   630  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   631 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   632  		wpss_mem: wpss@8fa00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   633  			reg =3D <0x0 0x8fa00000 =
0x0 0x1900000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   634  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   635  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   636 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   637  		q6_wpss_dtb_mem: q6-wpss-=
dtb@91300000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   638  			reg =3D <0x0 0x91300000 =
0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   639  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   640  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   641 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   642  		xbl_sc_mem: xbl-sc@d80000=
00 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   643  			reg =3D <0x0 0xd8000000 =
0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   644  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   645  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   646 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   647  		reserved-region@d8040000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   648  			reg =3D <0x0 0xd8040000 =
0x0 0xa0000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   649  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   650  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   651 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   652  		qtee_mem: qtee@d80e0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   653  			reg =3D <0x0 0xd80e0000 =
0x0 0x520000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   654  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   655  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   656 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   657  		ta_mem: ta@d8600000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   658  			reg =3D <0x0 0xd8600000 =
0x0 0x8a00000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   659  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   660  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   661 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   662  		tags_mem1: tags@e1000000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   663  			reg =3D <0x0 0xe1000000 =
0x0 0x26a0000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   664  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   665  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   666 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   667  		llcc_lpi_mem: llcc-lpi@ff=
800000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   668  			reg =3D <0x0 0xff800000 =
0x0 0x600000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   669  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   670  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   671 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   672  		smem_mem: smem@ffe00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   673  			compatible =3D "qcom,sme=
m";
af16b00578a7a1 Rajendra Nayak 2023-12-05   674  			reg =3D <0x0 0xffe00000 =
0x0 0x200000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   675  			hwlocks =3D <&tcsr_mutex=
 3>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   676  			no-map;
af16b00578a7a1 Rajendra Nayak 2023-12-05   677  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   678  	};
af16b00578a7a1 Rajendra Nayak 2023-12-05   679 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   680  	smp2p-adsp {
0b6ae7364b1133 Sibi Sankar    2024-01-29   681  		compatible =3D "qcom,smp2=
p";
0b6ae7364b1133 Sibi Sankar    2024-01-29   682 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   683  		interrupts-extended =3D <=
&ipcc IPCC_CLIENT_LPASS
0b6ae7364b1133 Sibi Sankar    2024-01-29   684  					     IPCC_MPROC_SIGNAL=
_SMP2P
0b6ae7364b1133 Sibi Sankar    2024-01-29   685  					     IRQ_TYPE_EDGE_RIS=
ING>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   686 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   687  		mboxes =3D <&ipcc IPCC_CL=
IENT_LPASS
0b6ae7364b1133 Sibi Sankar    2024-01-29   688  				IPCC_MPROC_SIGNAL_SMP2P=
>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   689 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   690  		qcom,smem =3D <443>, <429=
>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   691  		qcom,local-pid =3D <0>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   692  		qcom,remote-pid =3D <2>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   693 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   694  		smp2p_adsp_out: master-ke=
rnel {
0b6ae7364b1133 Sibi Sankar    2024-01-29   695  			qcom,entry-name =3D "mas=
ter-kernel";
0b6ae7364b1133 Sibi Sankar    2024-01-29   696  			#qcom,smem-state-cells =
=3D <1>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   697  		};
0b6ae7364b1133 Sibi Sankar    2024-01-29   698 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   699  		smp2p_adsp_in: slave-kern=
el {
0b6ae7364b1133 Sibi Sankar    2024-01-29   700  			qcom,entry-name =3D "sla=
ve-kernel";
0b6ae7364b1133 Sibi Sankar    2024-01-29   701  			interrupt-controller;
0b6ae7364b1133 Sibi Sankar    2024-01-29   702  			#interrupt-cells =3D <2>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   703  		};
0b6ae7364b1133 Sibi Sankar    2024-01-29   704  	};
0b6ae7364b1133 Sibi Sankar    2024-01-29   705 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   706  	smp2p-cdsp {
0b6ae7364b1133 Sibi Sankar    2024-01-29   707  		compatible =3D "qcom,smp2=
p";
0b6ae7364b1133 Sibi Sankar    2024-01-29   708 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   709  		interrupts-extended =3D <=
&ipcc IPCC_CLIENT_CDSP
0b6ae7364b1133 Sibi Sankar    2024-01-29   710  					     IPCC_MPROC_SIGNAL=
_SMP2P
0b6ae7364b1133 Sibi Sankar    2024-01-29   711  					     IRQ_TYPE_EDGE_RIS=
ING>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   712 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   713  		mboxes =3D <&ipcc IPCC_CL=
IENT_CDSP
0b6ae7364b1133 Sibi Sankar    2024-01-29   714  				IPCC_MPROC_SIGNAL_SMP2P=
>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   715 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   716  		qcom,smem =3D <94>, <432>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   717  		qcom,local-pid =3D <0>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   718  		qcom,remote-pid =3D <5>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   719 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   720  		smp2p_cdsp_out: master-ke=
rnel {
0b6ae7364b1133 Sibi Sankar    2024-01-29   721  			qcom,entry-name =3D "mas=
ter-kernel";
0b6ae7364b1133 Sibi Sankar    2024-01-29   722  			#qcom,smem-state-cells =
=3D <1>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   723  		};
0b6ae7364b1133 Sibi Sankar    2024-01-29   724 =20
0b6ae7364b1133 Sibi Sankar    2024-01-29   725  		smp2p_cdsp_in: slave-kern=
el {
0b6ae7364b1133 Sibi Sankar    2024-01-29   726  			qcom,entry-name =3D "sla=
ve-kernel";
0b6ae7364b1133 Sibi Sankar    2024-01-29   727  			interrupt-controller;
0b6ae7364b1133 Sibi Sankar    2024-01-29   728  			#interrupt-cells =3D <2>;
0b6ae7364b1133 Sibi Sankar    2024-01-29   729  		};
0b6ae7364b1133 Sibi Sankar    2024-01-29   730  	};
0b6ae7364b1133 Sibi Sankar    2024-01-29   731 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   732  	soc: soc@0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   733  		compatible =3D "simple-bu=
s";
af16b00578a7a1 Rajendra Nayak 2023-12-05   734 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   735  		#address-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   736  		#size-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   737  		dma-ranges =3D <0 0 0 0 0=
x10 0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   738  		ranges =3D <0 0 0 0 0x10 =
0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   739 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   740  		gcc: clock-controller@100=
000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   741  			compatible =3D "qcom,x1e=
80100-gcc";
af16b00578a7a1 Rajendra Nayak 2023-12-05   742  			reg =3D <0 0x00100000 0 =
0x200000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   743 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   744  			clocks =3D <&bi_tcxo_div=
2>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   745  				 <&sleep_clk>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   746  				 <0>,
5eb83fc10289db Abel Vesa      2024-01-29   747  				 <&pcie4_phy>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   748  				 <0>,
5eb83fc10289db Abel Vesa      2024-01-29   749  				 <&pcie6a_phy>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   750  				 <0>,
4af46b7bd66fa3 Abel Vesa      2024-01-29   751  				 <&usb_1_ss0_qmpphy QMP=
_USB43DP_USB3_PIPE_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29   752  				 <&usb_1_ss1_qmpphy QMP=
_USB43DP_USB3_PIPE_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29   753  				 <&usb_1_ss2_qmpphy QMP=
_USB43DP_USB3_PIPE_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   754 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   755  			power-domains =3D <&rpmh=
pd RPMHPD_CX>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   756  			#clock-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   757  			#reset-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   758  			#power-domain-cells =3D =
<1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   759  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   760 =20
6a07a4f3f509c3 Sibi Sankar    2024-01-29   761  		ipcc: mailbox@408000 {
6a07a4f3f509c3 Sibi Sankar    2024-01-29   762  			compatible =3D "qcom,x1e=
80100-ipcc", "qcom,ipcc";
6a07a4f3f509c3 Sibi Sankar    2024-01-29   763  			reg =3D <0 0x00408000 0 =
0x1000>;
6a07a4f3f509c3 Sibi Sankar    2024-01-29   764 =20
6a07a4f3f509c3 Sibi Sankar    2024-01-29   765  			interrupts =3D <GIC_SPI =
229 IRQ_TYPE_LEVEL_HIGH>;
6a07a4f3f509c3 Sibi Sankar    2024-01-29   766  			interrupt-controller;
6a07a4f3f509c3 Sibi Sankar    2024-01-29   767  			#interrupt-cells =3D <3>;
6a07a4f3f509c3 Sibi Sankar    2024-01-29   768 =20
6a07a4f3f509c3 Sibi Sankar    2024-01-29   769  			#mbox-cells =3D <2>;
6a07a4f3f509c3 Sibi Sankar    2024-01-29   770  		};
6a07a4f3f509c3 Sibi Sankar    2024-01-29   771 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   772  		gpi_dma2: dma-controller@=
800000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   773  			compatible =3D "qcom,x1e=
80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1 Rajendra Nayak 2023-12-05   774  			reg =3D <0 0x00800000 0 =
0x60000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   775 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   776  			interrupts =3D <GIC_SPI =
788 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   777  				     <GIC_SPI 789 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   778  				     <GIC_SPI 790 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   779  				     <GIC_SPI 791 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   780  				     <GIC_SPI 792 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   781  				     <GIC_SPI 793 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   782  				     <GIC_SPI 794 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   783  				     <GIC_SPI 795 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   784  				     <GIC_SPI 796 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   785  				     <GIC_SPI 797 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   786  				     <GIC_SPI 798 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   787  				     <GIC_SPI 799 IRQ_T=
YPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   788 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   789  			dma-channels =3D <12>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   790  			dma-channel-mask =3D <0x=
3e>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   791  			#dma-cells =3D <3>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   792 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   793  			iommus =3D <&apps_smmu 0=
x436 0x0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   794 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   795  			status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05   796  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05   797 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   798  		qupv3_2: geniqup@8c0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   799  			compatible =3D "qcom,gen=
i-se-qup";
af16b00578a7a1 Rajendra Nayak 2023-12-05   800  			reg =3D <0 0x008c0000 0 =
0x2000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   801 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   802  			clocks =3D <&gcc GCC_QUP=
V3_WRAP_2_M_AHB_CLK>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   803  				 <&gcc GCC_QUPV3_WRAP_2=
_S_AHB_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   804  			clock-names =3D "m-ahb",
af16b00578a7a1 Rajendra Nayak 2023-12-05   805  				      "s-ahb";
af16b00578a7a1 Rajendra Nayak 2023-12-05   806 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   807  			iommus =3D <&apps_smmu 0=
x423 0x0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   808 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   809  			#address-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   810  			#size-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   811  			ranges;
af16b00578a7a1 Rajendra Nayak 2023-12-05   812 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   813  			status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05   814 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   815  			i2c16: i2c@880000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   816  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05   817  				reg =3D <0 0x00880000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   818 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   819  				interrupts =3D <GIC_SPI=
 808 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   820 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   821  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S0_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   822  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05   823 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   824  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   825  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   826  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   827  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   828  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   829  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   830  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05   831  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05   832  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05   833 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   834  				dmas =3D <&gpi_dma2 0 0=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   835  				       <&gpi_dma2 1 0 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   836  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05   837  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05   838 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   839  				pinctrl-0 =3D <&qup_i2c=
16_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   840  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05   841 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   842  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   843  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   844 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   845  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05   846  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   847 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   848  			spi16: spi@880000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   849  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05   850  				reg =3D <0 0x00880000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   851 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   852  				interrupts =3D <GIC_SPI=
 808 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   853 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   854  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S0_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   855  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05   856 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   857  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   858  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   859  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   860  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   861  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   862  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   863  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05   864  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05   865  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05   866 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   867  				dmas =3D <&gpi_dma2 0 0=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   868  				       <&gpi_dma2 1 0 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   869  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05   870  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05   871 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   872  				pinctrl-0 =3D <&qup_spi=
16_data_clk>, <&qup_spi16_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   873  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05   874 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   875  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   876  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   877 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   878  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05   879  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   880 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   881  			i2c17: i2c@884000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   882  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05   883  				reg =3D <0 0x00884000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   884 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   885  				interrupts =3D <GIC_SPI=
 809 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   886 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   887  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S1_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   888  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05   889 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   890  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   891  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   892  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   893  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   894  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   895  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   896  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05   897  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05   898  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05   899 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   900  				dmas =3D <&gpi_dma2 0 1=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   901  				       <&gpi_dma2 1 1 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   902  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05   903  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05   904 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   905  				pinctrl-0 =3D <&qup_i2c=
17_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   906  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05   907 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   908  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   909  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   910 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   911  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05   912  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   913 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   914  			spi17: spi@884000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   915  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05   916  				reg =3D <0 0x00884000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   917 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   918  				interrupts =3D <GIC_SPI=
 809 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   919 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   920  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S1_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   921  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05   922 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   923  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   924  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   925  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   926  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   927  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   928  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   929  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05   930  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05   931  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05   932 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   933  				dmas =3D <&gpi_dma2 0 1=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   934  				       <&gpi_dma2 1 1 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   935  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05   936  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05   937 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   938  				pinctrl-0 =3D <&qup_spi=
17_data_clk>, <&qup_spi17_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   939  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05   940 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   941  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   942  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   943 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   944  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05   945  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   946 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   947  			i2c18: i2c@888000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   948  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05   949  				reg =3D <0 0x00888000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   950 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   951  				interrupts =3D <GIC_SPI=
 810 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   952 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   953  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S2_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   954  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05   955 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   956  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   957  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   958  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   959  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   960  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   961  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   962  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05   963  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05   964  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05   965 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   966  				dmas =3D <&gpi_dma2 0 2=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   967  				       <&gpi_dma2 1 2 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   968  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05   969  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05   970 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   971  				pinctrl-0 =3D <&qup_i2c=
18_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   972  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05   973 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   974  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   975  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   976 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   977  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05   978  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05   979 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   980  			spi18: spi@888000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05   981  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05   982  				reg =3D <0 0x00888000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   983 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   984  				interrupts =3D <GIC_SPI=
 810 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   985 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   986  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S2_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   987  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05   988 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   989  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   990  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   991  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   992  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05   993  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05   994  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05   995  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05   996  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05   997  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05   998 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05   999  				dmas =3D <&gpi_dma2 0 2=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1000  				       <&gpi_dma2 1 2 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1001  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1002  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1003 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1004  				pinctrl-0 =3D <&qup_spi=
18_data_clk>, <&qup_spi18_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1005  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1006 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1007  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1008  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1009 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1010  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1011  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1012 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1013  			i2c19: i2c@88c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1014  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1015  				reg =3D <0 0x0088c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1016 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1017  				interrupts =3D <GIC_SPI=
 811 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1018 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1019  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S3_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1020  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1021 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1022  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1023  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1024  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1025  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1026  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1027  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1028  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1029  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1030  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1031 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1032  				dmas =3D <&gpi_dma2 0 3=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1033  				       <&gpi_dma2 1 3 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1034  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1035  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1036 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1037  				pinctrl-0 =3D <&qup_i2c=
19_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1038  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1039 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1040  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1041  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1042 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1043  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1044  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1045 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1046  			spi19: spi@88c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1047  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1048  				reg =3D <0 0x0088c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1049 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1050  				interrupts =3D <GIC_SPI=
 811 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1051 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1052  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S3_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1053  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1054 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1055  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1056  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1057  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1058  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1059  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1060  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1061  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1062  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1063  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1064 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1065  				dmas =3D <&gpi_dma2 0 3=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1066  				       <&gpi_dma2 1 3 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1067  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1068  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1069 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1070  				pinctrl-0 =3D <&qup_spi=
19_data_clk>, <&qup_spi19_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1071  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1072 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1073  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1074  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1075 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1076  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1077  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1078 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1079  			i2c20: i2c@890000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1080  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1081  				reg =3D <0 0x00890000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1082 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1083  				interrupts =3D <GIC_SPI=
 812 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1084 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1085  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S4_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1086  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1087 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1088  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1089  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1090  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1091  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1092  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1093  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1094  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1095  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1096  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1097 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1098  				dmas =3D <&gpi_dma2 0 4=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1099  				       <&gpi_dma2 1 4 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1100  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1101  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1102 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1103  				pinctrl-0 =3D <&qup_i2c=
20_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1104  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1105 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1106  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1107  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1108 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1109  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1110  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1111 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1112  			spi20: spi@890000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1113  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1114  				reg =3D <0 0x00890000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1115 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1116  				interrupts =3D <GIC_SPI=
 812 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1117 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1118  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S4_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1119  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1120 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1121  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1122  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1123  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1124  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1125  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1126  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1127  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1128  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1129  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1130 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1131  				dmas =3D <&gpi_dma2 0 4=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1132  				       <&gpi_dma2 1 4 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1133  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1134  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1135 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1136  				pinctrl-0 =3D <&qup_spi=
20_data_clk>, <&qup_spi20_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1137  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1138 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1139  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1140  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1141 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1142  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1143  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1144 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1145  			i2c21: i2c@894000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1146  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1147  				reg =3D <0 0x00894000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1148 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1149  				interrupts =3D <GIC_SPI=
 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1150 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1151  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S5_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1152  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1153 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1154  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1155  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1156  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1157  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1158  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1159  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1160  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1161  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1162  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1163 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1164  				dmas =3D <&gpi_dma2 0 5=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1165  				       <&gpi_dma2 1 5 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1166  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1167  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1168 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1169  				pinctrl-0 =3D <&qup_i2c=
21_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1170  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1171 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1172  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1173  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1174 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1175  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1176  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1177 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1178  			spi21: spi@894000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1179  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1180  				reg =3D <0 0x00894000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1181 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1182  				interrupts =3D <GIC_SPI=
 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1183 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1184  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S5_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1185  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1186 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1187  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1188  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1189  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1190  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1191  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1192  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1193  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1194  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1195  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1196 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1197  				dmas =3D <&gpi_dma2 0 5=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1198  				       <&gpi_dma2 1 5 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1199  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1200  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1201 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1202  				pinctrl-0 =3D <&qup_spi=
21_data_clk>, <&qup_spi21_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1203  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1204 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1205  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1206  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1207 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1208  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1209  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1210 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1211  			uart21: serial@894000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1212  				compatible =3D "qcom,ge=
ni-uart";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1213  				reg =3D <0 0x00894000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1214 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1215  				interrupts =3D <GIC_SPI=
 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1216 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1217  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S5_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1218  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1219 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1220  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1221  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1222  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1223  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1224  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1225  						     "qup-config";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1226 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1227  				pinctrl-0 =3D <&qup_uar=
t21_default>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1228  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1229 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1230  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1231  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1232 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1233  			i2c22: i2c@898000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1234  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1235  				reg =3D <0 0x00898000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1236 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1237  				interrupts =3D <GIC_SPI=
 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1238 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1239  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S6_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1240  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1241 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1242  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1243  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1244  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1245  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1246  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1247  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1248  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1249  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1250  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1251 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1252  				dmas =3D <&gpi_dma2 0 6=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1253  				       <&gpi_dma2 1 6 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1254  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1255  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1256 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1257  				pinctrl-0 =3D <&qup_i2c=
22_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1258  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1259 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1260  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1261  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1262 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1263  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1264  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1265 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1266  			spi22: spi@898000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1267  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1268  				reg =3D <0 0x00898000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1269 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1270  				interrupts =3D <GIC_SPI=
 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1271 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1272  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S6_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1273  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1274 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1275  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1276  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1277  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1278  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1279  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1280  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1281  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1282  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1283  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1284 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1285  				dmas =3D <&gpi_dma2 0 6=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1286  				       <&gpi_dma2 1 6 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1287  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1288  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1289 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1290  				pinctrl-0 =3D <&qup_spi=
22_data_clk>, <&qup_spi22_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1291  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1292 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1293  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1294  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1295 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1296  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1297  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1298 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1299  			i2c23: i2c@89c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1300  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1301  				reg =3D <0 0x0089c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1302 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1303  				interrupts =3D <GIC_SPI=
 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1304 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1305  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S7_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1306  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1307 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1308  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1309  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1310  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1311  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1312  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1313  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1314  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1315  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1316  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1317 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1318  				dmas =3D <&gpi_dma2 0 7=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1319  				       <&gpi_dma2 1 7 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1320  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1321  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1322 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1323  				pinctrl-0 =3D <&qup_i2c=
23_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1324  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1325 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1326  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1327  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1328 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1329  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1330  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1331 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1332  			spi23: spi@89c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1333  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1334  				reg =3D <0 0x0089c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1335 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1336  				interrupts =3D <GIC_SPI=
 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1337 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1338  				clocks =3D <&gcc GCC_QU=
PV3_WRAP2_S7_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1339  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1340 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1341  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1342  						 &clk_virt SLAVE_QUP_=
CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1343  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1344  						 &config_noc SLAVE_QU=
P_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1345  						<&aggre2_noc MASTER_Q=
UP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1346  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1347  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1348  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1349  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1350 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1351  				dmas =3D <&gpi_dma2 0 7=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1352  				       <&gpi_dma2 1 7 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1353  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1354  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1355 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1356  				pinctrl-0 =3D <&qup_spi=
23_data_clk>, <&qup_spi23_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1357  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1358 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1359  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1360  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1361 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1362  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1363  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1364  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1365 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1366  		gpi_dma1: dma-controller@=
a00000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1367  			compatible =3D "qcom,x1e=
80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1368  			reg =3D <0 0x00a00000 0 =
0x60000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1369 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1370  			interrupts =3D <GIC_SPI =
776 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1371  				     <GIC_SPI 777 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1372  				     <GIC_SPI 778 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1373  				     <GIC_SPI 779 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1374  				     <GIC_SPI 780 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1375  				     <GIC_SPI 781 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1376  				     <GIC_SPI 782 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1377  				     <GIC_SPI 783 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1378  				     <GIC_SPI 784 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1379  				     <GIC_SPI 785 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1380  				     <GIC_SPI 786 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1381  				     <GIC_SPI 787 IRQ_T=
YPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1382 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1383  			dma-channels =3D <12>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1384  			dma-channel-mask =3D <0x=
3e>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1385  			#dma-cells =3D <3>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1386 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1387  			iommus =3D <&apps_smmu 0=
x136 0x0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1388 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1389  			status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1390  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1391 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1392  		qupv3_1: geniqup@ac0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1393  			compatible =3D "qcom,gen=
i-se-qup";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1394  			reg =3D <0 0x00ac0000 0 =
0x2000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1395 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1396  			clocks =3D <&gcc GCC_QUP=
V3_WRAP_1_M_AHB_CLK>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1397  				 <&gcc GCC_QUPV3_WRAP_1=
_S_AHB_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1398  			clock-names =3D "m-ahb",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1399  				      "s-ahb";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1400 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1401  			iommus =3D <&apps_smmu 0=
x123 0x0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1402 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1403  			#address-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1404  			#size-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1405  			ranges;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1406 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1407  			status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1408 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1409  			i2c8: i2c@a80000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1410  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1411  				reg =3D <0 0x00a80000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1412 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1413  				interrupts =3D <GIC_SPI=
 800 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1414 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1415  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S0_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1416  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1417 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1418  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1419  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1420  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1421  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1422  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1423  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1424  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1425  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1426  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1427 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1428  				dmas =3D <&gpi_dma1 0 0=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1429  				       <&gpi_dma1 1 0 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1430  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1431  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1432 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1433  				pinctrl-0 =3D <&qup_i2c=
8_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1434  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1435 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1436  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1437  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1438 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1439  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1440  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1441 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1442  			spi8: spi@a80000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1443  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1444  				reg =3D <0 0x00a80000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1445 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1446  				interrupts =3D <GIC_SPI=
 800 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1447 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1448  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S0_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1449  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1450 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1451  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1452  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1453  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1454  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1455  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1456  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1457  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1458  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1459  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1460 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1461  				dmas =3D <&gpi_dma1 0 0=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1462  				       <&gpi_dma1 1 0 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1463  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1464  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1465 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1466  				pinctrl-0 =3D <&qup_spi=
8_data_clk>, <&qup_spi8_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1467  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1468 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1469  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1470  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1471 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1472  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1473  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1474 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1475  			i2c9: i2c@a84000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1476  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1477  				reg =3D <0 0x00a84000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1478 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1479  				interrupts =3D <GIC_SPI=
 801 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1480 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1481  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S1_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1482  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1483 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1484  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1485  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1486  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1487  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1488  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1489  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1490  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1491  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1492  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1493 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1494  				dmas =3D <&gpi_dma1 0 1=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1495  				       <&gpi_dma1 1 1 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1496  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1497  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1498 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1499  				pinctrl-0 =3D <&qup_i2c=
9_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1500  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1501 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1502  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1503  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1504 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1505  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1506  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1507 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1508  			spi9: spi@a84000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1509  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1510  				reg =3D <0 0x00a84000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1511 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1512  				interrupts =3D <GIC_SPI=
 801 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1513 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1514  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S1_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1515  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1516 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1517  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1518  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1519  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1520  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1521  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1522  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1523  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1524  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1525  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1526 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1527  				dmas =3D <&gpi_dma1 0 1=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1528  				       <&gpi_dma1 1 1 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1529  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1530  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1531 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1532  				pinctrl-0 =3D <&qup_spi=
9_data_clk>, <&qup_spi9_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1533  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1534 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1535  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1536  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1537 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1538  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1539  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1540 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1541  			i2c10: i2c@a88000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1542  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1543  				reg =3D <0 0x00a88000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1544 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1545  				interrupts =3D <GIC_SPI=
 802 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1546 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1547  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S2_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1548  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1549 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1550  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1551  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1552  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1553  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1554  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1555  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1556  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1557  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1558  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1559 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1560  				dmas =3D <&gpi_dma1 0 2=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1561  				       <&gpi_dma1 1 2 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1562  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1563  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1564 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1565  				pinctrl-0 =3D <&qup_i2c=
10_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1566  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1567 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1568  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1569  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1570 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1571  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1572  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1573 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1574  			spi10: spi@a88000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1575  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1576  				reg =3D <0 0x00a88000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1577 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1578  				interrupts =3D <GIC_SPI=
 802 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1579 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1580  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S2_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1581  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1582 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1583  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1584  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1585  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1586  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1587  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1588  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1589  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1590  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1591  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1592 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1593  				dmas =3D <&gpi_dma1 0 2=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1594  				       <&gpi_dma1 1 2 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1595  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1596  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1597 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1598  				pinctrl-0 =3D <&qup_spi=
10_data_clk>, <&qup_spi10_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1599  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1600 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1601  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1602  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1603 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1604  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1605  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1606 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1607  			i2c11: i2c@a8c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1608  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1609  				reg =3D <0 0x00a8c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1610 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1611  				interrupts =3D <GIC_SPI=
 803 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1612 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1613  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S3_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1614  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1615 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1616  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1617  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1618  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1619  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1620  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1621  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1622  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1623  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1624  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1625 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1626  				dmas =3D <&gpi_dma1 0 3=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1627  				       <&gpi_dma1 1 3 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1628  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1629  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1630 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1631  				pinctrl-0 =3D <&qup_i2c=
11_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1632  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1633 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1634  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1635  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1636 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1637  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1638  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1639 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1640  			spi11: spi@a8c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1641  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1642  				reg =3D <0 0x00a8c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1643 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1644  				interrupts =3D <GIC_SPI=
 803 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1645 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1646  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S3_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1647  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1648 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1649  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1650  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1651  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1652  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1653  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1654  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1655  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1656  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1657  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1658 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1659  				dmas =3D <&gpi_dma1 0 3=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1660  				       <&gpi_dma1 1 3 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1661  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1662  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1663 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1664  				pinctrl-0 =3D <&qup_spi=
11_data_clk>, <&qup_spi11_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1665  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1666 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1667  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1668  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1669 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1670  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1671  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1672 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1673  			i2c12: i2c@a90000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1674  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1675  				reg =3D <0 0x00a90000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1676 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1677  				interrupts =3D <GIC_SPI=
 804 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1678 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1679  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S4_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1680  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1681 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1682  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1683  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1684  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1685  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1686  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1687  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1688  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1689  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1690  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1691 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1692  				dmas =3D <&gpi_dma1 0 4=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1693  				       <&gpi_dma1 1 4 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1694  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1695  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1696 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1697  				pinctrl-0 =3D <&qup_i2c=
12_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1698  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1699 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1700  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1701  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1702 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1703  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1704  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1705 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1706  			spi12: spi@a90000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1707  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1708  				reg =3D <0 0x00a90000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1709 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1710  				interrupts =3D <GIC_SPI=
 804 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1711 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1712  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S4_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1713  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1714 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1715  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1716  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1717  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1718  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1719  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1720  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1721  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1722  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1723  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1724 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1725  				dmas =3D <&gpi_dma1 0 4=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1726  				       <&gpi_dma1 1 4 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1727  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1728  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1729 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1730  				pinctrl-0 =3D <&qup_spi=
12_data_clk>, <&qup_spi12_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1731  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1732 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1733  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1734  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1735 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1736  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1737  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1738 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1739  			i2c13: i2c@a94000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1740  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1741  				reg =3D <0 0x00a94000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1742 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1743  				interrupts =3D <GIC_SPI=
 805 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1744 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1745  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S5_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1746  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1747 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1748  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1749  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1750  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1751  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1752  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1753  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1754  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1755  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1756  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1757 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1758  				dmas =3D <&gpi_dma1 0 5=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1759  				       <&gpi_dma1 1 5 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1760  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1761  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1762 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1763  				pinctrl-0 =3D <&qup_i2c=
13_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1764  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1765 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1766  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1767  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1768 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1769  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1770  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1771 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1772  			spi13: spi@a94000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1773  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1774  				reg =3D <0 0x00a94000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1775 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1776  				interrupts =3D <GIC_SPI=
 805 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1777 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1778  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S5_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1779  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1780 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1781  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1782  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1783  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1784  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1785  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1786  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1787  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1788  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1789  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1790 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1791  				dmas =3D <&gpi_dma1 0 5=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1792  				       <&gpi_dma1 1 5 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1793  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1794  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1795 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1796  				pinctrl-0 =3D <&qup_spi=
13_data_clk>, <&qup_spi13_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1797  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1798 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1799  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1800  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1801 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1802  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1803  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1804 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1805  			i2c14: i2c@a98000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1806  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1807  				reg =3D <0 0x00a98000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1808 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1809  				interrupts =3D <GIC_SPI=
 806 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1810 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1811  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S6_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1812  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1813 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1814  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1815  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1816  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1817  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1818  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1819  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1820  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1821  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1822  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1823 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1824  				dmas =3D <&gpi_dma1 0 6=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1825  				       <&gpi_dma1 1 6 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1826  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1827  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1828 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1829  				pinctrl-0 =3D <&qup_i2c=
14_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1830  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1831 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1832  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1833  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1834 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1835  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1836  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1837 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1838  			spi14: spi@a98000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1839  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1840  				reg =3D <0 0x00a98000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1841 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1842  				interrupts =3D <GIC_SPI=
 806 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1843 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1844  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S6_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1845  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1846 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1847  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1848  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1849  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1850  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1851  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1852  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1853  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1854  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1855  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1856 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1857  				dmas =3D <&gpi_dma1 0 6=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1858  				       <&gpi_dma1 1 6 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1859  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1860  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1861 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1862  				pinctrl-0 =3D <&qup_spi=
14_data_clk>, <&qup_spi14_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1863  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1864 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1865  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1866  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1867 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1868  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1869  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1870 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1871  			i2c15: i2c@a9c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1872  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1873  				reg =3D <0 0x00a9c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1874 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1875  				interrupts =3D <GIC_SPI=
 807 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1876 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1877  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S7_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1878  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1879 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1880  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1881  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1882  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1883  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1884  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1885  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1886  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1887  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1888  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1889 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1890  				dmas =3D <&gpi_dma1 0 7=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1891  				       <&gpi_dma1 1 7 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1892  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1893  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1894 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1895  				pinctrl-0 =3D <&qup_i2c=
15_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1896  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1897 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1898  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1899  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1900 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1901  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1902  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1903 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1904  			spi15: spi@a9c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1905  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1906  				reg =3D <0 0x00a9c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1907 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1908  				interrupts =3D <GIC_SPI=
 807 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1909 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1910  				clocks =3D <&gcc GCC_QU=
PV3_WRAP1_S7_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1911  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1912 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1913  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1914  						 &clk_virt SLAVE_QUP_=
CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1915  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1916  						 &config_noc SLAVE_QU=
P_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1917  						<&aggre1_noc MASTER_Q=
UP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1918  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1919  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1920  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1921  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1922 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1923  				dmas =3D <&gpi_dma1 0 7=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1924  				       <&gpi_dma1 1 7 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1925  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1926  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1927 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1928  				pinctrl-0 =3D <&qup_spi=
15_data_clk>, <&qup_spi15_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1929  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1930 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1931  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1932  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1933 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1934  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1935  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1936  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1937 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1938  		gpi_dma0: dma-controller@=
b00000  {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1939  			compatible =3D "qcom,x1e=
80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1940  			reg =3D <0 0x00b00000 0 =
0x60000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1941 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1942  			interrupts =3D <GIC_SPI =
588 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1943  				     <GIC_SPI 589 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1944  				     <GIC_SPI 590 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1945  				     <GIC_SPI 591 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1946  				     <GIC_SPI 592 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1947  				     <GIC_SPI 593 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1948  				     <GIC_SPI 594 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1949  				     <GIC_SPI 595 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1950  				     <GIC_SPI 596 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1951  				     <GIC_SPI 597 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1952  				     <GIC_SPI 598 IRQ_T=
YPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1953  				     <GIC_SPI 599 IRQ_T=
YPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1954 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1955  			dma-channels =3D <12>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1956  			dma-channel-mask =3D <0x=
3e>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1957  			#dma-cells =3D <3>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1958 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1959  			iommus =3D <&apps_smmu 0=
x456 0x0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1960 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1961  			status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1962  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  1963 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1964  		qupv3_0: geniqup@bc0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1965  			compatible =3D "qcom,gen=
i-se-qup";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1966  			reg =3D <0 0x00bc0000 0 =
0x2000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1967 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1968  			clocks =3D <&gcc GCC_QUP=
V3_WRAP_0_M_AHB_CLK>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1969  				 <&gcc GCC_QUPV3_WRAP_0=
_S_AHB_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1970  			clock-names =3D "m-ahb",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1971  				      "s-ahb";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1972 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1973  			iommus =3D <&apps_smmu 0=
x443 0x0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1974  			#address-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1975  			#size-cells =3D <2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1976  			ranges;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1977 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1978  			status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1979 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1980  			i2c0: i2c@b80000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  1981  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1982  				reg =3D <0 0xb80000 0 0=
x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1983 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1984  				interrupts =3D <GIC_SPI=
 373 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1985 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1986  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S0_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1987  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1988 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1989  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1990  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1991  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1992  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  1993  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  1994  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  1995  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1996  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  1997  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  1998 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  1999  				dmas =3D <&gpi_dma0 0 0=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2000  				       <&gpi_dma0 1 0 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2001  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2002  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2003 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2004  				pinctrl-0 =3D <&qup_i2c=
0_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2005  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2006 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2007  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2008  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2009 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2010  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2011  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2012 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2013  			spi0: spi@b80000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2014  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2015  				reg =3D <0 0x00b80000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2016 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2017  				interrupts =3D <GIC_SPI=
 373 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2018 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2019  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S0_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2020  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2021 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2022  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2023  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2024  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2025  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2026  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2027  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2028  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2029  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2030  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2031 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2032  				dmas =3D <&gpi_dma0 0 0=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2033  				       <&gpi_dma0 1 0 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2034  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2035  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2036 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2037  				pinctrl-0 =3D <&qup_spi=
0_data_clk>, <&qup_spi0_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2038  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2039 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2040  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2041  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2042 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2043  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2044  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2045 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2046  			i2c1: i2c@b84000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2047  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2048  				reg =3D <0 0x00b84000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2049 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2050  				interrupts =3D <GIC_SPI=
 583 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2051 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2052  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S1_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2053  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2054 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2055  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2056  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2057  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2058  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2059  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2060  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2061  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2062  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2063  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2064 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2065  				dmas =3D <&gpi_dma0 0 1=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2066  				       <&gpi_dma0 1 1 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2067  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2068  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2069 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2070  				pinctrl-0 =3D <&qup_i2c=
1_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2071  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2072 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2073  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2074  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2075 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2076  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2077  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2078 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2079  			spi1: spi@b84000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2080  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2081  				reg =3D <0 0x00b84000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2082 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2083  				interrupts =3D <GIC_SPI=
 583 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2084 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2085  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S1_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2086  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2087 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2088  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2089  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2090  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2091  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2092  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2093  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2094  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2095  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2096  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2097 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2098  				dmas =3D <&gpi_dma0 0 1=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2099  				       <&gpi_dma0 1 1 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2100  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2101  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2102 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2103  				pinctrl-0 =3D <&qup_spi=
1_data_clk>, <&qup_spi1_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2104  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2105 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2106  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2107  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2108 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2109  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2110  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2111 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2112  			i2c2: i2c@b88000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2113  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2114  				reg =3D <0 0x00b88000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2115 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2116  				interrupts =3D <GIC_SPI=
 584 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2117 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2118  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S2_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2119  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2120 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2121  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2122  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2123  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2124  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2125  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2126  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2127  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2128  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2129  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2130 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2131  				dmas =3D <&gpi_dma0 0 2=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2132  				       <&gpi_dma0 1 2 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2133  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2134  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2135 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2136  				pinctrl-0 =3D <&qup_i2c=
2_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2137  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2138 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2139  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2140  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2141 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2142  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2143  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2144 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2145  			spi2: spi@b88000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2146  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2147  				reg =3D <0 0xb88000 0 0=
x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2148 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2149  				interrupts =3D <GIC_SPI=
 584 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2150 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2151  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S2_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2152  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2153 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2154  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2155  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2156  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2157  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2158  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2159  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2160  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2161  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2162  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2163 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2164  				dmas =3D <&gpi_dma0 0 2=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2165  				       <&gpi_dma0 1 2 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2166  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2167  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2168 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2169  				pinctrl-0 =3D <&qup_spi=
2_data_clk>, <&qup_spi2_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2170  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2171 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2172  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2173  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2174 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2175  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2176  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2177 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2178  			i2c3: i2c@b8c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2179  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2180  				reg =3D <0 0x00b8c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2181 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2182  				interrupts =3D <GIC_SPI=
 585 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2183 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2184  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S3_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2185  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2186 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2187  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2188  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2189  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2190  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2191  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2192  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2193  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2194  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2195  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2196 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2197  				dmas =3D <&gpi_dma0 0 3=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2198  				       <&gpi_dma0 1 3 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2199  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2200  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2201 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2202  				pinctrl-0 =3D <&qup_i2c=
3_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2203  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2204 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2205  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2206  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2207 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2208  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2209  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2210 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2211  			spi3: spi@b8c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2212  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2213  				reg =3D <0 0x00b8c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2214 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2215  				interrupts =3D <GIC_SPI=
 585 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2216 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2217  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S3_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2218  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2219 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2220  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2221  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2222  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2223  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2224  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2225  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2226  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2227  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2228  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2229 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2230  				dmas =3D <&gpi_dma0 0 3=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2231  				       <&gpi_dma0 1 3 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2232  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2233  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2234 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2235  				pinctrl-0 =3D <&qup_spi=
3_data_clk>, <&qup_spi3_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2236  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2237 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2238  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2239  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2240 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2241  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2242  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2243 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2244  			i2c4: i2c@b90000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2245  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2246  				reg =3D <0 0xb90000 0 0=
x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2247 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2248  				interrupts =3D <GIC_SPI=
 586 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2249 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2250  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S4_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2251  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2252 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2253  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2254  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2255  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2256  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2257  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2258  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2259  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2260  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2261  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2262 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2263  				dmas =3D <&gpi_dma0 0 4=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2264  				       <&gpi_dma0 1 4 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2265  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2266  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2267 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2268  				pinctrl-0 =3D <&qup_i2c=
4_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2269  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2270 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2271  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2272  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2273 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2274  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2275  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2276 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2277  			spi4: spi@b90000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2278  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2279  				reg =3D <0 0x00b90000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2280 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2281  				interrupts =3D <GIC_SPI=
 586 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2282 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2283  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S4_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2284  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2285 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2286  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2287  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2288  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2289  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2290  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2291  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2292  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2293  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2294  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2295 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2296  				dmas =3D <&gpi_dma0 0 4=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2297  				       <&gpi_dma0 1 4 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2298  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2299  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2300 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2301  				pinctrl-0 =3D <&qup_spi=
4_data_clk>, <&qup_spi4_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2302  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2303 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2304  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2305  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2306 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2307  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2308  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2309 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2310  			i2c5: i2c@b94000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2311  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2312  				reg =3D <0 0x00b94000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2313 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2314  				interrupts =3D <GIC_SPI=
 587 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2315 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2316  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S5_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2317  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2318 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2319  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2320  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2321  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2322  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2323  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2324  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2325  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2326  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2327  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2328 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2329  				dmas =3D <&gpi_dma0 0 5=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2330  				       <&gpi_dma0 1 5 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2331  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2332  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2333 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2334  				pinctrl-0 =3D <&qup_i2c=
5_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2335  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2336 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2337  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2338  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2339 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2340  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2341  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2342 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2343  			spi5: spi@b94000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2344  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2345  				reg =3D <0 0x00b94000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2346 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2347  				interrupts =3D <GIC_SPI=
 587 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2348 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2349  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S5_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2350  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2351 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2352  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2353  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2354  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2355  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2356  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2357  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2358  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2359  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2360  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2361 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2362  				dmas =3D <&gpi_dma0 0 5=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2363  				       <&gpi_dma0 1 5 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2364  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2365  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2366 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2367  				pinctrl-0 =3D <&qup_spi=
5_data_clk>, <&qup_spi5_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2368  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2369 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2370  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2371  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2372 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2373  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2374  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2375 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2376  			i2c6: i2c@b98000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2377  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2378  				reg =3D <0 0x00b98000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2379 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2380  				interrupts =3D <GIC_SPI=
 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2381 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2382  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S6_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2383  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2384 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2385  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2386  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2387  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2388  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2389  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2390  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2391  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2392  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2393  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2394 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2395  				dmas =3D <&gpi_dma0 0 6=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2396  				       <&gpi_dma0 1 6 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2397  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2398  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2399 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2400  				pinctrl-0 =3D <&qup_i2c=
6_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2401  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2402 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2403  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2404  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2405 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2406  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2407  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2408 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2409  			spi6: spi@b98000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2410  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2411  				reg =3D <0 0x00b98000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2412 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2413  				interrupts =3D <GIC_SPI=
 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2414 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2415  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S6_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2416  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2417 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2418  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2419  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2420  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2421  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2422  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2423  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2424  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2425  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2426  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2427 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2428  				dmas =3D <&gpi_dma0 0 6=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2429  				       <&gpi_dma0 1 6 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2430  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2431  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2432 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2433  				pinctrl-0 =3D <&qup_spi=
6_data_clk>, <&qup_spi6_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2434  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2435 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2436  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2437  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2438 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2439  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2440  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2441 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2442  			i2c7: i2c@b9c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2443  				compatible =3D "qcom,ge=
ni-i2c";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2444  				reg =3D <0 0x00b9c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2445 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2446  				interrupts =3D <GIC_SPI=
 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2447 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2448  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S7_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2449  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2450 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2451  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2452  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2453  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2454  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2455  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2456  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2457  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2458  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2459  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2460 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2461  				dmas =3D <&gpi_dma0 0 7=
 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2462  				       <&gpi_dma0 1 7 Q=
COM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2463  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2464  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2465 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2466  				pinctrl-0 =3D <&qup_i2c=
7_data_clk>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2467  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2468 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2469  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2470  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2471 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2472  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2473  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2474 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2475  			spi7: spi@b9c000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2476  				compatible =3D "qcom,ge=
ni-spi";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2477  				reg =3D <0 0x00b9c000 0=
 0x4000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2478 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2479  				interrupts =3D <GIC_SPI=
 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2480 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2481  				clocks =3D <&gcc GCC_QU=
PV3_WRAP0_S7_CLK>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2482  				clock-names =3D "se";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2483 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2484  				interconnects =3D <&clk=
_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2485  						 &clk_virt SLAVE_QUP_=
CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2486  						<&gem_noc MASTER_APPS=
S_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2487  						 &config_noc SLAVE_QU=
P_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2488  						<&aggre2_noc MASTER_Q=
UP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak 2023-12-05  2489  						 &mc_virt SLAVE_EBI1 =
QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2490  				interconnect-names =3D =
"qup-core",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2491  						     "qup-config",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2492  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2493 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2494  				dmas =3D <&gpi_dma0 0 7=
 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak 2023-12-05  2495  				       <&gpi_dma0 1 7 Q=
COM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2496  				dma-names =3D "tx",
af16b00578a7a1 Rajendra Nayak 2023-12-05  2497  					    "rx";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2498 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2499  				pinctrl-0 =3D <&qup_spi=
7_data_clk>, <&qup_spi7_cs>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2500  				pinctrl-names =3D "defa=
ult";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2501 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2502  				#address-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2503  				#size-cells =3D <0>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2504 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2505  				status =3D "disabled";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2506  			};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2507  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2508 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2509  		usb_1_ss0_hsphy: phy@fd30=
00 {
4af46b7bd66fa3 Abel Vesa      2024-01-29  2510  			compatible =3D "qcom,x1e=
80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2511  				     "qcom,sm8550-snps-=
eusb2-phy";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2512  			reg =3D <0 0x00fd3000 0 =
0x154>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2513  			#phy-cells =3D <0>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2514 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2515  			clocks =3D <&tcsr TCSR_U=
SB2_1_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2516  			clock-names =3D "ref";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2517 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2518  			resets =3D <&gcc GCC_QUS=
B2PHY_PRIM_BCR>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2519 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2520  			status =3D "disabled";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2521  		};
4af46b7bd66fa3 Abel Vesa      2024-01-29  2522 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2523  		usb_1_ss0_qmpphy: phy@fd5=
000 {
4af46b7bd66fa3 Abel Vesa      2024-01-29  2524  			compatible =3D "qcom,x1e=
80100-qmp-usb3-dp-phy";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2525  			reg =3D <0 0x00fd5000 0 =
0x4000>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2526 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2527  			clocks =3D <&gcc GCC_USB=
3_PRIM_PHY_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2528  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2529  				 <&gcc GCC_USB3_PRIM_PH=
Y_COM_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2530  				 <&gcc GCC_USB3_PRIM_PH=
Y_PIPE_CLK>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2531  			clock-names =3D "aux",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2532  				      "ref",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2533  				      "com_aux",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2534  				      "usb3_pipe";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2535 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2536  			power-domains =3D <&gcc =
GCC_USB_0_PHY_GDSC>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2537 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2538  			resets =3D <&gcc GCC_USB=
3_PHY_PRIM_BCR>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2539  				 <&gcc GCC_USB4_0_DP0_P=
HY_PRIM_BCR>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2540  			reset-names =3D "phy",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2541  				      "common";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2542 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2543  			#clock-cells =3D <1>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2544  			#phy-cells =3D <1>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2545 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2546  			status =3D "disabled";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2547  		};
4af46b7bd66fa3 Abel Vesa      2024-01-29  2548 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2549  		usb_1_ss1_hsphy: phy@fd90=
00 {
4af46b7bd66fa3 Abel Vesa      2024-01-29  2550  			compatible =3D "qcom,x1e=
80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2551  				     "qcom,sm8550-snps-=
eusb2-phy";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2552  			reg =3D <0 0x00fd9000 0 =
0x154>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2553  			#phy-cells =3D <0>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2554 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2555  			clocks =3D <&tcsr TCSR_U=
SB2_1_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2556  			clock-names =3D "ref";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2557 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2558  			resets =3D <&gcc GCC_QUS=
B2PHY_SEC_BCR>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2559 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2560  			status =3D "disabled";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2561  		};
4af46b7bd66fa3 Abel Vesa      2024-01-29  2562 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2563  		usb_1_ss1_qmpphy: phy@fda=
000 {
4af46b7bd66fa3 Abel Vesa      2024-01-29  2564  			compatible =3D "qcom,x1e=
80100-qmp-usb3-dp-phy";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2565  			reg =3D <0 0x00fda000 0 =
0x4000>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2566 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2567  			clocks =3D <&gcc GCC_USB=
3_SEC_PHY_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2568  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2569  				 <&gcc GCC_USB3_SEC_PHY=
_COM_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2570  				 <&gcc GCC_USB3_SEC_PHY=
_PIPE_CLK>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2571  			clock-names =3D "aux",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2572  				      "ref",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2573  				      "com_aux",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2574  				      "usb3_pipe";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2575 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2576  			power-domains =3D <&gcc =
GCC_USB_1_PHY_GDSC>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2577 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2578  			resets =3D <&gcc GCC_USB=
3_PHY_SEC_BCR>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2579  				 <&gcc GCC_USB4_1_DP0_P=
HY_SEC_BCR>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2580  			reset-names =3D "phy",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2581  				      "common";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2582 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2583  			#clock-cells =3D <1>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2584  			#phy-cells =3D <1>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2585 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2586  			status =3D "disabled";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2587  		};
4af46b7bd66fa3 Abel Vesa      2024-01-29  2588 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2589  		usb_1_ss2_hsphy: phy@fde0=
00 {
4af46b7bd66fa3 Abel Vesa      2024-01-29  2590  			compatible =3D "qcom,x1e=
80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2591  				     "qcom,sm8550-snps-=
eusb2-phy";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2592  			reg =3D <0 0x00fde000 0 =
0x154>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2593  			#phy-cells =3D <0>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2594 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2595  			clocks =3D <&tcsr TCSR_U=
SB2_1_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2596  			clock-names =3D "ref";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2597 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2598  			resets =3D <&gcc GCC_QUS=
B2PHY_TERT_BCR>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2599 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2600  			status =3D "disabled";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2601  		};
4af46b7bd66fa3 Abel Vesa      2024-01-29  2602 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2603  		usb_1_ss2_qmpphy: phy@fdf=
000 {
4af46b7bd66fa3 Abel Vesa      2024-01-29  2604  			compatible =3D "qcom,x1e=
80100-qmp-usb3-dp-phy";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2605  			reg =3D <0 0x00fdf000 0 =
0x4000>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2606 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2607  			clocks =3D <&gcc GCC_USB=
3_TERT_PHY_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2608  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2609  				 <&gcc GCC_USB3_TERT_PH=
Y_COM_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2610  				 <&gcc GCC_USB3_TERT_PH=
Y_PIPE_CLK>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2611  			clock-names =3D "aux",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2612  				      "ref",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2613  				      "com_aux",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2614  				      "usb3_pipe";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2615 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2616  			power-domains =3D <&gcc =
GCC_USB_2_PHY_GDSC>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2617 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2618  			resets =3D <&gcc GCC_USB=
3_PHY_TERT_BCR>,
4af46b7bd66fa3 Abel Vesa      2024-01-29  2619  				 <&gcc GCC_USB4_2_DP0_P=
HY_TERT_BCR>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2620  			reset-names =3D "phy",
4af46b7bd66fa3 Abel Vesa      2024-01-29  2621  				      "common";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2622 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2623  			#clock-cells =3D <1>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2624  			#phy-cells =3D <1>;
4af46b7bd66fa3 Abel Vesa      2024-01-29  2625 =20
4af46b7bd66fa3 Abel Vesa      2024-01-29  2626  			status =3D "disabled";
4af46b7bd66fa3 Abel Vesa      2024-01-29  2627  		};
4af46b7bd66fa3 Abel Vesa      2024-01-29  2628 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2629  		cnoc_main: interconnect@1=
500000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2630  			compatible =3D "qcom,x1e=
80100-cnoc-main";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2631  			reg =3D <0 0x1500000 0 0=
x14400>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2632 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2633  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2634 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2635  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2636  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2637 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2638  		config_noc: interconnect@=
1600000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2639  			compatible =3D "qcom,x1e=
80100-cnoc-cfg";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2640  			reg =3D <0 0x1600000 0 0=
x6600>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2641 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2642  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2643 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2644  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2645  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2646 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2647  		system_noc: interconnect@=
1680000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2648  			compatible =3D "qcom,x1e=
80100-system-noc";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2649  			reg =3D <0 0x1680000 0 0=
x1c080>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2650 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2651  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2652 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2653  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2654  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2655 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2656  		pcie_south_anoc: intercon=
nect@16c0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2657  			compatible =3D "qcom,x1e=
80100-pcie-south-anoc";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2658  			reg =3D <0 0x16c0000 0 0=
xd080>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2659 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2660  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2661 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2662  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2663  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2664 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2665  		pcie_center_anoc: interco=
nnect@16d0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2666  			compatible =3D "qcom,x1e=
80100-pcie-center-anoc";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2667  			reg =3D <0 0x16d0000 0 0=
x7000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2668 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2669  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2670 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2671  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2672  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2673 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2674  		aggre1_noc: interconnect@=
16e0000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2675  			compatible =3D "qcom,x1e=
80100-aggre1-noc";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2676  			reg =3D <0 0x16E0000 0 0=
x14400>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2677 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2678  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2679 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2680  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2681  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2682 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2683  		aggre2_noc: interconnect@=
1700000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2684  			compatible =3D "qcom,x1e=
80100-aggre2-noc";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2685  			reg =3D <0 0x1700000 0 0=
x1c400>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2686 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2687  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2688 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2689  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2690  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2691 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2692  		pcie_north_anoc: intercon=
nect@1740000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2693  			compatible =3D "qcom,x1e=
80100-pcie-north-anoc";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2694  			reg =3D <0 0x1740000 0 0=
x9080>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2695 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2696  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2697 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2698  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2699  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2700 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2701  		usb_center_anoc: intercon=
nect@1750000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2702  			compatible =3D "qcom,x1e=
80100-usb-center-anoc";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2703  			reg =3D <0 0x1750000 0 0=
x8800>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2704 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2705  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2706 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2707  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2708  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2709 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2710  		usb_north_anoc: interconn=
ect@1760000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2711  			compatible =3D "qcom,x1e=
80100-usb-north-anoc";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2712  			reg =3D <0 0x1760000 0 0=
x7080>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2713 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2714  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2715 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2716  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2717  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2718 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2719  		usb_south_anoc: interconn=
ect@1770000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2720  			compatible =3D "qcom,x1e=
80100-usb-south-anoc";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2721  			reg =3D <0 0x1770000 0 0=
xf080>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2722 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2723  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2724 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2725  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2726  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2727 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2728  		mmss_noc: interconnect@17=
80000 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2729  			compatible =3D "qcom,x1e=
80100-mmss-noc";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2730  			reg =3D <0 0x1780000 0 0=
x5B800>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2731 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2732  			qcom,bcm-voters =3D <&ap=
ps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2733 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2734  			#interconnect-cells =3D =
<2>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2735  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2736 =20
5eb83fc10289db Abel Vesa      2024-01-29  2737  		pcie6a: pci@1bf8000 {
5eb83fc10289db Abel Vesa      2024-01-29  2738  			device_type =3D "pci";
5eb83fc10289db Abel Vesa      2024-01-29  2739  			compatible =3D "qcom,pci=
e-x1e80100";
5eb83fc10289db Abel Vesa      2024-01-29  2740  			reg =3D <0 0x01bf8000 0 =
0x3000>,
5eb83fc10289db Abel Vesa      2024-01-29  2741  			      <0 0x70000000 0 0x=
f1d>,
5eb83fc10289db Abel Vesa      2024-01-29  2742  			      <0 0x70000f20 0 0x=
a8>,
5eb83fc10289db Abel Vesa      2024-01-29  2743  			      <0 0x70001000 0 0x=
1000>,
5eb83fc10289db Abel Vesa      2024-01-29  2744  			      <0 0x70100000 0 0x=
100000>;
5eb83fc10289db Abel Vesa      2024-01-29  2745  			reg-names =3D "parf",
5eb83fc10289db Abel Vesa      2024-01-29  2746  				    "dbi",
5eb83fc10289db Abel Vesa      2024-01-29  2747  				    "elbi",
5eb83fc10289db Abel Vesa      2024-01-29  2748  				    "atu",
5eb83fc10289db Abel Vesa      2024-01-29  2749  				    "config";
5eb83fc10289db Abel Vesa      2024-01-29  2750  			#address-cells =3D <3>;
5eb83fc10289db Abel Vesa      2024-01-29  2751  			#size-cells =3D <2>;
5eb83fc10289db Abel Vesa      2024-01-29  2752  			ranges =3D <0x01000000 0=
 0x00000000 0 0x70200000 0 0x100000>,
5eb83fc10289db Abel Vesa      2024-01-29  2753  				 <0x02000000 0 0x703000=
00 0 0x70300000 0 0x3d00000>;
5eb83fc10289db Abel Vesa      2024-01-29  2754  			bus-range =3D <0 0xff>;
5eb83fc10289db Abel Vesa      2024-01-29  2755 =20
5eb83fc10289db Abel Vesa      2024-01-29  2756  			dma-coherent;
5eb83fc10289db Abel Vesa      2024-01-29  2757 =20
5eb83fc10289db Abel Vesa      2024-01-29  2758  			linux,pci-domain =3D <7>;
5eb83fc10289db Abel Vesa      2024-01-29  2759  			num-lanes =3D <2>;
5eb83fc10289db Abel Vesa      2024-01-29  2760 =20
5eb83fc10289db Abel Vesa      2024-01-29  2761  			interrupts =3D <GIC_SPI =
773 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2762  				     <GIC_SPI 774 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2763  				     <GIC_SPI 837 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2764  				     <GIC_SPI 838 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2765  				     <GIC_SPI 839 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2766  				     <GIC_SPI 840 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2767  				     <GIC_SPI 841 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2768  				     <GIC_SPI 842 IRQ_T=
YPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa      2024-01-29  2769  			interrupt-names =3D "msi=
0",
5eb83fc10289db Abel Vesa      2024-01-29  2770  					  "msi1",
5eb83fc10289db Abel Vesa      2024-01-29  2771  					  "msi2",
5eb83fc10289db Abel Vesa      2024-01-29  2772  					  "msi3",
5eb83fc10289db Abel Vesa      2024-01-29  2773  					  "msi4",
5eb83fc10289db Abel Vesa      2024-01-29  2774  					  "msi5",
5eb83fc10289db Abel Vesa      2024-01-29  2775  					  "msi6",
5eb83fc10289db Abel Vesa      2024-01-29  2776  					  "msi7";
5eb83fc10289db Abel Vesa      2024-01-29  2777 =20
5eb83fc10289db Abel Vesa      2024-01-29  2778  			#interrupt-cells =3D <1>;
5eb83fc10289db Abel Vesa      2024-01-29  2779  			interrupt-map-mask =3D <=
0 0 0 0x7>;
5eb83fc10289db Abel Vesa      2024-01-29  2780  			interrupt-map =3D <0 0 0=
 1 &intc 0 0 0 843 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2781  					<0 0 0 2 &intc 0 0 0 8=
44 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2782  					<0 0 0 3 &intc 0 0 0 8=
45 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2783  					<0 0 0 4 &intc 0 0 0 7=
72 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa      2024-01-29  2784 =20
5eb83fc10289db Abel Vesa      2024-01-29  2785  			clocks =3D <&gcc GCC_PCI=
E_6A_AUX_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2786  				 <&gcc GCC_PCIE_6A_CFG_=
AHB_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2787  				 <&gcc GCC_PCIE_6A_MSTR=
_AXI_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2788  				 <&gcc GCC_PCIE_6A_SLV_=
AXI_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2789  				 <&gcc GCC_PCIE_6A_SLV_=
Q2A_AXI_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2790  				 <&gcc GCC_CFG_NOC_PCIE=
_ANOC_SOUTH_AHB_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2791  				 <&gcc GCC_CNOC_PCIE_SO=
UTH_SF_AXI_CLK>;
5eb83fc10289db Abel Vesa      2024-01-29  2792  			clock-names =3D "aux",
5eb83fc10289db Abel Vesa      2024-01-29  2793  				      "cfg",
5eb83fc10289db Abel Vesa      2024-01-29  2794  				      "bus_master",
5eb83fc10289db Abel Vesa      2024-01-29  2795  				      "bus_slave",
5eb83fc10289db Abel Vesa      2024-01-29  2796  				      "slave_q2a",
5eb83fc10289db Abel Vesa      2024-01-29  2797  				      "noc_aggr",
5eb83fc10289db Abel Vesa      2024-01-29  2798  				      "cnoc_sf_axi";
5eb83fc10289db Abel Vesa      2024-01-29  2799 =20
5eb83fc10289db Abel Vesa      2024-01-29  2800  			assigned-clocks =3D <&gc=
c GCC_PCIE_6A_AUX_CLK>;
5eb83fc10289db Abel Vesa      2024-01-29  2801  			assigned-clock-rates =3D=
 <19200000>;
5eb83fc10289db Abel Vesa      2024-01-29  2802 =20
5eb83fc10289db Abel Vesa      2024-01-29  2803  			interconnects =3D <&pcie=
_south_anoc MASTER_PCIE_6A QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa      2024-01-29  2804  					 &mc_virt SLAVE_EBI1 Q=
COM_ICC_TAG_ALWAYS>,
5eb83fc10289db Abel Vesa      2024-01-29  2805  					<&gem_noc MASTER_APPSS=
_PROC QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa      2024-01-29  2806  					 &cnoc_main SLAVE_PCIE=
_6A QCOM_ICC_TAG_ALWAYS>;
5eb83fc10289db Abel Vesa      2024-01-29  2807  			interconnect-names =3D "=
pcie-mem",
5eb83fc10289db Abel Vesa      2024-01-29  2808  					     "cpu-pcie";
5eb83fc10289db Abel Vesa      2024-01-29  2809 =20
5eb83fc10289db Abel Vesa      2024-01-29  2810  			resets =3D <&gcc GCC_PCI=
E_6A_BCR>,
5eb83fc10289db Abel Vesa      2024-01-29  2811  				 <&gcc GCC_PCIE_6A_LINK=
_DOWN_BCR>;
5eb83fc10289db Abel Vesa      2024-01-29  2812  			reset-names =3D "pci",
5eb83fc10289db Abel Vesa      2024-01-29  2813  				      "link_down";
5eb83fc10289db Abel Vesa      2024-01-29  2814 =20
5eb83fc10289db Abel Vesa      2024-01-29  2815  			power-domains =3D <&gcc =
GCC_PCIE_6A_GDSC>;
5eb83fc10289db Abel Vesa      2024-01-29  2816 =20
5eb83fc10289db Abel Vesa      2024-01-29  2817  			phys =3D <&pcie6a_phy>;
5eb83fc10289db Abel Vesa      2024-01-29  2818  			phy-names =3D "pciephy";
5eb83fc10289db Abel Vesa      2024-01-29  2819 =20
5eb83fc10289db Abel Vesa      2024-01-29  2820  			status =3D "disabled";
5eb83fc10289db Abel Vesa      2024-01-29  2821  		};
5eb83fc10289db Abel Vesa      2024-01-29  2822 =20
5eb83fc10289db Abel Vesa      2024-01-29  2823  		pcie6a_phy: phy@1bfc000 {
5eb83fc10289db Abel Vesa      2024-01-29  2824  			compatible =3D "qcom,x1e=
80100-qmp-gen4x2-pcie-phy";
5eb83fc10289db Abel Vesa      2024-01-29  2825  			reg =3D <0 0x01bfc000 0 =
0x2000>;
5eb83fc10289db Abel Vesa      2024-01-29  2826 =20
5eb83fc10289db Abel Vesa      2024-01-29  2827  			clocks =3D <&gcc GCC_PCI=
E_6A_PHY_AUX_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2828  				 <&gcc GCC_PCIE_6A_CFG_=
AHB_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2829  				 <&rpmhcc RPMH_CXO_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2830  				 <&gcc GCC_PCIE_6A_PHY_=
RCHNG_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2831  				 <&gcc GCC_PCIE_6A_PIPE=
_CLK>;
5eb83fc10289db Abel Vesa      2024-01-29  2832  			clock-names =3D "aux",
5eb83fc10289db Abel Vesa      2024-01-29  2833  				      "cfg_ahb",
5eb83fc10289db Abel Vesa      2024-01-29  2834  				      "ref",
5eb83fc10289db Abel Vesa      2024-01-29  2835  				      "rchng",
5eb83fc10289db Abel Vesa      2024-01-29  2836  				      "pipe";
5eb83fc10289db Abel Vesa      2024-01-29  2837 =20
5eb83fc10289db Abel Vesa      2024-01-29  2838  			resets =3D <&gcc GCC_PCI=
E_6A_PHY_BCR>,
5eb83fc10289db Abel Vesa      2024-01-29  2839  				 <&gcc GCC_PCIE_6A_NOCS=
R_COM_PHY_BCR>;
5eb83fc10289db Abel Vesa      2024-01-29  2840  			reset-names =3D "phy",
5eb83fc10289db Abel Vesa      2024-01-29  2841  				      "phy_nocsr";
5eb83fc10289db Abel Vesa      2024-01-29  2842 =20
5eb83fc10289db Abel Vesa      2024-01-29  2843  			assigned-clocks =3D <&gc=
c GCC_PCIE_6A_PHY_RCHNG_CLK>;
5eb83fc10289db Abel Vesa      2024-01-29  2844  			assigned-clock-rates =3D=
 <100000000>;
5eb83fc10289db Abel Vesa      2024-01-29  2845 =20
5eb83fc10289db Abel Vesa      2024-01-29  2846  			power-domains =3D <&gcc =
GCC_PCIE_6_PHY_GDSC>;
5eb83fc10289db Abel Vesa      2024-01-29  2847 =20
5eb83fc10289db Abel Vesa      2024-01-29  2848  			#clock-cells =3D <0>;
5eb83fc10289db Abel Vesa      2024-01-29  2849  			clock-output-names =3D "=
pcie6a_pipe_clk";
5eb83fc10289db Abel Vesa      2024-01-29  2850 =20
5eb83fc10289db Abel Vesa      2024-01-29  2851  			#phy-cells =3D <0>;
5eb83fc10289db Abel Vesa      2024-01-29  2852 =20
5eb83fc10289db Abel Vesa      2024-01-29  2853  			status =3D "disabled";
5eb83fc10289db Abel Vesa      2024-01-29  2854  		};
5eb83fc10289db Abel Vesa      2024-01-29  2855 =20
5eb83fc10289db Abel Vesa      2024-01-29  2856  		pcie4: pci@1c08000 {
5eb83fc10289db Abel Vesa      2024-01-29  2857  			device_type =3D "pci";
5eb83fc10289db Abel Vesa      2024-01-29  2858  			compatible =3D "qcom,pci=
e-x1e80100";
5eb83fc10289db Abel Vesa      2024-01-29  2859  			reg =3D <0 0x01c08000 0 =
0x3000>,
5eb83fc10289db Abel Vesa      2024-01-29  2860  			      <0 0x7c000000 0 0x=
f1d>,
5eb83fc10289db Abel Vesa      2024-01-29  2861  			      <0 0x7c000f40 0 0x=
a8>,
5eb83fc10289db Abel Vesa      2024-01-29  2862  			      <0 0x7c001000 0 0x=
1000>,
5eb83fc10289db Abel Vesa      2024-01-29  2863  			      <0 0x7c100000 0 0x=
100000>,
5eb83fc10289db Abel Vesa      2024-01-29  2864  			      <0 0x01c0b000 0 0x=
1000>;
5eb83fc10289db Abel Vesa      2024-01-29  2865  			reg-names =3D "parf",
5eb83fc10289db Abel Vesa      2024-01-29  2866  			            "dbi",
5eb83fc10289db Abel Vesa      2024-01-29  2867  				    "elbi",
5eb83fc10289db Abel Vesa      2024-01-29  2868  				    "atu",
5eb83fc10289db Abel Vesa      2024-01-29  2869  				    "config",
5eb83fc10289db Abel Vesa      2024-01-29  2870  				    "mhi";
5eb83fc10289db Abel Vesa      2024-01-29  2871  			#address-cells =3D <3>;
5eb83fc10289db Abel Vesa      2024-01-29  2872  			#size-cells =3D <2>;
5eb83fc10289db Abel Vesa      2024-01-29  2873  			ranges =3D <0x01000000 0=
 0x00000000 0 0x7c200000 0 0x100000>,
5eb83fc10289db Abel Vesa      2024-01-29  2874  				 <0x02000000 0 0x7c3000=
00 0 0x7c300000 0 0x3d00000>;
5eb83fc10289db Abel Vesa      2024-01-29  2875  			bus-range =3D <0x00 0xff=
>;
5eb83fc10289db Abel Vesa      2024-01-29  2876 =20
5eb83fc10289db Abel Vesa      2024-01-29  2877  			dma-coherent;
5eb83fc10289db Abel Vesa      2024-01-29  2878 =20
5eb83fc10289db Abel Vesa      2024-01-29  2879  			linux,pci-domain =3D <5>;
5eb83fc10289db Abel Vesa      2024-01-29  2880  			num-lanes =3D <2>;
5eb83fc10289db Abel Vesa      2024-01-29  2881 =20
5eb83fc10289db Abel Vesa      2024-01-29  2882  			interrupts =3D <GIC_SPI =
141 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2883  				     <GIC_SPI 142 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2884  				     <GIC_SPI 143 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2885  				     <GIC_SPI 144 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2886  				     <GIC_SPI 145 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2887  				     <GIC_SPI 146 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2888  				     <GIC_SPI 147 IRQ_T=
YPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2889  				     <GIC_SPI 148 IRQ_T=
YPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa      2024-01-29  2890  			interrupt-names =3D "msi=
0",
5eb83fc10289db Abel Vesa      2024-01-29  2891  					  "msi1",
5eb83fc10289db Abel Vesa      2024-01-29  2892  					  "msi2",
5eb83fc10289db Abel Vesa      2024-01-29  2893  					  "msi3",
5eb83fc10289db Abel Vesa      2024-01-29  2894  					  "msi4",
5eb83fc10289db Abel Vesa      2024-01-29  2895  					  "msi5",
5eb83fc10289db Abel Vesa      2024-01-29  2896  					  "msi6",
5eb83fc10289db Abel Vesa      2024-01-29  2897  					  "msi7";
5eb83fc10289db Abel Vesa      2024-01-29  2898 =20
5eb83fc10289db Abel Vesa      2024-01-29  2899  			#interrupt-cells =3D <1>;
5eb83fc10289db Abel Vesa      2024-01-29  2900  			interrupt-map-mask =3D <=
0 0 0 0x7>;
5eb83fc10289db Abel Vesa      2024-01-29  2901  			interrupt-map =3D <0 0 0=
 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2902  					<0 0 0 2 &intc 0 0 0 1=
50 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2903  					<0 0 0 3 &intc 0 0 0 1=
51 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa      2024-01-29  2904  					<0 0 0 4 &intc 0 0 0 1=
52 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa      2024-01-29  2905 =20
5eb83fc10289db Abel Vesa      2024-01-29  2906  			clocks =3D <&gcc GCC_PCI=
E_4_AUX_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2907  				 <&gcc GCC_PCIE_4_CFG_A=
HB_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2908  				 <&gcc GCC_PCIE_4_MSTR_=
AXI_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2909  				 <&gcc GCC_PCIE_4_SLV_A=
XI_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2910  				 <&gcc GCC_PCIE_4_SLV_Q=
2A_AXI_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2911  				 <&gcc GCC_CFG_NOC_PCIE=
_ANOC_NORTH_AHB_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2912  				 <&gcc GCC_CNOC_PCIE_NO=
RTH_SF_AXI_CLK>;
5eb83fc10289db Abel Vesa      2024-01-29  2913  			clock-names =3D "aux",
5eb83fc10289db Abel Vesa      2024-01-29  2914  				      "cfg",
5eb83fc10289db Abel Vesa      2024-01-29  2915  				      "bus_master",
5eb83fc10289db Abel Vesa      2024-01-29  2916  				      "bus_slave",
5eb83fc10289db Abel Vesa      2024-01-29  2917  				      "slave_q2a",
5eb83fc10289db Abel Vesa      2024-01-29  2918  				      "noc_aggr",
5eb83fc10289db Abel Vesa      2024-01-29  2919  				      "cnoc_sf_axi";
5eb83fc10289db Abel Vesa      2024-01-29  2920 =20
5eb83fc10289db Abel Vesa      2024-01-29  2921  			assigned-clocks =3D <&gc=
c GCC_PCIE_4_AUX_CLK>;
5eb83fc10289db Abel Vesa      2024-01-29  2922  			assigned-clock-rates =3D=
 <19200000>;
5eb83fc10289db Abel Vesa      2024-01-29  2923 =20
5eb83fc10289db Abel Vesa      2024-01-29  2924  			interconnects =3D <&pcie=
_south_anoc MASTER_PCIE_4 QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa      2024-01-29  2925  					 &mc_virt SLAVE_EBI1 Q=
COM_ICC_TAG_ALWAYS>,
5eb83fc10289db Abel Vesa      2024-01-29  2926  					<&gem_noc MASTER_APPSS=
_PROC QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa      2024-01-29  2927  					 &cnoc_main SLAVE_PCIE=
_4 QCOM_ICC_TAG_ALWAYS>;
5eb83fc10289db Abel Vesa      2024-01-29  2928  			interconnect-names =3D "=
pcie-mem",
5eb83fc10289db Abel Vesa      2024-01-29  2929  					     "cpu-pcie";
5eb83fc10289db Abel Vesa      2024-01-29  2930 =20
5eb83fc10289db Abel Vesa      2024-01-29  2931  			resets =3D <&gcc GCC_PCI=
E_4_BCR>,
5eb83fc10289db Abel Vesa      2024-01-29  2932  				 <&gcc GCC_PCIE_4_LINK_=
DOWN_BCR>;
5eb83fc10289db Abel Vesa      2024-01-29  2933  			reset-names =3D "pci",
5eb83fc10289db Abel Vesa      2024-01-29  2934  				      "link_down";
5eb83fc10289db Abel Vesa      2024-01-29  2935 =20
5eb83fc10289db Abel Vesa      2024-01-29  2936  			power-domains =3D <&gcc =
GCC_PCIE_4_GDSC>;
5eb83fc10289db Abel Vesa      2024-01-29  2937 =20
5eb83fc10289db Abel Vesa      2024-01-29  2938  			phys =3D <&pcie4_phy>;
5eb83fc10289db Abel Vesa      2024-01-29  2939  			phy-names =3D "pciephy";
5eb83fc10289db Abel Vesa      2024-01-29  2940 =20
5eb83fc10289db Abel Vesa      2024-01-29  2941  			status =3D "disabled";
5eb83fc10289db Abel Vesa      2024-01-29  2942  		};
5eb83fc10289db Abel Vesa      2024-01-29  2943 =20
5eb83fc10289db Abel Vesa      2024-01-29  2944  		pcie4_phy: phy@1c0e000 {
5eb83fc10289db Abel Vesa      2024-01-29  2945  			compatible =3D "qcom,x1e=
80100-qmp-gen3x2-pcie-phy";
5eb83fc10289db Abel Vesa      2024-01-29  2946  			reg =3D <0 0x01c0e000 0 =
0x2000>;
5eb83fc10289db Abel Vesa      2024-01-29  2947 =20
5eb83fc10289db Abel Vesa      2024-01-29  2948  			clocks =3D <&gcc GCC_PCI=
E_4_AUX_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2949  				 <&gcc GCC_PCIE_4_CFG_A=
HB_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2950  				 <&rpmhcc RPMH_CXO_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2951  				 <&gcc GCC_PCIE_4_PHY_R=
CHNG_CLK>,
5eb83fc10289db Abel Vesa      2024-01-29  2952  				 <&gcc GCC_PCIE_4_PIPE_=
CLK>;
5eb83fc10289db Abel Vesa      2024-01-29  2953  			clock-names =3D "aux",
5eb83fc10289db Abel Vesa      2024-01-29  2954  				      "cfg_ahb",
5eb83fc10289db Abel Vesa      2024-01-29  2955  				      "ref",
5eb83fc10289db Abel Vesa      2024-01-29  2956  				      "rchng",
5eb83fc10289db Abel Vesa      2024-01-29  2957  				      "pipe";
5eb83fc10289db Abel Vesa      2024-01-29  2958 =20
5eb83fc10289db Abel Vesa      2024-01-29  2959  			resets =3D <&gcc GCC_PCI=
E_4_PHY_BCR>;
5eb83fc10289db Abel Vesa      2024-01-29  2960  			reset-names =3D "phy";
5eb83fc10289db Abel Vesa      2024-01-29  2961 =20
5eb83fc10289db Abel Vesa      2024-01-29  2962  			assigned-clocks =3D <&gc=
c GCC_PCIE_4_PHY_RCHNG_CLK>;
5eb83fc10289db Abel Vesa      2024-01-29  2963  			assigned-clock-rates =3D=
 <100000000>;
5eb83fc10289db Abel Vesa      2024-01-29  2964 =20
5eb83fc10289db Abel Vesa      2024-01-29  2965  			power-domains =3D <&gcc =
GCC_PCIE_4_PHY_GDSC>;
5eb83fc10289db Abel Vesa      2024-01-29  2966 =20
5eb83fc10289db Abel Vesa      2024-01-29  2967  			#clock-cells =3D <0>;
5eb83fc10289db Abel Vesa      2024-01-29  2968  			clock-output-names =3D "=
pcie4_pipe_clk";
5eb83fc10289db Abel Vesa      2024-01-29  2969 =20
5eb83fc10289db Abel Vesa      2024-01-29  2970  			#phy-cells =3D <0>;
5eb83fc10289db Abel Vesa      2024-01-29  2971 =20
5eb83fc10289db Abel Vesa      2024-01-29  2972  			status =3D "disabled";
5eb83fc10289db Abel Vesa      2024-01-29  2973  		};
5eb83fc10289db Abel Vesa      2024-01-29  2974 =20
af16b00578a7a1 Rajendra Nayak 2023-12-05  2975  		tcsr_mutex: hwlock@1f4000=
0 {
af16b00578a7a1 Rajendra Nayak 2023-12-05  2976  			compatible =3D "qcom,tcs=
r-mutex";
af16b00578a7a1 Rajendra Nayak 2023-12-05  2977  			reg =3D <0 0x01f40000 0 =
0x20000>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2978  			#hwlock-cells =3D <1>;
af16b00578a7a1 Rajendra Nayak 2023-12-05  2979  		};
af16b00578a7a1 Rajendra Nayak 2023-12-05  2980 =20
8b6e2bf94b278c Abel Vesa      2024-01-29  2981  		tcsr: clock-controller@1f=
c0000 {
8b6e2bf94b278c Abel Vesa      2024-01-29  2982  			compatible =3D "qcom,x1e=
80100-tcsr", "syscon";
8b6e2bf94b278c Abel Vesa      2024-01-29  2983  			reg =3D <0 0x01fc0000 0 =
0x30000>;
8b6e2bf94b278c Abel Vesa      2024-01-29  2984  			clocks =3D <&rpmhcc RPMH=
_CXO_CLK>;
8b6e2bf94b278c Abel Vesa      2024-01-29  2985  			#clock-cells =3D <1>;
8b6e2bf94b278c Abel Vesa      2024-01-29  2986  			#reset-cells =3D <1>;
8b6e2bf94b278c Abel Vesa      2024-01-29  2987  		};
8b6e2bf94b278c Abel Vesa      2024-01-29  2988 =20
1fcb28f0c3b269 Rajendra Nayak 2024-02-27 @2989  		venus: video-codec@aa0000=
0 {

:::::: The code at line 2989 was first introduced by commit
:::::: 1fcb28f0c3b2695de1b33b5b0864c1b61a3720cf arm64: dts: qcom: x1e80100:=
 Add venus DT node

:::::: TO: Rajendra Nayak <quic_rjendra@quicinc.com>
:::::: CC: Abel Vesa <abel.vesa@linaro.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

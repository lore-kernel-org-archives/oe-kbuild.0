Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD37191F8F
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720090603; cv=none; b=ax09uiMkzbYgpZ4qibfpjy179SR9W4kzVAxaXH6eonqV0teCKTGo7cReFfnOhYtTXp5qOyt5FxZEYhUqd4bmTW/Ty0JkS/NTo/38CVe9Om/UDFWIqoViFZjos+g3wodLgW7bL+GLdFjaSfRdHxU/St3AhdrsNpjEiq+9rmoyogU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720090603; c=relaxed/simple;
	bh=ji3x8zXKCP6JKJTE5RhMkvABBb8CAvKLbGVpBA78moY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D56Qc9h+aMLJ9lxBGwu1kCNC6KedEjA3R5bm0RWm7ry/nGfZXz3oYODbh98cuRDxo0F5opW1Fi1MT0nlb3TKEYG8LotMFIQKXXGx9CDGlt3Il7u3oVdfGt8bI44wVnhFBA1JGggQzD/IgSAH8n69kI6vvY4XCd7zGihsJUVde2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjn1Ai4c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjn1Ai4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720090601; x=1751626601;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ji3x8zXKCP6JKJTE5RhMkvABBb8CAvKLbGVpBA78moY=;
  b=bjn1Ai4cO8NFHQAvCJXTj40Zi+ItWjD4Yb8V5PdKS8Y1sMjF/ifUZakR
   IAcMOQwRLsSpRyazee5ITVzazbY76PALDDbGRDPwpZYpRKQ8GDXT4JDZh
   iG0Jg/Yqcrvtl12zvzR9GIW7ZT4LnWvigwtX99NlwxduQOm81cDDW3Z5Z
   kVUWCAWu8ANPvIfRCgDD7r21J8O6x0WWkMCaGjiRPsQ4QlyHcFkdK5SPl
   zcCMXPGhergwJ2PFSp3B5IJv2lCU//mD28PsyLfr1vAvs1M54TL8QHRfb
   ZtqwFixHmhvMRscslfop9dIb4yxfDfpiOi/kLtRzPTNrWdcfKEgvZqhPN
   A==;
X-CSE-ConnectionGUID: 9epkKECWSpa/o2ZfpSVVfA==
X-CSE-MsgGUID: He5b7RUMQ/ypsP3TZFWMEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="27966770"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="27966770"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 03:56:40 -0700
X-CSE-ConnectionGUID: tm0rpyCiTYWVUY17xf2q0A==
X-CSE-MsgGUID: rVvD007+SQm/ObeGou6HJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51515466"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jul 2024 03:56:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPK8i-000Qtu-25;
	Thu, 04 Jul 2024 10:56:36 +0000
Date: Thu, 4 Jul 2024 18:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.11 268/269]
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: gmu@3d6a000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407041816.isE4iTDw-lkp@intel.com>
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
TO: Xilin Wu <wuxilin123@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fo=
r-6.11
head:   968178e35e78e566f75dbb7fbfc4dd1436ce8309
commit: d0e2f8f62dff11ce399937fa51d09c24b46049be [268/269] arm64: dts: qcom=
: Add device tree for ASUS Vivobook S 15
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-051-20240704 (https://download.01.org/0day-ci/arch=
ive/20240704/202407041816.isE4iTDw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240704/202407041816.isE4iTDw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407041816.isE4iTDw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm899=
6-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens',=
 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm825=
0-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'q=
com,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/thermal-=
sensor@c274000: failed to match any schema with compatible: ['qcom,x1e80100=
-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pci@1bf8000: Un=
evaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.y=
aml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: gmu@3d6a000: co=
mpatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,adreno-gmu-x185.1', 'qcom,adreno-gmu'] is too long
   	'qcom,adreno-gmu-x185.1' does not match '^qcom,adreno-gmu-[67][0-9][0-9=
]\\.[0-9]$'
   	'qcom,adreno-gmu-wrapper' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/gmu@3d6a=
000: failed to match any schema with compatible: ['qcom,adreno-gmu-x185.1',=
 'qcom,adreno-gmu']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: iommu@3da0000: =
compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mm=
u-500'] is too long
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,m=
sm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,=
sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc=
8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6=
350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250=
-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,=
sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,=
sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8=
250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550=
-smmu-500', 'qcom,sm8650-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,s=
m8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,s=
c7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-=
smmu-v2', 'qcom,sm7150-smmu-v2']
   	'qcom,sdm845-smmu-v2' was expected
   	'marvell,ap806-smmu-500' was expected
   	'qcom,x1e80100-smmu-500' is not one of ['nvidia,tegra186-smmu', 'nvidia=
,tegra194-smmu', 'nvidia,tegra234-smmu']
   	'arm,mmu-500' was expected
   	'qcom,x1e80100-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,x1e80100-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', '=
arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,smmu-500' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: iommu@3da0000: =
clock-names: False schema does not allow ['hlos', 'bus', 'iface', 'ahb']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: iommu@3da0000: =
clocks: False schema does not allow [[161, 14], [51, 55], [51, 56], [161, 0=
]]
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a2f8800: in=
terrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@3: compati=
ble:0: 'qcom,pmc8380' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm=
6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm=
7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom=
,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom=
,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'q=
com,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', =
'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm89=
09', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm89=
53', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pm=
c8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qc=
om,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550'=
, 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom=
,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom=
,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@3: gpio@88=
00:compatible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qc=
om,pm660-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio',=
 'qcom,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b=
-gpio', 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom=
,pm8008-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', =
'qcom,pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-=
gpio', 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,p=
m8350c-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', =
'qcom,pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm891=
7-gpio', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,=
pm8953-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', =
'qcom,pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi63=
2-gpio', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qc=
om,pmih0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155a=
u-gpio', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', '=
qcom,pmr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gp=
io', 'qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c42d000/pmic@3: failed to match any schema with compatible: ['=
qcom,pmc8380', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: gpio@8800: comp=
atible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm66=
0-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom,=
pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio',=
 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm8008=
-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,p=
m8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio', =
'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c-=
gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,p=
m8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio'=
, 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953-=
gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,p=
mc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio'=
, 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmih=
0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio'=
, 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,pm=
r735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', 'q=
com,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c42d000/pmic@3/gpio@8800: failed to match any schema with comp=
atible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@4: compati=
ble:0: 'qcom,pmc8380' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm=
6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm=
7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom=
,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom=
,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'q=
com,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', =
'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm89=
09', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm89=
53', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pm=
c8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qc=
om,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550'=
, 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom=
,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom=
,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@4: gpio@88=
00:compatible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qc=
om,pm660-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio',=
 'qcom,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b=
-gpio', 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom=
,pm8008-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', =
'qcom,pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-=
gpio', 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,p=
m8350c-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', =
'qcom,pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm891=
7-gpio', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,=
pm8953-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', =
'qcom,pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi63=
2-gpio', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qc=
om,pmih0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155a=
u-gpio', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', '=
qcom,pmr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gp=
io', 'qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c42d000/pmic@4: failed to match any schema with compatible: ['=
qcom,pmc8380', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: gpio@8800: comp=
atible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm66=
0-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom,=
pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio',=
 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm8008=
-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,p=
m8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio', =
'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c-=
gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,p=
m8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio'=
, 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953-=
gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,p=
mc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio'=
, 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmih=
0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio'=
, 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,pm=
r735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', 'q=
com,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c42d000/pmic@4/gpio@8800: failed to match any schema with comp=
atible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@5: compati=
ble:0: 'qcom,pmc8380' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm=
6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm=
7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom=
,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom=
,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'q=
com,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', =
'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm89=
09', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm89=
53', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pm=
c8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qc=
om,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550'=
, 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom=
,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom=
,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@5: gpio@88=
00:compatible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qc=
om,pm660-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio',=
 'qcom,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b=
-gpio', 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom=
,pm8008-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', =
'qcom,pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-=
gpio', 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,p=
m8350c-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', =
'qcom,pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm891=
7-gpio', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,=
pm8953-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', =
'qcom,pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi63=
2-gpio', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qc=
om,pmih0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155a=
u-gpio', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', '=
qcom,pmr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gp=
io', 'qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c42d000/pmic@5: failed to match any schema with compatible: ['=
qcom,pmc8380', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: gpio@8800: comp=
atible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm66=
0-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom,=
pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio',=
 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm8008=
-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,p=
m8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio', =
'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c-=
gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,p=
m8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio'=
, 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953-=
gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,p=
mc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio'=
, 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmih=
0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio'=
, 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,pm=
r735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', 'q=
com,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c42d000/pmic@5/gpio@8800: failed to match any schema with comp=
atible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@6: compati=
ble:0: 'qcom,pmc8380' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm=
6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm=
7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom=
,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom=
,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'q=
com,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', =
'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm89=
09', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm89=
53', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pm=
c8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qc=
om,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550'=
, 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom=
,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom=
,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@6: gpio@88=
00:compatible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qc=
om,pm660-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio',=
 'qcom,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b=
-gpio', 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom=
,pm8008-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', =
'qcom,pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-=
gpio', 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,p=
m8350c-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', =
'qcom,pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm891=
7-gpio', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,=
pm8953-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', =
'qcom,pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi63=
2-gpio', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qc=
om,pmih0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155a=
u-gpio', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', '=
qcom,pmr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gp=
io', 'qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c42d000/pmic@6: failed to match any schema with compatible: ['=
qcom,pmc8380', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: gpio@8800: comp=
atible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm66=
0-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom,=
pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio',=
 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm8008=
-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,p=
m8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio', =
'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c-=
gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,p=
m8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio'=
, 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953-=
gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,p=
mc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio'=
, 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmih=
0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio'=
, 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,pm=
r735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', 'q=
com,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c42d000/pmic@6/gpio@8800: failed to match any schema with comp=
atible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@7: compati=
ble:0: 'qcom,smb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm=
6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm=
7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom=
,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom=
,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'q=
com,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', =
'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm89=
09', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm89=
53', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pm=
c8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qc=
om,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550'=
, 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom=
,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom=
,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c432000/pmic@7: failed to match any schema with compatible: ['=
qcom,smb2360', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@a: compati=
ble:0: 'qcom,smb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm=
6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm=
7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom=
,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom=
,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'q=
com,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', =
'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm89=
09', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm89=
53', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pm=
c8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qc=
om,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550'=
, 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom=
,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom=
,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c432000/pmic@a: failed to match any schema with compatible: ['=
qcom,smb2360', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@b: compati=
ble:0: 'qcom,smb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm=
6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm=
7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom=
,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom=
,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'q=
com,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', =
'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm89=
09', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm89=
53', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pm=
c8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qc=
om,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550'=
, 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom=
,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom=
,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c432000/pmic@b: failed to match any schema with compatible: ['=
qcom,smb2360', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmic@c: compati=
ble:0: 'qcom,smb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm=
6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm=
7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom=
,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom=
,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'q=
com,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', =
'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm89=
09', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm89=
53', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pm=
c8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qc=
om,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550'=
, 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom=
,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom=
,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/arbiter@=
c400000/spmi@c432000/pmic@c: failed to match any schema with compatible: ['=
qcom,smb2360', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmu@24091000: c=
ompatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-llcc-bwmon', 'qcom,sc7280-llcc-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-llcc-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qc=
om,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', '=
qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', =
'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-llcc-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qc=
om,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon',=
 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	'qcom,sdm845-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/pmu@2409=
1000: failed to match any schema with compatible: ['qcom,x1e80100-llcc-bwmo=
n', 'qcom,sc7280-llcc-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmu@240b3400: c=
ompatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qco=
m,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'q=
com,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', '=
qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qco=
m,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', =
'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/pmu@240b=
3400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmon=
', 'qcom,sdm845-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmu@240b5400: c=
ompatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qco=
m,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'q=
com,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', '=
qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qco=
m,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', =
'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmu@240b5400: '=
opp-table' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/pmu@240b=
5400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmon=
', 'qcom,sdm845-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmu@240b6400: c=
ompatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qco=
m,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'q=
com,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', '=
qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qco=
m,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', =
'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pmu@240b6400: '=
opp-table' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/pmu@240b=
6400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmon=
', 'qcom,sdm845-bwmon']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

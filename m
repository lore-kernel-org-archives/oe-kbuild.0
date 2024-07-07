Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5667D12E75
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720359371; cv=none; b=P2Ool/LHrw1kh7k/00No5HQpi9JqEC7V8KIJgTkOt5qQXyGkBdZytgTv7ARQ6/ZZjX+ok39vXmtp6X3MB9q4FcG+oLX1rLXbUqitHx/oBihdO400Zfxly3q4wez/JLljYSft2HVbOC758+SOrk5UvoF0+Vi37mpIurlIsfMyGvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720359371; c=relaxed/simple;
	bh=jfXtdKc/f5DQRxUvWdDaStVorlFFCUQ5k8iIo/IZnFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGWTkKcq2dr8VnEzUvBWARyCuy+//voV0SPvjA0l2tJe2UL/f4z4ReZwDcmAZqrLgGHSBAYpNc+sTGevDK/Cgm+tVjltsfCdaAuRN0eOlYOC86CgHELDa8zNOnQKD995OrOmij3uJzSBpBdCeDda/t+WcNPVeWSXLQ0pjXN84e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/t15qP1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/t15qP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720359368; x=1751895368;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jfXtdKc/f5DQRxUvWdDaStVorlFFCUQ5k8iIo/IZnFg=;
  b=E/t15qP112N2HE0nEgn9Dft2Opkls5qm3kQn2P1Oi76ozxNItGB5EACY
   gYi77ylqOwq9x476lm6MwMkCfFnksdM9zVcHhKo/VN3ClYWio3bWqtD/i
   s4LSKUSCUx3aqwgwqT2kDkdMR83n1N52IHkC7pItseoFa1qqfD+CzbNAc
   9BycXEuEmruuMIQ/tN4JpLT9hth86/hjzZd6zPh/wO09+WOYd9YA6N+kZ
   wL2Oj1zh/TUMcJfesZKipTNP8vlbdJIk8ZhJxb71kWP4ffhSH6YWYSEbx
   dEUnL4X+GwyoVsNtA7ad13PqQLk7EXoKItFZS0utUFobdmeYFTEddRr/k
   A==;
X-CSE-ConnectionGUID: RVFhagyrSza0YyO2dATDCQ==
X-CSE-MsgGUID: AoHrCwrJTJe0+Qd0V5n0Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="20472092"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="20472092"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 06:36:08 -0700
X-CSE-ConnectionGUID: oK/3iDWmSfGKW9lCJaiAfw==
X-CSE-MsgGUID: McRUn2wvSQ6AeO7jqnTMtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47246380"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jul 2024 06:36:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQS3g-000Uyw-1A;
	Sun, 07 Jul 2024 13:36:04 +0000
Date: Sun, 7 Jul 2024 21:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.11 271/290]
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb:
 domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of
 the regexes: 'pinctrl-[0-9]+'
Message-ID: <202407072122.hn82fRTk-lkp@intel.com>
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
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fo=
r-6.11
head:   88bf3be9c327f2d78c65e7e4c10c677d4b36128a
commit: 45247fe17db25594bec804f9db751635c7b6e473 [271/290] arm64: dts: qcom=
: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree
:::::: branch date: 15 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-051-20240707 (https://download.01.org/0day-ci/arch=
ive/20240707/202407072122.hn82fRTk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c=
6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240707/202407072122.hn82fRTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407072122.hn82fRTk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3873.11-3883.7: Warning (graph_ch=
ild_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single c=
hild node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-st=
ates: cluster-sleep-0: 'idle-state-name' does not match any of the regexes:=
 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.=
yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-st=
ates: cluster-sleep-1: 'idle-state-name' does not match any of the regexes:=
 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.=
yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: thermal-sensor=
@c271000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
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
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/thermal=
-sensor@c271000: failed to match any schema with compatible: ['qcom,x1e8010=
0-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: thermal-sensor=
@c272000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
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
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/thermal=
-sensor@c272000: failed to match any schema with compatible: ['qcom,x1e8010=
0-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: thermal-sensor=
@c273000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
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
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/thermal=
-sensor@c273000: failed to match any schema with compatible: ['qcom,x1e8010=
0-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: thermal-sensor=
@c274000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
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
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/thermal=
-sensor@c274000: failed to match any schema with compatible: ['qcom,x1e8010=
0-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pci@1bf8000: U=
nevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.y=
aml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: gmu@3d6a000: c=
ompatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,adreno-gmu-x185.1', 'qcom,adreno-gmu'] is too long
   	'qcom,adreno-gmu-x185.1' does not match '^qcom,adreno-gmu-[67][0-9][0-9=
]\\.[0-9]$'
   	'qcom,adreno-gmu-wrapper' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/gmu@3d6=
a000: failed to match any schema with compatible: ['qcom,adreno-gmu-x185.1'=
, 'qcom,adreno-gmu']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: iommu@3da0000:=
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
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: iommu@3da0000:=
 clock-names: False schema does not allow ['hlos', 'bus', 'iface', 'ahb']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: iommu@3da0000:=
 clocks: False schema does not allow [[164, 14], [51, 55], [51, 56], [164, =
0]]
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: speaker@0,0: U=
nevaluated properties are not allowed ('qcom,port-mapping' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: speaker@0,1: U=
nevaluated properties are not allowed ('qcom,port-mapping' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: speaker@0,0: U=
nevaluated properties are not allowed ('qcom,port-mapping' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: speaker@0,1: U=
nevaluated properties are not allowed ('qcom,port-mapping' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a2f8800: i=
nterrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@3: compat=
ible:0: 'qcom,pmc8380' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,p=
m6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,p=
m7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qco=
m,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qco=
m,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', '=
qcom,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550',=
 'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8=
909', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8=
953', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,p=
mc8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'q=
com,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550=
', 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qco=
m,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qco=
m,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@3: gpio@8=
800:compatible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'q=
com,pm660-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio'=
, 'qcom,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250=
b-gpio', 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qco=
m,pm8008-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio',=
 'qcom,pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l=
-gpio', 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,=
pm8350c-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio',=
 'qcom,pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm89=
17-gpio', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom=
,pm8953-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio',=
 'qcom,pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi6=
32-gpio', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'q=
com,pmih0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155=
au-gpio', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', =
'qcom,pmr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-g=
pio', 'qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c42d000/pmic@3: failed to match any schema with compatible: [=
'qcom,pmc8380', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: gpio@8800: com=
patible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm6=
60-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom=
,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio'=
, 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm800=
8-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,=
pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio',=
 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c=
-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,=
pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio=
', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953=
-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,=
pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio=
', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmi=
h0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio=
', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,p=
mr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', '=
qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c42d000/pmic@3/gpio@8800: failed to match any schema with com=
patible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@4: compat=
ible:0: 'qcom,pmc8380' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,p=
m6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,p=
m7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qco=
m,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qco=
m,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', '=
qcom,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550',=
 'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8=
909', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8=
953', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,p=
mc8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'q=
com,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550=
', 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qco=
m,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qco=
m,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@4: gpio@8=
800:compatible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'q=
com,pm660-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio'=
, 'qcom,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250=
b-gpio', 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qco=
m,pm8008-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio',=
 'qcom,pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l=
-gpio', 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,=
pm8350c-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio',=
 'qcom,pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm89=
17-gpio', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom=
,pm8953-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio',=
 'qcom,pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi6=
32-gpio', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'q=
com,pmih0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155=
au-gpio', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', =
'qcom,pmr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-g=
pio', 'qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c42d000/pmic@4: failed to match any schema with compatible: [=
'qcom,pmc8380', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: gpio@8800: com=
patible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm6=
60-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom=
,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio'=
, 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm800=
8-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,=
pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio',=
 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c=
-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,=
pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio=
', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953=
-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,=
pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio=
', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmi=
h0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio=
', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,p=
mr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', '=
qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c42d000/pmic@4/gpio@8800: failed to match any schema with com=
patible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@5: compat=
ible:0: 'qcom,pmc8380' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,p=
m6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,p=
m7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qco=
m,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qco=
m,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', '=
qcom,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550',=
 'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8=
909', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8=
953', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,p=
mc8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'q=
com,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550=
', 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qco=
m,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qco=
m,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@5: gpio@8=
800:compatible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'q=
com,pm660-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio'=
, 'qcom,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250=
b-gpio', 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qco=
m,pm8008-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio',=
 'qcom,pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l=
-gpio', 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,=
pm8350c-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio',=
 'qcom,pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm89=
17-gpio', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom=
,pm8953-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio',=
 'qcom,pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi6=
32-gpio', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'q=
com,pmih0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155=
au-gpio', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', =
'qcom,pmr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-g=
pio', 'qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c42d000/pmic@5: failed to match any schema with compatible: [=
'qcom,pmc8380', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: gpio@8800: com=
patible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm6=
60-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom=
,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio'=
, 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm800=
8-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,=
pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio',=
 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c=
-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,=
pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio=
', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953=
-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,=
pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio=
', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmi=
h0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio=
', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,p=
mr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', '=
qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c42d000/pmic@5/gpio@8800: failed to match any schema with com=
patible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@6: compat=
ible:0: 'qcom,pmc8380' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,p=
m6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,p=
m7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qco=
m,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qco=
m,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', '=
qcom,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550',=
 'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8=
909', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8=
953', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,p=
mc8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'q=
com,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550=
', 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qco=
m,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qco=
m,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@6: gpio@8=
800:compatible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'q=
com,pm660-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio'=
, 'qcom,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250=
b-gpio', 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qco=
m,pm8008-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio',=
 'qcom,pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l=
-gpio', 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,=
pm8350c-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio',=
 'qcom,pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm89=
17-gpio', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom=
,pm8953-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio',=
 'qcom,pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi6=
32-gpio', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'q=
com,pmih0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155=
au-gpio', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', =
'qcom,pmr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-g=
pio', 'qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c42d000/pmic@6: failed to match any schema with compatible: [=
'qcom,pmc8380', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: gpio@8800: com=
patible:0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm6=
60-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom=
,pm6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio'=
, 'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm800=
8-gpio', 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,=
pm8058-gpio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio',=
 'qcom,pm8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c=
-gpio', 'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,=
pm8550ve-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio=
', 'qcom,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953=
-gpio', 'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,=
pmc8180-gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio=
', 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmi=
h0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio=
', 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,p=
mr735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', '=
qcom,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c42d000/pmic@6/gpio@8800: failed to match any schema with com=
patible: ['qcom,pmc8380-gpio', 'qcom,spmi-gpio']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@7: compat=
ible:0: 'qcom,smb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,p=
m6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,p=
m7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qco=
m,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qco=
m,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', '=
qcom,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550',=
 'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8=
909', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8=
953', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,p=
mc8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'q=
com,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550=
', 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qco=
m,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qco=
m,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c432000/pmic@7: failed to match any schema with compatible: [=
'qcom,smb2360', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@a: compat=
ible:0: 'qcom,smb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,p=
m6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,p=
m7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qco=
m,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qco=
m,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', '=
qcom,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550',=
 'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8=
909', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8=
953', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,p=
mc8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'q=
com,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550=
', 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qco=
m,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qco=
m,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c432000/pmic@a: failed to match any schema with compatible: [=
'qcom,smb2360', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@b: compat=
ible:0: 'qcom,smb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,p=
m6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,p=
m7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qco=
m,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qco=
m,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', '=
qcom,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550',=
 'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8=
909', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8=
953', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,p=
mc8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'q=
com,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550=
', 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qco=
m,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qco=
m,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c432000/pmic@b: failed to match any schema with compatible: [=
'qcom,smb2360', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmic@c: compat=
ible:0: 'qcom,smb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,p=
m6150', 'qcom,pm6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,p=
m7250b', 'qcom,pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qco=
m,pm8009', 'qcom,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qco=
m,pm8150', 'qcom,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', '=
qcom,pm8350', 'qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550',=
 'qcom,pm8550b', 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8=
909', 'qcom,pm8916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8=
953', 'qcom,pm8994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,p=
mc8180c', 'qcom,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'q=
com,pmi8994', 'qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550=
', 'qcom,pmm8155au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qco=
m,pmr735b', 'qcom,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qco=
m,pmx75', 'qcom,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/arbiter=
@c400000/spmi@c432000/pmic@c: failed to match any schema with compatible: [=
'qcom,smb2360', 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmu@24091000: =
compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/pmu@240=
91000: failed to match any schema with compatible: ['qcom,x1e80100-llcc-bwm=
on', 'qcom,sc7280-llcc-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmu@240b3400: =
compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/pmu@240=
b3400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmo=
n', 'qcom,sdm845-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmu@240b5400: =
compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmu@240b5400: =
'opp-table' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/pmu@240=
b5400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmo=
n', 'qcom,sdm845-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmu@240b6400: =
compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pmu@240b6400: =
'opp-table' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/pmu@240=
b6400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmo=
n', 'qcom,sdm845-bwmon']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

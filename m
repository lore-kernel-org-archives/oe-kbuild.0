Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A811B4257
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Oct 2025 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809235; cv=none; b=uOE6BZ6BmBHRmgTzO+3F8OT+yMreEZsTcCwcrXysAdw85OCTqEVWYTQnjqPJWsymnYt1GMueNQPKxB5QuISrxO/KTgZEvPTYWbcGFE6yL2M6qg6SA5k6/PpIXdyP5XY23Ns+4aWa0Sk7Tvw49i6MiwRbyRWX3Ce/dfMdUrsfz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809235; c=relaxed/simple;
	bh=5neeTaIsKXsz2+eM1FG41cQyvc4aQ3YJ1F242ZHAPtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O80xmJPrMvcCvlTiyJ+B8Rqx9oqYldQl8f+17988vovVD0QeicT0PYwkg9bP3HGYruV+N10vcFfBFU0702w1dxssv66hx1sJbgDgg2gBX2UJTpvNkGzdCBpqw/Uyn8Ey90Fw1KBy6A3MRScz0PEdw3N+AX5DcXeMLN086JMFiu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bf4a3ICJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bf4a3ICJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760809234; x=1792345234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5neeTaIsKXsz2+eM1FG41cQyvc4aQ3YJ1F242ZHAPtY=;
  b=bf4a3ICJ/9fyZvXxQk4bhgpPL35MiRDjsHLlp/Bf6KZsokZ5P/fUvq0b
   UNiBtw7JgtETME6cnK8eDjWCTzw4bcyDCeT+4zgKqTYjorARgW0H78dsI
   wOae4OUzT6DaEz5vh+Ta4CLAOkZw1JM0EyebXmnKfve5RpWQ8ehGG9RHK
   x5fZZvV4wIJN8c2+2zRft0kgVJDAMvVj4yL7iApcEW/Llon5F2jJmSOH5
   zYxvwdTQq915wH+fl4Jl/iKVp/h8mvsj8CNBV6acjLecjlPY/dBDtOIoY
   72NZ+SiffmfA5jyrP1314badbyD0UBa6EWgIkLsUmfyENPr2kfHTDzScO
   Q==;
X-CSE-ConnectionGUID: 0dFK8REJQuSyn5zxyi6SSA==
X-CSE-MsgGUID: BcsRm7WFTc2aNTdvzKgfDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74111742"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="74111742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 10:40:33 -0700
X-CSE-ConnectionGUID: IL/+5cL5TSagPamf4rF9rg==
X-CSE-MsgGUID: N/HvG9F6SbiaOmCwTZ0Rlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182179338"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2025 10:40:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAAur-0008Td-2A;
	Sat, 18 Oct 2025 17:40:29 +0000
Date: Sun, 19 Oct 2025 01:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 29/127]
 arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: /
 (dell,inspiron-14-plus-7441): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202510190143.B6sgn5T4-lkp@intel.com>
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
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: Val Packett <val@packett.cool>
CC: Laurentiu Tudor <laurentiu.tudor1@dell.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   737e48844988f2167f895fb3fe7a2e14a8211186
commit: 8e3331576793333a6fadf17b06c590d03ba49d6b [29/127] arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-052-20251018 (https://download.01.org/0day-ci/archive/20251019/202510190143.B6sgn5T4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190143.B6sgn5T4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510190143.B6sgn5T4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4883.11-4893.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: / (dell,inspiron-14-plus-7441): compatible: 'oneOf' conditional failed, one must be fixed:
   	['dell,inspiron-14-plus-7441', 'qcom,x1e80100'] is too short
   	'dell,inspiron-14-plus-7441' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'dell,inspiron-14-plus-7441' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'dell,inspiron-14-plus-7441' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'dell,inspiron-14-plus-7441' is not one of ['qcom,apq8074-dragonboard']
   	'dell,inspiron-14-plus-7441' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'dell,inspiron-14-plus-7441' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'dell,inspiron-14-plus-7441' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'dell,inspiron-14-plus-7441' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
   	'dell,inspiron-14-plus-7441' is not one of ['wingtech,wt82918hd']
--
   	'qcom,sm8350' was expected
   	'qcom,sm8450' was expected
   	'qcom,sm8550' was expected
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,sm8750' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: /: failed to match any schema with compatible: ['dell,inspiron-14-plus-7441', 'qcom,x1e80100']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4883.11-4893.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: / (dell,latitude-7455): compatible: 'oneOf' conditional failed, one must be fixed:
   	['dell,latitude-7455', 'qcom,x1e80100'] is too short
   	'dell,latitude-7455' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'dell,latitude-7455' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'dell,latitude-7455' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'dell,latitude-7455' is not one of ['qcom,apq8074-dragonboard']
   	'dell,latitude-7455' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'dell,latitude-7455' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'dell,latitude-7455' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'dell,latitude-7455' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
   	'dell,latitude-7455' is not one of ['wingtech,wt82918hd']
--
   	'qcom,sm8350' was expected
   	'qcom,sm8450' was expected
   	'qcom,sm8550' was expected
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,sm8750' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: /: failed to match any schema with compatible: ['dell,latitude-7455', 'qcom,x1e80100']
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: / (dell,inspiron-14-plus-7441): compatible: 'oneOf' conditional failed, one must be fixed:
   	['dell,inspiron-14-plus-7441', 'qcom,x1e80100'] is too short
   	'dell,inspiron-14-plus-7441' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'dell,inspiron-14-plus-7441' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'dell,inspiron-14-plus-7441' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'dell,inspiron-14-plus-7441' is not one of ['qcom,apq8074-dragonboard']
   	'dell,inspiron-14-plus-7441' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'dell,inspiron-14-plus-7441' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'dell,inspiron-14-plus-7441' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'dell,inspiron-14-plus-7441' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
   	'dell,inspiron-14-plus-7441' is not one of ['wingtech,wt82918hd']
--
   	'qcom,sm8350' was expected
   	'qcom,sm8450' was expected
   	'qcom,sm8550' was expected
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,sm8750' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: /: failed to match any schema with compatible: ['dell,inspiron-14-plus-7441', 'qcom,x1e80100']
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: / (dell,latitude-7455): compatible: 'oneOf' conditional failed, one must be fixed:
   	['dell,latitude-7455', 'qcom,x1e80100'] is too short
   	'dell,latitude-7455' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'dell,latitude-7455' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'dell,latitude-7455' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'dell,latitude-7455' is not one of ['qcom,apq8074-dragonboard']
   	'dell,latitude-7455' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'dell,latitude-7455' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'dell,latitude-7455' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'dell,latitude-7455' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
   	'dell,latitude-7455' is not one of ['wingtech,wt82918hd']
--
   	'qcom,sm8350' was expected
   	'qcom,sm8450' was expected
   	'qcom,sm8550' was expected
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,sm8750' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: /: failed to match any schema with compatible: ['dell,latitude-7455', 'qcom,x1e80100']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA0930C617
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 04:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769402479; cv=none; b=h0MkRXv986+HOpe7LqjQSnID7/qOLwMLSivoUkSwB4mB9iDV+aiZ0RgF5uvewHvClA50ctmJ33bQSoj2GmPdeGCZOa/S6ZZwUhQMOe+JWRDyeT0N4pEcMj141KbOMyPk/KqaBDIAybi9dDUbvxarraCb4RtMQ3y7lVLsfQhb7j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769402479; c=relaxed/simple;
	bh=Xs40JQvt6JD7+EyWjnPcFvlQpH7fPxN+aGOiUq6jsmQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qitzS/6JEzGcuMKp0rRDgEXJhnNjQoIIFPx8NFQk99vnjqVrEJP485Ab9MbBhj+Ffj3YXsHcW+iO7U4+378f4a8/yhqO3QdjNeM9uuK5jd9niwIsLeEUi3I8ZDKdLXMW9E8d77INJKa9CfQ9djMHfwHZggCjrwXXuyzBQMOssx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CV17wvkH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CV17wvkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769402478; x=1800938478;
  h=date:from:to:cc:subject:message-id;
  bh=Xs40JQvt6JD7+EyWjnPcFvlQpH7fPxN+aGOiUq6jsmQ=;
  b=CV17wvkHks3R/bruP+oYSK8znCgMVbUbe/opFSndALzeUVqfhUhrtFzW
   zFsZzMppuK5bQuVWu6BYoASmclIIBaKVh8bm7Je9E8w9XilsBHuTukvXq
   IlEsbPLfM4cgl3wVBmslJUPsalVVPvQLGvhPE4nmW3tAFXRBY50l9miGJ
   YODb7hY2jnU2MxmQKtPxMzD2TDBQtrt5QPlO5d2aPX1ikcdxPWZkQqfi2
   jyL/J+84GCnJPeEECHFw18h+a8XDe8OV1OW52oaieoP55cAB7bk1nv9he
   qJFMatUDjtDFS12dOIUcnuvenQiI75tdiGkS5aSMtekl2TbaWFEgjgTzx
   g==;
X-CSE-ConnectionGUID: zVbAnayzSWOpdeaUsKmeHw==
X-CSE-MsgGUID: nOrirLrVRsKFOSKYx4nrEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74420442"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="74420442"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 20:41:17 -0800
X-CSE-ConnectionGUID: WX17ux44RVuOFktgnUqrCQ==
X-CSE-MsgGUID: 3G/RMuDORbiTdj1fSBr3Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207632213"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Jan 2026 20:41:16 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkEPZ-000000001Q9-2VqW;
	Mon, 26 Jan 2026 04:41:13 +0000
Date: Mon, 26 Jan 2026 05:40:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pcarrier:v6.19-rc6-odin3 1/12]
 arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: / (ayn,odin3): compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202601260526.JOyzFTGd-lkp@intel.com>
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
TO: Gianni Spadoni <me@gio.blue>

tree:   https://github.com/pcarrier/linux v6.19-rc6-odin3
head:   91a28d8aa538293ebd31727779aac8f23cb73b39
commit: c2e3cd49f97eda2629ba16e540e6780320719cc5 [1/12] arm64: dts: qcom: Initial device tree for Ayn Odin 3
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2052-20260125 (https://download.01.org/0day-ci/archive/20260126/202601260526.JOyzFTGd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260526.JOyzFTGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601260526.JOyzFTGd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: / (ayn,odin3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ayn,odin3', 'qcom,sm8750'] is too short
   	'ayn,odin3' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'ayn,odin3' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'ayn,odin3' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'ayn,odin3' is not one of ['qcom,apq8074-dragonboard']
   	'ayn,odin3' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'ayn,odin3' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'ayn,odin3' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'ayn,odin3' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
   	'ayn,odin3' is not one of ['wingtech,wt82918hd']
--
   	'qcom,sm8550' was expected
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1e80100' was expected
   	'qcom,hamoa-iot-som' was expected
   	'asus,zenbook-a14-ux3407qa' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
>> arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: /: failed to match any schema with compatible: ['ayn,odin3', 'qcom,sm8750']
   arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: dma-controller@1dc4000 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
   	'qcom,powered-remotely' is a required property
   	'num-channels' is a required property
   	'qcom,num-ees' is a required property
   	'clocks' is a required property
   	'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

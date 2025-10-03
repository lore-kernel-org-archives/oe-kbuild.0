Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E9627442
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 00:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759449790; cv=none; b=TldJMBv56179kR9PZH2itC8p4iJ8cokZIVP+OyiBrEHYT68h4cl9urI1UOsLXkU6At+qAiqkB67npsfwunFgqisQKJ5PNEkOnotrVWj6CpBi1td8qFXeTG/vishwXJB8Z8+gloFnYMU4K1KBFQGLTgGPzn/H/fbs6CVimAHegc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759449790; c=relaxed/simple;
	bh=/fwrKqGBBod58sYIdgTEwiijoCKIs5sa+CDZRnThw9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iEepPCdoyBdAhQOWgrY3RwxobYoV21GiQ8DSklzZSsXlQ5qKM7P4EJSheEDElCYWhXWN3yuCIp08S11ke0GtCqJriHnfJ7dA5qK+geCjQf1yWubiKAPjpS9n3qdQXSLtcJgpxTWDJdFgjUVi6LrdMu+/WBypbbNxErpsclZN5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9a91mpV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9a91mpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759449789; x=1790985789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/fwrKqGBBod58sYIdgTEwiijoCKIs5sa+CDZRnThw9s=;
  b=G9a91mpVvRqKjtrGh2dghuA3flM8g44ylFSt60XDzYevwd2psBEryniY
   mNE8VtvKO5GzuC6ImCvDh3l3K54RtbJvNM2mmvWl6k7roVIzfsgmUZ3pF
   V0f45aD1ph+u0ZU9hMKRby4vof6KPLlMddiMASPiGCvESzbC6KhuTdGq+
   ex0KHG4PKNW2FhuLUPuNzMCYdC265I9PBwPsdAq/h6XguYDfDkbGFqiPR
   Sv5zrnFkkzk/ms0tCLiBugFGE/N1UiOJuHaPQhUPfDXvXI1CVs+Lq0cQI
   rfsEStkSNhxLlnfg5OqY3JPyzEZrzNm4zNIVZCxlNECnT7V9z75jqgE/M
   g==;
X-CSE-ConnectionGUID: KweyDNNgQIaplevb8og4lQ==
X-CSE-MsgGUID: Qsvs3vy5REmICEvjn03Xxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="73166938"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="73166938"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 17:03:08 -0700
X-CSE-ConnectionGUID: hBTySZiiS++Gge//ehXykw==
X-CSE-MsgGUID: ivVf1dy9RCqRy5LJGJNb1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="178974121"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2025 17:03:07 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v4TGK-000000007HP-1HHM;
	Fri, 03 Oct 2025 00:03:04 +0000
Date: Fri, 3 Oct 2025 02:02:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:thinkpad-t14s-x1e 29/128]
 arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: /
 (dell,inspiron-14-plus-7441): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202510030218.77e18SGQ-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   2949bb3792dc77680810d071b39c600a94cb95dc
commit: 63aa0569ab56bd78174547391b313f46335fbd48 [29/128] arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455
:::::: branch date: 8 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2053-20251002 (https://download.01.org/0day-ci/archive/20251003/202510030218.77e18SGQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030218.77e18SGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510030218.77e18SGQ-lkp@intel.com/

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

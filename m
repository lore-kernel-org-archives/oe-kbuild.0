Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277F014D6EB
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jun 2024 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719520500; cv=none; b=fxtm7W3Zai+qUJVQLE8YSiogha1aF7+WF06SOuuqyN3kBY2fmVsmMThBjxUDqQUtYAb1sanlItoFOjMaCAE5F4RSNaXlNPPlE8rwPM5sOUPhlxxAYBSvU7YV4quVTQRdZqCUv2kt/HjMu+VbN7rqxOPHBwtXLNN5oBBHZhGHo7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719520500; c=relaxed/simple;
	bh=N5adhVOZ1C/pHVsYVlruWOQ0DMeBnLaRFuWjd+5GSxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CF0l153mf81DvzqZfqG9WaQVf2j3R4nLQMBT4joKZEq4r/LYp79UkqRUZzp5KFs8Nu7cuuA9LHNF4lnAgUHnd2yIJ6PyvchuykHxbZZuDTLHtIgpwbvKtocIi9v0XwtRwcAU5lVkroYhpSGuTSJl0Irwdlpqx6RYiNmQGEl/FsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEuYgr8h; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEuYgr8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719520498; x=1751056498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N5adhVOZ1C/pHVsYVlruWOQ0DMeBnLaRFuWjd+5GSxo=;
  b=IEuYgr8h9W3FMuGGW01FY4xtxkCAFwIjsfvyYbkP7lMQGSERndGRkA8B
   hxFxELGrG8j/cPIGET35CwLMTuscd6V+xo5VvTedCCSQUFkRY7O+ehnhZ
   CFZO6GOcSQNx6wLX8bRwN+ZH4lElSNjqs4BlAO8UA3ZW50T6GdQtkyAOg
   sFVLFCV48WgX7vVfoAvGSh2ZapQkYf62BoF4cisL0Do5fsIGhRZZ1gLzB
   /j2iD8pVBGwB4H+otYE5aR7xJYK4mVFtMR09kUqEnPcpQSLPea2Jp1xVu
   s+tAezsVTs4v839us8wMtX5cvEoOAhjeY4XkCrABp6J0xDY/GgfJEHaeo
   w==;
X-CSE-ConnectionGUID: tCacuKQeSRWsbQ2w6LevlQ==
X-CSE-MsgGUID: 8pyquUyhSDimqk6KJAGe/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="39198191"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="39198191"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 13:34:58 -0700
X-CSE-ConnectionGUID: o0XADLr/TwC+62JacFkt0g==
X-CSE-MsgGUID: OQnv6l+IQZyEOYqqvbuCSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="44345197"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jun 2024 13:34:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMvpW-000GVp-0m;
	Thu, 27 Jun 2024 20:34:54 +0000
Date: Fri, 28 Jun 2024 04:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: thermal-sensor@4a9000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202406280455.q9pFQTIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mantas Pucka <mantas@8devices.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d6444ba82053c716fb5ac83346202659023044e
commit: 0b17197055b528da22e9385200e61b847b499d48 arm64: dts: qcom: ipq6018: add tsens node
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240628/202406280455.q9pFQTIe-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280455.q9pFQTIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406280455.q9pFQTIe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: qusb@59000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: qusb@59000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: qusb@59000: 'vdda-phy-dpdm-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: thermal-sensor@4a9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,ipq6018-tsens', 'qcom,ipq8074-tsens'] is too long
   	'qcom,ipq6018-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,ipq6018-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,ipq6018-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,ipq6018-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,ipq6018-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,ipq6018-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,tsens-v2' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1144D2EEE6E
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jun 2026 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384321; cv=none; b=dZh8odEDbP//66bp7emRvb8tDBr1sy7H0pX5A+fXaoz1jzDWDj6/Umv7RnzdghaMAT9KtWhomBL50iHFAf/a9YxdjetvXYOVLX26kd6ZUChv6zyliIz0fCDIVmaXiMZSYLE6Xo7+oUrC5L3yCZauI3EYHMhKGePtYrNrtbXzbig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384321; c=relaxed/simple;
	bh=n7fm9zPSecaMdYVEmMynasx3xIBE80cKz0rGKqm4XrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tF/WZv3xJj6XSo+LCoOOWkTvLgXEriE1bgMmq3lVTrxRvZTkvRnSWMGiNAcU+mesknk7XBkcCc+y/Zcryb6gJ/ueb+x14PnUH1JMjSm9pho6h9fjIpP00rJ7WOhfsjgmHXSX8t7saC6yOS2dOaQpKwA/TH3fQPkBmXy87cda8b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJKCx3J0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJKCx3J0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782384320; x=1813920320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n7fm9zPSecaMdYVEmMynasx3xIBE80cKz0rGKqm4XrU=;
  b=UJKCx3J0RebDrsQlIHMfLtI+kMTPdEfOu593UnD9fJMDap+03tpr2+ug
   x3SfD8lx46c+JsJgoZvO1bC1A09ofoOrPRjfx9Hb1eu1y32LZ/t63hsVU
   vc0kMMLCYyJQGavN2jVrH6dQiYLMIyNyBiLvHh638YLUklW83qA1OC6hq
   wukyAkDED2qNdwvMFYKGRtEDb8h31Pf+Axex5dNXqLro4M07Fy0Emi9Rx
   fyDWESmWZBIAUwxl3f/qfMWOJZwkMlq+wp5D6zcsZ6NxkMiJy8u1em8Mj
   QQ9P1X8fP4aXRh5j6scEgyIgBib2NHSg2qj472SJ8wk/MRY7d/HpQMz7L
   g==;
X-CSE-ConnectionGUID: aGwuBnNlRMu5v2tyhHwPig==
X-CSE-MsgGUID: Mf26dTEKTTajdVXDkl89OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83034490"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="83034490"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 03:45:19 -0700
X-CSE-ConnectionGUID: Q/hI1z5oTmyD5Vf838EtJw==
X-CSE-MsgGUID: aO9zyYj7SSOL9kbObvbcfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="249122296"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 25 Jun 2026 03:45:19 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcha8-000000006U1-2cB6;
	Thu, 25 Jun 2026 10:45:16 +0000
Date: Thu, 25 Jun 2026 12:44:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] input: misc: Add Qualcomm SPMI PMIC haptics driver
Message-ID: <202606251242.tKNJ8jWJ-lkp@intel.com>
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
In-Reply-To: <20260624-qcom-spmi-haptics-v2-3-b9118e60f3e3@oss.qualcomm.com>
References: <20260624-qcom-spmi-haptics-v2-3-b9118e60f3e3@oss.qualcomm.com>
TO: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
TO: linux-arm-msm@vger.kernel.org
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: David Collins <david.collins@oss.qualcomm.com>
CC: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
CC: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
CC: kernel@oss.qualcomm.com
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Hi Fenglin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 66725039f7090afe14c31bd259e2059a68f04023]

url:    https://github.com/intel-lab-lkp/linux/commits/Fenglin-Wu/dt-bindings-input-Add-Qualcomm-SPMI-PMIC-haptics/20260625-100335
base:   66725039f7090afe14c31bd259e2059a68f04023
patch link:    https://lore.kernel.org/r/20260624-qcom-spmi-haptics-v2-3-b9118e60f3e3%40oss.qualcomm.com
patch subject: [PATCH v2 3/3] input: misc: Add Qualcomm SPMI PMIC haptics driver
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: microblaze-randconfig-2051-20260625 (https://download.01.org/0day-ci/archive/20260625/202606251242.tKNJ8jWJ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251242.tKNJ8jWJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606251242.tKNJ8jWJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml: properties:hisilicon,sap-dll-reg:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml: properties:hisilicon,sap-dll-reg:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml: properties:qcom,vmax-microvolt: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml
   Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

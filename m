Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA473CAE60
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777647775; cv=none; b=YFCUWZ1Jmtj4PfpuR0W87P2x8n1XAr/qPfD9XlsZ8ijiFhLnSZr9BQQoNmL23A0yGY01i+qzibU6IR9fP+dANxPUpH3ykxeJIrvoXHltEZyNd95Fr00Bjb/tgYKDb+p5o5wxY1DfGD2lhCFoWbFWi0YleNoq1yrSWtV9n+3BQOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777647775; c=relaxed/simple;
	bh=lNxr9Hzem2elq/yYbhETv4hj8PmP27/n1zMe1DjYvSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o4PfIpTMFWXjYO/J9s8Md5+zihLtoOYvMrB/brx4z3Ik4iYggNESLMjhXDoSbo8KRfuIInxTJoNgBlg9ATkXLhCQXJP90YggtwsYshoPza4mnUaqk6R+v/5WlDfYR4yxrEJEKhxF/iYGoMZdJPDVZd/H+sLTM8YvZZWDi2ogkjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHTCo6un; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHTCo6un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777647772; x=1809183772;
  h=date:from:to:cc:subject:message-id;
  bh=lNxr9Hzem2elq/yYbhETv4hj8PmP27/n1zMe1DjYvSc=;
  b=cHTCo6unbsP0desHXTODiuTge4TEoqAZRMXrdJ6bBS1zgel6QsDrQ95x
   2yzu7LYy8U7h2hcqh8rs8dYAF+lpBRgk4J9+xzDUi2Lf8GlHZ7nB3oHf7
   jy6RgPK0EQknPNHhKj7WQ+6F9yYexlrvZdKiLhBeTVIlVZjmqq7uNqVzi
   t4CF0ZUrjjXGz3zBYhvQk0acZlu/hiIcd1zQf3c855ZmSz5E9mcoHVxJB
   IJe3oDN5tBk93BcA8gQm8ch7M8b/lWBlL0FKDqfesjU0YFDJtHc5MRENQ
   RiNJEwihJfyD8HbKwrL1p69exmxVaF8w8mL+4iXr+ogw+9Zt+72u0u2/E
   w==;
X-CSE-ConnectionGUID: sl3YfXvqS6q9fo+qrx1qVg==
X-CSE-MsgGUID: OTHc/YGwRI608+C7gJSNZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="104059416"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="104059416"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 08:02:51 -0700
X-CSE-ConnectionGUID: 8uiR0SR5SpKfNx8m6KFAfA==
X-CSE-MsgGUID: Yk9y5Y/RS3ijRLqY2Qg2xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="232236757"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 01 May 2026 08:02:50 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIpOC-0000000053x-0rIt;
	Fri, 01 May 2026 15:02:48 +0000
Date: Fri, 01 May 2026 17:02:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2
 (qcom,pm8350c): pwm:nvmem: [[356, 357]] is too short
Message-ID: <202605011618.muP4rnjS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vikram Sharma <quic_vikramsa@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Hariram Purushothaman <quic_hariramp@quicinc.com>
CC: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26fd6bff2c050196005312d1d306889220952a99
commit: 39e6ca14ace9d138e40ddd42313c2649a6f3e69f arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
date:   1 year, 2 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260501/202605011618.muP4rnjS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011618.muP4rnjS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 39e6ca14ace9 ("arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605011618.muP4rnjS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: wifi@17a10040 (qcom,wcn6750-wifi): 'qcom,calibration-variant' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: isp@acb3000 (qcom,sc7280-camss): clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: isp@acb3000 (qcom,sc7280-camss): clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[356, 357]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[356, 357]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

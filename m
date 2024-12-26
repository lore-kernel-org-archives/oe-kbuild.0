Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8729818B46E
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 22:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252829; cv=none; b=Ycum0Ey6Vp8EdMZ7VTYzMKj5F0oGCbggtvEEflj7vLCx6mjzH3iKMQtq8F3n3AC0Howr0iTGEIUhN4dxIIbH6NYKrN0uqmseiQ7OkF7oi8t+ACBNNdXzSMmfsuHeyOf8WYMXapRKvwAlJmSOK4H8D7e+QVZXF4kdqe5XgwQ350k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252829; c=relaxed/simple;
	bh=ut4+4KW/zTfmANTpkdc6JROs0/O1h+WV6EhoXJrug8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWNeK6AjGN2a3fCj5HX+BTuRdQ7jdQhla2mN/7yIexLq+VB3hDX01WBZQwLi/GfBojXTVcadRgjKQXGmJGH8hJ3uC1uRlBgwbBH51UCbZPkEuCOJXGONlFxE1kht0bd/Cy0KBGqESMllo3kn45FAGArYjP5Zc2b6uGBIPT5A4W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxpWFUzI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxpWFUzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735252827; x=1766788827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ut4+4KW/zTfmANTpkdc6JROs0/O1h+WV6EhoXJrug8k=;
  b=TxpWFUzI8HTVRAMQDVIm+mpxst9oYtsNbfq+GG7YUO3YB3mDAUXDfPKQ
   Ll9e8shOs/yxHWPQC6bZCHGn5mgVDvYxiGP9tEAKVt9jbJ7T+yQp1pwBN
   ynavdZYoxeQvCbxJxkEv5lW2sdFuPOsN5lvtl9T6DxQTJu30jv2+i6vLA
   O4BdG8Q9h+kSTKol41nWg16WS0hWeZGAI/ytLUT633THG42cEyGFGdFA2
   x6L/LzOPcTi0KQaTa0V9ht6WEzSTo+dPQOi4SjbJ+0X/x3Hw26LQB0XGB
   4HNi2LrExTSePGyoMHCum7dfDDgkMsY27fVXaA7FNr2xGP1mD07cgva9H
   A==;
X-CSE-ConnectionGUID: BSHaRL/1S1iRQPJnKZyqUQ==
X-CSE-MsgGUID: egD+Vt6eQWGh56i41qLsyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35574347"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="35574347"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 14:40:27 -0800
X-CSE-ConnectionGUID: QNQK04nPTUGQJ0cz9gmU0w==
X-CSE-MsgGUID: b1yODJOvTbaON3q3rMTEpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99868254"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Dec 2024 14:40:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQwWl-0002pu-2A;
	Thu, 26 Dec 2024 22:40:23 +0000
Date: Fri, 27 Dec 2024 06:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 8/55] arch/arm64/boot/dts/qcom/qcs615-ride.dtb:
 watchdog@17c10000: compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202412270640.PTdwIdqT-lkp@intel.com>
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
TO: Lijuan Gao <quic_lijuang@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   cc47b123159dbad9c8a7e977e977e410de090418
commit: d1fdad9911e269998e63c60fdeb7ffb378785387 [8/55] arm64: dts: qcom: qcs615: add base RIDE board
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270640.PTdwIdqT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412270640.PTdwIdqT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412270640.PTdwIdqT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0: 'qcom,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/efuse@780000: failed to match any schema with compatible: ['qcom,qcs615-qfprom', 'qcom,qfprom']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs615-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs615-pdc', 'qcom,pdc']
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: watchdog@17c10000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt'] is too long
   	['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt'] is too short
   	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
   	'qcom,msm-timer' was expected
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/watchdog@17c10000: failed to match any schema with compatible: ['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: rsc@18200000: clock-controller:compatible:0: 'qcom,qcs615-rpmh-clk' is not one of ['qcom,qdu1000-rpmh-clk', 'qcom,sa8775p-rpmh-clk', 'qcom,sar2130p-rpmh-clk', 'qcom,sc7180-rpmh-clk', 'qcom,sc7280-rpmh-clk', 'qcom,sc8180x-rpmh-clk', 'qcom,sc8280xp-rpmh-clk', 'qcom,sdm670-rpmh-clk', 'qcom,sdm845-rpmh-clk', 'qcom,sdx55-rpmh-clk', 'qcom,sdx65-rpmh-clk', 'qcom,sdx75-rpmh-clk', 'qcom,sm4450-rpmh-clk', 'qcom,sm6350-rpmh-clk', 'qcom,sm8150-rpmh-clk', 'qcom,sm8250-rpmh-clk', 'qcom,sm8350-rpmh-clk', 'qcom,sm8450-rpmh-clk', 'qcom,sm8550-rpmh-clk', 'qcom,sm8650-rpmh-clk', 'qcom,x1e80100-rpmh-clk']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/rsc@18200000/clock-controller: failed to match any schema with compatible: ['qcom,qcs615-rpmh-clk']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

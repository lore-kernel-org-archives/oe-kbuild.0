Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCC73264FB
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 04:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778129616; cv=none; b=dL7YgLtjSLF1y/T1/ZemczoyEg7cLOjOVvGYCJ0DBQOouKzyqFSr3i/XIOtSNh6R8N4rid+vgvVrkfV+9gp1UtoTxzaqR/dSOusC1vB3DdxfCI9w4SErIhnB40ynii3r39gGx/Brm3i8bK2Ck+y7nQ5oAzpxfoNRZaRAOayjl8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778129616; c=relaxed/simple;
	bh=RTDawp1O33G1qwuFXvGgMg+mLr7PnRwxeLYVJpRLkBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oKFcv2cv24s5a40GAXAi2sI7ezRXInKGXSkzo9the1VcVxplG5ZrVi2b8aEWrB+IB+FOJ6UCt+kn5iRRDwYjM07vFaEzV2DbAmd6ebxCzx2vAKaD0YNiTwSiwIDsz4PI5jeqpd5tPrHl52PVR31fodIFDLuvUNiCb9477a2AWTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3ihsma+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3ihsma+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778129613; x=1809665613;
  h=date:from:to:cc:subject:message-id;
  bh=RTDawp1O33G1qwuFXvGgMg+mLr7PnRwxeLYVJpRLkBU=;
  b=N3ihsma+F3ElVGd/6ZlNdzpzj6Gfh5TLO5bwSbSr76YzNBYE8XomewZf
   ZeqUuKMlzhF6eYCN6xVJmhc5K93GG3frwmW+RRi6h9pntm16sFr6c4QgZ
   GzxMUzeP0T8eYs0KMSEXWa0eCiCUD02kFOjPEwrGDEtx/j1/eurc8VhTQ
   JxWrrLpbWjl6mESarfWkDkomo2HMhYTkiwQAsLgRDwCw/aLGK5VCXjHb7
   b6a2Ut2DlO4MLUJDDAYNbxBz9AT5VCrMBFps+oc/oE5zOlyBT0HU4LPsx
   nclSYRJ1gc1e2ykxbw8hREGYA4qk4Ou5pEc7dUYBbAQ0GSQBVqnxvKjfS
   g==;
X-CSE-ConnectionGUID: HoUGv4A4Q+aVsIXOna+VyA==
X-CSE-MsgGUID: U9ZntaE9TLyi2sNS1TvYuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79059611"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="79059611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 21:53:32 -0700
X-CSE-ConnectionGUID: I4vGakKVQkGSazUP4UR+fA==
X-CSE-MsgGUID: xfGVsjETQ1qfluXgD3qO8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="274489130"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 May 2026 21:53:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKqjo-000000006kT-3wkv;
	Thu, 07 May 2026 04:53:28 +0000
Date: Thu, 07 May 2026 06:53:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2
 (qcom,pm8350c): pwm:nvmem: [[356, 357]] is too short
Message-ID: <202605070639.F9lf9xpB-lkp@intel.com>
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
head:   5862221fddede6bb15566ab3c1f23a3c353da5e1
commit: 39e6ca14ace9d138e40ddd42313c2649a6f3e69f arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
date:   1 year, 2 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260507/202605070639.F9lf9xpB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070639.F9lf9xpB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 39e6ca14ace9 ("arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605070639.F9lf9xpB-lkp@intel.com/

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

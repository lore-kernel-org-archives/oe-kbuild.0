Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0791E489
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735308387; cv=none; b=jyy6KlNt9GcvuG778a1aK75JHCtDktSfrdNYcorZBGBcYDuDenQ1LpwJtWstQD15KiIURl8BQZ4SGcNlMG8yOq++5A3WDFq8Dp093MwlMJCRVw1g9ErbqBt7Dbnv54pvTT7RNhL54uc3vPhYknt1FmBQ9HGd00qlNYr/ErakHAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735308387; c=relaxed/simple;
	bh=vhyKs8fuTZB23RANVdQOGf7upUK15MRKvRbNMf3RNvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkKEUE7RE9WETX+olxhp1cyKFjZC7ZrTq5jpKRR7Y0nANCtFxIakD/9rOuNWDbT1IQiZcOB+z2mRZxCyTgdKIt4Vu0hX2JCM2ZIEsgafcErM+U66RFo+KwCncxAswp3xbD5cPWv4bH7cmtlO173DeQLeUvwDwoGrXHfUEuHiV7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVdnrzSi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVdnrzSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735308384; x=1766844384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vhyKs8fuTZB23RANVdQOGf7upUK15MRKvRbNMf3RNvs=;
  b=lVdnrzSiwO7gj57pkNMxPmKQlsmDPAVAKKk5rbwchT3C1UEhuf1FhN9W
   v/gQhMjjy9Iof4JdT3kVaYrh/ivJX1lVsN8NzGd1fk9rQkfRfVbGJzgw+
   nfc/yxT9UAAfuy1KTSZKWYzCTg9k+uUrxGL+UUe7W9kjzH+gATfO5ZVEF
   2KYb+/fiUdPwXmL8o6L066kRXQq2J17gPdjBwNmpVHaDNyDVQ2mFIHVTR
   7pSfhqqKHWW8cVmK2p0XCc/fG6yU8SZRhcG+w8Ro0n8YpixTKwB72m2ht
   c7ltDTLvW9BtrS39bz0sODJqD60tu6bTKj4HeX5dTMowDvjPYKpw8Td92
   g==;
X-CSE-ConnectionGUID: 59a+aL9aRSK2QOsBQjFokA==
X-CSE-MsgGUID: OXPh9i7ITJy20tQxM34UkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35020598"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35020598"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 06:06:20 -0800
X-CSE-ConnectionGUID: RHl2kTV1TdCxx9QrzQME3A==
X-CSE-MsgGUID: XwqT621jStiJ54hUy/xz3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100287377"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Dec 2024 06:06:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRAym-0003Dk-31;
	Fri, 27 Dec 2024 14:06:16 +0000
Date: Fri, 27 Dec 2024 22:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 64/123]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: spmi@c440000: Unevaluated
 properties are not allowed ('cell-index' was unexpected)
Message-ID: <202412272210.GpGmqcPC-lkp@intel.com>
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
TO: Tingguo Cheng <quic_tingguoc@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: 27554e2bef4d70841c4d20d96c673de51edb353c [64/123] arm64: dts: qcom: qcs615: Adds SPMI support
:::::: branch date: 10 hours ago
:::::: commit date: 17 hours ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241227/202412272210.GpGmqcPC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412272210.GpGmqcPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412272210.GpGmqcPC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/pmu@90cd000: failed to match any schema with compatible: ['qcom,qcs615-llcc-bwmon', 'qcom,sc7280-llcc-bwmon']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs615-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs615-pdc', 'qcom,pdc']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: compatible:0: 'qcom,qcs615-aoss-qmp' is not one of ['qcom,qcs8300-aoss-qmp', 'qcom,qdu1000-aoss-qmp', 'qcom,sa8255p-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sar2130p-aoss-qmp', 'qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc8280xp-aoss-qmp', 'qcom,sdx75-aoss-qmp', 'qcom,sdm845-aoss-qmp', 'qcom,sm6350-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp', 'qcom,sm8450-aoss-qmp', 'qcom,sm8550-aoss-qmp', 'qcom,sm8650-aoss-qmp', 'qcom,sm8750-aoss-qmp', 'qcom,x1e80100-aoss-qmp']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: '#power-domain-cells' does not match any of the regexes: '^(cx|mx|ebi)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/power-controller@c300000: failed to match any schema with compatible: ['qcom,qcs615-aoss-qmp', 'qcom,aoss-qmp']
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: mailbox@17c00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared'] is too short
   	['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared'] is too long
   	'qcom,qcs615-apss-shared' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

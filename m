Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329FF1DF27C
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 23:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736294274; cv=none; b=Y012jQb1fafZYLTEBf/fDtgdLuP+tEcuF+fB0D2j6JTUMZwK0cdSYxRz6ofhd/gCKnSmVUtU/dVYvc0XAVwdCbdsE8kApoF3Q40e7Ak6/B0aVIsSoPBKasapMhB1050yqQq/1QA/DaL+kJG51cw3M71k4dL23fFsMjm9HbaEqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736294274; c=relaxed/simple;
	bh=BtQKw1jUP+jseZPzfUjf3t/+v9+CB3eT/R0XuTt9KwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qkr0RXNSEHvnyNYWT/lrYgcyjS9WbwGJqacUFL9/wNNPPQbEJvZJxyBIcn5Yagr3m1dFWJDdU7IjGEuMSp/qDT41fleSyvxN37TM8PAqZ1YAA1LL1umG/moixOsQ+ctuRH3EyX3SyVYVrcSFa60QOsXSoRrabGeu+7so5hkCA2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjACRGcw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjACRGcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736294272; x=1767830272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BtQKw1jUP+jseZPzfUjf3t/+v9+CB3eT/R0XuTt9KwU=;
  b=JjACRGcw3L+T7suo9tp1/3SCH3z73GBcmhrkhl1Qm7otdkFFjDfSDf3y
   XgfY3rqdd4+22Kx2osSgYyhkFw1kh3SlX1Yc7Jo/Btcfme3I71u0Vainj
   FcxdYi4N+hfohuP0tz1/iYnMQh0COa60M3N0waG4PvSQTYjidEGkd9xEz
   UL3bc/o68zN1ZHHhIhT7ls8yGTrwzAZdlT3xFEE+kaXuVPgs7muA+b6ma
   qUivKZ0tyFeMvudK5W+agaSdELzP8TkaZbGAG1zzVLeUmt6ccgmOcd7T9
   pcGclgB8O98eu+pvs5m2VDK3gNTt5C/HvspIy/U5d80P7VX/XRUpuA5JY
   A==;
X-CSE-ConnectionGUID: 4sSMTzRYSZSQ69k5AGmc7g==
X-CSE-MsgGUID: 5lN3Bpg2SMab9vpsJMIZEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="35795550"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="35795550"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 15:57:51 -0800
X-CSE-ConnectionGUID: HorObaJUSaqgLY9jQTe0kg==
X-CSE-MsgGUID: HMdLo5aLQM2eum4znhOfvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="107971434"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jan 2025 15:57:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVJSG-000FNn-07;
	Tue, 07 Jan 2025 23:57:48 +0000
Date: Wed, 8 Jan 2025 07:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 132/204]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb:
 /soc@0/interrupt-controller@b220000: failed to match any schema with
 compatible: ['qcom,sm8750-pdc', 'qcom,pdc']
Message-ID: <202501080712.6uvayrHg-lkp@intel.com>
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
TO: Melody Olvera <quic_molvera@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   256e6937e48a14cc5ea02ce9e4e0fbb4463c4464
commit: 6a02becf4b42f1664d9443e7d2049dd4e31e5ff5 [132/204] arm64: dts: qcom: sm8750: Add MTP and QRD boards
:::::: branch date: 7 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-051-20250107 (https://download.01.org/0day-ci/archive/20250108/202501080712.6uvayrHg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080712.6uvayrHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501080712.6uvayrHg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
   	'qcom,sdm845-gpi-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sm8750-gpi-dma', 'qcom,sm6350-gpi-dma']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: interrupt-controller@b220000: compatible:0: 'qcom,sm8750-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,sm8750-pdc', 'qcom,pdc']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: iommu@15000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	['qcom,sm8750-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too short
   	'qcom,sm8750-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,sm8750-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sm8750-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,sm8750-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sm8750-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,sm8750-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
   	'qcom,sdm845-smmu-v2' was expected
--
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
   	'qcom,sdm845-gpi-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sm8750-gpi-dma', 'qcom,sm6350-gpi-dma']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: interrupt-controller@b220000: compatible:0: 'qcom,sm8750-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,sm8750-pdc', 'qcom,pdc']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: iommu@15000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	['qcom,sm8750-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too short
   	'qcom,sm8750-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,sm8750-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sm8750-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,sm8750-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sm8750-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,sm8750-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
   	'qcom,sdm845-smmu-v2' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

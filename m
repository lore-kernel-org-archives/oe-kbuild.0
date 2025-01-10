Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B316DEA9
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jan 2025 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736499217; cv=none; b=p/JLj9fkeNaYpLotIhlqd820JPFbYQkLkNuw6Lx1kaVpZrGkGW6Rl5VEdLc5Amv/5FPcG2M3zRP7jQ4mdYAlIsyTCjFuJfozbSJVOzkyTWaz1yA+Dm1KajVr5s6OnCYflmFw13GjBde2UX995Ylv12YD3gKFEgpQe7piV8MTHaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736499217; c=relaxed/simple;
	bh=n0qun7aFIdV+QF+Bc+0vDWol+4ax3NiK+rhzA61xrgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfF65Qc82qGqWKSLuP7wQ7puq57RmpWLCivClYJ8aYEEwHYZSplh1PsitOGil2i3HBBwrMufRbWH+HZaiD90HsbqdUkWZigs2roeu9dD3GibZX6m3JFxM5fVk2djMiZDxcgOsBLerBfKNKha32yZQxrxbKHalj/WWvP5MGX7Giw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OOyVvw2i; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OOyVvw2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736499215; x=1768035215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0qun7aFIdV+QF+Bc+0vDWol+4ax3NiK+rhzA61xrgA=;
  b=OOyVvw2iFgt3A8ivn8L+h1qN1/6dpYwwTzlUXmXXLfCWtMXrlnbnpMit
   lG4A582sT4Kg/71Fxc3sOnpLd27J2edc+elyN4wTKp0JiY1yICG4wm74Z
   QfEVt8yiVT25iYNmxMB+XLP030D9UkZ6GQcm2IyHsbUQUp8ujL3J3b/a3
   YtHIdOEx61a02lBN3OgGDvgNvgGNeduc8e8C1YJQ6fhr0KB5kuh+Zvh4/
   nBZKgnYIjvJ2+qAgsvcjaF5iXlEFFSLcrwzyngmWnimMJ6LQdNnZAMR0G
   ypu5+WdVnZzk/DE9b6PpfGj3dfOCm4dE6QWZppyhGEW0oaGNgBGoUtW3P
   g==;
X-CSE-ConnectionGUID: fqSPRW2WR2CyT1ZcC3mxCg==
X-CSE-MsgGUID: KX5RyGIcQFCdxWG9J7BDUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47778899"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47778899"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:53:28 -0800
X-CSE-ConnectionGUID: dhCkOgF5TuStdyJQIbhEjw==
X-CSE-MsgGUID: rOq4cJlvTM+oVgjyeDBZ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103858266"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jan 2025 00:53:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWAlg-000It9-21;
	Fri, 10 Jan 2025 08:53:24 +0000
Date: Fri, 10 Jan 2025 16:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 207/225]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: compatible:0:
 'qcom,qcs615-ufshc' is not one of ['qcom,msm8994-ufshc',
 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc',
 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc...
Message-ID: <202501101657.ro5ThO2h-lkp@intel.com>
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
TO: Sayali Lokhande <quic_sayalil@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Xin Liu <quic_liuxin@quicinc.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   983833061d9599a534e44fd6d335080d1a0ba985
commit: a6a9d10e796957aefbc4c8d53ed7673714e83b31 [207/225] arm64: dts: qcom: qcs615: add UFS node
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250109 (https://download.01.org/0day-ci/archive/20250110/202501101657.ro5ThO2h-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101657.ro5ThO2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501101657.ro5ThO2h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma'] is too long
   	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
   	'qcom,qcs615-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
   	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
   	'qcom,sm6350-gpi-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma']
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: compatible:0: 'qcom,qcs615-ufshc' is not one of ['qcom,msm8994-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6115-ufshc', 'qcom,sm6125-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc', 'qcom,sm8650-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/ufshc@1d84000: failed to match any schema with compatible: ['qcom,qcs615-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: pmu@90b6300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs615-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,qcs615-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,qcs8300-cpu-bwmon', 'qcom,sa8775p-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,qcs615-cpu-bwmon' is not one of ['qcom,qcs8300-llcc-bwmon', 'qcom,sa8775p-llcc-bwmon', 'qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/pmu@90b6300: failed to match any schema with compatible: ['qcom,qcs615-cpu-bwmon', 'qcom,sdm845-bwmon']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: pmu@90cd000: compatible: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

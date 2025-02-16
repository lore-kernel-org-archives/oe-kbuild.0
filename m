Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8D17E1
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Feb 2025 00:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739666340; cv=none; b=ksxbCJmRmczBLmscLQPcuHJIvKFWvHPVPBCgOdOulFo8R3hXYc0fXkZvXv1MZG9fqFgNCsgoH7++JHlXDP82i8UIfhpL1pOU0pctCDbzcteyGu+0nx7bImHe8TSektWkymHPTf90UT6tzWl9Pa2aXY9zmtARN1H6HMskii5vUP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739666340; c=relaxed/simple;
	bh=uyEZOqt9ph+LHIBnEanWoWhB/bNLRE5g0M8LRgzrtI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kf1h6Y4Yrppv2bjOUBGt/0EdMUJBKvLt4SWYxMLRbpS6FpG6ihEFknP7NMjUJnRGYjuwIWkQPQNI4esJ3hlUodWVUlqocZ3HuJOfYgKQAu/Iw9gJbD8nJjz+H9/tQEXEkn+hgq87UDDc+gNioTjUCgv5NsJvydFdOeZmzJst9QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdF9NVZr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdF9NVZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739666338; x=1771202338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uyEZOqt9ph+LHIBnEanWoWhB/bNLRE5g0M8LRgzrtI0=;
  b=BdF9NVZr4BOUtG4DQThsT1XztUb5Eoxq/ZTKvavAl7Fr+Uc2YJ7Sd++D
   erS7J3bWcmWz7ybSRsOI5SrGc98CCp79LuYtnghh4zXf9pZJ20z5ZxoFS
   q3ktUrfzZS+U6jV3GTszXeB8KSegcgZFiSpyQmXxCjodHFUs9+Ejx4HqQ
   rfcBv5XfAtoWc8xb25lq95mVypIU+JDJVfm9XX6JoAIINXZh/ImAXT8zT
   bIXeoSw/OC+TjFbTxXgV/8qbuAY4QwCeeMbx8C1wFaOaeRAQo55FEiL0U
   s7ZYiDVQYVEmJF24Xc8AVFMj9ivMh2JHQTmOhUsVZYMyHbIfTWeUihg6c
   g==;
X-CSE-ConnectionGUID: eE7yPspXRz6i/88pqNf3xQ==
X-CSE-MsgGUID: jGV0g6QHTdaAEz3ebKt7ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40089631"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="40089631"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 16:38:57 -0800
X-CSE-ConnectionGUID: jT20ZYhGRvyknSuB14S3GA==
X-CSE-MsgGUID: r9KeJQK2QTuXRiNkZOGDUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="113522237"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Feb 2025 16:38:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjSgQ-001BRr-1E;
	Sun, 16 Feb 2025 00:38:54 +0000
Date: Sun, 16 Feb 2025 08:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 17/40] arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000:
 compatible:0: 'qcom,sar2130p-qfprom' is not one of ['qcom,apq8064-qfprom',
 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom',
 'qcom,ipq5424-qfprom', 'qcom,ipq6018-qfprom', ...
Message-ID: <202502160855.rIeI1MRG-lkp@intel.com>
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
TO: Sricharan Ramabadhran <quic_srichara@quicinc.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   ae416f8bcfc1f2229f3f67a79fb6bb05cb79174a
commit: 8cdcf834a992f20026a96df1c54c166718dcd534 [17/40] dt-bindings: nvmem: Add compatible for IPQ5018
:::::: branch date: 11 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-051-20250216 (https://download.01.org/0day-ci/archive/20250216/202502160855.rIeI1MRG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160855.rIeI1MRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502160855.rIeI1MRG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000: compatible:0: 'qcom,sar2130p-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/qfprom@221c8000: failed to match any schema with compatible: ['qcom,sar2130p-qfprom', 'qcom,qfprom']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

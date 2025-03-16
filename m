Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22512170A23
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742138724; cv=none; b=YWfVztgiFwRVYOnAWllj9nfvRunl6pgDVeWnJ7wYxHU2MjJQpR64Kbj/o1LMvHAIYzLeEeOQhHW7UVWjJf/WDVyzHFWE6dx+mzVfQV8tX+UGmOytlz5F4b8EU86d4O/WmJfgRwLB08sWbFomU82sdPprl8YaNHg/mMhi9Gw6q3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742138724; c=relaxed/simple;
	bh=ubOJHpRYiEXPIEBDPSFJ4L0PLlY5VvSvSLEW5gSnqzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HbqInLKFgbYJYFtnmY1uKtzqewBk1aIwDVBQWogJ+5N4H0f+wsgzOuFcXeujSgopxebXjPT2uwSbxkUboHEj5qcgcYodcCcN8vfF8kRLCs0JQeQXzQ+pk56s7iVNeXocOOAGifEpWQbpGIUhSpR8L1/ONkhSb5YalxrX2cqQet8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTsNoc0c; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTsNoc0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742138722; x=1773674722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ubOJHpRYiEXPIEBDPSFJ4L0PLlY5VvSvSLEW5gSnqzU=;
  b=XTsNoc0cnW6rX7B+lp1zIYcHQlCK1tL4BjexMjwE+2QxZe0a2VetgXSB
   R+DpWOA80fBtflKTlXnndu4obJFIIYkLU5cvoRNp9+KD8ni9r71/IVe6P
   adl1kCWULpK/AdLn9I3/yL900Lb+NavNqWWFBMOV0tuuNGF369tftzfBT
   ZpnFM34U2rQ9XLOnr17MsXqRuko3aWG/GQxI5YaB/o+SJ5WE9aPRVqleh
   mCKBBvkwMMrPgY2zLQI231VCfnxI5yEiB3XZR7WgYR8xTwJWHLsjOXc0m
   oCDuzQej45wc6v2/A3Rd8ep9D6cC3ifEVQe7a8I8m8QqshJoAEPOJjcus
   g==;
X-CSE-ConnectionGUID: pkAtztLhQW6zXB//1xkcaQ==
X-CSE-MsgGUID: 6+CyiSsXQqy7lHBEPY4Drg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="42415012"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="42415012"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 08:25:21 -0700
X-CSE-ConnectionGUID: zq4D6nVzRGOHy+BJlT/HjQ==
X-CSE-MsgGUID: 5nHrGZX2TbaE9U+BsYLsIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="121538108"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Mar 2025 08:25:20 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttpra-000C3b-0b;
	Sun, 16 Mar 2025 15:25:18 +0000
Date: Sun, 16 Mar 2025 23:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.15 124/172]
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/pcie-ep@1c08000:
 failed to match any schema with compatible: ['qcom,sar2130p-pcie-ep']
Message-ID: <202503162304.hQg5kWFS-lkp@intel.com>
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
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.15
head:   27b85be287f96180de2499b981eec83850df0da9
commit: 84247db00a5c4f9b6fbf23cc46979508ddd8d855 [124/172] arm64: dts: qcom: sar2130p: add PCIe EP device nodes
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250315 (https://download.01.org/0day-ci/archive/20250316/202503162304.hQg5kWFS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503162304.hQg5kWFS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503162304.hQg5kWFS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/pcie-ep@1c08000: failed to match any schema with compatible: ['qcom,sar2130p-pcie-ep']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000: compatible:0: 'qcom,sar2130p-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/qfprom@221c8000: failed to match any schema with compatible: ['qcom,sar2130p-qfprom', 'qcom,qfprom']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

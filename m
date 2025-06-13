Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA521A3150
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749811578; cv=none; b=ZvuHuSULFP8e4yBU3zKAgkS0Ipe0/yzGaG3PMIOa2pq+w/yHZdOuEVb8THPUERiotruuBnuhcc3QVrHBIpfU2M0OLxpeQ1D72kiJCZqug5Fpy5taj5KH81uXTH/QebWOLzM/9z7lEcz6fvwVJBxc546cHgu4pc5CRLQejYx8pRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749811578; c=relaxed/simple;
	bh=LhQgU3JtAGjpn0hDkK5GhHyHr4vGPuvkrEbT4ie+Elc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bXqxOiA+V14TBAjtJyurRF86kWzxMFhDc6H3Y5WRytX0uyKb8cdvypjqPJIV/NoYdj4e3dPNvEq2OyyOAd3kCa+HKDByUYm396uxbbGUOnSg5YAOnSa08l+MPNPkxF3VuzxmO01x5ttrfzJY8R2ABjy1ryr2FLOEVmr3uyyA0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkSpzPQ4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkSpzPQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749811577; x=1781347577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LhQgU3JtAGjpn0hDkK5GhHyHr4vGPuvkrEbT4ie+Elc=;
  b=IkSpzPQ4AzfQXX2SO9izB88YFbme6i72v3zC87jYuJrT493pYDqKgVVB
   cGLVYxLMbRcSFv3a+D8y1BVtvYLRR5jYxIX5oFpJIMsqMJvVRceIlZSzn
   zcRAWibzh1+tjSfZkko6vdqvGQx3/6nMgBDT4yKnIRvX2vT/dFQ0RLYF+
   5NZJ5kPpIERehqWmvshHh8twAxsIxkDph0vrAYKgphLr/pqZzRsBmLZ0I
   nbxUh7B6DVwK/6MPKHZqnco97jS4pvqVVnh91Lgoz/NSdxAvgvz7/577C
   4x9oWI+jiPojfeV9P/AnzHLgF9lLk6JVT1iE9K2TBg7S6nas1BIHlOWMT
   g==;
X-CSE-ConnectionGUID: hjaqHCOxT8e0z6ZLB/M2hw==
X-CSE-MsgGUID: BHi69d0zSZODNMQle6i54Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51890735"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="51890735"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:46:16 -0700
X-CSE-ConnectionGUID: W8iysfy0SxK+w+K1Ta+kYg==
X-CSE-MsgGUID: imb/kL3cS0unkf9OerUShA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="147675838"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jun 2025 03:46:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ1vI-000CUM-1X;
	Fri, 13 Jun 2025 10:46:12 +0000
Date: Fri, 13 Jun 2025 18:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] arm64: dts: msm: Add eMMC support for qcs8300
Message-ID: <202506131843.V9iUuXWo-lkp@intel.com>
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
In-Reply-To: <20250612092146.5170-2-quic_sayalil@quicinc.com>
References: <20250612092146.5170-2-quic_sayalil@quicinc.com>
TO: Sayali Lokhande <quic_sayalil@quicinc.com>
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mmc-owner@vger.kernel.org

Hi Sayali,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sayali-Lokhande/arm64-dts-msm-Add-eMMC-support-for-qcs8300/20250612-172345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250612092146.5170-2-quic_sayalil%40quicinc.com
patch subject: [PATCH 1/1] arm64: dts: msm: Add eMMC support for qcs8300
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-051-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131843.V9iUuXWo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131843.V9iUuXWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506131843.V9iUuXWo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs8300.dtsi:3840.23-3894.5: Warning (simple_bus_reg): /soc@0/mmc@87C4000: simple-bus unit address format error, expected "87c4000"
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: soc@0 (simple-bus): mmc@87C4000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: mmc@87C4000 (qcom,sdhci-msm-v5): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sdhci-msm-v5'] is too short
   	'qcom,sdhci-msm-v5' is not one of ['qcom,sdhci-msm-v4']
   	'qcom,sdhci-msm-v5' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
   	'qcom,sdhci-msm-v5' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq5424-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qcs615-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sar2130p-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx75-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm7150-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci', 'qcom,x1e80100-sdhci']
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: mmc@87C4000 (qcom,sdhci-msm-v5): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

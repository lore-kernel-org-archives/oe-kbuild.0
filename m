Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1322571A9
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203974; cv=none; b=ZBSFAheRpxh+e1uyWB8IDgAw7LfzyozykwyELgsJQ+4cnQSunQXN6r5LX/vDfvDxw/nqskEyVOAaUOZ6Kpg5IDChf3yRap0KxbCwkzjw9nVVLujgamqiyPhEEH6oWJQC0lWA5i0+g53EMpjCMoEWCLwpk7EHTbmSDjIk/UigulE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203974; c=relaxed/simple;
	bh=au39aXOxGIGQufSCn5lVqZoeixCEgyz5PbzdBZcafDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsJKtx4E8Zviqt1QBBQuZzp7b9mPR0J/xTiRAzk907gPG+XS8nU1BB+Dt4nREHbUfKghOFQL+AVX8I5Di2OemNMgDgFDmvgPmmMcKDXPSMtNyd3csZ3jEzIX0YAb9mTL+fFvgvFNaMkIY1u4i/MZH03ImS/zMiy+MSURaJotxaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InjtZ7Fr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InjtZ7Fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746203973; x=1777739973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=au39aXOxGIGQufSCn5lVqZoeixCEgyz5PbzdBZcafDM=;
  b=InjtZ7FrrBIabua+/knbGcl8vfbOzAqizRBiVP3EtcMSf6h8gFRVKQ5T
   lhvGXw5rpkXJO+hfDsaI/DDTT7LRKuLsOnhRqjs71UmdMxQeNdtCf6yC8
   tth+Z/RmQj6CHAeiNx9bFxuzhg50C/VwKHfIjTyMsMnWZsenufcMyGruf
   wH/oEQzlVgcN64BXo3SLyCRlBfcx5zp1UOnF7WAWOXnETT4YGymY5IGY4
   1yqan1DKLzgRZUv0mX7U6TmmchK47xUT9IXm4gJDiVY17CCUtM1eQ1ovR
   bCSTZj1eLndoL4svNlWx/IrCAB8yqBgfOtJ/J1lc24fqOMi65jMBS+cYM
   Q==;
X-CSE-ConnectionGUID: /zEC2yycR+OM/rrCGDWj0Q==
X-CSE-MsgGUID: IOcvJ7DdRCWqLhedswM/dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="51705981"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="51705981"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 09:39:33 -0700
X-CSE-ConnectionGUID: /2ffpaLmS0+FzCPQO1PmNw==
X-CSE-MsgGUID: qs4PbxdESR2VMsj6Kte2EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="171933852"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2025 09:39:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAtQ9-0004tl-0Y;
	Fri, 02 May 2025 16:39:29 +0000
Date: Sat, 3 May 2025 00:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add support for qcs9075
 IQ-9075-EVK
Message-ID: <202505022334.1LnSBlNQ-lkp@intel.com>
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
In-Reply-To: <20250429054906.113317-5-quic_wasimn@quicinc.com>
References: <20250429054906.113317-5-quic_wasimn@quicinc.com>
TO: Wasim Nazir <quic_wasimn@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kernel@quicinc.com
CC: kernel@oss.qualcomm.com
CC: Wasim Nazir <quic_wasimn@quicinc.com>

Hi Wasim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33035b665157558254b3c21c3f049fd728e72368]

url:    https://github.com/intel-lab-lkp/linux/commits/Wasim-Nazir/dt-bindings-arm-qcom-Add-bindings-for-QCS9075-SOC-based-board/20250429-135126
base:   33035b665157558254b3c21c3f049fd728e72368
patch link:    https://lore.kernel.org/r/20250429054906.113317-5-quic_wasimn%40quicinc.com
patch subject: [PATCH v6 4/4] arm64: dts: qcom: Add support for qcs9075 IQ-9075-EVK
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250502 (https://download.01.org/0day-ci/archive/20250502/202505022334.1LnSBlNQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505022334.1LnSBlNQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505022334.1LnSBlNQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
>> arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

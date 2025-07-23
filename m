Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2ED221727
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Jul 2025 17:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753292740; cv=none; b=C2+56cbketPYj8t9GgOpUGwWHQxEpOGFDQ27XS7TsJlz9jVaxvn2mrvstBG+Ht8dW4shJ0yyhTaY6sQPQ9N2P6/Td87eJgd9b6Xs1MDEr7kz5dylXiF960J2A5LWoju5EPFrCdQadmfvjAVqPOZgsYkNR7QApHV2HsVyeQxknW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753292740; c=relaxed/simple;
	bh=W5Wrkagw1HTABgL/WZPH4F27XGyqV+du/KPhV97uGhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGw/0SI8E/T0osNBNs+32opzyrq/IRNiq36sff6BR9IR1PRBUoCVgAJLOQoqSgB12lgos/kzTfcondhdsxEKPUsxF4z44+CO+JRWqd924uEjzpro+eUeh2e4tz/GWbbyrHpvVxeIHckz3CSg70WGYLc99a5XQcm2gNp+USycMz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OC0fZg9t; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OC0fZg9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753292740; x=1784828740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W5Wrkagw1HTABgL/WZPH4F27XGyqV+du/KPhV97uGhs=;
  b=OC0fZg9tnfz2nmOtuK8yjEYNU9Vv3mdO7LNY0axLRV4us+bDgvDesSLp
   L7782AhlsiwItgowiMXn21Thb+l9FYJTYKWITfGMtM5yQ1e8TAw2/m/gK
   aGt0tVXA+QdH0+esU+u1kx8AuDRtWE9uW9juYgY68iwlwnTz2aT3ZdjbH
   9FyhrYcGBm7Rt22HtHzxFZjKenBNZl+f0B1JomjHACyycLG9Cy0kFSF/L
   WlteCZ2EAsutHXgT2BPirgpIbdvU15l0WdY7Nnt9czqtWcD96uHDRDqaf
   fQiDwDqyqiuIoI3MW4evq22vDGq1pDEqrIabEoQvq6ZOlTkLU63RSVaEe
   A==;
X-CSE-ConnectionGUID: bfztUklKS7SFalZUkibTKA==
X-CSE-MsgGUID: 75QEYwAESWqzlARQseTrsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73043050"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="73043050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:45:39 -0700
X-CSE-ConnectionGUID: eG+F9TLXRMeOAskf/VGEgQ==
X-CSE-MsgGUID: g52rWWe/TcShx3vDex2ggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="183291683"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jul 2025 10:45:37 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uedX5-0000AO-1p;
	Wed, 23 Jul 2025 17:45:35 +0000
Date: Wed, 23 Jul 2025 18:39:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-iris-dts 3/5]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000
 (qcom,sm8750-videocc): 'required-opps' is a required property
Message-ID: <202507231813.Rdw5ESeg-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux b4/sm8750-iris-dts
head:   758baa8ffd437590909ab98026bc94c6c515db6d
commit: 4a8f97d3a420624cfd72ca8a2f6f5bbb68efa3a3 [3/5] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2051-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231813.Rdw5ESeg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6193dd55535460c347f8c0b794df7d7d52fa78c9)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231813.Rdw5ESeg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507231813.Rdw5ESeg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): power-domains: [[99, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): power-domains: [[99, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

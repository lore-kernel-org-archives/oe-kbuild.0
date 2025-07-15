Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C021553A3
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 01:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752544614; cv=none; b=Su6tyhh01vI+qcSQjZbNUdnfsuHTEqkpHSNN7a4DftI+JizdeCNH3FEZVvN4G5Fa+zdbdEBLvegguUyvXASZVYXYLd69lGd4jhn8Y0JCKW0eB6A+hSY9/8ygeh3hL0j9XrA1csFgknGw9Ro/2foRgyu7/YKO9Yox8r72tU4DgN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752544614; c=relaxed/simple;
	bh=OV3Gd+cnTNQcdON3tSL98Zgn/3WlOn1Sc27dd27TTmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=en2Sq5FT3/z+xvWua8bazTasEHLbl9XiYj3iihZ/+amB2noTyFIytjs4gsEtG1Lq8CurmRpgANB2usfAqEgNhsmsJMoXcw5eHwen28mlzjpYGRP0SDF5KjGOWNdgOdgi3I67GpShEzwd5HMbAW2YTS012MYJlKkEDMpJKH1r9Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoUfRjpK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoUfRjpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752544613; x=1784080613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OV3Gd+cnTNQcdON3tSL98Zgn/3WlOn1Sc27dd27TTmw=;
  b=XoUfRjpKd8AvWzRepeu/697s+f9d1zaFVKFIt5yAyF2YqWql1mObERCH
   gXJyRF6dx8plQMX0pJ0SK/4rlgKIL8I1Zk/3+7DjuclK2mP/Fj6j+Qy6N
   /vHLMIWWdzdCFOI1K3l6/e6aYrmzImxTx3mBAk6hmYhorv0zD/oHuvvir
   dwsOObao6kGFuY/ODxYyQQCGkCyvlB8zD4OB4k0BeE1I0xysJmRNx1WQM
   GQAHYWjFJOyG+Yoc4zYWvwe8ld9fGneCvyPPn9ZkKQ1WnRKFzNLqnjJA7
   HF+r8Sr7vE7VkTTyDCuo0rMQUUc6EaSdajHQRc4mmAdsoQgZcILiX4y6/
   Q==;
X-CSE-ConnectionGUID: lw49P90nTVu90i+g6ckL9Q==
X-CSE-MsgGUID: iyfA1gWfRXCN5SA8vEFHKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72201705"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="72201705"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 18:56:52 -0700
X-CSE-ConnectionGUID: SQXwN3FrQuSfzoWb4qyHNw==
X-CSE-MsgGUID: +Kc37kcjREC/8tZHyS4iGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157195311"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jul 2025 18:56:51 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubUuW-0009XL-1P;
	Tue, 15 Jul 2025 01:56:48 +0000
Date: Tue, 15 Jul 2025 09:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-iris-dts 3/5]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000
 (qcom,sm8750-videocc): power-domains: [[99, 6]] is too short
Message-ID: <202507150959.TchR7EJw-lkp@intel.com>
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
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-051-20250715 (https://download.01.org/0day-ci/archive/20250715/202507150959.TchR7EJw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150959.TchR7EJw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507150959.TchR7EJw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): power-domains: [[99, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): power-domains: [[99, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

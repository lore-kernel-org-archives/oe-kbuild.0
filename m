Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BA52A8C1
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 06:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007150; cv=none; b=pXgvmAjD+EqTIokmcj+PAuKfglv6Ok1/h2DTbGRhR0B7eAEBgyGk104lQMGY54mB/pA2sp8fr/lX16G5RqMcSrAvrWx+VWLpysrUzjey3LRTDDb3uYhve4FJOnd0ZNgSbgvuquB8vtNADxVT8yvWA/+vedDdsQ2K+Ps5ggBxc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007150; c=relaxed/simple;
	bh=7QI1nve89bqiOnWE3I0tjCbZMLYlFcMm8dQfJ0FpZI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+9zcsT65LS9/uxMOrnbeVSL5tVDgGGy40YfMPEGl+zYLqc8vx/osJg9+QLHlXlDDmiBn9pRpbHMFn9avzBXqMVGpvSupSHnwJZPgbk5aZZoPI+y984iywRLdPM3/bYje1lgvp47r6fL6rXz5C+lxrouuDlRqxddEGSfL1VA+Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdo/hO+C; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdo/hO+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744007149; x=1775543149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QI1nve89bqiOnWE3I0tjCbZMLYlFcMm8dQfJ0FpZI8=;
  b=jdo/hO+C6orZZqRWHFYBu+j4+w1L4UHOONv8XpVBekz59Ev1JaYLQCpT
   w3bsYJ0pNhGcOXyLufaSCQjJr77AqW+Jxfg8WUYriyKOkjf4Wu6fHVNtS
   RRe0moJybmgyK3OdaM7EqMz4VGsBgLrOTG/e0oychRIrhf33LAGTvqwBU
   a8GGTv+q6VqmFAhIG+9z9m8ewoXd9lK9YG91jQFoZn58bY5Ao8hUN+F8D
   BQgRkbhNg2CeQGzRhAkV3z+7PVT25dpLsYrKGnzsb6QS7pgW0mvyxrGDm
   juWV5Qa90iIg+MF+yMVys/PWbwJze6UAWBiZweCkAvL3uUbmpIM2vsD0x
   A==;
X-CSE-ConnectionGUID: SCOifu+rQU62kjH1XBW4qQ==
X-CSE-MsgGUID: 5mINW1P4SR2mo4VJ/PWtAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="70748083"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="70748083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 23:25:46 -0700
X-CSE-ConnectionGUID: uquhc6kCQ2yKrWmUKMYlwQ==
X-CSE-MsgGUID: +iyIhXN4TXalj0lRyW6gcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="127704940"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2025 23:25:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1fvT-00032N-0L;
	Mon, 07 Apr 2025 06:25:43 +0000
Date: Mon, 7 Apr 2025 14:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 29/102]
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: isp@acb3000:
 clock-names:12: 'gcc_camera_ahb' was expected
Message-ID: <202504071445.DIPa4d3h-lkp@intel.com>
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
TO: Vikram Sharma <quic_vikramsa@quicinc.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Hariram Purushothaman <quic_hariramp@quicinc.com>
CC: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   239252d33658f16e30ebbe940292946ccc610d00
commit: 33ce75c6898356ce742118443ddb063fd14e5c76 [29/102] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071445.DIPa4d3h-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071445.DIPa4d3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504071445.DIPa4d3h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2: pwm:nvmem: [[345, 346]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm: nvmem: [[345, 346]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

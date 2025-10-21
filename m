Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2515A239E61
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057073; cv=none; b=hUQUsGg5L83lpYsHPettB30l2GFOBnYwmFnWHHH1M15UodYEFBttMc9J7/6kZaxk0IBxmJg6HQw2Is5X1NZ4ahyOMj2gKkY27eWWO4mX0WDs2R3AZH+4wd7MnwHC7J+3YKLux7n8D2VczfSrtEkvTUPQMPcMQKgvSoa4cBTNiDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057073; c=relaxed/simple;
	bh=Z8DayR7dtRHNHTrLPG1pb79ngsBycXGftIvQYqU7znM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YCkqq4V1MqEZNV6l19ZVt5QCqFlz/WVposdB9l6VZYlBvHQJbCxSDdo+VtG5iRlvxgwTMiZpRy/+nhqSpLpYa3t/Nmq2amFMKsKY/mAs+MUeSNtsc8bCfmNdxo2AMyF2N6UEzW438D0xqp3Fp6QZstb1djhdZ59mfE9eMLMX0YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qi18L8RL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qi18L8RL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761057072; x=1792593072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z8DayR7dtRHNHTrLPG1pb79ngsBycXGftIvQYqU7znM=;
  b=Qi18L8RL3sNmbCdg1iDrmI12PMjETeOUNiRJ7DSlN+J2zuZwjhbl67Cf
   gncEXeZWaPvEFbmdr+NosBvMpd+1K/pM9Kk0LbrI78ePAKWb532XJsq5o
   3GtWOkkkRcj0VQh8VOWCsj4U+UBCqoTkgu8j7FQy35H7g8waFu7dDLf6n
   TYnoh6cm8VAAyiMJ3M5SQO0ti5kc/9pzhRQeKJOpCLENonq9Jrs3ctMqN
   bpxNu99WyuZCqcvhqHLG3R3oqrxToPzKt85TrWbfXIC4BmXBPKd7zdLCq
   sMwxQYPzWL6/jmJrJPUSrv1VR5cdeuRe5gOdXw0zrTeEQ6iLKpB8K2xPH
   w==;
X-CSE-ConnectionGUID: jkOKEDeGQA6ZUl04ToYxHg==
X-CSE-MsgGUID: eF+d9zfBTKSJqPV9HF0MZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50757220"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="50757220"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:31:11 -0700
X-CSE-ConnectionGUID: A1Ly5waCRyKPKwzCrPou9g==
X-CSE-MsgGUID: ckOAhoT9Rryi2BXoMUuNUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="207278348"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Oct 2025 07:31:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBDO9-000AuD-2m;
	Tue, 21 Oct 2025 14:31:01 +0000
Date: Tue, 21 Oct 2025 22:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550-hdk: Add SM8550-HDK Rear
 Camera Card overlay
Message-ID: <202510212204.LSEpEa40-lkp@intel.com>
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
In-Reply-To: <20251013235500.1883847-4-vladimir.zapolskiy@linaro.org>
References: <20251013235500.1883847-4-vladimir.zapolskiy@linaro.org>
TO: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.18-rc1]
[also build test WARNING on linus/master next-20251021]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Zapolskiy/arm64-dts-qcom-sm8550-Add-description-of-MCLK-pins/20251014-075814
base:   v6.18-rc1
patch link:    https://lore.kernel.org/r/20251013235500.1883847-4-vladimir.zapolskiy%40linaro.org
patch subject: [PATCH 3/3] arm64: dts: qcom: sm8550-hdk: Add SM8550-HDK Rear Camera Card overlay
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-052-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212204.LSEpEa40-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212204.LSEpEa40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510212204.LSEpEa40-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtb: /soc@0/cci@ac16000/i2c-bus@0/sensor@10: failed to match any schema with compatible: ['samsung,s5k3m5']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDED620C485
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730979852; cv=none; b=KDPX7HhVrD+9WSF6XDQrtq2iI39AjzBROQOBjZhTgOLwvVKed/6a4JKh4LggNswewciL6v8wXXJRfEo0PHFb4YOizVgL+iW7XcJilS93OeWgzxoGAN5LPgvB9CwTLhRbA0G5Q8wn/s6l6r42NRynYBvJz6llko/m5Q9nq+cFLao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730979852; c=relaxed/simple;
	bh=cNckj2d5hquLTpCQ8zd+7y02ULaEwn5KHRnB/TWuicg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6mtDkaSYP8nmbgYQJMdo/aCEBujjiSLUm/uHk+rEAntE8LHTcd3bFJwefO65uaZG6fxZxUR2N/vZtWJMYSdmD/A1WTJxB8nXeATbaaCacQswM8Cbp3dXEDJ3vTQ/5YceoREWdpxIZApp0s9RKTcMcxLI5VcmG62ulUhVGRwJ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZ3rTDdY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZ3rTDdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730979850; x=1762515850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNckj2d5hquLTpCQ8zd+7y02ULaEwn5KHRnB/TWuicg=;
  b=CZ3rTDdY0HcPBasA3lfFs9uLr5DNbNI5DgPGUR1AX4GIqBs9pX7xFIKq
   A88FhmvZIByUXd3PEpF8fxFpoVTHye4HlIoqkTHLDNelNBzKqKdVkBbv0
   TxxE4v/TzfDUCnRJmyH5COa5PBa/V+Zi8dhtHXRcexcYNhGz7Pmk2Pe+D
   LkbR00ZjBfAkCixCdDZPURDFazEngU4pc1rd/BW7+AHh788s3//wRXYyA
   1Hqm8fLRE0KKtw06BueKswH/zfgESyBsltNvBdYWNO7cQjOMGxynP2Wni
   8hs7nRMCXpegthvyZbsz9T4gRavARU/f1xH9lXD19cxPagm1uhehTHs+i
   Q==;
X-CSE-ConnectionGUID: CfMTcrICS9GEFLtLqtudnA==
X-CSE-MsgGUID: 7neEJzQcQlWuzityEvojEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30931915"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="30931915"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 03:44:10 -0800
X-CSE-ConnectionGUID: HKQ9QUbdTia1l2SlzmtW9g==
X-CSE-MsgGUID: nd1NTuUoToqEVv5syUe+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="122554276"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2024 03:44:09 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t90vm-000qBK-1Q;
	Thu, 07 Nov 2024 11:44:06 +0000
Date: Thu, 7 Nov 2024 19:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V1 1/3] dt-bindings: mmc: qcom: Document level shifter
 flag for SD card
Message-ID: <202411071922.w1erNWGi-lkp@intel.com>
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
In-Reply-To: <20241107080505.29244-2-quic_sartgarg@quicinc.com>
References: <20241107080505.29244-2-quic_sartgarg@quicinc.com>
TO: Sarthak Garg <quic_sartgarg@quicinc.com>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Bhupesh Sharma <bhupesh.sharma@linaro.org>
CC: linux-mmc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: quic_cang@quicinc.com
CC: quic_nguyenb@quicinc.com
CC: quic_rampraka@quicinc.com
CC: quic_pragalla@quicinc.com
CC: quic_sayalil@quicinc.com
CC: quic_nitirawa@quicinc.com
CC: quic_sachgupt@quicinc.com
CC: quic_bhaskarv@quicinc.com
CC: quic_narepall@quicinc.com
CC: kernel@quicinc.com
CC: Sarthak Garg <quic_sartgarg@quicinc.com>

Hi Sarthak,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on ulf-hansson-mmc-mirror/next linus/master krzk-dt/for-next v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarthak-Garg/dt-bindings-mmc-qcom-Document-level-shifter-flag-for-SD-card/20241107-160710
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241107080505.29244-2-quic_sartgarg%40quicinc.com
patch subject: [PATCH V1 1/3] dt-bindings: mmc: qcom: Document level shifter flag for SD card
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: csky-randconfig-052-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071922.w1erNWGi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071922.w1erNWGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411071922.w1erNWGi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mmc/sdhci-msm.yaml: qcom,use-level-shifter: missing type definition
   Warning: Duplicate compatible "adi,ad5694r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   Warning: Duplicate compatible "adi,ad5696r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   Warning: Duplicate compatible "adi,ad5311r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   Warning: Duplicate compatible "adi,ad5691r" found in schemas matching "$id":

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

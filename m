Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA134A4828
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054774; cv=none; b=ZfFfyzThUMl5sPa3wXzJVgg+A0oyIlYMvmDc1BcSzc5ueu45YXruDcGLMokkeL//aeien4sgPLXYqgNPGrejtVkPmLxQcgo1bCZs9d2cCR5+KuJOOs/DJY2yYo8ConGujs2zKkpHDDruIVoY7doXiDgXb5kFRMTH4tL/a8Tyr6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054774; c=relaxed/simple;
	bh=BkNnfX3M9JtEiTrxi+Kpy1/qX5b44gaW6jhzaCJwoUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQSN/jEdvXJfOh6PiIA2AbpBGTwRggD3frmHeCb9bD2aMYzhwlmhGwql9vZDsmZK4KOIArEkMjbNySa1KkcvfuaunuUXFv2BbYfhmy+LeozOVB/Gyff93UAByPrwsER9a0xFjwv614mcRPLqz9O2uGg4HV6gkVgFhIkEAFm2NEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDDjTnC3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDDjTnC3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054772; x=1820590772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BkNnfX3M9JtEiTrxi+Kpy1/qX5b44gaW6jhzaCJwoUA=;
  b=dDDjTnC33UmX7rmJVtz7JGwALLkY2eNfIcN5FQgQ4fgJE1BHvsyzm4Ib
   YxGPsZcNZDlYHLpfIhCBxvi20p3beG/xteS1kHDJtkuGxWTJY0CAk43AW
   ui3LIcTs/0DHDB+Qs+5zJY2F2V+wdJWeOzDYhPNK2IvE/eSjia1a8TZMH
   XtrxCQkUHX3SYmxBl/5sblj7Pi5VCrr4Thvpq41MmdTGmCO1S0PdBvL60
   GZHKMDjmS7V761y41ylaGJToF/7Gy95BgfWwwlhJXMVG/jS8kZnPMraPD
   pQPKBd3Elaw2qknoNJi4h2/qBK8dRLxIbqGkrWzA4VCfCW6ktpy9cmlhH
   Q==;
X-CSE-ConnectionGUID: AAHUOH7bQgGy1P6GUC81BA==
X-CSE-MsgGUID: wX8xMRs5TmqvlV9mvbShtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89271586"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89271586"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:31 -0700
X-CSE-ConnectionGUID: cXkDhfgNTvWDN1WNIIpVXw==
X-CSE-MsgGUID: XkB50cjfS9GAg/5SgcgF6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267395187"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2026 08:39:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gs4-000000000Pt-3BVI;
	Thu, 10 Sep 2026 15:39:28 +0000
Date: Thu, 10 Sep 2026 17:39:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: purwa: Add PSCI SYSTEM_RESET2
 types
Message-ID: <202609092217.BKNSBRZH-lkp@intel.com>
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
In-Reply-To: <20260901075552.3558150-3-xin.liu@oss.qualcomm.com>
References: <20260901075552.3558150-3-xin.liu@oss.qualcomm.com>
TO: Xin Liu <xin.liu@oss.qualcomm.com>
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kernel@oss.qualcomm.com
CC: xin.liu@oss.qualcomm.com
CC: tingwei.zhang@oss.qualcomm.com
CC: jie.gan@oss.qualcomm.com

Hi Xin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e30626823a406725ce29bc75cb8ec467d3e1e326]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Liu/arm64-dts-qcom-hamoa-Add-PSCI-SYSTEM_RESET2-types/20260901-005545
base:   e30626823a406725ce29bc75cb8ec467d3e1e326
patch link:    https://lore.kernel.org/r/20260901075552.3558150-3-xin.liu%40oss.qualcomm.com
patch subject: [PATCH v3 2/2] arm64: dts: qcom: purwa: Add PSCI SYSTEM_RESET2 types
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2054-20260909 (https://download.01.org/0day-ci/archive/20260909/202609092217.BKNSBRZH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609092217.BKNSBRZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609092217.BKNSBRZH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

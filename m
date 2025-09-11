Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E319929405
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757617544; cv=none; b=cqV6Y9Eoa2gDx1En18Xw/ghQnCm4s4eo+c6KsUQHxmgc2LCzvT8l1PnVpKkwrSGWTXhn1fg6nHdEILIAHIBewpTUVU0k8m9jN87LBabwn6gJnIDVWybBuROxkr9nca6/njqKrbLPIz5BZEvPi3OjD+tq0peAqVifO02hVHcrY30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757617544; c=relaxed/simple;
	bh=efRf6Pw3ggwedVslokC1vXtz7t/cdsAdVqEzm9sKUmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QX30eej7nPkH3iGzfYc5831usBgv7t1+RrgmmyOE95UEFow50rAhH+Rr3hdQ2n5i7IQKMxwNRIRCC2cHdcvoHiJSuaoAHJUozXymGD+TA4zHqOtDndp3J6wdPVKLcH90IsuZeRBwWU4Bn8gomBS6M8cVpCdEPWeEaN1JCMfyFlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lH4YuUpf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lH4YuUpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757617542; x=1789153542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efRf6Pw3ggwedVslokC1vXtz7t/cdsAdVqEzm9sKUmM=;
  b=lH4YuUpfKs0LbbvN1i32owLD88sT7M0gqNt/aGklj9RfiDM8v/BrF52I
   q83tKak7W7Pxyh/uOgLOcYAGlaM28j8cXiV5+CMRYICoAGJmGKTYoPbOP
   VESogmpYMkX1bdp69IQ4xUkr0vPydUEZ5pLY4Lof2tmE73bLaaEXV3xgh
   n/n9IWRMh91nItTC1zflguV245eiBuZPnjNPO+XMQfDCM89a0lu4Yb4Ky
   Hed/N0X9fIjwuxHVS24Djg8wE2FSVXbsbL9GKmiZ34x9QT/1myEFQRcPf
   sklcXdKo3DL/Lzg4/m/zgwudHzYXtdMdRSWZtAdcCe6hu9yFLsm7eiyc4
   g==;
X-CSE-ConnectionGUID: nD5KLTLYR/WjgugqLdNhVw==
X-CSE-MsgGUID: RPj2UbfbQJe+xKww4dwW+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71387669"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="71387669"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 12:05:41 -0700
X-CSE-ConnectionGUID: 9nUVism6TuixFS4vJul2uw==
X-CSE-MsgGUID: 0rFzBwq2T1WXkgJrr1jRLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="173680604"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Sep 2025 12:05:40 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwmby-0000a8-0p;
	Thu, 11 Sep 2025 19:05:38 +0000
Date: Fri, 12 Sep 2025 03:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: apm: Move slimpro nodes out of "simple-bus"
 node
Message-ID: <202509120222.T6uJRIE1-lkp@intel.com>
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
In-Reply-To: <20250910214822.508317-2-robh@kernel.org>
References: <20250910214822.508317-2-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: soc@kernel.org
TO: Khuong Dinh <khuong@os.amperecomputing.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc5 next-20250911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm64-dts-apm-Move-slimpro-nodes-out-of-simple-bus-node/20250911-055018
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250910214822.508317-2-robh%40kernel.org
patch subject: [PATCH] arm64: dts: apm: Move slimpro nodes out of "simple-bus" node
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120222.T6uJRIE1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120222.T6uJRIE1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509120222.T6uJRIE1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-storm.dtsi:750.4-753.42: Warning (interrupt_map): /soc/pcie@1f510000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
   arch/arm64/boot/dts/apm/apm-storm.dtsi:750.4-753.42: Warning (interrupt_map): /soc/pcie@1f510000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@78010000, using 0 as fallback
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /: failed to match any schema with compatible: ['apm,mustang', 'apm,xgene-storm']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /: failed to match any schema with compatible: ['apm,mustang', 'apm,xgene-storm']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: / (apm,mustang): poweroff@10548010: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: refclk (fixed-clock): #clock-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: /i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: /hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: soc (simple-bus): reboot@17000014: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: pcppll@17000100 (apm,xgene-pcppll-clock): 'type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/apm,xgene-socpll-clock.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: socpll@17000120 (apm,xgene-socpll-clock): 'type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/apm,xgene-socpll-clock.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: socplldiv2 (fixed-factor-clock): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/fixed-factor-clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

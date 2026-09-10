Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC5738C402
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054895; cv=none; b=kI1Z7JtdKN8+4jvzb81gBnek0cFTtBbWmv7Z2rnk0pU/vEO9B40NeY4vCwgilvd8eGgUhIaGCKsnhPkaBziRSjBYhzut8KfMJCB/+cSkZvTKHlF2MS65B1Gbk/8dIdwIXvPtMxAnrNl/63i5wqam4bEjgLD45MYqsTn2fkGDQx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054895; c=relaxed/simple;
	bh=eecHe9LuMBaBJYpXnizRu8axnjgKmATDC1KYYt8Jkn0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R913kHH93Frb33WuM9lQDzaqAl7u60wdmFw4GO2T5+sGnEN9ynkGnWkw2jv1AoBVxsyvlhfhMJDFSyLwoHwuVGPYo+NjBblcOc18eMAMGM/Y8Qk8fTuoRKZWK6JmE6JoHgxr7kk79owL4Zkep5kQNQwDs0u4TgKpwda/5QgVzog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzkqKNG9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzkqKNG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054894; x=1820590894;
  h=date:from:to:cc:subject:message-id;
  bh=eecHe9LuMBaBJYpXnizRu8axnjgKmATDC1KYYt8Jkn0=;
  b=bzkqKNG9thfyfMQvOiLMUGYukPfRkAcmPuO45UxIITC1jBzZ58aeW5VF
   Dwr2Y0+2mm99XtPHNZN3tzjLBmicmZHKp6uQNbmOgNjECU5QSLp1bE/Ds
   wtSTkTAdoufsBA1i/GPu0uHkaPJH+IfxRUAJgp4D5izvRAY3sMPZWcgxD
   7vGgPAGGSycu8fQ2bmeJVVjUiw7+PFCImcChaz/UAeFQB4COXR4Ij7G/y
   TUtt/CCoZIdH6EP4eHzz6JoER0z7NENMVkg8OBslLvKtJc3+8FoZ3IWIv
   YxK1OybgE24Thr7pzHNUKa7KYIA9tbgALtbsuLgZPSrYcD4s9Cn/vMnKd
   g==;
X-CSE-ConnectionGUID: NJw5PCPjQT2bpu+d15Fl8Q==
X-CSE-MsgGUID: f7oaA/M0SeqdPj/iOes+pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77066949"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77066949"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:41:32 -0700
X-CSE-ConnectionGUID: yNHIywdoQ1Sy/tZGSOXGlA==
X-CSE-MsgGUID: Nk7x6HpiSQ2g2Be8IKQSdw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2026 08:41:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gu1-000000000Qv-2Kr1;
	Thu, 10 Sep 2026 15:41:29 +0000
Date: Thu, 10 Sep 2026 17:40:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: psci
 (arm,psci-1.0): 'reboot-mode' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^power-domain-'
Message-ID: <202609092320.tWvdnIrt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Xin Liu <xin.liu@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Xin-Liu/arm64-dts-qcom-hamoa-Add-PSCI-SYSTEM_RESET2-types/20260901-005545
head:   b21fb300d29b4cde0e43c08d2eb4b60080ce82ff
commit: b21fb300d29b4cde0e43c08d2eb4b60080ce82ff arm64: dts: qcom: purwa: Add PSCI SYSTEM_RESET2 types
date:   9 days ago
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2054-20260909 (https://download.01.org/0day-ci/archive/20260909/202609092320.tWvdnIrt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609092320.tWvdnIrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609092320.tWvdnIrt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml
--
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: psci (arm,psci-1.0): 'reboot-mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

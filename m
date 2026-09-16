Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824D3F9A16
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Sep 2026 07:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542528; cv=none; b=WgQLhwG0HXiHqWh9H0UKCGe2DhRgr2Wvyifq5sTighVFaLMhTkD4+vS43xvwjZgmyfOrFTHXFdtsP6N7AStVptnOZwqJ70Kue0QrNSsZ5w20XFI0D0XKNIu7oSg+2fNJnZoxpAC5V298XltpUEaQIJsjzRLtcKg0QfB4G6AzWQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542528; c=relaxed/simple;
	bh=vRV5U+LGa0QZxX/gIXM4Q03HU75GUU9HcVgWArAK54s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aEuPZ53IGnHLRDPRuOdTeNSaE0pt9LiXhKy9V7lWvLvA33ahHVChdrCrp4fhSTGwcdqxdBexSRiE20C+GsjwOyHF4Z5oRUPeCfmBKPRfoi++zY37h2fdJMR8w1PZDM2G0wfpFYKOpcVmodbRuvs5juP6WFk1V71IBH8sJRh5g54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHAvCVnm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHAvCVnm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789542514; x=1821078514;
  h=date:from:to:cc:subject:message-id;
  bh=vRV5U+LGa0QZxX/gIXM4Q03HU75GUU9HcVgWArAK54s=;
  b=oHAvCVnmxPBMha1nqEN4/YZ3h0Av1P+vpPJ68zlBSikh0uW4jmryVoFx
   Q2k6aXb6tSWZvk6iiAq2VTnf8F0criE93qz2ZjJr9RP5C7fRJeYPf1NNP
   PgQYfzMSz0yBVdSIbAknMajMh0ykq+x5INraXDSlsaaldH1hZI7qStxe2
   YrRWl6Hc/STrTG4RT51MA3SUuiRrtrISifOrGMJlzQn2PK9iebz2n+G1g
   r7BPb+l8tvqG3mJaeW5c53TKHMD+L0P3YIakCEB9cevjcf8001o4xOmnc
   SRU/yG2xRAUxNimzHDlx74uZnD9Trc6nEBl8z4lHzr8ZJwzhohqWi2lgm
   w==;
X-CSE-ConnectionGUID: 2DKI0MdUTf+TTBQjUgzs9A==
X-CSE-MsgGUID: ZoVNRFjiRSG7vf/0xL30sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100577267"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100577267"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:08:31 -0700
X-CSE-ConnectionGUID: 4RTK6nKvRnKrsJ/BHdteLg==
X-CSE-MsgGUID: H6DAvhVXRheLUYVVa1yaXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311527986"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Sep 2026 00:08:30 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6jkq-00000000035-0QTW;
	Wed, 16 Sep 2026 07:08:28 +0000
Date: Wed, 16 Sep 2026 09:07:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v7.4 5/5]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb:
 /soc@0/mmc@10808000: failed to match any schema with compatible:
 ['altr,agilex5-sd6hc', 'cdns,sd6hc']
Message-ID: <202609160905.bSkMi1rO-lkp@intel.com>
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
TO: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v7.4
head:   0199e7aaa990971c62dd48e55e879b66d842d511
commit: 0199e7aaa990971c62dd48e55e879b66d842d511 [5/5] arm64: dts: agilex5: add SOCDK eMMC daughter board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260915 (https://download.01.org/0day-ci/archive/20260916/202609160905.bSkMi1rO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160905.bSkMi1rO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609160905.bSkMi1rO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_emmc.dtb: /soc@0/mmc@10808000: failed to match any schema with compatible: ['altr,agilex5-sd6hc', 'cdns,sd6hc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

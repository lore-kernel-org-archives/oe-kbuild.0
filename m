Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71EA2594
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740882625; cv=none; b=LDoXWE3AH95h9gZ0xysjI3JzQD33GrJzq9GE56YrlYomQvmkRcinpFRsaIv9RXrmyKn1Qf6maUbWPvz12v3G3g8dCTCgD1RLlsMIof2akKPyPMVlPL54BinoNwD9R5lGbXKUOlnEJiV6IJ5XdHn3pjuuXUSY1Q8yG+Oi5vZ5qTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740882625; c=relaxed/simple;
	bh=xs5RPldzwRabRRjCRbKHeDZaAIQ1DD7unx9o2ipKXSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jO/ltxSAuk+Ds0QFl1Ufqhew8JXbrziL6sDu0qRtbyLkXWZEZ1vSDqpLEeZ5v7tvFlDD58AJpH6PVTeaZ+RqbacgMPq+xmVa6fWK/Y0e7a9PJQARFkqCaglWsofPtACF3Nlmbpljd/7rCTiQgYq0EP2B+cU7h9gznMHaS+5tIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltDYQTT4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltDYQTT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740882624; x=1772418624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xs5RPldzwRabRRjCRbKHeDZaAIQ1DD7unx9o2ipKXSo=;
  b=ltDYQTT4EWrHlQQlz76mZzYSl2RDsCn0VkY28vou94iILXm/isot2cmx
   sknAex7TujchkggNQ0ftc9kWM2eK4kimt9Zh1Zyg0qUrKP3UYZNTt1OWO
   E0+hoSycdrFCZmNB3UdqmaonFXbhVc/wRaQ7IjDvVYZNjdm3aOQN/J40+
   kWQkf8zcDIeIZjle84ub/+TS7LPDAP4Jq+AvJhrAhhbZDiiW2cn0KtL3u
   MXb8dPChaYfQPR9CPKY9+72GKedbj/cizXmgUGZfLORoARL6t+OW5mJnw
   2v3fu8vYAcZDQ6b0X93joMf3QTVF6b1jw2g9JC6WWJQh9FZOEhvZ9U6TA
   Q==;
X-CSE-ConnectionGUID: NShDSH+LQv2h8m1ObiPzYQ==
X-CSE-MsgGUID: g2XexlAjT9OZC1MoFT98lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59323385"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="59323385"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 18:30:23 -0800
X-CSE-ConnectionGUID: uNxUojD3Qiu+1bzfrX8DKQ==
X-CSE-MsgGUID: Qe7Y1utPRsWptm1dkoubLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="122687187"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Mar 2025 18:30:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toZ5v-000Gy4-1r;
	Sun, 02 Mar 2025 02:30:19 +0000
Date: Sun, 2 Mar 2025 10:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 36/64]
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/otp@2a580000:
 failed to match any schema with compatible: ['rockchip,rk3576-otp']
Message-ID: <202503021056.UnPGuBbo-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   c55c9e91d1643493d0434f246917aea7a2653e0f
commit: 8715d2eeb062f6859c252bb6c87b363230b66e9f [36/64] arm64: dts: rockchip: add rk3576 otp node
:::::: branch date: 29 hours ago
:::::: commit date: 7 days ago
config: arm64-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021056.UnPGuBbo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021056.UnPGuBbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503021056.UnPGuBbo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1816.20-1882.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1816.20-1882.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1816.20-1882.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

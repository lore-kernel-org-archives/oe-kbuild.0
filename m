Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBE737F745
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 20:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775851459; cv=none; b=hLMLoyoFHSOHOarnJ+V3qusIiStXvAvMh5U4s28nNcDhm2SlhEZ6+CueOdVIcTdMVAY4o8q1XB+fau9sTYZu+UDHiU9NxA2SdpnYLpOwu9dbrPOeQKkyHmFMa9Ijyh7fWRhBY42kGGsYbHT+rtScHXecP2qQY2HXpxGclHSpehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775851459; c=relaxed/simple;
	bh=S1rD7H2b4olos+HTajawkSxjmBtPQNcohVG8hWAFODY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CQkm6Kn3RvmUv45Mbw2GjzyhYVoK4Xh5WCuyox8SGYplOikTkrfTMDRwjQouyfXpHzL5LLZiLdhScZcNNA3Xv+1z2TnDZ4AIZt33Ie236sTgDfJpvVyCm+UjFyj9/dC/uoO1cBk/7Ygh1qsQ35mgJNQrjJd2NJy+DXxM3hf9lFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ap5peUs3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ap5peUs3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775851455; x=1807387455;
  h=date:from:to:cc:subject:message-id;
  bh=S1rD7H2b4olos+HTajawkSxjmBtPQNcohVG8hWAFODY=;
  b=Ap5peUs3l2RMx/B1nSU3e3Oa8TWWPDdZEzsyLBVEHuoLn5WT/m2ww1ub
   mYTyINODSHJfnZdi2prlYtoXW+HDVSPbmaVZQBGcG1P1BKa0nGfwo2dMq
   WaloxVhLo/Ezkx0uowS6rF1VYYA8Z5+v2I6MdCDCXG8bw4ay70RIeMwHk
   4ViFxYanY2VIUVruQy8LWgvGAmK930+UaTY+lrIGSx1TE5TEeyW7Yb9t8
   aTto4BydoFPwA4WJ0GPvF6VJgBdi6hF2cA6XPI2IcbRex4HNDN1jFuKhR
   84trgnZf5W4isZyiIK+9f4rJq7puYc4gavkGYpw+ANUvhWR4v+hyGZcTG
   g==;
X-CSE-ConnectionGUID: oSsRnNU0SxqNw9Qv1yULGA==
X-CSE-MsgGUID: SJ9i+oz2TaesfseZfNW3Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87956511"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="87956511"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 13:04:13 -0700
X-CSE-ConnectionGUID: 0iKfVqO8SxmvRKx5akZUCg==
X-CSE-MsgGUID: VmY7TPqFRFKSL+KLYyTTzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="230901212"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 13:04:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBI5K-00000000AwT-09cQ;
	Fri, 10 Apr 2026 20:04:10 +0000
Date: Fri, 10 Apr 2026 22:03:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:thinkpad-t14s-x1e 40/106]
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: csiphy@acec000
 (qcom,x1e80100-mipi-csi2-combo-phy): 'phy-type' is a required property
Message-ID: <202604102119.DWREl3cE-lkp@intel.com>
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
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Sebastian Reichel <sre@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   c368130866898c0f67e75fb8e36b0708e623553b
commit: 40a946ee61fd0529d2c0532dac6ff9a9006cced6 [40/106] arm64: dts: qcom: x1e80100-dell-xps13-9345: Switch to CSIPHY4 description
:::::: branch date: 22 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2052-20260410 (https://download.01.org/0day-ci/archive/20260410/202604102119.DWREl3cE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102119.DWREl3cE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604102119.DWREl3cE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: csiphy@acec000 (qcom,x1e80100-mipi-csi2-combo-phy): 'phy-type' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: csiphy@acec000 (qcom,x1e80100-mipi-csi2-combo-phy): 'phy-type' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

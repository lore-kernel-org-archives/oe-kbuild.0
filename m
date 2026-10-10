Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C19367B70
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Oct 2026 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646234; cv=none; b=I8ro8xrJkwnrCju9QT00dWo88urtWr+1BD4cG4yWDrcRX7xrrHcHfk46IEW1LiBT/P4YgVTjvRGh5FIO9+kmc2dyQHYHZCJO8bAGDf3pKw5B89OTS/CxYoB8ebEu/BzfgIjT0sgfQCJhQC5BUyad5srmkEKENq9j6qMOu6ZsXz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646234; c=relaxed/simple;
	bh=QdZ7gavC+gWNR0RWOl3A+xps5QdZFqb4AgyHwWyG+Zc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IlY778HW8WYxANy5vSGqumH1EHI5vC/7fEdRjhlViCWBdRmyFmXxQZbHQYkoOEJOV63+JV9DlmeBUGhcG63UkdWO+pZOefwYie7W64elx5JBtgQ4i2uQbIf/1cebqt1kiqmNgkFkp7eKDVeCE3SJrIbyewFo25XC5Hkne86aMPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtPO5eXs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtPO5eXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791646233; x=1823182233;
  h=date:from:to:cc:subject:message-id;
  bh=QdZ7gavC+gWNR0RWOl3A+xps5QdZFqb4AgyHwWyG+Zc=;
  b=BtPO5eXsly+OmqnqaaOMVU5vE4Wn1itS76tBDst13EXcDmSoRfXUZ0of
   1oxyzvFdXmQ25E1ihTEsjLxc+dVeaYxh8auZD6UTy4QodTAtJAXZFcOl0
   xYieQ11TetAdYi/3ANyldKI+Vxhq9DudZnxa98NChd38tW/8r5ZzY74DG
   KTzCnE0060Unpnvayka8vm7T4/WXKVfiH9VX76qH01VkNUYcBzYdhM9og
   +zwEQpsVRWg+DGUfC5bEnBPoc5xWRbvtfZGCHBsf2IK7EMxkd5g0Vn0gN
   nE6zARPcMkFCcT30T1tVLCIHS1yFJIPenTCdYk13Yt0Vy+191BiiJfiEi
   w==;
X-CSE-ConnectionGUID: HHkNSVP0SUG5HI5L7qkBRQ==
X-CSE-MsgGUID: DU4yLIhrRjqgtUovwlSmqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="423211"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="423211"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 08:30:32 -0700
X-CSE-ConnectionGUID: E1kdFdLqQ4O1wUilERh7dw==
X-CSE-MsgGUID: DHHn7+94Rs+K8o/se3U8Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="995152"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 10 Oct 2026 08:30:30 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFZ1o-0000000092h-05DV;
	Sat, 10 Oct 2026 15:30:28 +0000
Date: Sat, 10 Oct 2026 17:30:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 186/323]
 arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtb: ctcu@8001000
 (qcom,shikra-ctcu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202610101747.ZJTDoihl-lkp@intel.com>
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
TO: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.4
head:   d053e38e614fb2e383b298ce8fc308a780d7f209
commit: a4be00ccf9e0bdcfd407397368e0599c559d90be [186/323] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay for Shikra
:::::: branch date: 9 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2403-20261001 (https://download.01.org/0day-ci/archive/20261010/202610101747.ZJTDoihl-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610101747.ZJTDoihl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610101747.ZJTDoihl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtb: ctcu@8001000 (qcom,shikra-ctcu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,shikra-ctcu', 'qcom,sa8775p-ctcu'] is too long
   	'qcom,shikra-ctcu' is not one of ['qcom,glymur-ctcu', 'qcom,kaanapali-ctcu', 'qcom,qcs8300-ctcu', 'qcom,sm8750-ctcu', 'qcom,x1e80100-ctcu']
   	'qcom,shikra-ctcu' is not one of ['qcom,sa8775p-ctcu']
   	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtb: /soc@0/ctcu@8001000: failed to match any schema with compatible: ['qcom,shikra-ctcu', 'qcom,sa8775p-ctcu']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

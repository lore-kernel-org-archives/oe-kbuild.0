Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E692511718
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Jun 2024 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717848460; cv=none; b=sZMqjFOd2GiYDeJKngd9koEa3VwrtCAsW8DuLvUO2I+ibSDUqP2afeTkSZU8Z1OKLd72eFccOTLQzHuAU06jPIsDIB8HoPTfoTk8C3UvSnckPycD2jXQ5zubcdCaw7cAynS98ICVY4XngoDp0tEgbdA7XWFycKfT9vZ/LG9+cN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717848460; c=relaxed/simple;
	bh=01yDGB6PXVdnSs/TKmjnPKUFegco1VEyiD/Ia+c2PLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dqBqIoQMPsXcU9w8Ukl6NugKcxITUaJvr/XdPtaX/gTcHH8Mp2KmZuwH5NULgpFJeWzxaY0VEY3ZQLjlDgSSNm/VMDg477T5cBkUfscx/GYdnVUSbaFbaI68BkkL3K6D4AONnpkpCUqvc3mKpizdZ+na2xuE3d4OtTjhy3mrrgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/rElSpR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/rElSpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717848458; x=1749384458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=01yDGB6PXVdnSs/TKmjnPKUFegco1VEyiD/Ia+c2PLE=;
  b=O/rElSpRBMfbvRfPOhuM5/GLfL0dCot7lmUWx4qmusx06wl47v8VCN9L
   t2dquOHQF3bVOiCWs2kzJhN+NarSRo5v8OmA9gc2dnVijRjYoBv9d6jRt
   MhKxJ5ybSIfk0sKjiaT2Nw+ZwLGxmu4Tq4hLLzr8Zm/zzepL1u4xlpgE0
   Vv3KQwo/s8o7Cgk8Id/r6O7kuVK4rpWFHbnaiDEPPa5rpAjT15cy0XvyP
   40wE7Cp9QaSxKeXEHGVzHQqlqa/m0uxHX53BbKRVgDMrD5+Py5VgRy4q0
   fYGM9hbqbR84PwAbYlv9GlIVotx6E12eM4wOINiAUP8CgSwUqmzpNT//e
   g==;
X-CSE-ConnectionGUID: 3ULtgl3NRv6c7BBLzxxIMA==
X-CSE-MsgGUID: 4fSY497lQWiuHGK1eFy6fQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="32059246"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="32059246"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 05:07:38 -0700
X-CSE-ConnectionGUID: vGeWm75TTpy5m8+i+yjOrQ==
X-CSE-MsgGUID: md2In1eMRYmpn50pj+felg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="43031180"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jun 2024 05:07:37 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFur8-0001X4-1n;
	Sat, 08 Jun 2024 12:07:34 +0000
Date: Sat, 8 Jun 2024 20:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: also defined at
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts:146.7-149.3
Message-ID: <202406081900.fGraUukS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem:   also defined at arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts:146.7-149.3"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nikita Travkin <nikita@trvn.ru>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc772f8237f9b0c9ea3f34d0dc4a57d1f6a5070d
commit: 4a9f8f8f2adaa05abfdec7c588c8dab3281048f0 arm64: dts: qcom: Add Acer Aspire 1
date:   1 year ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce: (https://download.01.org/0day-ci/archive/20240608/202406081900.fGraUukS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406081900.fGraUukS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3035.22-3106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>>   also defined at arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts:146.7-149.3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

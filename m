Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE32D3B840F
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778794264; cv=none; b=Fzua7jrgwxDiGCl2XfbR9uUbiuqEwN4RjjWkkHwhXdR04eV3XXriWmhHF5llKgl/xPnvrLMB1esuA+4yQUdkQkmqpCzuwaFPwL2Zs7z1XaOnNC5QwiJF0+i0QyoVxn7S9G5xJ/hFsVtWCfSFm9QWihD8xOkHoojiSNGm/XLnzV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778794264; c=relaxed/simple;
	bh=lGxx++I9tynij1m+gJyS9FGIQehFYc4HNZ899vzr3d4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PrAv6LKNAFZFpdayif9AYBoF5Koj4SyxEPuZVVIBWC5O4vY0FhlWUYsdm7IDFoBBo0a1QXTdSAIC5t7thhaysrKj9BsW0o11FSrSiTRxuTMIvkcn/YYx/JMoUcJ2JVnNx/g2eMvyb+j4i3Ve2HpIBrQdPGyLWIMk6hIlJlHfQhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b72uNOJ9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b72uNOJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778794263; x=1810330263;
  h=date:from:to:cc:subject:message-id;
  bh=lGxx++I9tynij1m+gJyS9FGIQehFYc4HNZ899vzr3d4=;
  b=b72uNOJ9EWg5nNVHtyOUXdtsuc+YN2WckMKmc7oJ/T0QLWVosvWkpmwG
   MzWjSixPVPHCR+cBJkMLHtCwocylcY/NwYss7oh0jk63gJYqjqAnAf6bP
   ANSedjKRGFwgYJwXopL+c/i7Lo6VqENePWylgVNkFphfUxlRDwyD9VSz3
   HfKusLU6E+/SM4XB7lBMlcosAyECP4NjWhJ8J6N2fPV4pcDp6iVhnQVmo
   cjjwbsjdSKzCoZ7u8Jefncg5uwpGS1EhCxYV++lE1ORi844pSPwUEpxMA
   5dOpH35yR+WZ6JJtDISEj1ODTmhYnod13ynBsHXvPeGKOTaDXLaKm0V4W
   Q==;
X-CSE-ConnectionGUID: VxgiRDT1S4iJ7yPUAZqTBw==
X-CSE-MsgGUID: OYJKBGdcR1u1BOVbDNtagg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79866988"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79866988"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:31:02 -0700
X-CSE-ConnectionGUID: aBJKaAYiRTuuo4u6lak3fA==
X-CSE-MsgGUID: ghOI6HhURMi2KF4rZ+DpIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="234064119"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 14 May 2026 14:31:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNddz-000000008s5-25aD;
	Thu, 14 May 2026 21:30:59 +0000
Date: Thu, 14 May 2026 23:30:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.2 77/90]
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dtb: /soc@0/pinctrl@1000000: failed
 to match any schema with compatible: ['qcom,ipq9650-tlmm']
Message-ID: <202605142335.eRlXRXoY-lkp@intel.com>
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
TO: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.2
head:   c4b423835ee7529854ab39b50cf766bc4c6b4d66
commit: 8cef25a0044d3e7caef56a43bf316336fe39b5d8 [77/90] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260514 (https://download.01.org/0day-ci/archive/20260514/202605142335.eRlXRXoY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142335.eRlXRXoY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605142335.eRlXRXoY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq9650-rdp488.dtb: /soc@0/pinctrl@1000000: failed to match any schema with compatible: ['qcom,ipq9650-tlmm']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

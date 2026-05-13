Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE001A681B
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 00:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778631337; cv=none; b=hCtUlAqKjAS6+9nZSckawVOI+DJQZqrirq/ZeEpS9Uw3OTks5gdBHXCboSretpuOuJraX9HZbp5u1KdI3I0GgIIGc5MylLQuAQLYiBItEYeAj3rHyRkABp24+6ks9iZhERSt+h1TMTryMyr9TgaVBFrXN47d6tzXxVEo8xsqTwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778631337; c=relaxed/simple;
	bh=h1qKjZ+iF8Hz1A1O7Eca7DYoCdXznZzkEwF9TK5cNR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ltnzaoNLLjBXhSH88Oy8jS8JZLFBcAs2TDL1XSaCJXzUE6Qh0SN+zbRF4a0hgyA7GDFislL+c7RrdrzKLL3PoWobFd9cH8UEmt7QmgooQabkTILp0qMgsp+wkAgbv9rSf8lpoIbGbsTy8rsdPgDdrk5d7TYYn3q1nOYJs8eUqro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFOgBCVB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFOgBCVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778631336; x=1810167336;
  h=date:from:to:cc:subject:message-id;
  bh=h1qKjZ+iF8Hz1A1O7Eca7DYoCdXznZzkEwF9TK5cNR4=;
  b=FFOgBCVBFnKatO+PQd9lP3buooLUYkVaFnKy2fKnUOwDqnLmSM36vgLd
   zoveXuKu3Q1/S/wu6Dxn3Bny7HTgn76qCEcLdQ/bVJbHcM0Q9pOTwyvfQ
   1sR3/FUrYVdpAVF2KPZpzd5NnOJAQvqsT9e+GXeRy4EBFWBp/nfvYlWQR
   2RZCKLhaI4qLA00v3IiwfK49Zu4RKlQKZCftQ/kEDFsYXzOnG3A34NlG1
   4GulaufdjGZyr/qTpjoNHDDhDLpSbyr2eH7Bn0xGksAMU+kp/3fuMzLxI
   zo1GpZM51+C+zSU7FxB87Bz5PXL7T6cUBIXIMXFV6qxaFFMc2bdzTIVqc
   w==;
X-CSE-ConnectionGUID: ueH+WUTcTiyZ959enrHF6Q==
X-CSE-MsgGUID: 2VjXcd9HRfeZI/rr/NRsYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78580752"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="78580752"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 17:15:35 -0700
X-CSE-ConnectionGUID: lgENJjHPRSay32oIw9bwLg==
X-CSE-MsgGUID: t8jzRkH9S7iNRtJM7JIZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="239731530"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 May 2026 17:15:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMxG7-000000008Ov-4678;
	Wed, 13 May 2026 00:15:31 +0000
Date: Wed, 13 May 2026 02:15:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.2 70/84]
 arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@1bd4000
 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required
 property
Message-ID: <202605130211.4zwYUoBM-lkp@intel.com>
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
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.2
head:   4a1779f42e21962381a9696d182a2620c830ff10
commit: bde860892c92a43624a7bcf932a1d375b1ad43eb [70/84] arm64: dts: qcom: purwa: Add EL2 overlay for purwa-iot-evk
:::::: branch date: 4 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130211.4zwYUoBM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130211.4zwYUoBM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130211.4zwYUoBM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

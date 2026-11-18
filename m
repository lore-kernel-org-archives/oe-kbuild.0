Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992609;
	b=M/UPEZwdLLmjIP1ATULkGsoHvFPKM9ATKQ/hyr+jpvnoKOHK3bXeNYHB8TEJFKirDBsY
	 ma5qu270+7xPL8zWVs4P/OFcVN5ot8FcV+iCcDFSXv4wEfURjuNlQ3qOqcOSwfF6AUJGo
	 HZtGxY+LQLlTkKAynQekXN+S9l1Tcx9McgKNsWXurYSJUX1RNgDbZ0bE5an0Nx65b6YtM
	 OdmtRdUMfBUKH8+Ej0p0oF2dCmK/Ifa1hHD2G5iFWN46wYo0m8frCULE1AGM0Nt+zspte
	 u5UlFZUaI9jNa92zRpfuz/sa2+r4AsSE48u+hejKL0A0te2Xxz8QA3rOkrR0kpDITKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992609;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NI1WQFJg3TyUk72uY7T44Nwy7IPZih8Yw4DNS0NuMLQ=;
	b=M9WWt+uWDLeX43SweUoeftUtgPxgKktDYJWRj2UpfzQHxHv8SWJvxdiE7oOPqfjuQS1V
	 mcKym4KQwPEzqoNleIg/clQ3E7qquRi0ydWX+80UH2Mtxr651lpCtZGqqw8sTTEgW3WaF
	 iLcxFl8wWkU0RMVrDT4yuh0QE/c8H2Tf5VIFSpclQtnici/KucMqEKOqzyuwHvcBF+Q4M
	 fTSoQvof5bhVshRbTkHJ/SSHQ/z7fEyrdPEvhNY+7jCkeVjeizZ9JU3tAFqsDgsMBphH1
	 RiB6z4jl7mSacOi0ilzsxQ1K17D7i+4QSR5VqWTxpkly0tzp1C9cAXOlqRLRdKf0+mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RJUqz4Ta;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375A6606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 09:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 375A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RJUqz4Ta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992609; x=1826528609;
  h=date:from:to:cc:subject:message-id;
  bh=ULoDoHge8YmexeaMCv84w4IPvL1yRWt8oMxPaKM5y24=;
  b=RJUqz4Tas7UPvvyNNGFyJg1VpWDevZ7AIyWLKRLS+ff2SQB74fE1L7SP
   kG1EKb5voJiYfU0wab/qj7mjgKR09iQ15KkeZt2YcDMkon9FYGtLsTvOd
   KGBjrGnHjO3wxa3tJFMwaYcHJPXCPJXSxuMWfBj+Mha/ptGqueUSeAk7B
   8lMh82JWB4v2a2HY/vIhy1+mVwFqOX7b86ci3Te6/23dXg5JT/CxupEov
   iRvbDqC42OZCcrZlW9njxHThbOvXqvCRMetXSadfWPw7eoWKq3O9D/c3U
   HBksWKmgy2fUhkbj1SY/hO+dMrO+cbojZhqHsFg2Hjlp+hGpv7RucUv1K
   g==;
X-CSE-ConnectionGUID: qSqE6a7eRV+SJ5RK4h7YHA==
X-CSE-MsgGUID: n+CNl0oZRk23QD4zRyG1nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3675745"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3675745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:03:29 -0800
X-CSE-ConnectionGUID: drceSRGmRea/YuFFO80rgA==
X-CSE-MsgGUID: 6RUYsAduRT+Cf0Q7M5vV7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10232752"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2026 01:03:27 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTbZd-000000003Mk-2hrt;
	Wed, 18 Nov 2026 09:03:25 +0000
Date: Wed, 18 Nov 2026 10:03:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v7.4-next/dts64 7/18]
 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: hub@1 (usb451,8025):
 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <20261118100001.rmKJfubL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Chen-Yu Tsai" <wenst@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v7.4-next/dts64
head:   14cdd904db60288b782ffeac59f4c626ef11e9f5
commit: a68780f3322555023016fcbac70744a3d4adc269 [7/18] arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and connection
:::::: branch date: 20 hours ago
:::::: commit date: 22 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261118/20261118100001.rmKJfubL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118100001.rmKJfubL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118100001.rmKJfubL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: hub@1 (usb451,8025): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8020b.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: hub@2 (usb451,8027): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8020b.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: hub@1 (usb451,8025): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8020b.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: hub@2 (usb451,8027): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8020b.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7D11A8F6D
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 06:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751093434; cv=none; b=NAXyHATgQ/IrmVUNecHRxaRoOCNkMbD/UodFjlTDSgnOX0WkYCcPbGfm0FpPPZobVYb9joGmGVlXa+FYT55ZT+XEkxy+59OpD6YNFcYp8lBevq0YB9YGKis9EUBNioKU4L+a525llbV1lQh+TDf9HbOpHLaohvsuGejkNT7OSj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751093434; c=relaxed/simple;
	bh=7tUi+igrCIrb1jBZvPNQNFgYb3H3WF912mxClpLaygg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jxi4Bsy5mpWaMlh0vmc5FfnmKMSq3/d3JYvKKnR6U2yOjPhgivoTnT+YErnKmGj/shRO2nESLFefoE5ttuIRvlKTALxw3FLBgMu1wA5hRfPOgrE3nRcaHjyUobrozYWhP4g9GoPUEkuffIfFLaM0QEA2OtCZatRkVkHdcQsB0dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6+dqTMV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6+dqTMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751093432; x=1782629432;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7tUi+igrCIrb1jBZvPNQNFgYb3H3WF912mxClpLaygg=;
  b=h6+dqTMVpbxRVJ1Qjf++2anUkAsWhgkTzw4BnX8kYNbt+TqsCWnKTe6k
   FOhXUbpKwFoyyOTEs3BDnfjz0N7qiagrYPaH21gltp3Q53Ci1jcBR3BM1
   978W6+Aj8zTDfaZfRw51Ht1R/iD683uNXx6Tw6JWt6IpqPB2kkjPWwnr6
   CbjM3HaS/yZGbFFOjXrNXiF/XNvXz4HtOMcWII+ans2Z9fiVXbZehxpIJ
   i6K1WApGlKveGrkLXfkYTXT8JumlSjybovdeAeT1ngzsXmQ4ShGcHnI1b
   zLr6C4LOg/sE+ANP6zTfc3ACLeSyqqKdgKq29s9nd59Uxg49JPtRJSn9r
   A==;
X-CSE-ConnectionGUID: V15NKp/QRU+OmAYAtDOm9Q==
X-CSE-MsgGUID: E0DEgtUqRMa4itA8THpijA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53489329"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="53489329"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 23:50:31 -0700
X-CSE-ConnectionGUID: KmA4x/E+Q1udsTWmGPL1Gw==
X-CSE-MsgGUID: dXoMNTAGQrq/4mwVGzFMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="153693534"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2025 23:50:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVPOO-000WsM-3C;
	Sat, 28 Jun 2025 06:50:28 +0000
Date: Sat, 28 Jun 2025 14:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 02/13] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
Message-ID: <202506281445.XgdgAU9b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250623-ddrperfm-upstream-v1-2-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-2-7dffff168090@foss.st.com>
TO: "Clément Le Goffic" <clement.legoffic@foss.st.com>
TO: Will Deacon <will@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Gatien Chevallier <gatien.chevallier@foss.st.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-perf-users@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: "Clément Le Goffic" <clement.legoffic@foss.st.com>

Hi Clément,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 86731a2a651e58953fc949573895f2fa6d456841]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bus-firewall-move-stm32_firewall-header-file-in-include-folder/20250623-173554
base:   86731a2a651e58953fc949573895f2fa6d456841
patch link:    https://lore.kernel.org/r/20250623-ddrperfm-upstream-v1-2-7dffff168090%40foss.st.com
patch subject: [PATCH 02/13] dt-bindings: stm32: stm32mp25: add `access-controller-cell` property
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250628/202506281445.XgdgAU9b-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281445.XgdgAU9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506281445.XgdgAU9b-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/st/stm32mp235f-dk.dtb: clock-controller@44200000 (st,stm32mp25-rcc): '#access-controller-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/st,stm32mp25-rcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

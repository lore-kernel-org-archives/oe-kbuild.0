Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5821D213240
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833763; cv=none; b=LVhAKKrsb6EvCe3c1yqmdbOcdgZ7qmr7Zbrj6jCRzdOQ6NN2AwephXgW23NUESOy1J2g6/EvqTju0qtN4nCBINl88234dI7N8kZ9GZcci11uGeGbEKRVABtd8o9t2QSqABaBkficqocoNivk5ciXQL3qDHgqw+Wx07OWr7kVods=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833763; c=relaxed/simple;
	bh=Zt8ePJ9jX/Go7vvRCUXeAOgKVOaYWiPIYbnwdOyuuCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJ+rg21hIoG/XsXYxwPfe+skxTXkAqNILBQZnQvQ5t4Tbsi0YkNycBPpcvkV4nHd7jB/Dyczjjk2UMKPpBASjfus+CoYHTBf1rc/tlWlWcpq5vEvcjOKYVk3K5FeJURL8DC6aqJ5IS2z0PpPibNrBPvRkQDFL5lpCW3lUVj+/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWHW1nWq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWHW1nWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749833761; x=1781369761;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Zt8ePJ9jX/Go7vvRCUXeAOgKVOaYWiPIYbnwdOyuuCc=;
  b=DWHW1nWqdLhNvn4Jx6z4XI2FO7P5xGTcWiG7r0DgO0n024JBANN9Sl1u
   ewOs5EdHMnP7Bx1OD5l88JQ2frXlTRV8OwL4HRDM8kwgkSVpWYQtFSszN
   GOq5aKAXx+WexP2gPZksd2pDJ83y6evwjTN2Z0a+LPig1jT+ruN8NZcYG
   vMWJZ/V8ufjy198J+qUXSXbRvzJ0DNDVY6cFg/KisfyjEinN5uGsa04JM
   ffiQaEKvcmIxIhyHKsNKsYghbNN7EU0eUWr7qQnsGAcgmfSxMfNRqZHuv
   2uOC/D9vwpU43kFgVV36CBtVIQ+G46RSSHzDetzktkgQnuzar4xOfe4sM
   g==;
X-CSE-ConnectionGUID: CVt2ENfaRLSg8yLn/dPVQA==
X-CSE-MsgGUID: e0HL67DvRJSUPfU+DcGIZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51973012"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="51973012"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 09:55:58 -0700
X-CSE-ConnectionGUID: G/ForHvpRuSyyhgR3KkApw==
X-CSE-MsgGUID: J4uL1fxnS8qWMQFmRTaAEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148764666"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jun 2025 09:55:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ7h4-000Cq6-2i;
	Fri, 13 Jun 2025 16:55:54 +0000
Date: Sat, 14 Jun 2025 00:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
Message-ID: <202506140044.gox4EXku-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250611113039.304742-4-goran.radni@gmail.com>
References: <20250611113039.304742-4-goran.radni@gmail.com>
TO: "Goran Rađenović" <goran.radni@gmail.com>
TO: boerge.struempfel@gmail.com
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Goran Rađenović" <goran.radni@gmail.com>
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Goran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cd2e103d57e5615f9bb027d772f93b9efd567224]

url:    https://github.com/intel-lab-lkp/linux/commits/Goran-Ra-enovi/MAINTAINERS-Add-i-MX8MP-Ultra-MACH-SBC-to-ULTRATRONIK-BOARD-SUPPORT/20250611-193537
base:   cd2e103d57e5615f9bb027d772f93b9efd567224
patch link:    https://lore.kernel.org/r/20250611113039.304742-4-goran.radni%40gmail.com
patch subject: [PATCH v2 3/3] arm64: dts: imx8mp: Add initial support for Ultratronik imx8mp-ultra-mach-sbc board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250613 (https://download.01.org/0day-ci/archive/20250614/202506140044.gox4EXku-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140044.gox4EXku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506140044.gox4EXku-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: / (ultratronik,imx8mp-ultra-mach-sbc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ultratronik,imx8mp-ultra-mach-sbc', 'fsl,imx8mp'] is too short
   	['ultratronik,imx8mp-ultra-mach-sbc', 'fsl,imx8mp'] is too long
>> 	arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: / (ultratronik,imx8mp-ultra-mach-sbc): compatible: 'oneOf' conditional failed, one must be fixed:
   		['ultratronik,imx8mp-ultra-mach-sbc', 'fsl,imx8mp'] is too short
   		'ultratronik,imx8mp-ultra-mach-sbc' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'ultratronik,imx8mp-ultra-mach-sbc' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
>> 	arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: / (ultratronik,imx8mp-ultra-mach-sbc): compatible: 'oneOf' conditional failed, one must be fixed:
   		['ultratronik,imx8mp-ultra-mach-sbc', 'fsl,imx8mp'] is too short
   		'ultratronik,imx8mp-ultra-mach-sbc' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'ultratronik,imx8mp-ultra-mach-sbc' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   	'ultratronik,imx8mp-ultra-mach-sbc' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'ultratronik,imx8mp-ultra-mach-sbc' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'ultratronik,imx8mp-ultra-mach-sbc' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'ultratronik,imx8mp-ultra-mach-sbc' is not one of ['eukrea,mbimxsd25-baseboard']
   	'ultratronik,imx8mp-ultra-mach-sbc' is not one of ['eukrea,mbimxsd25-baseboard-cmo-qvga', 'eukrea,mbimxsd25-baseboard-dvi-svga', 'eukrea,mbimxsd25-baseboard-dvi-vga']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

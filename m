Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38D729A1
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 05:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920569; cv=none; b=LFnZLaVc3bZiOPd69CXyLrrmUWxe05stA2YYOIJZ+00AZEc/jkwYgX0nAmpAmLv0gveNtwkvf9UUKFTrnh2MTByHwrrqmFyLur07d559JeVlESLzIe05zlWuQ7nhbOu3bAyZd43gqNwrHjaxzs/M6jVPq6trSB69DU5rS3Ag9BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920569; c=relaxed/simple;
	bh=zAr2RtYR8YYNXNt9LinXfEAv1YVqexqfnsTn++/M23Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S2Mh32eh+biBkK/dgH0QJgNOlpSJlQBWIGkPBcvkTSwPuvPb5C6pRTnFr0eYefjUv/0R/Z4zSYiNWy5LEzcdrTpAgkdFGmrApHBQRp/XT+wJjvb7leDCzr7nB7pRKJJ0QWOXnBLAq9EWA8CS2SojkwoTHD6JJ7FZftjkjWAJA+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9rVdTQc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9rVdTQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722920568; x=1754456568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zAr2RtYR8YYNXNt9LinXfEAv1YVqexqfnsTn++/M23Q=;
  b=M9rVdTQchIWrFrB9FgtYxOr0c7EcXrDXtbRecoW7osBSKBD1Ez/7k963
   7FUuEf1EGt/EeXgtr1X9LK3t5asqCCY/CQycdN6Du0c7l7ByJk6GV9sT0
   6sU/89GjR2RZOxLvAQCiWCMFwASZHOWQHy7jYeuFrImiewGMSDxUyHcwJ
   eYim9jzcIghU+KZGIdibjqBV7UhJHFHIgG/G9mlfVnmbtEova7lf+zuPT
   xPbtEprtFHRmLPJYI5vpYpFyHx9CVjPeXcucA8G9ZTKbG9sW8XRPByFB7
   m2z0KlZ2G+2UKUXf1n1AOj4daslxkCUKN6iSYmKynSMztaTwaFQ6zC9P/
   Q==;
X-CSE-ConnectionGUID: eLf8M9CYTZK5VPLPPvW12g==
X-CSE-MsgGUID: bf7dhVtDQ+SYcOUtOc1yFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20790901"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="20790901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 22:02:47 -0700
X-CSE-ConnectionGUID: rCkGYy/RQNiz/bbB9bxwaA==
X-CSE-MsgGUID: Ou0/tAMOR3yaLJkbWaucnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="61244200"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 05 Aug 2024 22:02:46 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbCLL-0004AG-1y;
	Tue, 06 Aug 2024 05:02:43 +0000
Date: Tue, 6 Aug 2024 13:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-phyboard-pollux: Add and
 enable TPM
Message-ID: <202408061206.3x1m8mWP-lkp@intel.com>
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
In-Reply-To: <20240805-imx8mp-tpm-v1-1-1e89f0268999@phytec.de>
References: <20240805-imx8mp-tpm-v1-1-1e89f0268999@phytec.de>
TO: Benjamin Hahn <B.Hahn@phytec.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Teresa Remmet <t.remmet@phytec.de>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Benjamin Hahn <B.Hahn@phytec.de>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 17712b7ea0756799635ba159cc773082230ed028]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Hahn/arm64-dts-freescale-imx8mp-phyboard-pollux-Add-and-enable-TPM/20240805-213729
base:   17712b7ea0756799635ba159cc773082230ed028
patch link:    https://lore.kernel.org/r/20240805-imx8mp-tpm-v1-1-1e89f0268999%40phytec.de
patch subject: [PATCH] arm64: dts: freescale: imx8mp-phyboard-pollux: Add and enable TPM
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-051-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061206.3x1m8mWP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061206.3x1m8mWP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408061206.3x1m8mWP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: tpm_tis@0: $nodename:0: 'tpm_tis@0' does not match '^tpm(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

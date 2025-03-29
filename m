Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE922AD2A
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Mar 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743240554; cv=none; b=t6RGpcIyZGjCz6MmYcvwNogqvgoPjgD2P8jnAlfU5QS9Ypl58sdknBwe53DkoZ4iGQ5eBBmx7p0sTdW47zldw8VO3c63FaEEARiSSk6fOWJAAAr1wCOO/qWr4Kr2Pv8fy3GuLuXSsL9UfwBz65iAjD4WEqHbQ6qrOXItlzZFnxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743240554; c=relaxed/simple;
	bh=Wxm3DMgXF5VNXgRoVut8Ho+xu2Q2JnwmDM7hVk+0z0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNJjkmpvKCKog0M3sQ9AxOjdyCDmpd7VqNHf8RSaBR/6ONxwBvtEi5A6hRiDw8eP+KQXpo9Egyj2b5xcGjXKsjC2Upz8N8RwFc6AELzfWSMnOmE0XGPwwBf2DVVK/ZTkoccyGfqil8J9yp37mlGiAN0i3W98sBSeNXbYkmN1bak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXIvMY+O; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXIvMY+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743240553; x=1774776553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wxm3DMgXF5VNXgRoVut8Ho+xu2Q2JnwmDM7hVk+0z0o=;
  b=eXIvMY+OChjWPJLahnv7Tk/ms/NlIIQuY0qHCzHkTI7hGlc0AOdHWL0b
   EBF0LmgS/ympZLNXrnbhHRDD0owpnQPgzqojNID6sYzDzNbKPKxzPV/RC
   nsJBBFs9TSUyxV5aJeBRzrJ4SXNLe/yDz5c3vwMjzYk7NkCci2Yknm88G
   nrTXfaih+shUsmkZF8XBrXx/Dphayedg6qXgN0zVZyAHzaMNMWb9fGufZ
   cDbfBei6HSev7u5bDOBPaCEr4rlnSMDRXgdOaVUeUNsehVgnZbOtqVFwF
   mN8mDJm+32t6QlE0hbzXHSJlw8wbVPfTd4E4sRMax9bX+uEGpPU6yzvKx
   A==;
X-CSE-ConnectionGUID: r9vgfEQtQKuXd2GcXKqNsA==
X-CSE-MsgGUID: /11yhVzfQBmqfMwdbJyJJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44317435"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="44317435"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 02:29:12 -0700
X-CSE-ConnectionGUID: VocuDTTtQcCXRLEtKdW2Zw==
X-CSE-MsgGUID: iel3fNASS66ZyDUpb8u23A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="130691811"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Mar 2025 02:29:11 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tySV2-00081S-24;
	Sat, 29 Mar 2025 09:29:08 +0000
Date: Sat, 29 Mar 2025 17:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] arm64: dts: add imx8mp-libra-rdk-fpsc board
Message-ID: <202503291717.53lDVLTF-lkp@intel.com>
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
In-Reply-To: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-2-28324c7f81fa@phytec.de>
References: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-2-28324c7f81fa@phytec.de>
TO: Yannic Moog <y.moog@phytec.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: upstream@lists.phytec.de
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Benjamin Hahn <b.hahn@phytec.de>
CC: Jan Remmet <j.remmet@phytec.de>
CC: Teresa Remmet <t.remmet@phytec.de>
CC: Yashwanth Varakala <y.varakala@phytec.de>
CC: Yannic Moog <y.moog@phytec.de>

Hi Yannic,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 90453dc4dee29b96b9162895f45776bc25526e07]

url:    https://github.com/intel-lab-lkp/linux/commits/Yannic-Moog/dt-bindings-add-imx8mp-libra-rdk-fpsc/20250328-210746
base:   90453dc4dee29b96b9162895f45776bc25526e07
patch link:    https://lore.kernel.org/r/20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-2-28324c7f81fa%40phytec.de
patch subject: [PATCH 2/3] arm64: dts: add imx8mp-libra-rdk-fpsc board
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-051-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291717.53lDVLTF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291717.53lDVLTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503291717.53lDVLTF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: clock-controller@30e20000: clocks: [[2, 284], [2, 123], [2, 124], [2, 125], [2, 127], [2, 128], [2, 182], [2, 321]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: clock-controller@30e20000: clock-names: ['ahb', 'sai1', 'sai2', 'sai3', 'sai5', 'sai6', 'sai7', 'axi'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

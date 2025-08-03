Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D312E7F
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Aug 2025 23:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754264741; cv=none; b=p4hXuvibe9EL3HBomxtTm7TxyADOwRyIvmcSb3xA923TKYzOtilehuZNlVav2YKHpoJwe25VtD+RZRMWYu77m0BQ3PkI0QmcMMRtTtME/eq2HzZgT0hU04Lutc+xjWQ+mA0Fr4l1mrn36/L4AnlBZ7ZHavVGxOK2XxcJrostqpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754264741; c=relaxed/simple;
	bh=Jz7e9t2aofvf0mEQJOu/oBVsA/PYKWLOvVP3iH+0AW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B13tOHKe8U5vbhHSFEPlv/2c9cR1zr8HF3tuf6Qwx/AhXVN80g2mEqMoPYC5c+yk54lhnd/XjG/64hlXOH3baCaju5cvyOdL0zdeGYFXjOtflceKDS82yz7DHDC+GUTDSH86nyAZx9zfXIQhj5MnKPsRLYvoM6gMLXCX3Xs84zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpJOAz40; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpJOAz40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754264739; x=1785800739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jz7e9t2aofvf0mEQJOu/oBVsA/PYKWLOvVP3iH+0AW4=;
  b=XpJOAz408ovUf9aHj+eUbvihNLPUX3BNXYj4A5/tCdGxokyZZnMzRSta
   +Zq/GE7I+rOTXHrHKo8HDes26F71M66qdCPvoKh7lDnzrrwvINWQ7zetR
   Avg79j0nCzdjs3WAs3GjDWT/xNlWmIOTYgYbWl04cJCDWiTOhBMFf5Gsi
   q793HctHIT0ezTpQrZx4YL+rfVUrBlWWJ28eUs4xLEPgeEVdyejhn02xv
   3T6OIEHkc54qMh0G8FZ0tIE4f7u3mluZYhEyHIB32kaKrOQlqpB9Ro8r4
   W2T+Dze9Q8PIvNuckWMCkbKJrQw612KE+W6rlP/IeX/XBvfWOlS+t+89Q
   Q==;
X-CSE-ConnectionGUID: onoPd2cRQMKKadjf+pXnow==
X-CSE-MsgGUID: 7LC8xOkBTqWbhvkYQqnJKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56223150"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56223150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 16:45:37 -0700
X-CSE-ConnectionGUID: 3hlUZYDRQWmY9l3XDlRf/Q==
X-CSE-MsgGUID: w0HUD0yMTNOAaBSC4ZY96g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168217939"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Aug 2025 16:45:36 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiiOT-0006gS-02;
	Sun, 03 Aug 2025 23:45:33 +0000
Date: Mon, 4 Aug 2025 07:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 27/38] arm64: dts: mediatek: mt7988a: Fix PCI-Express
 T-PHY node address
Message-ID: <202508040745.ZlihAsOD-lkp@intel.com>
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
In-Reply-To: <20250724083914.61351-28-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-28-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: linux-mediatek@lists.infradead.org
TO: robh@kernel.org
CC: herbert@gondor.apana.org.au
CC: davem@davemloft.net
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: chunkuang.hu@kernel.org
CC: p.zabel@pengutronix.de
CC: airlied@gmail.com
CC: simona@ffwll.ch
CC: maarten.lankhorst@linux.intel.com
CC: mripard@kernel.org
CC: tzimmermann@suse.de
CC: jassisinghbrar@gmail.com
CC: mchehab@kernel.org
CC: matthias.bgg@gmail.com
CC: angelogioacchino.delregno@collabora.com
CC: chunfeng.yun@mediatek.com
CC: vkoul@kernel.org
CC: kishon@kernel.org
CC: sean.wang@kernel.org
CC: linus.walleij@linaro.org
CC: lgirdwood@gmail.com
CC: broonie@kernel.org
CC: andersson@kernel.org
CC: mathieu.poirier@linaro.org
CC: daniel.lezcano@linaro.org
CC: tglx@linutronix.de
CC: atenart@kernel.org
CC: jitao.shi@mediatek.com

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next broonie-regulator/for-next v6.16]
[cannot apply to linus/master next-20250801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Allow-specifying-resets/20250724-164429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250724083914.61351-28-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 27/38] arm64: dts: mediatek: mt7988a: Fix PCI-Express T-PHY node address
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-051-20250728 (https://download.01.org/0day-ci/archive/20250804/202508040745.ZlihAsOD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040745.ZlihAsOD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040745.ZlihAsOD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: t-phy@11c50000 (mediatek,mt7986-tphy): usb-phy@700:reg: [[0, 1792], [0, 2304]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: t-phy@11c50000 (mediatek,mt7986-tphy): usb-phy@700:reg: [[0, 1792], [0, 2304]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

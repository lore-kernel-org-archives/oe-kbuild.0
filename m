Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8424D197A87
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Aug 2024 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723212087; cv=none; b=s1mqSmolvbnc5vOkC8rbwrmnj9OzCTF3xQ7PUkP4hM5vFIx5vN+AA6aeKKdUXdfNWjIQO3u3vIK5Gpn2z/i2fVFX08ztIFcbJIzchEonnkBDjQru6zRIUNYl7ke20g6nzc+32rZ5S7zvTeaWYpyyy/JxLT3ypEElrU52/LWubOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723212087; c=relaxed/simple;
	bh=5du1lrYzrS5IOL0wsdrqquWmuUlKctSVDCuCIzD1mHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXXPsbNUHabbSoppDFVbkjPWSEdA1Vb6R93QbSz2B5e6sUBKCSZX0IVWDO8FVU5i1NUmT0BUOF8nhkCj8RTlOKTaK5DAeu6kck7drTHWXWtF9dN4QoHN3JfKFkT3Cez6Qfk5N5/3K0Vymt3KqHjfricADtyadiEag3/4BaweSRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOxFOx8Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOxFOx8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723212085; x=1754748085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5du1lrYzrS5IOL0wsdrqquWmuUlKctSVDCuCIzD1mHA=;
  b=FOxFOx8ZoLPjmBCP2ZXd3saWKbVKceuB0GB9RsyaYWD9CfqZQvPEB39d
   McCW16j6T586wE3dNm8n7omA+imMhGVih4gX9rt7IgHLAEF6tup58j0iT
   +ySqUK6TQt0y/bvbpbwMLW26c87UW2XgTQzd1Ti4qf704uzM8H4ybqN27
   H06M19vhSk1r0jLj+To/r7NXJnaXzAiTYsqDP9RQDgYRp7OKps6OU9DZ5
   OG7UG4D3lltxGyy/351MZIwRKINQ5Px3d47PJxhSmkcfq7nCbkRVaxPU8
   a2l6YVpPhJMzDoNelG38gNUSzXZwjgr2t3sqYCgCIShbEgCnH4AiiX+Nv
   w==;
X-CSE-ConnectionGUID: JHf2pC5sTF23UFXTlRSnjQ==
X-CSE-MsgGUID: 4kvG79pJRDqfTDKSh2pcrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31962054"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="31962054"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 07:01:24 -0700
X-CSE-ConnectionGUID: U4IEiVzRT2WKJPr7pk52oQ==
X-CSE-MsgGUID: s/AqKqE3Q2ukq6sn9ao4rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57534411"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 09 Aug 2024 07:01:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scQBE-0008Gm-1M;
	Fri, 09 Aug 2024 14:01:20 +0000
Date: Fri, 9 Aug 2024 22:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] arm64: dts: Add support for Kontron i.MX8MP SMARC
 module and eval carrier
Message-ID: <202408092111.vqdnU6DA-lkp@intel.com>
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
In-Reply-To: <20240807104137.558741-4-frieder@fris.de>
References: <20240807104137.558741-4-frieder@fris.de>
TO: Frieder Schrempf <frieder@fris.de>
TO: Conor Dooley <conor+dt@kernel.org>
TO: devicetree@vger.kernel.org
TO: imx@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Shawn Guo <shawnguo@kernel.org>
CC: Frieder Schrempf <frieder.schrempf@kontron.de>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Fabio Estevam <festevam@gmail.com>
CC: Gregor Herburger <gregor.herburger@ew.tq-group.com>
CC: Joao Paulo Goncalves <joao.goncalves@toradex.com>
CC: Parthiban Nallathambi <parthiban@linumiz.com>
CC: Peng Fan <peng.fan@nxp.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>

Hi Frieder,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frieder-Schrempf/dt-bindings-arm-fsl-Add-Kontron-i-MX8MP-OSM-S-based-boards/20240807-191042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240807104137.558741-4-frieder%40fris.de
patch subject: [PATCH v2 3/3] arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval carrier
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408092111.vqdnU6DA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408092111.vqdnU6DA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408092111.vqdnU6DA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: /usbc: failed to match any schema with compatible: ['linux,extcon-usb-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

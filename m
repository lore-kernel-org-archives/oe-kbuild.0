Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52921C232A
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722946647; cv=none; b=bg95Y5xoTD54wRiayZRCSZUjWAAU421fQAFyh6EYJ6/undlPOLqRVpDiradcLYWPfLe8sIfJEWvne40VWzSNEjm7+roXtxoQwYo2q5LiFHKQE8V9BBywVLsWZY87EG7vV0/DJQKmRUoLEe/6Pt9TEF3yEKAFJumP+cvCirifV3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722946647; c=relaxed/simple;
	bh=d6rUubFdMb1R745iYKYvieNOier+MUQyD6V/8wZBwnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDXjgLgxOmuLAZNp3dvWcuu0u6ioyuo7Z+qpq2nmbi7H9/HW689ulcorUKA/7mjCFkH/H9M7C/qd4c2WHjgqyg20Se8Zm7Db7u9+u+wEq7mgsq4WIb08Ao7lNy7ftpy4kmQIY8hQ+JtlqA8AGVlLxLFLXJODIq3Owq8UBUwQgC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzEQ6oDK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzEQ6oDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722946645; x=1754482645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6rUubFdMb1R745iYKYvieNOier+MUQyD6V/8wZBwnc=;
  b=BzEQ6oDKqXHHorN0WVr4VZ5xai28B+1mqFz7aQ6NNCiEEOu3w6tTLiVY
   euUQwt058D0goldAvyaPzBFyL5nK0m38CDlqIc7HjQgBCZ1cok1uuX60g
   6qCnKofYAFUbuSGEmTbdMVt1qEhpBapymkCa5brPZJULDHNLzzehhF+O3
   XYQHmvqUneR4s4S8zluYrA0CHnGMxf7yTFiJC1FMGg5TD+R1Q5goszB5U
   NA/FAP+dSzkQ5u8oDZUxOEyXhpBPgWDhXo1XqA0HE34+CNuF9/ynmgYz6
   WPvoEWZH+K0PNCcn7hyrg4v/5fNIWtds9RiQ4Zq/nr8DOP8Uw/f2MRx03
   Q==;
X-CSE-ConnectionGUID: FqOGmGZrTfOQmz8nqIhCZw==
X-CSE-MsgGUID: Hc6O15/ST9e9+jTC6iM5ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32363208"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="32363208"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 05:17:24 -0700
X-CSE-ConnectionGUID: 4tT2D0GAQxqULQxzo1Ov9g==
X-CSE-MsgGUID: 1z3qjfm1SN+LZ7YVZeTpjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="79755087"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 06 Aug 2024 05:17:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbJ7w-0004Sq-38;
	Tue, 06 Aug 2024 12:17:20 +0000
Date: Tue, 6 Aug 2024 20:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: imx95: add flexcan[1..5] support
Message-ID: <202408062008.bRPKwYUG-lkp@intel.com>
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
In-Reply-To: <20240805201416.2974996-2-Frank.Li@nxp.com>
References: <20240805201416.2974996-2-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
TO: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
TO: open list <linux-kernel@vger.kernel.org>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on next-20240806]
[cannot apply to krzk/for-next krzk-dt/for-next linus/master v6.11-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-imx95-add-flexcan-1-5-support/20240806-041833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240805201416.2974996-2-Frank.Li%40nxp.com
patch subject: [PATCH 2/2] arm64: dts: imx95: add flexcan[1..5] support
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-051-20240806 (https://download.01.org/0day-ci/archive/20240806/202408062008.bRPKwYUG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408062008.bRPKwYUG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408062008.bRPKwYUG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: can@425b0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx95-flexcan'] is too short
   	'fsl,imx95-flexcan' is not one of ['fsl,imx93-flexcan', 'fsl,imx8qm-flexcan', 'fsl,imx8mp-flexcan', 'fsl,imx6q-flexcan', 'fsl,imx28-flexcan', 'fsl,imx25-flexcan', 'fsl,p1010-flexcan', 'fsl,vf610-flexcan', 'fsl,ls1021ar2-flexcan', 'fsl,lx2160ar1-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,imx53-flexcan', 'fsl,imx35-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,imx7d-flexcan', 'fsl,imx6ul-flexcan', 'fsl,imx6sx-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,ls1028ar1-flexcan']
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: can@42600000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx95-flexcan'] is too short
   	'fsl,imx95-flexcan' is not one of ['fsl,imx93-flexcan', 'fsl,imx8qm-flexcan', 'fsl,imx8mp-flexcan', 'fsl,imx6q-flexcan', 'fsl,imx28-flexcan', 'fsl,imx25-flexcan', 'fsl,p1010-flexcan', 'fsl,vf610-flexcan', 'fsl,ls1021ar2-flexcan', 'fsl,lx2160ar1-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,imx53-flexcan', 'fsl,imx35-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,imx7d-flexcan', 'fsl,imx6ul-flexcan', 'fsl,imx6sx-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,ls1028ar1-flexcan']
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: can@427c0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx95-flexcan'] is too short
   	'fsl,imx95-flexcan' is not one of ['fsl,imx93-flexcan', 'fsl,imx8qm-flexcan', 'fsl,imx8mp-flexcan', 'fsl,imx6q-flexcan', 'fsl,imx28-flexcan', 'fsl,imx25-flexcan', 'fsl,p1010-flexcan', 'fsl,vf610-flexcan', 'fsl,ls1021ar2-flexcan', 'fsl,lx2160ar1-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,imx53-flexcan', 'fsl,imx35-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,imx7d-flexcan', 'fsl,imx6ul-flexcan', 'fsl,imx6sx-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,ls1028ar1-flexcan']
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: can@427d0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx95-flexcan'] is too short
   	'fsl,imx95-flexcan' is not one of ['fsl,imx93-flexcan', 'fsl,imx8qm-flexcan', 'fsl,imx8mp-flexcan', 'fsl,imx6q-flexcan', 'fsl,imx28-flexcan', 'fsl,imx25-flexcan', 'fsl,p1010-flexcan', 'fsl,vf610-flexcan', 'fsl,ls1021ar2-flexcan', 'fsl,lx2160ar1-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,imx53-flexcan', 'fsl,imx35-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,imx7d-flexcan', 'fsl,imx6ul-flexcan', 'fsl,imx6sx-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,ls1028ar1-flexcan']
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: can@443a0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx95-flexcan'] is too short
   	'fsl,imx95-flexcan' is not one of ['fsl,imx93-flexcan', 'fsl,imx8qm-flexcan', 'fsl,imx8mp-flexcan', 'fsl,imx6q-flexcan', 'fsl,imx28-flexcan', 'fsl,imx25-flexcan', 'fsl,p1010-flexcan', 'fsl,vf610-flexcan', 'fsl,ls1021ar2-flexcan', 'fsl,lx2160ar1-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,imx53-flexcan', 'fsl,imx35-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,imx7d-flexcan', 'fsl,imx6ul-flexcan', 'fsl,imx6sx-flexcan']
   	'fsl,imx95-flexcan' is not one of ['fsl,ls1028ar1-flexcan']
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

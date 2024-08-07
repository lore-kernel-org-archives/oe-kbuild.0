Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD428FF
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 02:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722997901; cv=none; b=JCde2O91qWnd8cm8bJkKhtYPDaUbsBaTty6fV021oxagSB1lG9iHPxTt9Tmrvhg+VtjEDYR+igQ6aDyEMSOY485O66v6cmJCaYXlqFVOPpWAdw10gBGhBJYcHhsSgNKcSgwQzgoFUz4dRdVakveNJVwmWLlwVL1z0miojIftDyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722997901; c=relaxed/simple;
	bh=bOLXOURZOiWJi93nw9KkEn6nS+Wh9a4I60yiIzTbrS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dyFwA1wFSbZmr3RUxhmh1DpAkdR689tSJPJHOsKwg4ARgI/GJMNX/TwkDV54L7NcbGibrkigpGwOPiCOau4EcxuRe5ZBEpHkzc0cHyMwzTNPgun5mqQPJ83jT+x7+HuZtfj/JzRYJg7gTEHLJgx0wfTxuIHESxNiV28lghIVuEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnEqj0tn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnEqj0tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722997898; x=1754533898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bOLXOURZOiWJi93nw9KkEn6nS+Wh9a4I60yiIzTbrS8=;
  b=AnEqj0tnLKNAcjnQs9ldRBiWH8d1WWofZ4DesMyS+5l569H2UAb3Rqlh
   ZWfF68HbohNgemioPz9fJfYFi1clo9kjDrENsNSOzLP7k7HVfc2gqw5NZ
   +A/AHcUDZdehzAbnESyMmpbg0JCl9X+oTuIS4QcQUybWHMuipZigZ/k0W
   yc4PoSoSTxxRUnZKtanco33AfjGIiIWtqpcbtjOHaeRkZqRSaEafC00+t
   noncexQ1l/XAPwJNKFCU+fh3szGNM3lJATzlM1zv9ZeXpODFwbaHIaVru
   YapkeD1AcbSqZqi0p+W8iHt5bIJggSxPXWBLhX+b1BQNjny1gQ4LzKuhq
   g==;
X-CSE-ConnectionGUID: sN+WmAePS0aqGQLWtf19Zw==
X-CSE-MsgGUID: gQ/LaZKdSmqNVXkGnugu1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21018919"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21018919"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 19:31:38 -0700
X-CSE-ConnectionGUID: YXhKgPrBSEOiIA28hb0EoQ==
X-CSE-MsgGUID: z6Lc9zVqTi6c86bcjEUb6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="61088074"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Aug 2024 19:31:37 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbWSc-00054M-39;
	Wed, 07 Aug 2024 02:31:34 +0000
Date: Wed, 7 Aug 2024 10:31:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [khilman-omap:lpm-v6.10/constraints-tweaks 3/3]
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202408071052.eel3CeSD-lkp@intel.com>
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
TO: Kevin Hilman <khilman@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git lpm-v6.10/constraints-tweaks
head:   9e022011507d3f18082a0539c1de9ff176e24908
commit: 9e022011507d3f18082a0539c1de9ff176e24908 [3/3] WIP: main_uart0 uses dedicated wakeups
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071052.eel3CeSD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071052.eel3CeSD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408071052.eel3CeSD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: syscon@43000000: 'syscon@4008', 'syscon@4018' do not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

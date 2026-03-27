Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C843446B7
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628698; cv=none; b=kctAPE3Mz0QIU08xT99KTMbDQQEtMriaCOOUPs4+3v5s8sYQ7152O81tYO4tufSYODsmVD5mQAtEv+24QLoi8r0bTjWs5KBsWE7QdUMzU/w9j9Igcn+q1/TJLGg2S9c1QjObqiaGWge66vbtM9RPhMFV9hcTNKoJyNvAD8w8xoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628698; c=relaxed/simple;
	bh=Ak9YokRFipu+1/6wUfssRsrwso1ukOWc3dOu85uzJag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jklhQg6PuzPzFqiBORsOca2E15B52grLiBMFRcnmmidbf5mXF+lU93vZo/mnShNyUgHgjc0evDETrph/1Be31fgQqMC3eETkk4yUJCKUqqtLBQNN9eBLu2r47v64uwOhOSO0YLyClakYAYAtleAW8iRBfDp7l6Ly7Pv1CBdJfd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLMNpzBg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLMNpzBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774628697; x=1806164697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ak9YokRFipu+1/6wUfssRsrwso1ukOWc3dOu85uzJag=;
  b=jLMNpzBgBVcGleQHiXN1YBNkVMjy5Jmvu1nHv7LwxOjX7LxjFozpfzdG
   x15xikbLqJXkRPdrCBKmxSa2tCHOyk/J33xWJtzm3+T4IzmFoqqtWm2sN
   9DQBQXAwJRykyl0rGX41g0vjfjyeg0bD0TmLb9hFYYHLiTJQVWBcsZ/Eq
   NdxeANAp//N2zGTYZX2X5mssLdldNYVW2P+vsQUGUMtjJgDC6i4sxEQCO
   Y5BtR8+5ZKIphcrHcX643n2QTgsNumxESBQPMPmp5fFU8hMImlhmRsLi5
   IS4prI5ZJ+XQ5/0K0e7FJ/YJVK9dJgIdKw6br6MHnbel7hBDqL1J+BuVl
   g==;
X-CSE-ConnectionGUID: hXt4Cg8fQY+vNcDEAsnDHg==
X-CSE-MsgGUID: 7EUZHieHSU2QTg+m2stdSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="101164359"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="101164359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 09:24:56 -0700
X-CSE-ConnectionGUID: jpiC6okIRs+Foikr+3lZuQ==
X-CSE-MsgGUID: QtFaxoAFRxKRIyjLF3lIFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="218741394"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2026 09:24:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w69zR-000000007Wz-1OKw;
	Fri, 27 Mar 2026 16:24:53 +0000
Date: Fri, 27 Mar 2026 17:24:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] dt-bindings: dsa: microchip: add KSZ low-loss cable
 errata properties
Message-ID: <202603271740.iSyifyN9-lkp@intel.com>
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
In-Reply-To: <20260326-ksz87xx_errata_low_loss_connections-v1-1-79a698f43626@exotec.com>
References: <20260326-ksz87xx_errata_low_loss_connections-v1-1-79a698f43626@exotec.com>
TO: Fidelio Lawson <lawson.fidelio@gmail.com>
TO: Woojung Huh <woojung.huh@microchip.com>
TO: UNGLinuxDriver@microchip.com
TO: Andrew Lunn <andrew@lunn.ch>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Marek Vasut <marex@denx.de>
TO: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Fidelio Lawson <fidelio.lawson@exotec.com>

Hi Fidelio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2d1373e4246da3b58e1df058374ed6b101804e07]

url:    https://github.com/intel-lab-lkp/linux/commits/Fidelio-Lawson/dt-bindings-dsa-microchip-add-KSZ-low-loss-cable-errata-properties/20260327-131337
base:   2d1373e4246da3b58e1df058374ed6b101804e07
patch link:    https://lore.kernel.org/r/20260326-ksz87xx_errata_low_loss_connections-v1-1-79a698f43626%40exotec.com
patch subject: [PATCH 1/3] dt-bindings: dsa: microchip: add KSZ low-loss cable errata properties
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: openrisc-randconfig-2051-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271740.iSyifyN9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271740.iSyifyN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603271740.iSyifyN9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml: microchip,low-loss-errata: missing type definition
--
>> Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml:90:111: [warning] line too long (121 > 110 characters) (line-length)
   Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml:91:111: [warning] line too long (128 > 110 characters) (line-length)
   Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml:93:111: [warning] line too long (118 > 110 characters) (line-length)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

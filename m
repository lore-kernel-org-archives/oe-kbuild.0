Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439981E5B68
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 18:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194466; cv=none; b=LkrNrmzunGJV5brY12hLBh9bnsSSja/ajSc20EPPgr96ykmJBd3Eo65iaYjpc7LK7LpJ0DxU7kBBhs+vL8f0/sf+gkst+NqutwBqWO7rsAPaNXAEyKeJb6k+yvjM4hkRIWAQwiKEj37arBCoL78Ck4yq9dNRWfQ7WrmOJxBYfnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194466; c=relaxed/simple;
	bh=UXC0ij+4+UjikK5QYIUeMPVhNZi+SgB4FlhBThv9luM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jyadI8SX0U3XWBk6zEzIqxZOLnkDf27iBo0AvZz6W0tfWUIB1UBjcO36KHd3BUuNBI5HA5FA/KkNF40R5LroHldCZDKwKFRKR5Ct42Km7hbedhlLGXNZTlpFzli56aw9I+NXHMzoGZeh5VZeiPQ6wq/norNHnQAY4nbqLKiauQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViRGvWJM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViRGvWJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769194462; x=1800730462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UXC0ij+4+UjikK5QYIUeMPVhNZi+SgB4FlhBThv9luM=;
  b=ViRGvWJMIXcLI0yXo5lqQPjgQJb9kmVh6V5z3KY1JcMu/CP7Z2Ztzwn/
   eSIVDShX8Mv2onnwllaZiR2erDC5/h87hKPLLNmj0cM+2SKxQMjV8g1ev
   mmejfXU36KVpBXAtKLDHV5hE6YPlltHZAscuGw2xSxutJtH12dJFaopRT
   5lNJovOKJk7RrOJ2EpYZDOYlP+sk4Ul5posDULJWsJfNYZqk4Mks0iNfd
   EnPeMQJgp2Eb8gkA965CVhpxxeY20HCfnucfIDNc61sLIqYKOrQ/GERsY
   JPLEgplC7whOy/JeDgcX9tcFeTKB2VD6JYONAOIrmoYy6v1yVjxINrINM
   Q==;
X-CSE-ConnectionGUID: yGeK5EdrTeOXRvJkckI7ag==
X-CSE-MsgGUID: H3Klat7rTkigsZ+gacoT1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70501491"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70501491"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 10:54:20 -0800
X-CSE-ConnectionGUID: pWaKvVJPTKS7hai/UFp9qw==
X-CSE-MsgGUID: XPMPkmA7SCGOvwBHnTMXtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207440843"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2026 10:54:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjMIS-00000000UM2-1PKl;
	Fri, 23 Jan 2026 18:54:16 +0000
Date: Sat, 24 Jan 2026 02:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 net-next 02/15] net: mdio: add driver for NXP SJA1110
 100BASE-T1 embedded PHYs
Message-ID: <202601240212.KKumkFoA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/mdio/mdio-sja1110-cbt1.c:177:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260122105654.105600-3-vladimir.oltean@nxp.com>
References: <20260122105654.105600-3-vladimir.oltean@nxp.com>
TO: Vladimir Oltean <vladimir.oltean@nxp.com>
TO: netdev@vger.kernel.org
CC: Andrew Lunn <andrew@lunn.ch>
CC: Heiner Kallweit <hkallweit1@gmail.com>
CC: Russell King <linux@armlinux.org.uk>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Herve Codina <herve.codina@bootlin.com>
CC: Mark Brown <broonie@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>
CC: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: Lee Jones <lee@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: Choong Yong Liang <yong.liang.choong@linux.intel.com>
CC: Jiawen Wu <jiawenwu@trustnetic.com>

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/net-mdio-regmap-permit-working-with-non-MMIO-regmaps/20260122-192934
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260122105654.105600-3-vladimir.oltean%40nxp.com
patch subject: [PATCH v2 net-next 02/15] net: mdio: add driver for NXP SJA1110 100BASE-T1 embedded PHYs
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: s390-randconfig-r121-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240212.KKumkFoA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240212.KKumkFoA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240212.KKumkFoA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/mdio/mdio-sja1110-cbt1.c:177:1: sparse: sparse: bad integer constant expression
   drivers/net/mdio/mdio-sja1110-cbt1.c:177:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/net/mdio/mdio-sja1110-cbt1.c:178:1: sparse: sparse: bad integer constant expression
   drivers/net/mdio/mdio-sja1110-cbt1.c:178:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/net/mdio/mdio-sja1110-cbt1.c:179:1: sparse: sparse: bad integer constant expression
   drivers/net/mdio/mdio-sja1110-cbt1.c:179:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +177 drivers/net/mdio/mdio-sja1110-cbt1.c

5a5e7986c04995 Vladimir Oltean 2026-01-22  176  
5a5e7986c04995 Vladimir Oltean 2026-01-22 @177  MODULE_DESCRIPTION("NXP SJA1110 100BASE-T1 MDIO bus driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

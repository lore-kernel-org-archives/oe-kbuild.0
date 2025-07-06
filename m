Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97F17BCE
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Jul 2025 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799042; cv=none; b=cJeYTUBrNHYfv5p8gNE0esvWw3KgyzisCNuowljU1XZj3cGy3e6ybTMlQqJzeSB2OAHz/pKyRdWeav4AuQ82hcSD+65Ktbv3TBOt+4716VSLtP8KSL5p42nKz3C6qSq534JW6SaN46DTmMRbc520eMETAC5L3mj3+MIVah+jdLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799042; c=relaxed/simple;
	bh=vMsn13paGoeBOY4Ek74rLxhsV6Zmt+A7NP1xaz8+HzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qtc3X3gxeIFa1h5VUhrTH6EQk0tACDvCPj4fogGBhgoJ6+5XjkzQRcslw2jzxGsK3YIyWO6c9VQ+XA7X77YXu6lhXt5vn7zHDg0DKTENdW1i6Yr1VmU/mpYHUgY2fKodBXLHiLcnGiwvcPMSV+ci74rE5vLeBRth4C037yH/Vo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iq0cVWlx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iq0cVWlx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751799041; x=1783335041;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vMsn13paGoeBOY4Ek74rLxhsV6Zmt+A7NP1xaz8+HzE=;
  b=iq0cVWlxybYmsOUFwdnv6MeyW1pP5WlDF5AB1fFZ5D8zxG3UQQMwHkLB
   oaAqirNYvwEKDzHKr41CjYFvgsPP2XgVLzFGZUJ7Awb3Ll0GTZgDcmlTh
   85D+qdTh/0V+V3prg5cRZuEynkVz875RTsivugr9I1ZKTHisOFZSM587Z
   st5u6hLRRl9DchARD2/QjIgNtGsWGWzegr94Uj7TRpx/2nAhDCsEKuWp1
   +4qUJyDnjJFVeJZYegDHSottpI9B6P0jxkYwjOB+zdvYyFjObfBm3WAcP
   3iQTrqogA5SJumuAiiOIxZZuyOW2Ic6NTo7L0XhFFP2JT+o6tDlx2S0yV
   A==;
X-CSE-ConnectionGUID: +DYRSwrBSp2sQtD/8qCG3g==
X-CSE-MsgGUID: 2ZNyVcc/TDC64v8RjaAMNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54011426"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54011426"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 03:50:40 -0700
X-CSE-ConnectionGUID: biCw0/V+QXaLirtmmLjC8Q==
X-CSE-MsgGUID: vQeUqFZ9Qo+rqsbjvzNuAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="160641108"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Jul 2025 03:50:39 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYMxA-000523-3B;
	Sun, 06 Jul 2025 10:50:36 +0000
Date: Sun, 6 Jul 2025 18:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <202507061812.0aBYBa9l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250630143315.250879-5-maxime.chevallier@bootlin.com>
References: <20250630143315.250879-5-maxime.chevallier@bootlin.com>
TO: Maxime Chevallier <maxime.chevallier@bootlin.com>
TO: davem@davemloft.net
CC: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: thomas.petazzoni@bootlin.com
CC: Andrew Lunn <andrew@lunn.ch>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Eric Dumazet <edumazet@google.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Russell King <linux@armlinux.org.uk>
CC: linux-arm-kernel@lists.infradead.org
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Herve Codina <herve.codina@bootlin.com>
CC: Florian Fainelli <f.fainelli@gmail.com>
CC: Heiner Kallweit <hkallweit1@gmail.com>
CC: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: "Köry Maincent" <kory.maincent@bootlin.com>
CC: "Marek Behún" <kabel@kernel.org>
CC: Oleksij Rempel <o.rempel@pengutronix.de>
CC: "Nicolò Veronese" <nicveronese@gmail.com>
CC: Simon Horman <horms@kernel.org>
CC: mwojtas@chromium.org
CC: Antoine Tenart <atenart@kernel.org>
CC: devicetree@vger.kernel.org
CC: Conor Dooley <conor+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Romain Gantois <romain.gantois@bootlin.com>
CC: Daniel Golle <daniel@makrotopia.org>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20250630-224035
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250630143315.250879-5-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports representation
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-r071-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061812.0aBYBa9l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507061812.0aBYBa9l-lkp@intel.com/

smatch warnings:
drivers/net/phy/phy_port.c:130 phy_port_get_type() warn: bitwise AND condition is false here

vim +130 drivers/net/phy/phy_port.c

055cbf51317b1e Maxime Chevallier 2025-06-30  121  
055cbf51317b1e Maxime Chevallier 2025-06-30  122  /**
055cbf51317b1e Maxime Chevallier 2025-06-30  123   * phy_port_get_type() - get the PORT_* attribut for that port.
055cbf51317b1e Maxime Chevallier 2025-06-30  124   * @port: The port we want the information from
055cbf51317b1e Maxime Chevallier 2025-06-30  125   *
055cbf51317b1e Maxime Chevallier 2025-06-30  126   * Returns: A PORT_XXX value.
055cbf51317b1e Maxime Chevallier 2025-06-30  127   */
055cbf51317b1e Maxime Chevallier 2025-06-30  128  int phy_port_get_type(struct phy_port *port)
055cbf51317b1e Maxime Chevallier 2025-06-30  129  {
055cbf51317b1e Maxime Chevallier 2025-06-30 @130  	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7A619F
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 00:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dq9ovZjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701822005; x=1733358005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VD559ENl1JO+nrGkAACMei5ux7u1PL3GVJ5KFHJ+3Rs=;
  b=dq9ovZjAvq2NOWMF2wvqrAFBsX9+HuVz3JkQ6qRbpiq/yTYrym6q9oEa
   IhEdyDAOrwZvNCJwiquQYURG4m2knYoN+CgXHdtRi6W4spE5puctGud0H
   2qc0mU7/9d0YaymVOVb4qvJd6IKrYb077hXpBXrSn+o1KHF2IAypViaBn
   O/sATpZMaj30yabxHjQgb1kduhydR7bhhuysOM6QQLTsFoZwFA+7MHGX0
   R/UdGAHf17PaETTz9U89LNvNgRNYmxh1V3xaB7qX368RqpMcPD/MxyRu0
   TzI8OM76EAutVKeKvoY5HdznR7GPGLx7ZYEzN+zpxPoan9fbTFdiVsVd0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12696508"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12696508"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 16:20:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747415875"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="747415875"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 16:20:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAfdw-0009vS-2t;
	Wed, 06 Dec 2023 00:20:00 +0000
Date: Wed, 6 Dec 2023 08:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/mv88e6xxx/chip.c:245 mv88e6xxx_default_mdio_bus()
 warn: can 'mdio_bus' even be NULL?
Message-ID: <202312060828.ZdskQ7U4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: a3c53be55c955b7150cda17874c3fcb4eeb97a89 net: dsa: mv88e6xxx: Support multiple MDIO busses
date:   7 years ago
:::::: branch date: 26 hours ago
:::::: commit date: 7 years ago
config: i386-randconfig-141-20231010 (https://download.01.org/0day-ci/archive/20231206/202312060828.ZdskQ7U4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060828.ZdskQ7U4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312060828.ZdskQ7U4-lkp@intel.com/

New smatch warnings:
drivers/net/dsa/mv88e6xxx/chip.c:245 mv88e6xxx_default_mdio_bus() warn: can 'mdio_bus' even be NULL?

Old smatch warnings:
drivers/net/dsa/mv88e6xxx/chip.c:882 _mv88e6xxx_get_ethtool_stat() error: uninitialized symbol 'low'.

vim +/mdio_bus +245 drivers/net/dsa/mv88e6xxx/chip.c

efb3e74da2e181 Andrew Lunn 2017-01-24  238  
a3c53be55c955b Andrew Lunn 2017-01-24  239  static struct mii_bus *mv88e6xxx_default_mdio_bus(struct mv88e6xxx_chip *chip)
a3c53be55c955b Andrew Lunn 2017-01-24  240  {
a3c53be55c955b Andrew Lunn 2017-01-24  241  	struct mv88e6xxx_mdio_bus *mdio_bus;
a3c53be55c955b Andrew Lunn 2017-01-24  242  
a3c53be55c955b Andrew Lunn 2017-01-24  243  	mdio_bus = list_first_entry(&chip->mdios, struct mv88e6xxx_mdio_bus,
a3c53be55c955b Andrew Lunn 2017-01-24  244  				    list);
a3c53be55c955b Andrew Lunn 2017-01-24 @245  	if (!mdio_bus)
a3c53be55c955b Andrew Lunn 2017-01-24  246  		return NULL;
a3c53be55c955b Andrew Lunn 2017-01-24  247  
a3c53be55c955b Andrew Lunn 2017-01-24  248  	return mdio_bus->bus;
a3c53be55c955b Andrew Lunn 2017-01-24  249  }
a3c53be55c955b Andrew Lunn 2017-01-24  250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

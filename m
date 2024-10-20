Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2EE17C79
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 06:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729406666; cv=none; b=rxAUYdxLXD0RtYL+e8gqQZA/A6g8VFF5nvru+vJ2HkVmPo2DnxsOcpJu5RYQGHlKdauaW7u0aAjXZVI0VwCjafhbnV4zHmOsaP49UvXKpgp7+YcyKHZdZlHTPzMyNlEKeARNcRCxzo63V9XLvG90du+fqeB3ckl8hWqS4szspps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729406666; c=relaxed/simple;
	bh=fh93dQ0RiuK7+iKw7ePLusLCn8+QuGbxetn1ENldcQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=reMQDUAVRq0ewyyM5MfGeO/8rMBMmlAdoLNxGSAABWuXG94UMNn70uHLOgMAMh1S9rqwJDBtkt29P860LJ+Mbkm0z70L/D+f9mQwxdKojLW1z02sDxz7E4TWoOklftKzz9RAKkeZZapd1w0TgCLxOQYISUYSDvnOGhRy9sRJTZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbFEHCK9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbFEHCK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729406664; x=1760942664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fh93dQ0RiuK7+iKw7ePLusLCn8+QuGbxetn1ENldcQI=;
  b=UbFEHCK9McbI0lh+co5oVcYP4b/eXGcLYrsGs+lJAcHDRaxw39TmsZ/M
   3X0L2JiSt71sAYuWOaxUQH6mDNZNggVPfPZFRGbb9jOXp8LRNzbP0keHw
   tjoDr56NBIkJLR1EhR1uddfLRxhYz9VW5Yqq3WhoEb6fC3MUHCm3hI67N
   KSVaCdUhiJnx7kCtUO94ZeAaZV8U3z0dyB5wMEagBZS9NSCNlug69voqw
   9FZ/WnVH/W+e6csOnyRX7sEiaETn5vRrGP2QNnTjQomdGlFnarIPMytL/
   sGEPv4zH5z4/yIfX89xg3tnTHty7AMDSBwmNwAqanP+FYU+k/d94qNiqD
   w==;
X-CSE-ConnectionGUID: 8ePU7MqaTV6/QajRK97RZg==
X-CSE-MsgGUID: Zd+6/4xAQzebxMpg+ZHQhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32581884"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32581884"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 23:44:24 -0700
X-CSE-ConnectionGUID: 5krkVgoIRi6apZLbKsGm6Q==
X-CSE-MsgGUID: 3je5Iz2wQbmih/Vopf6HWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="79385305"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2024 23:44:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Pfo-000Q07-0M;
	Sun, 20 Oct 2024 06:44:20 +0000
Date: Sun, 20 Oct 2024 14:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: internal error: arch/alpha/include/asm/io_trivial.h:64 SQL error #2:
 near "and": syntax error
Message-ID: <202410201454.Gvsif6Dr-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: a4184174be36369c3af8d937e165f28a43ef1e02 alpha: drop pre-EV56 support
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: alpha-randconfig-r073-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201454.Gvsif6Dr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410201454.Gvsif6Dr-lkp@intel.com/

New smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:64 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:64 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'
drivers/comedi/drivers/adv_pci1710.c:876 pci1710_auto_attach() warn: 'pcidev->irq' from request_irq() not released on lines: 840.
internal error: arch/alpha/include/asm/io_trivial.h:64 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:64 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'
internal error: arch/alpha/include/asm/io_trivial.h:64 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:64 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:18 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:18 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'
drivers/comedi/drivers/gsc_hpdi.c:671 gsc_hpdi_auto_attach() warn: 'pcidev->irq' from request_irq() not released on lines: 628,640,645,650,654.
drivers/comedi/drivers/cb_pcidas64.c:4044 auto_attach() warn: 'pcidev->irq' from request_irq() not released on lines: 4042.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

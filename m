Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA930CD92
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 23:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765669077; cv=none; b=Xkt6Adoq+1xbjEb1OdIn06LaX8pQDTCABL7RPUbXMCw0VcptSziI60h5BfxSqotxwpXAJyzI8G0s4a+kQTxChzAx8XXEpk1vNz+Z+GPx2qqTd5t8qDWU2fuIdf9X1pQbbHuOwKtxSGsMqzr0SKrQXS2Mcb4qfw3h4ZELNiIIF10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765669077; c=relaxed/simple;
	bh=JjRaOserwEz90MVxfUe713+81cqGxVlP1HeeoxAX6+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gSnlRb2j3bCuKNvxNXaaERNqdozwr6EQYzlXnABcVXjpCNyEA88z1u6N8dL+PXB0t3agfLbFH+y8ZgxIe+Q4Im6uUSJhtPm557wceAGkn4VxtPq2xocOvRG8jYlUnuIHTY7MLadxysabkxQnzH0tOEOI9ZM9SxOd3UowkiN1GVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOYpVLOo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOYpVLOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765669076; x=1797205076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JjRaOserwEz90MVxfUe713+81cqGxVlP1HeeoxAX6+I=;
  b=aOYpVLOoqdBghiOME3Bs5Pd28ybZPl8dTJ9F2xmKPFf89PCs2Wlnfxm6
   V8ERVpwEdC/O4Js7Sxthq7fHs68Fqtk9/eRcT2F3uIHDFr4HZGwCOQWyU
   /DaVjqmtNdvjayqGCmdLATJK/e4sNzOeMwbrweKY2cw52LzcJLhqp3q0i
   dT/7QkIBBX67xp3+nEhiqwRObsjaBtoAWxoVzsnv6OZFYW5YHdDLOUoQe
   WZWwYfGv+92vOqtARkQd6rngKXipR9J98wj4BNoVbBYpR8wofgSJ/x4Bc
   gpsCWdtFPsAKFClC9sa4eAToH35bRKOup1KVu8jgmJjwctajvfwj94YWP
   Q==;
X-CSE-ConnectionGUID: lukjtVcgR9+eg7vT1mn7qA==
X-CSE-MsgGUID: 2g5gWXPLRIiKNNAHllAZkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79081753"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79081753"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:37:54 -0800
X-CSE-ConnectionGUID: i+pniIdYQKWpXtg+0ShGOw==
X-CSE-MsgGUID: ScNxqAcsRCyy89jSW0rs+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197157801"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 15:35:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUZ93-000000008Jn-3BAO;
	Sat, 13 Dec 2025 23:35:25 +0000
Date: Sun, 14 Dec 2025 07:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [litex-hub:litex-rebase 15/15] drivers/block/litesata.c:395:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512140735.uiDhZhKo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/block/litesata.c:395:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gabriel Somlo <gsomlo@gmail.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   bf1103a7647b9e371007e1f7d02827190e619900
commit: bf1103a7647b9e371007e1f7d02827190e619900 [15/15] LiteX: LiteSATA block driver
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: alpha-randconfig-r112-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140735.uiDhZhKo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140735.uiDhZhKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512140735.uiDhZhKo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/block/litesata.c:395:1: sparse: sparse: bad integer constant expression
   drivers/block/litesata.c:395:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/block/litesata.c:396:1: sparse: sparse: bad integer constant expression
   drivers/block/litesata.c:396:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/block/litesata.c:397:1: sparse: sparse: bad integer constant expression
   drivers/block/litesata.c:397:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/block/litesata.c:397:1: sparse: sparse: bad integer constant expression
   drivers/block/litesata.c:397:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +395 drivers/block/litesata.c

bf1103a7647b9e Gabriel Somlo 2022-08-19  394  
bf1103a7647b9e Gabriel Somlo 2022-08-19 @395  MODULE_DESCRIPTION("LiteX LiteSATA block driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

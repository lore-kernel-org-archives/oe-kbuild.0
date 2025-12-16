Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D7233FE27
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765873272; cv=none; b=VR5DjV2Iu69YCsBWjw1FDC513xJLFr+agKe7Ii/hzwMY71xQl3cVyfG3vUr8XxUOOJKzk0mrncrkH3vVg7qAXK0HduGeez3P9Fo2+n28FtJY9dI3rf8Jym94bBIl3SnqmXuNc1TYvmrw3E/FDXf4LNJY0Sx5MVp0cJVKY7wy8+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765873272; c=relaxed/simple;
	bh=cpApR+1qosqmomZ7vkAkfRfReNFEwozChULXF1lPblc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uDHMVPNXOt9DWTlBgml59Xe2i9i6Pxc46ouU7OQ70pWuhQ+8NMZSQPvVzwJ3rKS1t3V3VOHqdg7YdHod3zQEKd7DZEDcmoF+OBkLLxXmxtirYyfurVW2nLyXH8afNhaEKm6fLJ7Vb93rHhTKc6KWAmanTAfsGQoFJZpsnJuYxlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbcnEOyw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbcnEOyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765873270; x=1797409270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cpApR+1qosqmomZ7vkAkfRfReNFEwozChULXF1lPblc=;
  b=QbcnEOywIlSaTzcF8eKoVBIh9fb0/LeYsSiePBRMVKoxzkkskGTLvldI
   S8nyAc7fsG6w/KTI8G0N/FT0Pwr0/LUboReYtdQQuVW2mCC8tU8yQlBJ+
   zetzsBhUPIo3WcA1LZqawcFGM+tCRZDOGeYchqQNihjPrznbuANNL7fMx
   JcAs5fQj9TTw7Y0ecFT63MHxhyG9wD0Qoaq20FcQD9LO7Yh5BcLCPCeGk
   BhY/myjLLWPPEvDX/ifpMp62zWghCHQxLK3wwRlC1mwRo12pL9euDNW7F
   GKFdKzXzbrpdP5BvQFS55DFTJk31EOhUZ3fvrUYzGSkwlmkwBTPxRD0rZ
   w==;
X-CSE-ConnectionGUID: aKjCOCuYQX6x3IO/iq4ThA==
X-CSE-MsgGUID: a8X8vugZS1WXiUhVKuVZRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78905196"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="78905196"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 00:21:07 -0800
X-CSE-ConnectionGUID: vSgUuZUFR4qlPnM3rJ4Jng==
X-CSE-MsgGUID: qZtiKJCnT46ZC5agAx4BoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202366751"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2025 00:21:06 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVQIq-000000001MK-0vA3;
	Tue, 16 Dec 2025 08:21:04 +0000
Date: Tue, 16 Dec 2025 16:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1593/1848]
 drivers/gpu/drm/sitronix/st7571-spi.c:73:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512161625.U4jQ5QC4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/sitronix/st7571-spi.c:73:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marcus Folkesson <marcus.folkesson@gmail.com>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   563c8dd425b59e44470e28519107b1efc99f4c7b
commit: 052039e3fe51bc1cbe700d5af9be009fb985cfd2 [1593/1848] drm/sitronix/st7571-spi: add support for SPI interface
:::::: branch date: 6 hours ago
:::::: commit date: 19 hours ago
config: sparc64-randconfig-r113-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161625.U4jQ5QC4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161625.U4jQ5QC4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512161625.U4jQ5QC4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sitronix/st7571-spi.c:73:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571-spi.c:73:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7571-spi.c:74:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571-spi.c:74:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7571-spi.c:75:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571-spi.c:75:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7571-spi.c:75:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571-spi.c:75:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7571-spi.c:76:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571-spi.c:76:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +73 drivers/gpu/drm/sitronix/st7571-spi.c

052039e3fe51bc Marcus Folkesson 2025-12-15  72  
052039e3fe51bc Marcus Folkesson 2025-12-15 @73  MODULE_AUTHOR("Marcus Folkesson <marcus.folkesson@gmail.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

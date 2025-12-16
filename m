Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4113328E3
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 10:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765881394; cv=none; b=Rs7RZBJD8vgyEJm2w85Hp6FjFE+jHUOFKkcyUEPSKdRgb7x5XvmJzxRwSLYcMy3jidbdEDjeUrg0T/c5FGUUCs2cTO8DkNQRr5v0IRCuyRIyz/s8cLpZ3VRcM6F8jegA3z9+ZTh5/dZ6D9awov2HN6726fj5gUFhGNSSTASjfAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765881394; c=relaxed/simple;
	bh=KYRRHbFdTe2sZGUqk4YeZohr4sPEiHsOT75dN6eLDuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o7Qm5+UVIFvt+B2AbBLwB4ENlWWB7Ajhm67ukfImg0eENZYobZPM6tin0by9HPr6iR+JFL/RV7h8eGGEl5xh3nm5m5kHDOniD9DoFV4OFQXK5q/1dQmN2E6hAL/tpWvAl0drM7nUmX0kxP4vmwuvk9/I78Gv2TwUdeb+WhA0vlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqH3UxGv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqH3UxGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765881392; x=1797417392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KYRRHbFdTe2sZGUqk4YeZohr4sPEiHsOT75dN6eLDuk=;
  b=HqH3UxGv2E6mSlESKr4hQAaN3Kj/6C077dPJd+u8bgPCymUMhB+mfCze
   8iRJ79crnxvBwUas0/75Lb4jaFwwBB6AfBnPlXztAS5Vsyu2ghCPLCq8M
   sS0CCAfbNKfzYcnrfAqdScCd6Bc7fZTkuJVH70zcsnQq3eUdbb/nZ6s/M
   XU6UU4bZ3sP4G8LMamRBixp7Ijawd/0xyjJRigMT6IoHXyXFLQU/PxbB7
   ccJwPgu0UdU369yYbjm4fA2nUInOtFck2kYa+RHkcU++yPkpItWtUmW+5
   5KmpwmauQsnVWsB4N4zal2xbfrFfxg2k9qx8kECOz9Sj/W8LZtovkoiHD
   Q==;
X-CSE-ConnectionGUID: Ty8/T+ZFQYKn+olvQLNIRA==
X-CSE-MsgGUID: ltTFl6mnRbeB64Mz0dxH5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55366130"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="55366130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:36:32 -0800
X-CSE-ConnectionGUID: I0OZqoDKRS6QOArr9QBStw==
X-CSE-MsgGUID: sySNU1VyTWenRZVjvglQ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202167889"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Dec 2025 02:36:31 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVSPs-000000001VD-3Lmq;
	Tue, 16 Dec 2025 10:36:28 +0000
Date: Tue, 16 Dec 2025 18:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1676/1848]
 drivers/gpu/drm/sitronix/st7920.c:865:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512161833.w5Bkt10d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/sitronix/st7920.c:865:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Iker Pedrosa <ikerpedrosam@gmail.com>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   563c8dd425b59e44470e28519107b1efc99f4c7b
commit: 88b09229f34a8a2a0c6aa8a62eb6c96011181e3c [1676/1848] drm: Add driver for Sitronix ST7920 LCD displays
:::::: branch date: 9 hours ago
:::::: commit date: 17 hours ago
config: loongarch-randconfig-r121-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161833.w5Bkt10d-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161833.w5Bkt10d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512161833.w5Bkt10d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sitronix/st7920.c:865:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7920.c:865:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7920.c:866:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7920.c:866:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7920.c:867:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7920.c:867:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7920.c:867:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7920.c:867:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +865 drivers/gpu/drm/sitronix/st7920.c

88b09229f34a8a Iker Pedrosa 2025-12-15  864  
88b09229f34a8a Iker Pedrosa 2025-12-15 @865  MODULE_DESCRIPTION(DRIVER_DESC);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

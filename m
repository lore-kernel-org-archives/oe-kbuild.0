Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC87404E
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jun 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780821742; cv=none; b=uC9i3GIKfbQuleT9BQvKjrPqhXKzPbXtEQKsMHt8ke5ArHWnm53e/z/0SSOrmsLPm6MmO3Ezpkl3XgEOWw3gexBq3CCvbMu7o2IDmuosQ8on+yaJWPsGB4l/xRcSvL0cT3TXHKmmvmbZWQLHV7A520MabNo1pArtnxBmKsA9Tsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780821742; c=relaxed/simple;
	bh=E/Ln+o8hY+AggM11sZlj3i0KDF1I+YPOxoqtZikmmL0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EdOjgJ4vjpAY/h1plrrFZcEtxSAaRzdZYLBLjeJhhJDVJGHIyTtu9XtV6s0suqDI99doo+kNbqIHS+ZKYmEc4HNxx5+U56fpHv+WS7YqnJ/vzQoSbvdiU8xu/HhrcMfGZQkoo1kBbN4hFpu+uwFGALMtfM+uqA9Xb52GDtM6QsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/5m7RUW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/5m7RUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780821741; x=1812357741;
  h=date:from:to:cc:subject:message-id;
  bh=E/Ln+o8hY+AggM11sZlj3i0KDF1I+YPOxoqtZikmmL0=;
  b=I/5m7RUWk0mwMl2siIQmvZQy8+pHXRoSEGRqZ7WflmDWkny/f6bicqp8
   aFf2UIfVIrMt5zPZq8o78y5DuRZz5hJBSCON27e8JjQL1PEaPqXcfXM1q
   Y1UefJUvw51ko4pjabUp7S8VT1WFgmWcUw/kvaSGnshmIruwhQ9fxt3kr
   8sf6QULMLfBlQ+P0e/fdr79OpShj6vyHErd0Tf4c0sWJCwoSy6Uj4kKmf
   1OO+71u2p493v6dK+okBzzHJ5aZ4vYEbVGAAYrGr/X4MspWPk/Wc6gHmX
   hwXPwYmmBLtEvydFKdgQqL7jU6uD/nFiDESnFMPGsEt+SYHGj3fQU6WUa
   Q==;
X-CSE-ConnectionGUID: JY7EsPFoSSikLKy8Umvbuw==
X-CSE-MsgGUID: SBPV/yNsQdOvIay8/24QLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="92974935"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="92974935"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 01:42:20 -0700
X-CSE-ConnectionGUID: 85sX8iUBQdW651Vs9RHOlw==
X-CSE-MsgGUID: 9dGpmw9iTmCQZslNh91lJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="245378439"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jun 2026 01:42:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW95E-00000000HjA-2iG4;
	Sun, 07 Jun 2026 08:42:16 +0000
Date: Sun, 07 Jun 2026 16:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/sysfb/corebootdrm.c:103
 corebootdrm_get_address_fb() warn: impossible condition '(size > (~0)) =>
 (0-u64max > u64max)'
Message-ID: <202606071621.XimUx4xM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8e65320d91cdc3b241d4b94855c88459b91abf66
commit: a29a1f0ec8d69ee917a9d4c84b844df0decff0ef drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers
date:   4 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-r072-20260606 (https://download.01.org/0day-ci/archive/20260607/202606071621.XimUx4xM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a29a1f0ec8d6 ("drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606071621.XimUx4xM-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/sysfb/corebootdrm.c:103 corebootdrm_get_address_fb() warn: impossible condition '(size > (~0)) => (0-u64max > u64max)'

vim +103 drivers/gpu/drm/sysfb/corebootdrm.c

a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17   99  
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  100  static phys_addr_t corebootdrm_get_address_fb(struct drm_device *dev, resource_size_t size,
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  101  					      const struct lb_framebuffer *fb)
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  102  {
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17 @103  	if (size > PHYS_ADDR_MAX)
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  104  		return 0;
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  105  	if (!fb->physical_address)
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  106  		return 0;
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  107  	if (fb->physical_address > (PHYS_ADDR_MAX - size))
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  108  		return 0;
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  109  
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  110  	return fb->physical_address;
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  111  }
a29a1f0ec8d69ee Thomas Zimmermann 2026-02-17  112  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

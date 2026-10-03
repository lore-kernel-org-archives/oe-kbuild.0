Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10E0625
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 05:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791007061; cv=none; b=gdhurB2R6/YREFp/USf9dZTvr1c0fTvRp+i6a3wt5M1DCgOubmHz7Sc9kR3kgEUjjLUcGWNxUtkguwTDzgezVL69O34vCN4LT4xvezotqevGIZfcNRH+n3aXZFqycose1CWv6l3+WxQVv7X1OCnfOxqUz6q28ZpUY6jz6LdhsYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791007061; c=relaxed/simple;
	bh=JfT0GkzjmnmsP7kQhnAz/pFVRF0KX32LQN+jUuqaXU8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZNtyE/WHfMCgGdZoi69h+ANH+rRYRiSKtN9x8wLEszS841TFXuJaH8E8fhCALFcWIqlKxNtyIa24kFypPwIetJKM6anKxiPmMLYIcPaLOw4cxY2i4MB+6CG0EnNoeIlaSnKEXgocWEZYcdRjj+lN0hqJtcXiwtCT5Rj2gemxKtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgZTa/dT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgZTa/dT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791007058; x=1822543058;
  h=date:from:to:cc:subject:message-id;
  bh=JfT0GkzjmnmsP7kQhnAz/pFVRF0KX32LQN+jUuqaXU8=;
  b=mgZTa/dTY2O+1oboyBMTaixW43kmb6RYpnKOfz/SX9t/XwTXwyG3HgJ/
   fJv9pCebPcYe3O99Pdp0FQID5N2VDzGDnBdWljLQxiEd0tc5BdQhfOsOE
   ySc/M9+hOyoRqXEjnuv4nuCc/resiqzKjc8qCoCBAB5GWY3eJayOT4W+1
   YrxZAw2foxDqksPErX0jGp2otual3q0yToqhfZTTvdTB3l6rW+8mFRmMl
   XLrNTX4EnG59U1y1Ia1EvxqrVnCqb7y4elkBGAmrgg8zDwJhfMOZsoFYp
   s1/Pj0rIcg9oXSaB6qvMLg4cMPi44pdPxXu0LZGmN8/2KAm2z89eduO/g
   g==;
X-CSE-ConnectionGUID: Ig5tNB6vSWmpha9P8CoXrg==
X-CSE-MsgGUID: tgkFSGXeTTWw5y1fb/GhcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="109252687"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="109252687"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 22:57:38 -0700
X-CSE-ConnectionGUID: q7rdNh9xRKGwiXv+brxhWA==
X-CSE-MsgGUID: YDTbPnJ0Tt+zfvNPUiuxHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="274208594"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2026 22:57:37 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCskY-000000000xb-0Q8k;
	Sat, 03 Oct 2026 05:57:34 +0000
Date: Sat, 03 Oct 2026 07:56:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/sysfb/corebootdrm.c:103
 corebootdrm_get_address_fb() warn: impossible condition '(size > (~0)) =>
 (0-u64max > u64max)'
Message-ID: <202610030702.Dp597k8b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
commit: a29a1f0ec8d69ee917a9d4c84b844df0decff0ef drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: powerpc-randconfig-r2201-20261003 (https://download.01.org/0day-ci/archive/20261003/202610030702.Dp597k8b-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a29a1f0ec8d6 ("drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610030702.Dp597k8b-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/sysfb/corebootdrm.c:103 corebootdrm_get_address_fb() warn: impossible condition '(size > (~0)) => (0-u64max > u64max)'

vim +103 drivers/gpu/drm/sysfb/corebootdrm.c

a29a1f0ec8d69e Thomas Zimmermann 2026-02-17   99  
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  100  static phys_addr_t corebootdrm_get_address_fb(struct drm_device *dev, resource_size_t size,
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  101  					      const struct lb_framebuffer *fb)
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  102  {
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17 @103  	if (size > PHYS_ADDR_MAX)
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  104  		return 0;
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  105  	if (!fb->physical_address)
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  106  		return 0;
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  107  	if (fb->physical_address > (PHYS_ADDR_MAX - size))
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  108  		return 0;
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  109  
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  110  	return fb->physical_address;
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  111  }
a29a1f0ec8d69e Thomas Zimmermann 2026-02-17  112  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF687451062
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924348; cv=none; b=AeIXVWyJse1Q1tzuEEjTta+Hwg6qCVTUSrgSptWcthFrcpsW1Z/O1VMBnp31idpHAcB7XvOW/rAjeNL0plfCybt9wAZh0zxBXoR5zMng7wG8epqBNko53D6Pzbm0p402VYA4SL1MmKVnQAgPpbUFqOowF9yLMEhIkMvCXSRZQVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924348; c=relaxed/simple;
	bh=XM1VMTK9JJr2bGUQNmdyrp6nkzCjyWZ8ZfwxOvJKYzQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=idfm4G59QlIbd5pTA9CkyRAEih4tK1Uad64RcZkv7FtMM4L4GkUOkX5XWZGuIbYjfbeVJkbj9F0wiBQZqZrN+a59mteU3HOq91dpYDR2IOs8QNxq+4nzCpdw0C9jTbunntUQgF1xxJzyD79uD+TQxxLHFcKCE1e+tp0b5/1h22s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WN84TLzy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WN84TLzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768924346; x=1800460346;
  h=date:from:to:cc:subject:message-id;
  bh=XM1VMTK9JJr2bGUQNmdyrp6nkzCjyWZ8ZfwxOvJKYzQ=;
  b=WN84TLzyljvJ3sSPoE0JCCuDh1z/9zMdpVdKIUmdSX+jGjTNvO40Yx20
   FYTQ/ILdNNKjlyh5+7KbqiQMF+ogFZp9mJxJG5GpqWnk6zfZA/s+JB0SU
   pP3KWLMYArFIUEWBza1I4x0Tzsa2Bso44c8FZRA0kEeA5xhbL7WlGcz07
   7n+80HwX8IUNmQPfrVknu3QBDGUWRFHPFVYuKyGYiDrxmzmSf6BSOvAw9
   G5jPRG5bHVDncvRmoC70/o/Es3N1a1Ss2ALL5r2SDQdqDE0B+fx6Tb8iO
   rvhyACj5+tWDk/CuO9wv5yGNs/jsAN6fNpZsxJma7SPHcEowjS7iGevRs
   g==;
X-CSE-ConnectionGUID: trT1iLZpRQOwg3kDiQTSzQ==
X-CSE-MsgGUID: M7lGunJbQOis/yF+MZMyIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70037026"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70037026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:52:24 -0800
X-CSE-ConnectionGUID: kbyrPxK0SCqWqjpUbfoxPg==
X-CSE-MsgGUID: klzA9g6TTS+di0HR1F907w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206193368"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jan 2026 07:52:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viE1k-00000000P91-14wR;
	Tue, 20 Jan 2026 15:52:20 +0000
Date: Tue, 20 Jan 2026 23:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1080/7987]
 drivers/gpu/drm/sitronix/st7920.c:865:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601202356.4kMdbjKj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/sitronix/st7920.c:865:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Iker Pedrosa <ikerpedrosam@gmail.com>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
commit: 88b09229f34a8a2a0c6aa8a62eb6c96011181e3c [1080/7987] drm: Add driver for Sitronix ST7920 LCD displays
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: powerpc64-randconfig-r111-20260120 (https://download.01.org/0day-ci/archive/20260120/202601202356.4kMdbjKj-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601202356.4kMdbjKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601202356.4kMdbjKj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sitronix/st7920.c:865:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7920.c:865:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7920.c:866:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7920.c:866:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7920.c:867:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7920.c:867:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +865 drivers/gpu/drm/sitronix/st7920.c

88b09229f34a8a Iker Pedrosa 2025-12-15  864  
88b09229f34a8a Iker Pedrosa 2025-12-15 @865  MODULE_DESCRIPTION(DRIVER_DESC);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE49C179BC
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jan 2025 03:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738120087; cv=none; b=qbhnfh3dtuuEDTzKOPiWBhtKybbemXDeEAXYa6CXgrPvTCOOHmPzMRBgF8AyfJSWsIZTlUOuFb+jfFYHXHlntr6L373peRAle+1U60GJOuLoin198hI62OFyZRoNccOQ7EsixjO2dJIRIow/Yl73TcoOInETvm0J6yiqI4Q51W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738120087; c=relaxed/simple;
	bh=fXODTR4IIZ/u5BfUwQ+x030RfyqKj3nWcGrajx9FoHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9SKVbCUnAURILuS0T4wmtoscA1TC0R8RyFUw2k8j7IY6Yty0SbemZ0o6fR8/m+A8abJ0sVyFWUNuew9OdbP9Kd+FYw3Lsh5go3wIf8xB2ISbCPvjc47f7oRTTQ1bmZQ5cePVb/pEu1gfboYUp2k85JM0WgfZdKLDYTeDk2BbpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCctdidM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCctdidM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738120086; x=1769656086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXODTR4IIZ/u5BfUwQ+x030RfyqKj3nWcGrajx9FoHA=;
  b=lCctdidMS415OVuWRsv8CL+OBMghWYsOcS/shG+0AL5VkhCZsKnVmWRz
   n/hyMGfBcyhKWa5T1TkJ19vaKZYVDzIc4gBNqNrTNzXllDY7AHek22oYz
   Tz0+AGM6puz2q3WWClJtHQlDndMvA+dgcLtuPMOdXX8utb5oqoI2QJhFY
   BIsbi8waPHzgiyNOO4qvE9trKx/D9stVFIYp3d1WGLRJe7v9pUnqyVe1V
   2xkPmuq5uELA8BUQzSVfZ8aMsXBVMu0FUMaf4piiC1x9nx/LXktXdZhrf
   z6gN7famskTBupYQcI9f3KMIX8pa5/6nmWoZDrnjObRWnJRNoJiPX99TL
   Q==;
X-CSE-ConnectionGUID: 04NYKzF6TNue8QDe3RNF+Q==
X-CSE-MsgGUID: tu1jWyZeRvCz+eABFhOwOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="50012002"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="50012002"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 19:08:05 -0800
X-CSE-ConnectionGUID: LsatywqkRe+OkvnT6FzZ0Q==
X-CSE-MsgGUID: SSIbdsJwSXegxH9g1HMv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="108727180"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jan 2025 19:08:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcyQs-000iWF-07;
	Wed, 29 Jan 2025 03:08:02 +0000
Date: Wed, 29 Jan 2025 11:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version
 generation failed, symbol will not be versioned.
Message-ID: <202501291109.SqyeMx4b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Richard Weinberger <richard@nod.at>

Hi Randy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
commit: a730af6e3114d549555f4b130c216bad1c3aa80e um: Add 2 missing libs to fix various build errors
date:   3 years, 10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 years, 10 months ago
config: um-randconfig-r054-20230701 (https://download.01.org/0day-ci/archive/20250129/202501291109.SqyeMx4b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291109.SqyeMx4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501291109.SqyeMx4b-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
>> WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version generation failed, symbol will not be versioned.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

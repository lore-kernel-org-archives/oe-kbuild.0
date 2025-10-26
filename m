Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834691E5201
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 03:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761448045; cv=none; b=eYBqlw/SuO2Ht7JcU6/mIhPDtjXztgx1VyTFNIhqZr1UnLb0WUIkioPh349aB++HLMYBRMQqbAAd4LesSeRqKbnuZbipGNXk3iTTcgG6I/B9nh4ibmDSYiyJTd1ddnhhdFht3QZQjQwJ2cPqXpENbOHXSi8eLTAINRPNhWOsa7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761448045; c=relaxed/simple;
	bh=7sauHh8+VRbnhHmSvhOHqEj/jjEscno2dFfS/DpmEKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ps8ZYZktuBnS1XdRqfoDCQ6l2vtS5cTPmjWWlLzxpEnRpBWYpHEk5xVdvrG1Ao5kHDzhd1uQB8bDq8FZh7Vca7ZUhdxQ5UmCMI8/f5tttnJQLPKTMUdONNijbxZTYeeRAR5p9xU6gATIM97MjyAjJbqS52F2kpZKfjCQabVA6IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuBXuD7k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuBXuD7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761448044; x=1792984044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7sauHh8+VRbnhHmSvhOHqEj/jjEscno2dFfS/DpmEKY=;
  b=fuBXuD7kplKd8ttcV3dRHio8mtk3yHpvlQnsGNnqJgbke1HkM6RkLH03
   PjPvI/Nq96PZlWTQoD9XhzdwNnTZ+AH/yTqu461hE6IawbbG1o8EJRuqF
   6Ryo2jodmNoDY7DO5xSfor/mjkrUXb3CkUjSFHWKeTiTYITgzjn0ir5KC
   4RZhLLv56PiHIBtsPSImpXadbaeDBsuJD1+p0MFXGcYRkd8uRYLG5l1YC
   Rk326WuFR5vYyZ6uXvpCH375R/wWrmrmR9ztSnolYPs0Oq8TOfxwErf01
   dWxAS5mvvprymTGZ7ttdOE+aKKGPKtkDHTR1CNn4Uho02de/bZSVG+d5B
   w==;
X-CSE-ConnectionGUID: dgLjes4oRzCiUwo7MrsstA==
X-CSE-MsgGUID: p7F/OJBTRWKI+5DTCKywyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63472498"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63472498"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 20:07:23 -0700
X-CSE-ConnectionGUID: CsRF4T2pRdiWa54O16g9eA==
X-CSE-MsgGUID: FPQ3uv3ZQDSQBTMVAOkf7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="185105743"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2025 20:07:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCr6C-000Fq3-2a;
	Sun, 26 Oct 2025 03:07:17 +0000
Date: Sun, 26 Oct 2025 11:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: set_layers_via_fds.c:5:10: fatal error: fcntl.h: No such file or
 directory
Message-ID: <202510261024.iDAnOFIm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christian Brauner <brauner@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72761a7e31225971d0b29d9195e0ffa986b77867
commit: af9199145b1977316b3c752e2124543e320f087f selftests: add overlayfs fd mounting selftests
date:   1 year ago
:::::: branch date: 9 hours ago
:::::: commit date: 1 year ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510261024.iDAnOFIm-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261024.iDAnOFIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261024.iDAnOFIm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> set_layers_via_fds.c:5:10: fatal error: fcntl.h: No such file or directory
       5 | #include <fcntl.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

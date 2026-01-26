Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEEF252900
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440198; cv=none; b=LrAQ2E2X1i/eZGeXabizIm5ECpNMbyH8l8XhkMQT3xOBttz+eRaEvczSljoYN9PE6jVhmBSFJZFT/nAVPgjTQdkRmL1aa0P36xIAcnZ97HhjVz+h+jtDuH2huuh9OxO9iff2IlRaFRIC9Qmnkv9ZtquwvxDS4PfAyhrrc91IvbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440198; c=relaxed/simple;
	bh=0QUGMGEDTl7myA68Y9bXam3IY+1arOxm4f/ZtXnSgF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HKYCFF+ahhwPUQSN27kNc16qisEq+2sYX3N380FIpCeFHr+pW3p3VysI+Hejfye/x5xv+R+bcUgQ2Wwcn7WljMzbPELuAjW5+JW2waHbYzTptZcsSk6EHqkHp9JmerRFMq72z+8yy+/xU/R9qKFAwJkXYYjYa3qw0h6fmmAeAGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiG2pPtq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiG2pPtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769440197; x=1800976197;
  h=date:from:to:cc:subject:message-id;
  bh=0QUGMGEDTl7myA68Y9bXam3IY+1arOxm4f/ZtXnSgF8=;
  b=NiG2pPtqid+z6+e51bemHj1DhDwR/nfIpSs5eXxXElU/+OFrN17TL8Ie
   mH1Hnc9uQ34edMuwVoLseo18nq1mS/1ca8q2HTQbG50/5hpItzOb1F8QW
   gcyoocBmJBBuQZsZH5aacgDTOZLpVKPmo5FMFMmoDPxtWK9m8omPW4GOP
   mQRGZnB3N8mh38fzP0z6WNILPxfkTci4VeMYna57zmYsuC5Uh+dtxJlR1
   FaWvDcPCeaurMCc16ewr8BlOdi6Y+7vfJ4S43JRHFcyNZlWvTLnDctQpq
   PqMrtyqHi5xw3nerAmloF4bWkyVfSUrd+E5zGPdLrSAemSVU6X6PPilS6
   g==;
X-CSE-ConnectionGUID: U/Nq/rAtSUWDfTZmcH9arA==
X-CSE-MsgGUID: 1Sk+o9xxRTq2vPv/6tzzQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88031335"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="88031335"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 07:09:57 -0800
X-CSE-ConnectionGUID: AQLTjbGjQumrb5iIY5Lsag==
X-CSE-MsgGUID: R+b/nQZMQDyJg47tzNWH7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212558976"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jan 2026 07:09:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkODx-00000000XQ2-0aOK;
	Mon, 26 Jan 2026 15:09:53 +0000
Date: Mon, 26 Jan 2026 23:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jarkko-tpmdd:vcam 5/5]
 drivers/media/v4l2-core/v4l2-vcam.c:31:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601262329.68XfvGOp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/v4l2-core/v4l2-vcam.c:31:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   43ae87738b05d8f8e7ae4d1d6a250c396687a081
commit: 89e4b2f0909bc377757b65e8565bee625b210c76 [5/5] media: v4l2-vcam
:::::: branch date: 4 hours ago
:::::: commit date: 9 hours ago
config: powerpc64-randconfig-r134-20260126 (https://download.01.org/0day-ci/archive/20260126/202601262329.68XfvGOp-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262329.68XfvGOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601262329.68XfvGOp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-vcam.c:31:1: sparse: sparse: bad integer constant expression
   drivers/media/v4l2-core/v4l2-vcam.c:31:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/v4l2-core/v4l2-vcam.c:32:1: sparse: sparse: bad integer constant expression
   drivers/media/v4l2-core/v4l2-vcam.c:32:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/v4l2-core/v4l2-vcam.c:33:1: sparse: sparse: bad integer constant expression
   drivers/media/v4l2-core/v4l2-vcam.c:33:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   drivers/media/v4l2-core/v4l2-vcam.c:48:1: sparse: sparse: bad integer constant expression
   drivers/media/v4l2-core/v4l2-vcam.c:48:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/v4l2-core/v4l2-vcam.c:49:1: sparse: sparse: bad integer constant expression
   drivers/media/v4l2-core/v4l2-vcam.c:49:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"

vim +31 drivers/media/v4l2-core/v4l2-vcam.c

89e4b2f0909bc3 Jarkko Sakkinen 2026-01-23  30  
89e4b2f0909bc3 Jarkko Sakkinen 2026-01-23 @31  MODULE_DESCRIPTION("V4L2 virtual camera driver");
89e4b2f0909bc3 Jarkko Sakkinen 2026-01-23  32  MODULE_LICENSE("GPL");
89e4b2f0909bc3 Jarkko Sakkinen 2026-01-23  33  MODULE_ALIAS_MISCDEV(MISC_DYNAMIC_MINOR);
89e4b2f0909bc3 Jarkko Sakkinen 2026-01-23  34  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6B017B506
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 18:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748111667; cv=none; b=fBhSw022OdsIu5f2z6MZtK0KRF+z8nNfXYxcBzxt+lV+eEkpt/ygChPUqNauQ3JPiyDm4Gowy3JvEWN20FdI1TqK1GtoLyJi0SlShC9jTnxwV7iikjnrSveCbLHy4G8vrKVnuOpfGLN1t4XyOJ7Uz0+UFvyGL4+YsMZ8ii5DwZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748111667; c=relaxed/simple;
	bh=QPGUUvM5I89G+BA2U4roMtHGVB0yYBMObMkguE0isJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2rh0o1mRTVGy2HfZ0PmbicnTDQ5nw2MnZNitleCpQR4nB7vz9c4DdYSfZf0QIpfkwlBzrwnyZVIbr6xFe7itdrW0heormC3h/2HS11E9sofKZSRMOQRAR67uHVMYWlr5s9McbIzL8h9/ecE5YBRMIxHtodtvF761Zoa2sz12Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/o8xJ9a; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/o8xJ9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748111666; x=1779647666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QPGUUvM5I89G+BA2U4roMtHGVB0yYBMObMkguE0isJ8=;
  b=d/o8xJ9afGlI3WWkRfLZ0Ezr/Kray98kf3SxRLhWERbF3rkHfk+q3fAt
   MdzIjebvx42Kd93A+t82RTMD9BupUYozYYF5ROYsoqyxTChxbUc59l+SO
   QiPvtGOyA4tFEk95ifKYYJoRlDOOLmLtclJunqgFs+vsCKXDJt5gemPMp
   fga2M0O0piAYTCyfxuFgTuCfJiU4BgizUfgSANBLKuGtFSWfn5DcrXqyv
   hBd1F1O8fQAVxyPBNt/DM4vs2kGoCE4h1VFfOTCB0ddeQssnyk48FKyqS
   aBVuZpWDq5TuHTEJacd57f2+BXqHU1SeLWr2/I59O31QQHJ+OMPxTWPtx
   Q==;
X-CSE-ConnectionGUID: 10SkIk/JQ9OZdxhhfuykgQ==
X-CSE-MsgGUID: sn+kNPXIQ1Opw3cli8CKCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="67551534"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="67551534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 11:34:25 -0700
X-CSE-ConnectionGUID: gzBJJEYwTxyhP82JxYSl6A==
X-CSE-MsgGUID: VuW4AkknRJWIYzrFvd4dpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142217168"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 May 2025 11:34:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIthO-000ROu-0e;
	Sat, 24 May 2025 18:34:22 +0000
Date: Sun, 25 May 2025 02:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/disk_accounting.o: warning: objtool:
 bch2_accounting_read+0x344: unreachable instruction
Message-ID: <202505250225.XuLevaOq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4856ebd997159f198e3177e515bda01143727463
commit: 2e8d686a4a13c01d9a2b329507a0f5ce6455b5a8 bcachefs: Coalesce accounting keys before journal replay
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r063-20250522 (https://download.01.org/0day-ci/archive/20250525/202505250225.XuLevaOq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250225.XuLevaOq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505250225.XuLevaOq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/disk_accounting.o: warning: objtool: bch2_accounting_read+0x344: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

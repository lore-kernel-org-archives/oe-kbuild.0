Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB92847B
	for <oe-kbuild@lists.linux.dev>; Mon, 12 May 2025 07:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035835; cv=none; b=XOV71LQ0Jfv3p4GTXCXz0twsy3Cv/607LjdDeKjF9zylxBXTmbJFL3mDDPsGK9wK/1khze69Pj+qb3bWCnOm711fHMlIz7hi1rM5tdFgFIMd2+CbBPZ5H5eE4BCRYAO2qGUKNXBCicngz5EbekuF58uxUKOt6zOw3lF3qazhJXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035835; c=relaxed/simple;
	bh=e5H42m7rdgrSXEq369gX19J3yJOaCSsf8toaTywCMFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fksA+ruCXwnm4L39GLly8iGxBpM8HSLEibEGHEUH4r/3XFwJqjbXDIwiPg+Ndpkfo8hw4f0TnMNN4KHsEhW3ziF3IMa2iHq8aNNL+blxHkADH7OYET2/6xGhEBOYEeqJfanI4xkt2T2eNjfsykgTpT6/QvXajJXq92YFCqocBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aH2ZhIT4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aH2ZhIT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747035833; x=1778571833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5H42m7rdgrSXEq369gX19J3yJOaCSsf8toaTywCMFM=;
  b=aH2ZhIT475/IUgJCSW0qnVq1ismwTuZuXz+s4++y0BsbbKdrfJtaLuxP
   YqRJ79ijInhLrWCz40bXlPDtcR/7a8Sk1q13akJwNN36wp44T7BDaD7tT
   F3QmmyfvMfOOVF1twA3/9nWICkfbPftSeVarXbUJabVV79+AsflaOBnIi
   DZFXqEJXvUOQfHQvl+HTVEAQbp6rMy3D97Z9pbo4p6UzlwAa51FIxeMEy
   wVPoU3nLiyTHHMJY5t3sJ7pm0TF4Hq0kZtrIZUgUMGJa/oGG0xYsdvtAG
   oWRl54mmQgzDZDilg19L8jfAusdgYvD7SjUbZ5t1TkN9GGfo0Tx2ZtzSJ
   A==;
X-CSE-ConnectionGUID: x4O67+2NToOBSdUYxwWy5g==
X-CSE-MsgGUID: yWRq+zSjRSW9BsA3Q7kyoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66224734"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="66224734"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:43:52 -0700
X-CSE-ConnectionGUID: 5CcnpTk9TH6ctcQRBNcH1A==
X-CSE-MsgGUID: 0WiFmibiQdadByBdWpBDUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137759494"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 May 2025 00:43:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uENpE-000EHT-0g;
	Mon, 12 May 2025 07:43:48 +0000
Date: Mon, 12 May 2025 15:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8553/10031] fs/btrfs/file.o: warning: objtool:
 copy_one_range+0x33c: unreachable instruction
Message-ID: <202505121506.tIWTRhZm-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 76a4d79a2b935eea79bdab0c89aa157451aaf58d [8553/10031] btrfs: refactor how we handle reserved space inside copy_one_range()
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505121506.tIWTRhZm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505121506.tIWTRhZm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505121506.tIWTRhZm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/file.o: warning: objtool: btrfs_dirty_folio+0x120: unreachable instruction
   fs/btrfs/file.o: warning: objtool: btrfs_drop_extents+0x39c: unreachable instruction
>> fs/btrfs/file.o: warning: objtool: copy_one_range+0x33c: unreachable instruction
   fs/btrfs/file.o: warning: objtool: btrfs_sync_file+0x65c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

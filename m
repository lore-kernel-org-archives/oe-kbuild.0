Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38221DFE8
	for <oe-kbuild@lists.linux.dev>; Mon, 26 May 2025 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262224; cv=none; b=Hct/DbXMyI3uHdAV63hwnGkFq+FwZAVTXMz4zdEL7/V3e/ohVNjraH9mn8bFXdcEfiUjCnqRJ4ipLyxF/N33VnOlqijoRlXh3BtLlXwuMCITWAJ/DQbA7YWktr+vuZqKGRacBSLSDoqas5/3bkYQaqZmz3KPK8FETdDk/N4cmPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262224; c=relaxed/simple;
	bh=zpMJhAH/iYBBqEAtgU7mmKJHWNMA4mc/qATYcX+BhvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLsdlaN/Fuc8OmO/HMLrWQemF6O/syM69+iyxCyv9JiD06fb4gErUWQIf/xd4RKiI+DcTDAF/htJUm8I7eEtGhRw87S4Zxso6p/v8W/8+TMoxUT5naCAkAjFYPjEiFfCvrMQx/ABF8+jzd5HF+JfCjEou2mk5csusqxbPv87mOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wfj2jGlG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wfj2jGlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748262223; x=1779798223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zpMJhAH/iYBBqEAtgU7mmKJHWNMA4mc/qATYcX+BhvI=;
  b=Wfj2jGlG2aWXkZTSMQgqKqU7pNwlkmSARZYYVa7uGHytxfOsuN3BqWZ/
   KQ88cr2JPiLXBmDciEJbom3aR+6t013/g4C/BjixQe8zr0IDfn8wwduvU
   PBGhWN/QjkAfGXNMrUFK3dji9sX8AYvyuBlvhLF9TD6hgnqEpQiFqkyGb
   RktGVRpDf90DUvyInHDKAog64t+laEuKXGiSkYd2NenceVJuue5Y0pbgx
   M0t+pcJWLQoQxJ8AX5g+A+tu6fy48Kiv1BcnVMUw1jZF0+lNLAc5pdZBe
   vUMxGseaYY5Za+0qR+qA/ECAd5xiKHCwolM22QPANAsNoGtG92mAbRblc
   g==;
X-CSE-ConnectionGUID: QWU8oEr+RluD0QMbs6B9pA==
X-CSE-MsgGUID: PA9WFSNDTGGdRk7xTtNW6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50161797"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="50161797"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 05:23:42 -0700
X-CSE-ConnectionGUID: jHug1lLKS26I2gDk1ZZOfg==
X-CSE-MsgGUID: mH+VQYFgQxiETH+W4UiwxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="142944883"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 May 2025 05:23:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJWri-000SOO-2p;
	Mon, 26 May 2025 12:23:38 +0000
Date: Mon, 26 May 2025 20:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10463/13629] fs/btrfs/scrub.o: warning: objtool:
 fill_one_extent_info+0xf8: unreachable instruction
Message-ID: <202505262044.AhiqZsWg-lkp@intel.com>
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
head:   176e917e010cb7dcc605f11d2bc33f304292482b
commit: 4ad57e1e224a349cede42e1fcb8abded0e4850ab [10463/13629] btrfs: scrub: reduce memory usage of struct scrub_sector_verification
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: loongarch-randconfig-r063-20250522 (https://download.01.org/0day-ci/archive/20250526/202505262044.AhiqZsWg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505262044.AhiqZsWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505262044.AhiqZsWg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/scrub.o: warning: objtool: fill_one_extent_info+0xf8: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_stripe_submit_repair_read+0x94: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_stripe_report_errors+0xf8: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_verify_one_sector+0xe4: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_submit_extent_sector_read+0x16c: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_submit_initial_read+0xb0: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_find_fill_first_stripe+0x158: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: submit_initial_group_read+0x7c: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: flush_scrub_stripes+0xb0: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_raid56_parity_stripe+0x118: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_simple_mirror+0xf0: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_simple_stripe+0x84: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: scrub_stripe+0x128: unreachable instruction
   fs/btrfs/scrub.o: warning: objtool: btrfs_scrub_dev+0xc0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE57D24166E
	for <oe-kbuild@lists.linux.dev>; Mon, 12 May 2025 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065297; cv=none; b=rsRixszDhO/FxXZc8FipEazZg0vx6vq8alWNOfpxrnI51kyV6PbhtMMSuhJ6RME4ejTaOMdNzEBOa2ePDg2ApZU1eFQSOtAYKt+qe6MtCPhIsCGliRdVODUClH5P0cII4/n0t1LcM88mm/T/ebs+8quIJ998T1Mys+esZbkI9NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065297; c=relaxed/simple;
	bh=0sMv9rcoBIfpuy+B1wfkj0SbgK7ap3PfFl9G/6guwzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HXTua9cdvl3Ifc0XVyGGifsMbHB+iBM4JB/oAAXQWxIdsWcqrzeubQaOxDDnTcJE9K9V8iD+CPmldmpS+RyZBzKMHrCZb0jOoRsFaUS36KpvoYTI7/HzcnUGoYZMqsAZOC0g6U2+pEVxdd1+UdlyyWMW28SaBRL7l3AgapQS4pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiVm/S3t; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiVm/S3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747065296; x=1778601296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0sMv9rcoBIfpuy+B1wfkj0SbgK7ap3PfFl9G/6guwzo=;
  b=MiVm/S3tWNxH9NNWnYCw4P/d1GV/MS+7Do4ZlpAe3NFFkVWzy7v4O6TM
   kUvea7HJJC0BvvMIVY/HRUbswdF/Yv1pRyjfV4NrkOXiqAig+Qq0gTaer
   LqcY7bVRjoSC4cMCNG6CA5uECJTVQ3xa2w5RAJvV9UTik5BXV1KBmR+4Z
   T5SHep3kym31xRwYxTK7gwy1ZR1WFhP9GUn+ss2syYxGX975IaW/PfOoa
   kWZAfadp5bKabeQT5KNBIFMu8d7gNYuqiCxfjc7hLC6RXHUW+iiIOp4iF
   3VQp2By4ssmXdHDXvygrC6cbB123ysOyMbFwkkxSlHlV19VXxD1h99rSd
   Q==;
X-CSE-ConnectionGUID: 8IKrFmNeQtSaVCidg8HK/Q==
X-CSE-MsgGUID: 66Q2Lz7ARkCncEAPGhEyGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59531537"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="59531537"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 08:54:55 -0700
X-CSE-ConnectionGUID: SMueOFeSTtew82odT6or6w==
X-CSE-MsgGUID: gnpXIN5kQleAospR5PpQeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="142358816"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 May 2025 08:54:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEVUR-000EXr-34;
	Mon, 12 May 2025 15:54:51 +0000
Date: Mon, 12 May 2025 23:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8444/10491] fs/btrfs/extent-io-tree.o: warning:
 objtool: btrfs_get_range_bits+0x90: unreachable instruction
Message-ID: <202505122307.wbyxhfkz-lkp@intel.com>
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
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Filipe,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
commit: 40cc91c05b95ced23aeed3820966863036604dc6 [8444/10491] btrfs: rename the functions to count, test and get bit ranges in io trees
:::::: branch date: 6 hours ago
:::::: commit date: 5 days ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505122307.wbyxhfkz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505122307.wbyxhfkz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505122307.wbyxhfkz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_extent_io_tree_release+0x9c: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: __set_extent_bit+0x2e8: unreachable instruction
>> fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_get_range_bits+0x90: unreachable instruction
>> fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_test_range_bit+0x78: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

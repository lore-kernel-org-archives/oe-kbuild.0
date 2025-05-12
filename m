Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E875C29292B
	for <oe-kbuild@lists.linux.dev>; Mon, 12 May 2025 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051177; cv=none; b=pWGVMX55xmdEPlenooSrC4TWF7sq89pHzOQpBHPB51atjjsKznUVo6cAu5x9Bw7XG+cDCL19ct4swxbOC9b2jTIGiqx9rnf+t8AA0aGzMiJN6U0ttE8MnAHBlkmbUG+Oceqbi1CnVOAqzma4ovmDsu3ftZ2aCHUnfuMR3tFUTMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051177; c=relaxed/simple;
	bh=thW3gclREQl7IHNK7s/feYek0dUmZy9GsHnNTS6kwQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJMhRj9+fa3jgdpX0+CG5iKxkXTMM6v3iAMMWLL9ypOUn2DbgZioi928+Vd2GmrecksxyUNAVEeMEpENf6m2DsYsItJoIaLTc4fO/5kHWR0+5UWpcANDM7PhvU3OLM0FTbck8FGvzmbX901Cgkffuhy8Wn6ZRia3BA14q6uLTSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJz2+YXT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJz2+YXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747051175; x=1778587175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thW3gclREQl7IHNK7s/feYek0dUmZy9GsHnNTS6kwQA=;
  b=XJz2+YXTMcC/qy4XV0RHzb0PEbijm2Iwn/976EFuDBSb5JKo0A/lGKs8
   X4et0OnU5jSlLHgCdUgNMDgMwBPAwOe/iI97KmywnOq5X4PcBGQ76Sk+d
   6RDNK895g+X144qIEa7PFnvZ4KZAkTtX7q7NX536cfWVAYKgwAKXYtYwJ
   wjnz+qp7xNBMuuplRly3AdEHs6tTbeKm6Uo8gpopIJkpfkJ6kQtTYiqlK
   t02ASyFLJmRX5ORT+3xTGJQuJxjyfQPPUEH429Jz79S98CzwqgdQm2F/z
   bYLp3+b0wjRBmxyUgHTHSt5CeTuNKdbHrx+CLD2tF++3znAMb+cBzKxhc
   Q==;
X-CSE-ConnectionGUID: 4H3gnVk1RGahf1N8lNts1g==
X-CSE-MsgGUID: Kh2r8UdkQLqYbxoBldW1+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52651375"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="52651375"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 04:59:35 -0700
X-CSE-ConnectionGUID: oVgFMJmqR0+mlp00teRC7A==
X-CSE-MsgGUID: JjUcDORnReueJsB6t1C0hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="142551455"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 May 2025 04:59:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uERoh-000EQ7-1e;
	Mon, 12 May 2025 11:59:31 +0000
Date: Mon, 12 May 2025 19:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8597/10031] fs/btrfs/extent-io-tree.o: warning:
 objtool: btrfs_extent_io_tree_release+0x9c: unreachable instruction
Message-ID: <202505121902.lR0eYkvb-lkp@intel.com>
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
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 34e72c2f14db63dbba48cda59ff14f1298422d6f [8597/10031] btrfs: rename the functions to init and release an extent io tree
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505121902.lR0eYkvb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505121902.lR0eYkvb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505121902.lR0eYkvb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_extent_io_tree_release+0x9c: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: __set_extent_bit+0x2e8: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: get_range_bits+0x90: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: test_range_bit+0x78: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

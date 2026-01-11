Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D224A7262A
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 13:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768136500; cv=none; b=UkLp435g/zMwH5wlq9weteavZISZE7mYv/9hmLppYO/2esm7qgJdJsozxCO78/cVVOZ9ZF1YJucdtHL+aOY++2qmdELic18J049pvyfEbY+4m4n1Z072GIb8HzG3ESaQyE9AFIO3ttWRYBBDi0+arkYhvT2pvPpcmTI8Ou9hInI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768136500; c=relaxed/simple;
	bh=EkQSvjvUgCtJYLlK44e17wFeutd+ZlZyLqeNWZLstVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CKm+WPS/o5VhSEFszUivT5GNy6IqZ6Z9QgB1TgXQkEUrCLvH4Ps8ISuPvJA4B115gZgKW6WRb4SqpNeuT+5s/RCNmVBaCL5efi+OCVIWKVS0kNMUwqBNbCdbrvY8ZDBRabo7ZIZvGPs2xwWXtKpMTW4dK0LMCBxYN1xXYby7Nwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2eEf8IC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2eEf8IC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768136499; x=1799672499;
  h=date:from:to:cc:subject:message-id;
  bh=EkQSvjvUgCtJYLlK44e17wFeutd+ZlZyLqeNWZLstVA=;
  b=i2eEf8ICFNLoIXpcOdBzPVKCFPYxk6ZSiq3oJhP6VDfOV41nA/9344nv
   UppLpkKQemrMEdjQ17dy2TzUtEVt6HtNhMvFLTQGNboPtnA1AsRC+GQ3B
   ix9yVXUwaXMSmQKHALuO+9DFjnI37Ecf/H4vj1x+I/aVq4IuFMPF9BORn
   2fSZYjthIegFpuJDLKbAAkcwDlZJhM7zb/92RWQuSudwuYqTtijXC6C2c
   zYXhpn3CA06xWQmZQC+GYnpQrKiqzK442JTeSrSSaldE0iSX1gUfTUZ9K
   FYuUg1Zd2idQK53Em5j6sVgmBdh33JnjELJMG2cuSJm4Jhty+X863jiLu
   A==;
X-CSE-ConnectionGUID: YCoKH3mUS1ye5D2LuQf9vw==
X-CSE-MsgGUID: Irg/tJGlRLOk6M9h2Mm4zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="72012606"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="72012606"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 05:01:38 -0800
X-CSE-ConnectionGUID: Jv2BwZakQ9ivAQTTQhoudQ==
X-CSE-MsgGUID: F1HcJVrRSH2WiArtEDRJpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="203881006"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2026 05:01:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vev4Z-00000000A3y-1Szs;
	Sun, 11 Jan 2026 13:01:35 +0000
Date: Sun, 11 Jan 2026 21:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/kernel/traps.o: warning: objtool:
 do_lasx+0x134: unreachable instruction
Message-ID: <202601112003.IaGFdU88-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   755bc1335e3b116b702205b72eb57b7b8aef2bb2
commit: 06e24745985c8dd0da18337503afcf2f2fdbdff1 objtool: Remove annotate_{,un}reachable()
date:   1 year, 1 month ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci/archive/20260111/202601112003.IaGFdU88-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601112003.IaGFdU88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601112003.IaGFdU88-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kernel/traps.o: warning: objtool: init_restore_lsx+0xcc: unreachable instruction
   arch/loongarch/kernel/traps.o: warning: objtool: do_lbt+0x114: unreachable instruction
   arch/loongarch/kernel/traps.o: warning: objtool: do_fpu+0x84: unreachable instruction
>> arch/loongarch/kernel/traps.o: warning: objtool: do_lasx+0x134: unreachable instruction
--
>> fs/crypto/keysetup.o: warning: objtool: fscrypt_setup_encryption_info+0x194: unreachable instruction
--
   fs/btrfs/ctree.o: warning: objtool: insert_new_root+0xa4: unreachable instruction
   fs/btrfs/ctree.o: warning: objtool: insert_ptr+0xa4: unreachable instruction
   fs/btrfs/ctree.o: warning: objtool: copy_for_split+0x208: unreachable instruction
   fs/btrfs/ctree.o: warning: objtool: btrfs_set_item_key_safe+0x2c8: unreachable instruction
   fs/btrfs/ctree.o: warning: objtool: __push_leaf_left+0x458: unreachable instruction
   fs/btrfs/ctree.o: warning: objtool: setup_items_for_insert.isra.0+0x148: unreachable instruction
   fs/btrfs/ctree.o: warning: objtool: btrfs_truncate_item+0xe4: unreachable instruction
   fs/btrfs/ctree.o: warning: objtool: btrfs_extend_item+0xb0: unreachable instruction
   fs/btrfs/ctree.o: warning: objtool: balance_level+0xc28: unreachable instruction
>> fs/btrfs/ctree.o: warning: objtool: btrfs_search_slot+0x6c8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

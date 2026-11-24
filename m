Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506992;
	b=nXeGmuKm8zNtsrnU9wxFnE/qTdxc/PXqQi0nMVDt4hYyDKmn7BBBqMVrCHJIa7x+rr5R
	 Q+XGYk9tz56ygHkB0Xg0psxRKd2697GuR22XcJ1xlUHUqQB4FfT7TqI5PUfPTYC1yFdLQ
	 bMkb/Xo/SSCz7MRfBp/1OAnIfXZI7mlf3eGU5dtbTsLD+2XhMGPlXRSEV2wpPGDJJsqkn
	 h4aSmU68LI7I9vuHOTIzuDb8xN+1pbef51Dz2AORmULPd3KhiMU9dQQNyitZpmokGUvYd
	 a8p645CnwLpDe+emQLJEbun66kjDR7OOtzb2sKIwex7aHEKFlB+GVUfsXcEvf/dOrqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506992;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Lvw9hrdFs0FkmLS34hPe27NQRwFHYzNl54izggmkn5w=;
	b=BWReAD7XDW9Y3MsitzLvRZ/ZQ6HdAJRDvZzbjUFp/KeWDZY77K6MoPeBWGNgD6WxYVe6
	 msfSewoOxQBobgxOh1SZtjkD8CbRbOb593wfOKHzrC55hBTTXneF26mT4cpF7QYmIVVsn
	 3phH+q8JGZSZ96KBskACDT46xmSgNgmHdsKeGKdGiwZd0REi2kFj+blUeI/Dm1tYuzu77
	 uApQZojIpRLjFmb0rzPEVoiMcMRNGoGrSjV35bSlh7wtIhJsaNHUOdfBLZw+QfoWO2qs0
	 wFi/xze/EmV91RCbGgepP3c9OfA22UnMuv6ti7YHbviQsiXX3dYRsvUp62sBmD82cQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MHLyhTqP;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05739606A31E
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 07:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05739606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MHLyhTqP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795506992; x=1827042992;
  h=date:from:to:cc:subject:message-id;
  bh=JtOxIhhtAgBGHeis/x57Srl9mzk1rRCDS0EXMDSRBy4=;
  b=MHLyhTqPUIsRjAe2CNB4+ldrHYlzTfg4rh62KJEi9K3gzUK+3fLqAuSE
   MWT/Itf7xgLiFD9rVzURYbM0AStcpqlrbV8DaU/c/Fscl7ftlE+v8pCdX
   uoc1vpBdfrUX+xGo8q4U/y99dYSRaRATcbGN9cYcBiLZ+7VukdjwzZ22G
   N4Ae8Pttg18aywvqJLckRzOcX/m8IMoPLPyYxOruV0DS8LEHCaFZnEjsX
   at6Tk20Bp/kmBWZ1OvaC3bo+0I3Fhin2pkRulbp5CczlAZgQj96VMFquK
   7kczdM8PdR4vDSTcgPRBXHWjMSKUHaMtdLF+D9oeDXXKaJn3WHCSPDkEW
   A==;
X-CSE-ConnectionGUID: ng/I619yTxKgKlVvn7J6Vw==
X-CSE-MsgGUID: T7yLtdHOQRS2Ebh0JTWIOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4321339"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4321339"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:56:31 -0800
X-CSE-ConnectionGUID: J9rwBY8RRZSpDq8i+EXcPw==
X-CSE-MsgGUID: ebo8spGjS8mEBHCWUJ5q9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11937490"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Nov 2026 23:56:30 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVlO8-0000000059x-1yMj;
	Tue, 24 Nov 2026 07:56:28 +0000
Date: Tue, 24 Nov 2026 08:56:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/disk-io.o: warning: objtool:
 btrfs_repair_eb_io_failure.isra.0+0x234: unreachable instruction
Message-ID: <20261124084846.RlFcac1j-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
commit: 2574e9011018a1d6d3da8d03d0bfc4e2675dee2a btrfs: make btrfs_repair_io_failure() handle bs > ps cases without large folios
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r2304-20261122 (https://download.01.org/0day-ci/archive/20261124/20261124084846.RlFcac1j-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124084846.RlFcac1j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2574e9011018 ("btrfs: make btrfs_repair_io_failure() handle bs > ps cases without large folios")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261124084846.RlFcac1j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from fs/btrfs/disk-io.c:6:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:302:34: warning: missing braces around initializer [-Wmissing-braces]
     302 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:559:16: note: in expansion of macro '__swp_entry_to_pmd'
     559 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
>> fs/btrfs/disk-io.o: warning: objtool: btrfs_repair_eb_io_failure.isra.0+0x234: unreachable instruction
   fs/btrfs/disk-io.o: warning: objtool: btrfs_cleanup_one_transaction+0x12c: unreachable instruction
   fs/btrfs/disk-io.o: warning: objtool: warn_about_uncommitted_trans+0x1e8: unreachable instruction
   fs/btrfs/disk-io.o: warning: objtool: close_ctree+0x410: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

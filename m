Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B9435B144
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555092; cv=none; b=GM+fhHfzXVDQgP2Iyvcs0FUZvKURiS8M8Qhqlstn21gIcIS7fugmhcgtyjIF1vgF5VD66kxMTnv0gp+vUOGmmlSDZyXu0EX51IN60cv/78YjpHsIE+AiV2AlBEk8MPV2kxbDu0VUxyZDUn9uEBi5x0XL16IwKnUiU8ULsR/BRpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555092; c=relaxed/simple;
	bh=eIcKYzMTjb1CsDRnDNFlq5BdYvV9lPFcd++IhDubUlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+SNULJia22SazaTfQO1VjspjbiPBbDN6P0JhD14nEQ7YYmkayjcqMyofh0iE0pUMJXdzae7E0oEksXTeqanuaCjEfrp8gkpxrbLZnpowSKU1SMzPY53eOTxy8F1VYHdkFY2T1pA/khg6kctQlXU3PR0MKujWZFsECBtel17z5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBQLWD3O; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBQLWD3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763555088; x=1795091088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eIcKYzMTjb1CsDRnDNFlq5BdYvV9lPFcd++IhDubUlE=;
  b=kBQLWD3O2PXTZh+2yN7KJyw7Hh3Z9OPIR3JBUOGplpOlUuOxpum/ZiWP
   oZ1/7cOpOtjmG3YvJswddTH/Ri03u8PLjdCewNOqE0akQbz8QHSzxCJwl
   qbpyhhQ+OSuAOvG0xPc51jiGhNltL7GCK1jg/pQzOJ0Nq3PVCciUOjYbd
   nQ81WFll5ecm6ofi2zSeCJBeNyNWx7zsrx05C1hfIoiKiChwiJmTvR1rq
   qWXCPF0sO7HgKHIBZ+2MX8XizwUy0Ls6NnMzFzTw8ZE2+EKkPumzJQsSe
   6RCIuRYxkvbGMK6RVunaCrCt2bcUYzEkuAE5lINQqJSPCGkxKFmYxRZlX
   A==;
X-CSE-ConnectionGUID: v5X4+E4HTlCaXC4BsOc1jQ==
X-CSE-MsgGUID: rqn7Qka5Q2SYgFp6oACk9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65750165"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65750165"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 04:24:46 -0800
X-CSE-ConnectionGUID: 8Cx0G9kDT++P9T2eveTfqA==
X-CSE-MsgGUID: ziVavrZZQ06okHw2uZRYvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228383569"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2025 04:24:45 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLhEo-0002s7-0i;
	Wed, 19 Nov 2025 12:24:42 +0000
Date: Wed, 19 Nov 2025 20:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] btrfs: fix data race on transaction->state
Message-ID: <202511192043.C6JgVjMo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/btrfs/volumes.c:7840:9: sparse: sparse: Trying to use reserved word 'while' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <9db5125d171003458bcf98470f4044c5890fb789.1763481355.git.josef@toxicpanda.com>
References: <9db5125d171003458bcf98470f4044c5890fb789.1763481355.git.josef@toxicpanda.com>
TO: Josef Bacik <josef@toxicpanda.com>
TO: linux-btrfs@vger.kernel.org

Hi Josef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/btrfs-fix-data-race-on-transaction-state/20251119-000716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/9db5125d171003458bcf98470f4044c5890fb789.1763481355.git.josef%40toxicpanda.com
patch subject: [PATCH 1/2] btrfs: fix data race on transaction->state
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-r132-20251119 (https://download.01.org/0day-ci/archive/20251119/202511192043.C6JgVjMo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511192043.C6JgVjMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511192043.C6JgVjMo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/btrfs/volumes.c: note: in included file (through fs/btrfs/locking.h, fs/btrfs/ctree.h, fs/btrfs/disk-io.h):
   fs/btrfs/extent_io.h:131:9: sparse: sparse: Expected ) in function call
   fs/btrfs/extent_io.h:131:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c: note: in included file (through fs/btrfs/transaction.h):
   fs/btrfs/btrfs_inode.h:520:9: sparse: sparse: Expected ) in function call
   fs/btrfs/btrfs_inode.h:520:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/btrfs_inode.h:536:9: sparse: sparse: Expected ) in function call
   fs/btrfs/btrfs_inode.h:536:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c: note: in included file (through fs/btrfs/transaction.h):
   fs/btrfs/delayed-ref.h:442:9: sparse: sparse: Expected ) in function call
   fs/btrfs/delayed-ref.h:442:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c: note: in included file:
   fs/btrfs/volumes.h:642:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.h:642:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.h:700:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.h:700:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.h:874:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.h:874:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.h:881:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.h:881:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c: note: in included file:
   fs/btrfs/zoned.h:414:9: sparse: sparse: Expected ) in function call
   fs/btrfs/zoned.h:414:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:460:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:460:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:1357:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:1357:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:1557:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:1557:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:1810:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:1810:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:2091:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:2091:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:2111:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:2111:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:2315:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:2315:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:2380:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:2380:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:3573:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:3573:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:3781:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:3781:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:4570:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:4570:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:4661:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:4661:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:4817:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:4817:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:5132:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:5132:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:5343:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:5343:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:5358:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:5358:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:5973:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:5973:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:6270:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:6270:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:6281:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:6281:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:6309:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:6309:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:6328:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:6328:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:6331:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:6331:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:6499:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:6499:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:6571:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:6571:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:7112:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:7112:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:7231:25: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:7231:25: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:7285:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:7285:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:7313:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:7313:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:7321:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:7321:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:7324:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:7324:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:7328:17: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:7328:17: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:7450:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:7450:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:7840:9: sparse: sparse: Expected ) in function call
   fs/btrfs/volumes.c:7840:9: sparse: sparse: got __VA_OPT__
   fs/btrfs/volumes.c:7840:9: sparse: sparse: Expected ) in expression
   fs/btrfs/volumes.c:7840:9: sparse: sparse: got while
   fs/btrfs/volumes.c:7840:9: sparse: sparse: Expected ; at end of statement
   fs/btrfs/volumes.c:7840:9: sparse: sparse: got )
   fs/btrfs/volumes.c:7840:9: sparse: sparse: Expected ; at end of statement
   fs/btrfs/volumes.c:7840:9: sparse: sparse: got )
   fs/btrfs/volumes.c:7840:9: sparse: sparse: expected 'while' after 'do'
   fs/btrfs/volumes.c:7840:9: sparse: sparse: Expected ( after 'do-while'
   fs/btrfs/volumes.c:7840:9: sparse: sparse: got do
   fs/btrfs/volumes.c:7840:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7840:9: sparse: sparse: got 0
>> fs/btrfs/volumes.c:7840:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   fs/btrfs/volumes.c:7840:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7840:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7843:23: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7843:23: sparse: sparse: got (
>> fs/btrfs/volumes.c:7843:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7851:20: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7851:20: sparse: sparse: got &
   fs/btrfs/volumes.c:7852:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7852:9: sparse: sparse: got =
>> fs/btrfs/volumes.c:7852:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/btrfs/volumes.c:7852:9: sparse: sparse: undefined identifier 'trans'
   fs/btrfs/volumes.c:7852:9: sparse: sparse: undefined identifier 'curr'
   fs/btrfs/volumes.c:7852:9: sparse: sparse: expected structure or union
   fs/btrfs/volumes.c:7852:9: sparse: sparse: undefined identifier 'trans'
   fs/btrfs/volumes.c:7852:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7852:9: sparse: sparse: got *
>> fs/btrfs/volumes.c:7852:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   fs/btrfs/volumes.c:7852:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7852:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7852:9: sparse: sparse: undefined identifier 'curr'
   fs/btrfs/volumes.c:7852:9: sparse: sparse: undefined identifier 'curr'
   fs/btrfs/volumes.c:7852:9: sparse: sparse: expected structure or union
   fs/btrfs/volumes.c:7852:9: sparse: sparse: undefined identifier 'curr'
   fs/btrfs/volumes.c:7852:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7852:9: sparse: sparse: got *
>> fs/btrfs/volumes.c:7852:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   fs/btrfs/volumes.c:7852:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7852:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7852:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7852:9: sparse: sparse: got !
>> fs/btrfs/volumes.c:7852:9: sparse: sparse: cannot dereference this type
>> fs/btrfs/volumes.c:7852:9: sparse: sparse: cannot dereference this type
   fs/btrfs/volumes.c:7852:9: sparse: sparse: expected structure or union
>> fs/btrfs/volumes.c:7852:9: sparse: sparse: cannot dereference this type
   fs/btrfs/volumes.c:7852:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7852:9: sparse: sparse: got )
   fs/btrfs/volumes.c:7855:21: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7855:21: sparse: sparse: got ->
   fs/btrfs/volumes.c:7856:21: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7856:21: sparse: sparse: got ->
   fs/btrfs/volumes.c:7857:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7857:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7859:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7859:1: sparse: sparse: got }
>> fs/btrfs/volumes.c:7868:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:7868:16: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7868:16: sparse: sparse: got btrfs_raid_array
   fs/btrfs/volumes.c:7869:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7869:1: sparse: sparse: got }
   fs/btrfs/volumes.c:7884:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7884:13: sparse: sparse: got (
   fs/btrfs/volumes.c:7884:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7885:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7885:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7885:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7885:17: sparse: sparse: got }
>> fs/btrfs/volumes.c:7889:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7889:22: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7889:22: sparse: sparse: got out
   fs/btrfs/volumes.c:7890:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7890:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7893:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7893:13: sparse: sparse: got (
   fs/btrfs/volumes.c:7893:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7894:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7894:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7894:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7894:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7899:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7899:22: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7899:22: sparse: sparse: got out
   fs/btrfs/volumes.c:7900:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7900:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7908:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7908:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7908:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7908:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7912:16: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7912:16: sparse: sparse: got =
   fs/btrfs/volumes.c:7912:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/btrfs/volumes.c:7912:23: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7912:23: sparse: sparse: got <
   fs/btrfs/volumes.c:7912:44: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7912:44: sparse: sparse: got ++
   fs/btrfs/volumes.c:7916:32: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7916:32: sparse: sparse: got ->
   fs/btrfs/volumes.c:7916:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7917:33: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7917:33: sparse: sparse: got ,
   fs/btrfs/volumes.c:7917:33: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7917:33: sparse: sparse: got }
   fs/btrfs/volumes.c:7921:33: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7921:38: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7921:38: sparse: sparse: got out
   fs/btrfs/volumes.c:7922:25: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7922:25: sparse: sparse: got }
>> fs/btrfs/volumes.c:7924:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   fs/btrfs/volumes.c:7925:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7925:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7928:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7928:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7928:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7928:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7932:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7932:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7936:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7936:13: sparse: sparse: got (
   fs/btrfs/volumes.c:7936:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7937:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7937:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7937:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7937:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7939:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7939:22: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7939:22: sparse: sparse: got out
   fs/btrfs/volumes.c:7940:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7940:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7943:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7943:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7943:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7943:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7948:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7948:22: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7948:22: sparse: sparse: got out
   fs/btrfs/volumes.c:7949:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7949:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7954:21: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7954:21: sparse: sparse: got (
   fs/btrfs/volumes.c:7954:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7956:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7956:25: sparse: sparse: got ,
   fs/btrfs/volumes.c:7956:25: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7956:25: sparse: sparse: got }
   fs/btrfs/volumes.c:7960:25: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7960:30: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7960:30: sparse: sparse: got out
   fs/btrfs/volumes.c:7961:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7961:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7966:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:7966:16: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7966:16: sparse: sparse: got ret
   fs/btrfs/volumes.c:7967:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7967:1: sparse: sparse: got }
   fs/btrfs/volumes.c:7974:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7974:9: sparse: sparse: got &
   fs/btrfs/volumes.c:7975:19: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7975:19: sparse: sparse: got =
   fs/btrfs/volumes.c:7975:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/btrfs/volumes.c:7975:88: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7975:88: sparse: sparse: got )
   fs/btrfs/volumes.c:7978:23: sparse: sparse: cannot dereference this type
   fs/btrfs/volumes.c:7978:23: sparse: sparse: cannot dereference this type
   fs/btrfs/volumes.c:7979:21: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7979:21: sparse: sparse: got (
   fs/btrfs/volumes.c:7979:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7980:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7980:25: sparse: sparse: got ,
   fs/btrfs/volumes.c:7980:25: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7980:25: sparse: sparse: got }
   fs/btrfs/volumes.c:7984:25: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7984:30: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7984:30: sparse: sparse: got out
   fs/btrfs/volumes.c:7985:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7985:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7989:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:7989:16: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7989:16: sparse: sparse: got ret
   fs/btrfs/volumes.c:7990:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7990:1: sparse: sparse: got }
   fs/btrfs/volumes.c:8018:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8018:13: sparse: sparse: got (
   fs/btrfs/volumes.c:8018:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8021:12: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8021:12: sparse: sparse: got .
   fs/btrfs/volumes.c:8022:12: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8022:12: sparse: sparse: got .
   fs/btrfs/volumes.c:8023:12: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8023:12: sparse: sparse: got .
   fs/btrfs/volumes.c:8026:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8026:13: sparse: sparse: got !
   fs/btrfs/volumes.c:8026:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8029:13: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8029:13: sparse: sparse: got ->
   fs/btrfs/volumes.c:8031:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8031:17: sparse: sparse: got <
   fs/btrfs/volumes.c:8031:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8034:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8034:17: sparse: sparse: got ->
   fs/btrfs/volumes.c:8034:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8036:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8036:25: sparse: sparse: got <
   fs/btrfs/volumes.c:8036:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8039:21: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8039:21: sparse: sparse: got (
   fs/btrfs/volumes.c:8039:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8041:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8041:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8051:43: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8051:43: sparse: sparse: got ,
   fs/btrfs/volumes.c:8052:24: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8052:24: sparse: sparse: got .
   fs/btrfs/volumes.c:8052:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8062:21: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8062:21: sparse: sparse: got (
   fs/btrfs/volumes.c:8062:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8063:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8063:25: sparse: sparse: got ,
   fs/btrfs/volumes.c:8063:25: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8063:25: sparse: sparse: got }
   fs/btrfs/volumes.c:8066:25: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:8066:32: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8066:32: sparse: sparse: got -
   fs/btrfs/volumes.c:8067:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8067:17: sparse: sparse: got }
   fs/btrfs/volumes.c:8071:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8071:25: sparse: sparse: got <
   fs/btrfs/volumes.c:8071:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8077:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8077:25: sparse: sparse: got <
   fs/btrfs/volumes.c:8077:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8079:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8079:25: sparse: sparse: got >
   fs/btrfs/volumes.c:8079:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8081:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   fs/btrfs/volumes.c:8082:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8082:17: sparse: sparse: got }
   fs/btrfs/volumes.c:8087:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8087:1: sparse: sparse: got }
   fs/btrfs/volumes.c:8098:19: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8098:19: sparse: sparse: got &
   fs/btrfs/volumes.c:8100:9: sparse: sparse: Trying to use reserved word 'while' as identifier
>> fs/btrfs/volumes.c:8100:16: sparse: sparse: missing type declaration for parameter 'node'
   fs/btrfs/volumes.c:8101:22: sparse: sparse: cannot dereference this type
   fs/btrfs/volumes.c:8101:22: sparse: sparse: cannot dereference this type
>> fs/btrfs/volumes.c:8107:25: sparse: sparse: break/continue not in iterator scope
   fs/btrfs/volumes.c:8109:21: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8109:21: sparse: sparse: got &
   fs/btrfs/volumes.c:8110:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:8110:16: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8110:16: sparse: sparse: got node
   fs/btrfs/volumes.c:8111:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8111:1: sparse: sparse: got }
   fs/btrfs/volumes.c:8123:31: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8123:31: sparse: sparse: got ->
   fs/btrfs/volumes.c:8124:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8124:13: sparse: sparse: got !
   fs/btrfs/volumes.c:8124:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8125:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8125:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:8125:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8125:17: sparse: sparse: got }
   fs/btrfs/volumes.c:8128:37: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8128:37: sparse: sparse: got ->
   fs/btrfs/volumes.c:8129:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:8129:24: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8129:24: sparse: sparse: got -
   fs/btrfs/volumes.c:8130:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8130:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8136:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8136:13: sparse: sparse: got !
   fs/btrfs/volumes.c:8136:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8139:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8139:13: sparse: sparse: got !
   fs/btrfs/volumes.c:8139:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8143:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8143:17: sparse: sparse: got <
   fs/btrfs/volumes.c:8143:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> fs/btrfs/volumes.c:8146:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/btrfs/volumes.c:8146:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8146:9: sparse: sparse: got {
   fs/btrfs/volumes.c:8146:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8146:9: sparse: sparse: got ,
   fs/btrfs/volumes.c:8146:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8146:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8151:4: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8151:4: sparse: sparse: got :
   fs/btrfs/volumes.c:8154:22: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8154:22: sparse: sparse: got &
   fs/btrfs/volumes.c:8156:29: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8156:29: sparse: sparse: got ->
   fs/btrfs/volumes.c:8158:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:8158:16: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8158:16: sparse: sparse: got ret
   fs/btrfs/volumes.c:8159:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8159:1: sparse: sparse: got }
   fs/btrfs/volumes.c:8165:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8165:13: sparse: sparse: got !
   fs/btrfs/volumes.c:8165:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8169:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8169:13: sparse: sparse: got (
   fs/btrfs/volumes.c:8169:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8173:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8173:13: sparse: sparse: got !
   fs/btrfs/volumes.c:8173:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8176:29: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8176:29: sparse: sparse: got (
   fs/btrfs/volumes.c:8176:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8178:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:8178:24: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8178:24: sparse: sparse: got true
   fs/btrfs/volumes.c:8179:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8179:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8181:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8181:9: sparse: sparse: got !
   fs/btrfs/volumes.c:8181:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8181:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8181:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8184:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:8184:16: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8184:16: sparse: sparse: got true
   fs/btrfs/volumes.c:8185:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8185:1: sparse: sparse: got }
   fs/btrfs/volumes.c:8194:16: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8194:16: sparse: sparse: got =
   fs/btrfs/volumes.c:8194:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/btrfs/volumes.c:8194:23: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8194:23: sparse: sparse: got <
   fs/btrfs/volumes.c:8194:40: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8194:40: sparse: sparse: got ++
   fs/btrfs/volumes.c:8198:29: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8198:29: sparse: sparse: got >=
   fs/btrfs/volumes.c:8198:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8201:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8201:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got !
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got "001"
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got "001"
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got {
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8202:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8202:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8203:13: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8203:13: sparse: sparse: got ->
   fs/btrfs/volumes.c:8204:13: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8204:13: sparse: sparse: got ->
   fs/btrfs/volumes.c:8207:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8207:1: sparse: sparse: got }
   fs/btrfs/volumes.c:8231:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/btrfs/volumes.c:8231:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8231:9: sparse: sparse: got {
   fs/btrfs/volumes.c:8231:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8231:9: sparse: sparse: got !
   fs/btrfs/volumes.c:8231:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8231:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8231:9: sparse: sparse: got "001"
   fs/btrfs/volumes.c:8231:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8231:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8231:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8231:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8231:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8231:9: sparse: sparse: got "001"
--
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got {
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got !
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got "001"
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got "001"
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got {
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8239:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8239:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8242:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8242:13: sparse: sparse: got !
   fs/btrfs/volumes.c:8242:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8246:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8246:17: sparse: sparse: got ->
   fs/btrfs/volumes.c:8246:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8248:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:8248:22: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8248:22: sparse: sparse: got out
   fs/btrfs/volumes.c:8249:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8249:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got !
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got "001"
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got "001"
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got {
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8251:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8251:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8253:13: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8253:13: sparse: sparse: got ->
   fs/btrfs/volumes.c:8254:13: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8254:13: sparse: sparse: got ->
   fs/btrfs/volumes.c:8255:4: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8255:4: sparse: sparse: got :
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got {
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got !
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got "001"
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got "001"
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got {
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8257:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8257:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8258:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:8258:16: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8258:16: sparse: sparse: got 0
   fs/btrfs/volumes.c:8259:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8259:1: sparse: sparse: got }
   fs/btrfs/volumes.c:7840:9: sparse: sparse: undefined identifier '__compiletime_assert_864'
   fs/btrfs/volumes.c:7852:9: sparse: sparse: undefined identifier 'next'
>> fs/btrfs/volumes.c:7852:9: sparse: sparse: cannot dereference this type
   fs/btrfs/volumes.c:7852:9: sparse: sparse: cast from unknown type
>> fs/btrfs/volumes.c:7852:9: sparse: sparse: cannot dereference this type
   fs/btrfs/volumes.c:7852:9: sparse: sparse: expected structure or union
   fs/btrfs/volumes.c:7852:9: sparse: sparse: cast from unknown type
   fs/btrfs/volumes.c:7883:36: sparse: sparse: undefined identifier 'fs_info'
   fs/btrfs/volumes.c:7883:9: sparse: sparse: symbol 'map' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7883:9: sparse:    int [addressable] [toplevel] map
   fs/btrfs/volumes.c:7876:32: sparse: note: previously declared as:
   fs/btrfs/volumes.c:7876:32: sparse:    struct btrfs_chunk_map *[addressable] [toplevel] map
   fs/btrfs/volumes.c:7885:17: sparse: sparse: symbol 'rcu_read_unlock' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7885:17: sparse:    int static [signed] [toplevel] rcu_read_unlock( ... )
   fs/btrfs/volumes.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/sched/mm.h):
   include/linux/rcupdate.h:893:20: sparse: note: previously declared as:
   include/linux/rcupdate.h:893:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] rcu_read_unlock( ... )
   fs/btrfs/volumes.c:7888:17: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7880)
   fs/btrfs/volumes.c:7894:17: sparse: sparse: symbol 'rcu_read_unlock' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7894:17: sparse:    int static [signed] [toplevel] rcu_read_unlock( ... )
   include/linux/rcupdate.h:893:20: sparse: note: previously declared as:
   include/linux/rcupdate.h:893:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] rcu_read_unlock( ... )
   fs/btrfs/volumes.c:7898:17: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7888)
   fs/btrfs/volumes.c:7908:17: sparse: sparse: symbol 'rcu_read_unlock' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7908:17: sparse:    int static [signed] [toplevel] rcu_read_unlock( ... )
   include/linux/rcupdate.h:893:20: sparse: note: previously declared as:
   include/linux/rcupdate.h:893:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] rcu_read_unlock( ... )
   fs/btrfs/volumes.c:7917:33: sparse: sparse: symbol 'rcu_read_unlock' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7917:33: sparse:    int static [signed] [toplevel] rcu_read_unlock( ... )
   include/linux/rcupdate.h:893:20: sparse: note: previously declared as:
   include/linux/rcupdate.h:893:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] rcu_read_unlock( ... )
   fs/btrfs/volumes.c:7920:33: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7898)
   fs/btrfs/volumes.c:7928:17: sparse: sparse: symbol 'rcu_read_unlock' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7928:17: sparse:    int static [signed] [toplevel] rcu_read_unlock( ... )
   include/linux/rcupdate.h:893:20: sparse: note: previously declared as:
   include/linux/rcupdate.h:893:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] rcu_read_unlock( ... )
   fs/btrfs/volumes.c:7931:17: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7920)
   fs/btrfs/volumes.c:7937:17: sparse: sparse: symbol 'rcu_read_unlock' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7937:17: sparse:    int static [signed] [toplevel] rcu_read_unlock( ... )
   include/linux/rcupdate.h:893:20: sparse: note: previously declared as:
   include/linux/rcupdate.h:893:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] rcu_read_unlock( ... )
   fs/btrfs/volumes.c:7938:17: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7931)
   fs/btrfs/volumes.c:7943:17: sparse: sparse: symbol 'rcu_read_unlock' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7943:17: sparse:    int static [signed] [toplevel] rcu_read_unlock( ... )
   include/linux/rcupdate.h:893:20: sparse: note: previously declared as:
   include/linux/rcupdate.h:893:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] rcu_read_unlock( ... )
   fs/btrfs/volumes.c:7947:17: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7938)
   fs/btrfs/volumes.c:7956:25: sparse: sparse: symbol 'rcu_read_unlock' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7956:25: sparse:    int static [signed] [toplevel] rcu_read_unlock( ... )
   include/linux/rcupdate.h:893:20: sparse: note: previously declared as:
   include/linux/rcupdate.h:893:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] rcu_read_unlock( ... )
   fs/btrfs/volumes.c:7959:25: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7947)
   fs/btrfs/volumes.c:7972:13: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7959)
   fs/btrfs/volumes.c:7974:9: sparse: sparse: symbol '__raw_read_lock' redeclared with different type (different argument counts):
   fs/btrfs/volumes.c:7974:9: sparse:    int static [signed] [toplevel] __raw_read_lock( ... )
   fs/btrfs/volumes.c: note: in included file (through include/linux/spinlock_api_smp.h, include/linux/spinlock.h, include/linux/sched.h):
   include/linux/rwlock_api_smp.h:147:20: sparse: note: previously declared as:
   include/linux/rwlock_api_smp.h:147:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] __raw_read_lock( ... )
   fs/btrfs/volumes.c:7978:17: sparse: sparse: symbol 'map' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7883)
   fs/btrfs/volumes.c:7978:17: sparse: sparse: symbol 'map' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7978:17: sparse:    int [addressable] [toplevel] map
   fs/btrfs/volumes.c:7876:32: sparse: note: previously declared as:
   fs/btrfs/volumes.c:7876:32: sparse:    struct btrfs_chunk_map *[addressable] [toplevel] map
   fs/btrfs/volumes.c:7980:25: sparse: sparse: symbol 'rcu_read_unlock' redeclared with different type (different base types):
   fs/btrfs/volumes.c:7980:25: sparse:    int static [signed] [toplevel] rcu_read_unlock( ... )
   fs/btrfs/volumes.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/sched/mm.h):
   include/linux/rcupdate.h:893:20: sparse: note: previously declared as:
   include/linux/rcupdate.h:893:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] rcu_read_unlock( ... )
   fs/btrfs/volumes.c:7983:25: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7972)
   fs/btrfs/volumes.c:8002:35: sparse: sparse: undefined identifier 'fs_info'
   fs/btrfs/volumes.c:8006:13: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:7983)
   fs/btrfs/volumes.c:8021:9: sparse: sparse: symbol 'key' redeclared with different type (different base types):
   fs/btrfs/volumes.c:8021:9: sparse:    int [addressable] [toplevel] key
   fs/btrfs/volumes.c:8003:26: sparse: note: previously declared as:
   fs/btrfs/volumes.c:8003:26: sparse:    struct btrfs_key [addressable] [toplevel] key
   fs/btrfs/volumes.c:8022:9: sparse: sparse: symbol 'key' redeclared with different type (different base types):
   fs/btrfs/volumes.c:8022:9: sparse:    int [addressable] [toplevel] key
   fs/btrfs/volumes.c:8003:26: sparse: note: previously declared as:
   fs/btrfs/volumes.c:8003:26: sparse:    struct btrfs_key [addressable] [toplevel] key
   fs/btrfs/volumes.c:8023:9: sparse: sparse: symbol 'key' redeclared with different type (different base types):
   fs/btrfs/volumes.c:8023:9: sparse:    int [addressable] [toplevel] key
   fs/btrfs/volumes.c:8003:26: sparse: note: previously declared as:
   fs/btrfs/volumes.c:8003:26: sparse:    struct btrfs_key [addressable] [toplevel] key
   fs/btrfs/volumes.c:8030:9: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/btrfs/volumes.c:8006)
   fs/btrfs/volumes.c:8045:32: sparse: sparse: cannot dereference this type
   fs/btrfs/volumes.c:8051:17: sparse: sparse: symbol 'btrfs_item_key_to_cpu' redeclared with different type (incompatible argument 1 (different base types)):
   fs/btrfs/volumes.c:8051:17: sparse:    int static [signed] [toplevel] btrfs_item_key_to_cpu( ... )
   fs/btrfs/volumes.c: note: in included file (through fs/btrfs/ctree.h, fs/btrfs/disk-io.h):
   fs/btrfs/accessors.h:582:20: sparse: note: previously declared as:
   fs/btrfs/accessors.h:582:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] btrfs_item_key_to_cpu( ... )
   fs/btrfs/volumes.c:8054:28: sparse: sparse: expected structure or union
   fs/btrfs/volumes.c:8054:17: sparse: sparse: symbol 'devid' redeclared with different type (different type sizes):
   fs/btrfs/volumes.c:8054:17: sparse:    int [addressable] [toplevel] devid
   fs/btrfs/volumes.c:8049:21: sparse: note: previously declared as:
   fs/btrfs/volumes.c:8049:21: sparse:    unsigned long long [addressable] [toplevel] [usertype] devid
   fs/btrfs/volumes.c:8055:38: sparse: sparse: expected structure or union
   fs/btrfs/volumes.c:8055:17: sparse: sparse: symbol 'physical_offset' redeclared with different type (different type sizes):
   fs/btrfs/volumes.c:8055:17: sparse:    int [addressable] [toplevel] physical_offset
   fs/btrfs/volumes.c:8047:21: sparse: note: previously declared as:
   fs/btrfs/volumes.c:8047:21: sparse:    unsigned long long [addressable] [toplevel] [usertype] physical_offset
   fs/btrfs/volumes.c:8057:24: sparse: sparse: undefined identifier 'leaf'
   fs/btrfs/volumes.c:8057:24: sparse: sparse: undefined identifier 'leaf'
   fs/btrfs/volumes.c:8057:24: sparse: sparse: cast from unknown type
   fs/btrfs/volumes.c:8057:17: sparse: sparse: symbol 'dext' redeclared with different type (different base types):
   fs/btrfs/volumes.c:8057:17: sparse:    int [addressable] [toplevel] dext

vim +/while +7840 fs/btrfs/volumes.c

a8a6dab77997a3 Stefan Behrens  2012-11-05  7828  
935e5cc935bcbf Miao Xie        2014-09-03  7829  /*
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7830   * Update the size and bytes used for each device where it changed.  This is
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7831   * delayed since we would otherwise get errors while writing out the
935e5cc935bcbf Miao Xie        2014-09-03  7832   * superblocks.
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7833   *
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7834   * Must be invoked during transaction commit.
935e5cc935bcbf Miao Xie        2014-09-03  7835   */
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7836  void btrfs_commit_device_sizes(struct btrfs_transaction *trans)
935e5cc935bcbf Miao Xie        2014-09-03  7837  {
935e5cc935bcbf Miao Xie        2014-09-03  7838  	struct btrfs_device *curr, *next;
935e5cc935bcbf Miao Xie        2014-09-03  7839  
e5c0f5fe7bf1ae Josef Bacik     2025-11-18 @7840  	ASSERT(READ_ONCE(trans->state) == TRANS_STATE_COMMIT_DOING, "state=%d",
e5c0f5fe7bf1ae Josef Bacik     2025-11-18  7841  	       READ_ONCE(trans->state));
ce7213c70c37e3 Miao Xie        2014-09-03  7842  
bbbf7243d62d8b Nikolay Borisov 2019-03-25 @7843  	if (list_empty(&trans->dev_update_list))
ce7213c70c37e3 Miao Xie        2014-09-03  7844  		return;
ce7213c70c37e3 Miao Xie        2014-09-03  7845  
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7846  	/*
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7847  	 * We don't need the device_list_mutex here.  This list is owned by the
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7848  	 * transaction and the transaction must complete before the device is
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7849  	 * released.
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7850  	 */
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7851  	mutex_lock(&trans->fs_info->chunk_mutex);
bbbf7243d62d8b Nikolay Borisov 2019-03-25 @7852  	list_for_each_entry_safe(curr, next, &trans->dev_update_list,
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7853  				 post_commit_list) {
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7854  		list_del_init(&curr->post_commit_list);
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7855  		curr->commit_total_bytes = curr->disk_total_bytes;
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7856  		curr->commit_bytes_used = curr->bytes_used;
ce7213c70c37e3 Miao Xie        2014-09-03  7857  	}
bbbf7243d62d8b Nikolay Borisov 2019-03-25  7858  	mutex_unlock(&trans->fs_info->chunk_mutex);
ce7213c70c37e3 Miao Xie        2014-09-03  7859  }
5a13f4308c5b4a Anand Jain      2015-03-10  7860  
46df06b85e28ea David Sterba    2018-07-13  7861  /*
46df06b85e28ea David Sterba    2018-07-13  7862   * Multiplicity factor for simple profiles: DUP, RAID1-like and RAID10.
46df06b85e28ea David Sterba    2018-07-13  7863   */
46df06b85e28ea David Sterba    2018-07-13  7864  int btrfs_bg_type_to_factor(u64 flags)
46df06b85e28ea David Sterba    2018-07-13  7865  {
44b28adafd1f81 David Sterba    2019-05-17  7866  	const int index = btrfs_bg_flags_to_raid_index(flags);
44b28adafd1f81 David Sterba    2019-05-17  7867  
44b28adafd1f81 David Sterba    2019-05-17 @7868  	return btrfs_raid_array[index].ncopies;
46df06b85e28ea David Sterba    2018-07-13  7869  }
cf90d884b347c5 Qu Wenruo       2018-08-01  7870  
cf90d884b347c5 Qu Wenruo       2018-08-01  7871  static int verify_one_dev_extent(struct btrfs_fs_info *fs_info,
cf90d884b347c5 Qu Wenruo       2018-08-01  7872  				 u64 chunk_offset, u64 devid,
cf90d884b347c5 Qu Wenruo       2018-08-01  7873  				 u64 physical_offset, u64 physical_len)
cf90d884b347c5 Qu Wenruo       2018-08-01  7874  {
562d7b1512f736 Josef Bacik     2021-10-05  7875  	struct btrfs_dev_lookup_args args = { .devid = devid };
7dc66abb5a4777 Filipe Manana   2023-11-21  7876  	struct btrfs_chunk_map *map;
05a37c48604c19 Qu Wenruo       2018-10-05  7877  	struct btrfs_device *dev;
cf90d884b347c5 Qu Wenruo       2018-08-01  7878  	u64 stripe_len;
cf90d884b347c5 Qu Wenruo       2018-08-01  7879  	bool found = false;
cf90d884b347c5 Qu Wenruo       2018-08-01  7880  	int ret = 0;
cf90d884b347c5 Qu Wenruo       2018-08-01  7881  	int i;
cf90d884b347c5 Qu Wenruo       2018-08-01  7882  
7dc66abb5a4777 Filipe Manana   2023-11-21  7883  	map = btrfs_find_chunk_map(fs_info, chunk_offset, 1);
9264d004a6c978 David Sterba    2025-09-17  7884  	if (unlikely(!map)) {
cf90d884b347c5 Qu Wenruo       2018-08-01  7885  		btrfs_err(fs_info,
cf90d884b347c5 Qu Wenruo       2018-08-01  7886  "dev extent physical offset %llu on devid %llu doesn't have corresponding chunk",
cf90d884b347c5 Qu Wenruo       2018-08-01  7887  			  physical_offset, devid);
cf90d884b347c5 Qu Wenruo       2018-08-01  7888  		ret = -EUCLEAN;
cf90d884b347c5 Qu Wenruo       2018-08-01 @7889  		goto out;
cf90d884b347c5 Qu Wenruo       2018-08-01  7890  	}
cf90d884b347c5 Qu Wenruo       2018-08-01  7891  
7dc66abb5a4777 Filipe Manana   2023-11-21  7892  	stripe_len = btrfs_calc_stripe_length(map);
9264d004a6c978 David Sterba    2025-09-17  7893  	if (unlikely(physical_len != stripe_len)) {
cf90d884b347c5 Qu Wenruo       2018-08-01  7894  		btrfs_err(fs_info,
cf90d884b347c5 Qu Wenruo       2018-08-01  7895  "dev extent physical offset %llu on devid %llu length doesn't match chunk %llu, have %llu expect %llu",
7dc66abb5a4777 Filipe Manana   2023-11-21  7896  			  physical_offset, devid, map->start, physical_len,
cf90d884b347c5 Qu Wenruo       2018-08-01  7897  			  stripe_len);
cf90d884b347c5 Qu Wenruo       2018-08-01  7898  		ret = -EUCLEAN;
cf90d884b347c5 Qu Wenruo       2018-08-01  7899  		goto out;
cf90d884b347c5 Qu Wenruo       2018-08-01  7900  	}
cf90d884b347c5 Qu Wenruo       2018-08-01  7901  
3613249a1b30ef Qu Wenruo       2022-06-13  7902  	/*
06c3437f744973 Dan Johnson     2025-04-14  7903  	 * Very old mkfs.btrfs (before v4.15) will not respect the reserved
3613249a1b30ef Qu Wenruo       2022-06-13  7904  	 * space. Although kernel can handle it without problem, better to warn
3613249a1b30ef Qu Wenruo       2022-06-13  7905  	 * the users.
3613249a1b30ef Qu Wenruo       2022-06-13  7906  	 */
3613249a1b30ef Qu Wenruo       2022-06-13  7907  	if (physical_offset < BTRFS_DEVICE_RANGE_RESERVED)
3613249a1b30ef Qu Wenruo       2022-06-13  7908  		btrfs_warn(fs_info,
3613249a1b30ef Qu Wenruo       2022-06-13  7909  		"devid %llu physical %llu len %llu inside the reserved space",
3613249a1b30ef Qu Wenruo       2022-06-13  7910  			   devid, physical_offset, physical_len);
3613249a1b30ef Qu Wenruo       2022-06-13  7911  
cf90d884b347c5 Qu Wenruo       2018-08-01  7912  	for (i = 0; i < map->num_stripes; i++) {
9264d004a6c978 David Sterba    2025-09-17  7913  		if (unlikely(map->stripes[i].dev->devid == devid &&
9264d004a6c978 David Sterba    2025-09-17  7914  			     map->stripes[i].physical == physical_offset)) {
cf90d884b347c5 Qu Wenruo       2018-08-01  7915  			found = true;
cf90d884b347c5 Qu Wenruo       2018-08-01  7916  			if (map->verified_stripes >= map->num_stripes) {
cf90d884b347c5 Qu Wenruo       2018-08-01  7917  				btrfs_err(fs_info,
cf90d884b347c5 Qu Wenruo       2018-08-01  7918  				"too many dev extents for chunk %llu found",
7dc66abb5a4777 Filipe Manana   2023-11-21  7919  					  map->start);
cf90d884b347c5 Qu Wenruo       2018-08-01  7920  				ret = -EUCLEAN;
cf90d884b347c5 Qu Wenruo       2018-08-01  7921  				goto out;
cf90d884b347c5 Qu Wenruo       2018-08-01  7922  			}
cf90d884b347c5 Qu Wenruo       2018-08-01  7923  			map->verified_stripes++;
cf90d884b347c5 Qu Wenruo       2018-08-01 @7924  			break;
cf90d884b347c5 Qu Wenruo       2018-08-01  7925  		}
cf90d884b347c5 Qu Wenruo       2018-08-01  7926  	}
9264d004a6c978 David Sterba    2025-09-17  7927  	if (unlikely(!found)) {
cf90d884b347c5 Qu Wenruo       2018-08-01  7928  		btrfs_err(fs_info,
cf90d884b347c5 Qu Wenruo       2018-08-01  7929  	"dev extent physical offset %llu devid %llu has no corresponding chunk",
cf90d884b347c5 Qu Wenruo       2018-08-01  7930  			physical_offset, devid);
cf90d884b347c5 Qu Wenruo       2018-08-01  7931  		ret = -EUCLEAN;
cf90d884b347c5 Qu Wenruo       2018-08-01  7932  	}
05a37c48604c19 Qu Wenruo       2018-10-05  7933  
1a9fd4172d5c8b David Sterba    2021-05-21  7934  	/* Make sure no dev extent is beyond device boundary */
562d7b1512f736 Josef Bacik     2021-10-05  7935  	dev = btrfs_find_device(fs_info->fs_devices, &args);
9264d004a6c978 David Sterba    2025-09-17  7936  	if (unlikely(!dev)) {
05a37c48604c19 Qu Wenruo       2018-10-05  7937  		btrfs_err(fs_info, "failed to find devid %llu", devid);
05a37c48604c19 Qu Wenruo       2018-10-05  7938  		ret = -EUCLEAN;
05a37c48604c19 Qu Wenruo       2018-10-05  7939  		goto out;
05a37c48604c19 Qu Wenruo       2018-10-05  7940  	}
1b3922a8bc7423 Qu Wenruo       2019-01-08  7941  
9264d004a6c978 David Sterba    2025-09-17  7942  	if (unlikely(physical_offset + physical_len > dev->disk_total_bytes)) {
05a37c48604c19 Qu Wenruo       2018-10-05  7943  		btrfs_err(fs_info,
05a37c48604c19 Qu Wenruo       2018-10-05  7944  "dev extent devid %llu physical offset %llu len %llu is beyond device boundary %llu",
05a37c48604c19 Qu Wenruo       2018-10-05  7945  			  devid, physical_offset, physical_len,
05a37c48604c19 Qu Wenruo       2018-10-05  7946  			  dev->disk_total_bytes);
05a37c48604c19 Qu Wenruo       2018-10-05  7947  		ret = -EUCLEAN;
05a37c48604c19 Qu Wenruo       2018-10-05  7948  		goto out;
05a37c48604c19 Qu Wenruo       2018-10-05  7949  	}
381a696eb5f991 Naohiro Aota    2021-02-04  7950  
381a696eb5f991 Naohiro Aota    2021-02-04  7951  	if (dev->zone_info) {
381a696eb5f991 Naohiro Aota    2021-02-04  7952  		u64 zone_size = dev->zone_info->zone_size;
381a696eb5f991 Naohiro Aota    2021-02-04  7953  
9264d004a6c978 David Sterba    2025-09-17  7954  		if (unlikely(!IS_ALIGNED(physical_offset, zone_size) ||
9264d004a6c978 David Sterba    2025-09-17  7955  			     !IS_ALIGNED(physical_len, zone_size))) {
381a696eb5f991 Naohiro Aota    2021-02-04  7956  			btrfs_err(fs_info,
381a696eb5f991 Naohiro Aota    2021-02-04  7957  "zoned: dev extent devid %llu physical offset %llu len %llu is not aligned to device zone",
381a696eb5f991 Naohiro Aota    2021-02-04  7958  				  devid, physical_offset, physical_len);
381a696eb5f991 Naohiro Aota    2021-02-04  7959  			ret = -EUCLEAN;
381a696eb5f991 Naohiro Aota    2021-02-04  7960  			goto out;
381a696eb5f991 Naohiro Aota    2021-02-04  7961  		}
381a696eb5f991 Naohiro Aota    2021-02-04  7962  	}
381a696eb5f991 Naohiro Aota    2021-02-04  7963  
cf90d884b347c5 Qu Wenruo       2018-08-01  7964  out:
7dc66abb5a4777 Filipe Manana   2023-11-21  7965  	btrfs_free_chunk_map(map);
cf90d884b347c5 Qu Wenruo       2018-08-01  7966  	return ret;
cf90d884b347c5 Qu Wenruo       2018-08-01  7967  }
cf90d884b347c5 Qu Wenruo       2018-08-01  7968  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

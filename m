Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9AF37C937
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933321; cv=none; b=QJeB/6WjSA1eN55vUkAj+RoinyOkbMlg9E9SFW4vMtRPXSZQS/HqEaDIFsUpKKtNne/7jsJecZbLSebpsqAM+g3C4g49Sn5zcMeozMd3r9XqtNaqQV/AYyn10dG/0NuIzFznk5tD17olHzZz85gO6xSFGzOzSCqi12YQn6kQqK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933321; c=relaxed/simple;
	bh=X+GiJiDGsq6xPikIc3ClgUxU3UCuDp8OVmz41ihwlnU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yd7a33na8ERkwCWuqckknhzV8ZmdsTNgu1cNzs88TicDVnE54gO1hnI46e430ECUrUHzOTGNizHZyBP/89vGB/7IXuRhR0Wjri5xj8lKywOEKHKzWi0CUOoYArkXUuZVRFqbA/Q8Gwhe3P9tikqMM/9W1df0qQegBkYd6mHQbKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=At2magJJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="At2magJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778933318; x=1810469318;
  h=date:from:to:cc:subject:message-id;
  bh=X+GiJiDGsq6xPikIc3ClgUxU3UCuDp8OVmz41ihwlnU=;
  b=At2magJJ4Sjf8YrunU/SBBNYmcBIYsJJVsDzyw0PH55chsCMqG8lkYVR
   fOsiMLtmXfXhP+v+X7lGm0JFGADHc+3lB5saUPkMG2wk6q/1O4KEBd4nh
   6I+k/du6c7M5HbG9MV3uIAWkkXzYBuHuIM0Gquu0FIboQ4jR4VJD9amSb
   DSWhgzElkq+7zyXrxBnDiXxqFX6Hnv5qBTHrrivpxwT5LOt7vSDXVc0XI
   vua6tr0Hh8jH6TG6c6yJEqswFSRncZ46wSspRnu3I2i/CoNr0AhXSEnZB
   0Q+xo2OyMPigssJtzVnQJVUHcgsp6G/hJobsDWJsgF/yYtD4GUL/Js817
   Q==;
X-CSE-ConnectionGUID: oso+67swSXSxMneXqnVXiA==
X-CSE-MsgGUID: Kx01RSpIShqZniqo153uJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90177038"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90177038"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 05:08:37 -0700
X-CSE-ConnectionGUID: oUfUDrRXRLqb5qMcyVvZcQ==
X-CSE-MsgGUID: +1uDJfBHSPCyD9r8vNZsqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="239064557"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 May 2026 05:08:37 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wODon-000000000nm-40DN;
	Sat, 16 May 2026 12:08:33 +0000
Date: Sat, 16 May 2026 20:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kdave-btrfs-devel:misc-next 74/75] fs/btrfs/xattr.c:255:17:
 sparse: sparse: Variable length array is used.
Message-ID: <202605162050.wvvnfVKD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/btrfs/xattr.c:255:17: sparse: sparse: Variable length array is used."
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   2fddc74b2896a618847bd499927a6e8ebf3114ce
commit: d46116cda48ebb6666ebe47e0d61bb271a944bbe [74/75] btrfs: validate negative error number passed to btrfs_abort_transaction()
:::::: branch date: 11 hours ago
:::::: commit date: 19 hours ago
config: um-randconfig-r112-20260516 (https://download.01.org/0day-ci/archive/20260516/202605162050.wvvnfVKD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605162050.wvvnfVKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605162050.wvvnfVKD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/btrfs/xattr.c:255:17: sparse: sparse: Variable length array is used.
   fs/btrfs/xattr.c:443:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/uuid-tree.c:545:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/root-tree.c:153:17: sparse: sparse: Variable length array is used.
   fs/btrfs/root-tree.c:172:25: sparse: sparse: Variable length array is used.
   fs/btrfs/root-tree.c:178:25: sparse: sparse: Variable length array is used.
   fs/btrfs/root-tree.c:185:25: sparse: sparse: Variable length array is used.
   fs/btrfs/root-tree.c:420:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/reflink.c:48:17: sparse: sparse: Variable length array is used.
   fs/btrfs/reflink.c:271:17: sparse: sparse: Variable length array is used.
   fs/btrfs/reflink.c:276:17: sparse: sparse: Variable length array is used.
   fs/btrfs/reflink.c:288:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/verity.c:482:17: sparse: sparse: Variable length array is used.
   fs/btrfs/verity.c:487:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/raid-stripe-tree.c:365:25: sparse: sparse: Variable length array is used.
   fs/btrfs/raid-stripe-tree.c:367:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/file-item.c:1055:33: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/inode-item.c:630:33: sparse: sparse: Variable length array is used.
   fs/btrfs/inode-item.c:669:33: sparse: sparse: Variable length array is used.
   fs/btrfs/inode-item.c:687:41: sparse: sparse: Variable length array is used.
   fs/btrfs/inode-item.c:723:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/transaction.c:1610:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1750:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1763:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1771:25: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1784:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1790:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1826:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1842:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1854:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1863:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1869:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1892:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1902:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1909:17: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:1933:25: sparse: sparse: Variable length array is used.
   fs/btrfs/transaction.c:2069:9: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/free-space-tree.c:1438:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1445:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:230:25: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:265:33: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:272:25: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:281:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:299:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:321:25: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:374:25: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:415:33: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:422:25: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:431:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:456:25: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:472:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:851:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:859:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:867:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1032:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1040:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1048:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1187:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1194:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1205:25: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1298:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1305:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1323:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1352:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1370:25: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1490:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1504:25: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1532:33: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-tree.c:1539:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/delayed-inode.c:1027:25: sparse: sparse: Variable length array is used.
   fs/btrfs/delayed-inode.c:1055:25: sparse: sparse: Variable length array is used.
   fs/btrfs/delayed-inode.c:1080:17: sparse: sparse: Variable length array is used.
   fs/btrfs/delayed-inode.c:1161:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/free-space-cache.c:362:17: sparse: sparse: Variable length array is used.
   fs/btrfs/free-space-cache.c:4194:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/file.c:314:41: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:413:41: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:430:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:454:25: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:575:17: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:582:17: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:588:17: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:662:25: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:690:25: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:699:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:730:25: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:748:25: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:769:25: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:777:17: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2134:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2462:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2479:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2498:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2512:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2608:25: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2616:25: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2626:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/extent-tree.c:3315:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3367:33: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3416:33: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3428:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3439:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3490:33: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3552:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:172:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:183:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:896:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:1572:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:1576:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:1608:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:1614:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:1772:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:2247:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3150:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3162:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3171:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3177:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3184:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3192:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:3199:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:4394:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:5678:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:5683:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:5688:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:6091:33: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:6127:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:6384:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:6390:25: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:6417:33: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:6453:17: sparse: sparse: Variable length array is used.
   fs/btrfs/extent-tree.c:6461:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/block-group.c:1157:17: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:1193:17: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:1230:17: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:1320:25: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:1327:17: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:2939:25: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:2946:33: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:2951:25: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:3441:17: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:3683:33: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:3830:41: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:3832:33: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:4196:25: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:4203:25: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:4209:25: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:4215:25: sparse: sparse: Variable length array is used.
   fs/btrfs/block-group.c:4219:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/qgroup.c:1079:17: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1086:17: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1097:17: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1133:17: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1152:33: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1159:33: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1167:33: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1173:33: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1190:25: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1201:17: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1215:17: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1417:17: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1423:17: sparse: sparse: Variable length array is used.
   fs/btrfs/qgroup.c:1438:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/ctree.c:3034:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2738:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2743:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2812:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2828:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:194:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/btrfs/ctree.c:194:22: sparse:    struct extent_buffer [noderef] __rcu *
   fs/btrfs/ctree.c:194:22: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:292:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:298:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:391:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:410:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:527:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:534:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:547:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:551:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/btrfs/ctree.c:551:17: sparse:    struct extent_buffer [noderef] __rcu *
   fs/btrfs/ctree.c:551:17: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:887:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:890:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/btrfs/ctree.c:890:9: sparse:    struct extent_buffer [noderef] __rcu *
   fs/btrfs/ctree.c:890:9: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:1028:33: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:1037:33: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:1060:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:1089:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:1099:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:1206:33: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:1266:33: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2898:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2903:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/btrfs/ctree.c:2903:9: sparse:    struct extent_buffer [noderef] __rcu *
   fs/btrfs/ctree.c:2903:9: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:2943:33: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2956:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:3292:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:3403:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:3512:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:4389:33: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:4402:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:4457:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/relocation.c:686:9: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:963:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:977:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:1188:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:1201:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:1215:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:1229:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:1654:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:1725:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:1780:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:2321:33: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:3707:17: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:4328:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:4723:17: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:4733:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:4752:17: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:5038:25: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:5045:17: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:5051:17: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:5057:17: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:5214:17: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:5236:17: sparse: sparse: Variable length array is used.
   fs/btrfs/relocation.c:5242:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/ioctl.c:381:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ioctl.c:387:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ioctl.c:636:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ioctl.c:647:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ioctl.c:657:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ioctl.c:664:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ioctl.c:672:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ioctl.c:3853:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ioctl.c:3862:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/disk-io.c:4147:25: sparse: sparse: Variable length array is used.
   fs/btrfs/disk-io.c:4181:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/tree-log.c:191:9: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:445:33: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:456:25: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:463:33: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:2972:25: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:3030:33: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:3049:49: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:3068:33: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:3572:17: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:3583:17: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:3668:33: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:7710:17: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:7725:25: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:7743:25: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:7752:33: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:7769:33: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:7778:25: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:7784:25: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:7795:33: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:7808:33: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/volumes.c:2363:17: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:2900:25: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:2957:25: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:2964:17: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:2971:25: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:3170:17: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:3380:25: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:3470:25: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:3477:25: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:3483:25: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:3489:25: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:3493:17: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:3502:25: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:5363:17: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:6169:17: sparse: sparse: Variable length array is used.
   fs/btrfs/volumes.c:6178:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/inode.c:643:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:651:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:661:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:3090:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:3099:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:3107:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:3123:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:3130:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:3142:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:3148:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:3166:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:3514:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4284:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4293:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4448:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4466:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4479:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4486:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4495:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4657:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4663:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4677:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4685:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:4694:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:5093:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:5100:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6578:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6655:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6663:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6675:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6682:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6746:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6757:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6768:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6774:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6904:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:6915:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8218:33: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8266:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8274:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8279:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8288:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8296:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8301:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8309:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8316:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8557:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8565:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8570:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8581:33: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8590:33: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8598:33: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8607:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8621:25: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8898:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:8909:17: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:9137:33: sparse: sparse: Variable length array is used.
   fs/btrfs/inode.c:9150:25: sparse: sparse: Variable length array is used.

vim +255 fs/btrfs/xattr.c

f34f57a3ab4e73 Yan, Zheng    2009-11-12  210  
4815053aba7f23 David Sterba  2011-09-11  211  /*
4815053aba7f23 David Sterba  2011-09-11  212   * @value: "" makes the attribute to empty, NULL removes it
4815053aba7f23 David Sterba  2011-09-11  213   */
e3de9b159a927f Anand Jain    2019-04-12  214  int btrfs_setxattr_trans(struct inode *inode, const char *name,
f34f57a3ab4e73 Yan, Zheng    2009-11-12  215  			 const void *value, size_t size, int flags)
f34f57a3ab4e73 Yan, Zheng    2009-11-12  216  {
f34f57a3ab4e73 Yan, Zheng    2009-11-12  217  	struct btrfs_root *root = BTRFS_I(inode)->root;
e3de9b159a927f Anand Jain    2019-04-12  218  	struct btrfs_trans_handle *trans;
fd57a98d6f0c98 Filipe Manana 2021-02-26  219  	const bool start_trans = (current->journal_info == NULL);
f34f57a3ab4e73 Yan, Zheng    2009-11-12  220  	int ret;
f34f57a3ab4e73 Yan, Zheng    2009-11-12  221  
fd57a98d6f0c98 Filipe Manana 2021-02-26  222  	if (start_trans) {
fd57a98d6f0c98 Filipe Manana 2021-02-26  223  		/*
fd57a98d6f0c98 Filipe Manana 2021-02-26  224  		 * 1 unit for inserting/updating/deleting the xattr
fd57a98d6f0c98 Filipe Manana 2021-02-26  225  		 * 1 unit for the inode item update
fd57a98d6f0c98 Filipe Manana 2021-02-26  226  		 */
a22285a6a32390 Yan, Zheng    2010-05-16  227  		trans = btrfs_start_transaction(root, 2);
a22285a6a32390 Yan, Zheng    2010-05-16  228  		if (IS_ERR(trans))
a22285a6a32390 Yan, Zheng    2010-05-16  229  			return PTR_ERR(trans);
fd57a98d6f0c98 Filipe Manana 2021-02-26  230  	} else {
fd57a98d6f0c98 Filipe Manana 2021-02-26  231  		/*
fd57a98d6f0c98 Filipe Manana 2021-02-26  232  		 * This can happen when smack is enabled and a directory is being
fd57a98d6f0c98 Filipe Manana 2021-02-26  233  		 * created. It happens through d_instantiate_new(), which calls
fd57a98d6f0c98 Filipe Manana 2021-02-26  234  		 * smack_d_instantiate(), which in turn calls __vfs_setxattr() to
fd57a98d6f0c98 Filipe Manana 2021-02-26  235  		 * set the transmute xattr (XATTR_NAME_SMACKTRANSMUTE) on the
fd57a98d6f0c98 Filipe Manana 2021-02-26  236  		 * inode. We have already reserved space for the xattr and inode
fd57a98d6f0c98 Filipe Manana 2021-02-26  237  		 * update at btrfs_mkdir(), so just use the transaction handle.
fd57a98d6f0c98 Filipe Manana 2021-02-26  238  		 * We don't join or start a transaction, as that will reset the
fd57a98d6f0c98 Filipe Manana 2021-02-26  239  		 * block_rsv of the handle and trigger a warning for the start
fd57a98d6f0c98 Filipe Manana 2021-02-26  240  		 * case.
fd57a98d6f0c98 Filipe Manana 2021-02-26  241  		 */
fd57a98d6f0c98 Filipe Manana 2021-02-26  242  		ASSERT(strncmp(name, XATTR_SECURITY_PREFIX,
fd57a98d6f0c98 Filipe Manana 2021-02-26  243  			       XATTR_SECURITY_PREFIX_LEN) == 0);
fd57a98d6f0c98 Filipe Manana 2021-02-26  244  		trans = current->journal_info;
fd57a98d6f0c98 Filipe Manana 2021-02-26  245  	}
f34f57a3ab4e73 Yan, Zheng    2009-11-12  246  
2d74fa3efcffe4 Anand Jain    2019-04-12  247  	ret = btrfs_setxattr(trans, inode, name, value, size, flags);
5103e947b9b7ac Josef Bacik   2007-11-16  248  	if (ret)
5103e947b9b7ac Josef Bacik   2007-11-16  249  		goto out;
5103e947b9b7ac Josef Bacik   2007-11-16  250  
0c4d2d95d06e92 Josef Bacik   2012-04-05  251  	inode_inc_iversion(inode);
2a9462de4352d1 Jeff Layton   2023-07-05  252  	inode_set_ctime_current(inode);
8b9d032225be93 Filipe Manana 2023-09-22  253  	ret = btrfs_update_inode(trans, BTRFS_I(inode));
193b4e83986d7e Filipe Manana 2022-04-21  254  	if (ret)
193b4e83986d7e Filipe Manana 2022-04-21 @255  		btrfs_abort_transaction(trans, ret);
f34f57a3ab4e73 Yan, Zheng    2009-11-12  256  out:
fd57a98d6f0c98 Filipe Manana 2021-02-26  257  	if (start_trans)
3a45bb207ee2c5 Jeff Mahoney  2016-09-09  258  		btrfs_end_transaction(trans);
5103e947b9b7ac Josef Bacik   2007-11-16  259  	return ret;
5103e947b9b7ac Josef Bacik   2007-11-16  260  }
5103e947b9b7ac Josef Bacik   2007-11-16  261  

:::::: The code at line 255 was first introduced by commit
:::::: 193b4e83986d7ee6caa8ceefb5ee9f58240fbee0 btrfs: do not BUG_ON() on failure to update inode when setting xattr

:::::: TO: Filipe Manana <fdmanana@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

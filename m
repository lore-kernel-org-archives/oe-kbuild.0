Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E0F2C375A
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120957; cv=none; b=XoK3wycBKLWj3RyjJbLrrUqsyUtZEE0DrqRj/HqM5lhPgelSG2vEs2R/OTbqFJfj8n5z1onHSJEqdBMMoMod9D1MSAOsC1QKrSm95E1iDwYRpfrrFaowAG/mPXobSeUN1Gzu2GyT9ALR9LsHtk3TllmGck6vPk9/vjT6X6uswTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120957; c=relaxed/simple;
	bh=3Ru41bjYgLNE/Y6cEa7NIty3TZ4hN1FA+05/yNLFmKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NTTY+o1tkKWu6URgFf2zJSumjEYqj+maAgPXfBL4wH/5syzbHpCtNUqv4B5MlYsEthCh5K7cA08EqRXJnANHgt1IzOPpu1+OWt+8vN7JAP0niJSIT02hIJdUVEqq+WfbEz/anXvck5ZxIebTHdbSE/Vj0BKzNI1EwcZ1UjfIPSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4Zhriun; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4Zhriun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782120954; x=1813656954;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3Ru41bjYgLNE/Y6cEa7NIty3TZ4hN1FA+05/yNLFmKE=;
  b=I4ZhriunmNKjl7szbG9UqhhY9BWyIYXx/62yBM5e3dQT1TgO8+CTmxNs
   dPAG0eBmjqt1GCEqaE6TLhMmw9CwJAhnEq3YUU3VY/c69xlqEH7No2/uG
   JSK2aWdW6L+zenlqzzH1kiGoVhI3HCAAuvgq+AYlSUWCBgLKjDKjjDGP7
   oiYv2hI0+ZgEkTLBPPn5ggAhTuMGTENcqiiL1DpVDPZJROomat4X14/Hc
   I7kbSUMYaGkpJ6A4qB8mOQb23EZgNyImWXoHJOz7kdCWSbXicw5TN4NL0
   N+m3w4yW/d35P5GK3Zzyz8zbWTPPbbhi7SyZy3Gwod+0k8KEYSbTrq6lb
   g==;
X-CSE-ConnectionGUID: 4ubxa/niTUy3ezHqbh/3ug==
X-CSE-MsgGUID: DYZ8xdJGQ+SBWMqxD0SfNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93501174"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="93501174"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 02:35:46 -0700
X-CSE-ConnectionGUID: KozID7yKRc2jEvsTt2/6+w==
X-CSE-MsgGUID: 3Y7PcWffSKass5VS0wslDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="249236391"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2026 02:35:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbb3Q-000000000to-25bK;
	Mon, 22 Jun 2026 09:35:11 +0000
Date: Mon, 22 Jun 2026 17:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/raid-stripe-tree.c:365:25: sparse: sparse: Variable
 length array is used.
Message-ID: <202606221706.goGnNFA6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/btrfs/raid-stripe-tree.c:365:25: sparse: sparse: Variable length array =
is used."
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Sterba <dsterba@suse.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: e6c249adb7217a20534e0583a82ee28251c65dc4 btrfs: validate negative e=
rror number passed to btrfs_abort_transaction()
date:   13 days ago
:::::: branch date: 12 hours ago
:::::: commit date: 13 days ago
config: hexagon-randconfig-r123-20260618 (https://download.01.org/0day-ci/a=
rchive/20260622/202606221706.goGnNFA6-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd7080=
29e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260622/202606221706.goGnNFA6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: e6c249adb721 ("btrfs: validate negative error number passed to btr=
fs_abort_transaction()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606221706.goGnNFA6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/btrfs/raid-stripe-tree.c:365:25: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/raid-stripe-tree.c:367:17: sparse: sparse: Variable length arra=
y is used.
--
>> fs/btrfs/xattr.c:255:17: sparse: sparse: Variable length array is used.
   fs/btrfs/xattr.c:443:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/reflink.c:48:17: sparse: sparse: Variable length array is used.
   fs/btrfs/reflink.c:271:17: sparse: sparse: Variable length array is used.
   fs/btrfs/reflink.c:276:17: sparse: sparse: Variable length array is used.
   fs/btrfs/reflink.c:288:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/uuid-tree.c:545:17: sparse: sparse: Variable length array is us=
ed.
--
>> fs/btrfs/file-item.c:1055:33: sparse: sparse: Variable length array is u=
sed.
--
>> fs/btrfs/root-tree.c:153:17: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/root-tree.c:172:25: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/root-tree.c:178:25: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/root-tree.c:185:25: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/root-tree.c:420:17: sparse: sparse: Variable length array is us=
ed.
--
>> fs/btrfs/inode-item.c:630:33: sparse: sparse: Variable length array is u=
sed.
   fs/btrfs/inode-item.c:669:33: sparse: sparse: Variable length array is u=
sed.
   fs/btrfs/inode-item.c:687:41: sparse: sparse: Variable length array is u=
sed.
   fs/btrfs/inode-item.c:723:25: sparse: sparse: Variable length array is u=
sed.
--
>> fs/btrfs/verity.c:482:17: sparse: sparse: Variable length array is used.
   fs/btrfs/verity.c:487:17: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/delayed-inode.c:1027:25: sparse: sparse: Variable length array =
is used.
   fs/btrfs/delayed-inode.c:1055:25: sparse: sparse: Variable length array =
is used.
   fs/btrfs/delayed-inode.c:1080:17: sparse: sparse: Variable length array =
is used.
   fs/btrfs/delayed-inode.c:1161:25: sparse: sparse: Variable length array =
is used.
--
>> fs/btrfs/free-space-tree.c:1438:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1445:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:230:25: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:265:33: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:272:25: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:281:17: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:299:17: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:321:25: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:374:25: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:415:33: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:422:25: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:431:17: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:456:25: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:472:17: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:851:17: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:859:17: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:867:17: sparse: sparse: Variable length array=
 is used.
   fs/btrfs/free-space-tree.c:1032:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1040:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1048:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1187:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1194:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1205:25: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1298:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1305:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1323:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1352:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1370:25: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1490:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1504:25: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1532:33: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-tree.c:1539:25: sparse: sparse: Variable length arra=
y is used.
--
>> fs/btrfs/transaction.c:1609:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1749:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1762:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1770:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1783:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1789:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1825:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1841:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1853:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1862:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1868:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1891:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1901:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1908:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:1932:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/transaction.c:2068:9: sparse: sparse: Variable length array is =
used.
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
   fs/btrfs/file.c:2133:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2461:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2478:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2497:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2511:33: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2607:25: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2615:25: sparse: sparse: Variable length array is used.
   fs/btrfs/file.c:2625:25: sparse: sparse: Variable length array is used.
--
>> fs/btrfs/free-space-cache.c:362:17: sparse: sparse: Variable length arra=
y is used.
   fs/btrfs/free-space-cache.c:4194:25: sparse: sparse: Variable length arr=
ay is used.
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
>> fs/btrfs/block-group.c:1157:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:1193:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:1230:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:1320:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:1327:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:2939:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:2946:33: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:2951:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:3441:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:3683:33: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:3830:41: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:3832:33: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:4196:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:4203:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:4209:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:4215:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/block-group.c:4219:17: sparse: sparse: Variable length array is=
 used.
--
>> fs/btrfs/ctree.c:3034:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2738:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2743:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2812:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:2828:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:194:22: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/ctree.c:194:22: sparse:    struct extent_buffer [noderef] __rcu=
 *
   fs/btrfs/ctree.c:194:22: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:292:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:298:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:391:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:410:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:527:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:534:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:547:25: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:551:17: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/ctree.c:551:17: sparse:    struct extent_buffer [noderef] __rcu=
 *
   fs/btrfs/ctree.c:551:17: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:887:17: sparse: sparse: Variable length array is used.
   fs/btrfs/ctree.c:890:9: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
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
   fs/btrfs/ctree.c:2903:9: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/ctree.c:2903:9: sparse:    struct extent_buffer [noderef] __rcu=
 *
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
>> fs/btrfs/disk-io.c:4138:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/disk-io.c:4172:25: sparse: sparse: Variable length array is use=
d.
--
>> fs/btrfs/relocation.c:686:9: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/relocation.c:963:25: sparse: sparse: Variable length array is u=
sed.
   fs/btrfs/relocation.c:977:25: sparse: sparse: Variable length array is u=
sed.
   fs/btrfs/relocation.c:1188:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:1201:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:1215:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:1229:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:1654:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:1725:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:1780:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:2321:33: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:3707:17: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:4328:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:4723:17: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:4733:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:4752:17: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:5038:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:5045:17: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:5051:17: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:5057:17: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:5214:17: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:5236:17: sparse: sparse: Variable length array is =
used.
   fs/btrfs/relocation.c:5242:17: sparse: sparse: Variable length array is =
used.
--
>> fs/btrfs/extent-tree.c:3316:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3368:33: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3417:33: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3429:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3440:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3491:33: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3553:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:172:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/extent-tree.c:183:25: sparse: sparse: Variable length array is =
used.
   fs/btrfs/extent-tree.c:896:17: sparse: sparse: Variable length array is =
used.
   fs/btrfs/extent-tree.c:1572:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:1576:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:1608:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:1614:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:1772:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:2248:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3151:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3163:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3172:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3178:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3185:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3193:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:3200:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:4395:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:5679:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:5684:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:5689:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:6092:33: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:6128:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:6385:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:6391:25: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:6418:33: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:6454:17: sparse: sparse: Variable length array is=
 used.
   fs/btrfs/extent-tree.c:6462:25: sparse: sparse: Variable length array is=
 used.
--
>> fs/btrfs/tree-log.c:180:9: sparse: sparse: Variable length array is used.
   fs/btrfs/tree-log.c:434:33: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/tree-log.c:445:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/tree-log.c:452:33: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/tree-log.c:2961:25: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:3019:33: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:3038:49: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:3057:33: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:3575:17: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:3587:17: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:3672:33: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:7791:17: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:7806:25: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:7824:25: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:7833:33: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:7850:33: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:7859:25: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:7865:25: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:7876:33: sparse: sparse: Variable length array is us=
ed.
   fs/btrfs/tree-log.c:7889:33: sparse: sparse: Variable length array is us=
ed.
--
>> fs/btrfs/volumes.c:2363:17: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:2900:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:2957:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:2964:17: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:2971:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:3170:17: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:3380:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:3470:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:3477:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:3483:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:3489:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:3493:17: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:3502:25: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:5363:17: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:6169:17: sparse: sparse: Variable length array is use=
d.
   fs/btrfs/volumes.c:6178:17: sparse: sparse: Variable length array is use=
d.
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

vim +365 fs/btrfs/raid-stripe-tree.c

8c4cba2adbb0ec6 Johannes Thumshirn 2024-07-08  324 =20
506be4d5657569e Johannes Thumshirn 2024-10-02  325  EXPORT_FOR_TESTS
506be4d5657569e Johannes Thumshirn 2024-10-02  326  int btrfs_insert_one_ra=
id_extent(struct btrfs_trans_handle *trans,
02c372e1f016e51 Johannes Thumshirn 2023-09-14  327  				 struct btrfs_io_co=
ntext *bioc)
02c372e1f016e51 Johannes Thumshirn 2023-09-14  328  {
02c372e1f016e51 Johannes Thumshirn 2023-09-14  329  	struct btrfs_fs_info *=
fs_info =3D trans->fs_info;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  330  	struct btrfs_key strip=
e_key;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  331  	struct btrfs_root *str=
ipe_root =3D fs_info->stripe_root;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  332  	const int num_stripes =
=3D btrfs_bg_type_to_factor(bioc->map_type);
7ab5d01d58a7668 Miquel Sabat=C3=A9 Sol=C3=A0 2025-10-24  333  	struct btrfs=
_stripe_extent AUTO_KFREE(stripe_extent);
02c372e1f016e51 Johannes Thumshirn 2023-09-14  334  	const size_t item_size=
 =3D struct_size(stripe_extent, strides, num_stripes);
02c372e1f016e51 Johannes Thumshirn 2023-09-14  335  	int ret;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  336 =20
02c372e1f016e51 Johannes Thumshirn 2023-09-14  337  	stripe_extent =3D kzal=
loc(item_size, GFP_NOFS);
b6193a891653efc Mark Harmstone     2026-02-18  338  	if (unlikely(!stripe_e=
xtent)) {
02c372e1f016e51 Johannes Thumshirn 2023-09-14  339  		btrfs_abort_transacti=
on(trans, -ENOMEM);
02c372e1f016e51 Johannes Thumshirn 2023-09-14  340  		btrfs_end_transaction=
(trans);
02c372e1f016e51 Johannes Thumshirn 2023-09-14  341  		return -ENOMEM;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  342  	}
02c372e1f016e51 Johannes Thumshirn 2023-09-14  343 =20
b5e2c2ff67d2c88 Johannes Thumshirn 2023-09-14  344  	trace_btrfs_insert_one=
_raid_extent(fs_info, bioc->logical, bioc->size,
b5e2c2ff67d2c88 Johannes Thumshirn 2023-09-14  345  					   num_stripes);
02c372e1f016e51 Johannes Thumshirn 2023-09-14  346  	for (int i =3D 0; i < =
num_stripes; i++) {
02c372e1f016e51 Johannes Thumshirn 2023-09-14  347  		u64 devid =3D bioc->s=
tripes[i].dev->devid;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  348  		u64 physical =3D bioc=
->stripes[i].physical;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  349  		struct btrfs_raid_str=
ide *raid_stride =3D &stripe_extent->strides[i];
02c372e1f016e51 Johannes Thumshirn 2023-09-14  350 =20
02c372e1f016e51 Johannes Thumshirn 2023-09-14  351  		btrfs_set_stack_raid_=
stride_devid(raid_stride, devid);
02c372e1f016e51 Johannes Thumshirn 2023-09-14  352  		btrfs_set_stack_raid_=
stride_physical(raid_stride, physical);
02c372e1f016e51 Johannes Thumshirn 2023-09-14  353  	}
02c372e1f016e51 Johannes Thumshirn 2023-09-14  354 =20
02c372e1f016e51 Johannes Thumshirn 2023-09-14  355  	stripe_key.objectid =
=3D bioc->logical;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  356  	stripe_key.type =3D BT=
RFS_RAID_STRIPE_KEY;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  357  	stripe_key.offset =3D =
bioc->size;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  358 =20
02c372e1f016e51 Johannes Thumshirn 2023-09-14  359  	ret =3D btrfs_insert_i=
tem(trans, stripe_root, &stripe_key, stripe_extent,
02c372e1f016e51 Johannes Thumshirn 2023-09-14  360  				item_size);
593062f67b828ec Filipe Manana      2025-05-19  361  	if (ret =3D=3D -EEXIST=
) {
8c4cba2adbb0ec6 Johannes Thumshirn 2024-07-08  362  		ret =3D update_raid_e=
xtent_item(trans, &stripe_key, stripe_extent,
8c4cba2adbb0ec6 Johannes Thumshirn 2024-07-08  363  					      item_size);
02c372e1f016e51 Johannes Thumshirn 2023-09-14  364  		if (ret)
02c372e1f016e51 Johannes Thumshirn 2023-09-14 @365  			btrfs_abort_transact=
ion(trans, ret);
593062f67b828ec Filipe Manana      2025-05-19  366  	} else if (ret) {
593062f67b828ec Filipe Manana      2025-05-19  367  		btrfs_abort_transacti=
on(trans, ret);
593062f67b828ec Filipe Manana      2025-05-19  368  	}
02c372e1f016e51 Johannes Thumshirn 2023-09-14  369 =20
02c372e1f016e51 Johannes Thumshirn 2023-09-14  370  	return ret;
02c372e1f016e51 Johannes Thumshirn 2023-09-14  371  }
02c372e1f016e51 Johannes Thumshirn 2023-09-14  372 =20

:::::: The code at line 365 was first introduced by commit
:::::: 02c372e1f016e5113217597ab37b399c4e407477 btrfs: add support for inse=
rting raid stripe extents

:::::: TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
:::::: CC: David Sterba <dsterba@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

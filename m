Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C64220687
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764694601; cv=none; b=CrKXrCBJfmRww9TMB8UlbaHoB4QIpmQAtpO9h0YxRYB7PrbqPYCcHkV+japS/NgOvDo/9R8MOVwt3sUtpxywO6mNNDfKb1getp8ZsUBIXkdSguqqw2RExz4IENQktMlDXgpB8NTW9otVnI8wYGbLmh1dSEmfB2+yVgX/pEQHNno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764694601; c=relaxed/simple;
	bh=c6zujebICr6uZ9/7jerI7yx/SxareWeIRNhg3tn6mas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F99UbiLQW8T15HyDDfDqQryytnPtllObnY4LHJluE+xN7BEU6qruBB2gKBZefvrw7YHvN8L8WNKBINAjDzqFMgSpQK8+3r5bpdO2Z1ugrqNPhkGbJfO8gfopWOb8Giiw+698AEUkXkNpv2ANSxYU1fQimAc+8J/4x3su38rszd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAsQwlaD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAsQwlaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764694600; x=1796230600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c6zujebICr6uZ9/7jerI7yx/SxareWeIRNhg3tn6mas=;
  b=YAsQwlaDi67qlgir3S6iT0Esdq40VThvgOGMdiPhSNiQAmblUqTOLw+C
   M0a0Vio4+H3+Rc7MarSOXxbLx2TuDPW9Na/NIdHQIM0IQcSRkM+Gq1nUZ
   lD0Fzv3XVa35GqIVaK1JW9k6liGcFmHiSG4KHO4FPDLhx+5nYgBxK+BL8
   X4WmGjJf4NRxBaPd0hDXnYsa6GXcqcFe+YOOLsIzbcsuoYGwp4HMRsc44
   RcYnLppmsVsmLxhw2Rb6j6ikVr/ObWFDkrE5wV1NN5qOZrEDljtMCbCws
   uSAVjKUsuBhcUCrvnXnKr90fApGhl3rRogu9UY7sJwS3TxABjimjN4utv
   g==;
X-CSE-ConnectionGUID: ybsqL/1vQLu6PbHEYYpK5Q==
X-CSE-MsgGUID: Wkj/g4mWTnqenyU2txDZ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92149133"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="92149133"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:56:40 -0800
X-CSE-ConnectionGUID: 0vrtvLB0QfGcfh/cmhSFpw==
X-CSE-MsgGUID: Z+MUmSzGQmKlMIQ8HIfn4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194303610"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 02 Dec 2025 08:56:38 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQTg2-000000002vJ-3Sf1;
	Tue, 02 Dec 2025 16:56:34 +0000
Date: Tue, 2 Dec 2025 17:55:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/wfamnae-next20251201 7/21]
 usr/include/linux/kvm.h:1581:57: error: invalid application of 'sizeof' to
 an incomplete type 'struct kvm_stats_desc_hdr'
Message-ID: <202512021722.wkmvuDSK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20251201
head:   2c162acfacfa32b76ad4176574a222a0e47f9df4
commit: 2eb7c0e83b5725b1318bcc4efe48fc6f34087c13 [7/21] KVM: Avoid a few dozen -Wflex-array-member-not-at-end warnings
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021722.wkmvuDSK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dd2b06d60d3eb9b07c7513358ad8b04386f79bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021722.wkmvuDSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021722.wkmvuDSK-lkp@intel.com/

Note: the gustavoars/testing/wfamnae-next20251201 HEAD 2c162acfacfa32b76ad4176574a222a0e47f9df4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from demand_paging_test.c:17:
   In file included from include/kvm_util.h:14:
>> usr/include/linux/kvm.h:1572:2: error: type name requires a specifier or qualifier
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |         ^
>> usr/include/linux/kvm.h:1572:58: error: expected identifier
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |                                                                 ^
>> usr/include/linux/kvm.h:1573:14: error: expected ')'
    1573 |                 __u32 flags;
         |                            ^
   usr/include/linux/kvm.h:1572:16: note: to match this '('
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |                       ^
   usr/include/linux/kvm.h:1578:2: error: type name requires a specifier or qualifier
    1578 |         );
         |         ^
>> usr/include/linux/kvm.h:1578:2: error: expected member name or ';' after declaration specifiers
>> usr/include/linux/kvm.h:1577:21: error: expected ';' at end of declaration list
    1577 |                 __u32 bucket_size;
         |                                   ^
>> usr/include/linux/kvm.h:1581:57: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_stats_desc_hdr'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                         ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/kvm.h:1581:71: note: forward declaration of 'struct kvm_stats_desc_hdr'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                                       ^
   7 errors generated.
--
   In file included from kvm_binary_stats_test.c:17:
   In file included from include/kvm_util.h:14:
>> usr/include/linux/kvm.h:1572:2: error: type name requires a specifier or qualifier
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |         ^
>> usr/include/linux/kvm.h:1572:58: error: expected identifier
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |                                                                 ^
>> usr/include/linux/kvm.h:1573:14: error: expected ')'
    1573 |                 __u32 flags;
         |                            ^
   usr/include/linux/kvm.h:1572:16: note: to match this '('
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |                       ^
   usr/include/linux/kvm.h:1578:2: error: type name requires a specifier or qualifier
    1578 |         );
         |         ^
>> usr/include/linux/kvm.h:1578:2: error: expected member name or ';' after declaration specifiers
>> usr/include/linux/kvm.h:1577:21: error: expected ';' at end of declaration list
    1577 |                 __u32 bucket_size;
         |                                   ^
>> usr/include/linux/kvm.h:1581:57: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_stats_desc_hdr'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                         ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/kvm.h:1581:71: note: forward declaration of 'struct kvm_stats_desc_hdr'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                                       ^
   kvm_binary_stats_test.c:77:17: error: no member named 'flags' in 'struct kvm_stats_desc'
      77 |                 type = pdesc->flags & KVM_STATS_TYPE_MASK;
         |                        ~~~~~  ^
   kvm_binary_stats_test.c:78:17: error: no member named 'flags' in 'struct kvm_stats_desc'
      78 |                 unit = pdesc->flags & KVM_STATS_UNIT_MASK;
         |                        ~~~~~  ^
   kvm_binary_stats_test.c:79:17: error: no member named 'flags' in 'struct kvm_stats_desc'
      79 |                 base = pdesc->flags & KVM_STATS_BASE_MASK;
         |                        ~~~~~  ^
   kvm_binary_stats_test.c:102:18: error: no member named 'flags' in 'struct kvm_stats_desc'
     102 |                 switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
         |                         ~~~~~  ^
   kvm_binary_stats_test.c:126:18: error: no member named 'flags' in 'struct kvm_stats_desc'
     126 |                 switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
         |                         ~~~~~  ^
   12 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

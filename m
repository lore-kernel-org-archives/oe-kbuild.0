Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC331A317D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 05:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771047435; cv=none; b=G3md3h5vCTf49d53Av+R3lho6zZsAzmNgkbzTP27zQHfBb9oVc35SJfkTxcz/f7sbe55rbfI29bvJsX0uPpkGHGwBoBlnH0nQOQ/ticSdOYaz/h4hRQ5Jkt7TgtYQhDy/wXvo8tSZRWexqJg+ZfFaIZe7YOPjBDSglDdudGeGAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771047435; c=relaxed/simple;
	bh=RCgrXkCYWx9P+10ldgLjPtoiRU8aOhebN7PwMWrGgH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UIxGJs6c4HilE5g05K17kkcOm4JzRiKx7Zzfv3ZiFfE4VXQqjwkb9rhNPsW1v69tE1krIcE2jJ33FF6c+/wVSgae4CD4/YGT9elzK0i35y1UBQ4vSJTqZntKCmqrejhfp+1V4TPgfCKjcV2vM1o2UL4DNYSWbtG5A3xN8d9SFYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnIdls+K; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnIdls+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771047434; x=1802583434;
  h=date:from:to:cc:subject:message-id;
  bh=RCgrXkCYWx9P+10ldgLjPtoiRU8aOhebN7PwMWrGgH0=;
  b=BnIdls+KpXOq9mYD4zJH0rgrTkzODqFYtNh1ozaK50ujhLYduHKQHD/t
   u4U/JXDDmoF6BP0ESUpmj4KIEHFmuBul6qPmj6jV2u1nh8LlrEH2ksE82
   bY1mvr1U5UlSdR9QKpzOdCJA8WHnGSLSKBSPmq73GA3PAIO+9P3qiIO58
   2sQCDPZ33UloIku+NK3zsmfdj1C6yidmqtmiKVjcMQXB62xWLeuZajD3D
   aLYI3qQySMuvAM0HTjTVler5dYz61pz/WB6R+sXHMJzehAjHA7ZgUrCHQ
   bl2VgHpwkEIUJWGCDqx/bLGW7sf9dL9sbGvDsIOLd6oNzaprBkaBBCtmS
   w==;
X-CSE-ConnectionGUID: 0vkuSLA7T4eDR9Ygnjj8XA==
X-CSE-MsgGUID: YqnVfGwZQ4qeqMvHXZvjRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="75847424"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="75847424"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 21:37:13 -0800
X-CSE-ConnectionGUID: G49LTM6zS8OLxfGa8EIpZw==
X-CSE-MsgGUID: xmFXrC9WR0SxnglA3+YmuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="212504585"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Feb 2026 21:37:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr8L8-00000000wG1-0VCG;
	Sat, 14 Feb 2026 05:37:10 +0000
Date: Sat, 14 Feb 2026 13:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [smfrench-smb3:ksmbd-for-next 98/144]
 fs/smb/common/smbdirect/smbdirect_connection.c:993:2: error: call to
 '__compiletime_assert_716' declared with 'error' attribute: BUILD_BUG_ON
 failed: sizeof(*batch) < sizeof(*storage)
Message-ID: <202602141324.axoREPQ7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steve French <stfrench@microsoft.com>

Hi Stefan,

First bad commit (maybe != root cause):

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next
head:   5cf574b306a01ec7f3a507e999b524ee39f0dee0
commit: c333a45eeca9b8b3609714335e9f3f0a741fa55b [98/144] smb: client: make use of smbdirect.ko
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: hexagon-randconfig-002-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141324.axoREPQ7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141324.axoREPQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602141324.axoREPQ7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/common/smbdirect/smbdirect_connection.c:993:2: error: call to '__compiletime_assert_716' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(*batch) < sizeof(*storage)
     993 |         BUILD_BUG_ON(sizeof(*batch) < sizeof(*storage));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:696:2: note: expanded from macro 'compiletime_assert'
     696 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:684:2: note: expanded from macro '_compiletime_assert'
     684 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:677:4: note: expanded from macro '__compiletime_assert'
     677 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:7:1: note: expanded from here
       7 | __compiletime_assert_716
         | ^
   1 error generated.


vim +993 fs/smb/common/smbdirect/smbdirect_connection.c

7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   983  
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   984  __SMBDIRECT_PUBLIC__
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   985  struct smbdirect_send_batch *
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   986  smbdirect_init_send_batch_storage(struct smbdirect_send_batch_storage *storage,
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   987  				  bool need_invalidate_rkey,
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   988  				  unsigned int remote_key)
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   989  {
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   990  	struct smbdirect_send_batch *batch = (struct smbdirect_send_batch *)storage;
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   991  
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   992  	memset(storage, 0, sizeof(*storage));
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03  @993  	BUILD_BUG_ON(sizeof(*batch) < sizeof(*storage));
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   994  
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   995  	smbdirect_connection_send_batch_init(batch,
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   996  					     need_invalidate_rkey,
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   997  					     remote_key);
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   998  
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03   999  	return batch;
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03  1000  }
7b8434b3d3fb61 Stefan Metzmacher 2026-02-03  1001  __SMBDIRECT_EXPORT_SYMBOL__(smbdirect_init_send_batch_storage);
d1b71276a9987b Stefan Metzmacher 2025-10-17  1002  

:::::: The code at line 993 was first introduced by commit
:::::: 7b8434b3d3fb6119a51f0cc167a1fbc2fa36f6de smb: smbdirect: introduce smbdirect_init_send_batch_storage()

:::::: TO: Stefan Metzmacher <metze@samba.org>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

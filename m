Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7CB47DD50
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Apr 2026 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691867; cv=none; b=btovyNtXWN8w1JmoGxGYVtBT1a29EZoqit07RBFLTDrEwyNZPgFmdl9AxrXGaGuOZxtJou+/ltczK5wJ8Ap2xpf29gcGc2QyuEUGEZ2LUfkTNcS3xsPuFeXo/1tiiQNIWIa5Kf+C1bpt5qht24xu1+Z7HN+yUiWdcPBE0Dn2/xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691867; c=relaxed/simple;
	bh=kqxxuuaG/1nadu0uaRhuyg8USDQ8kBLNpaTzvNi1xAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rg5DrAiBAxeXp3bpJ8ADKjsleGxpz9dA3MdXVswCv9koJryTHLN/VQ2CsQ47jnCYnRp9QJi87LKEqr9caJnvrujCtjXzUJ56WkVblZf0nfnopwOosiYQz4nNfp2rb/HWZNO6ybwsIgjhl2P2sdpY1d27uVvqOIwhcIY8304hVDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bp/ot5ew; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bp/ot5ew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776691865; x=1808227865;
  h=date:from:to:cc:subject:message-id;
  bh=kqxxuuaG/1nadu0uaRhuyg8USDQ8kBLNpaTzvNi1xAY=;
  b=bp/ot5ewp0BN8GHB8Ysp8Pqqfm0/2Sdn5W9IbyxufHf4SavQ+HtLZIqL
   b4u5pMgk3OKSg0Z9lVDDczD6ABb48GixixXxVFQYmUJby0SDmQ7Zts+2V
   3qJpnNeMLa0lM9zBDtwKdop9VxdNY+R4kaELPrr45/wAQWSZudlRMrdpI
   ceb9CrjPbGNWRDxyCwb2wD+NVO7DEUKuVzketgpB77rUVXQ81MPLRSNX3
   9bRnhIZUmrsePr5PvuPOUda/CgZkuV8DLgXC43yBZ/FcQF7tB7/q3ggkq
   ymGmkvOJ2gv/f7bA60ip/9qGZUj3laDtHhV9Lsq1WQr6MDWx5vZqQ1e9u
   A==;
X-CSE-ConnectionGUID: KRrTD95eRYiWxYt/+x3IZA==
X-CSE-MsgGUID: lC55HEupR16RwzeBIvyC+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88222784"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="88222784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 06:31:05 -0700
X-CSE-ConnectionGUID: aj6a9ziqQsiQVp3mUJNlfw==
X-CSE-MsgGUID: 5Fcp7HJvSryFTbb7Op1BzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="231592090"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Apr 2026 06:31:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEoiL-000000002HB-37M2;
	Mon, 20 Apr 2026 13:31:01 +0000
Date: Mon, 20 Apr 2026 15:30:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 59/59]
 ../../../lib/maple_tree.c:921:17: error: 'fallthrough' undeclared
Message-ID: <202604201507.mFSywmu9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Liam,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7e398f6d6450597ad0562ab7ff6b9d309fb37a11
commit: cc2f2507f3f05612c61c4b8f11bb91efbb9ad495 [59/59] maple_tree: fix freeing of nodes in rcu mode
:::::: branch date: 5 hours ago
:::::: commit date: 3 years ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260420/202604201507.mFSywmu9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604201507.mFSywmu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604201507.mFSywmu9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from maple.c:23:
   ../../../lib/maple_tree.c: In function 'mas_clear_meta':
>> ../../../lib/maple_tree.c:921:17: error: 'fallthrough' undeclared (first use in this function)
     921 |                 fallthrough;
         |                 ^~~~~~~~~~~
   ../../../lib/maple_tree.c:921:17: note: each undeclared identifier is reported only once for each function it appears in

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D4B672
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 01:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768182506; cv=none; b=KFCMjeaAE+8/la51d05aimt9zXiBD4dH/RWAq+lZmA9QyOwbLS7hm//V1CrcByp78WtrTiLfv6FtGl9Zvta/lfU8ntK/dh+vRs3b+28pLpAZyliP5uIBjFtuPUX1msYs2tdRj8CQhA/eprmTM5oIKi5Z6gHCsByRlOppYYyIiw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768182506; c=relaxed/simple;
	bh=mhrnfChmCWivRwUR8lsILWOOU/OZBbPqG7oIhST7j/M=;
	h=Date:From:To:Subject:Message-ID; b=BL7z7F4Q9YnUITy+j4eOY6ZcAMswZDx++huh0PU7/MPSS4zPhBSlxm9TSiSc1QiRl6ZHt+XABxwSoI1hlKDMTiZYlJLeJ8u1PHMQzSKo0lh2Y4hF3Yvs9YGN+5Px3XUdeArr23LEQXHf+mZbFZnxjSlfNcbEh9qVkVAo63JRBdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwfKV4eR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwfKV4eR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768182505; x=1799718505;
  h=date:from:to:subject:message-id;
  bh=mhrnfChmCWivRwUR8lsILWOOU/OZBbPqG7oIhST7j/M=;
  b=WwfKV4eR16TmPzegN7h0gyfNsOBTKGbi1NKWoBPmR4F74nSHYx/eyoUz
   csO9K990aUMcjE/DdhO6sZ+ng8wrvuAUZlFwaNPOz75fuf7OcYHU3EECC
   jtnVwjHW0ozvUw2PZ+tNFfHYYqNqRpdAJyi4ZoI+bfQKxsZYQK5x6dE85
   srswibnlDEJkM9KmR0AqB58aJZnsJC0bdUdycrwPHd5NFS4ogDlqIN32c
   bvSdbjfW3xQdxJiHGH+XxKKjclgcn9Fo5XN+2DNKDEvRhah/y8aaZLxDP
   nIH0TeLL8n9c5spBhxgBtX0QYMEErn3c/kxqp7puw1VWXXg2Pa08ksfKJ
   g==;
X-CSE-ConnectionGUID: BT2DKM1YTYacPjHgEULSww==
X-CSE-MsgGUID: b5ZoO0W7TnyyEq35Rsr6AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69191208"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69191208"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 17:48:25 -0800
X-CSE-ConnectionGUID: 7hSPq4xeQiKlVZSXBVUKyA==
X-CSE-MsgGUID: BuIBWXD3QbuDJGgeWA23NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="235194570"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jan 2026 17:48:24 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf72b-000000000c1-41zy
	for oe-kbuild@lists.linux.dev;
	Mon, 12 Jan 2026 01:48:21 +0000
Date: Mon, 12 Jan 2026 02:48:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cilium:max/vxlan-bigtcp 19/21] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
Message-ID: <202601120253.oofQ168Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Maxim Mikityanskiy <maxim@isovalent.com>

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   de0493575c7f01a82c2b58b308fae122df5aa143
commit: 23c46d787527e651cf2219225dc5943f18b88500 [19/21] vxlan: Enable BIG TCP packets
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120253.oofQ168Q-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#21: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#32: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#45: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#56: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#79: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#90: 
    Socket Socket  Message  Elapsed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

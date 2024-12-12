Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434DD6F307
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734013784; cv=none; b=khrGNNM1dJbOlwjWeomgWGnzCI7pGr2IyemkM4OlU8xa0v0I/dZ3xAuVU6qlLh9taCl1u6swNOFHgpaQ0bNYo/eXPT0qJViqenTbXntMAVhZk1Wm20fhWdqCPyY5kPtjei8R76sfUXO/HYI9aiRhBPzcwkqQDcg+VkWgRZOFxiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734013784; c=relaxed/simple;
	bh=LHvh3ZAnKF+UwEdVKPy3MAUuyggE3InW3i6VBS6+8mE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BuQbbGpm2YJqdhQ8zaQmf0otSQVAoveeqZQIleyhGWk/Z1isi9tlunhtQGU5v+nuFXA/6oz3w56GmQb+2xZ5SlMzA+GV+NRqrt3KXlUAq/tC9nrmI+qDeYAnE6qEZO4JZ28RR5QeIz+fXsuj5zbL6h5N6bLeYHinLN4BTopOSUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXg5FHzz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXg5FHzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734013782; x=1765549782;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LHvh3ZAnKF+UwEdVKPy3MAUuyggE3InW3i6VBS6+8mE=;
  b=DXg5FHzzARclrpWWPY7ODVOKEyXF0tEeF9hALz+jFtjKxxb0E5saDiDM
   f+bsngeGGh7sPIDf81PkCzSm8k8lcFzYmbrXtJhDUy+k5kVQSD+5ATkMH
   jruw68DBzix2lhJOeZkEtwuUDq52VVVq65T8TF6q/sIDd6kypwjS8MgSA
   wG8XG48hX1FWzt32jnyrzUjKKArMh53n1MePDz//cDGcE7+xobqFJfPJT
   iysTgqdUGvHcf7Pc+1l4CbEy03Qd7xGSUGUH6sZ7lnpf08NIxA0RpewwP
   YXp6Y90IzHvA6SGtpB+O0I1M2ZMOzXmjv9z71r7cKK/F6WtkNKWfgNHaK
   w==;
X-CSE-ConnectionGUID: jdYa+TT+ShylgDhwRIipvg==
X-CSE-MsgGUID: OTdngS2GRsKenE1FZZY41A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45837774"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45837774"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:29:42 -0800
X-CSE-ConnectionGUID: WSzWdNRhS5ydGrgUVHctiQ==
X-CSE-MsgGUID: Udx2EGRoSAGVPiNhssaxWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100406445"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Dec 2024 06:29:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLkCA-0007vf-23;
	Thu, 12 Dec 2024 14:29:38 +0000
Date: Thu, 12 Dec 2024 22:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/via/via-velocity.c:3615 velocity_get_strings()
 error: __builtin_memcpy() '*velocity_gstrings' too small (32 vs 1024)
Message-ID: <202412122219.GwZCGbQh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andrey Konovalov <andreyknvl@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: 2e577732e8d28b9183df701fb90cb7943aa4ed16 kasan, fortify: properly rename memintrinsics
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20241212 (https://download.01.org/0day-ci/archive/20241212/202412122219.GwZCGbQh-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412122219.GwZCGbQh-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/via/via-velocity.c:3615 velocity_get_strings() error: __builtin_memcpy() '*velocity_gstrings' too small (32 vs 1024)

vim +3615 drivers/net/ethernet/via/via-velocity.c

ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3610  
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3611  static void velocity_get_strings(struct net_device *dev, u32 sset, u8 *data)
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3612  {
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3613  	switch (sset) {
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3614  	case ETH_SS_STATS:
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04 @3615  		memcpy(data, *velocity_gstrings, sizeof(velocity_gstrings));
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3616  		break;
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3617  	}
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3618  }
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3619  

:::::: The code at line 3615 was first introduced by commit
:::::: ad66fa7a704f179fd3f88dece544e2d18078860f via-velocity : ethtool statistics support.

:::::: TO: françois romieu <romieu@fr.zoreil.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

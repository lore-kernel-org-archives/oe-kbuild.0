Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D45137E2F9
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779312047; cv=none; b=HnSEzn7MutZwQHtp/7IXBbKPGzHDP6Neh+tmfQps7alSnGKaYdLnvaVkD+0+xVoQfVkkBBv0bWVhWH7ayBjkzgbyQY4G4q0hgo5+XnnfAhvU8tWDPSwkRsdFBhq6LdY3SLx0XL2pIxFAEyJiv5b+5P5YQUF1iE0isp5cFxNZoTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779312047; c=relaxed/simple;
	bh=kEDlDpovVoCU81M008scNWqgBXSmwPc08jCJyT6GU3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jVjFqds57vLyQW8Z9G365jw0cJtTSPDjjoBdiXkdJn9Lowjk3X7FKkoTDfcU/ca0WpRVicRHwkzlSSQ8YdwtFikrgPY0eDd1rUOPFSy43JuwS9JczWTv1nFmpqKbIOb6dKuFaMCZ1XUQ7/NL+0baPbxINGWYpEQWmQl9MtIBebw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igfvfcHG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igfvfcHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779312045; x=1810848045;
  h=date:from:to:cc:subject:message-id;
  bh=kEDlDpovVoCU81M008scNWqgBXSmwPc08jCJyT6GU3s=;
  b=igfvfcHGTVx6fB/iebT+Bb/9Vkigajkvk3yltXpnRFcf9FJh6ObREVVx
   yuT1bRf2o1I4cDIqoyYpAk8ZPIWRBHU6PnDGT+KCEn07STNwEbo9dCdCT
   1ZKFQYXcn8BL8lnOSSQV3+Mf3y/vuuVMqAhrtsHToC5Ycq6XlcJNDYTsH
   v1a6/sRaDP5CPAOUgsq5w0ayQjDjlDjTgs7wPbDDaWY7KwRQswZOwE0gb
   8c9UsD6eXq3bs1G+C70xisKFVA68vlwgGjraqa+mWAtgbiVueUx16urBW
   gJWzhDvWGXbUKPil+8fRwE6yf+bwZ2Js8p4xhi/AiT2HDTi1S3pW548rW
   Q==;
X-CSE-ConnectionGUID: 5r3SFCEqQ0eh8FQiyRutVA==
X-CSE-MsgGUID: MhOi/Ai1SLasmzHSnMAZjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79955851"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="79955851"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 14:20:44 -0700
X-CSE-ConnectionGUID: bwHq/iyVSZKkA5eq9Yqq6g==
X-CSE-MsgGUID: gBh3dFiDSy6ASeLQeyNLKg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2026 14:20:43 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPoLJ-00000000AeP-1s4c;
	Wed, 20 May 2026 21:20:41 +0000
Date: Wed, 20 May 2026 23:20:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: "__netdev_update_features"
 [drivers/net/bonding/bonding.ko] undefined!
Message-ID: <202605202332.QJE5bHVo-lkp@intel.com>
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
TO: Jihong Min <hurryman2212@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jihong-Min/xfrm-add-a-lower-device-offload-handle-resolver/20260520-162948
head:   bcd1877590171e39d1afa5918b534f20a01d0506
commit: 79f3bc097e51b114682d9dea7428053cf6cbb955 bonding: expose user-controlled IPsec features for LAG
date:   13 hours ago
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260520/202605202332.QJE5bHVo-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605202332.QJE5bHVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605202332.QJE5bHVo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__netdev_update_features" [drivers/net/bonding/bonding.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

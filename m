Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB04847ECF0
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 20:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829544; cv=none; b=KmF92jDtml4kBOluO7QwGfFOHpN4+xhDS2VQb6JtW/8I5KCss8rVEht7hJ3jiCUxnsT3aBs9bzZs+HcSWm7KXyISp6qbdHdlrJbcKaxWtWoVC/29E3KpTtpIdFCQPoSC1ZCGB2Uqyy0SzPfxGKZC3ZoCAKKcbEGdoe5xnXjiUVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829544; c=relaxed/simple;
	bh=ZtIYyqoa2mPnM58I5Az2vlXXw5cZVikOe2/hPko7bvU=;
	h=Date:From:To:Subject:Message-ID; b=f2ii1gxBYIKLMmcgq6HIJKyWwTjwPpnzk/1o/5pPTLhl493f634xo5EJeBVMSXgRX8lT4z100nYOVKmhrVEQpxoTze8fdTwwfQfb7QOVIl5Cf5HJlhsWb8LvvKegvmpLKW82Z980cLf3GwXPoZRFuoZLiPOkbFhcsMg9R/xRkoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMCI92Rm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMCI92Rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772829543; x=1804365543;
  h=date:from:to:subject:message-id;
  bh=ZtIYyqoa2mPnM58I5Az2vlXXw5cZVikOe2/hPko7bvU=;
  b=kMCI92RmxGd6Op0unXwHgaDPaVpWMcrjq9XLicwcTPOIOrQnDYjKKudC
   9vS4Rd3QDnJI4ZkBFjzvADdBf/8qXtRVfHOq0w0iNJJW1LwWq4sgCefGc
   Xf5hCmjffKkCNuaPU3HTQfeUCSNPjjs+IasgaFTPYroil21CiSQY1InQK
   AV7LeUzYYegZvBK/aq6Rd9SbblnjIsuncJZejpEiZM4Rlb62b5/n8meik
   FHQcNcJ03k5rqrHePmv9AHun/vhgHZwbQR/M9JTXebRPbZBxNG1/EXanr
   vVB7vd2SYtak19VsEBevj8XX1bk1aI2zoC5CyZr3Emv2GW8/U2+iGxFQ7
   A==;
X-CSE-ConnectionGUID: HJ/3/2MvTWSheBZ9WKAdYg==
X-CSE-MsgGUID: sdjUvAycT6ah6ieQQ/jnsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84578731"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84578731"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:39:02 -0800
X-CSE-ConnectionGUID: xiv1eIuzSy6KsbccFlCPwg==
X-CSE-MsgGUID: lqNNjQHfTMuZPxANE6tltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223233736"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2026 12:39:01 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybwp-000000002LR-1qGA
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 20:38:59 +0000
Date: Fri, 06 Mar 2026 21:38:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260306-1425 16/31]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'device'
Message-ID: <202603062150.qIXmIZGk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260306-1425
head:   8e85a7c6fd859479abc528a78dec59382ef82d3d
commit: e26883d21348520e8a3faa0721b021878d78e98a [16/31] RDMA/hfi2: Add initialization and firmware support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603062150.qIXmIZGk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'device'
#550: FILE: drivers/infiniband/hw/hfi2/affinity.c:519:
+		 * evenly among devices, then the first device device to be

WARNING:REPEATED_WORD: Possible repeated word: 'by'
#5464: FILE: drivers/infiniband/hw/hfi2/init.c:1942:
+ * It cleans up and frees all data structures set up by
+ * by hfi2_alloc_devdata().

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41B47ECEC
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829546; cv=none; b=TZgPvLDsb7YmpxTUEpKRH/piTxx3SkeDaXUIg8KKxyKKOJqM46iG6hgejG6NHwqc/ZsLoLYbppZYPnVLOx73R7OcC5uAoZjLRrKpyjzI5oUMR65aOheFVJJYXXOA1EO9geuLLw0sBOz0MMRwyDWiPmoPCIah3RgaHgE7LjpaQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829546; c=relaxed/simple;
	bh=tozYjFB4uIolbn3RUMq3ZT3hO1yNJ2jpsozK3qd7KDA=;
	h=Date:From:To:Subject:Message-ID; b=CxWjyJCJhkM/n53PMc7vRGeLnm48bRLbyPzBZNZ7+7413GN4N7h707k9NZQjoqCLf5JaYip2PTZywuf2ThQdObdt+F7MDhs27UGhyE4AnY2MWsQ/dOU8sk79bd4pHK8vUWEV1gq2bxNtFwW96i9gdga1evnMVOABsM1v0U+QF78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VF9+QE8o; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VF9+QE8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772829545; x=1804365545;
  h=date:from:to:subject:message-id;
  bh=tozYjFB4uIolbn3RUMq3ZT3hO1yNJ2jpsozK3qd7KDA=;
  b=VF9+QE8oDGwD/DAekuC/jXICgjJOuRJbnZIUW+TXW0TMNcK2GAk0NWWO
   MXMwwYJtgaiP0yUAGQHgFQeDiNF+SAkyTLvsxuvaciiWKsGqDEuXR7NPV
   8loYJL54ye75yThEuWDrHQgCkHXVNRGIfH77q7Tkotr0xYIByNyFu/0hs
   We90AWqY6yQuGbIoUPBOgkKLsrIh0oHt2jhN//Q48JdnD43sa1kdoqRsj
   iRDXtBouQ4N5+66Vn1UO3wuCqqP4RcuwckF7+tJf5XHn89jVaVNsS4sPI
   kaQzsbgwrAbMlSBHoVs8tSycyq0xL5zXOiZgJ1i3Qs+uEjKBvqkbByfC/
   w==;
X-CSE-ConnectionGUID: R+f/Zc/RRT2h6jI+9L2VMw==
X-CSE-MsgGUID: uj0C895zRbeC0uzjZEIXhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84578733"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84578733"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:39:03 -0800
X-CSE-ConnectionGUID: Mehwui9TSe+IE+aGHXy/Hw==
X-CSE-MsgGUID: PxsdSh2tSNC2YTiSJ4gv6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223233738"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2026 12:39:01 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybwp-000000002LL-1WaD
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 20:38:59 +0000
Date: Fri, 06 Mar 2026 21:38:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260306-1425 12/31]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202603062152.A4CbTdvG-lkp@intel.com>
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
commit: 409f0980e9891eaac95909fdf62c8146a14259e6 [12/31] RDMA/hfi2: Add in trace header files
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603062152.A4CbTdvG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#83: FILE: drivers/infiniband/hw/hfi2/trace_ctxts.h:3:
+/*
+* Copyright(c) 2015 - 2020 Intel Corporation.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#204: FILE: drivers/infiniband/hw/hfi2/trace_dbg.h:3:
+/*
+* Copyright(c) 2015 - 2018 Intel Corporation.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#851: FILE: drivers/infiniband/hw/hfi2/trace_misc.h:3:
+/*
+* Copyright(c) 2015, 2016 Intel Corporation.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1250: FILE: drivers/infiniband/hw/hfi2/trace_rc.h:3:
+/*
+* Copyright(c) 2015, 2016, 2017 Intel Corporation.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

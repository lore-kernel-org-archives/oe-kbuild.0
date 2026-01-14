Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A50A13FEE
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 03:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768362535; cv=none; b=bQSz8wHIB7JOjqsa6e0csxq9Mp1c+KYJX8pipZb+iPU77Tg9/m6q+DauYB8mxwjhrsp8vDd2XdhGk+8NhvbIHpb+qnTF/aQFu6VuVWuI+vAQLCuFdhaDN27LdCJO8qeD2HzdKqExRTdGVh5awXJUUuiujDiiqVttijgbSolZChY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768362535; c=relaxed/simple;
	bh=ISd+QXEJXJjPXhNdIw/7xF6UnBY2ipVrRF7gyWY0w1c=;
	h=Date:From:To:Subject:Message-ID; b=fEwXVLvY3pg4ZbFX55tGf0UMeS62Spjj/x4JWRSwVZxk0jxGXERQuUSERCKdmcpHO4FegFkWqJ1IfZweC1/TUGfY02Zm654RG3wXlPbjVzngu+wgB0w4KHEe35EHhS4bkmYzzmrngV5JhUKgSVKiyG15k4UT1RWC9S19/EE7/Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/Rl3o8o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/Rl3o8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768362531; x=1799898531;
  h=date:from:to:subject:message-id;
  bh=ISd+QXEJXJjPXhNdIw/7xF6UnBY2ipVrRF7gyWY0w1c=;
  b=n/Rl3o8ob6M0JhP2ypGyls7ER0sw3kX37DNom18P66Hk06qJi2vG39gg
   tBLyDFS9M4B5Qq8cy36re2hvvOJg1h6vSmkflVF5RfIs4TBbSLGAnDZYF
   RW6LtGMSLjmWY5obxGFztXch61XZLvfVqX66y8ZE5MSIcuFKWWA5QWftL
   ENS+oiMFyiA1O/oRWWsvya/9EQdI4NccrJDcWMF2DbxzcWtST4XVI3Ao6
   U2tIn4g7dMurq+PYJCn3uKcuLESxOffvbg/ZJxt465BBoXQJ2zCeYKRIO
   fCj1+eJEvRnoILpyNCMeiZdEMJQ8Aw/Bx5pT9RZg06rUgnjJAj6B86e/L
   g==;
X-CSE-ConnectionGUID: 6i7NAh3xQd+wieDR2CybkQ==
X-CSE-MsgGUID: +l8R8+aVROG+u30MRtZLjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92326644"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="92326644"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:48:51 -0800
X-CSE-ConnectionGUID: LlVd2hhWTD2cHirpJARqyA==
X-CSE-MsgGUID: lQChjRgMTsaK6IFETX0DiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204976089"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jan 2026 19:48:52 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfrsI-000000001I9-13Jb
	for oe-kbuild@lists.linux.dev;
	Wed, 14 Jan 2026 03:48:50 +0000
Date: Wed, 14 Jan 2026 04:48:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/controllers/v3 1/3]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'to'
Message-ID: <202601140421.ggmpoRMK-lkp@intel.com>
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
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/controllers/v3
head:   7de100033c137713ae1acd164a6e202acf799154
commit: b1822a9acd5c2cf7c1f9f8d4632af0ac9c4bb547 [1/3] drivers/cxl: introduce cxl_region_driver field for cxl_region
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260114/202601140421.ggmpoRMK-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#22: 
The intent is to clarify how to to add additional drivers (sysram,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

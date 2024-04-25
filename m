Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5200C2232B
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Apr 2024 04:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714017885; cv=none; b=tFgpOCAmmgTI0bNw7EexvdUaa26B8qORUXRYP9ekcENkQn1/e30WAkvXPqF6kBi4/brk+Lzti2gs+B1eNYsMS2s+ortZtC2me3V3bGNLTrOXcqtYVdsLxuGNLgWzJM4RiIcS3jyOze1GlF3kVsdq4uhg/ZgHuxCjuK1FQL/f/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714017885; c=relaxed/simple;
	bh=RWCsp4mb+kER2CVUO429jYR9o5VsBk/avlG7KgbEeFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O702tp2UVhTZdJ2LxSvuTVR9Dbdw4hou7oQyU7T3olA6qQX5YYpnLwd9GOfnTQsYc+jyUjqzmwPG3X6sXicivfYo3dUj6KZCpf0t8MQxKBRf3Dk8ZFd/Q0JR9lvXEdy6VeFH/sriKVkdFSrN/PcxurZg5gMcx5T/CHD/rrzlEj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDjzD/vU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDjzD/vU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714017883; x=1745553883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWCsp4mb+kER2CVUO429jYR9o5VsBk/avlG7KgbEeFI=;
  b=DDjzD/vUlNmgy6qOyG2e95ikex/MPv1Z0C5iZ0HTq97hcz9wqRGr/vjC
   MfMW6vQkDL3W+z2xkEP7ppYwUkzdVDwjj6tixtt8pBYbC7upWIKwun92y
   8pBym1DXq/kQPTTgUMAVs/As0aoz6wWuzKcE98sFS2q95mdtAcA5RUuL2
   ErvuP6QV8GnIZerPWjja6gSkvtdEXYwzhTt+Pywtn88oV2C5zpmFUezbo
   Qt4NNmZe+rLTyobCerGklWm3V8r+pXRe7LGfjeE1XIgWiA11xs/lNFB8i
   7d1pU+Swj04YDHZKZxRj30Zv8Fyq7cHIKJWkiPgECjFVTWPQPDlxbm70v
   g==;
X-CSE-ConnectionGUID: qH4ipSdKTTuFuPSC25yjBQ==
X-CSE-MsgGUID: MG15aEkLTKymiV6U9J460w==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="35078042"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="35078042"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 21:04:42 -0700
X-CSE-ConnectionGUID: E4IWMTDOSIOyE9NWYRAikA==
X-CSE-MsgGUID: R0/cuFp5TKCJo49K2lVnHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="24990987"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Apr 2024 21:04:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzqLf-0001vY-19;
	Thu, 25 Apr 2024 04:04:39 +0000
Date: Thu, 25 Apr 2024 12:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:amd-staging-drm-next 2021/2033]
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h: spl/dc_spl_types.h is
 included more than once.
Message-ID: <202404251153.Ed5aHK5H-lkp@intel.com>
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
TO: Aurabindo Pillai <aurabindo.pillai@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   5550c5defbdf958f2df459be74f87afa9eb0bdde
commit: 4331f4f5985cec71a0ca058d8e58d77016e1498e [2021/2033] drm/amd/display: Add misc DC changes for DCN401
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404251153.Ed5aHK5H-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/inc/hw/transform.h: spl/dc_spl_types.h is included more than once.

vim +32 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h

    28	
    29	#include "hw_shared.h"
    30	#include "dc_hw_types.h"
    31	#include "fixed31_32.h"
  > 32	#include "spl/dc_spl_types.h"
    33	
  > 34	#include "spl/dc_spl_types.h"
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

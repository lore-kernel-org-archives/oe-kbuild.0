Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A2223EAB9
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766256884; cv=none; b=JZdsR21YjYdDS7hreBSG8/+ar+0C3GTFddTT6r6/xOXTJAN3FH20IgOu1TNoFxgXsKvXR6jf3X2c9EA++wfBf652q9VU2eLUx4AEgQ3+DHCXtiHzCETYY2QuZl55Orju5H291PthO32dLIE7Ippu4g2zr/ULxDQ6r6q5yCYJF1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766256884; c=relaxed/simple;
	bh=OiAqfsO+Y5RXxZBXnVIul8MbEir5HRYj8OezbeQKKYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ur3bGs61rz7N4WpeK86vQP/Cg46S/0ixCwwwrFwYNPxoqxFExcKDgcrYL3a/EXGav7qXcaN1vhEnliIeqK2vNX/9WnNsriw8QMiSScPvnr3i5/2XaCZkmUTnwVVIKhW86tfnqFQ4rrjI3qIqg/FZAEHPkhFFmfZIxGU/GyM+348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTH2vNu6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTH2vNu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766256884; x=1797792884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OiAqfsO+Y5RXxZBXnVIul8MbEir5HRYj8OezbeQKKYw=;
  b=hTH2vNu6hJHj79R8R/aKkVnPzf0bmVa6Bbw1103szWx7YV1RTQzsJIEe
   ZqrhgGC1Uil0sHjiut55d/XcGFlKZ+50fdZIsyD8jV1aYAnPAGCq4aEJz
   O7Xke43QRq215eDapGEiFF+ZOyA7tv7js/RaGdpbPmGstvq32UOtIpTOG
   QUyfAgau2re5/KdCZILyJ+uZWlVCnorEs21XpeOjTqePXLhT0W0RhQUof
   ckdeaVlaQfEqlpkUqr3B+nDX6cosQzA6gAZLtt7psIWcs0GJr4n1mb2Oq
   sCE+TMyedlkG/DPl1WyKJeUVj9K5a3pz31AgpQEeQ7PHtLllYun3psLXy
   w==;
X-CSE-ConnectionGUID: x6GeydOVQdmUHYR/9hzTXg==
X-CSE-MsgGUID: t+PAIV2kQReDUTFWuRZ9pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68119034"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68119034"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 10:54:41 -0800
X-CSE-ConnectionGUID: iuGudWG2Q6OE0u2eHFVGaQ==
X-CSE-MsgGUID: e8EKAeFcSWWvZP6lfUjxAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199186717"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2025 10:54:39 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX268-0000000051y-37rm;
	Sat, 20 Dec 2025 18:54:36 +0000
Date: Sun, 21 Dec 2025 02:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.19-rc 42/109] net/dsa/tag_mxl862xx.c:197:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512210215.9MMprdKb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/dsa/tag_mxl862xx.c:197:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   5ee5189ef893fbbb9311f0cdb9f2f382c4a17eb1
commit: 0a6a21595f5ca404521f94cae72a55efb671ce58 [42/109] net: dsa: add tag formats for MaxLinear switches
:::::: branch date: 26 hours ago
:::::: commit date: 3 days ago
config: hexagon-randconfig-r113-20251218 (https://download.01.org/0day-ci/archive/20251221/202512210215.9MMprdKb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210215.9MMprdKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512210215.9MMprdKb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/dsa/tag_mxl862xx.c:197:1: sparse: sparse: bad integer constant expression
   net/dsa/tag_mxl862xx.c:197:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> net/dsa/tag_mxl862xx.c:197:1: sparse: sparse: bad integer constant expression
   net/dsa/tag_mxl862xx.c:197:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   net/dsa/tag_mxl862xx.c:201:1: sparse: sparse: bad integer constant expression
   net/dsa/tag_mxl862xx.c:201:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   net/dsa/tag_mxl862xx.c:201:1: sparse: sparse: bad integer constant expression
   net/dsa/tag_mxl862xx.c:201:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   net/dsa/tag_mxl862xx.c:207:1: sparse: sparse: bad integer constant expression
   net/dsa/tag_mxl862xx.c:207:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   net/dsa/tag_mxl862xx.c:207:1: sparse: sparse: bad integer constant expression
   net/dsa/tag_mxl862xx.c:207:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/net/dsa/mxl862xx/mxl862xx.c:3581:1: sparse: sparse: bad integer constant expression
   drivers/net/dsa/mxl862xx/mxl862xx.c:3581:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/net/dsa/mxl862xx/mxl862xx.c:3582:1: sparse: sparse: bad integer constant expression
   drivers/net/dsa/mxl862xx/mxl862xx.c:3582:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/net/dsa/mxl862xx/mxl862xx.c:3582:1: sparse: sparse: bad integer constant expression
   drivers/net/dsa/mxl862xx/mxl862xx.c:3582:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/net/dsa/mxl862xx/mxl862xx.c:3583:1: sparse: sparse: bad integer constant expression
   drivers/net/dsa/mxl862xx/mxl862xx.c:3583:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"

vim +197 net/dsa/tag_mxl862xx.c

0a6a21595f5ca4 Daniel Golle 2025-02-28  196  
0a6a21595f5ca4 Daniel Golle 2025-02-28 @197  MODULE_LICENSE("GPL");
0a6a21595f5ca4 Daniel Golle 2025-02-28  198  #if (LINUX_VERSION_CODE < KERNEL_VERSION(6, 2, 0))
0a6a21595f5ca4 Daniel Golle 2025-02-28  199  MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_MXL862);
0a6a21595f5ca4 Daniel Golle 2025-02-28  200  #else
0a6a21595f5ca4 Daniel Golle 2025-02-28  201  MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_MXL862, MXL862_NAME);
0a6a21595f5ca4 Daniel Golle 2025-02-28  202  #endif
0a6a21595f5ca4 Daniel Golle 2025-02-28  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

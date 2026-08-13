Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B885C4854F0
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633117; cv=none; b=qIOJPJIFbuDlqfb00tC11qk6+DIW9d0vxdapG6DKMBYTNAGs574uYy73SdM+HdiSYAoy98tha97aYxWButXiwnFXeYGEGAPK8+/cMiZxkgX/R1R0Nc5AHOg4BVxWTU5bnup6w7NE68/kESsMuJd+8RRTcGbg6hSJtTYeFi5SBsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633117; c=relaxed/simple;
	bh=lQGlUke2Vz5fD+/J0+fp+RcTpcTA17w1I0zr4GBL50E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hrtt1RotkfMnE/icJRKZC+bpAnY1sqfVdxfk2exuL5wXCTTMXqbj5b2auNuzYp1sMFBAE3RwbXRoQ7XLgM6xs7yv0173j4kiypX84QqrMk/sYOeiLjZ8tgDxQf5PAB4Uki0FAN2Kxhg3sGhbEKJOId7qM/IMrZxvdzV1489h20g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krLm6NBJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krLm6NBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786633105; x=1818169105;
  h=date:from:to:cc:subject:message-id;
  bh=lQGlUke2Vz5fD+/J0+fp+RcTpcTA17w1I0zr4GBL50E=;
  b=krLm6NBJ55kj9n2uP7phFkC4IokOPSY5O6Ug45655XKLAmjsH8Wsk93a
   M7B2iqvoj7xLVCm3ubmnYj+g67ySBnJLjcpOnlf+jzi0QmJrurgqt2J40
   5RtPcOJ/xNA/4BxIvxGy+y6fpiDJYOJEP6xrgxlE0HrKZiIFmrEe3paAa
   tTVcuDqZDUlT7RVhg+/D7439HJEEqR3f6Aqscv0Cj22pt3Az0Vvik2qd3
   m0L6byXu+uXxG2cpdT0k8CCX8N7YJjIopGpJhZw3yQZar7Cl8Gh/0xCnL
   6JTIdqEAYeHyW10tSH0o4ASS4n0MWPbDKcZY9osXgrEIh+P4Ozg+DcqlY
   g==;
X-CSE-ConnectionGUID: eLzI7B6/Qq2hQl3yQ2FJ7w==
X-CSE-MsgGUID: AXIF2GnBQLq/+MQ1ImCU9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91084252"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="91084252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 07:58:20 -0700
X-CSE-ConnectionGUID: g7HJ93cHQIGsOO2i/Snqeg==
X-CSE-MsgGUID: fDTC8+tjT9+gw2fq9j+TPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264544568"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2026 07:58:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuWsr-00000000VSY-2NQu;
	Thu, 13 Aug 2026 14:58:17 +0000
Date: Thu, 13 Aug 2026 22:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3961/14737]
 drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Trying to use
 reserved word 'struct' as identifier
Message-ID: <202608132233.JwmgEtk5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Trying to use reserved word 'struct' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   28d012efb4327f9c75d5e042a7c91e9a542efa98
commit: 73c5a253068e8cdf975941a14f032e351730a396 [3961/14737] drm/xe/configfs: Add enable_multi_queue attribute
:::::: branch date: 21 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-063-20260812 (https://download.01.org/0day-ci/archive/20260813/202608132233.JwmgEtk5-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608132233.JwmgEtk5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608132233.JwmgEtk5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:393:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:397:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:401:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:411:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:411:13: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:411:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: undefined identifier 'gt'
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: undefined identifier 'gt'
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: got pci_dev
>> drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Trying to use reserved word 'struct' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:415:37: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:415:37: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_ads.c:417:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:417:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:420:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:420:13: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:420:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:429:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:429:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:438:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:438:1: sparse: sparse: got }

vim +/struct +411 drivers/gpu/drm/xe/xe_guc_ads.c

c151ff5c905333 Badal Nilawar          2024-04-05  338  
d6da81a4785ca6 Badal Nilawar          2024-04-05  339  static void guc_waklv_init(struct xe_guc_ads *ads)
d6da81a4785ca6 Badal Nilawar          2024-04-05  340  {
c151ff5c905333 Badal Nilawar          2024-04-05  341  	struct xe_gt *gt = ads_to_gt(ads);
d6da81a4785ca6 Badal Nilawar          2024-04-05  342  	u64 addr_ggtt;
d6da81a4785ca6 Badal Nilawar          2024-04-05  343  	u32 offset, remain, size;
d6da81a4785ca6 Badal Nilawar          2024-04-05  344  
d6da81a4785ca6 Badal Nilawar          2024-04-05  345  	offset = guc_ads_waklv_offset(ads);
d6da81a4785ca6 Badal Nilawar          2024-04-05  346  	remain = guc_ads_waklv_size(ads);
d6da81a4785ca6 Badal Nilawar          2024-04-05  347  
83f4151787c5dd Matt Roper             2025-12-12  348  	if (XE_GT_WA(gt, 16021333562))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  349  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  350  				 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
4d5c98eb77fe51 Matt Atwood            2025-08-07  351  	if (XE_GT_WA(gt, 18024947630))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  352  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  353  				 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING);
4d5c98eb77fe51 Matt Atwood            2025-08-07  354  	if (XE_GT_WA(gt, 16022287689))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  355  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  356  				 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE);
d6da81a4785ca6 Badal Nilawar          2024-04-05  357  
4d5c98eb77fe51 Matt Atwood            2025-08-07  358  	if (XE_GT_WA(gt, 14022866841))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  359  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  360  				 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO);
61ef737db9f284 Vinay Belgaumkar       2024-10-15  361  
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  362  	/*
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  363  	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  364  	 * the default value for this register is determined to be 0xC40. This could change in the
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  365  	 * future, so GuC depends on KMD to send it the correct value.
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  366  	 */
4d5c98eb77fe51 Matt Atwood            2025-08-07  367  	if (XE_GT_WA(gt, 13011645652)) {
7c9de25efa7677 Jonathan Cavitt        2025-07-28  368  		u32 data = 0xC40;
7c9de25efa7677 Jonathan Cavitt        2025-07-28  369  
19baa830fbb60d Lucas De Marchi        2025-09-12  370  		guc_waklv_enable(ads, &data, 1, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  371  				 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE);
7c9de25efa7677 Jonathan Cavitt        2025-07-28  372  	}
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  373  
4d5c98eb77fe51 Matt Atwood            2025-08-07  374  	if (XE_GT_WA(gt, 14022293748) || XE_GT_WA(gt, 22019794406))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  375  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  376  				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
636cdf6fbddff4 Julia Filipchuk        2024-08-05  377  
09af64eba63ece Michal Wajdeczko       2025-12-16  378  	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 44) && XE_GT_WA(gt, 16026508708))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  379  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  380  				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
09af64eba63ece Michal Wajdeczko       2025-12-16  381  	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 47) && XE_GT_WA(gt, 16026007364)) {
7c9de25efa7677 Jonathan Cavitt        2025-07-28  382  		u32 data[] = {
d72779c29d82c6 Sk Anirban             2025-07-16  383  			0x0,
d72779c29d82c6 Sk Anirban             2025-07-16  384  			0xF,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  385  		};
19baa830fbb60d Lucas De Marchi        2025-09-12  386  		guc_waklv_enable(ads, data, ARRAY_SIZE(data), &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  387  				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
7c9de25efa7677 Jonathan Cavitt        2025-07-28  388  	}
d3e8349edf7ed9 John Harrison          2025-04-03  389  
29042df3acdc73 Badal Nilawar          2025-08-21  390  	if (XE_GT_WA(gt, 14020001231))
29042df3acdc73 Badal Nilawar          2025-08-21  391  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
29042df3acdc73 Badal Nilawar          2025-08-21  392  				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
f9a21696e37b06 Julia Filipchuk        2026-03-03  393  	if (XE_GT_WA(gt, 14025515070) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
f9a21696e37b06 Julia Filipchuk        2026-03-03  394  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
f9a21696e37b06 Julia Filipchuk        2026-03-03  395  				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
29042df3acdc73 Badal Nilawar          2025-08-21  396  
0af278683cd61b Daniele Ceraolo Spurio 2026-07-06  397  	if (XE_GT_WA(gt, 22022079272) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 62))
0af278683cd61b Daniele Ceraolo Spurio 2026-07-06  398  		guc_waklv_enable(ads, NULL, 0, &offset, &remain, GUC_WA_KLV_REMAP_RANGED_TLB_INV);
0af278683cd61b Daniele Ceraolo Spurio 2026-07-06  399  
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  400  	/* The GuC does not enable the sem_tok_64 feature on NVL-S */
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  401  	if (XE_GT_WA(gt, 16029897822) && gt_to_xe(gt)->info.platform != XE_NOVALAKE_S &&
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  402  	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 69))
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  403  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  404  				 GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64);
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  405  
73c5a253068e8c Shuicheng Lin          2026-07-09  406  	/*
73c5a253068e8c Shuicheng Lin          2026-07-09  407  	 * On GuC firmware 70.66 and above, use the Feature KLV (shared with the
73c5a253068e8c Shuicheng Lin          2026-07-09  408  	 * WA KLV buffer); older firmware uses GUC_CTL_DISABLE_MULTI_QUEUE in
73c5a253068e8c Shuicheng Lin          2026-07-09  409  	 * the init params instead.
73c5a253068e8c Shuicheng Lin          2026-07-09  410  	 */
73c5a253068e8c Shuicheng Lin          2026-07-09 @411  	if (!xe_configfs_get_enable_multi_queue(to_pci_dev(gt_to_xe(gt)->drm.dev)) &&
73c5a253068e8c Shuicheng Lin          2026-07-09  412  	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 66)) {
73c5a253068e8c Shuicheng Lin          2026-07-09  413  		u32 data = 1;
73c5a253068e8c Shuicheng Lin          2026-07-09  414  
73c5a253068e8c Shuicheng Lin          2026-07-09  415  		guc_waklv_enable(ads, &data, 1, &offset, &remain,
73c5a253068e8c Shuicheng Lin          2026-07-09  416  				 GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
73c5a253068e8c Shuicheng Lin          2026-07-09  417  	}
73c5a253068e8c Shuicheng Lin          2026-07-09  418  
d6da81a4785ca6 Badal Nilawar          2024-04-05  419  	size = guc_ads_waklv_size(ads) - remain;
d6da81a4785ca6 Badal Nilawar          2024-04-05  420  	if (!size)
d6da81a4785ca6 Badal Nilawar          2024-04-05  421  		return;
d6da81a4785ca6 Badal Nilawar          2024-04-05  422  
d6da81a4785ca6 Badal Nilawar          2024-04-05  423  	offset = guc_ads_waklv_offset(ads);
d6da81a4785ca6 Badal Nilawar          2024-04-05  424  	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
d6da81a4785ca6 Badal Nilawar          2024-04-05  425  
d6da81a4785ca6 Badal Nilawar          2024-04-05  426  	ads_blob_write(ads, ads.wa_klv_addr_lo, lower_32_bits(addr_ggtt));
d6da81a4785ca6 Badal Nilawar          2024-04-05  427  	ads_blob_write(ads, ads.wa_klv_addr_hi, upper_32_bits(addr_ggtt));
d6da81a4785ca6 Badal Nilawar          2024-04-05  428  	ads_blob_write(ads, ads.wa_klv_size, size);
d6da81a4785ca6 Badal Nilawar          2024-04-05  429  }
d6da81a4785ca6 Badal Nilawar          2024-04-05  430  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013C327C05
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486931; cv=none; b=ru/Pm9rEB8EWsInrmqtLke2c7Q1e6jz3SryqPBZWwlRCUU/vb8aW88Ujqmug7D7X7v4dsVvR3KmPuTZA1oBV50xif+ELm9h+t2ZvwXo3k0lvlICQMuDSipDJkYMW7i1nJX9aHkRlf25bpQjIXcvwqyzQNyVpNbYsmQT9/sBS0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486931; c=relaxed/simple;
	bh=Zl3DLikOUaSkMZDwzRtV+vV58vCVc0wDQtThvjsLAEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hFCBMyoZJc8HvcFPkWpEM80HQLdNQdzCoaRXoh1cS/3SkzQNgdFuo/WpLz56e+eg92tycFmOz2RzeF2OzDyrZP1PVdQl3EusRuVQEtBBnD64XVMVBtEZtUxP7eu5/JucfzP/CRanFYzSP53/h/kpEg8jJVif/ZCSXP/IXiE2DAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjVWRMIE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjVWRMIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768486929; x=1800022929;
  h=date:from:to:cc:subject:message-id;
  bh=Zl3DLikOUaSkMZDwzRtV+vV58vCVc0wDQtThvjsLAEc=;
  b=ZjVWRMIElI6M0jhN0/K+rmk5IisO6OegXODgCcH1jukJF+m9heF6Blyd
   C3gyDdiRbbiLe6CogOpCpeiIxYfYV/ZYzlPib0tEY2jnbQqKLuSTtCwiY
   49JR4okFOgSb5FCa73yUjhpplsQ5xA/aeBwXPbP/iAFkJo8dkjouDPaXP
   SVDnh9Bb3Mjp7jVAnC387YEYJpznhWoM6aciUclDUWP6ljxld5oTt4/77
   kl2t7DDhca22Lao/ypddBYEy7jaIk2t35SaKIDvgImBHVpSGVvsO/UMMp
   OW6ACvH6a4dsV1H4qHQKhF58lduJxA+VWL8v8LYRgO3JYXub0yaX4Fsow
   g==;
X-CSE-ConnectionGUID: DK3h3xaIRYuPow4qThUiVg==
X-CSE-MsgGUID: mj5/3tY2QkWskIKc29UnvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80514433"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80514433"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:22:09 -0800
X-CSE-ConnectionGUID: I8tOy+ogTSmLBuQZ+GYdlw==
X-CSE-MsgGUID: ZlP/BleXSTuHp8jXJFKgAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="235674724"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 06:22:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgOEf-00000000I3K-3iyT;
	Thu, 15 Jan 2026 14:22:05 +0000
Date: Thu, 15 Jan 2026 22:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5562/6771]
 drivers/interconnect/icc-kunit.c:322:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601152219.wp7TKZXT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/interconnect/icc-kunit.c:322:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Kuan-Wei Chiu" <visitorckw@gmail.com>
CC: Georgi Djakov <djakov@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9b7977f9e39b7768c70c2aa497f04e7569fd3e00
commit: 06ebbe719bb022795cd9def0606a6805b1f2f755 [5562/6771] interconnect: Add kunit tests for core functionality
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r132-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152219.wp7TKZXT-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152219.wp7TKZXT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601152219.wp7TKZXT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/interconnect/icc-kunit.c:322:1: sparse: sparse: bad integer constant expression
   drivers/interconnect/icc-kunit.c:322:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/interconnect/icc-kunit.c:323:1: sparse: sparse: bad integer constant expression
   drivers/interconnect/icc-kunit.c:323:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/interconnect/icc-kunit.c:324:1: sparse: sparse: bad integer constant expression
   drivers/interconnect/icc-kunit.c:324:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/interconnect/icc-kunit.c:324:1: sparse: sparse: bad integer constant expression
   drivers/interconnect/icc-kunit.c:324:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +322 drivers/interconnect/icc-kunit.c

06ebbe719bb022 Kuan-Wei Chiu 2026-01-10  321  
06ebbe719bb022 Kuan-Wei Chiu 2026-01-10 @322  MODULE_AUTHOR("Kuan-Wei Chiu <visitorckw@gmail.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

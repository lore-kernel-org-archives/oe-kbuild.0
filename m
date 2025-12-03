Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884F12ED848
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 10:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764757954; cv=none; b=SFtFtSCVENMP4e/lenU9yawsClSqviF9wGr6tIdYkbkRq1+66lV7QoNyn/Af/MA0LrzGMg9+jAo8YQIlvqH4zKwFUdli7ETZGIyXGwbD2ccFDe/5zp9Cjht9/fNsClxfxNLaIkMJmZcbCIXDHTQMkgofs0ufFyddw+iCvjefFug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764757954; c=relaxed/simple;
	bh=YDODHGwmAgIlX5gpsn+Ti8QZfiKFq45OK6SWROE6xZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FrepjOJcnCucTGqVdPlKdf38OMF9t7S9eb16I2dM1wGXrM5F1zHVZ6YSxDe03TEO4q9A0S/mrFjVOTQzdFbuC6FUPXcQH6Dodm8jlulpQmxgIuwcgJf8rYKSS/DSXP66QfYwyP0PWrxLMNfcVsDpZtNRGaWb5DgRZxbpe7R6t1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAEQqqUh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAEQqqUh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764757952; x=1796293952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YDODHGwmAgIlX5gpsn+Ti8QZfiKFq45OK6SWROE6xZ4=;
  b=UAEQqqUhbji0G54KBURvQ8KTx/XbbNI8+5vrgijLiuo00H/a7cGrj4wR
   eu3qveLjZ624UJvbudDBPQTJJIOJAIYAerbCpn/OyWY2RFiw2iTPI09GU
   8MjLfIvDVwaAaxNDBWhgxKPmg4wauw+kQweH3OUcLpyS3T3y8XGFRmbuZ
   FNua6vbhqaz7J+rlTX0bSc6nPavjqQXJ/+mHGWSZe5nW0o0jMVEXpkLnK
   OMYAbzMSmTz4l+SJIzyG1w0NEnmpCaiGpmbb7/yyXw0UMFX6LmLjOx5jR
   IZkoUeHDsXOpIQRfrZ3iEOwG/Lo30A3nbzO7azBb8Y3+t3/AS8lUsaFc3
   g==;
X-CSE-ConnectionGUID: QPmvdUggRZuLBpJXgxQjjQ==
X-CSE-MsgGUID: mpGzJ9KtTpu62r7JZGgmew==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66638491"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66638491"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 02:32:31 -0800
X-CSE-ConnectionGUID: kRWZgzLvQESNEG3qppeVQg==
X-CSE-MsgGUID: ACG2ZBgcQ+OcIxaOGYlJRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199124650"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Dec 2025 02:32:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQk9s-00000000AsZ-15Gp;
	Wed, 03 Dec 2025 10:32:28 +0000
Date: Wed, 3 Dec 2025 18:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0609]: no field `acpi_match_table` on type
 `bindings::device_driver`
Message-ID: <202512031842.X5fI5Tyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "arm-randconfig-r121-20251201 results in various rust failures"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Igor Korotin <igor.korotin.linux@gmail.com>
CC: Danilo Krummrich <dakr@kernel.org>

Hi Igor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
commit: 8411e6f06a022679a642c236724944057b90e60e rust: platform: Add ACPI match table support to `Driver` trait
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031842.X5fI5Tyk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031842.X5fI5Tyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512031842.X5fI5Tyk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `acpi_match_table` on type `bindings::device_driver`
   --> rust/kernel/platform.rs:51:34
   |
   51 |             (*pdrv.get()).driver.acpi_match_table = acpi_table;
   |                                  ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

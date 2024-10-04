Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4CA1C302A
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Oct 2024 16:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728059191; cv=none; b=MCFPkhikgNj0LovmUSKd4DVLlHeu7hD7sqcA/z2GL1uguGVYXIU1Cok1TdXQiQlZarkB9l6G6hcVyY7OejJNvxjWVssnx8nqm/CODs9VEyR+BWM7OdMCE9cZL/ZPH0BIwt7+rSgx/HMZ+SbXBoyS8a1cGb6CgZRM6BY4E1DrSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728059191; c=relaxed/simple;
	bh=3aUlpAxETHsDvkl4kAiuS801K08LQq7Pok4wj+Qk08s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MeltziIukpFx82+zX8zkLnRdNcBnMqhXAXw76y2U5Bnnl2xt+JgzT4iKZLe9IeGu1Qp11/+obS6PTml6XjlcG12H5EtuRwgX9+YqT7azZ0w8K23YpaFHG0WYWVCQzQREKPR0oOksLIYO60TDZ0wijo8Z3R9feQNEnD0KIv1aNrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkZTKcmz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkZTKcmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728059190; x=1759595190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3aUlpAxETHsDvkl4kAiuS801K08LQq7Pok4wj+Qk08s=;
  b=kkZTKcmzZobao3h5d9fJdin3AyEdVzWgnehJrizAn8zV2S3SAo5jS6bx
   aMoT4XzL8vGQ9s3W4JTeuWPxDOm9xHU0c3eqXUfRILkPwRBlQi1CDK4iu
   Cd8oOQiIaOOyK+pp6eayIHR/ZueTiY9TrUWq6ow825oE61qwivHJpYzru
   GeJRJI9rFHpWJkgq5J6o8OFjebd+Y9vVsmINVfWaHcgiJ7L8ylIalvRaB
   orH+/oQWp/KdOMJ5w9zlWwSFkuRksMFC+0BjfIsnG5aqWqpSVKHzcAD9m
   W9VYCeXoO81v5erSQkbyiRcwDva2R2L86qy54Fd9NsjaF3pkn6sBhfRvv
   g==;
X-CSE-ConnectionGUID: lhTGB89KQiqB9Ro2mFRq3Q==
X-CSE-MsgGUID: E2fsK3CdT8iOQ+kz/EukpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38681769"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="38681769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 09:26:29 -0700
X-CSE-ConnectionGUID: U6jxV+vnQ0G3va3zjVNFnA==
X-CSE-MsgGUID: mgFeIX4AQx2iJQW0cjFCNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79585315"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Oct 2024 09:26:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swl8L-0001tw-3B;
	Fri, 04 Oct 2024 16:26:25 +0000
Date: Sat, 5 Oct 2024 00:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/md/dm-verity-target.o: warning: objtool:
 verity_ahash_update.isra.0+0x110: unreachable instruction
Message-ID: <202410050030.IvNRGqkf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@kernel.org>
CC: Mikulas Patocka <mpatocka@redhat.com>
CC: Sami Tolvanen <samitolvanen@google.com>

Hi Eric,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0c559323bbaabee7346c12e74b497e283aaafef5
commit: b76ad8844234bd0d394105d7d784cd05f1bf269a dm-verity: hash blocks with shash import+finup when possible
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241005/202410050030.IvNRGqkf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050030.IvNRGqkf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410050030.IvNRGqkf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-verity-target.o: warning: objtool: verity_ahash_update.isra.0+0x110: unreachable instruction


objdump-func vmlinux.o verity_ahash_update.isra.0:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

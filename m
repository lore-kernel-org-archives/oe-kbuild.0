Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123B125C838
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Jul 2025 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753771742; cv=none; b=Y69g/WnZAITVrM53dVqARvqFLr8+C4ySv3acmtgH5aymoSWfl5ZvZd8Hwb1vk5Jrg1dc4jD2vwQhP7PsjHmdReczvepI/a3xzDj61PFp7QC9tnY3h6oTBnHGzolHjyMFfedZH4J69tlK/VxUdbiinjT9MARF4rJqfGhHKTQU1Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753771742; c=relaxed/simple;
	bh=t3cdJNSL+SvqyfgPMYffyG5VE1FKPmD+3oAYS44HePE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLHIGn9JluVAGTevEFxqH3Gp9ctuvvzHNEYuvTtDX3y11BOX4f4VyFTTtbdcpLaLMw+Yd0Yn/UzuAvDMdv5CjaY8EGrMq0B3GR81flQiQuomvhmvDLZVvBSjF36q6DB2Y94U+TKs5s1VpnmFFf3DQXyI0Ro9gJewOFJ+oUHv4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WuJENBd8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuJENBd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753771738; x=1785307738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t3cdJNSL+SvqyfgPMYffyG5VE1FKPmD+3oAYS44HePE=;
  b=WuJENBd8ygLMZwHhQWqL23RmygAZPpvUHcpbUKMOCgiOP2LHL2oxn/rA
   7IrtBXbmXCTNvrQj/0hPp0wRxh46v5QEttuaLg8l1px2LrbT4iYclZ355
   /th5KVFZE8YWza48YNc5jOaF9SCUie+agFfMb+OfC2ELyslOgI3nFverh
   nc1s3ICASdVZi5K6dGMZ13nhFfk5GUQJ7pTnC/E9cyZdvQsAUavJ4VeKf
   GPJyN5GKrHLUJsyRGGwsD5+JUotNlZLJTdWiyBxU6Eh5e4uPrK16SZHTJ
   nzt8OVRmdAjtHIaULqquIpf6InIYhs+Io34gf2Ph1AzJ8iSVqOMBmZ6Av
   A==;
X-CSE-ConnectionGUID: Tkzmi55ORAyxaIUdRS9P8w==
X-CSE-MsgGUID: uAOsawwqQi260I0otehz7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="58655197"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="58655197"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 23:48:49 -0700
X-CSE-ConnectionGUID: t2PPLGqgQX634Ti8VRuIQw==
X-CSE-MsgGUID: FpVV5wjrTBuo69cwUFC0uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="199760576"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Jul 2025 23:48:45 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uge8h-00014F-0H;
	Tue, 29 Jul 2025 06:48:43 +0000
Date: Tue, 29 Jul 2025 14:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] docs: kernel-doc: avoid script crash on ancient
 Python
Message-ID: <202507291457.dhHVzTFU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <dc75423e817f92cc6b8369892ee79166c2fb5ecc.1753713955.git.mchehab+huawei@kernel.org>
References: <dc75423e817f92cc6b8369892ee79166c2fb5ecc.1753713955.git.mchehab+huawei@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Linux Doc Mailing List <linux-doc@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-kernel@vger.kernel.org

Hi Mauro,

kernel test robot noticed the following build errors:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on next-20250728]
[cannot apply to linus/master v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/docs-kernel-doc-avoid-script-crash-on-ancient-Python/20250728-225529
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/dc75423e817f92cc6b8369892ee79166c2fb5ecc.1753713955.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH 1/2] docs: kernel-doc: avoid script crash on ancient Python
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm-randconfig-001-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291457.dhHVzTFU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291457.dhHVzTFU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507291457.dhHVzTFU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: Python 3.6 or later is required by kernel-doc. skipping checks
--
>> Error: Python 3.6 or later is required by kernel-doc. skipping checks

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

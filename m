Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E251E495
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Sep 2024 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726319162; cv=none; b=f3IMcjWluet7ZJzrmAL6FtxjaER+cFdTAfoCcCMKMqgd9Fk54G1f+dvi7e+JhlX5pAVr6MTRiQa7TYYAjgNR8i+NFr8RRwO0RQnxfdj+D97IEJ3egiPYrnxk8PJo5Vci7F4CFs4R1tLMRaIddGTdEsGJMqS4w221yoaFGM8zJaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726319162; c=relaxed/simple;
	bh=3ATjO2wXm3PJTaGPWIkZUYJ7DRK4jvx70ndbVmAS5Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n84dPVZHeOTcweU6y42tlBbj/XWAr7xRUYhyMplHXUI2NbyhqcLgXQdvCzmkh9tDVFWSrEUl6YWbU0Sm5ICjSVzHFMYgLiT9cEbo1lEBRgAHOTIWidu5/NhGjfdyn5OUku4e2UZ2aAVVn8R5UMg4z1QboSBSLFumiDMEFNEBmvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmtsLnfo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmtsLnfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726319160; x=1757855160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ATjO2wXm3PJTaGPWIkZUYJ7DRK4jvx70ndbVmAS5Qg=;
  b=QmtsLnfoatsL+z0mpgj3QcMJaRZpSXh7HoylZto7vj81tXqLC5l3MTAU
   iRde9SnsGsVTeMMaTPwuzqhuNqeqPYa945Q8DpsrfNtRCdmvNS2U2UQqq
   SvzRbjUS65HOjWef8SRL0al+GfiKDeseWMKzb8lhOMEm81IUxW9w8jhMk
   TqwAopc4HEFr8Yba+vsC3l7Ia4CNk3JKnRDGbB3hR4jvZbyDkW8FVDLtq
   UA8EqkCsO4MStes1rd9E5Mpm+tog6/bZjzzsA+EpkX5z5rD6zxDAee81i
   aTewq4oKfYBLEedyZo1hf6S3g0cAIq8HPaVUXmOJebnzxgZ0VSApj+aNs
   g==;
X-CSE-ConnectionGUID: akFtiwHxRVyIy7HUcMW8IA==
X-CSE-MsgGUID: C4j+fMDTTVip4GGigpPLGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="28127889"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="28127889"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 06:06:00 -0700
X-CSE-ConnectionGUID: 1879jaVXTxeo1XqunnxwZQ==
X-CSE-MsgGUID: vGEDpb9XRH6eOMa1Lv105w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="99249104"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Sep 2024 06:05:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spSTN-0007l2-0S;
	Sat, 14 Sep 2024 13:05:57 +0000
Date: Sat, 14 Sep 2024 21:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 10/13] selftests: ncdevmem: Use YNL to enable
 TCP header split
Message-ID: <202409142047.UOZ425m7-lkp@intel.com>
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
In-Reply-To: <20240912171251.937743-11-sdf@fomichev.me>
References: <20240912171251.937743-11-sdf@fomichev.me>
TO: Stanislav Fomichev <sdf@fomichev.me>
TO: netdev@vger.kernel.org
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: Mina Almasry <almasrymina@google.com>

Hi Stanislav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/selftests-ncdevmem-Add-a-flag-for-the-selftest/20240913-011631
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240912171251.937743-11-sdf%40fomichev.me
patch subject: [PATCH net-next 10/13] selftests: ncdevmem: Use YNL to enable TCP header split
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142047.UOZ425m7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409142047.UOZ425m7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ncdevmem.c:35:
>> tools/testing/selftests/../../../tools/net/ynl/generated/ethtool-user.h:23:43: warning: declaration of 'enum ethtool_header_flags' will not be visible outside of this function [-Wvisibility]
      23 | const char *ethtool_header_flags_str(enum ethtool_header_flags value);
         |                                           ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

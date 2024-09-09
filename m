Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C361BC44
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725898353; cv=none; b=iDn9WH4L4ymWt5zrgsxyHpZh7+u1HtiXt29PnZkVcbCp7RlYmO7r5/NirkplLJ1w5HbquNbTR4iz4bLY2LqxpLXusUtB8rOe15Uf8Yz4fa0tl1OoMdPsP+Vs32KhkVrC8GH1/a9/StHh85RF4AZ4paDzfZeZKSmvgsssNxzaiBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725898353; c=relaxed/simple;
	bh=LFChYDyn25zgsL2QYiRuOPiEPLgsiDfOHyvscaiiYjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B5aJ4/e388BnGTtL4dPXdEcLEOCmoztqaye9oUCmGYu6M/TG9aki4XNfDL66SBUaPC9eloNOvbsMDd7+ciYwF6diKdz8tURFxqOcyYdD0Yt4xrh5WuSdHBCjLjAfDx3FdNx2jWMj4xhHUteXzLdAWQNWz9tSCzRIV9WYIKp0xiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqCMnVu1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqCMnVu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725898352; x=1757434352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LFChYDyn25zgsL2QYiRuOPiEPLgsiDfOHyvscaiiYjE=;
  b=WqCMnVu14t2wweQKl6Hee5vdBq36n9+FtlqJD/0iuufWT9By8ozxAZw0
   cGvm8M0BBb4TWL/f7tB+q7Fgu5uY4VcosvYMt/wSfhVWU3sALuxgcNwMm
   WIs/Ciq0yvmoKZ7V8H7sFXKJB40yfwm+M/hauM6rIygvOfCUj+NsejDWL
   omKxcbDOd6xZg78UC9Y4IgPvPbZCBmFg/nmBzls2ESHRsD6UisigvZGFL
   iSPlNcLq1WoYsKklPtzqNyq/qYqFijjoI+7Rev18BXN41Ti1qRhYLie2i
   D59mprAVHWu3eqdzpRK3Twek78stEogkLkik06b5dMbU62QZ4+OP6IjFM
   Q==;
X-CSE-ConnectionGUID: uP3amW5SRjKnfogng/LKYQ==
X-CSE-MsgGUID: yfQ6dUKlRpmvD0+Qvwgm4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35273669"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="35273669"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:12:31 -0700
X-CSE-ConnectionGUID: EiH7icsjTwWoFeYkWixLXQ==
X-CSE-MsgGUID: l/QimroeTZ+hDd1KASWKew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="67020199"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2024 09:12:30 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snh08-000Ew8-1B;
	Mon, 09 Sep 2024 16:12:28 +0000
Date: Tue, 10 Sep 2024 00:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] lib/math: Add int_pow test suite
Message-ID: <202409100048.AlSEgWYn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/math/tests/int_pow_kunit.c:22:18: sparse: sparse: decimal constant 9223372036854775808 is too big for long long"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240908224901.78595-1-luis.hernandez093@gmail.com>
References: <20240908224901.78595-1-luis.hernandez093@gmail.com>
TO: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
TO: brendan.higgins@linux.dev
TO: davidgow@google.com
TO: rmoar@google.com
CC: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
CC: linux-kselftest@vger.kernel.org
CC: kunit-dev@googlegroups.com
CC: skhan@linuxfoundation.org
CC: linux-kernel-mentees@lists.linuxfoundation.org

Hi Luis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.11-rc6]
[also build test WARNING on linus/master next-20240909]
[cannot apply to akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Felipe-Hernandez/lib-math-Add-int_pow-test-suite/20240909-065058
base:   v6.11-rc6
patch link:    https://lore.kernel.org/r/20240908224901.78595-1-luis.hernandez093%40gmail.com
patch subject: [PATCH v4] lib/math: Add int_pow test suite
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-121-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100048.AlSEgWYn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100048.AlSEgWYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409100048.AlSEgWYn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/math/tests/int_pow_kunit.c:22:18: sparse: sparse: decimal constant 9223372036854775808 is too big for long long
   lib/math/tests/int_pow_kunit.c:22:18: sparse: sparse: decimal constant 9223372036854775808 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +22 lib/math/tests/int_pow_kunit.c

207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  12  
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  13  static const struct test_case_params params[] = {
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  14  	{ 64, 0, 1, "Power of zero" },
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  15  	{ 64, 1, 64, "Power of one"},
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  16  	{ 0, 5, 0, "Base zero" },
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  17  	{ 1, 64, 1, "Base one" },
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  18  	{ 2, 2, 4, "Two squared"},
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  19  	{ 2, 3, 8, "Two cubed"},
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  20  	{ 5, 5, 3125, "Five raised to the fifth power" },
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  21  	{ U64_MAX, 1, U64_MAX, "Max base" },
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08 @22  	{ 2, 63, 9223372036854775808, "Large result"},
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  23  };
207234cb29fdc9e Luis Felipe Hernandez 2024-09-08  24  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

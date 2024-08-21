Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85C1A2840
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Aug 2024 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224158; cv=none; b=qIB8CeciTWb9JKfELZYKgKlKQvQyHHNLNgQwfbglPxWa5WuQIZ9mIBOuqyP3uWy1GuW3HB3tTJp4svUpltp4L63WUw2DpxD8CmgFVNTljSbyab5gl3zG/3K74fNgqvfiS9kvYKlaRKgZWKUhgscjxMBNuDYh0Hy/B+vREtk1chg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224158; c=relaxed/simple;
	bh=3DucCyCQem4mnyY/lqxSyh5TxxG+0IdiE6+IBiwh+/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0885EoRcL/LOL9vC4TqNlLNp6FIv9bOGI2BLLdh9+n5DhCFPizADEJtyUbPe92DUA8Z0ybDJG5HiqHSI78KOymh2kDwVXp70TUktquLsCNgli+99yTzSfp5hHWR4er5p4UwT2g71x42/EcED0ZRQJdr2UWKvTMaNNcEWByWXpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDbNJB/V; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDbNJB/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724224156; x=1755760156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3DucCyCQem4mnyY/lqxSyh5TxxG+0IdiE6+IBiwh+/0=;
  b=EDbNJB/V1z+Mq/iBX7tsoNmgE+TlSQPgyCUe4YJQBhGj3MVAqhvP38Cx
   CuzVjlagtcyQJZWhJZihnkN9+jPHHWouCNImlvRSKLu199mcAkouN9Fep
   s+wRlsYGmaQNB9HRVlwOXkB46LL5ORmDB6uoYI/6WU4ge45iykGBuk98D
   SLF9Ssr4yWsmipxlhjCSBgQp+pWsbrM3QWFE2STex9ty4D7yMWhyKDq3M
   zn0lj6cpiN1lK76EgLH+aRHOsiC+mJw56DWQVDghjE0ltjSQaAPy0Efhg
   de/YjdOKIClG9VsU+/aV7+h8hB6pK+WJx3n9aFntjMolG/FhQL6vb6S31
   w==;
X-CSE-ConnectionGUID: bf8TBH4GT1is9EfhtMmVoQ==
X-CSE-MsgGUID: WGS9VOt+S0GZWQjKbLYwlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22698592"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22698592"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 00:09:16 -0700
X-CSE-ConnectionGUID: wy6h8oqHSFKhKNTicr8AHw==
X-CSE-MsgGUID: gujsUUm/S9O1f0VJ+DqCYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="60718492"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2024 00:09:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgfSz-000B1C-0U;
	Wed, 21 Aug 2024 07:09:13 +0000
Date: Wed, 21 Aug 2024 15:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/6] mm: selftest to verify zero-filled pages are
 mapped to zeropage
Message-ID: <202408211408.L2BFUig9-lkp@intel.com>
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
In-Reply-To: <20240819023145.2415299-4-usamaarif642@gmail.com>
References: <20240819023145.2415299-4-usamaarif642@gmail.com>
TO: Usama Arif <usamaarif642@gmail.com>

Hi Usama,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-free-zapped-tail-pages-when-splitting-isolated-thp/20240819-103336
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240819023145.2415299-4-usamaarif642%40gmail.com
patch subject: [PATCH v4 3/6] mm: selftest to verify zero-filled pages are mapped to zeropage
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211408.L2BFUig9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408211408.L2BFUig9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vm_util.c:175:15: error: conflicting types for 'rss_anon'; have 'long unsigned int(void)'
     175 | unsigned long rss_anon(void)
         |               ^~~~~~~~
   In file included from vm_util.c:11:
   vm_util.h:42:10: note: previous declaration of 'rss_anon' with type 'uint64_t(void)' {aka 'long long unsigned int(void)'}
      42 | uint64_t rss_anon(void);
         |          ^~~~~~~~


vim +175 tools/testing/selftests/mm/vm_util.c

642bc52aed9c99e tools/testing/selftests/vm/vm_util.c Muhammad Usama Anjum 2022-04-28  174  
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19 @175  unsigned long rss_anon(void)
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  176  {
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  177  	unsigned long rss_anon = 0;
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  178  	FILE *fp;
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  179  	char buffer[MAX_LINE_LENGTH];
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  180  
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  181  	fp = fopen(STATUS_FILE_PATH, "r");
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  182  	if (!fp)
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  183  		ksft_exit_fail_msg("%s: Failed to open file %s\n", __func__, STATUS_FILE_PATH);
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  184  
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  185  	if (!check_for_pattern(fp, "RssAnon:", buffer, sizeof(buffer)))
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  186  		goto err_out;
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  187  
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  188  	if (sscanf(buffer, "RssAnon:%10lu kB", &rss_anon) != 1)
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  189  		ksft_exit_fail_msg("Reading status error\n");
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  190  
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  191  err_out:
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  192  	fclose(fp);
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  193  	return rss_anon;
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  194  }
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

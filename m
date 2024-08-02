Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3DE1849
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Aug 2024 04:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722572287; cv=none; b=hojPkSFyPLGidYH5ZYAzIJVRquvrZ7EvznQWVFZZtf3hB90I54NDmoG9er1lQXSDyNU5BhbjrvijpMZHNJvVTHtWxA3UxABCrJdvob+Qq7Y5ippGg6Or5UI349Kuebd00k1sEPppXrOpJA05ijNW/ZwTx7qchYZue6wxLIbFXDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722572287; c=relaxed/simple;
	bh=2quG+dlW3lY6jrJOIsKVe+sYU+z7GJ7KaE6T4VoDeGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=td55pP4f1/uEVyyyMLqDpwCbTaWXIz4EWqbgToXSV9Xkk184imnL0HoAfZMPF68kel2jEu7BQQZ4P5fOWhdYA3QjdCInQk4rLw4AFIAA5YO3txOz0JGiRN+2JNYDs1Cn/srIobciJJn/OJuha4W0rGv/l+c0b2/GyAnr72F4WJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zetjwxtl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zetjwxtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722572283; x=1754108283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2quG+dlW3lY6jrJOIsKVe+sYU+z7GJ7KaE6T4VoDeGU=;
  b=ZetjwxtlyvbzBFhFb6iuEYU0WtxrzL00WOSMSOilaBreiOYuQP70mZdX
   5Y3tL7hroNaZW1Vlgx7eoM1quSylbeKCgUpbaGBPR7DcI420/GopjbBci
   oGXvgykGT+aKWUq5+x3aOZNbPxQFd7ay0s2S+xzZXRsd0D4wBzdb1b9bo
   J23noAT6BzvHl0U0WwlamxCYv1hl+niE1aRmJnSAavbqnQ536jJ0sj+3/
   Vb00ojMxFX+MT12YzuDK95M277FvdJca+T0qJlajl1JVuKoyAmP3Q3dhX
   xcwp544fOPYguiIhGhfdtBs01nSgunCeDQnQJLbDApOWqn6v1UBd44xIH
   w==;
X-CSE-ConnectionGUID: LZWZ2k/YQnm2Y3saYEmURg==
X-CSE-MsgGUID: H7fY/8J0R5SkhuHVpZ1Mng==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20388908"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="20388908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 21:18:02 -0700
X-CSE-ConnectionGUID: nPhmkHTkQYalfzQwZKpJ3g==
X-CSE-MsgGUID: NTxkTilzTLWQrg0e0b1Z4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="55184840"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Aug 2024 21:18:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZjjp-000wLx-2t;
	Fri, 02 Aug 2024 04:17:57 +0000
Date: Fri, 2 Aug 2024 12:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/6] mm: add selftests to split_huge_page() to verify
 unmap/zap of zero pages
Message-ID: <202408021131.OcDZmjjR-lkp@intel.com>
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
In-Reply-To: <20240730125346.1580150-6-usamaarif642@gmail.com>
References: <20240730125346.1580150-6-usamaarif642@gmail.com>
TO: Usama Arif <usamaarif642@gmail.com>
TO: akpm@linux-foundation.org
TO: linux-mm@kvack.org
CC: hannes@cmpxchg.org
CC: riel@surriel.com
CC: shakeel.butt@linux.dev
CC: roman.gushchin@linux.dev
CC: yuzhao@google.com
CC: david@redhat.com
CC: baohua@kernel.org
CC: ryan.roberts@arm.com
CC: rppt@kernel.org
CC: willy@infradead.org
CC: cerasuolodomenico@gmail.com
CC: corbet@lwn.net
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: kernel-team@meta.com
CC: Alexander Zhu <alexlzhu@fb.com>
CC: Usama Arif <usamaarif642@gmail.com>

Hi Usama,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/Revert-memcg-remove-mem_cgroup_uncharge_list/20240730-223949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240730125346.1580150-6-usamaarif642%40gmail.com
patch subject: [PATCH 5/6] mm: add selftests to split_huge_page() to verify unmap/zap of zero pages
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408021131.OcDZmjjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408021131.OcDZmjjR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vm_util.c:188:41: warning: format specifies type 'long *' but the argument has type 'uint64_t *' (aka 'unsigned long long *') [-Wformat]
     188 |         if (sscanf(buffer, "RssAnon:%10ld kB", &rss_anon) != 1)
         |                                     ~~~~~      ^~~~~~~~~
         |                                     %10lld
   1 warning generated.


vim +188 tools/testing/selftests/mm/vm_util.c

642bc52aed9c99 tools/testing/selftests/vm/vm_util.c Muhammad Usama Anjum 2022-04-28  174  
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  175  uint64_t rss_anon(void)
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  176  {
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  177  	uint64_t rss_anon = 0;
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  178  	FILE *fp;
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  179  	char buffer[MAX_LINE_LENGTH];
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  180  
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  181  	fp = fopen(STATUS_FILE_PATH, "r");
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  182  	if (!fp)
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  183  		ksft_exit_fail_msg("%s: Failed to open file %s\n", __func__, STATUS_FILE_PATH);
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  184  
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  185  	if (!check_for_pattern(fp, "RssAnon:", buffer, sizeof(buffer)))
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  186  		goto err_out;
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  187  
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30 @188  	if (sscanf(buffer, "RssAnon:%10ld kB", &rss_anon) != 1)
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  189  		ksft_exit_fail_msg("Reading status error\n");
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  190  
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  191  err_out:
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  192  	fclose(fp);
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  193  	return rss_anon;
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  194  }
15bd39f288be91 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-07-30  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

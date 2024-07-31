Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A590916D4D2
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 23:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722467292; cv=none; b=vGbZMg7zj5UKMC5eEvTgp+V3hnzEZGX3UpCjovgwFbQ7zQySngjO3rtF0ZQdhspbZ/qWG1iru42tHIUV1ZUP26Uy2xBMR4oWgRvwvP8DwYYYE5MmEd9bC6pv5zYmJoVKkcw83woP2MOVyMzS4YabrwnV1xAkO/kixzI4s+Xk3RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722467292; c=relaxed/simple;
	bh=nIrZKW3ycswsSFJC+5m9wiNq9FDY4cD63xPWbNYZFBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uGTv2mlL1/Za8yYFI5FNpBRIQgh1B+K9QQ9qUftrpi1uh+LKBEdEpb71txiElOi9AiMZTdhghF5+q2n6i2ep90fzvlDzxxlbgA+6VJbz8oSfwnyCgzoeMwq09FFwL3+s9DVI7Iv5HTHARAvGCwMG7iBE3IA5FERTF7y+v1/20BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaOyuAFc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaOyuAFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722467290; x=1754003290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nIrZKW3ycswsSFJC+5m9wiNq9FDY4cD63xPWbNYZFBM=;
  b=eaOyuAFc27xYO61Vn9YlB5Mkdidwf417xVEBLAypK5U+Fg39mPw8Qwcm
   DP/OBgdQOGq0b/E2XaWrfm0uE5zeBYALh/N6bi9E5ihSN9rkceh4xRsDW
   uRP7lzEW4aR5ZApKmWp3LObYh3Q+wpdqggAqmuEF0c1XKJTuCvSbYitKx
   LtDTiIx/gBaYudOYzmFVVbXFzFCg/gWNJkuAlysCV6ii0nPx5I3e3v0KJ
   NJyjKIPqjP+LT/nb4AecwZPoX49Eb1RyOhOEtoas1NmxJ0ZxzL/+lb80k
   Bw05hp98GVSabJoFQN2lsTCFyVI5RJKnl9hfvLoHkGijsjkpOcGHKbuMp
   w==;
X-CSE-ConnectionGUID: CVa3S/QIRdORykvQtGIiGQ==
X-CSE-MsgGUID: gMVJ0LXQQu6OsUZn+N7hZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20228278"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="20228278"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 16:08:06 -0700
X-CSE-ConnectionGUID: pckesBE1SoOgW+n7oujCOw==
X-CSE-MsgGUID: Tp8yd03ySL2LerrSWncx+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54527649"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Jul 2024 16:08:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZIQL-000uuU-1d;
	Wed, 31 Jul 2024 23:08:01 +0000
Date: Thu, 1 Aug 2024 07:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/6] mm: add selftests to split_huge_page() to verify
 unmap/zap of zero pages
Message-ID: <202408010618.lgnamdZd-lkp@intel.com>
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
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010618.lgnamdZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408010618.lgnamdZd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vm_util.c: In function 'rss_anon':
>> vm_util.c:188:41: warning: format '%ld' expects argument of type 'long int *', but argument 3 has type 'uint64_t *' {aka 'long long unsigned int *'} [-Wformat=]
     188 |         if (sscanf(buffer, "RssAnon:%10ld kB", &rss_anon) != 1)
         |                                     ~~~~^      ~~~~~~~~~
         |                                         |      |
         |                                         |      uint64_t * {aka long long unsigned int *}
         |                                         long int *
         |                                     %10lld


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

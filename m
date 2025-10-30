Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB0145329
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 03:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761796758; cv=none; b=pRlG6NKn2kOYgeDNLQcI/8LMIZeTOluJrSIL1S3FQCEVUusSqgQWcJWVT+SzW7XxEcR2amO1fOVWvdnOXG7Vcj5e+tWKRo0DfddAxZ6jyrDwSsxpvqjjHVfIPgOlkB3kX76clO4+UJoPGeBvX6vyYaZ3qKcNVHPKpuQr4z5CtIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761796758; c=relaxed/simple;
	bh=QEXlNiZq9XZcKZkG5g3YeJ8GZxFAgndFAwWD/2viGSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AA3CS5VTjccFnCObmoS77grZaLQb+vu+KHOlMtBIr0RgzQJb4WJy9bAxav3GSWXuiFYNtIE9uUNWGiyTaMCWWc2dwukMQhH9M7WSHkxeeghXjaQKvwhgg1/TLrteZ8koaZd15uPiDnY0qqOq87jTkDToDc57+fUtUw94WZ+GMmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8cZX228; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8cZX228"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761796755; x=1793332755;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QEXlNiZq9XZcKZkG5g3YeJ8GZxFAgndFAwWD/2viGSI=;
  b=S8cZX228ukT8sdmJ/1bBkPfbNcJoKu7T6lMXrRqQSDHWu4Qh0nXXXbWu
   KKEZ6eNw9AntFvJMXYK5AFH1iJIAPkKV8rS2Hc6LGfge36uJzJbmm7177
   y9zL0gLiN3DTP/V0ylCgU2hK42fquVXYhbjym+upBoI8On+duLf7kR0T+
   iEuIcnYDFqRXhVS0CQVPGws8k2igvsxhrcbSESoXrq8BIqGTOtfsAUATy
   9WGAk9R+YKnmxQGJ74jvZsgxeyAmnrGHGEaZhHmFn4kcaS4RjvKn7Jbst
   r8jmUg1pOA/x8adTAF19tMW5+6S+iy4QyqhKhdNkZE7aHb9xzeAQHgDvj
   g==;
X-CSE-ConnectionGUID: XKFmV1c3SmS0tDys+B90SA==
X-CSE-MsgGUID: Cjh1CTMfQNaYIsHvVtwf8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63135717"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63135717"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 20:59:13 -0700
X-CSE-ConnectionGUID: D0r9JcevSdubCKw9gBAjhA==
X-CSE-MsgGUID: d7oSDSTrQa6cRCvB6C7ZpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185933282"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Oct 2025 20:59:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEJn6-000LQs-1F;
	Thu, 30 Oct 2025 03:58:01 +0000
Date: Thu, 30 Oct 2025 11:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] mm/shmem.c:5153 setup_thp_shmem()
 error: strcpy() 'str' too large for 'str_dup' (1010102 vs 16384)
Message-ID: <202510301122.lv4kGlEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8894fa6a2898641fafc4ccaaa73f0078705a223e
commit: 8be4868c4f23d36ca7409bcd5492fb554933bb64 [3064/3064] mm: shmem: override mTHP shmem default with a kernel parameter
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251030/202510301122.lv4kGlEx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510301122.lv4kGlEx-lkp@intel.com/

smatch warnings:
mm/shmem.c:5153 setup_thp_shmem() error: strcpy() 'str' too large for 'str_dup' (1010102 vs 16384)

vim +5153 mm/shmem.c

70dd579afdffee Maíra Canal 2025-01-07  5141  
8be4868c4f23d3 Maíra Canal 2025-01-07  5142  static char str_dup[PAGE_SIZE] __initdata;
8be4868c4f23d3 Maíra Canal 2025-01-07  5143  static int __init setup_thp_shmem(char *str)
8be4868c4f23d3 Maíra Canal 2025-01-07  5144  {
8be4868c4f23d3 Maíra Canal 2025-01-07  5145  	char *token, *range, *policy, *subtoken;
8be4868c4f23d3 Maíra Canal 2025-01-07  5146  	unsigned long always, inherit, madvise, within_size;
8be4868c4f23d3 Maíra Canal 2025-01-07  5147  	char *start_size, *end_size;
8be4868c4f23d3 Maíra Canal 2025-01-07  5148  	int start, end, nr;
8be4868c4f23d3 Maíra Canal 2025-01-07  5149  	char *p;
8be4868c4f23d3 Maíra Canal 2025-01-07  5150  
8be4868c4f23d3 Maíra Canal 2025-01-07  5151  	if (!str || strlen(str) + 1 > PAGE_SIZE)
8be4868c4f23d3 Maíra Canal 2025-01-07  5152  		goto err;
8be4868c4f23d3 Maíra Canal 2025-01-07 @5153  	strcpy(str_dup, str);
8be4868c4f23d3 Maíra Canal 2025-01-07  5154  
8be4868c4f23d3 Maíra Canal 2025-01-07  5155  	always = huge_shmem_orders_always;
8be4868c4f23d3 Maíra Canal 2025-01-07  5156  	inherit = huge_shmem_orders_inherit;
8be4868c4f23d3 Maíra Canal 2025-01-07  5157  	madvise = huge_shmem_orders_madvise;
8be4868c4f23d3 Maíra Canal 2025-01-07  5158  	within_size = huge_shmem_orders_within_size;
8be4868c4f23d3 Maíra Canal 2025-01-07  5159  	p = str_dup;
8be4868c4f23d3 Maíra Canal 2025-01-07  5160  	while ((token = strsep(&p, ";")) != NULL) {
8be4868c4f23d3 Maíra Canal 2025-01-07  5161  		range = strsep(&token, ":");
8be4868c4f23d3 Maíra Canal 2025-01-07  5162  		policy = token;
8be4868c4f23d3 Maíra Canal 2025-01-07  5163  
8be4868c4f23d3 Maíra Canal 2025-01-07  5164  		if (!policy)
8be4868c4f23d3 Maíra Canal 2025-01-07  5165  			goto err;
8be4868c4f23d3 Maíra Canal 2025-01-07  5166  
8be4868c4f23d3 Maíra Canal 2025-01-07  5167  		while ((subtoken = strsep(&range, ",")) != NULL) {
8be4868c4f23d3 Maíra Canal 2025-01-07  5168  			if (strchr(subtoken, '-')) {
8be4868c4f23d3 Maíra Canal 2025-01-07  5169  				start_size = strsep(&subtoken, "-");
8be4868c4f23d3 Maíra Canal 2025-01-07  5170  				end_size = subtoken;
8be4868c4f23d3 Maíra Canal 2025-01-07  5171  
8be4868c4f23d3 Maíra Canal 2025-01-07  5172  				start = get_order_from_str(start_size,
8be4868c4f23d3 Maíra Canal 2025-01-07  5173  							   THP_ORDERS_ALL_FILE_DEFAULT);
8be4868c4f23d3 Maíra Canal 2025-01-07  5174  				end = get_order_from_str(end_size,
8be4868c4f23d3 Maíra Canal 2025-01-07  5175  							 THP_ORDERS_ALL_FILE_DEFAULT);
8be4868c4f23d3 Maíra Canal 2025-01-07  5176  			} else {
8be4868c4f23d3 Maíra Canal 2025-01-07  5177  				start_size = end_size = subtoken;
8be4868c4f23d3 Maíra Canal 2025-01-07  5178  				start = end = get_order_from_str(subtoken,
8be4868c4f23d3 Maíra Canal 2025-01-07  5179  								 THP_ORDERS_ALL_FILE_DEFAULT);
8be4868c4f23d3 Maíra Canal 2025-01-07  5180  			}
8be4868c4f23d3 Maíra Canal 2025-01-07  5181  
8be4868c4f23d3 Maíra Canal 2025-01-07  5182  			if (start == -EINVAL) {
8be4868c4f23d3 Maíra Canal 2025-01-07  5183  				pr_err("invalid size %s in thp_shmem boot parameter\n",
8be4868c4f23d3 Maíra Canal 2025-01-07  5184  				       start_size);
8be4868c4f23d3 Maíra Canal 2025-01-07  5185  				goto err;
8be4868c4f23d3 Maíra Canal 2025-01-07  5186  			}
8be4868c4f23d3 Maíra Canal 2025-01-07  5187  
8be4868c4f23d3 Maíra Canal 2025-01-07  5188  			if (end == -EINVAL) {
8be4868c4f23d3 Maíra Canal 2025-01-07  5189  				pr_err("invalid size %s in thp_shmem boot parameter\n",
8be4868c4f23d3 Maíra Canal 2025-01-07  5190  				       end_size);
8be4868c4f23d3 Maíra Canal 2025-01-07  5191  				goto err;
8be4868c4f23d3 Maíra Canal 2025-01-07  5192  			}
8be4868c4f23d3 Maíra Canal 2025-01-07  5193  
8be4868c4f23d3 Maíra Canal 2025-01-07  5194  			if (start < 0 || end < 0 || start > end)
8be4868c4f23d3 Maíra Canal 2025-01-07  5195  				goto err;
8be4868c4f23d3 Maíra Canal 2025-01-07  5196  
8be4868c4f23d3 Maíra Canal 2025-01-07  5197  			nr = end - start + 1;
8be4868c4f23d3 Maíra Canal 2025-01-07  5198  			if (!strcmp(policy, "always")) {
8be4868c4f23d3 Maíra Canal 2025-01-07  5199  				bitmap_set(&always, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5200  				bitmap_clear(&inherit, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5201  				bitmap_clear(&madvise, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5202  				bitmap_clear(&within_size, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5203  			} else if (!strcmp(policy, "advise")) {
8be4868c4f23d3 Maíra Canal 2025-01-07  5204  				bitmap_set(&madvise, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5205  				bitmap_clear(&inherit, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5206  				bitmap_clear(&always, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5207  				bitmap_clear(&within_size, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5208  			} else if (!strcmp(policy, "inherit")) {
8be4868c4f23d3 Maíra Canal 2025-01-07  5209  				bitmap_set(&inherit, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5210  				bitmap_clear(&madvise, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5211  				bitmap_clear(&always, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5212  				bitmap_clear(&within_size, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5213  			} else if (!strcmp(policy, "within_size")) {
8be4868c4f23d3 Maíra Canal 2025-01-07  5214  				bitmap_set(&within_size, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5215  				bitmap_clear(&inherit, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5216  				bitmap_clear(&madvise, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5217  				bitmap_clear(&always, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5218  			} else if (!strcmp(policy, "never")) {
8be4868c4f23d3 Maíra Canal 2025-01-07  5219  				bitmap_clear(&inherit, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5220  				bitmap_clear(&madvise, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5221  				bitmap_clear(&always, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5222  				bitmap_clear(&within_size, start, nr);
8be4868c4f23d3 Maíra Canal 2025-01-07  5223  			} else {
8be4868c4f23d3 Maíra Canal 2025-01-07  5224  				pr_err("invalid policy %s in thp_shmem boot parameter\n", policy);
8be4868c4f23d3 Maíra Canal 2025-01-07  5225  				goto err;
8be4868c4f23d3 Maíra Canal 2025-01-07  5226  			}
8be4868c4f23d3 Maíra Canal 2025-01-07  5227  		}
8be4868c4f23d3 Maíra Canal 2025-01-07  5228  	}
8be4868c4f23d3 Maíra Canal 2025-01-07  5229  
8be4868c4f23d3 Maíra Canal 2025-01-07  5230  	huge_shmem_orders_always = always;
8be4868c4f23d3 Maíra Canal 2025-01-07  5231  	huge_shmem_orders_madvise = madvise;
8be4868c4f23d3 Maíra Canal 2025-01-07  5232  	huge_shmem_orders_inherit = inherit;
8be4868c4f23d3 Maíra Canal 2025-01-07  5233  	huge_shmem_orders_within_size = within_size;
8be4868c4f23d3 Maíra Canal 2025-01-07  5234  	shmem_orders_configured = true;
8be4868c4f23d3 Maíra Canal 2025-01-07  5235  	return 1;
8be4868c4f23d3 Maíra Canal 2025-01-07  5236  
8be4868c4f23d3 Maíra Canal 2025-01-07  5237  err:
8be4868c4f23d3 Maíra Canal 2025-01-07  5238  	pr_warn("thp_shmem=%s: error parsing string, ignoring setting\n", str);
8be4868c4f23d3 Maíra Canal 2025-01-07  5239  	return 0;
8be4868c4f23d3 Maíra Canal 2025-01-07  5240  }
8be4868c4f23d3 Maíra Canal 2025-01-07  5241  __setup("thp_shmem=", setup_thp_shmem);
8be4868c4f23d3 Maíra Canal 2025-01-07  5242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

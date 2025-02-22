Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B697082A
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Feb 2025 04:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740197571; cv=none; b=u/kYmtLnoAhuujilCdhrQaYlylIWFzSZzzmnQJzlTayYKpiZ2uPmpWBsNrvLdHxEcgSEGgVHlR/P3uBVh/cRCcCVEdZNQYtCLwAyBqbbfOiNG8SgnafTuDXB3J7DkXWkwDf8CTF+wDlvgKhcYwEX3n3bm1L3ho09OsctkgrXsTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740197571; c=relaxed/simple;
	bh=K5eVrXAfpkz0okAAh7VJjApzgqRPt4ajPiqh9ATqb4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U7b+4EBdztRWa5CqpMdyU56J79bDp2miXXw3gNu9cLunjmRXfvKzC3Fgpfm2UCEQrR2RVzGmNWpVVr43hFyyaR5F/Cj/XIpMS5KQo/1Q9EN3KZxuIYs4vfqO0X58iNdhmr1IGHb2w9EJsVdKKA5zlVQfpGuhlYXqeThmR5lJBu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJCt3S6C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJCt3S6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740197569; x=1771733569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K5eVrXAfpkz0okAAh7VJjApzgqRPt4ajPiqh9ATqb4s=;
  b=HJCt3S6Ct1C8hI5+6hvdqvFjEWNtpPiQ6QuXl3Q2vaTqVEtY+qlqEEuX
   MhDyyaZWC1i0+TBVzD39a1Y0UaJjxT3mQ65TkFEH0pCKz2ZlIRmEb4JD7
   zmpWL3moFTYLpkzVF/9gZAOGqhBxJNKxJw8OiS0ix5dBpIg4zikeb3RIH
   GdhmIIy1bzEKhYimiorqBzKmkVCpH6uoBtcmeWK/WpSDgz+RVkJl1jnBP
   Kh3rIrOR57XtUYQA88wbpWAtoRq0Uxg+00B/+D7LAu3BN16lXtR3BVWbw
   +27TkIbRtbi4BjLifgjmqbbUWChUBQKOzZyJx22ZYrnMG0zkXYwyqFjgQ
   A==;
X-CSE-ConnectionGUID: WWy2P8YsQFqedPug/50k2A==
X-CSE-MsgGUID: /ulYfYMtSBuCZQkMDUExeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51651226"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="51651226"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 20:12:48 -0800
X-CSE-ConnectionGUID: ++AZJBsZSOi5dxp8Nr4z+g==
X-CSE-MsgGUID: n3cJdBE2TIG9miIHizlTXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="115740120"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2025 20:12:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlgsf-0006IJ-08;
	Sat, 22 Feb 2025 04:12:45 +0000
Date: Sat, 22 Feb 2025 12:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2759/2759] mm/hugetlb.c:3611 hugepages_setup()
 warn: potential spectre issue 'default_hugepages_in_node' [w]
Message-ID: <202502221234.M50nLg2y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4d88bf76198b8a462646f7be261586ebb2bbf5f3
commit: 16a9f8e683ea65ac4484e67742171cfa8b0234eb [2759/2759] hugetlbfs: fix a truncation issue in hugepages parameter
:::::: branch date: 25 hours ago
:::::: commit date: 2 years, 10 months ago
config: x86_64-randconfig-161-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221234.M50nLg2y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502221234.M50nLg2y-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:3611 hugepages_setup() warn: potential spectre issue 'default_hugepages_in_node' [w]
mm/hugetlb.c:3613 hugepages_setup() warn: potential spectre issue 'parsed_hstate->max_huge_pages_node' [w]

vim +/default_hugepages_in_node +3611 mm/hugetlb.c

a3437870160cf2c Nishanth Aravamudan 2008-07-23  3550  
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3551  bool __init __weak hugetlb_node_alloc_supported(void)
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3552  {
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3553  	return true;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3554  }
282f4214384ee2e Mike Kravetz        2020-06-03  3555  /*
282f4214384ee2e Mike Kravetz        2020-06-03  3556   * hugepages command line processing
282f4214384ee2e Mike Kravetz        2020-06-03  3557   * hugepages normally follows a valid hugepagsz or default_hugepagsz
282f4214384ee2e Mike Kravetz        2020-06-03  3558   * specification.  If not, ignore the hugepages value.  hugepages can also
282f4214384ee2e Mike Kravetz        2020-06-03  3559   * be the first huge page command line  option in which case it implicitly
282f4214384ee2e Mike Kravetz        2020-06-03  3560   * specifies the number of huge pages for the default size.
282f4214384ee2e Mike Kravetz        2020-06-03  3561   */
282f4214384ee2e Mike Kravetz        2020-06-03  3562  static int __init hugepages_setup(char *s)
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3563  {
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3564  	unsigned long *mhp;
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3565  	static unsigned long *last_mhp;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3566  	int node = NUMA_NO_NODE;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3567  	int count;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3568  	unsigned long tmp;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3569  	char *p = s;
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3570  
9fee021d15ddd88 Vaishali Thakkar    2016-05-19  3571  	if (!parsed_valid_hugepagesz) {
282f4214384ee2e Mike Kravetz        2020-06-03  3572  		pr_warn("HugeTLB: hugepages=%s does not follow a valid hugepagesz, ignoring\n", s);
9fee021d15ddd88 Vaishali Thakkar    2016-05-19  3573  		parsed_valid_hugepagesz = true;
282f4214384ee2e Mike Kravetz        2020-06-03  3574  		return 0;
9fee021d15ddd88 Vaishali Thakkar    2016-05-19  3575  	}
282f4214384ee2e Mike Kravetz        2020-06-03  3576  
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3577  	/*
282f4214384ee2e Mike Kravetz        2020-06-03  3578  	 * !hugetlb_max_hstate means we haven't parsed a hugepagesz= parameter
282f4214384ee2e Mike Kravetz        2020-06-03  3579  	 * yet, so this hugepages= parameter goes to the "default hstate".
282f4214384ee2e Mike Kravetz        2020-06-03  3580  	 * Otherwise, it goes with the previously parsed hugepagesz or
282f4214384ee2e Mike Kravetz        2020-06-03  3581  	 * default_hugepagesz.
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3582  	 */
9fee021d15ddd88 Vaishali Thakkar    2016-05-19  3583  	else if (!hugetlb_max_hstate)
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3584  		mhp = &default_hstate_max_huge_pages;
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3585  	else
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3586  		mhp = &parsed_hstate->max_huge_pages;
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3587  
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3588  	if (mhp == last_mhp) {
282f4214384ee2e Mike Kravetz        2020-06-03  3589  		pr_warn("HugeTLB: hugepages= specified twice without interleaving hugepagesz=, ignoring hugepages=%s\n", s);
282f4214384ee2e Mike Kravetz        2020-06-03  3590  		return 0;
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3591  	}
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3592  
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3593  	while (*p) {
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3594  		count = 0;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3595  		if (sscanf(p, "%lu%n", &tmp, &count) != 1)
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3596  			goto invalid;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3597  		/* Parameter is node format */
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3598  		if (p[count] == ':') {
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3599  			if (!hugetlb_node_alloc_supported()) {
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3600  				pr_warn("HugeTLB: architecture can't support node specific alloc, ignoring!\n");
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3601  				return 0;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3602  			}
16a9f8e683ea65a Liu Yuntao          2022-04-19  3603  			if (tmp >= nr_online_nodes)
16a9f8e683ea65a Liu Yuntao          2022-04-19  3604  				goto invalid;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3605  			node = tmp;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3606  			p += count + 1;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3607  			/* Parse hugepages */
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3608  			if (sscanf(p, "%lu%n", &tmp, &count) != 1)
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3609  				goto invalid;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3610  			if (!hugetlb_max_hstate)
f4ada01a2c72a1a Zhenguo Yao         2022-01-17 @3611  				default_hugepages_in_node[node] = tmp;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3612  			else
f4ada01a2c72a1a Zhenguo Yao         2022-01-17 @3613  				parsed_hstate->max_huge_pages_node[node] = tmp;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3614  			*mhp += tmp;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3615  			/* Go to parse next node*/
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3616  			if (p[count] == ',')
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3617  				p += count + 1;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3618  			else
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3619  				break;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3620  		} else {
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3621  			if (p != s)
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3622  				goto invalid;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3623  			*mhp = tmp;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3624  			break;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3625  		}
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3626  	}
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3627  
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3628  	/*
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3629  	 * Global state is always initialized later in hugetlb_init.
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3630  	 * But we need to allocate >= MAX_ORDER hstates here early to still
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3631  	 * use the bootmem allocator.
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3632  	 */
47d38344abd0c7c Aneesh Kumar K.V    2012-07-31  3633  	if (hugetlb_max_hstate && parsed_hstate->order >= MAX_ORDER)
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3634  		hugetlb_hstate_alloc_pages(parsed_hstate);
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3635  
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3636  	last_mhp = mhp;
8faa8b077b2cdc4 Andi Kleen          2008-07-23  3637  
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3638  	return 1;
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3639  
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3640  invalid:
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3641  	pr_warn("HugeTLB: Invalid hugepages parameter %s\n", p);
f4ada01a2c72a1a Zhenguo Yao         2022-01-17  3642  	return 0;
a3437870160cf2c Nishanth Aravamudan 2008-07-23  3643  }
282f4214384ee2e Mike Kravetz        2020-06-03  3644  __setup("hugepages=", hugepages_setup);
e11bfbfcb08ef42 Nick Piggin         2008-07-23  3645  

:::::: The code at line 3611 was first introduced by commit
:::::: f4ada01a2c72a1a69a6da3c56764b414081e639b hugetlbfs: extend the definition of hugepages parameter to support node allocation

:::::: TO: Zhenguo Yao <yaozhenguo1@gmail.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

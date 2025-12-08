Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF123D7E6
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 02:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765160631; cv=none; b=gpfXk0GtunpBRFyMI8iUZ7QGM/Y0Cq29r4+0yHm1PQzHw/FYLHUhnn/OzcGaD+rfM8GCud+xuCaNXKUmAmao1OgArYtX+PvNey20G+ZeEekD5SjMnN62bXMO9Gek6PALHPeSMh4YV69J1OtyUaropnpWUkGLN50oAwLkhV8wnc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765160631; c=relaxed/simple;
	bh=QaluiClNoiQo4yRFUte7EHhZ38l8kvhtNIF1OvQM0a0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPhNL4kfQNPUISXkyIBlAREzKHcXH+pjnOkQJ2buOnEVw7R4grVLP8KUf3fzsat5vSeNmiEaT36olyK0rAftMOLEsI6PE2VWtL+ygfIyuwdC2Q6ddJwBgZN+1X1DR4HPRp5MjYNp4mks2lBmAZHrEmrSDj56KIPdUtMi4jcYAdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxbxP2EM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxbxP2EM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765160628; x=1796696628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QaluiClNoiQo4yRFUte7EHhZ38l8kvhtNIF1OvQM0a0=;
  b=nxbxP2EMf5WhZgGeR1PkUO0mzP56sYfVfGDFtU6j9dX3VRNSh4Oz+qex
   m2KgljCtt0X0fbYf6BUwSv6tIZnO14fZ4PD5nQcN1NBxJ3ozgbq7VH9hJ
   0ZvAzoOnvtEGqqaVMC3VrueTOd4cK6B9KdO0ZWMKPc78qxcX6vXVt7NOm
   U6eBpYNAVo0fKRKcZiL6PvhK+s/GVTKUQv+y4CtUkV4VHlw8QupHtEyNu
   +ttfWkb0MR6vzDnPA95X//bNWQBEj/QES5lB5GM5VOdeqE4EvrotZC51d
   2wDL6l6eDP1Azxb1uharhRhA4/ZicUdnCPpyi78P7k8+JSOURKen41O/6
   w==;
X-CSE-ConnectionGUID: WsVikJPuQTeXmsCcS0S3Kg==
X-CSE-MsgGUID: /Dzmw+t3THOgAxnAcqt0BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66103811"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="66103811"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 18:23:46 -0800
X-CSE-ConnectionGUID: RoJGdL03SZmW6wjeHQkMIg==
X-CSE-MsgGUID: zGUi4fhfQ5mcTJUn9Bb1dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="195440289"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Dec 2025 18:23:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSQud-00000000JqX-0knw;
	Mon, 08 Dec 2025 02:23:43 +0000
Date: Mon, 8 Dec 2025 10:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-desktop 7/7]
 mm/damon/tests/vaddr-kunit.h:69:47: sparse: sparse: missing braces around
 initializer
Message-ID: <202512081000.9wjOOXeT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/damon/tests/vaddr-kunit.h:69:47: sparse: sparse: missing braces around initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d0bf55e49c08c429d48fa782a0bb545804ffacb6
commit: 9bfbaa5e44c52422a046ce291469c8ebeb6c475d [7/7] mm/damon: move kunit tests to tests/ subdirectory with _kunit suffix
:::::: branch date: 9 hours ago
:::::: commit date: 1 year, 3 months ago
config: x86_64-randconfig-r133-20251208 (https://download.01.org/0day-ci/archive/20251208/202512081000.9wjOOXeT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081000.9wjOOXeT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512081000.9wjOOXeT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/damon/vaddr.c: note: in included file:
>> mm/damon/tests/vaddr-kunit.h:69:47: sparse: sparse: missing braces around initializer
   mm/damon/vaddr.c:333:9: sparse: sparse: context imbalance in 'damon_mkold_pmd_entry' - unexpected unlock
   mm/damon/vaddr.c:496:9: sparse: sparse: context imbalance in 'damon_young_pmd_entry' - unexpected unlock

vim +69 mm/damon/tests/vaddr-kunit.h

17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  38  
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  39  /*
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  40   * Test __damon_va_three_regions() function
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  41   *
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  42   * In case of virtual memory address spaces monitoring, DAMON converts the
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  43   * complex and dynamic memory mappings of each target task to three
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  44   * discontiguous regions which cover every mapped areas.  However, the three
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  45   * regions should not include the two biggest unmapped areas in the original
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  46   * mapping, because the two biggest areas are normally the areas between 1)
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  47   * heap and the mmap()-ed regions, and 2) the mmap()-ed regions and stack.
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  48   * Because these two unmapped areas are very huge but obviously never accessed,
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  49   * covering the region is just a waste.
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  50   *
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  51   * '__damon_va_three_regions() receives an address space of a process.  It
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  52   * first identifies the start of mappings, end of mappings, and the two biggest
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  53   * unmapped areas.  After that, based on the information, it constructs the
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  54   * three regions and returns.  For more detail, refer to the comment of
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  55   * 'damon_init_regions_of()' function definition in 'mm/damon.c' file.
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  56   *
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  57   * For example, suppose virtual address ranges of 10-20, 20-25, 200-210,
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  58   * 210-220, 300-305, and 307-330 (Other comments represent this mappings in
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  59   * more short form: 10-20-25, 200-210-220, 300-305, 307-330) of a process are
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  60   * mapped.  To cover every mappings, the three regions should start with 10,
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  61   * and end with 305.  The process also has three unmapped areas, 25-200,
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  62   * 220-300, and 305-307.  Among those, 25-200 and 220-300 are the biggest two
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  63   * unmapped areas, and thus it should be converted to three regions of 10-25,
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  64   * 200-220, and 300-330.
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  65   */
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  66  static void damon_test_three_regions_in_vmas(struct kunit *test)
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  67  {
d0cf3dd47f0d5d mm/damon/vaddr-test.h Liam R. Howlett 2022-09-06  68  	static struct mm_struct mm;
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07 @69  	struct damon_addr_range regions[3] = {0,};
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  70  	/* 10-20-25, 200-210-220, 300-305, 307-330 */
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  71  	struct vm_area_struct vmas[] = {
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  72  		(struct vm_area_struct) {.vm_start = 10, .vm_end = 20},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  73  		(struct vm_area_struct) {.vm_start = 20, .vm_end = 25},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  74  		(struct vm_area_struct) {.vm_start = 200, .vm_end = 210},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  75  		(struct vm_area_struct) {.vm_start = 210, .vm_end = 220},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  76  		(struct vm_area_struct) {.vm_start = 300, .vm_end = 305},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  77  		(struct vm_area_struct) {.vm_start = 307, .vm_end = 330},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  78  	};
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  79  
d0cf3dd47f0d5d mm/damon/vaddr-test.h Liam R. Howlett 2022-09-06  80  	mt_init_flags(&mm.mm_mt, MM_MT_FLAGS);
34403fa579514a mm/damon/vaddr-test.h Liam R. Howlett 2023-01-20  81  	if (__link_vmas(&mm.mm_mt, vmas, ARRAY_SIZE(vmas)))
34403fa579514a mm/damon/vaddr-test.h Liam R. Howlett 2023-01-20  82  		kunit_skip(test, "Failed to create VMA tree");
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  83  
d0cf3dd47f0d5d mm/damon/vaddr-test.h Liam R. Howlett 2022-09-06  84  	__damon_va_three_regions(&mm, regions);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  85  
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  86  	KUNIT_EXPECT_EQ(test, 10ul, regions[0].start);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  87  	KUNIT_EXPECT_EQ(test, 25ul, regions[0].end);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  88  	KUNIT_EXPECT_EQ(test, 200ul, regions[1].start);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  89  	KUNIT_EXPECT_EQ(test, 220ul, regions[1].end);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  90  	KUNIT_EXPECT_EQ(test, 300ul, regions[2].start);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  91  	KUNIT_EXPECT_EQ(test, 330ul, regions[2].end);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  92  }
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  93  

:::::: The code at line 69 was first introduced by commit
:::::: 17ccae8bb5c928946f6f3af14626ec458f74e6ad mm/damon: add kunit tests

:::::: TO: SeongJae Park <sjpark@amazon.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

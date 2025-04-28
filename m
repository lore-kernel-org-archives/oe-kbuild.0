Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0092F1ACED1
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 01:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889586; cv=none; b=JUT36uQFQa+zmdx4rPNN9JCux8KcCMsxv+KMPloF3KelLrjvhze49gIYY7VIA6weAVplWlwXeB2RPlyOviXcI8RHtLpmYl7+END7FutmQxLtaaR81sWS0mtaXUFKt7pdJ78waP+TPfCFZjHL7TFz0PHEMdo6Bv9vmllEg8enFHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889586; c=relaxed/simple;
	bh=1QN/5PR3MJK+LFZvp4XG1LejJumJyDJJSQK0wrBkvBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=shZFUWRrK1kOUk9e72RMMwIj8igTZMsUT8tY+bCk36WMoBGdXoCBelJ1wvUn0JBiuZ2RzebFak0v8HDX8EiwT4/U0HOvUHF5u0b1/rIQ8AQiJOJOoNFxPJXED9rP9CF2QjGafGvW+oZ4dbuboYZf3hz1a49Oq33IbQnpDOvkncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6BF/WbI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6BF/WbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889583; x=1777425583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1QN/5PR3MJK+LFZvp4XG1LejJumJyDJJSQK0wrBkvBg=;
  b=I6BF/WbIBtpoLgVPM35L9GCsQyr5MmlpAsucWWe+x9PPX21TYTLCVWg6
   CVv7QZZC72u4L87tkz/1dylYsGkKMRAw0kCTQ2ssNApYDSQgd7X6i/gO1
   FmDrapVi2AIBO8SNekwz8R6apdKUVMD19b3pqY+01lWcsP/etBeethdy0
   2cg54BEDZX5787b4EOJyR5QKpkOIjwyT+6zrNC3QEN6L6rohl0LBveOQS
   4wbTnd+XYnrN0+VgJcmOoNAKTEBKFEGd8TNAJiKgCD8HNDDNUCPfH74O6
   GcxE931+bMsF/uNOKof8Nuw1TnnIaV2QcM5uvW2VT5B4PhzdsFzc35vQW
   A==;
X-CSE-ConnectionGUID: B1Z5AbdvQiOFJ+QNSOxUvw==
X-CSE-MsgGUID: O6EkOvhUTIy6PwgdAXP6Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50154559"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="50154559"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:39 -0700
X-CSE-ConnectionGUID: V1v/OlbJQSyCU13OcXxg3g==
X-CSE-MsgGUID: K7bAzJz6TfGWGwqRyZVzIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133561671"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2025 18:19:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdI-0000M2-0b;
	Tue, 29 Apr 2025 01:19:36 +0000
Date: Tue, 29 Apr 2025 06:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test_c.c:262 kmalloc_large_uaf() error: dereferencing
 freed memory 'ptr' (line 260)
Message-ID: <202504290612.4c46Lajf-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Matthew Maurer <mmaurer@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   78109c591b806e41987e0b83390e61d675d1f724
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290612.4c46Lajf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504290612.4c46Lajf-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:262 kmalloc_large_uaf() error: dereferencing freed memory 'ptr' (line 260)
mm/kasan/kasan_test_c.c:625 kmalloc_uaf() error: dereferencing freed memory 'ptr' (line 624)
mm/kasan/kasan_test_c.c:672 kmalloc_uaf2() error: dereferencing freed memory 'ptr1' (line 658)
mm/kasan/kasan_test_c.c:857 rcu_uaf_reclaim() warn: statement has no effect 'fp->i'
mm/kasan/kasan_test_c.c:895 workqueue_uaf() warn: statement has no effect 'work->data'

vim +/ptr +262 mm/kasan/kasan_test_c.c

47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  252  
0f18ea6ea44cde mm/kasan/kasan_test.c Andrey Konovalov 2023-12-19  253  static void kmalloc_large_uaf(struct kunit *test)
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  254  {
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  255  	char *ptr;
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  256  	size_t size = KMALLOC_MAX_CACHE_SIZE + 10;
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  257  
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso 2020-10-13  258  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso 2020-10-13  259  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06 @260  	kfree(ptr);
858bdeb046f6dc lib/test_kasan.c      Andrey Konovalov 2021-02-24  261  
8fbad19bdcb4b9 lib/test_kasan.c      Andrey Konovalov 2021-09-02 @262  	KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  263  }
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  264  

:::::: The code at line 262 was first introduced by commit
:::::: 8fbad19bdcb4b9be8131536e5bb9616ab2e4eeb3 kasan: test: avoid writing invalid memory

:::::: TO: Andrey Konovalov <andreyknvl@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

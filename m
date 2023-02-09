Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD3D748E
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Feb 2023 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675945138; x=1707481138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sMFoBP9k6IuCEZSlB0vvn+jVI0iH/yErAutdFtnWN/0=;
  b=EGDMRawSqMM+LoisyWYD6XR+a3GD8QBBRgT1hHVgonG2u0wTsbQ3N3oo
   3d6mXg7lj/27IKrT8AiJOSkcUOx2hUTEkCx2YaVeJNEk0Au/K5cnK9r6D
   LJAe7H45CeLtqE1bhGkI2DG+1aFMp6uaCL7TRWuxaQAa/q7Z9dhY++H7I
   +Dc3O3fP5CNGrM1R0ksoX7CsrVZMcSCrguk8LxLMH2M+Wvqg1VSjdfOTj
   1sTMFgztdPiJvWz5POqMkdzL7IIn0CM/OlylG20FbF0s8J5xWOacGz2fc
   uu5Zzo9sR43mjs1EfAaEaSkXBPpId9jnrzZUM4FRPBqyb5dWU53Q91lG9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416312615"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="416312615"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 04:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="996531082"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="996531082"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Feb 2023 04:18:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ5st-00053B-1O;
	Thu, 09 Feb 2023 12:18:39 +0000
Date: Thu, 9 Feb 2023 20:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test.c:1201 workqueue_uaf() warn: statement has no
 effect 8
Message-ID: <202302092050.HmpvIP6x-lkp@intel.com>
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
TO: Andrey Konovalov <andreyknvl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0983f6bf2bfc0789b51ddf7315f644ff4da50acb
commit: b2c5bd4c69ce28500ed2176d11002a4e9b30da36 kasan: migrate workqueue_uaf test to kunit
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: xtensa-randconfig-m031-20230209 (https://download.01.org/0day-ci/archive/20230209/202302092050.HmpvIP6x-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302092050.HmpvIP6x-lkp@intel.com

smatch warnings:
mm/kasan/kasan_test.c:1201 workqueue_uaf() warn: statement has no effect 8

vim +1201 mm/kasan/kasan_test.c

b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1185  
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1186  static void workqueue_uaf(struct kunit *test)
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1187  {
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1188  	struct workqueue_struct *workqueue;
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1189  	struct work_struct *work;
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1190  
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1191  	workqueue = create_workqueue("kasan_workqueue_test");
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1192  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, workqueue);
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1193  
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1194  	work = kmalloc(sizeof(struct work_struct), GFP_KERNEL);
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1195  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, work);
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1196  
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1197  	INIT_WORK(work, workqueue_uaf_work);
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1198  	queue_work(workqueue, work);
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1199  	destroy_workqueue(workqueue);
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1200  
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27 @1201  	KUNIT_EXPECT_KASAN_FAIL(test,
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1202  		((volatile struct work_struct *)work)->data);
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1203  }
b2c5bd4c69ce28 Andrey Konovalov 2022-09-27  1204  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30B726FDA1
	for <oe-kbuild@lists.linux.dev>; Wed, 14 May 2025 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217830; cv=none; b=kIFT9dCwi78bSbjVh7A9PTZLtZx9rqEdQu9v95bRb7xWhVu55/s3f139pWvDx/NJj92onGpBfAivlbc/ayR7bSS7+g/q/E86nA4XouymN8h10VwKkOxRDX/Z0zCJjB0F8XPwDNK6KKk8wX47GU+3ecv3+bNnJK9wyR6QTclYZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217830; c=relaxed/simple;
	bh=AT7BjYarO1512qX692JFBTkb+BHG/DtKU0VcMyMyiX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qQ7NqVlPWSzIeh2HcQlX4DjkL6jV21ytKl91gspsQGdUHetDQb1zoFGzSARPdwCVbeWj5cjt5fueN714OKhGM454CbnKwHUdRq9waDXNIodi0ZiH6rKfK5XibCsXm9PPKvQiSWS3gr75ol/9nJu2pSDuprEJslF87GhutarICcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Scyihwcq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Scyihwcq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747217829; x=1778753829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AT7BjYarO1512qX692JFBTkb+BHG/DtKU0VcMyMyiX0=;
  b=Scyihwcqitwgk8XgBT7u8Uh6yMugZ7WwNjtJ/j9oEBty7AeHMG6bAcjI
   wSI3sA49XGW9ASVmFi9TT0e6K3SOrT7K7OcuxMlbeUFL9f5j3ytk8++JM
   mJnEfVVaSqU2drvoAyj17ap6W5UlmIviSUgLv2sZYhKGtlNYqQ04lrVIi
   PmQqSTM6p4WMjl3ap+PDVjWUMCKMCmLKzC2RNIbwt0ivcxGFfDxfcJ+yo
   1RH25KeIrDygFYKtvELXZQB4/oJjJhWkFf8ViUL3Gsn1sh6Dnpu6Hj8nl
   OEf03lz2n9lKnPL7tMR7b6AgMQlM3jkbYfP7G76UIRH+LWjuJtBPaKFqB
   A==;
X-CSE-ConnectionGUID: 8rcFVoFORsOBm6YEm0tguQ==
X-CSE-MsgGUID: MqB8G/h5S3ag7y+FIJ/o1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49086959"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="49086959"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 03:17:08 -0700
X-CSE-ConnectionGUID: NbTR4MqaQJSCnwOmBTZgbQ==
X-CSE-MsgGUID: G+Zx+umGS96UidFmGiEAxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="169094848"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2025 03:17:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF9Ae-000Gxz-1x;
	Wed, 14 May 2025 10:17:04 +0000
Date: Wed, 14 May 2025 18:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v15 37/43] dept: assign unique dept_key to each distinct
 wait_for_completion() caller
Message-ID: <202505141759.avvm2GOf-lkp@intel.com>
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
In-Reply-To: <20250513100730.12664-38-byungchul@sk.com>
References: <20250513100730.12664-38-byungchul@sk.com>
TO: Byungchul Park <byungchul@sk.com>
TO: linux-kernel@vger.kernel.org
CC: kernel_team@skhynix.com
CC: torvalds@linux-foundation.org
CC: damien.lemoal@opensource.wdc.com
CC: linux-ide@vger.kernel.org
CC: adilger.kernel@dilger.ca
CC: linux-ext4@vger.kernel.org
CC: mingo@redhat.com
CC: peterz@infradead.org
CC: will@kernel.org
CC: tglx@linutronix.de
CC: rostedt@goodmis.org
CC: joel@joelfernandes.org
CC: sashal@kernel.org
CC: daniel.vetter@ffwll.ch
CC: duyuyang@gmail.com
CC: johannes.berg@intel.com
CC: tj@kernel.org
CC: tytso@mit.edu
CC: willy@infradead.org
CC: david@fromorbit.com
CC: amir73il@gmail.com
CC: gregkh@linuxfoundation.org
CC: kernel-team@lge.com
CC: linux-mm@kvack.org
CC: akpm@linux-foundation.org
CC: mhocko@kernel.org
CC: minchan@kernel.org
CC: hannes@cmpxchg.org
CC: vdavydov.dev@gmail.com

Hi Byungchul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3]

url:    https://github.com/intel-lab-lkp/linux/commits/Byungchul-Park/llist-move-llist_-head-node-definition-to-types-h/20250513-181346
base:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
patch link:    https://lore.kernel.org/r/20250513100730.12664-38-byungchul%40sk.com
patch subject: [PATCH v15 37/43] dept: assign unique dept_key to each distinct wait_for_completion() caller
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: loongarch-randconfig-r071-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141759.avvm2GOf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505141759.avvm2GOf-lkp@intel.com/

smatch warnings:
kernel/sched/completion.c:167 __wait_for_completion_timeout() error: 'wait_for_common()' returns negative and '__fake_return_0x7fd58a360280' is unsigned

vim +167 kernel/sched/completion.c

b8a216269ec0ce Peter Zijlstra 2013-10-04  151  
b8a216269ec0ce Peter Zijlstra 2013-10-04  152  /**
203be867bd3b2b Byungchul Park 2025-05-13  153   * __wait_for_completion_timeout: - waits for completion of a task (w/timeout)
b8a216269ec0ce Peter Zijlstra 2013-10-04  154   * @x:  holds the state of this particular completion
b8a216269ec0ce Peter Zijlstra 2013-10-04  155   * @timeout:  timeout value in jiffies
b8a216269ec0ce Peter Zijlstra 2013-10-04  156   *
b8a216269ec0ce Peter Zijlstra 2013-10-04  157   * This waits for either a completion of a specific task to be signaled or for a
b8a216269ec0ce Peter Zijlstra 2013-10-04  158   * specified timeout to expire. The timeout is in jiffies. It is not
b8a216269ec0ce Peter Zijlstra 2013-10-04  159   * interruptible.
b8a216269ec0ce Peter Zijlstra 2013-10-04  160   *
b8a216269ec0ce Peter Zijlstra 2013-10-04  161   * Return: 0 if timed out, and positive (at least 1, or number of jiffies left
b8a216269ec0ce Peter Zijlstra 2013-10-04  162   * till timeout) if completed.
b8a216269ec0ce Peter Zijlstra 2013-10-04  163   */
b8a216269ec0ce Peter Zijlstra 2013-10-04  164  unsigned long __sched
203be867bd3b2b Byungchul Park 2025-05-13  165  __wait_for_completion_timeout(struct completion *x, unsigned long timeout)
b8a216269ec0ce Peter Zijlstra 2013-10-04  166  {
b8a216269ec0ce Peter Zijlstra 2013-10-04 @167  	return wait_for_common(x, timeout, TASK_UNINTERRUPTIBLE);
b8a216269ec0ce Peter Zijlstra 2013-10-04  168  }
203be867bd3b2b Byungchul Park 2025-05-13  169  EXPORT_SYMBOL(__wait_for_completion_timeout);
b8a216269ec0ce Peter Zijlstra 2013-10-04  170  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

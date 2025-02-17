Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C741547C3
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782934; cv=none; b=A7adIs2gWTi7iNCiOd/zcuzxGJaJ68ftEuvRVyU/5UQLnAD3/2YWtOIMnxmJW4x2Y0VB/qFnP+iWHzc3tnPCWDcqr1EEn5vjriGZfBj2hkE0ItoGNnKFjh2KZlpSCFpp/UY+7hHrCN0A2SjKGFOz69ARKHMdZHMB/rsonNOspTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782934; c=relaxed/simple;
	bh=E7ioI/yUq9I4yFGfwocqdmPS4x3XLVeeb8LpybkVkcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6qZmF+7qaMygQmYWsyYlTEOxcdigZVAvugY4oiF6mNUnS8ZgDDa70iH/6UTTC/7D1MrxCf1urmT8kWpVijBrrzUlyLLm1UIX6RyhQ69YhFX8KdJu9euUzeniQDiuGhGf14W6DN7Tc/Fm3Qld2TrDWUyv981bqCo/J7Iwd1dsy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRyJszhV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRyJszhV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739782932; x=1771318932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7ioI/yUq9I4yFGfwocqdmPS4x3XLVeeb8LpybkVkcI=;
  b=aRyJszhVHTeYOm88q/S5UGtqyDxPlX866Xk4LlUq3r29U+kuvjaOWoMT
   avro9wmDioGsKl9HN6//OrJhV4drYtSLN5Pfii6XCGHy7Dh5JJfKXT3rF
   qs47zuwKji9zP6vaS14IHPPI2wmAt0s0gRKWqrhErjtBeu8Eu+xiaTOrB
   FVy7YKMhhCSQ4d/O1bTUk1t/YyY7I+IvIlUMZJLby5xKdIXGtyfo0Qlxk
   9033YY92Nl4z96XufMOieYCGSgiZ2OA/l4r0VSh+b0hyGO38/Hrs4/m1+
   5GjZxyfU2+TGOJqIRvi3ofyT3/B+SYpvSS9PMyO35hWNrXAKFfoFabUWF
   g==;
X-CSE-ConnectionGUID: Bw2stYdLSRG9GHNrObd5CQ==
X-CSE-MsgGUID: chlg/2TkT9KanS05ICgSAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51078037"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="51078037"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 01:02:11 -0800
X-CSE-ConnectionGUID: xUbr5jcvR4m/YRa7dLR8TQ==
X-CSE-MsgGUID: GuAErVaNR+65X8V3sm+vMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114543307"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Feb 2025 01:02:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjx0x-001Cqp-1X;
	Mon, 17 Feb 2025 09:02:07 +0000
Date: Mon, 17 Feb 2025 17:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH md-6.15 4/7] md: switch personalities to use
 md_submodule_head
Message-ID: <202502171611.M5q0k43t-lkp@intel.com>
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
In-Reply-To: <20250215092225.2427977-5-yukuai1@huaweicloud.com>
References: <20250215092225.2427977-5-yukuai1@huaweicloud.com>
TO: Yu Kuai <yukuai1@huaweicloud.com>
TO: song@kernel.org
TO: yukuai3@huawei.com
CC: linux-raid@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: yukuai1@huaweicloud.com
CC: yi.zhang@huawei.com
CC: yangerkun@huawei.com

Hi Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc3 next-20250214]
[cannot apply to song-md/md-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/md-merge-common-code-into-find_pers/20250215-172947
base:   linus/master
patch link:    https://lore.kernel.org/r/20250215092225.2427977-5-yukuai1%40huaweicloud.com
patch subject: [PATCH md-6.15 4/7] md: switch personalities to use md_submodule_head
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-r071-20250216 (https://download.01.org/0day-ci/archive/20250217/202502171611.M5q0k43t-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502171611.M5q0k43t-lkp@intel.com/

New smatch warnings:
drivers/md/md.c:898 get_pers() warn: iterator 'i' not incremented
drivers/md/md.c:8183 status_personalities() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/md/md.c:3777 analyze_sbs() warn: iterator 'i' not incremented

vim +/i +898 drivers/md/md.c

1ca69c4bc4b1ef NeilBrown 2012-10-11  890  
3e5b5a71a5d720 Yu Kuai   2025-02-15  891  static struct md_personality *get_pers(int level, char *clevel)
2604b703b6b3db NeilBrown 2006-01-06  892  {
3e5b5a71a5d720 Yu Kuai   2025-02-15  893  	struct md_personality *ret = NULL;
cae9461123c203 Yu Kuai   2025-02-15  894  	struct md_submodule_head *head;
cae9461123c203 Yu Kuai   2025-02-15  895  	unsigned long i;
3e5b5a71a5d720 Yu Kuai   2025-02-15  896  
cae9461123c203 Yu Kuai   2025-02-15  897  	xa_lock(&md_submodule);
cae9461123c203 Yu Kuai   2025-02-15 @898  	xa_for_each(&md_submodule, i, head) {
cae9461123c203 Yu Kuai   2025-02-15  899  		if (head->type != MD_PERSONALITY)
cae9461123c203 Yu Kuai   2025-02-15  900  			continue;
cae9461123c203 Yu Kuai   2025-02-15  901  		if ((level != LEVEL_NONE && head->id == level) ||
cae9461123c203 Yu Kuai   2025-02-15  902  		    !strcmp(head->name, clevel)) {
cae9461123c203 Yu Kuai   2025-02-15  903  			if (try_module_get(head->owner))
cae9461123c203 Yu Kuai   2025-02-15  904  				ret = (void *)head;
3e5b5a71a5d720 Yu Kuai   2025-02-15  905  			break;
d9d166c2a9d5d0 NeilBrown 2006-01-06  906  		}
3e5b5a71a5d720 Yu Kuai   2025-02-15  907  	}
cae9461123c203 Yu Kuai   2025-02-15  908  	xa_unlock(&md_submodule);
3e5b5a71a5d720 Yu Kuai   2025-02-15  909  
3e5b5a71a5d720 Yu Kuai   2025-02-15  910  	if (!ret) {
3e5b5a71a5d720 Yu Kuai   2025-02-15  911  		if (level != LEVEL_NONE)
3e5b5a71a5d720 Yu Kuai   2025-02-15  912  			pr_warn("md: personality for level %d is not loaded!\n",
3e5b5a71a5d720 Yu Kuai   2025-02-15  913  				level);
3e5b5a71a5d720 Yu Kuai   2025-02-15  914  		else
3e5b5a71a5d720 Yu Kuai   2025-02-15  915  			pr_warn("md: personality for level %s is not loaded!\n",
3e5b5a71a5d720 Yu Kuai   2025-02-15  916  				clevel);
3e5b5a71a5d720 Yu Kuai   2025-02-15  917  	}
3e5b5a71a5d720 Yu Kuai   2025-02-15  918  
3e5b5a71a5d720 Yu Kuai   2025-02-15  919  	return ret;
3e5b5a71a5d720 Yu Kuai   2025-02-15  920  }
3e5b5a71a5d720 Yu Kuai   2025-02-15  921  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

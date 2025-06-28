Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE3224AE6
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127706; cv=none; b=SmRjOkE04T83rJk5eRRDRLOWow+UE11dtVqhmuRgT6gadDxEPv14BFgowOAtDEahH1kD6EUkPljmqGhDyflmmh+t6MdL2Rsxfr1JprzIKPHzWreP3Yl7xkVMmqBmIkEfjFpL8rXrCmSbwXpJITFkgAHYFDd8AsZFvQd1aCTrh3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127706; c=relaxed/simple;
	bh=3qwiHbjOd+8rqAW00o+U60tOMpTBMlLcq6fyvMIPg4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0fF9uQLB5IajhDIFI8WhwYXOBFP4ExZeY34Q44c69dXtXjwl1GpyevywvYwbSVIuKqu+556ZY58BUe/cXYxD8iJgGgjpSq1bWKIDGLWta/LelTG+O+3CiGGqj7T1aVZf1/qgcqgEl9kHznYI/mQQzHNATXyDcUx/WjVzAqlv0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oqv+Gi9S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oqv+Gi9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751127705; x=1782663705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qwiHbjOd+8rqAW00o+U60tOMpTBMlLcq6fyvMIPg4c=;
  b=Oqv+Gi9S/l9ee8dM4+ozw0vcQxlu2wjxhcNZy7ch+j9+GTppnRHyC+a2
   L18m4g3gTLdRlpoIBNf2XURRcntiV28jTWQO9WKEsNo5kNk2w0bVepTx8
   xoj6XhjeWLY02n/bESpOw0IYC4T/8bNZt37qtB68KijehnPC1MEvi4vk3
   +Nosou4nf+VHTcYVSmPts9UOU9umKQG+beffbLcvr3zrh43DsmVFK/63s
   rTnT9jluZ2YH3z4giblfHpAnM4HxKPfQ/UVTABSjRGESxsPeoMlfaMK8E
   +utugPVVE+DEKhFx88n1rY0ff5isQgrgN3d6VQqIQv96BaCiS1T4HBgFR
   w==;
X-CSE-ConnectionGUID: vo/0b6CnQGepWg53V1ZNNw==
X-CSE-MsgGUID: G8fO+ymVSRaEyP6wxtBs2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64469976"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="64469976"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 09:21:42 -0700
X-CSE-ConnectionGUID: zyD4L0WfQxeUzQ3C+12Kgg==
X-CSE-MsgGUID: dRVvZCGZS3CaEDZRwDh0rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153156826"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jun 2025 09:21:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVYJ8-000XBS-0v;
	Sat, 28 Jun 2025 16:21:38 +0000
Date: Sun, 29 Jun 2025 00:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/3] media: mc: Add media jobs framework
Message-ID: <202506282351.uufwOAwG-lkp@intel.com>
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
In-Reply-To: <20250624-media-jobs-v2-2-8e649b069a96@ideasonboard.com>
References: <20250624-media-jobs-v2-2-8e649b069a96@ideasonboard.com>
TO: Daniel Scally <dan.scally@ideasonboard.com>
TO: linux-media@vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: jacopo.mondi@ideasonboard.com
CC: Daniel Scally <dan.scally@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-mc-entity-Add-pipeline_started-stopped-ops/20250624-160120
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250624-media-jobs-v2-2-8e649b069a96%40ideasonboard.com
patch subject: [PATCH v2 2/3] media: mc: Add media jobs framework
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: nios2-randconfig-r073-20250627 (https://download.01.org/0day-ci/archive/20250628/202506282351.uufwOAwG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506282351.uufwOAwG-lkp@intel.com/

New smatch warnings:
drivers/media/mc/mc-jobs.c:285 __media_jobs_run_jobs() error: we previously assumed 'step->run_step' could be null (see line 281)

Old smatch warnings:
drivers/media/mc/mc-jobs.c:117 media_jobs_add_job_step() warn: iterator used outside loop: 'tmp'
drivers/media/mc/mc-jobs.c:147 media_jobs_add_job_step() warn: iterator used outside loop: 'tmp'
drivers/media/mc/mc-jobs.c:165 media_jobs_add_job_step() warn: iterator used outside loop: 'tmp'
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +285 drivers/media/mc/mc-jobs.c

4be0a59bfc044b0 Daniel Scally 2025-06-24  256  
4be0a59bfc044b0 Daniel Scally 2025-06-24  257  static void __media_jobs_run_jobs(struct work_struct *work)
4be0a59bfc044b0 Daniel Scally 2025-06-24  258  {
4be0a59bfc044b0 Daniel Scally 2025-06-24  259  	struct media_job_scheduler *sched = container_of(work,
4be0a59bfc044b0 Daniel Scally 2025-06-24  260  							 struct media_job_scheduler,
4be0a59bfc044b0 Daniel Scally 2025-06-24  261  							 work);
4be0a59bfc044b0 Daniel Scally 2025-06-24  262  	struct media_job_step *step;
4be0a59bfc044b0 Daniel Scally 2025-06-24  263  	struct media_job *job;
4be0a59bfc044b0 Daniel Scally 2025-06-24  264  
4be0a59bfc044b0 Daniel Scally 2025-06-24  265  	while (true) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  266  		scoped_guard(spinlock, &sched->lock) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  267  			if (list_empty(&sched->queue))
4be0a59bfc044b0 Daniel Scally 2025-06-24  268  				return;
4be0a59bfc044b0 Daniel Scally 2025-06-24  269  
4be0a59bfc044b0 Daniel Scally 2025-06-24  270  			job = list_first_entry(&sched->queue, struct media_job,
4be0a59bfc044b0 Daniel Scally 2025-06-24  271  					       list);
4be0a59bfc044b0 Daniel Scally 2025-06-24  272  
4be0a59bfc044b0 Daniel Scally 2025-06-24  273  			list_del(&job->list);
4be0a59bfc044b0 Daniel Scally 2025-06-24  274  		}
4be0a59bfc044b0 Daniel Scally 2025-06-24  275  
4be0a59bfc044b0 Daniel Scally 2025-06-24  276  		list_for_each_entry(step, &job->steps, list) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  277  			/*
4be0a59bfc044b0 Daniel Scally 2025-06-24  278  			 * Theoretically impossible as this should have been
4be0a59bfc044b0 Daniel Scally 2025-06-24  279  			 * validated in media_jobs_add_job_step()
4be0a59bfc044b0 Daniel Scally 2025-06-24  280  			 */
4be0a59bfc044b0 Daniel Scally 2025-06-24 @281  			if (!step->run_step)
4be0a59bfc044b0 Daniel Scally 2025-06-24  282  				WARN_ONCE(1, "%s(): No .run_step() operation\n",
4be0a59bfc044b0 Daniel Scally 2025-06-24  283  					  __func__);
4be0a59bfc044b0 Daniel Scally 2025-06-24  284  
4be0a59bfc044b0 Daniel Scally 2025-06-24 @285  			step->run_step(step->data);
4be0a59bfc044b0 Daniel Scally 2025-06-24  286  		}
4be0a59bfc044b0 Daniel Scally 2025-06-24  287  
4be0a59bfc044b0 Daniel Scally 2025-06-24  288  		media_jobs_free_job(job);
4be0a59bfc044b0 Daniel Scally 2025-06-24  289  	}
4be0a59bfc044b0 Daniel Scally 2025-06-24  290  }
4be0a59bfc044b0 Daniel Scally 2025-06-24  291  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362AF4C9F
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 03:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752291114; cv=none; b=awXgY1F/F0dfBzjOmtv6jWzeHwGC11045UgKx3GXhWa3EU3c16/dEPBK7QxvCuG4jRBfvPiG3vow/g+RGw5PvNnCoMG4DIwTbvFNbFTSWBn1H4iGkFszo2DZrZBc5p24iaAyZmfhLbdKYCgdhfB3+Bc1sbF57f+E8hLezpVSJzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752291114; c=relaxed/simple;
	bh=PBendbRgivD1pWPU4wOTwn+DdSAJCfYsfnNaWgF5/sY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dHs6Br01nUgtPKw92sZdoOPY/4FRpst6jC8+bkECR3Tw7n8iE3QRmtc9Yj2uFeDkVzkihYGB/LZlUcvmbbjvaBffth9PExA56J3iGDY8b3YsoCsWqAiont8J9zfguzgOfwKqxQmGK8O3EeVU688gNjiqOS3ODUx3yHaxBkHENE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuEyhzMm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuEyhzMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752291112; x=1783827112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PBendbRgivD1pWPU4wOTwn+DdSAJCfYsfnNaWgF5/sY=;
  b=fuEyhzMmTdjPLDEleZ48+1QXrtFW8MX5HJRBjhE3Uid0kTFSs0Iy7WM3
   15i8rD27H2le/q1kqbm1HM9ZWhjyO2FORky+u1lruw8kiigbCjctr8bK9
   KZtkid0sd1gI/gc6kdS03zXu+VRhKmhMRdLl6VMD+B1Ddm6YnWHZ57zT/
   JDE5r4k535ly2cH7JwZLPPtLbfJiPCn0bhOCBch+DDibj9DyiC2beq5Ej
   dxu644WZXqt8Ipq2kdcwIIMvWVasMS2GsHQ/L+gRm4lQvNobx26dx+uPT
   slG6+xWtl1b31nOmvCCMJqQJmtIBf0eOngRzJItEE2z8PzDrW9GiT8u6d
   A==;
X-CSE-ConnectionGUID: UHvncfnMT0KOS49CrmtXDg==
X-CSE-MsgGUID: uc8lnB1wRDGI6K/RuRjKPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72166780"
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="72166780"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 20:31:51 -0700
X-CSE-ConnectionGUID: wf03bLqEQH2GJTWNeysTAA==
X-CSE-MsgGUID: E4xq2N4bR0uSPHMfH5Acjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="156598550"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2025 20:31:50 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaQxo-00071X-0o;
	Sat, 12 Jul 2025 03:31:48 +0000
Date: Sat, 12 Jul 2025 11:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [robh:imx93-ethos-v2 19/40]
 drivers/accel/ethos/ethos_job.c:594:11-12: WARNING kvmalloc is used to
 allocate this memory at line 568
Message-ID: <202507121343.iaWO87ym-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   f2fd4883d04c3245bc2fdd061078823b49709c68
commit: e47b72ad46c1f22faaea2d29a7f24ac294b5893c [19/40] drm: ethos: Add bounds check on cmd stream regions
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-r062-20250712 (https://download.01.org/0day-ci/archive/20250712/202507121343.iaWO87ym-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507121343.iaWO87ym-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/ethos/ethos_job.c:594:11-12: WARNING kvmalloc is used to allocate this memory at line 568

vim +594 drivers/accel/ethos/ethos_job.c

18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  555) 
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  556) int ethos_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  557) {
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  558) 	struct drm_ethos_submit *args = data;
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  559) 	struct drm_ethos_job *jobs;
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  560) 	int ret = 0;
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  561) 	unsigned int i = 0;
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  562) 
bd37f8963223b9b Rob Herring (Arm  2025-06-30  563) 	if (args->pad) {
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  564) 		drm_dbg(dev, "Reserved field in drm_ethos_submit struct should be 0.\n");
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  565) 		return -EINVAL;
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  566) 	}
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  567) 
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29 @568) 	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  569) 	if (!jobs) {
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  570) 		drm_dbg(dev, "Failed to allocate incoming job array\n");
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  571) 		return -ENOMEM;
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  572) 	}
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  573) 
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  574) 	if (copy_from_user(jobs,
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  575) 			   (void __user *)(uintptr_t)args->jobs,
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  576) 			   args->job_count * sizeof(*jobs))) {
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  577) 		ret = -EFAULT;
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  578) 		drm_dbg(dev, "Failed to copy incoming job array\n");
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  579) 		goto exit;
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  580) 	}
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  581) 
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  582) 	for (i = 0; i < args->job_count; i++) {
e47b72ad46c1f22 Rob Herring (Arm  2025-06-30  583) 		if (jobs[i].pad != 0) {
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  584) 			drm_dbg(dev, "Reserved field in drm_ethos_job struct should be 0.\n");
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  585) 			return -EINVAL;
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  586) 		}
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  587) 
e47b72ad46c1f22 Rob Herring (Arm  2025-06-30  588) 		ret = ethos_ioctl_submit_job(dev, file, &jobs[i]);
e47b72ad46c1f22 Rob Herring (Arm  2025-06-30  589) 		if (ret)
e47b72ad46c1f22 Rob Herring (Arm  2025-06-30  590) 			break;
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  591) 	}
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  592) 
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29  593) exit:
18fbf33e2b12d61 Rob Herring (Arm  2025-05-29 @594) 	kfree(jobs);

:::::: The code at line 594 was first introduced by commit
:::::: 18fbf33e2b12d61167868142a4b47c598e9442f2 accel: Add initial Arm Ethos driver

:::::: TO: Rob Herring (Arm) <robh@kernel.org>
:::::: CC: Rob Herring (Arm) <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

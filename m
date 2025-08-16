Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51721450F2
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 22:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755382702; cv=none; b=WIvR4T1NHI87HB3nfmiho0lUA4FXgO1CPhddKguCS67VfdsmbccZZPyRCBtSLFUDKM8ItxqDxgwrIh/ONYrQtuhHXCEbW3T8EkFvqf7NUI6LH7+5EaoSTw+Sq8y/FcEcTEuLOkiH9k2L6S5ej+tyGpTeedC/Ox97m87mqrgKmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755382702; c=relaxed/simple;
	bh=72G7O0HhqTbdLsJWwn2WXNzLi+TLzRsEDJr2Fsbj7Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCOAKR87VXZzIohr4HV6gCrfAaBFrivfp2iybW7b8LfG3iOHIgjXBJIpZo6tbqWSqwBxNBjr9DYQ5UwvFl0FYeuEB2CD94DRfJbjy0hF64ffS9ay5gGbxWqS+aXqySMxtGHWxdUUNP/nVDJtN1QKtzv5bpTT9onT/esAEHvY7kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2AYujKA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2AYujKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755382700; x=1786918700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=72G7O0HhqTbdLsJWwn2WXNzLi+TLzRsEDJr2Fsbj7Lw=;
  b=P2AYujKAhVMd27+fD/caN6d5jAfaJeP3NNrhyGBwGJ8lEpVwQKZID+X4
   2gNaGlGV7E6krrGIdTzjKQgBO1Kyk9C/U099F3QDgWLCneA8zMS1SaN6m
   jXKJNHYwwEjBJsUH+HJsFejCIMb/j8cA2LIRSDfuD35DYPrBfbsadPnCI
   41LRGJivkhCIJlbko3BhDYo0Cslt2CS0B0CiyPUvDhLumr9rFWsJiQqDd
   I0A+AqCDtz1pBWqPM7dRJkcrUwAp3m8xRAjJWIMa53pJvLUVDlQJwm6k4
   +IS+NDrhQGC/YdbDQDffcfRd1hy9wVL4y3JsM2T/zAPZssUf+03exW+yA
   Q==;
X-CSE-ConnectionGUID: xNXhyDgISvOZorfs0KZcNA==
X-CSE-MsgGUID: Yh0jM0wfT2aQ1xS+BxEcRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75225027"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="75225027"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 15:18:19 -0700
X-CSE-ConnectionGUID: gxll0bAgRCmmlb+HaoDwgQ==
X-CSE-MsgGUID: B3lKdIZvTsWsbpc1FiV25Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166758011"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Aug 2025 15:18:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unPDO-000DDi-2T;
	Sat, 16 Aug 2025 22:17:44 +0000
Date: Sun, 17 Aug 2025 06:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [robh:ethos-v3 5/5] drivers/accel/ethosu/ethosu_job.c:526:11-12:
 WARNING kvmalloc is used to allocate this memory at line 507
Message-ID: <202508170658.piZsFR7J-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v3
head:   74531049aaf7feda960f5e7d701a417dd7620b2c
commit: 74531049aaf7feda960f5e7d701a417dd7620b2c [5/5] renaming
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: powerpc-randconfig-r051-20250817 (https://download.01.org/0day-ci/archive/20250817/202508170658.piZsFR7J-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508170658.piZsFR7J-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/ethosu/ethosu_job.c:526:11-12: WARNING kvmalloc is used to allocate this memory at line 507

vim +526 drivers/accel/ethosu/ethosu_job.c

262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  494) 
74531049aaf7fe drivers/accel/ethosu/ethosu_job.c Rob Herring (Arm  2025-08-15  495) int ethosu_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  496) {
74531049aaf7fe drivers/accel/ethosu/ethosu_job.c Rob Herring (Arm  2025-08-15  497) 	struct drm_ethosu_submit *args = data;
74531049aaf7fe drivers/accel/ethosu/ethosu_job.c Rob Herring (Arm  2025-08-15  498) 	struct drm_ethosu_job *jobs;
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  499) 	int ret = 0;
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  500) 	unsigned int i = 0;
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  501) 
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  502) 	if (args->pad) {
74531049aaf7fe drivers/accel/ethosu/ethosu_job.c Rob Herring (Arm  2025-08-15  503) 		drm_dbg(dev, "Reserved field in drm_ethosu_submit struct should be 0.\n");
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  504) 		return -EINVAL;
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  505) 	}
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  506) 
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29 @507) 	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  508) 	if (!jobs)
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  509) 		return -ENOMEM;
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  510) 
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  511) 	if (copy_from_user(jobs,
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  512) 			   (void __user *)(uintptr_t)args->jobs,
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  513) 			   args->job_count * sizeof(*jobs))) {
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  514) 		ret = -EFAULT;
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  515) 		drm_dbg(dev, "Failed to copy incoming job array\n");
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  516) 		goto exit;
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  517) 	}
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  518) 
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  519) 	for (i = 0; i < args->job_count; i++) {
74531049aaf7fe drivers/accel/ethosu/ethosu_job.c Rob Herring (Arm  2025-08-15  520) 		ret = ethosu_ioctl_submit_job(dev, file, &jobs[i]);
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  521) 		if (ret)
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  522) 			break;
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  523) 	}
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  524) 
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29  525) exit:
262ba534daf4b2 drivers/accel/ethos/ethos_job.c   Rob Herring (Arm  2025-05-29 @526) 	kfree(jobs);

:::::: The code at line 526 was first introduced by commit
:::::: 262ba534daf4b25e1dc026c627cecfd6979e6a5e accel: Add Arm Ethos-U NPU driver

:::::: TO: Rob Herring (Arm) <robh@kernel.org>
:::::: CC: Rob Herring (Arm) <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

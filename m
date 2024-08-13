Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E347F8
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Aug 2024 01:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723511573; cv=none; b=fTcxaSRt0Up13UUlBLnqwon7E4RLIqp5nnyhTefjiq83ANs7x6yxGevE3VVJLyEg9PBsGusnNa+1b2LiMyAVBDHHbROaITL34MJbLYADIpEs8uQyNV6shclLX90I5lasqP5AqDXjBorxglos+0vUmGpXX2//VOwjmXPYtFPxWLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723511573; c=relaxed/simple;
	bh=PxTN+oaLgmFw2sFRDa0AZkRhUw/OWAdDcc+buLou57E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mK/u9QZgynyYdAQ92tuy5VTG197svFyAX9W45uCWiVrUbsh7rnTk8i2/U0DbyHhCtqqYvorSic01EXym+AkWaRL2K6ARLq6lWEo5qxeb7hlWc4L5lLsrrlNOV5fjzwJ+vR2/Gd0hpIeKK7cLlH9nv3Nw5UltVczDkX7mfRWlZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTtONbQL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTtONbQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723511571; x=1755047571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PxTN+oaLgmFw2sFRDa0AZkRhUw/OWAdDcc+buLou57E=;
  b=GTtONbQL3yiDJ6iWf4DugictPOUkv7aB10OVS8T6CsvkY4YZMiK/En5S
   BUPov2gDOG8RS4Ke+AQyzIt2TsOx5/k+NIxcbc1waJzc5//W++UnGyilr
   JL9xy7TipwU6WdO/cew44HRdM2MXmYNnGNQXvsjZFEdVLgeqUnzOuR06H
   DQSuvhNxCfVRqhpZ3UfrsmetcWyEaqr4fxm8AlrUVYnkdjiJVrIrVDQeT
   2mJedX97+qDRT3AROXEi21yP9O3z3/JYE0+0Wd3gifELqWPIRbtt/Czng
   28LLjbqP2T3ogTe6N9qlrnAceXdwVLNnxIyQrY3xUrtbrIgCqms8ZJ/rd
   Q==;
X-CSE-ConnectionGUID: wXjO7Lt+SDq/ZE6Of4pPyQ==
X-CSE-MsgGUID: y+oE5DSeRFaSCFHJtKT7ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="47056595"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="47056595"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 18:12:47 -0700
X-CSE-ConnectionGUID: zVpUvSqLRgS2ZWHgMmGleQ==
X-CSE-MsgGUID: no6tDPxRQPmmxBuhQ8yLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="63452380"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Aug 2024 18:12:46 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdg5b-000CIB-0e;
	Tue, 13 Aug 2024 01:12:43 +0000
Date: Tue, 13 Aug 2024 09:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [viro-vfs:work.fdtable 13/13] kernel/fork.c:3242 unshare_fd() warn:
 passing a valid pointer to 'PTR_ERR'
Message-ID: <202408130945.I8wIAYBm-lkp@intel.com>
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
CC: linux-fsdevel@vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.fdtable
head:   3f4b0acefd818ec43b68455994ac2bd5166c06ae
commit: 3f4b0acefd818ec43b68455994ac2bd5166c06ae [13/13] dup_fd(): change calling conventions
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20240813 (https://download.01.org/0day-ci/archive/20240813/202408130945.I8wIAYBm-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408130945.I8wIAYBm-lkp@intel.com/

smatch warnings:
kernel/fork.c:3242 unshare_fd() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +3242 kernel/fork.c

cf2e340f4249b7 JANAK DESAI       2006-02-07  3228  
cf2e340f4249b7 JANAK DESAI       2006-02-07  3229  /*
a016f3389c0660 JANAK DESAI       2006-02-07  3230   * Unshare file descriptor table if it is being shared
cf2e340f4249b7 JANAK DESAI       2006-02-07  3231   */
60997c3d45d9a6 Christian Brauner 2020-06-03  3232  int unshare_fd(unsigned long unshare_flags, unsigned int max_fds,
60997c3d45d9a6 Christian Brauner 2020-06-03  3233  	       struct files_struct **new_fdp)
cf2e340f4249b7 JANAK DESAI       2006-02-07  3234  {
cf2e340f4249b7 JANAK DESAI       2006-02-07  3235  	struct files_struct *fd = current->files;
cf2e340f4249b7 JANAK DESAI       2006-02-07  3236  
cf2e340f4249b7 JANAK DESAI       2006-02-07  3237  	if ((unshare_flags & CLONE_FILES) &&
a016f3389c0660 JANAK DESAI       2006-02-07  3238  	    (fd && atomic_read(&fd->count) > 1)) {
3f4b0acefd818e Al Viro           2024-08-06  3239  		*new_fdp = dup_fd(fd, max_fds);
3f4b0acefd818e Al Viro           2024-08-06  3240  		if (IS_ERR(*new_fdp)) {
3f4b0acefd818e Al Viro           2024-08-06  3241  			*new_fdp = NULL;
3f4b0acefd818e Al Viro           2024-08-06 @3242  			return PTR_ERR(new_fdp);
3f4b0acefd818e Al Viro           2024-08-06  3243  		}
a016f3389c0660 JANAK DESAI       2006-02-07  3244  	}
cf2e340f4249b7 JANAK DESAI       2006-02-07  3245  
cf2e340f4249b7 JANAK DESAI       2006-02-07  3246  	return 0;
cf2e340f4249b7 JANAK DESAI       2006-02-07  3247  }
cf2e340f4249b7 JANAK DESAI       2006-02-07  3248  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

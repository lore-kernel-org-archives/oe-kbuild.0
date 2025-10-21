Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944B734D925
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 19:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761073844; cv=none; b=UuU3bawlE5Whek84dFHxaV+OSWHNeieVIBqKYTy7Erd+mba0kic7fdf+UYcuhzDyzXdfcEoP6WVmkliRXLYZlEpKnziaszwX7sggd7bn4cAxqgNG/kFrRKA+kZ0J2csHllMqmYg3HPQ3foCsgc63U5IObSPyHkReUINoSYE7yfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761073844; c=relaxed/simple;
	bh=VMqGCuqFsN6YxMi+lgNcXqSXJ5vdH9+nqlzj3Ll4ZaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WgO/JoLPzB7YUpTjQCxAltB+neEazBCFlTTIjXCJGZ3KVVIawRu0d2YUpRfznT+bKl10G7hsmghZlfAGkxxY0WmDiVKc5OK3ngvjKdwM0gDtRsMuhYgbjVXY6t5yBLrd8sW19AZSUxs9yDfU6VFB52j7Pb6/0K4x/OhZGeqEdsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNjJkPmz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNjJkPmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761073842; x=1792609842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMqGCuqFsN6YxMi+lgNcXqSXJ5vdH9+nqlzj3Ll4ZaU=;
  b=QNjJkPmzN4lU8T7dBak8d0syfwFU7srtQpQvGLQa6FYADAp6Kgit1V+I
   Z1AGc/ISHts3U8bs3fk9Elr2Cc/3BPUsuacLMdfHGS/rw62PBKyaL5Hvt
   0VkzkA/mR+RtUAFEi6tRIcXV1wnr6zsPIQ2tVZcPfAM2xb+tu08zNfMy+
   VmE3puEP0jMkNnPBOCcfhNKyza7bngXDSff4WSRRLhZTo1X3q/0/2LHXk
   MgYZxEdZt3kSun+sMUJywCet1xy5loZ1LyNNG4EGxlpSDqLmwLZG3ICxr
   j85B1cKrzWDCg+DYaJyEdOcvRB9lXvtGEfMw32glFPW98k8aTBMRmc+Qo
   Q==;
X-CSE-ConnectionGUID: L5T72gYnSsO0czgpOsVpKA==
X-CSE-MsgGUID: hnVVF5gERjqanxkHN7pM7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62242653"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="62242653"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 12:10:42 -0700
X-CSE-ConnectionGUID: TJhMDo/NTqa24SyOYv8Cgw==
X-CSE-MsgGUID: Un8kvJNTSnCt44uHK3u+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="184154920"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2025 12:10:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBHke-000BFH-20;
	Tue, 21 Oct 2025 19:10:37 +0000
Date: Wed, 22 Oct 2025 03:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/token.c:217:47: sparse: signed value source
Message-ID: <202510220549.PAk5rcYC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/bpf/token.c:217:47: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tao Chen <chen.dylane@linux.dev>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 19d18fdfc79217c86802271c9ce5b4ed174628cc bpf: Add struct bpf_token_info
date:   3 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-r123-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220549.PAk5rcYC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220549.PAk5rcYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510220549.PAk5rcYC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/token.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> kernel/bpf/token.c:217:47: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   kernel/bpf/token.c:230:13: sparse: signed value source

vim +217 kernel/bpf/token.c

35f96de04127d33 Andrii Nakryiko 2024-01-23  212  
19d18fdfc79217c Tao Chen        2025-07-16  213  int bpf_token_get_info_by_fd(struct bpf_token *token,
19d18fdfc79217c Tao Chen        2025-07-16  214  			     const union bpf_attr *attr,
19d18fdfc79217c Tao Chen        2025-07-16  215  			     union bpf_attr __user *uattr)
19d18fdfc79217c Tao Chen        2025-07-16  216  {
19d18fdfc79217c Tao Chen        2025-07-16 @217  	struct bpf_token_info __user *uinfo = u64_to_user_ptr(attr->info.info);
19d18fdfc79217c Tao Chen        2025-07-16  218  	struct bpf_token_info info;
19d18fdfc79217c Tao Chen        2025-07-16  219  	u32 info_len = attr->info.info_len;
19d18fdfc79217c Tao Chen        2025-07-16  220  
19d18fdfc79217c Tao Chen        2025-07-16  221  	info_len = min_t(u32, info_len, sizeof(info));
19d18fdfc79217c Tao Chen        2025-07-16  222  	memset(&info, 0, sizeof(info));
19d18fdfc79217c Tao Chen        2025-07-16  223  
19d18fdfc79217c Tao Chen        2025-07-16  224  	info.allowed_cmds = token->allowed_cmds;
19d18fdfc79217c Tao Chen        2025-07-16  225  	info.allowed_maps = token->allowed_maps;
19d18fdfc79217c Tao Chen        2025-07-16  226  	info.allowed_progs = token->allowed_progs;
19d18fdfc79217c Tao Chen        2025-07-16  227  	info.allowed_attachs = token->allowed_attachs;
19d18fdfc79217c Tao Chen        2025-07-16  228  
19d18fdfc79217c Tao Chen        2025-07-16  229  	if (copy_to_user(uinfo, &info, info_len) ||
19d18fdfc79217c Tao Chen        2025-07-16  230  	    put_user(info_len, &uattr->info.info_len))
19d18fdfc79217c Tao Chen        2025-07-16  231  		return -EFAULT;
19d18fdfc79217c Tao Chen        2025-07-16  232  
19d18fdfc79217c Tao Chen        2025-07-16  233  	return 0;
19d18fdfc79217c Tao Chen        2025-07-16  234  }
19d18fdfc79217c Tao Chen        2025-07-16  235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EEC347505
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781262179; cv=none; b=smn43sXjpFVdxWKtPyE9zGBfOEhZ8KyezmPg6cvvHRlAvr7vjiRZKuS3/Pqz55SQvL8qhY51AF4JzzTc9YLBGoSHAhFzVSXBeYz+FYyVOzxysvkUutRSwQDTQbhwuUU2bBWem+YRfUWnY8CLkE8lMLA2L3/yGXPItLNFFc00VCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781262179; c=relaxed/simple;
	bh=yWfq02XqjLidvyFtQokGUh/Ol0aDzGqEbZFDgvRLxM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtKooZXpEakxhmMImmW2YVUiJPcXRU7deenaiqT7cdk56gi4BllV2aAIluwaXZfq5IcYvehtMEAWJPOF/+c/cxvpdpq9HhYB4cBu7tZ+O1H2ulyMWHh9Ltwx8vtn8faPY/Wgb+Y6I8V6aCVhJBecdshGrvcgBfuiC7r55P2RURI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bz/2EVjz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bz/2EVjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781262177; x=1812798177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yWfq02XqjLidvyFtQokGUh/Ol0aDzGqEbZFDgvRLxM0=;
  b=Bz/2EVjzFngQFh2o0BC+KR070lk8geYfZOgwPbhR8OgwTJUHMD8BdzEn
   TGOhtQMEUa312E2sz3X9aO2BhstlVS96sxFnjxxCPR9EVZk0yoZT1HAnD
   ijd/nMioLMvUAD06p1xpq/Ikin+nvUnfpNgxwAdIx+mhIb6USMXniV0ze
   ncUBnxR3bupVA2BapP+nwkckuygh9pbGwLrmHKVFp8ugQdd8T7+vkta7Q
   3mQ5LHEDQuUIUb3U64FpiwHrwOw6CBTysg3heGXUirTZdz2mk4wRU4DFt
   xrOcIq6ztgr278RNKROG/wuQQjwQi8Df8L9EC9rFX4Cs0YzyZEIlFnUS/
   w==;
X-CSE-ConnectionGUID: /Q97H1lDQOGNJwbqJbjHjw==
X-CSE-MsgGUID: rhAuqq97TGy2W8sYDY3DNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85721303"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="85721303"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 04:02:57 -0700
X-CSE-ConnectionGUID: SS9CdFvoRxSy53hyo1/Zlg==
X-CSE-MsgGUID: B6RzyxXGSfWRFpKlpLyBGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="244369569"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2026 04:02:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXzf2-00000000Odh-3eSS;
	Fri, 12 Jun 2026 11:02:52 +0000
Date: Fri, 12 Jun 2026 19:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] Add LoadPin support for eBPF program loading
Message-ID: <202606121804.5BKo0Bfw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260611-b4-rfc-loadpin-ebpf-v1-1-11a6c8e6170d@outlook.com>
References: <20260611-b4-rfc-loadpin-ebpf-v1-1-11a6c8e6170d@outlook.com>
TO: Alex Roberts via B4 Relay <devnull+alex.roberts109.outlook.com@kernel.org>
TO: Kees Cook <kees@kernel.org>
TO: Paul Moore <paul@paul-moore.com>
TO: James Morris <jmorris@namei.org>
TO: "Serge E. Hallyn" <serge@hallyn.com>
CC: linux-kernel@vger.kernel.org
CC: linux-security-module@vger.kernel.org
CC: bpf@vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: KP Singh <kpsingh@kernel.org>
CC: Alex Roberts <alex.roberts109@outlook.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on 122b52f0bab007ebeb414c8280c1def17b9ed1f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Roberts-via-B4-Relay/Add-LoadPin-support-for-eBPF-program-loading/20260612-031559
base:   122b52f0bab007ebeb414c8280c1def17b9ed1f4
patch link:    https://lore.kernel.org/r/20260611-b4-rfc-loadpin-ebpf-v1-1-11a6c8e6170d%40outlook.com
patch subject: [PATCH] Add LoadPin support for eBPF program loading
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260612/202606121804.5BKo0Bfw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c8ad049db78ae52052722b6f42b54cd2a666072b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121804.5BKo0Bfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606121804.5BKo0Bfw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/selinux/hooks.c:4449:2: error: call to '__compiletime_assert_1089' declared with 'error' attribute: New kernel_load_data_id introduced; update SELinux!
    4449 |         BUILD_BUG_ON_MSG(LOADING_MAX_ID > 8,
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:699:2: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:198:1: note: expanded from here
     198 | __compiletime_assert_1089
         | ^
>> security/selinux/hooks.c:4412:2: error: call to '__compiletime_assert_1088' declared with 'error' attribute: New kernel_read_file_id introduced; update SELinux!
    4412 |         BUILD_BUG_ON_MSG(READING_MAX_ID > 8,
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:699:2: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:195:1: note: expanded from here
     195 | __compiletime_assert_1088
         | ^
   2 errors generated.


vim +4449 security/selinux/hooks.c

61d612ea731e57 Jeff Vander Stoep   2016-04-05  4405  
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4406  static int selinux_kernel_read_file(struct file *file,
2039bda1fa8dad Kees Cook           2020-10-02  4407  				    enum kernel_read_file_id id,
2039bda1fa8dad Kees Cook           2020-10-02  4408  				    bool contents)
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4409  {
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4410  	int rc = 0;
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4411  
c200892b46ba3d Coiby Xu            2025-11-19 @4412  	BUILD_BUG_ON_MSG(READING_MAX_ID > 8,
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4413  			 "New kernel_read_file_id introduced; update SELinux!");
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4414  
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4415  	switch (id) {
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4416  	case READING_FIRMWARE:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4417  		rc = selinux_kernel_load_from_file(file, SYSTEM__FIRMWARE_LOAD);
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4418  		break;
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4419  	case READING_MODULE:
c200892b46ba3d Coiby Xu            2025-11-19  4420  	case READING_MODULE_COMPRESSED:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4421  		rc = selinux_kernel_load_from_file(file, SYSTEM__MODULE_LOAD);
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4422  		break;
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4423  	case READING_KEXEC_IMAGE:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4424  		rc = selinux_kernel_load_from_file(file,
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4425  						   SYSTEM__KEXEC_IMAGE_LOAD);
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4426  		break;
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4427  	case READING_KEXEC_INITRAMFS:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4428  		rc = selinux_kernel_load_from_file(file,
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4429  						SYSTEM__KEXEC_INITRAMFS_LOAD);
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4430  		break;
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4431  	case READING_POLICY:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4432  		rc = selinux_kernel_load_from_file(file, SYSTEM__POLICY_LOAD);
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4433  		break;
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4434  	case READING_X509_CERTIFICATE:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4435  		rc = selinux_kernel_load_from_file(file,
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4436  						SYSTEM__X509_CERTIFICATE_LOAD);
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4437  		break;
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4438  	default:
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4439  		break;
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4440  	}
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4441  
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4442  	return rc;
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4443  }
61d612ea731e57 Jeff Vander Stoep   2016-04-05  4444  
b64fcae74b6d69 Kees Cook           2020-10-02  4445  static int selinux_kernel_load_data(enum kernel_load_data_id id, bool contents)
c77b8cdf745d91 Mimi Zohar          2018-07-13  4446  {
c77b8cdf745d91 Mimi Zohar          2018-07-13  4447  	int rc = 0;
c77b8cdf745d91 Mimi Zohar          2018-07-13  4448  
c200892b46ba3d Coiby Xu            2025-11-19 @4449  	BUILD_BUG_ON_MSG(LOADING_MAX_ID > 8,
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4450  			 "New kernel_load_data_id introduced; update SELinux!");
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4451  
c77b8cdf745d91 Mimi Zohar          2018-07-13  4452  	switch (id) {
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4453  	case LOADING_FIRMWARE:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4454  		rc = selinux_kernel_load_from_file(NULL, SYSTEM__FIRMWARE_LOAD);
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4455  		break;
c77b8cdf745d91 Mimi Zohar          2018-07-13  4456  	case LOADING_MODULE:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4457  		rc = selinux_kernel_load_from_file(NULL, SYSTEM__MODULE_LOAD);
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4458  		break;
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4459  	case LOADING_KEXEC_IMAGE:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4460  		rc = selinux_kernel_load_from_file(NULL,
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4461  						   SYSTEM__KEXEC_IMAGE_LOAD);
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4462  		break;
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4463  	case LOADING_KEXEC_INITRAMFS:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4464  		rc = selinux_kernel_load_from_file(NULL,
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4465  						SYSTEM__KEXEC_INITRAMFS_LOAD);
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4466  		break;
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4467  	case LOADING_POLICY:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4468  		rc = selinux_kernel_load_from_file(NULL,
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4469  						   SYSTEM__POLICY_LOAD);
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4470  		break;
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4471  	case LOADING_X509_CERTIFICATE:
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4472  		rc = selinux_kernel_load_from_file(NULL,
2c2b1e059792f6 "Kipp N. Davis"     2025-02-11  4473  						SYSTEM__X509_CERTIFICATE_LOAD);
b2d99bcb27225f Gustavo A. R. Silva 2020-11-20  4474  		break;
c77b8cdf745d91 Mimi Zohar          2018-07-13  4475  	default:
c77b8cdf745d91 Mimi Zohar          2018-07-13  4476  		break;
c77b8cdf745d91 Mimi Zohar          2018-07-13  4477  	}
c77b8cdf745d91 Mimi Zohar          2018-07-13  4478  
c77b8cdf745d91 Mimi Zohar          2018-07-13  4479  	return rc;
c77b8cdf745d91 Mimi Zohar          2018-07-13  4480  }
c77b8cdf745d91 Mimi Zohar          2018-07-13  4481  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

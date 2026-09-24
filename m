Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D152222AA
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 01:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211972; cv=none; b=scXFSAzFoPBVFGB5nEzZ2LIz8uu+soSqbZHpI8DyvCN9a/7fTKzWipyI7fFLhIPu3g+TYCc1iNH1ZN4dNeBVLmljDG5qaUf6e+Kq1QIMBGSPGBhuESaoj1UB7aLLVkbOprnEQVNIwOlvKylq13Sei7hDnA/ABIGhotEKi6uQyOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211972; c=relaxed/simple;
	bh=OrL+VCYoIO4hQx8WzDvHICaEKkEm2//w/5QMe74kCo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a9VTPlBkV8AJA+SCiMaSiaa/HS7IKFuQlzHIG2cChXExJBzNkQFy1w/Pk7Ez0gGVxAmSUpujb5mU5EKzja/6KZaePGlH7Q4t3rBe5KzzKA+pFj7Loat2/NMoT7OsFsnzCovMP+laptAXLd9gZYwHsGlIYNz1JntXRj6qZcG/2pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeHv4dQJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeHv4dQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790211970; x=1821747970;
  h=date:from:to:cc:subject:message-id;
  bh=OrL+VCYoIO4hQx8WzDvHICaEKkEm2//w/5QMe74kCo4=;
  b=SeHv4dQJprhsX2NdpPDhHeSFis11bJkXorLydZMr2wLgxRxnpMeCc24M
   qoTYHqh/NO4ojJBjkrfhg2JiFUswu2xVYMUgAVw81CC9vRIK7OpHMy8xN
   fNFSI6NMCv3H93cgtH1+IutivcpD5jAbugDwp/ghaYdSwMOVUc2G04UJH
   +P+E8UGxKI3zQrPpmshcgBxIJiyjS4EPdNcyaJeV9iOo2fIw4BVTcDCZa
   MCy8XUJd8Py+rwGU86RRxeNn6mAkSJzfvRjNP2NY/yg0atYGRnjc/Tykg
   IdFp/+Kp4XASGpMMvQmH3qCZ2kHDtpndOv3VRUzq9PVxPoOtIvhxunfz3
   w==;
X-CSE-ConnectionGUID: m9VphzNvS4OzLD6vnnDEjQ==
X-CSE-MsgGUID: yHVYl7+rSdyo218VSh0Nlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101621733"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="101621733"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 18:06:09 -0700
X-CSE-ConnectionGUID: hkVP8fZGTCaAr+XwbBEJjw==
X-CSE-MsgGUID: 7/PZV5fsSDK0UK9uMJx9fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="301803326"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2026 18:06:08 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9XuY-00000000I32-1ho9;
	Thu, 24 Sep 2026 01:06:06 +0000
Date: Thu, 24 Sep 2026 09:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/sparc/kernel/perf_regs.c:39:5: error: conflicting types
 for 'perf_reg_validate'; have 'int(u64)' {aka 'int(long long unsigned int)'}
Message-ID: <202609240809.7szNmwoa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Stian-Halseth/perf-core-Let-an-arch-prepare-the-user-stack-before-it-is-dumped/20260922-221505, commit: eb8b7ebf8d9465ac22ef57720168a3b8183a91f5"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Stian Halseth <stian@itx.no>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Stian-Halseth/perf-core-Let-an-arch-prepare-the-user-stack-before-it-is-dumped/20260922-221505
head:   c221c81210abcb491cd4557f5cbcc2e652cbf127
commit: eb8b7ebf8d9465ac22ef57720168a3b8183a91f5 sparc64: Support PERF_SAMPLE_REGS_USER and PERF_SAMPLE_STACK_USER
date:   28 hours ago
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: sparc64-randconfig-1001-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240809.7szNmwoa-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240809.7szNmwoa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609240809.7szNmwoa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sparc/kernel/perf_regs.c:39:5: error: conflicting types for 'perf_reg_validate'; have 'int(u64)' {aka 'int(long long unsigned int)'}
      39 | int perf_reg_validate(u64 mask)
         |     ^~~~~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:50,
                    from arch/sparc/kernel/perf_regs.c:2:
   include/linux/perf_regs.h:13:5: note: previous declaration of 'perf_reg_validate' with type 'int(u64,  bool)' {aka 'int(long long unsigned int,  _Bool)'}
      13 | int perf_reg_validate(u64 mask, bool simd_enabled);
         |     ^~~~~~~~~~~~~~~~~


vim +39 arch/sparc/kernel/perf_regs.c

eb8b7ebf8d9465a Stian Halseth 2026-09-22  38  
eb8b7ebf8d9465a Stian Halseth 2026-09-22 @39  int perf_reg_validate(u64 mask)
eb8b7ebf8d9465a Stian Halseth 2026-09-22  40  {
eb8b7ebf8d9465a Stian Halseth 2026-09-22  41  	if (!mask || mask & REG_RESERVED)
eb8b7ebf8d9465a Stian Halseth 2026-09-22  42  		return -EINVAL;
eb8b7ebf8d9465a Stian Halseth 2026-09-22  43  
eb8b7ebf8d9465a Stian Halseth 2026-09-22  44  	return 0;
eb8b7ebf8d9465a Stian Halseth 2026-09-22  45  }
eb8b7ebf8d9465a Stian Halseth 2026-09-22  46  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

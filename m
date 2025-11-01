Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A3834D3B1
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Nov 2025 23:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762041163; cv=none; b=PDP8/KO4izXrxqpFOMJTty12Ba4YM4E9LTk+7M6ZdxyHemjkV1BaHUcO5sBJRHiyLmcQkIlDoixj5mjD3Hp+U2KEHn/41m8uFWtPRxloQe8TvbxErKzvsMInGki6nL4uD75dQyOsjO+hnskhBOVpZUKTJ9KGQp5IxKOs2ZcmFrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762041163; c=relaxed/simple;
	bh=VShmfXUedAcpliBSdi5LbMINAZ82w6NH02Ea+sPjgi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E3MLcHJ5p6j9iDhH9MDQlFaO3nW4GE3bo+mJyjHIG8QJQ6t38avEVCalkZVWZ5XAT4gtl4mQAyciiROVFU6jDwfA9Fg2/C1XjwmTyKcL5/1p4AlmfEUWrSp8GKdoDjNC0MesnvW3E8qTIJYLnSAAXWnSSXxJ4ER/eEyz6MqpqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWWr3dph; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWWr3dph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762041163; x=1793577163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VShmfXUedAcpliBSdi5LbMINAZ82w6NH02Ea+sPjgi4=;
  b=LWWr3dphjKelD2WE1HH3dm4rtq70BWxkViwl520TbuoFiEn3THGLSVVG
   nsQqhC/YvAKsiZa8qGoAv8XsFrKW60RQGCenhFFLNGnxMkGvX/RQU5TeV
   4V07OB3YA55Uv+JsBXr69LP4aTWNWGv53IteEUM+bfMmr8C3fEeuXpBDw
   QiwESvYuFzkojn38IVb8JY2ndPz/xmfhXWB4BpGGwCrxXrZxVn+RUS51e
   rmX9FkYgI8DKcjKvcQaPOfwvupfqPCE0v8GkcZEbft0F/pXKwTIJsX+9i
   uAJ+iNR2RbXDAi4cDiv/GVGxw49Najk+nLQKxCyudkwu+WsokoUpOAPuT
   w==;
X-CSE-ConnectionGUID: recUUXRGQOmSfWlHgrQpsg==
X-CSE-MsgGUID: 6GZ7DZ+tTbWB3Mr4BHRKeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="81576321"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="81576321"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 16:52:42 -0700
X-CSE-ConnectionGUID: 1DzuxiEoTni+UoasmiBPYg==
X-CSE-MsgGUID: sWIqNXGBRQ2mIyGRpd25Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="217377758"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Nov 2025 16:52:40 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vFLOg-000000001Ou-2CSg;
	Sat, 01 Nov 2025 23:52:38 +0000
Date: Sun, 2 Nov 2025 00:52:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:main-16k-gs-shusky-5.15 23/23]
 drivers/ufs/core/ufshcd-crypto.c: trace/hooks/ufshcd.h is included more than
 once.
Message-ID: <202511020020.pSdzEvdw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   90b05bcbb174b28bb0bc20f6d7f68c092a66a64f
commit: 93f55093bb2cba35d6c729d2fc0361bdef7bd1be [23/23] ANDROID: scsi: ufs: add vendor hook to override key reprogramming
:::::: branch date: 3 days ago
:::::: commit date: 3 years ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511020020.pSdzEvdw-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/ufs/core/ufshcd-crypto.c: trace/hooks/ufshcd.h is included more than once.

vim +10 drivers/ufs/core/ufshcd-crypto.c

     8	
     9	#undef CREATE_TRACE_POINTS
  > 10	#include <trace/hooks/ufshcd.h>
    11	
    12	#undef CREATE_TRACE_POINTS
  > 13	#include <trace/hooks/ufshcd.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

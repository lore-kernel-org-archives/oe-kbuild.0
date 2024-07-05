Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC614A622
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720186907; cv=none; b=sJVRZ1ggaLlTnXvMz6wxBg2QbnQqQckP498B+o61bd1cVjR/sg5dUvzCX9ayOqhXiTKeFx7D7DGCzCzhpNjdRZJWkHtRsXgNg4Nv/Vvv5Xi2kLlxgC58n5Wfjso29Kg5KUOoPfDuto2uD9BiIg6QOW3R/6Bqf1yk3LD2IrpZffA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720186907; c=relaxed/simple;
	bh=r3c+CZEkWwYD08Whp+FxVw98RbM/x4n0D6c/Z6VaAdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y81aeRC3+ZQgt9mdNPGSf5Jg7R6zzpV23Qe9PbxHHveO3DVSwXcVWK2BMd5HrZIDUVVj/FZYb8k4VfgE7Xj6fYW6zJLk5rU0AmQb4uPxVDpJvLFLh2+sNV+1LDM+PF5bm1qEE8Zpmc1SLPIs9Zrjiz25tPluRZ1UrT3V+lHFKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xe0lKN3A; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xe0lKN3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720186906; x=1751722906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r3c+CZEkWwYD08Whp+FxVw98RbM/x4n0D6c/Z6VaAdM=;
  b=Xe0lKN3AL92Qfpc8iEawujE2lNzW3/54rx3Je++uF7xlnR4l3Kv8R4Zt
   plxiUFzZUMw5fmlE0Kc2gwAtNoRq/l3MPEkFl3F8MLgS+sZXRN9kfK0qI
   kHVRGj+EqlgW4jCflDdvM4I+eoHYEWatl/DfBXgHoPSS5YhDPnRV7fMnw
   tOW/otFoUXt843Tqq5j8n72dfQ7678yHyQBZp130LfD1WMFlat+s2tIlp
   4VqopZ+NnIUk9cCcMK1+yxgL7ZneBEIHpTUVfpPu79wq7+ij7xEpmAXUx
   V+SEnybYseH87Py5ZNooN1hNh94tDnceMKIBlL1Pe5yeQP9LFPfYQOPzw
   A==;
X-CSE-ConnectionGUID: JO1HPi0qRPKTN60UzUJVnA==
X-CSE-MsgGUID: MM4Dhv4rQmyRhfSimzZUSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21249280"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="21249280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 06:41:46 -0700
X-CSE-ConnectionGUID: x54Cl/QDR+WlsYgWA1hpyg==
X-CSE-MsgGUID: ekSbvAbLQweYq3EpEKWsVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="52068171"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jul 2024 06:41:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPjC2-000SQo-0b;
	Fri, 05 Jul 2024 13:41:42 +0000
Date: Fri, 5 Jul 2024 21:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-xe:drm-xe-next 1/2] drivers/gpu/drm/xe/xe_gt.c:
 generated/xe_wa_oob.h is included more than once.
Message-ID: <202407052122.AzuWSPuo-lkp@intel.com>
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
CC: intel-xe@lists.freedesktop.org
TO: Matthew Auld <matthew.auld@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   c55f79f317ab428ae6d005965bc07e37496f209f
commit: 01570b446939c3538b1aa3d059837f49fa14a3ae [1/2] drm/xe/bmg: implement Wa_16023588340
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407052122.AzuWSPuo-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_gt.c: generated/xe_wa_oob.h is included more than once.

vim +12 drivers/gpu/drm/xe/xe_gt.c

     9	
    10	#include <drm/drm_managed.h>
    11	#include <drm/xe_drm.h>
  > 12	#include <generated/xe_wa_oob.h>
    13	
  > 14	#include <generated/xe_wa_oob.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

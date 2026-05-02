Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F3014EC73
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777707363; cv=none; b=KhL6nN0lh8g6vkyia9iEVriL7xsCPxfyPnzLhcD5/y4+Qf1oEFZPbl72hXxRhD15Q9c7AuQHIXMl8NYuwoJVxb55lwCk7VeaTuf5oUFv40kA083hFukOaI3L1QmoGJDq1+wS4qCc2pDh+Rv1VL5b82rzaWxPlJnJyr/7T9xBoII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777707363; c=relaxed/simple;
	bh=Jmagw5xHV/V+SNtxZY+zFrFTyoV6UQAbLLT5KyEf3Nk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s7i7J9pJcorc5DCLYmGWa4/X/JWDvNb7hrsdZalwUPG0nADCjLH/nSHh5/US8ihADyx61LCrdzTjfUQP8rkioqtBnslXNzHAq4vNIFOeBFBja3oPOYyMqrifR+G4JwiJj96GJO/crTksxKnYASxA1ylmX3cVoq4A819oRz8Fd+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcCrgXGD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcCrgXGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777707362; x=1809243362;
  h=date:from:to:cc:subject:message-id;
  bh=Jmagw5xHV/V+SNtxZY+zFrFTyoV6UQAbLLT5KyEf3Nk=;
  b=ZcCrgXGDDoy0rGkiwCZuWUiRNFWciJISF0WwsuTsPyDMTu29BBkH81p7
   0GJ7f06KFDNv9mVWr3YfHVKUyiPoK/5CXlEkEh/F5Ws6gaK4W/56D1Qct
   nC8wK55AH9raXiTqUJ2h4VcMicTl8iPKnxsG85dHnc9dN8jTq3XntoJkl
   a5fOwoec0ERr7VSa4zwDeYnIYtmynxcxmGkCDBAW/QKZ5QXSWIiAGfoCE
   KbSKKgHhEPxj8CtUg1e2NKzUtUngXQLJ2zui+DAlBsvAyEbb9sc5rYwOj
   M6DF6ef28XEEt14YMNl0tkkIGH2bABgjeh99KrUO86U2U8W9wAr8Uz8an
   g==;
X-CSE-ConnectionGUID: UHPv5pCfR1mTt5PdL9Eqkg==
X-CSE-MsgGUID: eznfA5yNRF6xB6mlgDgj4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="82260472"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="82260472"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 00:36:02 -0700
X-CSE-ConnectionGUID: qHZjtKpCRISF/0CkbpXXuw==
X-CSE-MsgGUID: p2qN2izcQaaOV8MrNVFy4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="230696092"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2026 00:36:00 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ4tJ-000000005Dd-2xO7;
	Sat, 02 May 2026 07:35:57 +0000
Date: Sat, 02 May 2026 09:35:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: kernel/workqueue.c:2603 function parameter
 'dwork_active_cpu' not described in '__queue_delayed_work_on'
Message-ID: <202605020915.eLnU2t4f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Partha Sarathi Satapathy <partha.satapathy@oracle.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Partha-Satapathy/timer-add-add_timer_active_cpu/20260424-180422
head:   abb69db26c168252f2c19e97235ec3147c95e0ca
commit: abb69db26c168252f2c19e97235ec3147c95e0ca workqueue: add queue_delayed_work_active_cpu()
date:   8 days ago
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260502/202605020915.eLnU2t4f-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020915.eLnU2t4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605020915.eLnU2t4f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/workqueue.c:2603 function parameter 'dwork_active_cpu' not described in '__queue_delayed_work_on'
>> Warning: kernel/workqueue.c:2603 expecting prototype for queue_delayed_work_on(). Prototype was for __queue_delayed_work_on() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

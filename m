Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F65E33F374
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765869618; cv=none; b=gSjpeOucDhbwcENByXeg5aKwVs5vp0YFair1fYzVYQnHgaXWU5UPiVM3yokAhWymQB7JZDJoHNLOaoXPgBP7T86WLWL12HIasHykwkGsUzcdBiYoQFiu1/LiMKmSdeicDOTEc3UOuAq4pP3TEG1DNJsR+eqdDFQQ073LfWrGOvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765869618; c=relaxed/simple;
	bh=LT3igHkwuqtV9/JnEjS2vej4DqBSuT3l67kYNQZnabU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BKzyWgIv2SQOhsfsasdlMsjR7CCaSgmpkVqyKjT40KBTT10aRHaAhc9SbFp1y1d0gvfI8lSDx3HZZxxa8gasY4QOzO6WbA2aYIbEJFvcS+ZqWXmhT/lSuVHkgetGK2L/LYDNez3Q4aZLhqHUgXX+41pOd6FgKhIxp6V8o8n5U7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTN/2WF1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTN/2WF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765869615; x=1797405615;
  h=date:from:to:subject:message-id:mime-version;
  bh=LT3igHkwuqtV9/JnEjS2vej4DqBSuT3l67kYNQZnabU=;
  b=CTN/2WF1GTKPu0HurYfiZ4RN6LEG6beQkdqRXGi7+FWWPjjZ7GAPjDBn
   5AkxIlZvr8qnKK6dwXW/vVP44XXJCOeDuhJIP45HrP/HPAgugkDL5Fb4b
   yBN6rk2X9yumvnPGrdpV95VXE1mUu4noBSPaZa3b9KzbqSXAnknvOuOTa
   wEmFUu3oClcs8ExPKClamnxgw2sf1WcRYe4Hhie00IS6DS18pZHlXjPtu
   7T8NtB27nFfrcKPutEO21i2SaOitACBdy3iBornEqYh18C+J9XAXxGHC+
   Y7y0Dj6qPpmJarNk7JxJoQlJjvJfZmTyFEiGp6IbEj4I7lQ8ZWWGFmLLa
   g==;
X-CSE-ConnectionGUID: RdZCAnPfSFKrVO+KuEad6g==
X-CSE-MsgGUID: gQ6y4lXXQM27MzQnvkh07Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78491754"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="78491754"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 23:20:14 -0800
X-CSE-ConnectionGUID: mexuu4RIQwSzyU0pVDI+5w==
X-CSE-MsgGUID: vmM0V6VEQtK+6RpbVt51Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197696513"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2025 23:20:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVPLv-0000000032g-2Ajw
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 07:20:11 +0000
Date: Tue, 16 Dec 2025 08:19:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v4 04/28] drm/sched: Add some more scheduling quality
 unit tests
Message-ID: <202512160857.QOauDxcf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251215150807.58819-5-tvrtko.ursulin@igalia.com>
References: <20251215150807.58819-5-tvrtko.ursulin@igalia.com>
TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
TO: dri-devel@lists.freedesktop.org

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Consolidate-entity-run-queue-management/20251216-012213
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251215150807.58819-5-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v4 04/28] drm/sched: Add some more scheduling quality unit tests
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512160857.QOauDxcf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'test'
#25: 
Every 100ms for the duration of the test test logs how many jobs each

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

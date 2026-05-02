Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B032D3220
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 06:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777701851; cv=none; b=qmJiQybgaDJ8cCudmAsyNuhraOPck3wLbUrkM/gkQDwVR2yt9Ly+clPuCloVYBMeg8NTHpx8wbY3dhQQyB1m0ibm8av/WyxnWXCIwcEqcJ4zmCngXJq9MO2C5St9APsWzAmsVwO3jrMwc4FGbHaOJutxxt+7kNaKmhzZO6d244M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777701851; c=relaxed/simple;
	bh=xUPqADisUxumJaodyT+xIIyBn+SHZPWEf8Jf6x5zUgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pUqO2/lOCi+EFFSQnsqzWSkls9pweL7vhvQsYygb2JAFfCWvRaXRdwtNt+ldX4JhvDWTGJfRtsnTeIRSCX6EnP5Fx8S+5AUNi0vQLPY4Adip/Tiqm7YnLDOGZSV6MlKxtJru2IkGSFMhOjZRtG/Wkx68U1C4NpbV80ge8WioFvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXSnzF/V; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXSnzF/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777701850; x=1809237850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUPqADisUxumJaodyT+xIIyBn+SHZPWEf8Jf6x5zUgI=;
  b=mXSnzF/V6ZNMuMxio6VVEgsdfsqaUdX7lQgA+Mp3Mfu38FDxIyyYeKx5
   zWCm5/pU+WYRlWA3o836UegRT0XBLXIvYWblMzdTIn0NMyrBHxYik49SI
   c5m7L72W3v/yBepufw2z75V7ZKaCq696DNg51qmg00OG35UCxtrlDa/zG
   c06n5KxYFcIL2qMZNO9CjK+nf5/4BOzS/n0WXLri1t/VEA8klpATDLMsV
   mzZ6MBw1nmP6Jq3JVI9xHHFpoHXFs/5iy45N2G8ykmLjnGCE4Z7Swc5Ak
   O42lyKTBI9m+beZrHh+csbHNkMCBW4absXIT6cN+pBxY5/OgAPDO+lMfp
   Q==;
X-CSE-ConnectionGUID: 4QfLYf2XQgyDkRNUycWJ/Q==
X-CSE-MsgGUID: e2RWWMoMTi+JkqTdGXEGyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="88962171"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="88962171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 23:04:03 -0700
X-CSE-ConnectionGUID: zxFDPlZKRAOQ21D+tz71IQ==
X-CSE-MsgGUID: HzlZYwkZQMCUWfyWDGYFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="230683899"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2026 23:03:59 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ3SG-000000005Cz-4100;
	Sat, 02 May 2026 06:03:56 +0000
Date: Sat, 2 May 2026 08:03:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] workqueue: add queue_delayed_work_active_cpu()
Message-ID: <202605020758.WFrcGcKb-lkp@intel.com>
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
In-Reply-To: <20260423091914.63645-3-partha.satapathy@oracle.com>
References: <20260423091914.63645-3-partha.satapathy@oracle.com>
TO: Partha Satapathy <partha.satapathy@oracle.com>
TO: partha.satapathy@oracle.com
TO: anna-maria@linutronix.de
TO: frederic@kernel.org
TO: tglx@kernel.org
TO: linux-kernel@vger.kernel.org
TO: tj@kernel.org
TO: jiangshanlai@gmail.com
CC: notify@kernel.org

Hi Partha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tj-wq/for-next]
[also build test WARNING on tip/timers/core linus/master v6.16-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Partha-Satapathy/timer-add-add_timer_active_cpu/20260424-180422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-next
patch link:    https://lore.kernel.org/r/20260423091914.63645-3-partha.satapathy%40oracle.com
patch subject: [PATCH 2/2] workqueue: add queue_delayed_work_active_cpu()
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260502/202605020758.WFrcGcKb-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020758.WFrcGcKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605020758.WFrcGcKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/time/timer.c:265 struct member 'is_active' not described in 'timer_base'
>> Warning: kernel/time/timer.c:1300 function parameter 'need_ol_cpu' not described in '__add_timer_on'
>> Warning: kernel/time/timer.c:1300 expecting prototype for add_timer_on(). Prototype was for __add_timer_on() instead
>> Warning: kernel/time/timer.c:265 struct member 'is_active' not described in 'timer_base'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

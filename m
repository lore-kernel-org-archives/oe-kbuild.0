Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A2E2853F9
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240533; cv=none; b=nlpF59/prW5QyOet3KIb80hj4jEglEuTGdKf9aiBMuodsQ909VF+8AJBG5b6BUcgXnZGt33zzHkT90o/h4Ec1Us39fsdfVSQZ24mCqqfya7K4M8KpeZQQFKZYx4fmYqaNUCkouWhW2Epee29tSvtD7swu2nQPXm6AGeEvDy7KQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240533; c=relaxed/simple;
	bh=f0+7wpVhikqaRv+XAZaappsJ8owWoHcbSBFqRLKUDw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XFNb46kx+DoElbEGx8TZbhsP1VugtKPSnXEHyx8/qbMJSAj3fxGv3BzGnY89cuyRlIVHQzIit66gj7e9kTmIFjOXpKp1CAtyRGkSxd+yIT79mhFFVTJKZ11lcrOiO1t4YoieZISAMHSVA1tF6GD/EEDkI/wGmtsugr5RLbA2xSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5vo0y2A; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5vo0y2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750240531; x=1781776531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f0+7wpVhikqaRv+XAZaappsJ8owWoHcbSBFqRLKUDw8=;
  b=I5vo0y2AHp3Y4KZcumXcfam8Sk8wTmrxj7F+lR0z67eyNbWryfr0j2oB
   Moy4jO11GQ2gOfkaWB2ANV61DrsoBqkhSjsbIpBI2vVfNegrdu7n6nPwJ
   deFyxub6zwHsgG0wtV4xQ+w6Ya3LYn3OIB3eLIbDrkzJ3U1dZv9ePSN8b
   WPwC1TArbVZG2hlWP85xW5MykZ/24exfiUQ3Rii17Ez8/MpmPU8fzdwj5
   WQrxVus4R9x1hm0Vn/xHPZKQ4p27TV347pnrcXEqTvTt/s4R+njb+GsET
   Y+0L589EpDCtRCBIFQm+NLsYMqVQR/uVG7dUdxp9TfJk5j2qjojGQ6al0
   g==;
X-CSE-ConnectionGUID: rBXVXSNpRmammwzAC/ZZ3g==
X-CSE-MsgGUID: tWSo5c1DTBugXG3cIFd1ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52593520"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52593520"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 02:55:28 -0700
X-CSE-ConnectionGUID: B/1bC1sjSQOKcmtnHVPDuQ==
X-CSE-MsgGUID: neO+qUzgRk+14rrDgCU5fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149238739"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Jun 2025 02:55:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRpVs-000Jde-18;
	Wed, 18 Jun 2025 09:55:24 +0000
Date: Wed, 18 Jun 2025 17:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 09/10] PM: EM: Implement
 em_notify_pd_created/updated().
Message-ID: <202506181708.P4eRyPUC-lkp@intel.com>
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
In-Reply-To: <20250613094428.267791-10-changwoo@igalia.com>
References: <20250613094428.267791-10-changwoo@igalia.com>
TO: Changwoo Min <changwoo@igalia.com>
TO: lukasz.luba@arm.com
TO: rafael@kernel.org
TO: len.brown@intel.com
TO: pavel@kernel.org
CC: christian.loehle@arm.com
CC: tj@kernel.org
CC: kernel-dev@igalia.com
CC: linux-pm@vger.kernel.org
CC: sched-ext@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Changwoo Min <changwoo@igalia.com>

Hi Changwoo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc2 next-20250618]
[cannot apply to amd-pstate/linux-next amd-pstate/bleeding-edge]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Changwoo-Min/PM-EM-Add-em-yaml-and-autogen-files/20250613-174859
base:   linus/master
patch link:    https://lore.kernel.org/r/20250613094428.267791-10-changwoo%40igalia.com
patch subject: [PATCH v2 09/10] PM: EM: Implement em_notify_pd_created/updated().
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181708.P4eRyPUC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506181708.P4eRyPUC-lkp@intel.com/

smatch warnings:
kernel/power/em_netlink.c:249 __em_notify_pd_table() error: uninitialized symbol 'ret'.

vim +/ret +249 kernel/power/em_netlink.c

24b309699bc739 Changwoo Min 2025-06-13  215  
b0668476cf48ef Changwoo Min 2025-06-13  216  
b0668476cf48ef Changwoo Min 2025-06-13  217  /**************************** Event encoding *********************************/
76ab710f256a78 Changwoo Min 2025-06-13  218  static int __em_notify_pd_table(const struct em_perf_domain *pd, int ntf_type)
76ab710f256a78 Changwoo Min 2025-06-13  219  {
76ab710f256a78 Changwoo Min 2025-06-13  220  	struct sk_buff *msg;
76ab710f256a78 Changwoo Min 2025-06-13  221  	int msg_sz, ret;
76ab710f256a78 Changwoo Min 2025-06-13  222  	void *hdr;
76ab710f256a78 Changwoo Min 2025-06-13  223  
76ab710f256a78 Changwoo Min 2025-06-13  224  	if (!genl_has_listeners(&em_nl_family, &init_net, EM_NLGRP_EVENT))
76ab710f256a78 Changwoo Min 2025-06-13  225  		return 0;
76ab710f256a78 Changwoo Min 2025-06-13  226  
76ab710f256a78 Changwoo Min 2025-06-13  227  	msg_sz = __em_nl_get_pd_table_size(pd);
76ab710f256a78 Changwoo Min 2025-06-13  228  
76ab710f256a78 Changwoo Min 2025-06-13  229  	msg = genlmsg_new(msg_sz, GFP_KERNEL);
76ab710f256a78 Changwoo Min 2025-06-13  230  	if (!msg)
76ab710f256a78 Changwoo Min 2025-06-13  231  		return -ENOMEM;
76ab710f256a78 Changwoo Min 2025-06-13  232  
76ab710f256a78 Changwoo Min 2025-06-13  233  	hdr = genlmsg_put(msg, 0, 0, &em_nl_family, 0, ntf_type);
76ab710f256a78 Changwoo Min 2025-06-13  234  	if (!hdr)
76ab710f256a78 Changwoo Min 2025-06-13  235  		goto out_free_msg;
76ab710f256a78 Changwoo Min 2025-06-13  236  
76ab710f256a78 Changwoo Min 2025-06-13  237  	ret = __em_nl_get_pd_table(msg, pd);
76ab710f256a78 Changwoo Min 2025-06-13  238  	if (ret)
76ab710f256a78 Changwoo Min 2025-06-13  239  		goto out_free_msg;
76ab710f256a78 Changwoo Min 2025-06-13  240  
76ab710f256a78 Changwoo Min 2025-06-13  241  	genlmsg_end(msg, hdr);
76ab710f256a78 Changwoo Min 2025-06-13  242  
76ab710f256a78 Changwoo Min 2025-06-13  243  	genlmsg_multicast(&em_nl_family, msg, 0, EM_NLGRP_EVENT, GFP_KERNEL);
76ab710f256a78 Changwoo Min 2025-06-13  244  
76ab710f256a78 Changwoo Min 2025-06-13  245  	return 0;
76ab710f256a78 Changwoo Min 2025-06-13  246  
76ab710f256a78 Changwoo Min 2025-06-13  247  out_free_msg:
76ab710f256a78 Changwoo Min 2025-06-13  248  	nlmsg_free(msg);
76ab710f256a78 Changwoo Min 2025-06-13 @249  	return ret;
76ab710f256a78 Changwoo Min 2025-06-13  250  }
76ab710f256a78 Changwoo Min 2025-06-13  251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

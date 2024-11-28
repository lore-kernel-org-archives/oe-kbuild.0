Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F7AA48
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 00:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732752678; cv=none; b=a8Gwfldxz/v3Zb6Do3vDWSGU7FTE6LjzmUKeMGt2iCz3AmhX57CnxAwBeCIJE57p0NYwijxxVUnmPAAN+7Peq4mEpngCI7NvsiL0I9ZBbJXzPO/mnPHhpDis+qVwN9fEe5UcJHdeiG1D8aTWo96w2G38XfRL2zOCEUWySAq4VB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732752678; c=relaxed/simple;
	bh=ZOtM8GqLguYdO3pbJUU/8VTP+g9qcUSnPScjJjuJqks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tUhPdxIBJDVd1nBFGIjcfPYOhgioULDOV9hULZFIuPDl80/7Rt890FlIDmzCcKEIod/2aJBas4mCHm5UgSmXGu0vqEFBNoxKPAQrH5mz+ISzllvTDcZeMZBoO5VchNsj1Svdg2tmoenVSpYbvQZ2+YypOury2g+S233fofMGa94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnCAYrS2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnCAYrS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732752675; x=1764288675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZOtM8GqLguYdO3pbJUU/8VTP+g9qcUSnPScjJjuJqks=;
  b=fnCAYrS2kfEKr1xSgQWKV2Qy6Osz29D2FBegakty5ooCrE5VW+HiPqYH
   LcVV1B0VOqy9nJ0nbg45ArAsa0+nv+JA7SHz444aq9Ud5m2FNSRwA8eUa
   78s71//b0E+bFKIJr5pauhKavGvT490+59x4Gkb3HEre/aKqHb4bSbSBq
   OVxUFgvwpp2izmVieQGH665RfWFFyufbQA2jWFngTGvcq5tSPXMLATNjO
   7TgcNA+bEk1IicFTkYg2+jB/SSjuvGnq8kED+brEZn4HwgOYmILqR6BYr
   +PAm/lfqer44AmiXjctBVGIteH5ox3ndZSFEW/Domtb+EjXOxdl0K0iiZ
   Q==;
X-CSE-ConnectionGUID: Q1hYkBQqSSWUT2pOtI0swg==
X-CSE-MsgGUID: fVZXffKJQE2wSywu2A0A6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32346667"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="32346667"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 16:11:12 -0800
X-CSE-ConnectionGUID: DXuRe7gJR0q6qhR9bcRmmQ==
X-CSE-MsgGUID: DgsjSVlURwG28B0SaPTxgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="92477502"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Nov 2024 16:11:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGS7g-0008T4-2J;
	Thu, 28 Nov 2024 00:11:08 +0000
Date: Thu, 28 Nov 2024 08:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2466/2466] drivers/net/ipvlan/ipvlan_main.c:14
 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression :
 ipvlan_table[2]->procname
Message-ID: <202411280708.aOa0khuN-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   68b0fb4e955465eef28bed1f5a252c4e6c636a36
commit: bf16c102ee819442bb1a2248da1c0d9d7cec34d6 [2466/2466] ipvlan: Introduce local xmit queue for l2e mode
:::::: branch date: 16 hours ago
:::::: commit date: 2 years, 11 months ago
config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241128/202411280708.aOa0khuN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411280708.aOa0khuN-lkp@intel.com/

smatch warnings:
drivers/net/ipvlan/ipvlan_main.c:14 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : ipvlan_table[2]->procname
drivers/net/ipvlan/ipvlan_main.c:14 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : ipvlan_table[2]->proc_handler

vim +14 drivers/net/ipvlan/ipvlan_main.c

bd73acb1ae5abc Keefe LIU 2021-12-27  12  
bf16c102ee8194 Keefe LIU 2021-12-27  13  static struct ctl_table_header *ipvlan_table_hrd;
bf16c102ee8194 Keefe LIU 2021-12-27 @14  static struct ctl_table ipvlan_table[] = {
bf16c102ee8194 Keefe LIU 2021-12-27  15  	{
bf16c102ee8194 Keefe LIU 2021-12-27  16  		.procname       = "loop_delay",
bf16c102ee8194 Keefe LIU 2021-12-27  17  		.data           = &sysctl_ipvlan_loop_delay,
bf16c102ee8194 Keefe LIU 2021-12-27  18  		.maxlen         = sizeof(int),
bf16c102ee8194 Keefe LIU 2021-12-27  19  		.mode           = 0644,
bf16c102ee8194 Keefe LIU 2021-12-27  20  		.proc_handler   = proc_dointvec,
bf16c102ee8194 Keefe LIU 2021-12-27  21  	},
bf16c102ee8194 Keefe LIU 2021-12-27  22  	{
bf16c102ee8194 Keefe LIU 2021-12-27  23  		.procname       = "loop_qlen",
bf16c102ee8194 Keefe LIU 2021-12-27  24  		.data           = &sysctl_ipvlan_loop_qlen,
bf16c102ee8194 Keefe LIU 2021-12-27  25  		.maxlen         = sizeof(int),
bf16c102ee8194 Keefe LIU 2021-12-27  26  		.mode           = 0644,
bf16c102ee8194 Keefe LIU 2021-12-27  27  		.proc_handler   = proc_dointvec,
bf16c102ee8194 Keefe LIU 2021-12-27  28  	},
bf16c102ee8194 Keefe LIU 2021-12-27  29  	{ }
bf16c102ee8194 Keefe LIU 2021-12-27  30  };
bf16c102ee8194 Keefe LIU 2021-12-27  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

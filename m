Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B41B1519A2
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Feb 2025 05:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740203807; cv=none; b=oVKnMHa50d8sOF0ixdeY29X3/tjaG8qCz0OgCxuPc96V/gqZzaY+hJkEDYVY81jb8LnBq/pcKyF+7qa9TDvNA070q8HNGHG1B41KerOKWFp05xJRYi9fGA2YllIEd0ZbUu71/HHzFiBKTV+ERAh8k6/QPodkQ3+zE2L7aGXlvPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740203807; c=relaxed/simple;
	bh=nLjEYcesJSDBxe40f/AYAugA9QAuWcpKmDt7hQLV3Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ztlrwivx4NZtk8ngoAETUmS6UgS/uzZGAz+qs0TKXTwuD8E7eogwWWXLM7K7QTLAIdqdX3wsA+EStK7LuHmW+dpknJ9edqHn9hcxukG8kc2rc7hksSKUBctyB6HUfYWVGddmsh7WFOd5MkhhONh89ekQCAVmuhMVq3po7y2xshc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PY4/ZmpJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PY4/ZmpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740203805; x=1771739805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLjEYcesJSDBxe40f/AYAugA9QAuWcpKmDt7hQLV3Ao=;
  b=PY4/ZmpJtnw7ZpntWcqQi+oZ6egSg5oU/1wXbpbz7XP1Hc2mfPm1ZGlq
   LGmyF8Ip0Prc0sCpV2Zn/1NorzLFYBKYdmXnebutk2Zopd5LaBkKvScfx
   iMBNA4NxVy1stays9RIYhTq5XeUiClyASAZ5Te2SEARpbKvk691KzCVcv
   zlwadFTcjKckgMPWK6gNjSE/gJqevX2OytRypIctJQeNFOZpoPC6Y28CS
   Dm9JTqW/m3FDNHzuBKtnkt4957tlKJ6VB0ti8gHoXRrvUfGCnHzb7204o
   d1s2/tuuTc/tiWDbZlGIt3IhoF2FuaddnDOp7w1MNUknRgNPgbPcCk3E/
   w==;
X-CSE-ConnectionGUID: ak6bVZszSdSY1806NvJC4w==
X-CSE-MsgGUID: OCn7zat1RI+Wa3qRFJmkzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41168879"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="41168879"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 21:56:45 -0800
X-CSE-ConnectionGUID: /eU2lGysSAmLQo97zXMpXQ==
X-CSE-MsgGUID: lrjKC/w3Tzy2sB7ZRpnuhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="120532638"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Feb 2025 21:56:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tliVF-0006L5-0a;
	Sat, 22 Feb 2025 05:56:41 +0000
Date: Sat, 22 Feb 2025 13:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2759/2759] mm/hugetlb_vmemmap.c:352 (null)()
 warn: (struct ctl_table)->procname cannot be NULL. Expression :
 hugetlb_vmemmap_sysctls[1]->procname
Message-ID: <202502221344.WRaa1GPQ-lkp@intel.com>
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
head:   4d88bf76198b8a462646f7be261586ebb2bbf5f3
commit: 6b2239c22b56bddcdefd09fd58b6672f2b1f1566 [2759/2759] mm: hugetlb_vmemmap: add hugetlb_optimize_vmemmap sysctl
:::::: branch date: 27 hours ago
:::::: commit date: 2 years, 7 months ago
config: x86_64-randconfig-161-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221344.WRaa1GPQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502221344.WRaa1GPQ-lkp@intel.com/

smatch warnings:
mm/hugetlb_vmemmap.c:352 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : hugetlb_vmemmap_sysctls[1]->procname
mm/hugetlb_vmemmap.c:352 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : hugetlb_vmemmap_sysctls[1]->proc_handler

vim +352 mm/hugetlb_vmemmap.c

6b2239c22b56bd Muchun Song 2022-07-28  351  
6b2239c22b56bd Muchun Song 2022-07-28 @352  static struct ctl_table hugetlb_vmemmap_sysctls[] = {
6b2239c22b56bd Muchun Song 2022-07-28  353  	{
6b2239c22b56bd Muchun Song 2022-07-28  354  		.procname	= "hugetlb_optimize_vmemmap",
6b2239c22b56bd Muchun Song 2022-07-28  355  		.maxlen		= sizeof(enum vmemmap_optimize_mode),
6b2239c22b56bd Muchun Song 2022-07-28  356  		.mode		= 0644,
6b2239c22b56bd Muchun Song 2022-07-28  357  		.proc_handler	= hugetlb_optimize_vmemmap_handler,
6b2239c22b56bd Muchun Song 2022-07-28  358  		.extra1		= SYSCTL_ZERO,
6b2239c22b56bd Muchun Song 2022-07-28  359  		.extra2		= SYSCTL_ONE,
6b2239c22b56bd Muchun Song 2022-07-28  360  	},
6b2239c22b56bd Muchun Song 2022-07-28  361  	{ }
6b2239c22b56bd Muchun Song 2022-07-28  362  };
6b2239c22b56bd Muchun Song 2022-07-28  363  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

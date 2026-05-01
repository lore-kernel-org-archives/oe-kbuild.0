Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A918859B
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 06:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777616809; cv=none; b=TbF9pNskrsg4x80xouWyynODXfIwX1wD4DFuMU8hn2FOg8ljD8ekZ9FSXsH0AK7nmZKXinSBR5sSKJOZV0IABSQGWU0AeIKM1fjteIPGixnuLmSxExyEL4reKYrNhrSLlql84NsRMaZSMI0bqjXHmh6pLlzYOTjP/bbCZ/itchY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777616809; c=relaxed/simple;
	bh=zxzAk5Qu67YssHlm4WS0MJL2Dq+8UY5pkPaC0rIJA+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MubetNGFF+jRtszAPmsgEeZOOhUTtNtg6v6TSdsp+cfnzQxOcsWWNB6JRmapZo1Vob1nD6qyTcxUY5lWKNVTkhSbin31akedzFUfjieVbJAQBQVVq3zCNHGfnzDWE7SrYKKiTWarBAAjfpOmLdw1pMz16v80oDDsio5GTf+ib4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRcD0zqt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRcD0zqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777616807; x=1809152807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxzAk5Qu67YssHlm4WS0MJL2Dq+8UY5pkPaC0rIJA+A=;
  b=nRcD0zqtWWOwivl7FUl2c/mkdhXNfOSdsURB8XtGv9WJ9exT0qYcFPFm
   6IgJ1207X613/Xj71Bbj+xNjrV7sjh9SjaFlbqK8nUSvPwBSF0TOwNVie
   1RLsnKpSv9dkD/Vea8HDaiUvAYdj4ddRA5WoiOKPwwFVUoH7S4dHZaham
   B3AMsOMOpPXDVMDvNQD0zbYbwYPD1sBiyE4FNMEn8Vby6icy3yTplQaCw
   l39Q2g5tPjsyrpD0TxVLdRdVKwIzYDCiY0D0FQ5+/PZmWfLBXpdztb4XQ
   cfdpGSyEVqZ36fhQeh4Rsd5I6hs3rCWvY7fLMmlLkDUztt4gcWDa2ZMjC
   Q==;
X-CSE-ConnectionGUID: 0rfBDBOLRiiah6eSEUoUIQ==
X-CSE-MsgGUID: RJMc/1scRzuvSkBru2WsCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78605391"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="78605391"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 23:26:47 -0700
X-CSE-ConnectionGUID: nUPB0Iv4SpuoYgkdKFrH5w==
X-CSE-MsgGUID: ovRQhjs7QUC51wtd/jJZ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="239122080"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Apr 2026 23:26:46 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIhKl-000000004zN-2RQa;
	Fri, 01 May 2026 06:26:43 +0000
Date: Fri, 1 May 2026 08:26:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] mm: Add RWH_RMAP_EXCLUDE flag to exclude files from rmap
 sharing
Message-ID: <202605010820.9zCdrX8I-lkp@intel.com>
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
In-Reply-To: <20260421020932.3212532-1-liuyibin@hygon.cn>
References: <20260421020932.3212532-1-liuyibin@hygon.cn>
TO: Yibin Liu <liuyibin@hygon.cn>
TO: linux-mm@kvack.org
CC: akpm@linux-foundation.org
CC: Liam.Howlett@oracle.com
CC: viro@zeniv.linux.org.uk
CC: brauner@kernel.org
CC: mjguzik@gmail.com
CC: wujianyong@hygon.cn
CC: huangsj@hygon.cn
CC: zhongyuan@hygon.cn

Hi Yibin,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Yibin-Liu/mm-Add-RWH_RMAP_EXCLUDE-flag-to-exclude-files-from-rmap-sharing/20260423-115604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260421020932.3212532-1-liuyibin%40hygon.cn
patch subject: [PATCH] mm: Add RWH_RMAP_EXCLUDE flag to exclude files from rmap sharing
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260501/202605010820.9zCdrX8I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010820.9zCdrX8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605010820.9zCdrX8I-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from main.c:10:
   ../../../mm/vma.c: In function '__vma_link_file':
>> ../../../mm/vma.c:237:27: error: 'struct file' has no member named 'f_mode'
     237 |         if (!(vma->vm_file->f_mode & FMODE_RMAP_EXCLUDE))
         |                           ^~
>> ../../../mm/vma.c:237:38: error: 'FMODE_RMAP_EXCLUDE' undeclared (first use in this function)
     237 |         if (!(vma->vm_file->f_mode & FMODE_RMAP_EXCLUDE))
         |                                      ^~~~~~~~~~~~~~~~~~
   ../../../mm/vma.c:237:38: note: each undeclared identifier is reported only once for each function it appears in
   ../../../mm/vma.c: In function 'vma_complete':
   ../../../mm/vma.c:343:60: error: 'struct file' has no member named 'f_mode'
     343 |                 if (vp->adj_next && !(vp->adj_next->vm_file->f_mode & FMODE_RMAP_EXCLUDE))
         |                                                            ^~
   ../../../mm/vma.c:343:71: error: 'FMODE_RMAP_EXCLUDE' undeclared (first use in this function)
     343 |                 if (vp->adj_next && !(vp->adj_next->vm_file->f_mode & FMODE_RMAP_EXCLUDE))
         |                                                                       ^~~~~~~~~~~~~~~~~~
   ../../../mm/vma.c:346:39: error: 'struct file' has no member named 'f_mode'
     346 |                 if (!(vp->vma->vm_file->f_mode & FMODE_RMAP_EXCLUDE))
         |                                       ^~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

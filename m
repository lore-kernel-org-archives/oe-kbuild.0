Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745F1B86D6
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 22:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720564001; cv=none; b=j9l//ANwbwuWfl08EtnJdLnGPRoG5seAxGqiXBng8m+PSe/4Zy7trfReJJ6DwidIiJnMBHxx/SpA1nCFUtxto9J1XAb87GrQuTCgpnjWl3kGAzDCosPmuZ1eEn2K0vOXtZo38OWYHViih5PiU5R1GqUsY5W0piGD4w96vUwc4P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720564001; c=relaxed/simple;
	bh=UJ/9Uf4j1hzBXc423h+q5xbTL/kn9Eiz75v0UyXxCjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o/WDWGuXgeyJ2Ib1yA1Q1fPnlu9+oZYpZZ+JHLarHoI5rcS4IrV1YqKkzcidwwTh+NulF8mYInhF/j8sbTepTDH3fTUp7UcTD+U1xwJ7Ha5r+dtr16Dikkc0F0Gs0cvKOijlW7RSoEX5nX1KgGYVsLKM/FCuDgHLFv/1RX+6Qzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j69BO3Eu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j69BO3Eu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720564000; x=1752100000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJ/9Uf4j1hzBXc423h+q5xbTL/kn9Eiz75v0UyXxCjc=;
  b=j69BO3EueHeq4rq9XSJDfUTnIeJRQ6e3a8LqKJ9q8BwRwVCLQBreMUGk
   HBQ0l3XoRT9zuPGn6KsWYhPM+gFwOBqKYKCDxsNme21hmcfFWOlu/hHOO
   CVtS3OY3WLxEXXXfYHPHVRpFPb4fXAfyzsaWQSg9nVUK5rmE+4EzAn/Vj
   KQ56DGz1q395vudFErqW/DCkbp8yV/tsDgwZ9+b+jn8AD8oOXrgr+TNXu
   qjX9XwfZ0d3p3c2aeLvyNEeUEHvIZ3le9y6f36g0g01ZYxBdWjSpRzFZJ
   jcT16ZuKYXbEtRzB6d6+XwduccCZyaPxtvsffs+qLXVvrrrx5XBVs9A07
   g==;
X-CSE-ConnectionGUID: EETsSzFdRsyHWeWO6iIg6g==
X-CSE-MsgGUID: zWVwtMM+Sv6RjpAXsVbHrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="20761138"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="20761138"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 15:26:39 -0700
X-CSE-ConnectionGUID: EvtFn3loTZu70Tqocw/htw==
X-CSE-MsgGUID: Us8xfIlkRROr0WoluowQTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="52402779"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jul 2024 15:26:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRJIC-000XAw-0X;
	Tue, 09 Jul 2024 22:26:36 +0000
Date: Wed, 10 Jul 2024 06:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 11/11] block: Catch possible entries missing from
 rqf_name[]
Message-ID: <202407100616.3nCzS3gc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/blk-mq.h:64:41: sparse: sparse: mixed bitwiseness"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240709110538.532896-12-john.g.garry@oracle.com>
References: <20240709110538.532896-12-john.g.garry@oracle.com>
TO: John Garry <john.g.garry@oracle.com>
TO: axboe@kernel.dk
TO: hch@lst.de
CC: linux-block@vger.kernel.org
CC: John Garry <john.g.garry@oracle.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20240709]
[cannot apply to linus/master v6.10-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/block-remove-QUEUE_FLAG_STOPPED/20240709-191356
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20240709110538.532896-12-john.g.garry%40oracle.com
patch subject: [PATCH 11/11] block: Catch possible entries missing from rqf_name[]
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-121-20240710 (https://download.01.org/0day-ci/archive/20240710/202407100616.3nCzS3gc-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100616.3nCzS3gc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407100616.3nCzS3gc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/rw.c: note: in included file:
>> include/linux/blk-mq.h:64:41: sparse: sparse: mixed bitwiseness

vim +64 include/linux/blk-mq.h

24b83deb29b7f0 Christoph Hellwig 2021-09-20  29  
eb1bf86c078647 John Garry        2024-07-09  30  /* Keep rqf_name[] in sync with the definitions below */
b538f85290720d John Garry        2024-07-09  31  enum {
24b83deb29b7f0 Christoph Hellwig 2021-09-20  32  	/* drive already may have started this one */
b538f85290720d John Garry        2024-07-09  33  	RQF_STARTED		=	((__force req_flags_t)(1 << 0)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  34  	/* request for flush sequence */
b538f85290720d John Garry        2024-07-09  35  	RQF_FLUSH_SEQ		=	((__force req_flags_t)(1 << 1)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  36  	/* merge of different types, fail separately */
b538f85290720d John Garry        2024-07-09  37  	RQF_MIXED_MERGE		=	((__force req_flags_t)(1 << 2)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  38  	/* don't call prep for this one */
b538f85290720d John Garry        2024-07-09  39  	RQF_DONTPREP		=	((__force req_flags_t)(1 << 3)),
dd6216bb16e83e Christoph Hellwig 2023-05-18  40  	/* use hctx->sched_tags */
b538f85290720d John Garry        2024-07-09  41  	RQF_SCHED_TAGS		=	((__force req_flags_t)(1 << 4)),
dd6216bb16e83e Christoph Hellwig 2023-05-18  42  	/* use an I/O scheduler for this request */
b538f85290720d John Garry        2024-07-09  43  	RQF_USE_SCHED		=	((__force req_flags_t)(1 << 5)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  44  	/* vaguely specified driver internal error.  Ignored by the block layer */
b538f85290720d John Garry        2024-07-09  45  	RQF_FAILED		=	((__force req_flags_t)(1 << 6)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  46  	/* don't warn about errors */
b538f85290720d John Garry        2024-07-09  47  	RQF_QUIET		=	((__force req_flags_t)(1 << 7)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  48  	/* account into disk and partition IO statistics */
b538f85290720d John Garry        2024-07-09  49  	RQF_IO_STAT		=	((__force req_flags_t)(1 << 8)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  50  	/* runtime pm request */
b538f85290720d John Garry        2024-07-09  51  	RQF_PM			=	((__force req_flags_t)(1 << 9)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  52  	/* on IO scheduler merge hash */
b538f85290720d John Garry        2024-07-09  53  	RQF_HASHED		=	((__force req_flags_t)(1 << 10)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  54  	/* track IO completion time */
b538f85290720d John Garry        2024-07-09  55  	RQF_STATS		=	((__force req_flags_t)(1 << 11)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  56  	/* Look at ->special_vec for the actual data payload instead of the
24b83deb29b7f0 Christoph Hellwig 2021-09-20  57  	   bio chain. */
b538f85290720d John Garry        2024-07-09  58  	RQF_SPECIAL_PAYLOAD	=	((__force req_flags_t)(1 << 12)),
dd291d77cc90eb Damien Le Moal    2024-04-08  59  	/* The request completion needs to be signaled to zone write pluging. */
b538f85290720d John Garry        2024-07-09  60  	RQF_ZONE_WRITE_PLUGGING	=	((__force req_flags_t)(1 << 13)),
24b83deb29b7f0 Christoph Hellwig 2021-09-20  61  	/* ->timeout has been called, don't expire again */
b538f85290720d John Garry        2024-07-09  62  	RQF_TIMED_OUT		=	((__force req_flags_t)(1 << 14)),
b538f85290720d John Garry        2024-07-09  63  	RQF_RESV		=	((__force req_flags_t)(1 << 15)),
eb1bf86c078647 John Garry        2024-07-09 @64  	RQF_MAX			=	16
b538f85290720d John Garry        2024-07-09  65  };
24b83deb29b7f0 Christoph Hellwig 2021-09-20  66  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EBA1991A1
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737276197; cv=none; b=tuDfirdqNkhskdNfMscTG3DReIACT0wBCt85GTEm7gpyBN99LgLqwsE+sGE7Mk9uZGSZDdx+1Q+bWMHL6iZ3hguWLED1d5rIZbiGWOpFUFzbklQevOygAcaGEFzM4NoNHdBTnbbSUaQzuj/7xFQcB1fkskGjafvoJryXwsQtUD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737276197; c=relaxed/simple;
	bh=p8t0fzUCCTvZRszwxHokSKJWbjCqschtitgCjpRPglA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qy2E01Ce2RR3FwKrbYSR0gMGy+aUCASZPbD9vN+UO3OoZQmO46Muy91Xp3ykXmNZe56WbF/YHYqTZ36YReyBHnJ28cQpTW/LoOHjdHfIILYPXAJKJIlUO5B9jg+K3OE9+bdy7w8bWIbAtvHsdgtGCWyCbXr/CtFdTWAUfN+AE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=me7fKO7H; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="me7fKO7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737276195; x=1768812195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8t0fzUCCTvZRszwxHokSKJWbjCqschtitgCjpRPglA=;
  b=me7fKO7HXUC+mP3M/n1uEJLZ3XbmgtdQTIDkGnWo9I2on+z+RaEkPZY9
   Dt6sCSTLF/ihR4j4Ix3qnJ1xeGrV98E1MUxVPpMIjWG6f2Ax+v1Yg25Il
   xcn24+USmbo7D040h4vG7KtN1dmeaeqsHNgTH6p6ZHjbH/8jS5eGBgIIe
   tEZaT4ORhyMWnLeIimkKWi8gnxxSOBIroNpKTGPyxDYhm8rYRzwvyvG5C
   VDoEzT6K5+gndPoNU9eETnIg22L/I5bNd/0Gen555Uwukg4zJwDjUtnCN
   JkChU3PuCfoHmO2aPCtjfTCLdVPb+4rmKTNNMf2ck97tirXCTlVnYxZEY
   Q==;
X-CSE-ConnectionGUID: Ua6yElo6RcuNK65fRCyHjg==
X-CSE-MsgGUID: bfsaHHtLTGy/8vlgU2k9Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37567652"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="37567652"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 00:43:12 -0800
X-CSE-ConnectionGUID: jA3x6YwOTt681iRqj7/QyQ==
X-CSE-MsgGUID: rKImVFarSNq3he5jH4tfXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="106001415"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jan 2025 00:43:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZQtg-000VG7-3D;
	Sun, 19 Jan 2025 08:43:09 +0000
Date: Sun, 19 Jan 2025 16:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bcachefs:bcachefs-testing 269/286] fs/bcachefs/data_update.c:563:9:
 sparse: sparse: unknown escape sequence: '\%'
Message-ID: <202501191631.FKP6qRIZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/data_update.c:563:9: sparse: sparse: unknown escape sequence: '\%'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   64fc7d8978616f55f972ca89822c051e58f4dbd2
commit: 780095660464f247a41755e95dab9956b33b2293 [269/286] bcachefs: bch2_moving_ctxt_to_text() -> bch2_moving_ctxt_to_text()
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-r131-20250119 (https://download.01.org/0day-ci/archive/20250119/202501191631.FKP6qRIZ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20250119/202501191631.FKP6qRIZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501191631.FKP6qRIZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/data_update.c:563:9: sparse: sparse: unknown escape sequence: '%'
   fs/bcachefs/data_update.c: note: in included file:
   fs/bcachefs/bcachefs.h:997:9: sparse: sparse: array of flexible structures

vim +563 fs/bcachefs/data_update.c

ad8b68cd3941c5 Kent Overstreet 2024-07-03  556  
ad8b68cd3941c5 Kent Overstreet 2024-07-03  557  void bch2_data_update_to_text(struct printbuf *out, struct data_update *m)
ad8b68cd3941c5 Kent Overstreet 2024-07-03  558  {
ad8b68cd3941c5 Kent Overstreet 2024-07-03  559  	bch2_bkey_val_to_text(out, m->op.c, bkey_i_to_s_c(m->k.k));
ad8b68cd3941c5 Kent Overstreet 2024-07-03  560  	prt_newline(out);
780095660464f2 Kent Overstreet 2024-12-31  561  	printbuf_indent_add(out, 2);
ad8b68cd3941c5 Kent Overstreet 2024-07-03  562  	bch2_data_update_opts_to_text(out, m->op.c, &m->op.opts, &m->data_opts);
780095660464f2 Kent Overstreet 2024-12-31 @563  	prt_printf(out, "read_done:\t\%u\n", m->read_done);
780095660464f2 Kent Overstreet 2024-12-31  564  	bch2_write_op_to_text(out, &m->op);
780095660464f2 Kent Overstreet 2024-12-31  565  	printbuf_indent_sub(out, 2);
ad8b68cd3941c5 Kent Overstreet 2024-07-03  566  }
ad8b68cd3941c5 Kent Overstreet 2024-07-03  567  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

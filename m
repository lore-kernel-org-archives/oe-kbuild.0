Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710821531C8
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680541; cv=none; b=ZBqII7jJINhT6nUqaGpGNnzuSuf4PRbqrnO+VXllhg3LyGGQ6NCORqZkF5AMGGtYPSFJVOzm25aM7pAnI66WRo/OyFfmLGasEYyw6LUts772cVA+KTftps6mk7nXcpgJHEeNo6DE2hQk2GiJER9VkjxEKDz8p7/bZGFt8rWOBnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680541; c=relaxed/simple;
	bh=YojyOXXBbAhmzl/qt31p/z1/nHLOR3Yo25k9OgRjuHg=;
	h=Date:From:To:Subject:Message-ID; b=BdhgptQnUWkiXpRujjZHTNmZ1P2TBcmrNXGTVnJaaDXgamukqf3SFY1FNzWiroBFMO0HMNjxFjyN8rK7LAXM2rC39PeY3AMtzZLfZVsxpmprsJGvyWIMOynq6BB9emqItRKH9ifhYhfoijaoysyi6C99Ayp0IXVOw+rN7yxD9Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVFVfJNd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVFVfJNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680540; x=1804216540;
  h=date:from:to:subject:message-id;
  bh=YojyOXXBbAhmzl/qt31p/z1/nHLOR3Yo25k9OgRjuHg=;
  b=IVFVfJNdOGOwCBhP0+uSS1bXTcnutVQvsktFKg8sr8VA5gMtJnzYb0tl
   WBCrJ3QC5SvhsLhcFr17Dy++LTSorzAmsHeNUx2YHSdTp7bcLIt7JCyU7
   uzTsdAbYth9LSluNQd/9xpD/j6BQSsat4FHBQHxKGgpk3/RxIVdEXPlsH
   VBuySbRpw91ntV+Jeypk/t68DI8kXlw1uEYlZzCNpDk3nUOGKvzZ+Ph+d
   P1BeIqui/X9ZbtRNYe9QMHvWo3CpO5AM/LswUt7X/QNdUTv2H8ECv3pft
   keQHa/5a7P2108WFl32MkH5GaFwDJPd/KjYD8j5OAnGFZE5BPoKqNq50Q
   A==;
X-CSE-ConnectionGUID: 6OForStVT/G9kK68JYYxrA==
X-CSE-MsgGUID: pRH5pea1RbG6k+O4eSBjmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96371777"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="96371777"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:15:40 -0800
X-CSE-ConnectionGUID: xZbAONikSXSEWg86r8VkLA==
X-CSE-MsgGUID: C39hE362S6Cg0RgJYpo2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="222692953"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2026 19:15:40 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzBZ-000000001ut-1kNy
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:15:37 +0000
Date: Thu, 05 Mar 2026 04:15:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 450/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050440.G6owNZbg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 3337cc403bad8f420f477ccbc967cacd32d77115 [450/467] RDMA/bnxt_re: convert debugfs fops to read/write iterators
:::::: branch date: 68 minutes ago
:::::: commit date: 68 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050440.G6owNZbg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#27: FILE: drivers/infiniband/hw/bnxt_re/debugfs.c:85:
+static ssize_t qp_info_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#66: FILE: drivers/infiniband/hw/bnxt_re/debugfs.c:200:
+static ssize_t bnxt_re_cc_config_get(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

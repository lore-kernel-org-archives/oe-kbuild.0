Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0B9336891
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680542; cv=none; b=vCmIq1p52c2yfXX71Mdf3tXd65rBkuC1iKFJxZwLzHnmPV2ldqzn9eAlHW/qLS1Dqi0hJt8buhMwkKrLrAJ5ow77Dh2/GxYRsWNFjP/OLUGcqaAQhLL5FIg3cH1kRthl6V0NWMSz79Hq92AOfbf3OSH0B2uUHOyuCHdJfv8BbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680542; c=relaxed/simple;
	bh=E8zOy7w68NxCRSIROPHWzy+neGWikF8QT77MNklMWhA=;
	h=Date:From:To:Subject:Message-ID; b=hKoz26HJN/yTDmQed5LG8txfx1StK/dUAxH5fc09zIZ0n9JlyyVLQaVFqER2IU8E7zy2gvyF0RnyEUrxrZPsW0ZetGn6iqWcJTqJ0AVuGqmrKOt2YhS0kPtq7/K4pOAHZ4ZyZEr6bO87ARt9ncHeOewIZUpquLpk+dK5u2r+wSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBr/2uiL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBr/2uiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680541; x=1804216541;
  h=date:from:to:subject:message-id;
  bh=E8zOy7w68NxCRSIROPHWzy+neGWikF8QT77MNklMWhA=;
  b=SBr/2uiLMdAuWqeyit9ddZf259EkvXBe3LgeTK09nrScYWiZX53etFe8
   I/Zm7nb/OVrc3yEuP0w+tNKmazogjW2UGJz3njMLF04v8vKH7pXR2DH1n
   MNHhOxh4ftPKZ3Lw5KfQW5u8eicb/stXb5olgPHXj5p1TILl1yvppvBu3
   aFmTE5SlKcBFrkCdB1oZLMX7mQkamZpOOgbmI/fh2qsm4FUd3rOxieAdY
   SlEozDezdHK4qhiHxA/O8BQIubqXwLcQtoBfBOWEEdq7ehsGTnnlGxGns
   CaMWGZPUJg003U+Ah/4OWXGvS4JT0u+Ba/aO3uW3ZCWGEBXOv0Z07pidQ
   Q==;
X-CSE-ConnectionGUID: LHySqg+qRpiUNG7IJMh1Rg==
X-CSE-MsgGUID: 5R3GoFSBSgmiJWvmOpLdoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="61330924"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="61330924"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:15:39 -0800
X-CSE-ConnectionGUID: ZQvV5qy2Qu6ZQqlQo4elCQ==
X-CSE-MsgGUID: yrj3aniVRqiBGTFHug7uIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="221446087"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2026 19:15:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzBZ-000000001ub-0cV0
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:15:37 +0000
Date: Thu, 05 Mar 2026 04:15:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 441/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050442.OjRzq4A9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 1e6629a61ee4af79ce25da0c9e66d30269fd633b [441/467] ethernet: convert remaining fops to read/write iterators
:::::: branch date: 65 minutes ago
:::::: commit date: 65 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050442.OjRzq4A9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#48: FILE: drivers/net/ethernet/intel/libie/fwlog.c:480:
+static ssize_t libie_debugfs_nr_messages_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#85: FILE: drivers/net/ethernet/intel/libie/fwlog.c:551:
+static ssize_t libie_debugfs_enable_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#123: FILE: drivers/net/ethernet/intel/libie/fwlog.c:642:
+static ssize_t libie_debugfs_log_size_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#169: FILE: drivers/net/ethernet/intel/libie/fwlog.c:775:
+static ssize_t libie_debugfs_data_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#217: FILE: drivers/net/ethernet/microsoft/mana/mana_en.c:38:
+static ssize_t mana_dbg_q_read(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

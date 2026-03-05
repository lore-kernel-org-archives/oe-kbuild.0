Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C004B26A1AF
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680542; cv=none; b=eX7mrsFGAvsoOGMnorBdZMo3FVYqsImgkuIQdVpmPLKYBdo8qG1cy6PJTJyKwDfj6qHyctMWFYW1E2OYkTemTkpkOtRIh7IhseP+7qjBT6XhXB2z7dSTYJXCAmaI9aOphNqTBhhEni8h8CKfHe/vFdGIz6g9BDaKFgFyozHn0GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680542; c=relaxed/simple;
	bh=2+yPBk1NKcCVchv5PR0BgjSdbQbNZ+YjCxohvFUfoYQ=;
	h=Date:From:To:Subject:Message-ID; b=Xk7zQYeBAOYVBJeASLMCte19e5gZi573SlkhAhaNHUISXm02FG4p1ukoYG5ay1bvTcK78wtHId0dRxOGXj4n1t6JwTA4BQ8PXG7yhJqbG1fWIcDY/nyEnuFeurMktIaLsxCQgoLcV+aKfH6Od/CpayDM2bOJkFTrhQ82dg/+M/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RM4xx+/S; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RM4xx+/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680542; x=1804216542;
  h=date:from:to:subject:message-id;
  bh=2+yPBk1NKcCVchv5PR0BgjSdbQbNZ+YjCxohvFUfoYQ=;
  b=RM4xx+/SwflfAFGGNYVcr9cOl2fffzlVSLayf+y3hiIK8xxr8fG1AJ9e
   Txnq7NKuSqth2VUZUv+GHClnEhU+yD1VXW0k4ovgkcQtzhXDBf9OBYhaK
   QQRm4Zo5Qldtob+lUvs1XO4M1LX/rFrb6sl2u5ltCACKkcrFrARUGn0aX
   6YYHYgcJpB8L01aoaNDoOIk82eCjIQOTdmAk1QoSBgBFvO+rFgjTurfcQ
   9d5GjMCiRTsHsGSgGB7nBXr7wCifP98M6mBOzcvufQFKaUabHPOEPGOe9
   5hOWsQ2Im4R5hcB/5xSJbET16RuWQSt9r5LtDOuroFBNBAgLnl9e+LD4d
   A==;
X-CSE-ConnectionGUID: 9EZXxQLPSrGLEUxcDdVHnQ==
X-CSE-MsgGUID: 73KAv/H8Q2iutXLScJOWAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96371776"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="96371776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:15:40 -0800
X-CSE-ConnectionGUID: V/sqV+ZOQbW82KI69+kQ5A==
X-CSE-MsgGUID: HapOwgowS+yq45cwvnjRwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="222692952"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2026 19:15:40 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzBZ-000000001ur-1aHM
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:15:37 +0000
Date: Thu, 05 Mar 2026 04:15:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 449/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050420.0yiADj9C-lkp@intel.com>
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
commit: 3a6a103ddd5b71c4abead5ce8c7b7a8fa4cbf727 [449/467] iio: convert remaining fops to read/write iterators
:::::: branch date: 68 minutes ago
:::::: commit date: 68 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050420.0yiADj9C-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#27: FILE: drivers/iio/dac/ad3552r-hs.c:513:
+static ssize_t ad3552r_hs_show_data_source(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#47: FILE: drivers/iio/dac/ad3552r-hs.c:538:
+static ssize_t ad3552r_hs_write_data_source(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#71: FILE: drivers/iio/dac/ad3552r-hs.c:578:
+static ssize_t ad3552r_hs_show_data_source_avail(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#111: FILE: drivers/iio/imu/adis16550.c:292:
+static ssize_t adis16550_show_firmware_revision(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#137: FILE: drivers/iio/imu/adis16550.c:315:
+static ssize_t adis16550_show_firmware_date(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640B257C9F
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680601; cv=none; b=jDb5IFPljyqIXmBGeRE/Sth9Co0tszYXRCFV9vLgolOCN9GqIRqc3FxuijKnuaUp86jB1nwLe2S5wYKHGSwnoAZC4WdWkMofZPYizrquEtN3SL/yZ4rk+srDfudzFVoBKc0/26M8bZccZyeED5t5Ot4U4O3JJ4WFa0dS96DZFXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680601; c=relaxed/simple;
	bh=qeZq69kJ3jWCigyrfYEepTxtA8rhEf8tRTT6V83RzYI=;
	h=Date:From:To:Subject:Message-ID; b=Jd4lgp8TgxXo+chJMuEXL3eyVbojUChf9yMrx+zvOVnXQEwIJGcp8Isk5Fi9LEWMbM1QU693TFj9gZ9x/H0hJUupiVRZT4293T+dcdg4TgBqat4cu/2NVZ9qPglLN6+lMOEjhxp38GyWbhuiaVU+oG9jp0eWG1KrSHOBs4zXSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hX1TSW3B; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hX1TSW3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680600; x=1804216600;
  h=date:from:to:subject:message-id;
  bh=qeZq69kJ3jWCigyrfYEepTxtA8rhEf8tRTT6V83RzYI=;
  b=hX1TSW3Bd59deI09/qONX+BlWLz3foIa/S5s4r1SVBjb6WXjAk8n3M6j
   xpgrmCxeEOjKVAUPCaLj42X2jL2ZIBp3i/rDYWdC9hx6atJyBrJvfgGxl
   VDEh3NPAj/MOBrqALd8Mk+51ZdMwMewp0tVXikhafNge20BrLGdNUXQb8
   72YkzjSl/no+Iwm1UG4RngpV04RcshlbHkm4aEdoZ/WXgev6HKln+wC/C
   ZRwffU5PgTqNx2oKuCTArkTEI8b+2koqWppVEgTcIm7d7xLqHrmND3AZI
   AlB4TQXKENGWzTPJZzyDTEODEW1Qhzu54YDyHB2rRune/GSJvc8OM6dd5
   Q==;
X-CSE-ConnectionGUID: x5+f9UI7RGWYRN9l897Rhg==
X-CSE-MsgGUID: oMy/3t6NRJW4cxWpdHgZVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="61330971"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="61330971"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:16:40 -0800
X-CSE-ConnectionGUID: +aO9HJiCT5K+E8xY6Uphng==
X-CSE-MsgGUID: VNfqhs2iQDKZv+GKXUKnNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="221446240"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2026 19:16:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzCX-000000001vV-2sqY
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:16:37 +0000
Date: Thu, 05 Mar 2026 04:15:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 454/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050435.DX8WBj2u-lkp@intel.com>
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
commit: cfc4eef604d3f30044d7c1243d1d34fccaeb6233 [454/467] vfio/pci: convert remaining fops to read/write iterators
:::::: branch date: 69 minutes ago
:::::: commit date: 69 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050435.DX8WBj2u-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#27: FILE: drivers/vfio/pci/virtio/migrate.c:381:
+static ssize_t virtiovf_save_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#59: FILE: drivers/vfio/pci/virtio/migrate.c:937:
+static ssize_t virtiovf_resume_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#94: FILE: drivers/vfio/pci/xe/main.c:173:
+static ssize_t xe_vfio_pci_save_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#114: FILE: drivers/vfio/pci/xe/main.c:200:
+static ssize_t xe_vfio_pci_resume_write(struct kiocb *iocb, struct iov_iter *from){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

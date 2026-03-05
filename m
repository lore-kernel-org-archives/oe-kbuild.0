Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D7275AE4
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680484; cv=none; b=iOXSaUz6vYxzfZHML37vLEsg1WXi4EFbt06HMnkpLjwO2TkLwAa5698AuQUO4xh5qxFuC15+fL6Q8mmaF5Cgn9q4CWff68asm/p8LQgywhvmCK/8GMTjMCT5ME6ulc34pwWybcrPq1IRmk1jy8yl74gQLqPQuOdpCDi3Fkw4NKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680484; c=relaxed/simple;
	bh=AwDCFf4xFweB76H2OzrIcLpH8mHxPu/prfCn+Vu1Fbg=;
	h=Date:From:To:Subject:Message-ID; b=ONJYET8/8vLYo7DWDQhqLqj+PpmcTFt9Z16GLtPzfOUN087xbhIYWJeacjCmbefGSSeuIGKVZ+GKIdUZzjTOVbB/moPCoZpAhFs0iels2vb4tPaoLV2iRaGUghpeOJZhuoyokcFXB4ClukNp5YOIh5paBZgKJ05QMGaVBJbErLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBEaWmR+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBEaWmR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680484; x=1804216484;
  h=date:from:to:subject:message-id;
  bh=AwDCFf4xFweB76H2OzrIcLpH8mHxPu/prfCn+Vu1Fbg=;
  b=dBEaWmR+Z0NZ25OKz4jOM3m8zXwba7AyvMFZCrpBjuaxkAFhuythCMle
   +fMPSc/vMtpVjA6QLhv+MvsaHp4J/RHF/y2g+WJ9qtnIzAll54G4deQ25
   xr+mbCSl7X8xGXlliPpLhgHdpLR9UGZFkSsf1hcXJXKZCd2raSL52HWYm
   BkQ7werY6PZOH/eMnC87Z61dbju1DqTwmmj9V8//WUIyhOAh+cckbo5/R
   94wjtqA0kw3OtuRfK1W8sMBOTFgmo7+qMv07LEf4Lcli0t/OJjolqV86R
   hU8mTqK1LVNEW2IrMkD71Cu6rXWkONUTkNDerxCOo1YjgRvrxXYtvLHKn
   g==;
X-CSE-ConnectionGUID: V6CZMosxS5W2RXvDJD/Z9Q==
X-CSE-MsgGUID: EHydcu/jSa6DU4K9hqWPew==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91328486"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91328486"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:14:40 -0800
X-CSE-ConnectionGUID: X7098wfVR+Wt00gx6x8L1g==
X-CSE-MsgGUID: FoVKLnEjTi+wDUehXBDrCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="249014071"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2026 19:14:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzAa-000000001tn-33Mh
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:14:36 +0000
Date: Thu, 05 Mar 2026 04:13:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 433/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050403.WWs092nk-lkp@intel.com>
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
commit: 5efe4ca882ea8a681986f00d690cb6158c14ed2d [433/467] loongarch: convert kdebugfs fops to read/write iterators
:::::: branch date: 63 minutes ago
:::::: commit date: 63 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050403.WWs092nk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#27: FILE: arch/loongarch/kernel/kdebugfs.c:44:
+static ssize_t sfb_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#55: FILE: arch/loongarch/kernel/kdebugfs.c:124:
+static ssize_t tso_write(struct kiocb *iocb, struct iov_iter *from){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ACB34A76E
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772732570; cv=none; b=p2aq5ekocyx7nD89aR9ab+b3f4lkTXMgOCrI4b7FLzlhpfsHMGT7p7LNTMyovqB3O42ZNERUveeY0d+apFDGW4mUlp7fUEzdDdKwRamnhLrlJy+vBs7PhvlitBCgvyoK5WE8kheoITPGGU3brVc3idxQ+tiE41t0PK6t0CcOtaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772732570; c=relaxed/simple;
	bh=ZcCknFhK3PQgqb5no1RhTXL3/ZXEroaz2gyjB8DvY+k=;
	h=Date:From:To:Subject:Message-ID; b=n5azGowSG/gpd03Dj3tjtVH9Nxlsayigr3yJWSnxkoV4m6jmE+BanIkTzlczLoRVfM5buzMgRqYwLwD2JRmDu0XC0zlGxzHY1o9MFLrtF24aBpnTk5FwgzLROoqlbuXaln7OsN1npO7ddgouRfjbNxI1+mNZcnfYEd683C5y8mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAZxHVdY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAZxHVdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772732567; x=1804268567;
  h=date:from:to:subject:message-id;
  bh=ZcCknFhK3PQgqb5no1RhTXL3/ZXEroaz2gyjB8DvY+k=;
  b=oAZxHVdYA+PNn1HPjKEJUi5+a/LPT7SUTiqyvqjlxLrjTTYkKcQYyuhv
   u0+KIsbnlFQrYVJc53JA3B5egSK0i6WAhyeit95VxPKvTe1CnR89lqxRn
   3JFl/9h2jOJbjqYMdN1z1CsvS02Qd2NLtke4E4e6p6tyDXhOM+OdxAiHn
   ornd29y6SfzyGPgNN2j4KmZmMc++7SGdj8e9jJZe6sYtZyo7xI8Qr6qly
   xJcLMBbT+yJrpnJZAakB0tmm2ouKTUQahcu0IjmubRiN/WrTvZiKUQKOt
   RdWh4s2IUCVi88Jcs7m2I0KSqb05qMsJ0sIIoMnzGAMPkkrbI23/Qk4KF
   Q==;
X-CSE-ConnectionGUID: BlsaeF7uREuzbPSDGWWkqA==
X-CSE-MsgGUID: owkCH2u1SQKwiI75EzGKkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73736003"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73736003"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:42:47 -0800
X-CSE-ConnectionGUID: oz0T+7YTSF2rcrxTbSFB5A==
X-CSE-MsgGUID: TW6llSG8TFaxYaOyId0k/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="249219759"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 09:42:46 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyCii-0000000022v-0bhs
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 17:42:44 +0000
Date: Thu, 05 Mar 2026 18:42:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 288/470] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202603051827.KdHFUZVB-lkp@intel.com>
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
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 8efec30c440a4531335bf4014f514db97e129a30 [288/470] drivers/net/wireless/mediatek: convert to read/write iterators
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603051827.KdHFUZVB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#49: FILE: drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c:474:
+	struct mt7615_dev *dev = iocb->ki_filp->private_data;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

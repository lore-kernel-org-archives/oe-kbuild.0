Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B3A27702D
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680483; cv=none; b=mhBXGKCyRGxE7rmvtW9dzOqW59kpuE1U4O8rPJFnUaUj2Mln1No/+avI0Smhy/88yGqUvX8g06clLB9+CYUf5eve9zNzGlzmuk4gV5/NS2vewp6CUrF4ueEkxwhrpIocM64wesjpZGt12xMmojTJGDYSlQ/X/585t9rSoaMbgKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680483; c=relaxed/simple;
	bh=JG8zMima/SVpCxodkNxKR+MR3fzgdmD9Qt7i3jM+T9Q=;
	h=Date:From:To:Subject:Message-ID; b=mZg4tQYKO1Fj8SStV1gPfKZlFyqXyfDEaCXOy+K/yyRUsNu1YlEPo2IhCVyJePEobvW84rGQHnJQ89yFeV+afJeQPII+P5Ci7LlH/W2nLuTBsJCiLlhGmR2oSRJDWr7hzT6rxr36Euf/6f5E+7G2X9vpcyvGsq5Lr8i2/QhcUAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBkqHUjK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBkqHUjK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680482; x=1804216482;
  h=date:from:to:subject:message-id;
  bh=JG8zMima/SVpCxodkNxKR+MR3fzgdmD9Qt7i3jM+T9Q=;
  b=jBkqHUjKtVIIeHMn6SgOx3rLVwuhsY1ZYG16OkFggZ8oFOeF21lmfe3B
   BwBtInHB1sQugAmP0aFE6v+qIACUkmIiooSrenGnatpYAxxq40dfaHYzZ
   PH8TscIPr6ACKLb6QeJZ7W2gUuMhyNZzgKzFtHtqFKEZZS/W8js5YOVhC
   h1ektxMeOf4yT5MJGAkdR6gkQxgmTtewqrrEbCmrEUDLhViu1RrZGeSM2
   OwIjuO6nl3W4PdD7k3Qp0DFOd/+kqqHAeuCCwxonOmihAnZJ4KKvzoCYd
   9+OodTubLKrgKaEspNjVy3nR0KhVcnrq5CYwU+8pC4rmH13DLihygekrI
   w==;
X-CSE-ConnectionGUID: Lzp47TrZRJiYmOoxaXAivA==
X-CSE-MsgGUID: Y5a9Y1ZaQB+V1mi9ZiXC6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91328483"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91328483"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:14:40 -0800
X-CSE-ConnectionGUID: z5q/2hhsT7qUYWxVt5heCg==
X-CSE-MsgGUID: 21Gq1/LCSDu78INn3MuIYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="249014065"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2026 19:14:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzAa-000000001tr-3MLT
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:14:36 +0000
Date: Thu, 05 Mar 2026 04:13:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 436/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050402.UBri1dUq-lkp@intel.com>
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
commit: d9e6184f27da920bd8d28544775848e3231b79e4 [436/467] kernel/power: convert qos fops to read/write iterators
:::::: branch date: 64 minutes ago
:::::: commit date: 64 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050402.UBri1dUq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#26: FILE: kernel/power/qos.c:467:
+static ssize_t cpu_wakeup_latency_qos_read(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5143272801
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680543; cv=none; b=QF6124ASybG3EWF/iqlZNmldnWowrxrwKJqvVLtNmWbF7KxOBWn0r4otRqichUgFI10X7DA0BGbYGfh8dIm/OBp2tJk63WIZKRCCOEgG5to8ao0l405Gkm3wP/BHgD7cwmyFjjQOqhEjjvLWSJRQ2VK3K4EJhCru/NwTxJF7Gz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680543; c=relaxed/simple;
	bh=jxjF1LCcpw+U522ir9Kj3QJbxJgNuVdC3Vku6JugSew=;
	h=Date:From:To:Subject:Message-ID; b=WADO6Ln5jnEJfQ1RDzVhiMDsNcQ6Fg6JajJHo+DnQH0Tszqcw2V/k+Ekyk7yV24uz38EZ437lGs51sdBEVKuJM+czXJtH5QJYIk+9gHWfHbj/9ecrH2yWuYPLa1s5ybDHt123cxWiG36nuNVHUhesSZomPzvrZbYbIUC4CZF7T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lk6+3ISj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lk6+3ISj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680542; x=1804216542;
  h=date:from:to:subject:message-id;
  bh=jxjF1LCcpw+U522ir9Kj3QJbxJgNuVdC3Vku6JugSew=;
  b=Lk6+3ISj5lyxcO5SmC/KWc+sODs4zbHECH1yrfqVRnxSNicMAG/5hAow
   843qM8e948tZMgkkumSQVVFivsE18ftvy9Vry0AL+OS9klKj5Je5Grhq6
   Epoufr4dKm9Fpw6RHlNiXmKbTWSFERNC4+TG1C5wNHNdjsgCQHLZeOWyM
   FX32HmZMHZuuQ3ByXZ5B6+uCT3ZHxygZvI+OlDsO3WXcpj93vmB3y/lOH
   Y0tM93kWpp0L4r/ZHM26zf3nQVxgGJf0Bw5sv2zsjPbGq14yXK5A/crsF
   Emd2nYKe8W3UAR30B7MeACaHnZct8ArDgenfbZKHntiSaUKxLVZtqmqfO
   A==;
X-CSE-ConnectionGUID: Tz4V8EnMQoSY7Z4HQ+H9MQ==
X-CSE-MsgGUID: w+FuHQSzToyVQKd2opG1wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="61330925"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="61330925"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:15:39 -0800
X-CSE-ConnectionGUID: G4nYJugbQZKnnmSb3J5x3A==
X-CSE-MsgGUID: K/n+yJfJQIus7l7KLox5Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="221446085"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2026 19:15:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzBZ-000000001uf-13QI
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:15:37 +0000
Date: Thu, 05 Mar 2026 04:15:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 443/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050425.nqnMXjm2-lkp@intel.com>
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
commit: a344837105bb04bfbfedbe8a8a9767738ce911d7 [443/467] ACPI/APEI: convert einj fops to read/write iterators
:::::: branch date: 66 minutes ago
:::::: commit date: 66 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050425.nqnMXjm2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#26: FILE: drivers/acpi/apei/einj-core.c:842:
+static ssize_t error_type_get(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#51: FILE: drivers/acpi/apei/einj-core.c:947:
+static ssize_t u128_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#70: FILE: drivers/acpi/apei/einj-core.c:962:
+static ssize_t u128_write(struct kiocb *iocb, struct iov_iter *from){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

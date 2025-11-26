Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106022339
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764185486; cv=none; b=nn/OvQEPiuU4sad2A1n+O9yEXnbSLEAihAGISdm7ABl8wcVxBNn9iNosyGZttWaPxKNGwGzEV5dVkXKh07gM5GWEGjYF9GpfHWOzbkfPvwMHkRbmnAs3O04D4+DUX0UCL0t2mNOTYg4a8Cwi0pJ1Kz6H/vgx2uyMQT5jcl1homU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764185486; c=relaxed/simple;
	bh=E6w2s5Zd+3s+epr0jTehvNT1qbwXEW8tfm8FjvbmxRs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oEYpRQ3Vjk3N6BC8hn3+gRiEWZMycLfsyqdYUE1+dy+FW9Tvv0J6X5ctnCpBF92rH0ybVYZeVMpkUD3qE6s+r6WlbEGf6xU0uCioJ/UrVjGEoXAS1cfLqJl6Icbgz2PGPdUI9Hg0IqHxLrekbwBEngx+RSfYIedJWsvx4XyOxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSFQoYh2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSFQoYh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764185485; x=1795721485;
  h=date:from:to:subject:message-id:mime-version;
  bh=E6w2s5Zd+3s+epr0jTehvNT1qbwXEW8tfm8FjvbmxRs=;
  b=ZSFQoYh2SQMgmDNAT0FGRQNOu4NsDQh7clvJ/ixcVTZqCug3zLWsJz5l
   gsHGrCQAMx24bVqcC1CTRju8amh4AzjxV5oeyK+dEXIPm51cEm1iyddtV
   1qyqFyTE9Xq9C3cxmJdNCQ7ywB5nf6Agi74B+tODMLL9ATlrdR+Mnuiqk
   /gl009fai6tkJ8FdYj1JLYnA2M6efcW4JMS6K1y0wIb1sDYoSZRNCppZa
   s1Vjm3LLjht8bORbTuAoH6zGlZAiWVxz5Fp32GCpiVJhI9dcXprRqaKuj
   n2Et9CFO2Vxl/t+z6Wa2xJgYCTepbWmVuIAwEm0TO24wp0GoiQkDCOGHE
   g==;
X-CSE-ConnectionGUID: 3qcpI3ktQz2HjukRkI32SA==
X-CSE-MsgGUID: mukVtEAfTlq6vCkxJbrA4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65938610"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65938610"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:31:24 -0800
X-CSE-ConnectionGUID: wHFv9x/1TS+Bq94zXYUxLQ==
X-CSE-MsgGUID: YahZk/DJSVWQhkxCXkUgDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="223733098"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2025 11:31:24 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLEX-000000001Mn-2fNl
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:31:21 +0000
Date: Wed, 26 Nov 2025 20:30:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 441/999] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'unneeded'
Message-ID: <202511262024.YadlUhSD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: 5197303439287339e711264ff77b45d125f60da2 [441/999] bcachefs: Add a comment to bch2_accounting_read()
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262024.YadlUhSD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'unneeded'
#31: FILE: fs/bcachefs/disk_accounting.c:952:
+	 * We want to drop unneeded unneeded accounting deltas early - deltas

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

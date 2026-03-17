Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE7135CB80
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740998; cv=none; b=XtZ0OWT4nKw3nO2VACd7EV7tlPZnWxIjIKV8+sKBk+XOXdRKCwzRbmwRBi11CGY4sDq3gmL1svlESmqjAGJRPGzTpBsRo2he2AqhsJW4Bc6bJlwd3qtrktLeHpwQm8NKnxFnovUJNZEtgYc5FfZ8Adgb81UzH6m3YC6iVdkzrZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740998; c=relaxed/simple;
	bh=UhdnaeNAbxugdkQ63GhakWTuxLTI9RccJNOCy5IO48M=;
	h=Date:From:To:Subject:Message-ID; b=Qq2LARjU81jgy63bcI4UuGx8mD6zw6zvtt5de9eymspo/x4a+jUckWdQ6oeTaybEjOthWDLoalhG2pfn1JKH6NCoiz6glIB38HdEHLiKeAadxXkLVqlKmbERv3j/qxsfJK/PfiCb/iNOTNC+8rRjGIGPQxwIULfjFeMJz0cH6w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Krxhqb5m; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Krxhqb5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773740997; x=1805276997;
  h=date:from:to:subject:message-id;
  bh=UhdnaeNAbxugdkQ63GhakWTuxLTI9RccJNOCy5IO48M=;
  b=Krxhqb5mZUoPnDIVZ0Ut+6CXjOP9yB4oR8zvlYNrNnKoqfe2yFQ+f/5m
   p+dwq+w/bM+Wo7WdH1AO2hhYeEb/+YDu8sr2+sIT9og6U4QZtQoE5I/88
   5L+qj7uWQEuhVKJO1c+dQ0by+QNTJpqxWXBaknLoXv+3U1iH+VQEH/v7X
   Xx43yGoMTmrhocBrbcAakoBQ31kxCZGB5bsIK+5INRWP4uKLlCedJczH8
   LUzYiG2/fka0/fAva33B7LAeh6NWHgUlU/E/ZR3ckRZ+WI7DuPAuANY8g
   xue3ZrKOmVR2x8U32/SXH64EcBBEM7KqCj95P5Ve2Rs7ngqWgiJhcoDMn
   g==;
X-CSE-ConnectionGUID: Ta+guYl8S3O6iPQwAXbABQ==
X-CSE-MsgGUID: vNpd16tHQU2AZLyVvpOl1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78621449"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78621449"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:49:57 -0700
X-CSE-ConnectionGUID: oybzTjiGQcmRmyQ+w6yr1g==
X-CSE-MsgGUID: g2VahCJ8R6WfZXxDN4C9xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="252706951"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2026 02:49:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2R3h-000000004Pn-2XLe
	for oe-kbuild@lists.linux.dev;
	Tue, 17 Mar 2026 09:49:53 +0000
Date: Tue, 17 Mar 2026 10:49:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [wsa:renesas/x5h/mfis-single-driver 3/8] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'for'
Message-ID: <202603171030.KITALD4O-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/mfis-single-driver
head:   aead5d581eb696719f0c93369f53b7c39c9dc3b8
commit: 0fe2d159c509b2bf559cd0a7dbef174de8a1e9dd [3/8] dt-bindings: soc: renesas: add MFIS binding documentation
:::::: branch date: 45 minutes ago
:::::: commit date: 88 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260317/202603171030.KITALD4O-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'for'
#192: FILE: include/dt-bindings/mailbox/renesas,r8a78000-mfis.h:3:
+ * Constants for for the mailbox part of the Renesas MFIS IP core.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8763C7DE4
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774595881; cv=none; b=IDtxc8f495hPheqLHVeBRUNeY8+ppHhRtzl7tWDjMD0ATKvsD2luEJXu8Cupm+/9NcUd6PA3nPqnNqgbNPy59t4PADbbNH0zU5eTWm6zVk+zraYBqZaJjRrUmerVOYq1wOp5tRR/Q9SUyMFbfRvd+WThxmMCSXaJ53bg4TQ9jCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774595881; c=relaxed/simple;
	bh=nABNH1IdB388wrb0mJFHkpGL+V5eWtnpMlC+KCGp8rU=;
	h=Date:From:To:Subject:Message-ID; b=tMACl8Ww96rPDW06LWMkExZv0qI32qOkA+RxUrDQ7e+vqx4hiPYF7G55MyzdXch+ijio8I3E6Sg7L+Pm82IRO2nSGRRmHtxE2p7wbEIApSCINhEUgmurWRmx0HeKjZ6WBoq3IkDf8Ikp5idB00qgJC9bHidFTElV5NXznK7uDsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZ/HeTJ0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZ/HeTJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774595874; x=1806131874;
  h=date:from:to:subject:message-id;
  bh=nABNH1IdB388wrb0mJFHkpGL+V5eWtnpMlC+KCGp8rU=;
  b=aZ/HeTJ0mwI1ZX/FLrPJdx3+oXqKj08Cb7skOYDy5GCQkhDVsb/9iCbR
   nGeiL3/xCJDqi0pRkNYsoRaWsNrCPFaUm31UMhEbBLxto5jp3mDlv4iEM
   QRLHgUoaleGzoy2ZRMLLCg6hStrSH+TFD5J51QL1OVufxDCQGTMm6CZP1
   SzOjiVvvHx000Cvvy9AAEdNqMnyj7UfCkKu7t9xm9F74uY+k3cOr6FXj8
   hlL9rW0KukwxMcHhinqFmoXFuyI0cYGcB4laf4NVu42YAj8HD603PDIni
   AsFoO+zYtJpbnFgJinGWlwgFhUcyTtqwCioLMMTBhX6O5QIPHfLD5QArA
   A==;
X-CSE-ConnectionGUID: 3YUiwx01TfqWq1PFuS7e1Q==
X-CSE-MsgGUID: JmT2Z3NLSm6T4qgm2FiyJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85971390"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="85971390"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 00:17:52 -0700
X-CSE-ConnectionGUID: IO2m4hpfRs+CuzMMd89e2A==
X-CSE-MsgGUID: L7BtikqDRdaIsLT8GLQoxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="218617437"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2026 00:17:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w61S1-000000007Sj-0SlL
	for oe-kbuild@lists.linux.dev;
	Fri, 27 Mar 2026 07:17:49 +0000
Date: Fri, 27 Mar 2026 08:17:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [paulmckrcu:dev 21/27] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202603270814.NAxLqGom-lkp@intel.com>
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
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev
head:   bc9d500f1f9bb52f09c7b085c08fd0319ad756d3
commit: 26cca1d546bd557fdda0d8d6000dfcb80da759ab [21/27] torture: Add a hazptrtorture.c stress test
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260327/202603270814.NAxLqGom-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#428: FILE: kernel/rcu/hazptrtorture.c:385:
+	const char *cp = hazptr_torture_writer_state_getname();;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCC93246E6
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069305; cv=none; b=iJ9qPQRaGnSavKKtQU0M+Ck02Ouwk8oY7SmKaAC05+vba85unQnRok7I4y8wRS/XxrKBdcJ1+6t7t6LUKqyR923sUuJWRE4ufAtMWlbUZGFFILmXQKasQYObymMRZZJAEBROQArrV3PElVD+olcOtfs6MRi1y3RtrcIcaOSfgDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069305; c=relaxed/simple;
	bh=IzEanP2uvymHwMdlLUzXuie/MiRqD6RSabaov0AcNdY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dTL4m6zzSzybq943Y/lApnsepWIWdZdUWg4A+NmNRSo9iFiAGE4gvEp3u4WOnnCBnJYNtUVJDNeNJ6EAeMl3s+G9VUMDQp2+PYjL7oN3GIIfFz8I9aG7H43lp7FSg8LakriJO0uN+vWTo/zBzhp5Oap6dlq126trRcIRz4TESEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgNHyI/e; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgNHyI/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069304; x=1794605304;
  h=date:from:to:subject:message-id:mime-version;
  bh=IzEanP2uvymHwMdlLUzXuie/MiRqD6RSabaov0AcNdY=;
  b=jgNHyI/eNnDe8M10Y5ZDdfgXwmkFt+itTM7VgDbqAylKg19HKr1Ng+NC
   9343Zt2wvo5RmF9YmdKp3Gv21fqsLxwjYStKD6Ftfp5aCBqvbrpq1cnkA
   cm+3hfhYjsGlyPqViT4K2lL8+e5yXYpXIOFFB44kUUkuuuW6e1KbD501R
   7A3FkgRAVP8CydFrSRZfPPrJYAajE/P9PfXhrTJ6S0bOrA4ssOd7yJr22
   0wXXjmxiIJ6xElq+tsv1nKHy1Zl5MJXW2KiEleoNNK7poSaisZqmOjkqv
   Yrh2P5M5DkA7TM+JgGARV9IkVN3+nluKQqsGTEONJi68pQIJZL8rl9zBs
   A==;
X-CSE-ConnectionGUID: Lkli9IzAQT6i7cM2hipcAA==
X-CSE-MsgGUID: TpCbAhSGREKBsH4zXDHMUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637522"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637522"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:28:17 -0800
X-CSE-ConnectionGUID: A6J5t3cmS1WliztlGYxEog==
X-CSE-MsgGUID: xdIaJdf4SH26deBm5pRWIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190035938"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 13:28:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJerW-000000001AC-2ePo
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:28:14 +0000
Date: Thu, 13 Nov 2025 22:27:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 621/867] checkpatch: ERROR:SPACING: space
 prohibited before that close parenthesis ')'
Message-ID: <202511131953.WEyXFbFf-lkp@intel.com>
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

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: a478c8b865e2a57ece2d1ddccc5198daf64a8941 [621/867] bcachefs: noop skipping for write buffer flush
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131953.WEyXFbFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131953.WEyXFbFf-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space prohibited before that close parenthesis ')'
#91: FILE: fs/bcachefs/debug/trace.h:1256:
+		__field(size_t,		noop		)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

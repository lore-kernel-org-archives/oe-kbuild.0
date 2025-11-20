Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0180F8F5B
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763677681; cv=none; b=hM0kSGMchvvUbhinmjWrYQl5HI6Gwd9ZaLVuZCA20O3vJd0IWPyFeq6WopI6dUel2rc2yTkPoO1t1KE2vFfRidoMK2uaGHZCZuT3AxZKnI3Rr8m20RTCfLSi0EgHWu0qhm2DNgkw8zWqN2K7eaF6Z2quJe1PmiYyr4QfFs6E2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763677681; c=relaxed/simple;
	bh=0z8BjMQ9xaxmhMin6iIPcez8fZHKtdiMLITmuMUB3vE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IH/Y/k+Y8LjZ4FX3svzhBUh8EjR2Z4P2g2Jx7JKhC38DLK+6IxKAtQz3BgYEG8YDezCzTM+A64g4npsTa42K9JiPtZ+n/SAgyl3ET0RWCIXw+UY3+iMHzqgOyX2G2IDWwjmxWdDbFO9wJR8G30oZHRnuTvZ6YflMxrq76aMejME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbEdgfEp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbEdgfEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763677679; x=1795213679;
  h=date:from:to:subject:message-id:mime-version;
  bh=0z8BjMQ9xaxmhMin6iIPcez8fZHKtdiMLITmuMUB3vE=;
  b=FbEdgfEpu8INRX9/jxz00BSSWLTa8VRXakioT4oymD1YaAIhDCdNQvTS
   CnsKgG9hjpWwhoaiVKm5NILlYIRcwoQE8OxNUIDxW+pjj8/xRf/ROJNvA
   t4AwgsCRUS/LW/ISCCS3WFXI23ck6Yt9Bh1s79wK6i+OKah5vhMz3wfrd
   vnzzXewnWmPp8GJZl1fB9kOIVvFEp1WRRzg1ayYvXoEGTBLX+Ut+12RVm
   XyFEBzJRpNm8jGXhVU5rZcfnU7aMsxyf0YT86bVShFitr/7uR8Kd3n7TK
   iKf4RLdEOCqJLl9yzp4FTbm2zCf74J/Sf9ghMlRa5GeIAmOs198L6yUM/
   w==;
X-CSE-ConnectionGUID: l2+oXKuzRZ+7iPAGb/buyg==
X-CSE-MsgGUID: LsubhzI2RR+131by5L2Lww==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65643542"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65643542"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:27:58 -0800
X-CSE-ConnectionGUID: hJEBgr3xS0elMm0M8ukdqw==
X-CSE-MsgGUID: dMFdANSTSwC3K4pN9OH5JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191752419"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2025 14:27:58 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMD87-000000001Yx-2n2c
	for oe-kbuild@lists.linux.dev;
	Thu, 20 Nov 2025 22:27:55 +0000
Date: Thu, 20 Nov 2025 23:26:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-github:work.ovl.cred.guard.prepare 43/53] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202511202347.03IpiLHW-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard.prepare
head:   64676d6627645d999fb10d936a6af2d7fa2a54d7
commit: 1e402a0d277559953d9a57ba998ce3e723bebe2d [43/53] ovl: port ovl_lower_positive() to cred guard
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511202347.03IpiLHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511202347.03IpiLHW-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#79: FILE: fs/overlayfs/namei.c:1458:
+					/*
+						 * Assume something is there, we just couldn't

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

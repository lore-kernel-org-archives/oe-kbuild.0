Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248D11A5B84
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 20:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764101448; cv=none; b=IfEVxXCGLuCIhmieDx1pi9Hy5GzW9+2isEKOSnzxO1p6jk5dyGpnBDOAiUpqsJsxHDnl5Q/cERPeDIkJ0tuAUFufFylhD35cxqXAFug0GiaaGma80053tt214Q33pnzXFujLceN4Vee2KzO5AQ4+8izdlhLsNLCntWPKcROJk/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764101448; c=relaxed/simple;
	bh=820LmoLJDH74IUT8w2Kf66LtATD7ZeTzQGuoRcqzXXs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=haYuULTCGBP10Tr19OhokjvPglnf7vHxF+b2tDQFTif0O4IEFm2vBaDUCmN4nrqqpIoNKd0iVVA4Gy8+skEpBfUlV3A0Qps3rCB6TdwT2uDXcpG9MwSlULj+Q0WJZ7K4bu6+Y+NZ+NF7DETy9HDO2Nl8+M+FCc16k0791f/qFVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mo1N/dah; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mo1N/dah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764101448; x=1795637448;
  h=date:from:to:subject:message-id:mime-version;
  bh=820LmoLJDH74IUT8w2Kf66LtATD7ZeTzQGuoRcqzXXs=;
  b=mo1N/dahTDZZz+NH4vZR/P3QWTl+xVA7/H+Cqb4uIuzu6rLMl4tnxgbg
   94dCN9AEomPk8d7Y/4gPHF4dQK8S94SZQAF57mdbu40HAgcPjfp6IdlVb
   DVrvH7qi23T8p/Z6RLtdAX3YyKCzYovNeYt+kkaQ2W+TFZHfZUguFHOsb
   cUiVxWeL7DoSCEi89Y2rxBPw864InBjCiLijI0XYVlUkpmcWSB64ANbBL
   iFR069JRDRHDrnq37FLfe/0QtY7MC04A5wRECInkqsMZxnzENaTXdAwo2
   BViNxvWEQF92yc7SzE46sQX7Ir3PAC30gYYMwBC+7xbRd7iF8IFse/wU5
   g==;
X-CSE-ConnectionGUID: v7tqdSwdRDCTs3W79fHP2Q==
X-CSE-MsgGUID: jgLVlmRSQsaxx5sAPZ75bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66163413"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="66163413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 12:10:46 -0800
X-CSE-ConnectionGUID: T9be4+HBT6KgYHGvWQU4jw==
X-CSE-MsgGUID: 1xTmE6/LRbyhBHktmlzTYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="193184220"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Nov 2025 12:10:45 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNzN4-000000000YX-2Qqh
	for oe-kbuild@lists.linux.dev;
	Tue, 25 Nov 2025 20:10:42 +0000
Date: Tue, 25 Nov 2025 21:10:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.18-rc4-v5 21/84] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Shaopeng Tan (Fujitsu)
 tan.shaopeng@fujitsu.com'
Message-ID: <202511252106.RRczRFEu-lkp@intel.com>
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
TO: James Morse <james.morse@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc4-v5
head:   a859b605c91ccf42c797b07e1b9b9bbd610fb0cb
commit: baa8d1218e3e088f5cd9105bdba98e3a7d9ca8db [21/84] arm_mpam: Allow configuration to be applied and restored during cpu online
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511252106.RRczRFEu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Shaopeng Tan (Fujitsu) tan.shaopeng@fujitsu.com'
#19: 
Cc: Shaopeng Tan (Fujitsu) tan.shaopeng@fujitsu.com

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Peter Newman peternewman@google.com'
#20: 
Cc: Peter Newman peternewman@google.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

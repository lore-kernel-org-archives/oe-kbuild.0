Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF063A4F58
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827956; cv=none; b=caIVexs0qZNPyt8qnpr/biuQssp1QSfPqjkm71nsDvmuIOmIBfGpUPrM4/7ln3orRcUf+5QIAzY4xktl3YWxCI/L1KjizzCICrfOBcmjoAvTS2aZyHIQpB3oASYTHjZNb8hqDhNqR+/HhuJ7cXbZ7Qb3iYDiY1chAiFRL/HZVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827956; c=relaxed/simple;
	bh=MkL80RqMH6DaiN1WCTQryYJpHwWT3iGggZD4ljICHW8=;
	h=Date:From:To:Subject:Message-ID; b=VWh+4zbvgmNDr8SR2ZqJgCLLvRXAm2TwLo8FEPhPVJLikAmnH4GB+u53ZGkT8S3W9t/+EBj5qzDawvHF/PaBBQNNP6tlcOADLuZuMWOMHU1Lq5s6nuIK5ds5je3MeqvoH5ZPa1/6msZbQ4IJ7clqEc4A0YSVbJYaq3yOY1kAyXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PoNbcUFR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PoNbcUFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773827949; x=1805363949;
  h=date:from:to:subject:message-id;
  bh=MkL80RqMH6DaiN1WCTQryYJpHwWT3iGggZD4ljICHW8=;
  b=PoNbcUFRYCo7tsw7fHj3wVAhYhpNMkdN3qWm6MSPg3/idEvxJvnrjn5B
   r/ogTQCAZ8ni8sTCdKF42/EkWdEp5yGaBbyS3jTW6Dynp4l70x9AZIFxh
   /Eglu+Iqeyw6hBgK5+rdFucAqnTVupKnPHBsATEdZjDbn0sOk1xKAYMSV
   2dEQm/G9Jl5492PTNkBHRQfls2J8lj8HkD/mh6NjHmcNbvXhoQKz0AzTX
   2aleCseJ86TLct0jVIR6vqoQonsIXyVlRfPKt6EVXcILUAhU/5fRRZkcS
   WhvmUoVD/aOFE8GHcPwnhLxp+a11ENuNpE0iNMG09zR87kLnvGmMcss77
   g==;
X-CSE-ConnectionGUID: ZqZTGY+JQxe0Ddi2KX6Raw==
X-CSE-MsgGUID: VqqzwLyRQSCqswtoeI7neQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86350381"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="86350381"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:59:08 -0700
X-CSE-ConnectionGUID: 6C99cY4KS9yZzNSfXxPKQw==
X-CSE-MsgGUID: n4ESVK2tTpydlc5JrNnm4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222632017"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Mar 2026 02:59:08 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ng9-000000004dD-2YmS
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Mar 2026 09:59:05 +0000
Date: Wed, 18 Mar 2026 10:58:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next 3/103] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202603181037.Mo8rbURB-lkp@intel.com>
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
TO: Jack Xiao <Jack.Xiao@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   daf9f9dd509113d6f49ce7c00d92bc17db58f215
commit: 44e5195fa3d4f14cfef6fcec0ccc32a08bac1d87 [3/103] drm/amdgpu/mes_v12_1: add mes self test
:::::: branch date: 12 hours ago
:::::: commit date: 19 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260318/202603181037.Mo8rbURB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#332: FILE: drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:2251:
+	int size, i, r, pasid;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

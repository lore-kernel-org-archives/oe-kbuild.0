Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE4623535E
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 19:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767209456; cv=none; b=rP67SUde/mfOj+Ia6zsuPFm5/l0hqK7cge9P/CNInrYw+E8PSQF4m9Ji77Op2g7AU1oRmxue5MnhJOTo4R0Uu+i71zgfJwUC8yz1TdS5s2fJjIEKYF2W2ao6F6cH1yZTWpGzLD9362f1b/hhM5u0XUuZvGrGc2G6ajJGx4Mp/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767209456; c=relaxed/simple;
	bh=Rmny+ddneO8DoYXSwa+4Jnct61b/zEhX1RN68Dq2tpM=;
	h=Date:From:To:Subject:Message-ID; b=Z0Gtr/jYQONXIv5zpFTTpFsDPLAZHWVtayVx5450YD59Lo/B9EMEyKkBryw15QWI5GrZXf1hjBQ8lunWJox1Mqbsr+ai/VSkQDnSP4azOqtLAZIT0Djd3GciKA37QuNQj6A46BWhkm16j3gSnIcijLe8KCJUNIFepyPcrcz0uiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P943ZOYY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P943ZOYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767209455; x=1798745455;
  h=date:from:to:subject:message-id;
  bh=Rmny+ddneO8DoYXSwa+4Jnct61b/zEhX1RN68Dq2tpM=;
  b=P943ZOYYL/FaudcePQC+ltJ9sqvf2dctZZ4YJFFdGNcTv4dSnJmdOp8p
   zbCkw35OOvBXiLHz2oGkFkbK9gNRsEaEdpJzaBGZ+4Kb8gSzp/zGYx4sD
   MKa8u+XJ5XysV8a4Wh5IlYp5OtaiDcR/27i6XX8vdfd2G+9vVYZklf+Iy
   IVxhb/E/cwrzbIQPBVGs5W69RYGjBLLPkiCafHbxIrK1m8rGYCiBqhzXp
   mos7vY4nktVs5l5TUwPK8thtaqp0PqSg7eL8utkionEqBMafCFat+anZn
   ta6SUrsTK5/CzmSO0esxnV1wDYP0v3jwHjToh5+xIo7wh5/uLCqLsTz7S
   w==;
X-CSE-ConnectionGUID: 552kP2dbRReUz4XgeFiCcA==
X-CSE-MsgGUID: NxT7LZxTTSaZzN1cZVIm5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67780685"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="67780685"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 11:30:52 -0800
X-CSE-ConnectionGUID: OXNqfGmFQMis7zx739y1Eg==
X-CSE-MsgGUID: rGR09DxMQCyMv+N2TELs1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="201502115"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 31 Dec 2025 11:30:52 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb1uC-00000000069-2CBE
	for oe-kbuild@lists.linux.dev;
	Wed, 31 Dec 2025 19:30:48 +0000
Date: Wed, 31 Dec 2025 20:30:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [litex-hub:litex-rebase 14/15] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202512312006.M3B5ogjN-lkp@intel.com>
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
TO: Pawel Czarnecki <pczarnecki@internships.antmicro.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   c113f6e19870fac49ce445bc5692f08a6e6810a7
commit: a7f2cdb54df2cc462d54775b543139e47eac825d [14/15] LiteX: driver for MMCM
:::::: branch date: 75 minutes ago
:::::: commit date: 75 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251231/202512312006.M3B5ogjN-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1223: FILE: drivers/clk/clk-litex.c:925:
+				synthetic_phase = (d_t * global_period) +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

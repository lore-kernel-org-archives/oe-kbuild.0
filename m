Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC711B81D3
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680602; cv=none; b=fhbutlWpUnV/q+VmtWDh+zrURlcyzciy/pmalWwGyiNP64jnG8s7bdRARonafrzeyQG/iOtQ8IDUddsAubjf/8S5Ht2caAQysuTNqy9zLkMzAK0qpyYp+SIAudtRN67WUVuvDiT8kT/IjgilMOKOsvPkl8tEXApvI5fo1sn2PVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680602; c=relaxed/simple;
	bh=iASoStKUg7GN7xVFaVAvwblpj1bT8tcAx5Q+S3T4MFY=;
	h=Date:From:To:Subject:Message-ID; b=XRl847Rfuk0HoED6+m2SFkHbwHeFt8UbqN16Zv6dSyfo2e7EnPkll/EKTenvTwOBYJoEbeUiwIciQUu8qTUbfYvHcQKNPbstMi/ZJuKQ16VLgHJIE8RfRqZo+4YG7JhyHcWtRqV0Ws2Kmh40vPn8tZjT+1PfucSWXFmOit7K+uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luPeRzvB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luPeRzvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680601; x=1804216601;
  h=date:from:to:subject:message-id;
  bh=iASoStKUg7GN7xVFaVAvwblpj1bT8tcAx5Q+S3T4MFY=;
  b=luPeRzvBl+O68gy09dKPpRZwqq3xUomfpnhH5Ozjr4qBd68zkYnRQvSL
   ulBWYzvw+ex6udEgJP5UD0MthIKHTfYJclbiHGGrhpPdkvsjbziHMvaj4
   eSxtuxEhPDhmxRT1dPURo/V77yYGeNDpk6w+mW/NC6AFkVp8nsXXid2f+
   p8GI0hSXM3DTc0yGFei/Cw9oyIap1yu2/K/RiaCCamcDIL1/yQRf/vuIn
   u0DQyptie4fUaWHoEhNQ2MvX/lKFLm9WLMDtGNfLLV5v22mvQ8P+plDqL
   b60la8E5TmDLeySjIJzHYFOSYNezbL6QfkfNBwahRKct3Kaq9q3eKRfDn
   w==;
X-CSE-ConnectionGUID: qSPkh4ZXQ02/tvSCMLNbyw==
X-CSE-MsgGUID: qobIBO+kTsKEFgn2KBWyXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="61330972"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="61330972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:16:40 -0800
X-CSE-ConnectionGUID: 0UDteG2aSDihgbiwoa0dtA==
X-CSE-MsgGUID: 8/cTDTK/TK23LrdAa3mVIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="221446243"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2026 19:16:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzCX-000000001va-3EBa
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:16:37 +0000
Date: Thu, 05 Mar 2026 04:15:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 457/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050432.aUDZnisV-lkp@intel.com>
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
commit: 3b426b7a33cb76482a276a5836e138735aa4777a [457/467] ASoC: tas2781: convert fops to read/write iterators
:::::: branch date: 70 minutes ago
:::::: commit date: 70 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050432.aUDZnisV-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#26: FILE: sound/soc/codecs/tas2781-i2c.c:1506:
+static ssize_t acoustic_ctl_read(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

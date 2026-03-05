Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164B2336891
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680541; cv=none; b=Wqi/2m9nqyVtXU/mH3nmzJHmHCgHTYHz+V/na8OwRFlPsI3jbH88lUA32est3yYhe7M0YJMkcAtzadWQk2QL/2lyknRKAMOxQqcX0cZCoXEfwxvOVf3ezLCLdlJO5oKFRSQ1kyAdyMmrWArAEffsc0fPwi/Xb14RVz33Vhg9Gn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680541; c=relaxed/simple;
	bh=zpCNBTgucEEtFCimnL/xDIx+BcxqbwU8puRRlJ2x3pc=;
	h=Date:From:To:Subject:Message-ID; b=Y0tygOQFIA+zJykx77BxUJPqyKKeLq3dWB9Rcg2XzigfwvGuoQLinAMTRhXLnXsz2REBFfYCBODHoUMmoE7E/wFNUn7vxo10/3TDcnn/R/T2UN3wmzWJDwrEK9Fzv0Dw/LijSW8dO89HvLYsLJ/UeAiMDKioqA1+nO+y3ZNWWtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDA9KzuH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDA9KzuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680540; x=1804216540;
  h=date:from:to:subject:message-id;
  bh=zpCNBTgucEEtFCimnL/xDIx+BcxqbwU8puRRlJ2x3pc=;
  b=iDA9KzuHfBnYwNooRzFS0jz0AbJVQUrzLAr1MlhwOfW788UEVH23B3mT
   nMOx1slRBg1V/Dsk5GE3Dt+JLoqf5ZdzjwIpFhfpPpgRZjQT8/OeRyiLP
   qyOI2O9ima+ZgN79ZLjvPB4qrly7UJd2VLKNjnTrP7t6VfthXai0bSDz+
   Vlzw9RMQC/Qkh5Bn0koZ8ph856dynB/mQzW5x1sOCtShvm8HmSKv96VSN
   Xil+DPjeESYqLGnKlKzwYNFpScnqAU950trb2m/YDMWkmmUvPKONyMT3v
   vOlc0sRj389dkz4ktA/SwzYaRqQQmsxKK9jdLWT6DTw8yBrk/Eh+f+pz0
   A==;
X-CSE-ConnectionGUID: 5te+VQUkQLuJjXKefIjTRg==
X-CSE-MsgGUID: IMoJN1dsRW2ogbZTA/fH3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="61330923"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="61330923"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:15:39 -0800
X-CSE-ConnectionGUID: hEE8/W6oRMihUQ1whnFV7A==
X-CSE-MsgGUID: aylKnLP4TGCq4YMPbUt5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="221446088"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2026 19:15:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzBZ-000000001ud-0qpi
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:15:37 +0000
Date: Thu, 05 Mar 2026 04:15:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 442/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050403.EeOpOU4c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: ee34c4baa351a242e91a066aed3d7213c7849f07 [442/467] netdevsim: convert psp fops to read/write iterators
:::::: branch date: 66 minutes ago
:::::: commit date: 66 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050403.EeOpOU4c-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#26: FILE: drivers/net/netdevsim/psp.c:219:
+static ssize_t nsim_psp_rereg_write(struct kiocb *iocb, struct iov_iter *from){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

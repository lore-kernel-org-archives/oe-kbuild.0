Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26239E6F4
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829545; cv=none; b=UD+GnTBWgSe/lw0xP6TBO85KsFa7egxKMdvOZwZADTmqCJCEu0e9tANlTFttdJEPujEHofsojoPAmCFryMtf5SVE8ASSa2pyR1cGHCnwFZ+1TYkc8VbBJ9J5sCTFkHF9fUX7tRxqyHs3Soxr07J8Sax8byBbT0gJjiwuJClBsfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829545; c=relaxed/simple;
	bh=TBFsxkNjTUHvZGu8QPTsCXZrMoXFHoFWNqAOdmM/B5U=;
	h=Date:From:To:Subject:Message-ID; b=O/8sFDeJv7N61uVCMls3FTLGtrBJlm4QlYuBhQlHUFzgRX5cEtcAHT7HhBMP8h4FZLPz0Ay2ZLMqaOzCTA9joqgcGSrvNwidoHsPcDGrsU4FSaPjIyf9GXNGUWOAXTCDU0TKH5xxJqCxowe4b1BG4+MxBkom5WlQATo4uRwpvIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kn/Cxk2l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kn/Cxk2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772829545; x=1804365545;
  h=date:from:to:subject:message-id;
  bh=TBFsxkNjTUHvZGu8QPTsCXZrMoXFHoFWNqAOdmM/B5U=;
  b=Kn/Cxk2l2EQcMFvQSrmopVUktaX0KYNyDsy0eizg2EWvkdfAroiEjCkx
   w0zvYP5nQjPZFWUzmGFWBuIG/28cXuEv769v00t8o8Y4yoLaSoOEQHU3P
   wZni+FG/s6sqOTbZbS3ki/fjkX7qD6TU+3/5+fDDwjrCzeonF9oVJMYcj
   RXlYhIZa69CkVqq9hrUOL/oozSt8ut0ZgpPrVfMw7bB9tBpExKv/el7Iq
   Hm6ulKKvgJT2rq+T7Iut6B6FqcizjNbBd8zVMC162t/ioNMm6CStgM9S8
   TmfDKMclWCMpj6UDSowImNQwcVgRgwB0QtrJrmyKFUmI/Ne94vvjHmms8
   A==;
X-CSE-ConnectionGUID: 7he+Iuz8TLeSo/7dPvThTA==
X-CSE-MsgGUID: MydefWIBTV+5yviABcuc0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="85421073"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="85421073"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:39:03 -0800
X-CSE-ConnectionGUID: TtFp48yRSxK12aWmdNcayA==
X-CSE-MsgGUID: GYReom1aTH+hZUAdAWAzMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223601278"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 12:39:02 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybwp-000000002Li-2lU9
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 20:38:59 +0000
Date: Fri, 06 Mar 2026 21:38:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260306-1425 9/31]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202603062109.NAVzP4ln-lkp@intel.com>
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
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260306-1425
head:   8e85a7c6fd859479abc528a78dec59382ef82d3d
commit: 52839916c078557388f7e549f25e457b5076c1e9 [9/31] RDMA/hfi2: Add in HW register definition files
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603062109.NAVzP4ln-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#867: FILE: drivers/infiniband/hw/hfi2/chip.h:825:
+	/*
+	* A special counter that is the aggregate count

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

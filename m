Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9A3BA227
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281912; cv=none; b=dp+++BWnwudlblXtANhfFYLLCmo8XnmDz3frAZu598zrBIUAHRaFHYalC2GNoKTOG2w5+Np211C6UdoOKRBVxkTuFt7eOFvbrOQ+w7ACkSrF5gyskuq2Xjb5tOEe8ZZ1VWkT7RHmKePCoUOd6F7saUiiM5C9ZZRKf73tJXMK3c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281912; c=relaxed/simple;
	bh=Mj2kvRokppTuAfvFF5Us3maksMsSB8BhLEhqmx+yBcA=;
	h=Date:From:To:Subject:Message-ID; b=s31meQRTdXS2GMuDzvgDdVi5dkCol/ZHIgATeHxIV7Rbq7JxrohIwm/n3gZGR7d/DNSE2PPVz5hspIpGPnFmvfSDm0UHpphVEIATcEqyFy9ydxW8CKm9tS1DWNVbpjGfc2m6557oPWF4ygPDb6u4UxLJ7SJfLwzqjha08gl1qWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYbmhaNl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYbmhaNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774281911; x=1805817911;
  h=date:from:to:subject:message-id;
  bh=Mj2kvRokppTuAfvFF5Us3maksMsSB8BhLEhqmx+yBcA=;
  b=kYbmhaNlPwrte6AFPep0rtIHUlkkScJN1JK/7699XifbKpMj4m+IbO2m
   4a6HqOc+OAqXwitf2Lfqb5BvUOuhKHMMqjTrB62o7NLZD9k1QRavk1U/0
   vskgVJ+W12dCZflXU0ghGv/C1m9dBLqFlVDwv0UK9/N5YB2pf3hcBeQe5
   WmCYDq8FLdrhP96BdOeLNmc+66ECVSPl8qWl8BrqaNOfa0EzdP7evnK/B
   2XC1r1YaxyblVHBiz8fxSF8Xmvw2A+rILkXedF071DBcP+LSjSmJS3Hul
   X5R+RnQsgcgAf9artsBFZpg64oyvRu1P1oHiqeBx8020qb307/b9Gcdr+
   g==;
X-CSE-ConnectionGUID: 8orBBSzLTHKNHHGxXze76A==
X-CSE-MsgGUID: TB8mhXWvQAKdd2uG5i+izA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86651789"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="86651789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:05:09 -0700
X-CSE-ConnectionGUID: GTxp/IuPSGiWbAwDyWG18A==
X-CSE-MsgGUID: Kc0OJ27OTSeOTc5ZsGS2Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228548305"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Mar 2026 09:05:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4hm6-000000006gX-1VNd
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Mar 2026 16:05:06 +0000
Date: Mon, 23 Mar 2026 17:04:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 59/77] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202603231613.mnp1jWf9-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   05d546a07e9a570d280344cff29c354b67fda562
commit: 0d24f44df0e3f41518bb205dfdc1964976354a08 [59/77] libceph, ceph: Convert users of ceph_pagelist to ceph_databuf
:::::: branch date: 17 hours ago
:::::: commit date: 19 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260323/202603231613.mnp1jWf9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#205: FILE: fs/ceph/mds_client.c:4640:
+	struct ceph_encode *enc = &recon_state->enc;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323F51C4A20
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 04:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118322; cv=none; b=OgpP80yFt+knRxsM2JucuOVfXZfLyfNr1aYT+uN7L+gzR7YxxFpbyARCg9vc6nAnwt6zRaLvJrEnoSkS6kbUqdoivmME8QEGX7V0NtQqSVwZ0MN99SQWT0D66jgARgrwsatyyZ81hfhO8kutfh2fke0mmS8NoyPWkf39Zx5w7Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118322; c=relaxed/simple;
	bh=KgOKmsmbETy+GrAsif1ykMMWZyb8j/ZGDuVxzHQp2YY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bfl++EIdu4bjrG6j3GhGImrqJ08QvQjKOLZALGkHwdfmfWJanjr5DkoBHSDe8/o0sfyt/Du1a+5ovNMrbBlacc7mJfkWQbW4VWj8RijQZmesqFJX6xJZdGzF1OQ3QroHrBMXCbk0t1U9n/ELIkC/9IuraJq4OYmNHE1Xj+blDuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4ZPJx5T; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4ZPJx5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766118320; x=1797654320;
  h=date:from:to:subject:message-id:mime-version;
  bh=KgOKmsmbETy+GrAsif1ykMMWZyb8j/ZGDuVxzHQp2YY=;
  b=e4ZPJx5T80VXSrYaHs+wZuCQlZMm4Tbc7bwtIf9t0ceeZMOSo/GoFwdt
   6l/G1Bxp/3OK9U6A62MBunaiHCNafKyYGxhH+xZnEsO0R5k2OWDUc6IZ2
   nCJOLdjIWKy5kTHgu7qvFRziZ3Y3DLkoFvcwJEShzkI05hLhSOgyzawvU
   njKS7e/p0bx8VwuD7mfnMADFZ0fOpPVBlVMah47E2XHY477+wNGlKjmk2
   kD0N15uL05gsUNCsedaJf6qihuEhHnFvnBlKHJkhYmS6mRnyClQl+cJ7N
   nXGnItB1ECqxAjtS+SO2KPDVOywLqnBEL3da8rrSwygnQV6ydRxEI/9gS
   A==;
X-CSE-ConnectionGUID: RFsr3NITQNOgnI2oI2ZMUg==
X-CSE-MsgGUID: th60vDI6RH2p413nRipCJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85499993"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="85499993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 20:25:20 -0800
X-CSE-ConnectionGUID: 6WywEi8iRlSCT6dkC/PIVA==
X-CSE-MsgGUID: bge6xqVlSGi0QuDhw8x2sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="202937086"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 18 Dec 2025 20:25:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWS3I-000000004AG-3TJv
	for oe-kbuild@lists.linux.dev;
	Fri, 19 Dec 2025 04:25:16 +0000
Date: Fri, 19 Dec 2025 05:24:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 18/30] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202512190555.fd17MjVF-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   6344ae601ecfa683846b25bee5507273c6d88127
commit: 38cbd164e4698978c559700c1c2f67057792a891 [18/30] xfs: convey metadata health events to the health monitor
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251219/202512190555.fd17MjVF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#426: FILE: fs/xfs/xfs_healthmon.c:227:
+			if (existing->group == new->group){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

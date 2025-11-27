Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7493A43AA4
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 01:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764207155; cv=none; b=BTcb1RIucgr4mQbFWQU6jCq0cjqoK63GX40Asx08lveQr9cIgZDqL5dDQUaL1QpD0JGwBc7PKZcDbGLy5McjAYxmQfKP2RG4JVbYx5lCW3R65NPkN6FDQ00Fo8uDvRym4T8dtemMeCexOo/9fpgGYE4N3Ywl7MQ1714DFg7D2yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764207155; c=relaxed/simple;
	bh=JPLNt5C5+h8AWv2EIhDW1w6WB7ZCOwSGdQZ8U2kkDuU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z03nbuhS9I3U3H/S7yF89t8SiCXY5whzf6/G3omhr5vez1CyYGtEUWQpym2wdka+y+Q8jDCahfCsr18mBGjjMzbEIs2gImrJPFvEZihZC//Jslo9uLOTj/XZ7s7lOlTmr8yhHuOg7MlKHGpzBPz8D+6OnVMHkda3YwXjIGTFkJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Leee2JfZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Leee2JfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764207153; x=1795743153;
  h=date:from:to:subject:message-id:mime-version;
  bh=JPLNt5C5+h8AWv2EIhDW1w6WB7ZCOwSGdQZ8U2kkDuU=;
  b=Leee2JfZ69bm9c+8w2hAvELFv7ktuu0JD85NJFvxpg1BXRkUibXidlPB
   Ucty63PKRFlLkNVixWdpbkCEwq3rdecGX+7U6AIIjRbIre/npQQ8Bl4fz
   c6PEBkBt8iRLW9hZJvXfR0mexouP7P1MpDipk13oroc5b09hRi+E/c0X4
   Iox5/zZ94cW1+xEQWVgceaOUj5euJzmVkvP59aUstDo7rkFrZ2qkfIQAt
   sfWs5+ftrYw6d3/iARIXOVNn6X7QNX72MecBCsv1HmWdnsDfPGJKrV+Wb
   6FW+XBdlW1Brp2gEdPH7giqKQEXjr4TEyKhIEmi9ZQjyrTwgIkgJFxw37
   w==;
X-CSE-ConnectionGUID: k8TzI3EFSaiFDyj3SmPqTA==
X-CSE-MsgGUID: b7Zyt9d/T0Co9eHZB0bgLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66139003"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66139003"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 17:32:33 -0800
X-CSE-ConnectionGUID: xHbMR4erSI6VcPyYvi3L0A==
X-CSE-MsgGUID: o9OOO5BJTsaJW89mrDMuXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="216449250"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 17:32:32 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOQs2-000000001ZX-0uKE
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 01:32:30 +0000
Date: Thu, 27 Nov 2025 02:32:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 57/75] checkpatch: ERROR:SPACING: space required
 before the open parenthesis '('
Message-ID: <202511270250.ODuVY6IL-lkp@intel.com>
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
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   d6deccd7892291215036a5d70a688a2ccf230b15
commit: a0db09ebee23d25b5fb9af1df259acceca0925ef [57/75] NFSD: Use xdrgen XDR functions for NFSv3 GETATTR procedure
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270250.ODuVY6IL-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#101: FILE: fs/nfsd/nfs3proc.c:108:
+	switch(fsid_source(fhp)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

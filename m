Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902336C0AA
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 06:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768370948; cv=none; b=a5XPdUd74/PBChrSVVCnRwYXZX1/rHjTbsA2ohTaShRPH2GuEdSHF6uDD+0OKZJgS30Tu6NUM9/qgPbFTUDoTUoIQZKUaHbpOOv87eKK+SLI1d1NhGGQn/EP0y+msCljw43mNP2gjuEQPyHU/83u8fRONKmrBgjPFOqBsMdqL/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768370948; c=relaxed/simple;
	bh=3w91OCMtwzlk9fvQrp+x0ekUvqWjwqIOxOQfJcDFNM0=;
	h=Date:From:To:Subject:Message-ID; b=JMvELEH74p9UkC2TLOQnQeNuQuYztUvWHdNqpkpbykzejKrX1smKTHp01occEHAGgdZJZ4TYIf6EHQjKirGwkmnLOH3L0NmeJ1oc2flK11R/cbQnrMk3i4y9w9obVnz/F7gNJwU6jBB2U5hSGtK5YfnovrD0mLioVf9aGZtQgIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lbz+u4Zd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lbz+u4Zd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768370940; x=1799906940;
  h=date:from:to:subject:message-id;
  bh=3w91OCMtwzlk9fvQrp+x0ekUvqWjwqIOxOQfJcDFNM0=;
  b=Lbz+u4ZdLa6cuzUd0ieJWjOtLVtEVifrrRoM+9lRWumpE7+6MxGF9Xxz
   J4a6GUyvY9t3a3iWY5vHOTDjtfEVLmrzpOng+9PO0XnJKpB57jJA+bo9/
   NqOtnvKjwuy3VBUmkTKyi8fNrEukdkuC7Em4fx1FrNOluSizqZ9KkJeOd
   P1wJcIWMGyfDEARiXAVM7Rx0hFV5AOLo/b/DGnKuR36PAdlAPw5hwBzi2
   WQCgzKP8e2xgnl4bHya3njVhofy+ZqpPS4jXG4k8RELvUGbZ1802dZxrm
   xv+CTh+joqXHKRcIAT5TP2YzuRSDM+/IwgeUEZXTnOSqaBIKPxoep0v0e
   A==;
X-CSE-ConnectionGUID: hdIy1E5TQwevsE5fpdeRjA==
X-CSE-MsgGUID: vMCejQdVRIOZB2BrRN2+Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69573699"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69573699"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 22:08:55 -0800
X-CSE-ConnectionGUID: +oRCt1ZUTEK/rnNIfV1SsA==
X-CSE-MsgGUID: /AJz3nZ/ScGpiAcGeUuzZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209050400"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jan 2026 22:08:54 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfu3o-000000001LN-1tme
	for oe-kbuild@lists.linux.dev;
	Wed, 14 Jan 2026 06:08:52 +0000
Date: Wed, 14 Jan 2026 07:08:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-cache 12/88] checkpatch:
 ERROR:SPACING: space required before the open brace '{'
Message-ID: <202601140721.hNqUqSHt-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   dd2bb72987cc4bb1a2d9107440c8b7afa8527d10
commit: 5dde4539c41f3df0efc75d081421feddcd9e2ded [12/88] xfs: convey metadata health events to the health monitor
:::::: branch date: 46 minutes ago
:::::: commit date: 47 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260114/202601140721.hNqUqSHt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#427: FILE: fs/xfs/xfs_healthmon.c:188:
+			if (existing->group == new->group){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FE425F96D
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765535113; cv=none; b=QKY1LjRcrkrVIABxS5xn3c/SjRXDcVZiY32zhWi3Nt1dnv+ETj+/VfL9fvt1wZvSoAYURwFJ4wdLmh6Mk4ZygzFOtBFhZnMWWzSCqTu9am442AmZp9ASKTcu3k5+MiM+sNeLP4oym53NCy7PmrreHnl9RWDpgINKi5VduLWc1yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765535113; c=relaxed/simple;
	bh=AMbu+BqaoaC1rLBFsulVRmPFF9uYrbUnZcSnmcmX33k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PrHpTZeeFBss0x2jTabF6VBHR2itDvxKqBXB+f78kbcudRQvST6LgWHEySRseOvQ3qQ5xiQuCjsnoVOeoKNx4f4aCGky7f/bzo1zp4OvpWGnqohF7UybkGgNl3BJt4jiYpuDDeaESYAeQtYIdqFeuk5CrG8wiu8qxVZ5PGo4rz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hU7Z5XIU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hU7Z5XIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765535112; x=1797071112;
  h=date:from:to:subject:message-id:mime-version;
  bh=AMbu+BqaoaC1rLBFsulVRmPFF9uYrbUnZcSnmcmX33k=;
  b=hU7Z5XIUtuZr3xyclWuz4rdPsZQ0o3WmgnhPuWfRe3tNyRVvWKoWLXvZ
   U2A+6Tl/TlJTchZ7IbDSpZ0/e8dOm7tgSwfN0UK8EuLmVTkPj7QUln8dv
   Eqo861BY/5T8IeyQ4CSKUOtqM5B0yQJDhan+1a/3jPCNwY3GAKCA9Q7r+
   q1UFl2oP01V8VSBAMd5z6VADCL47+r50zu3jvSuxxn8x3x+XYr3P9JZpq
   9Lo3mrQVV1HBEOWc2g5VQ0tTQVxLBpXGuJ0xEdu2XN6c4lymgVbO87drV
   62IpekgakF65Q2LwLelmD2MyKi/Y+cGRdy/8Ea0ep0N9JZ/64be0k8/Ny
   w==;
X-CSE-ConnectionGUID: x9sQFaLiQU23QQdhd6O0uA==
X-CSE-MsgGUID: MBsyKx0qSvKeu72B7sigAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67564653"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67564653"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:25:11 -0800
X-CSE-ConnectionGUID: HUc2xqKwRBixjvQT3qY7Lg==
X-CSE-MsgGUID: a1AdVvqKQ9S4v6TaBoI22w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197530957"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 02:25:10 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU0Ki-000000001ee-2pb4
	for oe-kbuild@lists.linux.dev;
	Fri, 12 Dec 2025 10:25:08 +0000
Date: Fri, 12 Dec 2025 11:24:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Johannes-Thumshirn/btrfs-zoned-move-zoned-stats-to-mountstats/20251212-151521
 1/4] checkpatch: WARNING:SPACING: space prohibited before semicolon
Message-ID: <202512121104.Ypl720Mg-lkp@intel.com>
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
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/btrfs-zoned-move-zoned-stats-to-mountstats/20251212-151521
head:   087cbdd93270b495b68e468d4909e366fc071cea
commit: 1556083b547eaa72ebd7a472f511ed2686875851 [1/4] btrfs: zoned: move zoned stats to mountstats
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251212/202512121104.Ypl720Mg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited before semicolon
#31: FILE: fs/btrfs/super.c:2493:
+		return 0 ;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

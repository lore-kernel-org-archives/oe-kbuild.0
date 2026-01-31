Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC0A2877DE
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769853018; cv=none; b=Y724qwTLy/FgFwMLwlTiWFtdo1E1/l67434uOizqXxH6/p9lA1ZIW8rL2DgBCClGx0YZE5HMAEnnau6qPHyfGmWJnVhj6yk6Fzp9PgR/A7crHG5vCEy7kXK4oA+3T9G1TaPbDzAeIkpnBnNIxsyJEIaXltjmXnO7tfOp+mUTh4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769853018; c=relaxed/simple;
	bh=kx6kriyAGBGwxNIzQhp7bcS0CdYM7mfzUOd+mbM9RpY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FA8x9g3AmeaBF/08s5DzgVxkJCcKWiSmo4Ht6eynTUFPdO172uY11MWy3z0sgPSMS4UI2x/b1yQ0gK9pOVqySg4Q1hvI5PwrNrNGm3PB33DuxZUnab7UwO1qx/6e7gwT/9AWeOwc3hHYG4D0mD+scHqF9SPw6YbVho5RbdIzIOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffhxaALj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffhxaALj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769853015; x=1801389015;
  h=date:from:to:subject:message-id:mime-version;
  bh=kx6kriyAGBGwxNIzQhp7bcS0CdYM7mfzUOd+mbM9RpY=;
  b=ffhxaALjBFHd0KFaNSc3xUAo59KHkqRx69uedS983tNjoOddB8cRDNB5
   QMK5FdMoSyQOcDcZ3uk/xow3/l+vm+waU/qO2LCiu4j/tQ9lgSmbhDwqv
   l7RMu2lRl7KN6Y2mUJNGb1/GVY4V/8ZTpy6Htcwbxg3GRYvu3Wu85d3gm
   gT69tP6b61n0pSmSw12OVmHo9RM+7FMGkhtQliRhx60V5eHFMUk1oNdRY
   OIdM5f8f4nNUVZKQGEOYkRDmUfEapfPNZZpPom2ny9EuUTjyYgg0hyVLy
   +0ZIK8lj3BD++tVDP8f9GsoOIz/Zo46aNVEcWLIcM4sxeDfwUoqxsMTE6
   g==;
X-CSE-ConnectionGUID: wERlU+SfQNGfTdBXeY3PZw==
X-CSE-MsgGUID: P5pN71abSbmfptJ/XkmaFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73693547"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="73693547"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 01:50:14 -0800
X-CSE-ConnectionGUID: j2ObDsNeT8i3jHqFwJu0KA==
X-CSE-MsgGUID: CjXZsn6yRAeGJqJPfuPV0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209415580"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jan 2026 01:50:14 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm7cK-000000002gL-1uCJ
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 09:50:12 +0000
Date: Sat, 31 Jan 2026 10:50:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 23/30] maple_tree: Add test for rebalance calculation
 off-by-one
Message-ID: <202601311039.9QA5oD1Z-lkp@intel.com>
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
In-Reply-To: <20260130205935.2559335-24-Liam.Howlett@oracle.com>
References: <20260130205935.2559335-24-Liam.Howlett@oracle.com>
TO: "Liam R. Howlett" <Liam.Howlett@oracle.com>
TO: Andrew Morton <akpm@linux-foundation.org>

Hi Liam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260130]
[cannot apply to akpm-mm/mm-nonmm-unstable akpm-mm/mm-everything soc/for-next linus/master v6.19-rc7 v6.19-rc6 v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liam-R-Howlett/maple_tree-Fix-mas_dup_alloc-sparse-warning/20260131-050554
base:   next-20260130
patch link:    https://lore.kernel.org/r/20260130205935.2559335-24-Liam.Howlett%40oracle.com
patch subject: [PATCH v3 23/30] maple_tree: Add test for rebalance calculation off-by-one
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601311039.9QA5oD1Z-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#74: FILE: tools/testing/radix-tree/maple.c:35942:
+	enode = (void*) mas.node;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

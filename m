Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256E532470B
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069240; cv=none; b=ZlP5j9BBUPWYHlyMYuXKYDyWXfaNgDEwsEzB/OMAe6bbA3KxO7VvdhTYA73+dH4RfvdcvUww1BeqXPy7kq1pt5BUG4lRlw7wELf8m+9qGXWIxXPMZ9KclOlKl7u7mXUWWdT8RhPT999v7j+nOLAE4Ak+ViNgj+XFHVDbEHFH0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069240; c=relaxed/simple;
	bh=DUeAS/XsqKO1H6AmMTpItRyLgmp49lZ9DQ+cRppPVhc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrdg0H1mF4uvQR4ad+ipQN7Q74yTjvOoidTFVSXyP9Vo2fBiEt+WBhqL3uVp1Mr4GI6TP93ah6Jl1JiUytn1AbSBiC21CmZF02KBD2I7kL8mAmfXF2QmM3hUEAofbTmP1dUXyWMcwDNltxq8vSloYQ+DXQ60eWi4QIn+p3gSU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtZqhBBN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtZqhBBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069239; x=1794605239;
  h=date:from:to:subject:message-id:mime-version;
  bh=DUeAS/XsqKO1H6AmMTpItRyLgmp49lZ9DQ+cRppPVhc=;
  b=mtZqhBBNeHY3qh0pJC3TQkhwlLotZsOAzj1eDYSSr+5sog3UBQdmPTph
   JNCN6siOAK9b9uyHJ+/O0Kdl8W8hCdCAPoUzERDrXjfzSGqR7q+fbYx1/
   /0vvOBaS3JINSU8pkQgpKFJ/x1sCzhHdsMVfcOWp9lCnQsL1hrlysxL0H
   hyvJI37DJ7dOiDjUFrxI/dv7kGrs0WGceGkDrcVHMT2UMbIPMj642VWiw
   l1eFP7SaWrzYofn4/z9KCFurfg/lXqNPpp9XPmDp7slkKf3Cjs7wuTDMT
   0IaXx/QtFlLLB3BLO8cDeiQbJEIr85IIQmiEO4fSgN4algj8oSxUk2sJQ
   Q==;
X-CSE-ConnectionGUID: QxL4eW3LRF2L7B8wFSIH4A==
X-CSE-MsgGUID: GhGboA9TSF+PVAHIQF+z4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637454"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637454"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:27:17 -0800
X-CSE-ConnectionGUID: +ZV++L3rQMOgYSKKpGt+2g==
X-CSE-MsgGUID: +Av7Sr1PREWLhIpMS2Z7dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189244189"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2025 13:27:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeqY-0000000019P-0kBx
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:27:14 +0000
Date: Thu, 13 Nov 2025 22:26:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 489/867] checkpatch:
 WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements
 (8, 15)
Message-ID: <202511131947.lB5N4dtG-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: b0d675b2a2498b67a10f17a11fff3490b7708376 [489/867] bcachefs: DEFINE_CLASS(btree_iter_uninit)
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131947.lB5N4dtG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131947.lB5N4dtG-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#2038: FILE: fs/bcachefs/vfs/fs.c:125:
+	if (set)
+	       try(set(trans, inode, &inode_u, p));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

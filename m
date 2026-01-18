Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427722DCBFD
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732190; cv=none; b=feyAqTpojgndxwiL4xKbkUrvFvIBu2ehGTlwa3p/DZFI2xdINOQ+NceKq9UjuEFRXutn9oh2ceSFLFzy+OfpUJihKv6f2uFbxN/V26dlRKIA9Ml3lCJpAwI336vFlng9OWorpd7kOoCqpEaz6+X67H8u0SiQwhxObn19Rf23MFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732190; c=relaxed/simple;
	bh=kFgKFlH/mX0oEDbcecRKBHHAFwPa4Ek+JR50/MjtRhQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IuOhmW5yodZ4jawzpHRAJWmcC1EgP/uLlFp+CUvB9NixSSKjvmtr++sX+hG+LTuu/AanVTI4Zicis8/5T8GSf4r1acUpRVNi+F+R004f+L9o0PU9i0WcoM2LREmszi2ze6lmOfTF2is8RRu3gq8pVn+C9k/zGyqZh8caw+rE4XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1NO5D0X; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1NO5D0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768732186; x=1800268186;
  h=date:from:to:cc:subject:message-id;
  bh=kFgKFlH/mX0oEDbcecRKBHHAFwPa4Ek+JR50/MjtRhQ=;
  b=k1NO5D0XDRGw+QhxbQx8UZHqiPXFlgp77DZLIIz3top62YVLhNE1KmUM
   v9YmdytabVpr5d+NYHj6iEf1ZmQpvO+9iM9yK1eRXBxo5KzpnijXFcRp/
   U1W3lIx5w/HgzFP/H6SbpNu2o6N89ngNiGBvN8v5jW4PE3qNpUARmcu12
   PuIdraU7Ic9Bo9vJANald89MO2cFrmHOiDwUh6PBUvDgMkKRzA3t/k4W5
   5gWW/bvGR3ytzHeDjzqKuKsdpUtFNdqyUckx8wa/0+RNabwAGiQQNzE8j
   X68wDKNVHVBC4V6us3rdgK7Bd8ovVXHJgYRIYgeUrO0VMqWNOmyvNIzvV
   g==;
X-CSE-ConnectionGUID: UGLPIswgQjWAJGhudkaNtw==
X-CSE-MsgGUID: uUqQ5vlmRg2A9/somhNW1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="80609880"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="80609880"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 02:29:34 -0800
X-CSE-ConnectionGUID: rIy5ppUtRpiyxllc2q+cIw==
X-CSE-MsgGUID: e0c4IW7GTXSVeumlxjCrag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205656535"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jan 2026 02:29:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhQ2F-00000000Msi-09ax;
	Sun, 18 Jan 2026 10:29:31 +0000
Date: Sun, 18 Jan 2026 18:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tnguy-next-queue:dev-queue 29/78]
 drivers/net/ethernet/intel/ixd/ixd_main.c:7:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601181824.Hgj4YeFw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/intel/ixd/ixd_main.c:7:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Larysa Zaremba <larysa.zaremba@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Amritha Nambiar <amritha.nambiar@intel.com>
CC: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   e046e2303f4abefe4e0cfa49942c61ef23f4c183
commit: f45d55fd3ccaef02a03ce7a1e79eae010d317be9 [29/78] ixd: add basic driver framework for Intel(R) Control Plane Function
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r122-20260117 (https://download.01.org/0day-ci/archive/20260118/202601181824.Hgj4YeFw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181824.Hgj4YeFw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601181824.Hgj4YeFw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ixd/ixd_main.c:7:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/ixd/ixd_main.c:7:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/ixd/ixd_main.c:8:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/ixd/ixd_main.c:8:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/ixd/ixd_main.c:9:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/ixd/ixd_main.c:9:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/ixd/ixd_main.c:9:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/ixd/ixd_main.c:9:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +7 drivers/net/ethernet/intel/ixd/ixd_main.c

f45d55fd3ccaef Larysa Zaremba 2025-11-17   6  
f45d55fd3ccaef Larysa Zaremba 2025-11-17  @7  MODULE_DESCRIPTION("Intel(R) Control Plane Function Device Driver");
f45d55fd3ccaef Larysa Zaremba 2025-11-17   8  MODULE_IMPORT_NS("LIBIE_PCI");
f45d55fd3ccaef Larysa Zaremba 2025-11-17   9  MODULE_LICENSE("GPL");
f45d55fd3ccaef Larysa Zaremba 2025-11-17  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5E2D6E60
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 21:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764363603; cv=none; b=JIFgXPHo36MwbQ2DTY5Ocm5DSAplUW18ITwD5fnQLA2YhKZfIxpR8vwuXAmLHwNFxDV0+fSNDIvDwYTj6AkvVnJL5/31ZsI8sZa0abvoWTxb6rEoBuEqvA3HUDjbQtegn6vGSpudNllXbghsDICaXGKceMxfcpFd8Gfa2s3Maxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764363603; c=relaxed/simple;
	bh=GxWtTdVUNJAuor9CKWECT+clCxWvFF+nQ73Dmz4oGkA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+BwqVXzMwTA8OpUVQ6yK1AqbGp7Mnn+sJv2XFBu2Iaf3qf6/rk7f20ZqSqVMJgT8SuGoSnAPcoBz98pVd1TsM1UJgDhi6iL5pu79CHx/3RQPrHSgSwUg8N2MA0oxuDp/L1qzt07PIUPTv1Ze4NsypavhdPAAPlRap+IceTpog8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9RJRryr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9RJRryr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764363601; x=1795899601;
  h=date:from:to:subject:message-id:mime-version;
  bh=GxWtTdVUNJAuor9CKWECT+clCxWvFF+nQ73Dmz4oGkA=;
  b=d9RJRryr77uHh+uP40UlgwMBnT9tO+Xbh+fK4w1R5Uu46pgTwGSANWoJ
   6DQFRiwrKW7z3UmrjsU6Jnb4M24USHkYvKg2V3vIyUspSE2yxbtoNCcDG
   oqBCf5P25GknO7grOyJQYbNaZFDDSRfl5BoWzAeFkJeNBkJMZAPUE0oQa
   CE9IjRpPiiOnkpOeVOmDuYcnqSpRZvC8+1Rw1GVUi7ucbY8febSjKQUBO
   OgJ6u+74HJMX03GoZSICepONXOPBK7s3Lhl8yjZdlXTDjlL1rU+gSoEmu
   r4WzccetPcGjdl7xLTNfmxQ1u+T9z1C/WMBn07LVIDyfggMcM7wn68xeS
   Q==;
X-CSE-ConnectionGUID: HgaClMfkQ5SQoketf0AN4Q==
X-CSE-MsgGUID: txQFLUfgSnK1UOMhuWaAXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77079421"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="77079421"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 13:00:00 -0800
X-CSE-ConnectionGUID: JNyYEXSxTTy145Q2RRPohQ==
X-CSE-MsgGUID: YXWKLE1nRhqM6+FGdtohMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="198642119"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 28 Nov 2025 13:00:00 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP5ZN-0000000028l-2wCu
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 20:59:57 +0000
Date: Fri, 28 Nov 2025 21:59:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [chenhuacai-loongson:loongarch-next 8/21] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202511282138.MmhRv6iF-lkp@intel.com>
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
TO: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   f3e098dde874d0611efa9909dfe5027e350e6430
commit: 7f72f079483782111b395c241cadf15e70c2062f [8/21] LoongArch: Add atomic operations for 32BIT/64BIT
:::::: branch date: 11 hours ago
:::::: commit date: 14 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511282138.MmhRv6iF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#679: FILE: arch/loongarch/include/asm/local.h:61:
+static inline long local_add_return(long i, local_t * l)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#696: FILE: arch/loongarch/include/asm/local.h:78:
+static inline long local_sub_return(long i, local_t * l)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

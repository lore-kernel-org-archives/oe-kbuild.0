Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0007270EC1
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 22:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772924124; cv=none; b=tBrivHQ4hnyJA8HhPTDAJCUyo9W/CsKdWn909pvCLMhgb0P2ec1T4Is3JgCYgkEeElPseqA5GhZmnLkQdkfG90A8FqYYrepcjAwt5b9smv2zVj85S4AGdNKW4jioWmHH+RvFc1yY8JAaKUU/hcgwxAhSdCS9sY+mFK8f1bJOPew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772924124; c=relaxed/simple;
	bh=ZF12QghMp8Bz2GJmpEbC2xTtLR+rliAaiAay9/PVxho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mWkw7sazwnZby4PjrDs/dPHNWu4pkEiM6nlJEEhFwuqztplVuZwAED9WIVoxpg1+LmRK7QVDaCSTG1Eyipi7B1KboM3f+7Rn/9pjlwwO9mt/eaqhE6HmapMEtZB3janBcuZRzLvXspgdIDCVn64xg+iWW0mhoiR7lYhRTAFxDVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYaHAATe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYaHAATe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772924122; x=1804460122;
  h=date:from:to:cc:subject:message-id;
  bh=ZF12QghMp8Bz2GJmpEbC2xTtLR+rliAaiAay9/PVxho=;
  b=LYaHAATeCR0fWvchd6CCSLauZK6xAKE92iLbXhsStPN1/FydP+DdWeoo
   ooFpJ2H6xo1WvKhikxPaZ4yzm3i3YpPGvivWauKfAuvqEiDjaRgRWHnGZ
   IDs1N7nGbJ+wTBsFCuaAxuZOnxNBrL26NMYXqujKXmlee7/jIi1BE+O+N
   ClRPWCy1HPwDZw6ssrgGW2IY56hn0qFqzi1WSRsJNSg2rtiqXboGmLI3e
   NQGYMaDmnhVS/5rnYkJZF0ZyO/+CHzsDGOEWa+3kHH5HBu9k3s2i/WVQ0
   eTAZOF43FrWCZpQY/VXBQzha6IgcIH0xhIPwi+wLICtUDBqU6SRH97Gi0
   A==;
X-CSE-ConnectionGUID: YZbg+t1vSGOX4QSOsmAuIw==
X-CSE-MsgGUID: g3Bg1CAgQKKrxxCAsWk+2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77598414"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="77598414"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 14:55:22 -0800
X-CSE-ConnectionGUID: rgtcGZqST92+y8OL64lKlg==
X-CSE-MsgGUID: G4Cv35MWSfavy5/Llac+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="223480546"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2026 14:55:20 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz0YH-000000002hH-3fYA;
	Sat, 07 Mar 2026 22:55:17 +0000
Date: Sun, 08 Mar 2026 06:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 318/471] arch/x86/mm/tlb.c:1812
 tlbflush_write_file() warn: potential spectre issue 'buf' [w]
Message-ID: <202603080617.gi31eUO7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 1100bdcab02187b4f929700762d9b5b0fd76577d [318/471] x86/mm: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20260307 (https://download.01.org/0day-ci/archive/20260308/202603080617.gi31eUO7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603080617.gi31eUO7-lkp@intel.com/

smatch warnings:
arch/x86/mm/tlb.c:1812 tlbflush_write_file() warn: potential spectre issue 'buf' [w]

vim +/buf +1812 arch/x86/mm/tlb.c

2d040a1ce903ca Dave Hansen 2014-07-31  1800  
1100bdcab02187 Jens Axboe  2024-04-11  1801  static ssize_t tlbflush_write_file(struct kiocb *iocb, struct iov_iter *from)
2d040a1ce903ca Dave Hansen 2014-07-31  1802  {
1100bdcab02187 Jens Axboe  2024-04-11  1803  	size_t count = iov_iter_count(from);
2d040a1ce903ca Dave Hansen 2014-07-31  1804  	char buf[32];
2d040a1ce903ca Dave Hansen 2014-07-31  1805  	ssize_t len;
2d040a1ce903ca Dave Hansen 2014-07-31  1806  	int ceiling;
2d040a1ce903ca Dave Hansen 2014-07-31  1807  
2d040a1ce903ca Dave Hansen 2014-07-31  1808  	len = min(count, sizeof(buf) - 1);
1100bdcab02187 Jens Axboe  2024-04-11  1809  	if (!copy_from_iter_full(buf, len, from))
2d040a1ce903ca Dave Hansen 2014-07-31  1810  		return -EFAULT;
2d040a1ce903ca Dave Hansen 2014-07-31  1811  
2d040a1ce903ca Dave Hansen 2014-07-31 @1812  	buf[len] = '\0';
2d040a1ce903ca Dave Hansen 2014-07-31  1813  	if (kstrtoint(buf, 0, &ceiling))
2d040a1ce903ca Dave Hansen 2014-07-31  1814  		return -EINVAL;
2d040a1ce903ca Dave Hansen 2014-07-31  1815  
2d040a1ce903ca Dave Hansen 2014-07-31  1816  	if (ceiling < 0)
2d040a1ce903ca Dave Hansen 2014-07-31  1817  		return -EINVAL;
2d040a1ce903ca Dave Hansen 2014-07-31  1818  
2d040a1ce903ca Dave Hansen 2014-07-31  1819  	tlb_single_page_flush_ceiling = ceiling;
2d040a1ce903ca Dave Hansen 2014-07-31  1820  	return count;
2d040a1ce903ca Dave Hansen 2014-07-31  1821  }
2d040a1ce903ca Dave Hansen 2014-07-31  1822  

:::::: The code at line 1812 was first introduced by commit
:::::: 2d040a1ce903ca5d6e7c983621fb29c6883c4c48 x86/mm: New tunable for single vs full TLB flush

:::::: TO: Dave Hansen <dave.hansen@linux.intel.com>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

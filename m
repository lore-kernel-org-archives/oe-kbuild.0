Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF087081F
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Apr 2025 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745738244; cv=none; b=PxZKGB8QEUpwUdbgAGAiZEdrilgL6A8qZk+f56UmefHe86GIstwGUUrTLC9MSoDNCqfYaXCh5jz1OxJlBtDozbepqjDYakI1WjSHsb/jlibQu8Bq8lboaF7+j+s4oweq9euDry8DUOYJ0OPo6am6na00+3NeIRJ9m2ZcUkKLzaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745738244; c=relaxed/simple;
	bh=NhWdGGqUrZlq7fpXLVLQvIn9bGaV9vxh2qlkO+pnjg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gEKCVnlFzoFIXz8Cm93VMWmcati3AIB732JAouOg+Y5TXzM506n6sLpd4Ef+fQjy/i1pSVhk2ABT0hvWaezNTpmtHcZS8a9/D3SYYLgBgRaiJX7MwxaIzKc3waHLKqj8v6iEkbpQYpmW9aCmmYMSfMvKt8FiCGQ9sitjCWHFpb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQ9VmgMD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQ9VmgMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745738243; x=1777274243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NhWdGGqUrZlq7fpXLVLQvIn9bGaV9vxh2qlkO+pnjg0=;
  b=mQ9VmgMDnH6BfiYAeV4prdQKBFcb0lKSTaMxZoeiOVHxwrI98IU+YAFZ
   8tXv9uPizZFkGKz66+FBLXN2xwp1h0PV3RrZg087oNjlozQvOrcMC+UB9
   ApEe0h/t/t4iDJ1FwRs0QlSo2+vgK/veIyN8Mk4Wrqk/E59s0gqEYgzgn
   3eO1Bzf1bhf+Zt5Tp4Yhe0F12L+jYxFFEoScMVeM3GMC+9/tdeHPco6xD
   ZGDKLEjKESzwTJSLj5gw84DxYqkCBhcj3zDkzgHNePSyG3GPvnSd8729F
   S7htUwse+s74mVqu4+pzR9SSJPtYTSSCC0XL9MNWdc5OuDAj08TdZG8Vk
   A==;
X-CSE-ConnectionGUID: tfHkgT/fRNS6X9DCDp3uqQ==
X-CSE-MsgGUID: zktWmEZGShOuMNZ43GaYCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47225526"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="47225526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 00:17:22 -0700
X-CSE-ConnectionGUID: 8Om9dEzIR/W/f1Y0xA+grw==
X-CSE-MsgGUID: eA7+gIwQQByckCBU1WpBqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="170460410"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Apr 2025 00:17:21 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8wGN-0006BJ-08;
	Sun, 27 Apr 2025 07:17:19 +0000
Date: Sun, 27 Apr 2025 15:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vma.o: warning: objtool: mm_take_all_locks+0x1f0: unreachable
 instruction
Message-ID: <202504271436.ElhTDOpI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>

Hi Lorenzo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 49b1b8d6f6831026cb105b0eafa18f13db612d86 mm: move internal core VMA manipulation functions to own file
date:   8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r111-20250427 (https://download.01.org/0day-ci/archive/20250427/202504271436.ElhTDOpI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250427/202504271436.ElhTDOpI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504271436.ElhTDOpI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vma.o: warning: objtool: mm_drop_all_locks+0x114: unreachable instruction
>> mm/vma.o: warning: objtool: mm_take_all_locks+0x1f0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

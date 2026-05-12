Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9557D26ED3A
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 05:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562503; cv=none; b=ptd4itaEe7Mv3cuZFFO7Y5QeswTAZxo778FC5Eha0ftP79qA5n6X8xHqgdM9af2Jx7ejfZKfNbpusiEo0bIFTVDG9TYGy74hYp/a3uoT8eVxj4UtpcwCMTO6mwG0ndoaxc9M56S2Ax8p4RC4DpPeznLJ9k7uY6LQYJ7AGzvuCbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562503; c=relaxed/simple;
	bh=lknYIKngd21w8BCUsBiU8wiulouwzSLDfOL7U3n3SHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S8F7+iq6UvjK75XxgytxVnFCVh+appGbAsiTiHGyBjMFdhKX2N7mRH8J8aBsT0RJHwrv1Wj+uK6C/e4CTN+INdAVY2X2AJeyw4X6MKEmq2xw9N1oG1GBBqFv5/tIiIIjIevciPNdbrRah23NylC1jCs4HftNPhw+wughSIqsOrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmC9gksl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmC9gksl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778562502; x=1810098502;
  h=date:from:to:cc:subject:message-id;
  bh=lknYIKngd21w8BCUsBiU8wiulouwzSLDfOL7U3n3SHQ=;
  b=jmC9gkslUKnxPBP2aUcjl6v58ly6DdexDYrGCr3SMfnm1WrX92ZrBPGu
   cowfmTVMdM/BAW7zrtV57goUa9KzxKgaNkBnkiIFmc5VpdHv0BIwdx4af
   O+6d26IWSjqYS20jimKjiNeNlV/Dwe7semW+06bNUpFiKI6y2YAM9QIzJ
   j4YCp1sIB5lD+umC4Tr9dw9ZwLvIw0J6PTzqH6BkJOTK8FireKjnHXgab
   kJe5D57RWqRdalPlkXWZDUaOM1s3VJ1juRDhDDZNnHEpFK3G+gasZWNVQ
   RuzRy5YQf4jm0h7MGZW5cb50eh1VYdTgWg5mRat7C/ENlU8WUj8ve1/HO
   g==;
X-CSE-ConnectionGUID: hSGHlcwGREOHtZrm65XKXw==
X-CSE-MsgGUID: myuZI2C6To6/mJemAnKokQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78493824"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="78493824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 22:08:21 -0700
X-CSE-ConnectionGUID: dUAq8UJuQhSTGK+m+S3qpQ==
X-CSE-MsgGUID: IXSMTWifTdaTwpZ25xgKzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="261149956"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 11 May 2026 22:08:20 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMfLu-000000008AP-1XIk;
	Tue, 12 May 2026 05:08:18 +0000
Date: Tue, 12 May 2026 07:07:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kvms390:sae 43/54] arch/arm64/include/asm/cache.h:8:10:
 fatal error: asm/cache-defs.h: No such file or directory
Message-ID: <202605120700.TLH0OsZt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-s390@vger.kernel.org
TO: Steffen Eiden <seiden@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git sae
head:   e952fb65773b1e5cd2e5ca409e712db5ef252bb1
commit: 760ecf38972ee9b56ad3ccf4e837471063bcc4bb [43/54] arm64: Extract cache definitions
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260512/202605120700.TLH0OsZt-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120700.TLH0OsZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605120700.TLH0OsZt-lkp@intel.com/

Note: the kvms390/sae HEAD e952fb65773b1e5cd2e5ca409e712db5ef252bb1 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from ../../../../arch/arm64/kernel/vdso/vgetrandom-chacha.S:4,
                    from vgetrandom-chacha.S:9:
>> arch/arm64/include/asm/cache.h:8:10: fatal error: asm/cache-defs.h: No such file or directory
       8 | #include <asm/cache-defs.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +8 arch/arm64/include/asm/cache.h

f1a0c4aa093797 Catalin Marinas 2012-03-05  7  
760ecf38972ee9 Steffen Eiden   2026-04-24 @8  #include <asm/cache-defs.h>
760ecf38972ee9 Steffen Eiden   2026-04-24  9  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

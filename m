Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C463D19D081
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Apr 2026 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775280654; cv=none; b=EfO/12MVCPif61pWei/QFNSzMAN1nmUjt+ZqYIK6R8zZcf5F3t9wZVm0H5Etfd92N0SwYODEIG/Q1768HGKHN/Gt+j3ms7GSY6T1Hqqc9eZ3y/UcgvaFX07wawIrtsvCwfI/z9g3qJJ9qS1Ux2A/J4jadQh/6WAS/PlFULH2nlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775280654; c=relaxed/simple;
	bh=97Ma+I7MwsdsmjSZjhLOAkrLDnCCDRS2/dzlTXQ47uQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bpH9TzNPhXtBEgLxsArZjUDBjf5DqqcZxIZQjlgd3uuyUvIte7Ujh6wHi71uc+6qUt8aKO0IexBIGN16B3AUFnWjc1N9m19Cyg6hadtw8VZI/oN5XCS7sZXgwf3GATY8qJZdtGzjFq1n9b+Tu8weeDrJJ1QOu2p+G+s4lAcfsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1fE2J1a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1fE2J1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775280651; x=1806816651;
  h=date:from:to:cc:subject:message-id;
  bh=97Ma+I7MwsdsmjSZjhLOAkrLDnCCDRS2/dzlTXQ47uQ=;
  b=d1fE2J1au9eJLQXRUUtybXQGpExcOIqT9Lds5vvmbamzcDNL8fhN8YYt
   Phn0qvTOJxMa3Y+ZxEjvZd9Kdpyk3F6/mWKRUQ//J/7Q4Asi2B740A0kQ
   Y3eVIpHxX8PR65wwMdIkgHP8W7G6zZ/mcDkNmafq6h0tzMyvMeL/G32wJ
   FNj0z7LwD6+Wf+h45cMs5CkTQlqnuHykadJa8lWlhS+49C+S4bxt8uCow
   +bpU9p6XWYDgguhKAdFZLUqU3r5YGl5ngHoc/PoqiG9f7I5DVmLaMSs3S
   bA4rGPfcbBKL2sLOyLZX7eYY5xP0K2DIbqrg39kdt5hCwjBdHYa4cBTnJ
   A==;
X-CSE-ConnectionGUID: seadlH5kQ7CnY+1VuCuBEg==
X-CSE-MsgGUID: wGKB8NjZTcqe000JvLJ/gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76348816"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="76348816"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 22:30:51 -0700
X-CSE-ConnectionGUID: zpJkJMhbSoyUTlhz+Apf1g==
X-CSE-MsgGUID: ZyzV6FEdR1OmaRFc8w9hxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="257888487"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Apr 2026 22:30:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8taq-000000009XV-1nUN;
	Sat, 04 Apr 2026 05:30:48 +0000
Date: Sat, 04 Apr 2026 07:30:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rgushchin:dylan/sframe-v3-with-v3 3/8]
 aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from
 `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'
Message-ID: <202604040753.7PjWmAWG-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git dylan/sframe-v3-with-v3
head:   d9360fb2f6860d7f37e29ddfd9a44fff555fd54c
commit: 897b6e722feabc4b8d53f0cc30277113c4397d1a [3/8] arm64: entry: add unwind info for various kernel entries
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260404/202604040753.7PjWmAWG-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040753.7PjWmAWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604040753.7PjWmAWG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'
>> aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'
>> aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

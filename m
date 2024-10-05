Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D223FD4
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 02:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728094554; cv=none; b=nMm3kFX4Ha5y9o4WNHizBK6m1lOrZhR1Iq/V7rC5XwyB2OAF9adFMaR5zUA2+vlLPv8xPSUXpKoenRBkXs3b3c0c78AABxFu+LTehrS7cRIa23B0EQPjZLBNJbUTBfBtQTaeBUcRyl/F9XMqr+GG3+k34N3zfXlxb2LCLt4Gups=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728094554; c=relaxed/simple;
	bh=B+9xxwA9sHpzEx6IFl9X+lTGEtSP5sAvFFp82QnmU8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5C8oGpFif4C19YGhCUTRrpDIRJ6x/m9geMSsTmTBIEODYugZN8ZL8i9Smjpmd3uYwqAtGHVf8EMnZ2ojv7R8RsbEo4RDDTN/FmoF8xWR8XQPRHCVcTjihXNYr/W46596rUaXXd5ql9BVEZ47v5CD0DWE0y1HhQ2h7In9rZUwe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQVsV4sw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQVsV4sw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728094552; x=1759630552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B+9xxwA9sHpzEx6IFl9X+lTGEtSP5sAvFFp82QnmU8M=;
  b=PQVsV4sw9Y5djAXPL1aEQ9mC58i0qQlea4RmvodkzAuwFWIVDhZhqgsF
   wrYj0k/3F1G1gsJCUJfIC/Wy6TJpdNBh/rgxTvp0Jr0ONFPXjgVmRa5Mn
   EL7x0dzqKQ2WMN44Wh7HuxQGl+3tHBQ+aBmFg7UIbH1XBmvuedaelhSQM
   lsLa0zGCL23jw9vVIL0rK3Nrq57zsWS3zzlqVrnznTL1Ukehd5NQjXec/
   xtirVrSb4F8RqSUPf7trNG8PouoZ+mXsrLPwoiubfy7gY5NJw2E3ELydn
   zS8qIwBRVxUWgZHXJl7rYgnvCHqwdkjFpVV5D12lrCViOkVjcgUdh35lP
   Q==;
X-CSE-ConnectionGUID: RYNiXRKAT9i3vrnHFwoVag==
X-CSE-MsgGUID: ABYVzVRuT0KtiIBzjWpfBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31210169"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="31210169"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 19:15:51 -0700
X-CSE-ConnectionGUID: HNMCh/WNSeWHN68nei9YZA==
X-CSE-MsgGUID: qQ++hye3TDi8Qr84GTKncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="75127999"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Oct 2024 19:15:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swuKh-0002Ro-2N;
	Sat, 05 Oct 2024 02:15:47 +0000
Date: Sat, 5 Oct 2024 10:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/rmap.o: warning: objtool: folio_add_new_anon_rmap+0xbc:
 unreachable instruction
Message-ID: <202410051057.WbO5tsI3-lkp@intel.com>
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
TO: Barry Song <v-songbaohua@oppo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac308609567d31fe44be80ab757a5ddf062362ef
commit: 4c1171f1d22484f2419b07ab688548350db521cb mm: remove folio_test_anon(folio)==false path in __folio_add_anon_rmap()
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241005/202410051057.WbO5tsI3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051057.WbO5tsI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410051057.WbO5tsI3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/rmap.o: warning: objtool: rmap_walk_file+0x7c: unreachable instruction
   mm/rmap.o: warning: objtool: rmap_walk_anon+0x7c: unreachable instruction
   mm/rmap.o: warning: objtool: folio_move_anon_rmap+0x58: unreachable instruction
   mm/rmap.o: warning: objtool: folio_add_anon_rmap_ptes+0x19c: unreachable instruction
>> mm/rmap.o: warning: objtool: folio_add_new_anon_rmap+0xbc: unreachable instruction
   mm/rmap.o: warning: objtool: try_to_migrate_one+0x130: unreachable instruction


objdump-func vmlinux.o folio_add_new_anon_rmap:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

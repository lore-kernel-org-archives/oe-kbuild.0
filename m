Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607072CA8
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728384484; cv=none; b=SpwVtG9Ewwq2FbX1hI5CPhQpMN0Ymm5L6YpxRBSRQqCaiw2S+KLo6mlFsH5Pzgx8jYOocySFtedqaxmRXOskirlTqwwu/PEiHu4H7MNUMgDntRhg4Q9qbbAFM1bQU1yhcx0HWDp5ODhaydex9S9gVqIIRwQ6v2+BU6K1BI267vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728384484; c=relaxed/simple;
	bh=ikN4LSyCzz4uhdNJDmhGeCqyWyf+teiNXho48gCfX8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CliaTZpiteOITLbp6NvHy6BvaFN1BnVkEKcJzGlDMukjlvaaVRVBY+EXgZjAQqqGw4Hp8wA6ynal7PyGdxn7WyjnC0yWXzUJHYtNDnzgTV26NkeGdbeDwG9atJu2Al7RgqH2IsypEtdpaUbT0z22B1FmNZvLTDFph2CeWAPDc6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5niQJsp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5niQJsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728384483; x=1759920483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ikN4LSyCzz4uhdNJDmhGeCqyWyf+teiNXho48gCfX8Q=;
  b=R5niQJspqALVMPmqmqBpwKYxyLDMSsLEzSQElldnmQ0q08O1xoZvVIGG
   rrPdGx1HHo+Jji9h3Hqg2APKTJTaOXnZme8Zo6qQPjiFe5hfiLSGyQFm1
   c8FMhZHAcKgvU9RYtCM4prSqPl7n9Me9V2X3gBRIBn5CJVXhGYx4xwlp/
   +s86ayX+WL0cMk/0xCabdZ3C0QaMypQLjosSgXJSbUAYB3aadKqZrWuGP
   ii6kpvnFjbBDeZ2M1LII7oFXM+KEc/9z+RrdYaKnVw2e2kfe3uyRSiHPK
   osc6mrqbk83ZtX7FNe/t7wDXuZlUoM3bd/22K9ns9iNgMyHJxrZa9cPIN
   Q==;
X-CSE-ConnectionGUID: 3d3eFYbsQ+acl3offmyDqA==
X-CSE-MsgGUID: c5+K7pJzQgKFFy6RZENyNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45034119"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45034119"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 03:47:51 -0700
X-CSE-ConnectionGUID: Vki88f+ERLyjNOdaBYbJ/Q==
X-CSE-MsgGUID: Q/6ASn4OS6Wiiu78k8LIhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76167452"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 03:47:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy7kq-0006Ga-1g;
	Tue, 08 Oct 2024 10:47:48 +0000
Date: Tue, 8 Oct 2024 18:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/pagewalk.o: warning: objtool: folio_walk_start+0x2fc: unreachable
 instruction
Message-ID: <202410081805.UzRZsTKx-lkp@intel.com>
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
TO: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   87d6aab2389e5ce0197d8257d5f8ee965a67c4cd
commit: aa39ca6940f1a0540f2984051b3089972f42959b mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
date:   5 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241008/202410081805.UzRZsTKx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081805.UzRZsTKx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410081805.UzRZsTKx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pagewalk.o: warning: objtool: folio_walk_start+0x2fc: unreachable instruction


objdump-func vmlinux.o folio_walk_start:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

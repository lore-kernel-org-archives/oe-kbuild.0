Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E811552952
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Sep 2026 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088609; cv=none; b=BV4C6mPGwsKnX0rfG1ZNpKE0zsG2hzNZTd+g5Gg/qf8TVKUJ299cQBZdVPJErj0+hKDzSU7LZD5I84qcwDYIPLsPmCksLeqpj4DhykSh7/pXrV9oFSO6vd3Gg8Xl0Mj3BkXN9S3KswQ9dqYFrQI8I6w7daLR4ratUPFjW6d+sQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088609; c=relaxed/simple;
	bh=aFVuimWL5a/wnm0+Cz3Fskov/v6rgBkIGAWL5iOBcPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a97RHxiAGkDCLM7uq6rTjVLxwnz4M19WcKfjAbUk5ALEJOEC2Vd1rWuWGrCRAzvDaFuzcsamEs5gFKkn1MGcL9UenW3JnitCx+ah8o+IQQa9xy5OUMEKxLClkv+jQhIRYjLVXk7Fz0/3wjOkCycO5Z7BFZBhAn8SelKrfa/zqXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWSnst9K; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWSnst9K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790088607; x=1821624607;
  h=date:from:to:cc:subject:message-id;
  bh=aFVuimWL5a/wnm0+Cz3Fskov/v6rgBkIGAWL5iOBcPk=;
  b=SWSnst9KmlTgEUuCacgG6Dc7ARTzaIXWYpK9/0dXbV9u+Vc/qDNCMWbI
   i57IvOnUh6Wk9gJNpKh/1h+MUdpt1H2HhSNHYLQ3MXkpjbZbK/ArLgf9E
   bSG+ChxszrNJP5+VyzF8+j2fe4EJQeg/G8G6yOEQ2nqtuwe7+nlSBLhqu
   jJCM7PVJ2ci1BVKmHoBYoWDOH10qdQocpGzgtdBtQ6esUlYkH8H7q7JW5
   muvxoN2ECu5wcAnxJte2RchRgFstyKe/qP/GN5Y5MEUrkipUBe5wtGohU
   nQi/H2VGp8gJHk5Ptaenm20iiB+favfduOq+QsfjaSY098fyFbzVBMoPT
   g==;
X-CSE-ConnectionGUID: rNm9PNHaTjaecjVk1emQ5Q==
X-CSE-MsgGUID: cybYaOj6QaWP7hSzmazWYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1199088"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1199088"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 07:50:07 -0700
X-CSE-ConnectionGUID: 4fw3LZlSRR25wstuwvIrMQ==
X-CSE-MsgGUID: MBo5m55mTK+OLpjKE1Si5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="269677970"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Sep 2026 07:50:05 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x91oo-00000000Fc2-33YU;
	Tue, 22 Sep 2026 14:50:02 +0000
Date: Tue, 22 Sep 2026 22:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: {standard input}:16594: Error: branch out of range
Message-ID: <202609222242.hbGZaZNJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>

Hi Konstantin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 56cb9b7d96b28a1173a510ab25354b6599ad3a33 gcov: use atomic counter updates to fix concurrent access crashes
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260922/202609222242.hbGZaZNJ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609222242.hbGZaZNJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 56cb9b7d96b2 ("gcov: use atomic counter updates to fix concurrent access crashes")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609222242.hbGZaZNJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:16594: Error: branch out of range
   {standard input}:16723: Error: branch out of range
   {standard input}:17372: Error: branch out of range
   {standard input}:17501: Error: branch out of range
   {standard input}:20497: Error: branch out of range
   {standard input}:79071: Error: branch out of range
   {standard input}:79155: Error: branch out of range
   {standard input}:79243: Error: branch out of range
   {standard input}:79302: Error: branch out of range
   {standard input}:82180: Error: branch out of range

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E713D2BE
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728128710; cv=none; b=hkyTAq4gTu2jVUMWuPDLMWywGL69xTRgdMAk2KnorQrZ6nWL6dz9ZOsccYrp7Ev0B+kfpjz9Ip5weX2z77WOh6pdBrPkXf12fPiA0ihX8UebBWC1scJedgX9Df4vyAujUQlAUmmfjLjEMpI08yeZKSSY8h4j1NrtAcm62OkZMzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728128710; c=relaxed/simple;
	bh=WThLUyJLvC+P+Ylp91hfZPyfxWoGVNr6W/KqLXzxS9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LV5oshv86erYPK5kFz59HC+W1b+mFDVZxcNBTQ+AAOxnWpdJwsuahfT4jK7nSzIGBdXQz69Pa3GGRgDAv21TOmlKdXrjuyJ112v53hTWNha2NeXksJ1DWU2CjC9VdjNeWnC9z/qpbp9Kftc37RNqMmJCNcWtT13CYKrs8z5iO24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuO+DO76; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuO+DO76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728128708; x=1759664708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WThLUyJLvC+P+Ylp91hfZPyfxWoGVNr6W/KqLXzxS9c=;
  b=YuO+DO76wUId2wgUudqkc8pDH7SDppjh/j5PlkJV+6j4FHouYIJUzblN
   ycqOIfHNrj8KKBfk2xJ9uvjEls+K0j7SNCq6QJGg8ahw6Lb8m0M874ZwK
   fsXNMUfVfYmIiBWaJqKysjWBLxTwOFEtnPpCl6ejfKWCd5RCCaSUps10h
   NnI0KZj8aHD5D6IFXUh3KoXJKbOuwdtrHOnBVPdwGv/X44erdJCDPTBSS
   dewsgRxX413tRnSJOgcdjScNc2T/ECdBwwhfjBUiggAMNkXMA8IPFEjTs
   A0opJy/rbIxbnYLuE7FLMV6b1/h9+4N7s6O82ht85vCCZt2ORxmrveg0c
   Q==;
X-CSE-ConnectionGUID: OU2131QdQ5u8xYA98wYe7w==
X-CSE-MsgGUID: 4SCRpFikR9i6qQUX3yvEvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27225743"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="27225743"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 04:45:08 -0700
X-CSE-ConnectionGUID: Am+JJwBNQSmLyZU77mANdA==
X-CSE-MsgGUID: Zjgvtj6qQbStc8pv+c6WYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="75297980"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Oct 2024 04:45:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx3Dd-0002uA-01;
	Sat, 05 Oct 2024 11:45:05 +0000
Date: Sat, 5 Oct 2024 19:44:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/dma-buf/udmabuf.o: warning: objtool:
 get_sg_table.isra.0+0x110: unreachable instruction
Message-ID: <202410051913.lpgUJWNn-lkp@intel.com>
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
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Vivek,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27cc6fdf720183dce1dbd293483ec5a9cb6b595e
commit: 0c8b91ef5100eaed3d64123ac91ac4739fccf15c udmabuf: add back support for mapping hugetlb pages
date:   3 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241005/202410051913.lpgUJWNn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051913.lpgUJWNn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410051913.lpgUJWNn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/udmabuf.o: warning: objtool: get_sg_table.isra.0+0x110: unreachable instruction


objdump-func vmlinux.o get_sg_table.isra.0:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

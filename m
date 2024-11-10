Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627B44778E
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 16:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731257665; cv=none; b=J1wB7GHRZbO4XBJOGIB2DaX5sy4piLV6Dw21jnTlNtXsJWJ5Qr40dMdZhkOcX6/gB5vmvTaI7BOzleKnjxiF+RSYWhXKs6pjdPA0H7gZIvM8wvz7dMnH0iBxvmIAAIcf3al+40weq7RKHsYaNcvxS2xuicusi4F6PrH3amgmTek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731257665; c=relaxed/simple;
	bh=WVs0kU1mbPZGECtk7zQ8iW+fK1SPZTlcCDC6+LKNqkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lF6u1LkskhWhobvbsN5ubpgM/roJ8lPml6cgBRCMj023JjtHUqxAmELL8o5WIOpBQODpgVCn7u+C9nzoiWVkyQNWS0Berbj9gboxL5jItpozfaX/tb/ZyL7TtJA6tqcnrsek6uFDePZjJkphRtbB8V7+uIwl7ubSD1jKpegBf5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUJyr2Cy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUJyr2Cy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731257663; x=1762793663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVs0kU1mbPZGECtk7zQ8iW+fK1SPZTlcCDC6+LKNqkg=;
  b=OUJyr2Cy+Jjsu6ONld58DaTpuYy2e3E8Cj/ppJrjAM4yz6Au0Mw8a0d1
   a8M+8zod/1Mf1JMOJqs4QNg0uTohxb/jKaR/8aRfYF4eHhIdVYa6EslHq
   sYw/ojJkC1f0Pg3Gp6XmcMjvO5AYT+hC/jgcNfG7G6onuftdWzsTfIyEB
   hOu+//B15/MsAuN9jwxbDoHLfqgTqUp5KkprhhQrcAooQ1L4eJVcXGobD
   vF+AixjT4ZMop5tu4JmOeFZatOK7ebFhFqdLJF9eqQP7upg2KSkLe5oK2
   26F2qMlMj+8M3qAKxsEVE/4KK30im0Yn2nShtJIJ8H0Y75Hz0tWek1AN5
   w==;
X-CSE-ConnectionGUID: /5wF6wNcTn+/rALocSespQ==
X-CSE-MsgGUID: a+KNjI8pSC2Bw7uCTCFBxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="42473004"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="42473004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 08:54:23 -0800
X-CSE-ConnectionGUID: VrsWO+d/RmSVAGYihORFbQ==
X-CSE-MsgGUID: MRxeb8WkQuW+bWpe63YUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="91220615"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Nov 2024 08:54:22 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tABCd-0000Ff-1k;
	Sun, 10 Nov 2024 16:54:19 +0000
Date: Mon, 11 Nov 2024 00:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/md/md-bitmap.c:2892:31-48: opportunity for
 str_false_true(bitmap -> need_sync)
Message-ID: <202411110015.MDaB5V8P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yu Kuai <yukuai3@huawei.com>
CC: Song Liu <song@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de2f378f2b771b39594c04695feee86476743a69
commit: 59fdd43304f4cbb7ee8e281ca337afd803c309f6 md/md-bitmap: make in memory structure internal
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: csky-randconfig-r061-20241110 (https://download.01.org/0day-ci/archive/20241111/202411110015.MDaB5V8P-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411110015.MDaB5V8P-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/md-bitmap.c:2892:31-48: opportunity for str_false_true(bitmap -> need_sync)

vim +2892 drivers/md/md-bitmap.c

ece5cff0da9e69 drivers/md/bitmap.c    NeilBrown 2009-12-14  2883  
fd01b88c75a718 drivers/md/bitmap.c    NeilBrown 2011-10-11  2884  static ssize_t can_clear_show(struct mddev *mddev, char *page)
ece5cff0da9e69 drivers/md/bitmap.c    NeilBrown 2009-12-14  2885  {
ece5cff0da9e69 drivers/md/bitmap.c    NeilBrown 2009-12-14  2886  	int len;
59fdd43304f4cb drivers/md/md-bitmap.c Yu Kuai   2024-08-26  2887  	struct bitmap *bitmap;
59fdd43304f4cb drivers/md/md-bitmap.c Yu Kuai   2024-08-26  2888  
b7b17c9b67e598 drivers/md/bitmap.c    NeilBrown 2014-12-15  2889  	spin_lock(&mddev->lock);
59fdd43304f4cb drivers/md/md-bitmap.c Yu Kuai   2024-08-26  2890  	bitmap = mddev->bitmap;
59fdd43304f4cb drivers/md/md-bitmap.c Yu Kuai   2024-08-26  2891  	if (bitmap)
59fdd43304f4cb drivers/md/md-bitmap.c Yu Kuai   2024-08-26 @2892  		len = sprintf(page, "%s\n", (bitmap->need_sync ? "false" :
59fdd43304f4cb drivers/md/md-bitmap.c Yu Kuai   2024-08-26  2893  								 "true"));
ece5cff0da9e69 drivers/md/bitmap.c    NeilBrown 2009-12-14  2894  	else
ece5cff0da9e69 drivers/md/bitmap.c    NeilBrown 2009-12-14  2895  		len = sprintf(page, "\n");
b7b17c9b67e598 drivers/md/bitmap.c    NeilBrown 2014-12-15  2896  	spin_unlock(&mddev->lock);
ece5cff0da9e69 drivers/md/bitmap.c    NeilBrown 2009-12-14  2897  	return len;
ece5cff0da9e69 drivers/md/bitmap.c    NeilBrown 2009-12-14  2898  }
ece5cff0da9e69 drivers/md/bitmap.c    NeilBrown 2009-12-14  2899  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B741C69
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 04:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728274471; cv=none; b=NoF01za0F/ka1kRCFwXm0ztAzR9EC0lpq60RAB1j0kaY4jDNu1VD6RkG0KFl9cwf5Lq2eXXjSynBzka1CUGur5vyCdQDtBt7Ns92Xqs7/3TmpZyd2gucPTJPzBKQYz4E5tkysUk2FzFXjp8Z3LcmQY66+8JGW16vb+hDe4Xoo+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728274471; c=relaxed/simple;
	bh=GR3fTC3LtqEFR6BHIIsN1XnAFcRYXZwKprA/9VnIuhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HBxnSiciBWCyTz6zxC1zTr8FtsHM6AMw3gUtzMqJ3W1Wx3Plcpr7rxwudYH1FfwcvxMYNzclbBR6QyumF9ImeGjtQQ0YAtFVV5uFXvVHbQMW1RpkTHixcmxGHOUJT0DVOO07JZ4hQPEGYoD8FuRmV6Gdg1msaprstEB2qeP42cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naOo0leH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naOo0leH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728274469; x=1759810469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GR3fTC3LtqEFR6BHIIsN1XnAFcRYXZwKprA/9VnIuhw=;
  b=naOo0leHhFdjfffaAB9kgA278pDJhjnyaKMOTIpap2ivk/PIL0v4YHe0
   QCPjyT/xdfNYPoiJ+e87ovZzBxynl5rTdMgEVpFas23/38jkDCoSu+/Vh
   In37LAgleNNgddtfZHmnouShHa5v6xFCyIK/ln5UlgDHtv1TrT8B60aNe
   42UG31J+Prwf6iD3tZP2bAY/UO3B0qD3S+2aQhIk7CyqX9WADD5bAEzMP
   vduHvaR5VIlhOn7DJAt8avg4uoetOHz8b7gEyUq0T+UKF3wsmx8VQhr2A
   VhHrxa3UVQyyPYJXuMLx2+39hortMq/o0xUnE0JlW0tWgMK260pYqNFy/
   Q==;
X-CSE-ConnectionGUID: PRDx2G2+TZShFCJSBvPHXQ==
X-CSE-MsgGUID: lv8I2tr9S6OrOEiffT00qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="31295706"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="31295706"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 21:14:29 -0700
X-CSE-ConnectionGUID: SZtQXrGHQNeMkGYWg/wubg==
X-CSE-MsgGUID: IV9ErXWYTTarbihYwkGnWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="80127381"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Oct 2024 21:14:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxf8b-0004aA-0h;
	Mon, 07 Oct 2024 04:14:25 +0000
Date: Mon, 7 Oct 2024 12:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/md/md-bitmap.o: warning: objtool: __bitmap_create+0x5c:
 unreachable instruction
Message-ID: <202410071228.ozSfbmyC-lkp@intel.com>
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
TO: Yu Kuai <yukuai3@huawei.com>
CC: Song Liu <song@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
commit: 7545d385ec7e4c0d5e86e7cde4fe3fb8f4555fb9 md/md-bitmap: simplify md_bitmap_create() + md_bitmap_load()
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241007/202410071228.ozSfbmyC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410071228.ozSfbmyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410071228.ozSfbmyC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/md-bitmap.o: warning: objtool: __bitmap_create+0x5c: unreachable instruction


objdump-func vmlinux.o __bitmap_create:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

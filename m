Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555217;
	b=dhzRUR2uQjBx/JeYnYA7o+UqRaWHGjTef6OL5g2NsYd9O/0dlu/fjIs4yabDWemq0F5J
	 7arNcLtsGg8r/yxYe6Bqdtngpt3POOUskdU8kA2iMp1QVFO50jiNVVJRq6TxPt2cM4Mzu
	 9qSKNTPWd/Wb09qpeO4OishNMPAE29AOm7QIz39xinx2I0SymiFefMQ3RggYchljOL3cS
	 ergKlyvXhnKJX14Ao/Dtbneqy9jNEeDoKlqaXEp+JgBbItBzOmFHvY8YMOiDvkl/9N9fq
	 5tZH+1IA/yrVh7gv2gMQ1i2HyXwdjXsYbUQDdMZl2vLpPEnQYedkIKY3BkMO3QUGmvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555217;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wEetyPso/IBt60ZiaDUrli5eV7l0tSAcGo86fZPjkd0=;
	b=mO/Yyab2Ou1XdSAY5Rv/dlh8JBA7hbYPD7zDvA405RoRjqORtPOKKV7gT+H8sAhzlYQR
	 mWtB4dd7JIVrDmZ/gUR6JyrbJzMNIUSoaQMs6nd0BXHQ5rB1IZcUV9Hac22vVc3kzf5Bl
	 LUOF+ML4sDHKykK9Ztrn3273U53TMoGInPQXd2ZSC/1mznj+1tW+O4dterTiuQHYWpUK5
	 SSL65PkNI6ZNsfE8xVhIQSaDItcCDMu8GJmegMcd56LDfFNSOC6BhjcmSo2TPPb2mE6Fq
	 ZEIwQrR4R3vkHoUOqKfCvZA7PCA73cqXT9wgfeiiTmvoTmdoqvNbO501lUm1U3x844w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TD2FIh+Z;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344C2606A321
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 07:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 344C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TD2FIh+Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794555215; x=1826091215;
  h=date:from:to:cc:subject:message-id;
  bh=0rJCzwBQpD3gisbobdN0N8202QGcocEAbfNXF1HYI/I=;
  b=TD2FIh+Zgclw/CfmOG31MR2FPWQlOyjGw6ND/AzBrdr+krPxT0Si6+TI
   IrCNkfP26iRSui5vmaAdkor4YYgtrdjcrAXg+tmFQjB7TNAh5WFC3kHJI
   7AZRkOmukur8iBg+iSRFgrsyPQmWGdzEXmZzJ0Icg3aGN9YBkPe6yr/h1
   4+zW/3JkvfHsPVV5lTB0A4z/NDQ1CsxW7GQOcxwGv80b8iI2bzMWNeWRq
   iA/LXklFIeGDm5gp0aVbqVJnOBL6VoBtmijgivfrK3NqXbP+2axVpIODV
   MKKEx6zkRgpIU7dq3koh4/PrBJZNHB9O/KI2WQjfUMLJUX9dIF3aaKDo5
   g==;
X-CSE-ConnectionGUID: YQyYHtK3RV68HVZlHpy62g==
X-CSE-MsgGUID: 8WELOw4dSK6pnEF/ypqtjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3214786"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3214786"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 23:33:35 -0800
X-CSE-ConnectionGUID: 7B8Y8CPyT+WtjodmtNNhgw==
X-CSE-MsgGUID: ebZoiKSxT+WIoKOLA7BkQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8942305"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Nov 2026 23:33:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRlmu-000000001Ax-3ui1;
	Fri, 13 Nov 2026 07:33:32 +0000
Date: Fri, 13 Nov 2026 08:33:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android18-7.3 39/39]
 tools/testing/selftests/../../../include/linux/types.h:52:9: error: unknown
 type name '__kernel_uoff_t'
Message-ID: <202611130844.PdEDr8mn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   4dd306a07b2f456fd70ddaa28f4f65640374f202
commit: 3dfe54dcd10c7a840fce7136b972de65b277f006 [39/39] ANDROID: fuse-bpf: selftests: Add fuse_test and build the tests
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261113/202611130844.PdEDr8mn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130844.PdEDr8mn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611130844.PdEDr8mn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from test_bpf.c:4:
   In file included from ./test_fuse_bpf.h:17:
   In file included from tools/testing/selftests/../../../include/uapi/linux/bpf.h:11:
>> tools/testing/selftests/../../../include/linux/types.h:52:9: error: unknown type name '__kernel_uoff_t'
      52 | typedef __kernel_uoff_t         uoff_t;
         |         ^
   1 error generated.


vim +/__kernel_uoff_t +52 tools/testing/selftests/../../../include/linux/types.h

^1da177e4c3f415 Linus Torvalds          2005-04-16  49  
7437a51b30743ff Mike Frysinger          2008-02-08  50  #if defined(__GNUC__)
^1da177e4c3f415 Linus Torvalds          2005-04-16  51  typedef __kernel_loff_t		loff_t;
37d369fa97cc077 Matthew Wilcox (Oracle  2025-11-23 @52) typedef __kernel_uoff_t		uoff_t;
^1da177e4c3f415 Linus Torvalds          2005-04-16  53  #endif
^1da177e4c3f415 Linus Torvalds          2005-04-16  54  

:::::: The code at line 52 was first introduced by commit
:::::: 37d369fa97cc0774ea4eab726d16bcb5fbe3a104 fs: Add uoff_t

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

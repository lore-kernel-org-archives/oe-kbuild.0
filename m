Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB5C73451
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 00:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764375586; cv=none; b=cv2+EU5piCEbnVJTs2PDWO4XNLtoeGPFQ+1NsgVB9k1snYAYs5A0vQoLijp/IdFE85wWtECfYPWjUCe2S4cvsMCkeWANKv4V5RXtZcNloP8DTYEMLvVVQagrNz5xLm0/FvS04VknyA3SKX1hiirWPGNcDqxCdaDF3zqWlpTYHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764375586; c=relaxed/simple;
	bh=iJBe7QjCd3WlgD2Dt6BT1NJJwx8NI1iPnw3LQxgRBN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q8+pqRxol9OPdLGxE7+QeuFGMFEwwJeE7AZezbqxeQ05rtyUSK5rJYWbW1CxHdktDTIVpXdvUzmNBoPr1KgWoYCvs//xe9y6uTCZ+9yoH5lLD8Iw8RIVOnxNtLHVg2ANW/3uUfGxEw+EoO107U6cMozbQiLpccBG6SwsybbepSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7rIypJy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7rIypJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764375582; x=1795911582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJBe7QjCd3WlgD2Dt6BT1NJJwx8NI1iPnw3LQxgRBN4=;
  b=B7rIypJygkzIdqrEgQc6uZCyQnFL1P9xilui2XJJFqmE6+1RXNIZF3sh
   vQrX5s8SM3YkbzKjjKsOgGOcs3h+ogqdzjLVlUNI/n3e1D+TtcgUJBYBx
   m0xdRCy0VlSqIO2NZAVY1ZEXOYnHQxOFfRfvhKCUJvYBSN8UBkEEWjkNu
   10lHtsjF8EEMH02z3/rbNxa3EfQMLF7DBDR46kxj5h9abMKfJOEzfIpeX
   c8b2c7QDYZhAM3r3/Fn/eSoRmMwvwn9rp2kP5WbvoQExoGMywLXrY4Li9
   EPfy6lWD98krK+YpP3SnMpq7NZm0HqLbx2voCX3sDSv3MzRWOCNqoxRaH
   A==;
X-CSE-ConnectionGUID: QFYHGtDfRKiCzx6IyfvOyg==
X-CSE-MsgGUID: pWq/8aQdRfm7+O3P8V848A==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66472013"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66472013"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 16:19:42 -0800
X-CSE-ConnectionGUID: AjVfTm3TSYq/tb5pBdb9mA==
X-CSE-MsgGUID: xXxS7cpySgG+WZVmPnvkGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="198022456"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2025 16:19:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP8gd-000000006pt-10tH;
	Sat, 29 Nov 2025 00:19:39 +0000
Date: Sat, 29 Nov 2025 08:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/090-spi-hid 21/21]
 drivers/hid/hid-magicmouse.c:1288 magicmouse_setup_input_t2() error:
 uninitialized symbol 'min_x'.
Message-ID: <202511290730.8ecbKaK6-lkp@intel.com>
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
TO: Aditya Garg <gargaditya08@live.com>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   f47a12f7f0495ab40080f0d84a146c8a68419a0e
commit: f47a12f7f0495ab40080f0d84a146c8a68419a0e [21/21] HID: magicmouse: Add support for trackpads found on T2 Macs
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290730.8ecbKaK6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511290730.8ecbKaK6-lkp@intel.com/

smatch warnings:
drivers/hid/hid-magicmouse.c:1288 magicmouse_setup_input_t2() error: uninitialized symbol 'min_x'.
drivers/hid/hid-magicmouse.c:1288 magicmouse_setup_input_t2() error: uninitialized symbol 'min_y'.
drivers/hid/hid-magicmouse.c:1289 magicmouse_setup_input_t2() error: uninitialized symbol 'max_x'.
drivers/hid/hid-magicmouse.c:1289 magicmouse_setup_input_t2() error: uninitialized symbol 'max_y'.
drivers/hid/hid-magicmouse.c:1289 magicmouse_setup_input_t2() error: uninitialized symbol 'res_x'.
drivers/hid/hid-magicmouse.c:1289 magicmouse_setup_input_t2() error: uninitialized symbol 'res_y'.

vim +/min_x +1288 drivers/hid/hid-magicmouse.c

f47a12f7f0495a Aditya Garg   2025-03-11  1271  
f47a12f7f0495a Aditya Garg   2025-03-11  1272  static int magicmouse_setup_input_t2(struct input_dev *input,
f47a12f7f0495a Aditya Garg   2025-03-11  1273  				      struct hid_device *hdev)
f47a12f7f0495a Aditya Garg   2025-03-11  1274  {
f47a12f7f0495a Aditya Garg   2025-03-11  1275  	int min_x, min_y, max_x, max_y, res_x, res_y;
f47a12f7f0495a Aditya Garg   2025-03-11  1276  
f47a12f7f0495a Aditya Garg   2025-03-11  1277  	for (size_t i = 0; i < ARRAY_SIZE(magicmouse_t2_configs); i++) {
f47a12f7f0495a Aditya Garg   2025-03-11  1278  		if (magicmouse_t2_configs[i].id == hdev->product) {
f47a12f7f0495a Aditya Garg   2025-03-11  1279  			min_x = magicmouse_t2_configs[i].min_x;
f47a12f7f0495a Aditya Garg   2025-03-11  1280  			min_y = magicmouse_t2_configs[i].min_y;
f47a12f7f0495a Aditya Garg   2025-03-11  1281  			max_x = magicmouse_t2_configs[i].max_x;
f47a12f7f0495a Aditya Garg   2025-03-11  1282  			max_y = magicmouse_t2_configs[i].max_y;
f47a12f7f0495a Aditya Garg   2025-03-11  1283  			res_x = magicmouse_t2_configs[i].res_x;
f47a12f7f0495a Aditya Garg   2025-03-11  1284  			res_y = magicmouse_t2_configs[i].res_y;
f47a12f7f0495a Aditya Garg   2025-03-11  1285  		}
f47a12f7f0495a Aditya Garg   2025-03-11  1286  	}
f47a12f7f0495a Aditya Garg   2025-03-11  1287  
f47a12f7f0495a Aditya Garg   2025-03-11 @1288  	int ret = magicmouse_setup_input_int_tpd(input, hdev, min_x, min_y,
f47a12f7f0495a Aditya Garg   2025-03-11 @1289  						 max_x, max_y, res_x, res_y, false);
a041d225acbf25 Hector Martin 2023-04-30  1290  	if (ret)
a041d225acbf25 Hector Martin 2023-04-30  1291  		return ret;
a041d225acbf25 Hector Martin 2023-04-30  1292  
a041d225acbf25 Hector Martin 2023-04-30  1293  	return 0;
a041d225acbf25 Hector Martin 2023-04-30  1294  }
a041d225acbf25 Hector Martin 2023-04-30  1295  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

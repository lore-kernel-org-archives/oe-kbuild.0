Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F107291C10
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773863858; cv=none; b=fuSap+PVOzi2XsnwdDvTJjhDanJuaMCQiCabbIkNmYXuKDLBJ/hNeJSA4h31+DDnOByROGR/bsxc+BtyfeMKIYnACfKCkL0QvOjryib10skI7lWhips7AD18m8ORTEmi6QQYfjPTOSmUGMsoVFzlRXseuhI1hKQKqh9mwyHDiiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773863858; c=relaxed/simple;
	bh=JxTCaEdSJpItFKBG0UgBqx4vIVtmWnZDQ/S5UWOMKSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gKKPPRTo5p1bjzWmjxXluNluD52nTuPGmhNLB3GZbxj9F6ROdXjR4n/O/JRsEvEJ2/8y3ZeiaXeN6Ycv1c/1wKNH4+aYzRQP8xxJC/EdIqGrMx4N/C4apiRR1ITnx8g/XM4w5KCez0dF5xY6gq5VDSqGvfW7EBkTBHSHZHpyrvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Izi508Te; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Izi508Te"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773863857; x=1805399857;
  h=date:from:to:cc:subject:message-id;
  bh=JxTCaEdSJpItFKBG0UgBqx4vIVtmWnZDQ/S5UWOMKSA=;
  b=Izi508TenH+2NAqcKhtUjjFLYUsOcG4sUqj9oZAveNxXcQhY+PLvsNkm
   EL/gM8vYSkBmtcM3/tuqxIfuR/kke+V+Xc2tJebAjdrwt06OZm7h7hv1p
   Y1cGBoedb5HsUf74LUgGD72sanoAuLhHFSjMpYyaQ4Lq/KONTFn/D/YKS
   wFMOSwvRLczaj1nVdwmJYDfVwVcnMuDCzAJ79k+lyTGSmUuxkvuntefvh
   h5uP6idS5kKnQd3qz2AtWGqMvJxo91Xm+U8Ik5M1HmikmdPckay/aTRxI
   cVFXWqQUcHjnqxmPpCf84RUUay9xDhK6DrqOewFzCPW1H9br8uHp1Zh6c
   g==;
X-CSE-ConnectionGUID: 1JLAPxWqSoKk66wq+/dJYA==
X-CSE-MsgGUID: nguo+WtySKueowGjlAZePQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74112707"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="74112707"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 12:57:37 -0700
X-CSE-ConnectionGUID: JedwUW0NQlyjiVO6eZ+mYA==
X-CSE-MsgGUID: 3ajA/TUCRuutoWzkAR0l9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="219744840"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Mar 2026 12:57:36 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2x1J-000000003K1-1lww;
	Wed, 18 Mar 2026 19:57:33 +0000
Date: Thu, 19 Mar 2026 03:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 51/542] net/bluetooth/hci_debugfs.c:1160
 force_no_mitm_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603190326.RABrUyZD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   8714e89472ed6fb6cf9acdcc6ea34fe7154ac7af
commit: f9536ac76d8fadbd0acd3c580d94ee484f28caaa [51/542] Bluetooth: convert to read/write iterators
:::::: branch date: 2 hours ago
:::::: commit date: 18 hours ago
config: openrisc-randconfig-r071-20260318 (https://download.01.org/0day-ci/archive/20260319/202603190326.RABrUyZD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603190326.RABrUyZD-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_debugfs.c:1160 force_no_mitm_write() warn: potential spectre issue 'buf' [w]

vim +/buf +1160 net/bluetooth/hci_debugfs.c

c2aa30db744d9c Archie Pusaka      2020-04-07  1148  
f9536ac76d8fad Jens Axboe         2024-04-10  1149  static ssize_t force_no_mitm_write(struct kiocb *iocb, struct iov_iter *from)
c2aa30db744d9c Archie Pusaka      2020-04-07  1150  {
f9536ac76d8fad Jens Axboe         2024-04-10  1151  	struct hci_dev *hdev = iocb->ki_filp->private_data;
f9536ac76d8fad Jens Axboe         2024-04-10  1152  	size_t count = iov_iter_count(from);
c2aa30db744d9c Archie Pusaka      2020-04-07  1153  	char buf[32];
c2aa30db744d9c Archie Pusaka      2020-04-07  1154  	size_t buf_size = min(count, (sizeof(buf) - 1));
c2aa30db744d9c Archie Pusaka      2020-04-07  1155  	bool enable;
c2aa30db744d9c Archie Pusaka      2020-04-07  1156  
f9536ac76d8fad Jens Axboe         2024-04-10  1157  	if (!copy_from_iter_full(buf, buf_size, from))
c2aa30db744d9c Archie Pusaka      2020-04-07  1158  		return -EFAULT;
c2aa30db744d9c Archie Pusaka      2020-04-07  1159  
c2aa30db744d9c Archie Pusaka      2020-04-07 @1160  	buf[buf_size] = '\0';
82eae9dc438cd7 Christophe JAILLET 2023-07-11  1161  	if (kstrtobool(buf, &enable))
c2aa30db744d9c Archie Pusaka      2020-04-07  1162  		return -EINVAL;
c2aa30db744d9c Archie Pusaka      2020-04-07  1163  
c2aa30db744d9c Archie Pusaka      2020-04-07  1164  	if (enable == hci_dev_test_flag(hdev, HCI_FORCE_NO_MITM))
c2aa30db744d9c Archie Pusaka      2020-04-07  1165  		return -EALREADY;
c2aa30db744d9c Archie Pusaka      2020-04-07  1166  
c2aa30db744d9c Archie Pusaka      2020-04-07  1167  	hci_dev_change_flag(hdev, HCI_FORCE_NO_MITM);
c2aa30db744d9c Archie Pusaka      2020-04-07  1168  
c2aa30db744d9c Archie Pusaka      2020-04-07  1169  	return count;
c2aa30db744d9c Archie Pusaka      2020-04-07  1170  }
c2aa30db744d9c Archie Pusaka      2020-04-07  1171  

:::::: The code at line 1160 was first introduced by commit
:::::: c2aa30db744d9cbdde127d4ed8aeea18273834c6 Bluetooth: debugfs option to unset MITM flag

:::::: TO: Archie Pusaka <apusaka@chromium.org>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

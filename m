Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4F3126C06
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 01:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726970116; cv=none; b=qwt21il2WrLTlsyH7DC26Xg1aBAf2no2DOx9pB9cPgIkiyiOk75DkcyYhZekOUC08ksrXiWIrxfYNhbhA0/xp6gyLMOx5A/96iJrRT80zhM6KVyslfZxac6Z5mVGSnV7sn4kJ9dfSLVKfOwh9naLSyoqpSgoLomlp3BBon/vRsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726970116; c=relaxed/simple;
	bh=GEY2Zu0tSTFoCSTtEEOPcJXKuRuk607EYSlToNaIZwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d05wOXjJARg8sbCR9YArwEkUAuv1MUHXVH+aZPaeNsFj6DS7FNyYdGfFUhmw5VEjdf1YaodgiGy/tvlD1QXG0NihVHQcXLGEfym+F0UnW3p0rmQEEMudu1p8isX53sPp0zxNYPmI9/htk2TO12FTrZbIJFi9MAaAd5iuP0/Dk6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyeNhuyl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyeNhuyl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726970114; x=1758506114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GEY2Zu0tSTFoCSTtEEOPcJXKuRuk607EYSlToNaIZwQ=;
  b=HyeNhuylTaXwdkvzZFgcGidut90vUA1cmq3iM8GF1S7DJVdr1qEKcMRn
   94znVLiYsHg6OMr0lRT/zQCBGt4UPyBhwVVfhzLT7YCKXun2x8U7f4XBR
   hgR0ZajsGgBdPfN5Z+dqUx8G90f6aAhqpkyM8RtsBSiNNQx6uoRM9aXnT
   vpAc9qwYv9sG1OU6Xx9zay0JRWh+Xa0AyI/ZwOtoqisVa8b/m2/cng7aW
   sB0TZ7hDtpiRcM/hZpTqHpmBoSj+dRh2hIL0X4FrFgIiE47eGWwgbc535
   hs/fjScQQcUWYB+Gnxp+kGae6LIcR8roq2GyZ13UTQel0MRw00iwjxW/P
   g==;
X-CSE-ConnectionGUID: Gb35LQUeQeaGCWMF/5Eh7g==
X-CSE-MsgGUID: z6tuPJZMR1OYfWUnCGaEEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36527401"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="36527401"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 18:55:13 -0700
X-CSE-ConnectionGUID: ZyzwuBsuRHelBiRaSFHwBA==
X-CSE-MsgGUID: hp2COt5wQROb33kNggBE8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="71523414"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Sep 2024 18:55:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssBob-000FxK-2v;
	Sun, 22 Sep 2024 01:55:09 +0000
Date: Sun, 22 Sep 2024 09:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 51/448] net/bluetooth/hci_debugfs.c:1160
 force_no_mitm_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202409220951.hkeMOJax-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   4eb81ae46886ce90863b6f10c4fe8cd45c6719cf
commit: b9df54f5b396efa053acb500e457e8f1efae9427 [51/448] Bluetooth: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240922/202409220951.hkeMOJax-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409220951.hkeMOJax-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_debugfs.c:1160 force_no_mitm_write() warn: potential spectre issue 'buf' [w]

vim +/buf +1160 net/bluetooth/hci_debugfs.c

c2aa30db744d9c Archie Pusaka      2020-04-07  1148  
b9df54f5b396ef Jens Axboe         2024-04-10  1149  static ssize_t force_no_mitm_write(struct kiocb *iocb, struct iov_iter *from)
c2aa30db744d9c Archie Pusaka      2020-04-07  1150  {
b9df54f5b396ef Jens Axboe         2024-04-10  1151  	struct hci_dev *hdev = iocb->ki_filp->private_data;
b9df54f5b396ef Jens Axboe         2024-04-10  1152  	size_t count = iov_iter_count(from);
c2aa30db744d9c Archie Pusaka      2020-04-07  1153  	char buf[32];
c2aa30db744d9c Archie Pusaka      2020-04-07  1154  	size_t buf_size = min(count, (sizeof(buf) - 1));
c2aa30db744d9c Archie Pusaka      2020-04-07  1155  	bool enable;
c2aa30db744d9c Archie Pusaka      2020-04-07  1156  
b9df54f5b396ef Jens Axboe         2024-04-10  1157  	if (!copy_from_iter_full(buf, buf_size, from))
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

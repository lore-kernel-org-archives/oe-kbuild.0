Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC252110E
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 19:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772999100; cv=none; b=gPL7vfRFarnBoPfmhqCPN1IukunZuK3e6jn+Fhct6rIIabO2glyBZt8uiHUpmEDjHxy2h88TaoksBSxkyjZZnXEKy4M60UR3u9gg98FTEiP371GouJCkDBQrg4OYGxntF9Zn/gPw2TTTGVOQCzpAqXmBw3HgrXZeh9GC8TkUIb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772999100; c=relaxed/simple;
	bh=Go5H7SJHavC7lsj/MBUzDqXbjiE9iC9YQba8yoPabDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I7S71G2Gfr6fjEOq6+t2i0VOLA5bADBv+gvvuDM683cMaofxJF2GZvfOc8gWr7Ua4KIZKkbSkO53NMC/pef/sotim1mZD05Sx+rnXcaGY4e6OZzEpmxZgedwmcUoJ4ylkQ0zKqz3HtCXoTFzSbX9abIFGynZ32UMYdXdo8mecfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKPLNpXo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKPLNpXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772999098; x=1804535098;
  h=date:from:to:cc:subject:message-id;
  bh=Go5H7SJHavC7lsj/MBUzDqXbjiE9iC9YQba8yoPabDQ=;
  b=cKPLNpXoFxRWIK9Z8C8UItXrZv98ubxCbu0c3HqK4fyjCzyRLRMBrfEH
   0wSLf+dSFmIrCJu6OjR8QR+WUNmE9BL0bf01QLi0tIFxpZWJguCn64U+a
   t5kW9Y4RPosHUDqpoNH0yi9YZtBy8Jq4wsrqn6dFKJlfqhqIpmCGKJquK
   3kbp8IVWUVE+ts6JU7kzxRz0nGI7hFzWzhfwTiGIcian3l3xQXCrcA0ZK
   kxmP7PR4pHPsYPvfVZHTYf7F3ye7fHmg6/WyWhEobG5atu1Q/ONT5n5Ie
   cY9FMsY7xthzPyB6PIotmobdeVpvZRHsov2ekVUwpHtGFfoBgTM7EA2BL
   A==;
X-CSE-ConnectionGUID: czTXmjivQ+e1j99Z12hLlA==
X-CSE-MsgGUID: uA/Jcmp2SJWPbNUclMb2lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="91604956"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="91604956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 12:44:58 -0700
X-CSE-ConnectionGUID: VOQDb3VgS7uWjV/7bsVhYg==
X-CSE-MsgGUID: SW54znuRQtOF/GRWdrisLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219675459"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Mar 2026 12:44:56 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzK3a-000000003Ls-07M4;
	Sun, 08 Mar 2026 19:44:54 +0000
Date: Mon, 09 Mar 2026 03:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 134/471] drivers/gpu/drm/drm_debugfs.c:532
 connector_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603090315.sQKJjYjG-lkp@intel.com>
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
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 89c24f70314e152ada59b288a4cf3f0dbe7d9f46 [134/471] drm: convert debugfs helpers to be read/write iterator based
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260309/202603090315.sQKJjYjG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603090315.sQKJjYjG-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_debugfs.c:532 connector_write() warn: potential spectre issue 'buf' [w]
drivers/gpu/drm/drm_debugfs_crc.c:145 crc_control_write() warn: potential spectre issue 'source' [w]

Old smatch warnings:
drivers/gpu/drm/drm_debugfs.c:230 drm_debugfs_gpuva_info() warn: argument 6 to %016llx specifier is cast from pointer

vim +/buf +532 drivers/gpu/drm/drm_debugfs.c

30f6570798f6c8 Thomas Wood     2014-06-18  518  
89c24f70314e15 Jens Axboe      2024-04-09  519  static ssize_t connector_write(struct kiocb *iocb, struct iov_iter *from)
30f6570798f6c8 Thomas Wood     2014-06-18  520  {
89c24f70314e15 Jens Axboe      2024-04-09  521  	struct seq_file *m = iocb->ki_filp->private_data;
30f6570798f6c8 Thomas Wood     2014-06-18  522  	struct drm_connector *connector = m->private;
89c24f70314e15 Jens Axboe      2024-04-09  523  	size_t len = iov_iter_count(from);
30f6570798f6c8 Thomas Wood     2014-06-18  524  	char buf[12];
30f6570798f6c8 Thomas Wood     2014-06-18  525  
30f6570798f6c8 Thomas Wood     2014-06-18  526  	if (len > sizeof(buf) - 1)
30f6570798f6c8 Thomas Wood     2014-06-18  527  		return -EINVAL;
30f6570798f6c8 Thomas Wood     2014-06-18  528  
89c24f70314e15 Jens Axboe      2024-04-09  529  	if (!copy_from_iter_full(buf, len, from))
30f6570798f6c8 Thomas Wood     2014-06-18  530  		return -EFAULT;
30f6570798f6c8 Thomas Wood     2014-06-18  531  
30f6570798f6c8 Thomas Wood     2014-06-18 @532  	buf[len] = '\0';
30f6570798f6c8 Thomas Wood     2014-06-18  533  
c704b17071c4dc Michael Tretter 2017-08-17  534  	if (sysfs_streq(buf, "on"))
30f6570798f6c8 Thomas Wood     2014-06-18  535  		connector->force = DRM_FORCE_ON;
c704b17071c4dc Michael Tretter 2017-08-17  536  	else if (sysfs_streq(buf, "digital"))
30f6570798f6c8 Thomas Wood     2014-06-18  537  		connector->force = DRM_FORCE_ON_DIGITAL;
c704b17071c4dc Michael Tretter 2017-08-17  538  	else if (sysfs_streq(buf, "off"))
30f6570798f6c8 Thomas Wood     2014-06-18  539  		connector->force = DRM_FORCE_OFF;
c704b17071c4dc Michael Tretter 2017-08-17  540  	else if (sysfs_streq(buf, "unspecified"))
30f6570798f6c8 Thomas Wood     2014-06-18  541  		connector->force = DRM_FORCE_UNSPECIFIED;
30f6570798f6c8 Thomas Wood     2014-06-18  542  	else
30f6570798f6c8 Thomas Wood     2014-06-18  543  		return -EINVAL;
30f6570798f6c8 Thomas Wood     2014-06-18  544  
30f6570798f6c8 Thomas Wood     2014-06-18  545  	return len;
30f6570798f6c8 Thomas Wood     2014-06-18  546  }
30f6570798f6c8 Thomas Wood     2014-06-18  547  

:::::: The code at line 532 was first introduced by commit
:::::: 30f6570798f6c897df4f1f2c676d803728bfec27 drm/debugfs: add a "force" file per connector

:::::: TO: Thomas Wood <thomas.wood@intel.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

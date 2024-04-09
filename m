Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995846E5EF
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Apr 2024 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712645756; cv=none; b=Aigdqe9r0RkOyHzPCF6VPsz+oIcHnqjsGDQR8NTMSnbcZl5tKDbIDpLOoufTaODbiz93JT0ZfRpKrANeYSvqfwTn4oHklI37b6QJRbRXdqUgvX8a+TPDxN17YT1tLY7rWy5WXPXO3L8AYGGfoHjJsWUJpEMKeVyi3sQllj0/p1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712645756; c=relaxed/simple;
	bh=RoD+dyJUXhhTkiD36Lq/OWlkXw1TYmVBA0BCWpOzuzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VTj3NFfpU7i2760HaqVG0J6xtiFN6EPZYxK2RBrmeauzp2fcZPuUDye3dj9ZcHcjjfJvvVZN8nwTV8CMF4aT6pHua4LUnUlf734+pK5umq532v1BzxQn0TmRlhNR1dYcbxdMq2dCzSdcHqF/dmVaKQCpOTz2KyEwDQ/yMiRyk7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kphXU8Nc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kphXU8Nc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712645755; x=1744181755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RoD+dyJUXhhTkiD36Lq/OWlkXw1TYmVBA0BCWpOzuzQ=;
  b=kphXU8NcAwqfw4gtVAbV4m0lRK89VCb/2Y6B4BHiETEqGtVE+0q+fUCK
   MKNOFufZ/RirvMqulfAMMjnrDD7uGnWActL7Rx9FMjdvE8VQAZUUDO7s3
   0YY48oReZplriCQj3jiihWjxDcKJxFjPK6oizwq5J04e2+G1aYH3oblqq
   bmlJSZhEy6OYDXtscoEVS2rEjqCYWmxTAVa8ii+xAFcweuEjJfcZ3OFoj
   Rm0r+R9Ye9vSQAbxmvhlxhO4TLwTb2fyfI+qyqu6Ch6gCShnGQP6U58s9
   +w/oKSkNm5VZgVUEkwcj/EXokNN68SZ8wCOE1vZI8IjKDYPR+6gld2SE/
   Q==;
X-CSE-ConnectionGUID: Dhq5YS6iSmqYCD84cRs2HA==
X-CSE-MsgGUID: 6A8j5PHqRyGlCH/UQztDyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19099314"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="19099314"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 23:55:55 -0700
X-CSE-ConnectionGUID: kGOMXcZeT6GdMsZNlMRzQQ==
X-CSE-MsgGUID: IF0zzW37Qt6mnJ1bLgKL/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="57599290"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Apr 2024 23:55:53 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru5OY-0005qU-1x;
	Tue, 09 Apr 2024 06:55:50 +0000
Date: Tue, 9 Apr 2024 14:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 57/153] drivers/gpu/drm/drm_debugfs.c:419
 connector_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202404091424.Wc42xp3B-lkp@intel.com>
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
head:   8d5e62882d13747268ce489ec43048c8eff31b7a
commit: c6554f8ef64ee16df7701800a5873c3045413f9c [57/153] drivers/gpu: convert to ->read_iter and ->write_iter
:::::: branch date: 3 hours ago
:::::: commit date: 14 hours ago
config: microblaze-randconfig-r071-20240409 (https://download.01.org/0day-ci/archive/20240409/202404091424.Wc42xp3B-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404091424.Wc42xp3B-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_debugfs.c:419 connector_write() warn: potential spectre issue 'buf' [w]
drivers/gpu/drm/drm_debugfs_crc.c:144 crc_control_write() warn: potential spectre issue 'source' [w]

Old smatch warnings:
drivers/gpu/drm/drm_debugfs.c:220 drm_debugfs_gpuva_info() warn: argument 6 to %016llx specifier is cast from pointer

vim +/buf +419 drivers/gpu/drm/drm_debugfs.c

30f6570798f6c8 Thomas Wood     2014-06-18  405  
c6554f8ef64ee1 Jens Axboe      2024-04-05  406  static ssize_t connector_write(struct kiocb *iocb, struct iov_iter *from)
30f6570798f6c8 Thomas Wood     2014-06-18  407  {
c6554f8ef64ee1 Jens Axboe      2024-04-05  408  	struct seq_file *m = iocb->ki_filp->private_data;
30f6570798f6c8 Thomas Wood     2014-06-18  409  	struct drm_connector *connector = m->private;
c6554f8ef64ee1 Jens Axboe      2024-04-05  410  	size_t len = iov_iter_count(from);
30f6570798f6c8 Thomas Wood     2014-06-18  411  	char buf[12];
30f6570798f6c8 Thomas Wood     2014-06-18  412  
30f6570798f6c8 Thomas Wood     2014-06-18  413  	if (len > sizeof(buf) - 1)
30f6570798f6c8 Thomas Wood     2014-06-18  414  		return -EINVAL;
30f6570798f6c8 Thomas Wood     2014-06-18  415  
c6554f8ef64ee1 Jens Axboe      2024-04-05  416  	if (!copy_from_iter_full(buf, len, from))
30f6570798f6c8 Thomas Wood     2014-06-18  417  		return -EFAULT;
30f6570798f6c8 Thomas Wood     2014-06-18  418  
30f6570798f6c8 Thomas Wood     2014-06-18 @419  	buf[len] = '\0';
30f6570798f6c8 Thomas Wood     2014-06-18  420  
c704b17071c4dc Michael Tretter 2017-08-17  421  	if (sysfs_streq(buf, "on"))
30f6570798f6c8 Thomas Wood     2014-06-18  422  		connector->force = DRM_FORCE_ON;
c704b17071c4dc Michael Tretter 2017-08-17  423  	else if (sysfs_streq(buf, "digital"))
30f6570798f6c8 Thomas Wood     2014-06-18  424  		connector->force = DRM_FORCE_ON_DIGITAL;
c704b17071c4dc Michael Tretter 2017-08-17  425  	else if (sysfs_streq(buf, "off"))
30f6570798f6c8 Thomas Wood     2014-06-18  426  		connector->force = DRM_FORCE_OFF;
c704b17071c4dc Michael Tretter 2017-08-17  427  	else if (sysfs_streq(buf, "unspecified"))
30f6570798f6c8 Thomas Wood     2014-06-18  428  		connector->force = DRM_FORCE_UNSPECIFIED;
30f6570798f6c8 Thomas Wood     2014-06-18  429  	else
30f6570798f6c8 Thomas Wood     2014-06-18  430  		return -EINVAL;
30f6570798f6c8 Thomas Wood     2014-06-18  431  
30f6570798f6c8 Thomas Wood     2014-06-18  432  	return len;
30f6570798f6c8 Thomas Wood     2014-06-18  433  }
30f6570798f6c8 Thomas Wood     2014-06-18  434  

:::::: The code at line 419 was first introduced by commit
:::::: 30f6570798f6c897df4f1f2c676d803728bfec27 drm/debugfs: add a "force" file per connector

:::::: TO: Thomas Wood <thomas.wood@intel.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

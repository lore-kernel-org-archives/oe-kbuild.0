Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AE726ED3C
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 04:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766635773; cv=none; b=KcUH5fnvS7IHQozQDh0sElDViEiSEiyDaK94kyrHV2eBT6tuD1c0s4pbeMYRoUnkJVLHJhvIYc8i5kZMVqSpIPXhHlTS3UOLTONV2uJjKGL4hT4WcE82bJJ1Sm42uoEswao8+utcWDerLd9ClyY2WBdNsxuYRx8uCQEjqV+aNwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766635773; c=relaxed/simple;
	bh=k1NUDKQbLF6Hw5/1L7iwjECWbnUfQkjS1L1PBRAyELI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i7jg5Zr3btnbXXPCVBomONF9obOKsRdmsr7JGkn2k6SQz6RL4J19VlwjzKS4wZpLiHq1idSpUHaXXeVpHzd99Knu9yHqv95WN9MOtnGoFeh0yrSGoVwDufDpZGvylmKlnBxpJthfIYpkj0TcEXsqhrmw+/Nrru9E20li3TrGRiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwwuKfrF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwwuKfrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766635771; x=1798171771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k1NUDKQbLF6Hw5/1L7iwjECWbnUfQkjS1L1PBRAyELI=;
  b=ZwwuKfrFvt8yt6SNCwp1cDvWaXJ4sxumjEVBXlz/B09e628QqE72H1nY
   2CwLdcMbARPUTpovmTZlS3IhYQu0+vlx7WI/sSuTCHyjEDUqJvHVbMRgQ
   nPoPOd8GQX0MAxkWx6JgWdUdRveHPeuAcCA6HQjOUhmXqWV8dfKe1ob3W
   ql/5t6bEbhm5UVisTJOlgfOjd0Wsw7aH1PlLdmCTmKY/AlVJehhW8z30w
   eAooh3DF+ZV/hNnfNiXDCbXuLzHwAmKnjslownprPDMnKQB9ulW1TR2BE
   fX5tPrfm3oihdqu1HsGEOhb1N9Jl6D+8YdrEpP2uRTnksAUION8CehKXX
   g==;
X-CSE-ConnectionGUID: dFSOfcN8RrCHfeOkredi1Q==
X-CSE-MsgGUID: DxJtXA5JRo6zNwzaUUGqNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="78758155"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="78758155"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 20:09:30 -0800
X-CSE-ConnectionGUID: PKkrTx+tSHKZUTpzxM/pqg==
X-CSE-MsgGUID: pvEHNd+nSj2lc2sPcfV6Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200634046"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Dec 2025 20:09:28 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYcfG-000000003ij-1u1z;
	Thu, 25 Dec 2025 04:09:26 +0000
Date: Thu, 25 Dec 2025 12:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] virtio_console: read size from config space during
 device init
Message-ID: <202512251145.5xCuiNKA-lkp@intel.com>
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
In-Reply-To: <20251224-virtio-console-fix-v1-1-69d0349692dc@gmail.com>
References: <20251224-virtio-console-fix-v1-1-69d0349692dc@gmail.com>
TO: Filip Hejsek <filip.hejsek@gmail.com>
TO: Amit Shah <amit@kernel.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Rusty Russell <rusty@rustcorp.com.au>
CC: virtualization@lists.linux.dev
CC: linux-kernel@vger.kernel.org

Hi Filip,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b927546677c876e26eba308550207c2ddf812a43]

url:    https://github.com/intel-lab-lkp/linux/commits/Filip-Hejsek/virtio_console-read-size-from-config-space-during-device-init/20251224-114643
base:   b927546677c876e26eba308550207c2ddf812a43
patch link:    https://lore.kernel.org/r/20251224-virtio-console-fix-v1-1-69d0349692dc%40gmail.com
patch subject: [PATCH] virtio_console: read size from config space during device init
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-141-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251145.5xCuiNKA-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512251145.5xCuiNKA-lkp@intel.com/

New smatch warnings:
drivers/char/virtio_console.c:1794 update_size_from_config() error: uninitialized symbol 'virtio_cread_v'.

Old smatch warnings:
drivers/char/virtio_console.c:1567 handle_control_message() error: we previously assumed 'port' could be null (see line 1535)
drivers/char/virtio_console.c:1795 update_size_from_config() error: uninitialized symbol 'virtio_cread_v'.
drivers/char/virtio_console.c:2001 virtcons_probe() error: we previously assumed 'vdev->config->get' could be null (see line 1968)
drivers/char/virtio_console.c:2001 virtcons_probe() error: uninitialized symbol 'virtio_cread_v'.

vim +/virtio_cread_v +1794 drivers/char/virtio_console.c

eeb8a7e8bb123e Michael S. Tsirkin 2015-03-05  1773  
7e53fcc8531d26 Filip Hejsek       2025-12-24  1774  static void update_size_from_config(struct ports_device *portdev)
eeb8a7e8bb123e Michael S. Tsirkin 2015-03-05  1775  {
eeb8a7e8bb123e Michael S. Tsirkin 2015-03-05  1776  	struct virtio_device *vdev;
9778829cffd4d8 Amit Shah          2010-05-06  1777  	struct port *port;
9778829cffd4d8 Amit Shah          2010-05-06  1778  	u16 rows, cols;
9778829cffd4d8 Amit Shah          2010-05-06  1779  
eeb8a7e8bb123e Michael S. Tsirkin 2015-03-05  1780  	vdev = portdev->vdev;
7e53fcc8531d26 Filip Hejsek       2025-12-24  1781  
7e53fcc8531d26 Filip Hejsek       2025-12-24  1782  	/*
7e53fcc8531d26 Filip Hejsek       2025-12-24  1783  	 * We'll use this way of resizing only for legacy support.
7e53fcc8531d26 Filip Hejsek       2025-12-24  1784  	 * For multiport devices, use control messages to indicate
7e53fcc8531d26 Filip Hejsek       2025-12-24  1785  	 * console size changes so that it can be done per-port.
7e53fcc8531d26 Filip Hejsek       2025-12-24  1786  	 *
7e53fcc8531d26 Filip Hejsek       2025-12-24  1787  	 * Don't test F_SIZE at all if we're rproc: not a valid feature.
7e53fcc8531d26 Filip Hejsek       2025-12-24  1788  	 */
7e53fcc8531d26 Filip Hejsek       2025-12-24  1789  	if (is_rproc_serial(vdev) ||
7e53fcc8531d26 Filip Hejsek       2025-12-24  1790  	    use_multiport(portdev) ||
7e53fcc8531d26 Filip Hejsek       2025-12-24  1791  	    !virtio_has_feature(vdev, VIRTIO_CONSOLE_F_SIZE))
7e53fcc8531d26 Filip Hejsek       2025-12-24  1792  		return;
7e53fcc8531d26 Filip Hejsek       2025-12-24  1793  
855e0c5288177b Rusty Russell      2013-10-14 @1794  	virtio_cread(vdev, struct virtio_console_config, cols, &cols);
855e0c5288177b Rusty Russell      2013-10-14  1795  	virtio_cread(vdev, struct virtio_console_config, rows, &rows);
9778829cffd4d8 Amit Shah          2010-05-06  1796  
9778829cffd4d8 Amit Shah          2010-05-06  1797  	port = find_port_by_id(portdev, 0);
9778829cffd4d8 Amit Shah          2010-05-06  1798  	set_console_size(port, rows, cols);
9778829cffd4d8 Amit Shah          2010-05-06  1799  	resize_console(port);
7f5d810dac7021 Amit Shah          2009-12-21  1800  }
7e53fcc8531d26 Filip Hejsek       2025-12-24  1801  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

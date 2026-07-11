Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1998B3C141F
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783773547; cv=none; b=TCWIonbkkyE7HlAIFqFrIqSyLxRy96bX6k+JaIj2sddjfUb6sqAxqyLqbJCG06oS+Frz5hLGUvI9jc4y3eQDGsFtvhmOneLxwfP80ET+urUt9Y6IdtNUr1CBG6lNPoWPC0ET7hed/d37/Ge1jkLrODG9D52a2oXfJZFS/FXH3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783773547; c=relaxed/simple;
	bh=K6NfUqbGAB1dVk6LvH8iZajmGZRh7v4t0Aj66hOVZH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=skpV2rM0NzadHkRciwJhKZsC3oGzC879WHnbYzDL+wIEdJiqtUy2evdgc87XJ8AuGVxQfMtF7d56JVt7AU69lEJ11VwhG+Sv098Fn9BDb44LWaQgHJsJj7Rj2ZSzkXnWdowafaKej6v5hPAYmEKVI4Hll6qYLWJ3v7n48MJF2SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpOR6rTm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpOR6rTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783773545; x=1815309545;
  h=date:from:to:cc:subject:message-id;
  bh=K6NfUqbGAB1dVk6LvH8iZajmGZRh7v4t0Aj66hOVZH0=;
  b=IpOR6rTmX54Z7VDEVz1zpOSjouvwRsiv41lV8MmPxuZfqAD9uAzeZSbC
   r3uvoKhwLa+JrHntsmzgY7YjdGMO8akkNUpcHGZapnzot311FiM9hF56o
   hQ5xVkcFOfwF3XoutoDcuNfkdTl3h3b90ESJHXLQ7ttvK2E+qqAbQ//mC
   njR7+0Uk6OzTXeNFEKosqAz/c68YvIiAwO+7EoQdz95C41mMjr0QCOY7D
   wsk2JBdmF4oy2CCbggj+XuHTQIMqWWyGMCUQBUOGSkA4Vw9W/OsxaO2Dm
   1B0Evr0eQKe8uq00H6A76/p6/dKOjgzCwsUuxU1UmwP44lOglOSewY1gn
   Q==;
X-CSE-ConnectionGUID: OAXQQDx6R/a0KMABL4f6bg==
X-CSE-MsgGUID: Xoo5hiHYQvOwf8rYFUOwrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="86995999"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="86995999"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 05:39:01 -0700
X-CSE-ConnectionGUID: CMg79n/bSVSo9gCS6GGKYw==
X-CSE-MsgGUID: NW+wMvrOSiWxCf2rgXuNfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255205748"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 11 Jul 2026 05:39:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiWyv-00000000K35-2zCo;
	Sat, 11 Jul 2026 12:38:57 +0000
Date: Sat, 11 Jul 2026 20:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/linux/iio/iio.h:781
 class___priv__iio_dev_mode_lock_try_direct_constructor() warn: passing zero
 to 'ERR_PTR'
Message-ID: <202607111940.WTcT5zEX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Radu Sabau <radu.sabau@analog.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: David Lechner <dlechner@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: 40850443aa1239f71fc65b870a0f0ecd54e42c9d iio: adc: ad4691: add initial driver for AD4691 family
date:   6 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-161-20260708 (https://download.01.org/0day-ci/archive/20260711/202607111940.WTcT5zEX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 40850443aa12 ("iio: adc: ad4691: add initial driver for AD4691 family")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607111940.WTcT5zEX-lkp@intel.com/

smatch warnings:
include/linux/iio/iio.h:781 class___priv__iio_dev_mode_lock_try_direct_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +781 include/linux/iio/iio.h

847ec80bbaa76a drivers/staging/iio/iio.h Jonathan Cameron 2009-08-18  772  
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20  773  /*
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20  774   * These classes are not meant to be used directly by drivers (hence the
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20  775   * __priv__ prefix). Instead, documented wrapper macros are provided below to
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20  776   * enforce the use of ACQUIRE() or guard() semantics and avoid the problematic
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20  777   * scoped guard variants.
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20  778   */
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20  779  DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20  780  	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20 @781  DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20  782  		  iio_device_claim_direct(_T));
7a38b75da1dc38 include/linux/iio/iio.h   Kurt Borja       2026-01-20  783  

:::::: The code at line 781 was first introduced by commit
:::::: 7a38b75da1dc38a8cd9563c41b87367b2475b975 iio: core: Add cleanup.h support for iio_device_claim_*()

:::::: TO: Kurt Borja <kuurtb@gmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

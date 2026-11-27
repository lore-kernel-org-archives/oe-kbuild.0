Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748969;
	b=XWOex55wWgGmZLtFKfy+wV6U0RJKv+QJBdc8dPWg7twrNdY8+bmY6HzEXRROEZL+LTzC
	 hbvDCMn4kj/YwMLmcm66GsX8ZUqpCKzSaeA4rM2SZ3pIpG+NsdNpHOLITiwuQL/Ye4tO0
	 FhtqstenpDuyeQpVCUdklveB4f5NCBOEfYfyVa0OICHltH7GlTpe/LCy8xQHUXQ7a9ToC
	 wBx7AgDqhOgpIJ1v8eE12jH6cMrci90dqQHBKmzo5iZV+OJcmn1EjqcME31Ge7ZAQeCJL
	 MAyZlbaFXr/oXe9cHz9riCAE80wpBwXC3x95bMtdqtU1+SMS+yABjRm2Xbc3wrnl5yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748969;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=yPRoDBPI1yaC37k6IcPm+CXwToellHisc1rokxRpvvY=;
	b=aW/gqnzsCjMbyHYIqTI38QIcNCOGvxP8ZQKQjsJs7vinvNw2kgG6zAC6sV44qWPCBVfH
	 sPkiGXU5DWPavWG5Lmbg4dQVz/aBHR76Hgca9xA1CHv3i+QLnsI/WiKvhe+05Wel//ivF
	 DwoQy5VQ51TQ25KpdOSYWw0WDe7FioL8LmVb19V3Rgr3GpOcqs4naZavLeiX77rgOE322
	 g+RZJttqqEm9NOnSVcZ5XdimRydiLowTgui3VIzl5Ka8lc+daHM4gKr0JwUUoSbSXxsp5
	 qEm3/k5gL7Vuv/l+TJLNB8y5+gtapPy3sE2cALs8S0DHUU5x8iu5sn63XBlMa/bRDFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dtLJRuKx;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626CA606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 03:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dtLJRuKx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795748969; x=1827284969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9nR5eGWBrTux5Qeitri+t1dGyVXWgm+iIcFJbDYc2x0=;
  b=dtLJRuKxHQ9CRtJJWbsgvycg8Tw2u2VOge1o1ZnA3oTVwmt5oqKjcOxd
   8v5HgV4WVSv5PxWJkTjpLfJxFCUCeipDW0R6toRtq2Hjzsf3MdYoDnvBs
   kloBAKjacFzoX//Uv4xQi4FrLsxCK1vfnBwX4ebaKZu0SNGVbgqGP93qW
   x/OhKGHeY37g+WeTkc46zRGS/bzcdUB2zuiJF89aFefAxXG3JyUIy2SGc
   gma4rVTWYce3tvr+fOkjiwU3xwFNFP2Pe7h8+88FlX9Ffd9peqsVvX7T0
   VM1JLMPFwGEgqat4Wmf9ffBLi8ZoJJPIztfWi2l/3KdG+FkR/G+dy5tfm
   A==;
X-CSE-ConnectionGUID: NeG2HB3xR96CLkawQOcvRA==
X-CSE-MsgGUID: VvbyEvyjQG+WnooC0/x5HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4745194"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4745194"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 19:09:28 -0800
X-CSE-ConnectionGUID: WiM9VgjaS4SUSmbLvUvsNA==
X-CSE-MsgGUID: tDImFlEyTkCS2vEvND228Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12448080"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2026 19:09:27 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWmKy-00000001VEw-3XkM;
	Fri, 27 Nov 2026 03:09:24 +0000
Date: Fri, 27 Nov 2026 11:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 05/14] nvme-keyring: link addtional keyring into .nvme
 keyring
Message-ID: <20261127105430.zJkj0Nm7-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "same reports for this branch"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261126-dhchap-keyring-v4-v7-5-ee438ffea527@kernel.org>
References: <20261126-dhchap-keyring-v4-v7-5-ee438ffea527@kernel.org>
TO: Hannes Reinecke <hare@kernel.org>
TO: Keith Busch <kbusch@kernel.org>
TO: Jens Axboe <axboe@kernel.dk>
TO: Christoph Hellwig <hch@lst.de>
TO: Sagi Grimberg <sagi@grimberg.me>
TO: Hannes Reinecke <hare@suse.de>
TO: Chaitanya Kulkarni <kch@nvidia.com>
TO: Eric Biggers <ebiggers@kernel.org>
TO: David Howells <dhowells@redhat.com>
TO: Jarkko Sakkinen <jarkko@kernel.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Randy Dunlap <rdunlap@infradead.org>
TO: Kees Cook <kees@kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: linux-nvme@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: keyrings@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-hardening@vger.kernel.org

Hi Hannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on 68099cf27253a8c89d703a282d3d811446d9453b]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/nvme-auth-modify-nvme_auth_transform_key-to-return-status/20261126-151219
base:   68099cf27253a8c89d703a282d3d811446d9453b
patch link:    https://lore.kernel.org/r/20261126-dhchap-keyring-v4-v7-5-ee438ffea527%40kernel.org
patch subject: [PATCH v7 05/14] nvme-keyring: link addtional keyring into .nvme keyring
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-buildonly-randconfig-1005-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127105430.zJkj0Nm7-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127105430.zJkj0Nm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261127105430.zJkj0Nm7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: nvme_keyring_unlink
   >>> defined at nvme-keyring.h:48 (include/linux/nvme-keyring.h:48)
   >>>            drivers/nvme/host/sysfs.o:(nvme_keyring_unlink) in archive vmlinux.a
   >>> defined at nvme-keyring.h:48 (include/linux/nvme-keyring.h:48)
   >>>            drivers/nvme/target/configfs.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: nvme_keyring_unlink
   >>> defined at nvme-keyring.h:48 (include/linux/nvme-keyring.h:48)
   >>>            drivers/nvme/host/sysfs.o:(nvme_keyring_unlink) in archive vmlinux.a
   >>> defined at nvme-keyring.h:48 (include/linux/nvme-keyring.h:48)
   >>>            drivers/nvme/host/fabrics.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

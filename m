Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795239728;
	b=GrmAqDN/Hv3AKPuNiJ0sy3yzg/M7d4gl+SF/rTcqv0XCLOqEY3XHgWq0+gH4O3jakYvD
	 DhVe8tZco6l+PoO7iHxKgalc/dEPiZx3O6eih8JyU8JLMsth4QvZTPnyn19O11EnQ4+F9
	 zDKCn8VgMxMMjm759ea2UKrRpCHKuSt3tZGIh+JbvVls71q9crzRuWsg3ZMhDAwGORXRL
	 7sVEaq4tjf4gQ/sVCX8ubMTftG8udC9t72LZkv2O1MdhvKA0oY+XqUshaGV/J66FsAWoh
	 UMreCpqau6LYxa1n9Kr8WMDQbgBBlzcGA4OpCuUntpFKcw3sZc+RMGpBXLf7c2TBYPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795239728;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=N4XvRA/m1PW2O9gRCr6bDZmNugb8sb1D1C7mVuDWDSw=;
	b=ao9fTPK1KjXDoi0EtxyfCevVGRkIMn4L1sZtTeaeGJ+6Dlmik4yGVU0R0ptyH9N/fhfF
	 3ujfLjgOWKfx3LtY3TXmjULSuAa1z/GmblQdxFQs34OJAdy4v7R1GF+s46nZDKEQij3SN
	 /fYQRu5IfVlg11KV6JOUWCYKtIslrHMhCje7BlQfs9fxMQ2U8r5BD0fT/yaNMz9B8e2FM
	 LWGxDVbz0lMchol+g6IGG95au/2pnIN86RU0EK0EKaW3NWMA8YSi6UXkcIzxouhLQNqGg
	 A8C07IjsEsOItPbLZdf+7vV3CtbfbRnXw5Z8gN4uPaIsD/eyeKjGvRMvR3aOShFoY3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S9iARk2s;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D81606A68F
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 05:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D81606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S9iARk2s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795239726; x=1826775726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ngkhkObgboH4YLTIAG4nL1mOzXEra5JezKyG7Jydd8U=;
  b=S9iARk2seAx8k8lxyziis1cRR/FHjzrJzEq8DnID0DKBgsR2vUI0SzZH
   3wCBsu0etwo/ozV/e9cOClI+VH8YvGoRko3OsTHLUHYl/PUkcg21PdXFB
   PaAnUnDyvnIgiL8Wkd5WNvdYorR5TPsRTdSnCB1v5ptyVAocn0GF2hril
   cHFNA3dF34/C/CL9qu2xwtUo/e/y+a+lzTbXZFAPbC5NeyWAYDuiBQIa7
   UzvgWKULxako0KDX6GZYgTkA5uva+u2lTEr3Gn9RbGOcDftmuoOHbx81E
   7U8AUVDA7bvWvjE6Ry4KW2QVVnrPeucUiae1fxoGcnU66NB0M8iuTuh1h
   Q==;
X-CSE-ConnectionGUID: 91VxS9tJT5iHXNgv9dw/Og==
X-CSE-MsgGUID: RmyKNKzOTISSU4Db+VEUOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4163242"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4163242"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 21:42:06 -0800
X-CSE-ConnectionGUID: i1+pnovwTEK34wQ5AbYDsg==
X-CSE-MsgGUID: u9aWRDq7S8etBDb+Oo8rOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10939333"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Nov 2026 21:42:05 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUdrO-00000001JZf-2FZx;
	Sat, 21 Nov 2026 05:42:02 +0000
Date: Sat, 21 Nov 2026 13:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 4/9] nvme: parse dhchap keys during option parsing
Message-ID: <202611211340.Diefn7um-lkp@intel.com>
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
In-Reply-To: <20261120-dhchap-keyring-v4-v4-4-5f8c7d9926ee@kernel.org>
References: <20261120-dhchap-keyring-v4-v4-4-5f8c7d9926ee@kernel.org>
TO: Hannes Reinecke <hare@kernel.org>
TO: Keith Busch <kbusch@kernel.org>
TO: Jens Axboe <axboe@kernel.dk>
TO: Christoph Hellwig <hch@lst.de>
TO: Sagi Grimberg <sagi@grimberg.me>
TO: Hannes Reinecke <hare@suse.de>
TO: Chaitanya Kulkarni <kch@nvidia.com>
CC: linux-nvme@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Hannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on 68099cf27253a8c89d703a282d3d811446d9453b]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/nvme-auth-modify-nvme_auth_transform_key-to-return-status/20261120-121400
base:   68099cf27253a8c89d703a282d3d811446d9453b
patch link:    https://lore.kernel.org/r/20261120-dhchap-keyring-v4-v4-4-5f8c7d9926ee%40kernel.org
patch subject: [PATCH v4 4/9] nvme: parse dhchap keys during option parsing
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-buildonly-randconfig-1002-20261121 (https://download.01.org/0day-ci/archive/20261121/202611211340.Diefn7um-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611211340.Diefn7um-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611211340.Diefn7um-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/nvme/host/nvme-fabrics.ko: symbol 'nvme_auth_extract_key' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

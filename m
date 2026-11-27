Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760608;
	b=UMbPKL8KBheRnAj+0T5PV00UOBnf9NgOKGiZB5qChqXVt4wm08Hldbm8NNS4cfmT1Bs/
	 /4qLsIoowOVhMfViIJUNIqgjzXrMRz4vRRHBZSlatqQmm+aVnDDVutOuYrYQuDLVHqYTl
	 5NjoA5MWi5OTtBUjS2jK4BeFMJ90sOIgH6po1jv6uGGfp/2o0LtBjd/BkQ7wbfbWawlJF
	 kN8ZiE2lXsLwJifxAa+zsBSNQ6TtVEOFb/iIK+hyIG/nc2ulN7kDhAesQZKl4WPyjYHTS
	 Zv6iFHtPJN1sI/YTl0krCbgmA7HlRo3DusE79gsLKox31Q99fX9365Mc4R7IqBtOyYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760608;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=EVD6h4wnEFvKulqX2Tbr5zhrKWuu2XNx+hFNMAi3AdM=;
	b=4ElDK7BxbxfwxmHQCYS3IuLzWUqwFvBZy89JKga5Ax+UoVdG+xQFlHJ+kmd5AbvY10T4
	 XKU6DfYVN+hWVkeWJMkO24prTzM6cO2SJcNlkyH2xYJpTj+JkfI14VV/OnH8KbwXHkLbf
	 xSW/H69YV7fpVqyULwUIU9HjcSjSvtkP8rcXNNAt3423XgzySFuWPMQikj+5P97ZXbdbP
	 YDf4NN6dEccL9IYQDkrWjKt8yqALG3qjbEa/VD4gKYXQWRlYFxz4+0QBOyIQ7kXMEaacJ
	 aUAEQrmUu+sFOARCGLUPafMAHDZQSYYy3TSH3u1Ekjw/Kni9vBcsq1v/OUApmVyhIRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RmR6++kV;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AFD606A339
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 06:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6AFD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RmR6++kV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795760608; x=1827296608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a4Yk6T/I6fIiGuLt1DDdjrvf6mdv7xmmJEQAJ7k/xOg=;
  b=RmR6++kVXH0YwLpAo0xc/42nKrdpiaz3P2HhpfLTsJ7xenBEB54cimn9
   v3MmAg71kExqUE0yzYd8OAmWV47XJ3rX3bWwugzsut92LUME/mr+/ogKT
   5BqaNdnZO3ECc4KtBU/ch+xNetEbwhpLVD8u4NlVHI31oji1nTpXdaqfL
   CXy2RI3oO9CpjdFwoztBV428J/F+2YnPmgPC8+fFreqjjVFPHNZNwmZik
   X4xmuZeBxKHJ+TN1ItrQb/WguXOMqOv58+h7FofEhgfIONEr1qmygCdFS
   Yj0rZJ3/jZOLv4YCEFwRcEQYqs0sMg13sUX+4dIiX2Ay9EBbg5QW0KjEC
   Q==;
X-CSE-ConnectionGUID: F0SDGUyGQ2a7jhTrFO8TeA==
X-CSE-MsgGUID: FzvmuhgMQFm5m9nh2RmxhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4522854"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4522854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 22:23:27 -0800
X-CSE-ConnectionGUID: jvgFk5KkQueFILRsgZdz6A==
X-CSE-MsgGUID: gZABxHCKQu2Cx4rRHfYsmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12741161"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Nov 2026 22:23:26 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWpMh-00000001VT0-49Rd;
	Fri, 27 Nov 2026 06:23:23 +0000
Date: Fri, 27 Nov 2026 14:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 05/14] nvme-keyring: link addtional keyring into .nvme
 keyring
Message-ID: <20261127141335.b6SnWt2Q-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit"
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
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-buildonly-randconfig-1001-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127141335.b6SnWt2Q-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127141335.b6SnWt2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261127141335.b6SnWt2Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __cfi_nvme_keyring_unlink
   >>> defined at sysfs.c
   >>>            drivers/nvme/host/sysfs.o:(__cfi_nvme_keyring_unlink) in archive vmlinux.a
   >>> defined at fabrics.c
   >>>            drivers/nvme/host/fabrics.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

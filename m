Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759941;
	b=JcfzX7RxqMm2tNJYc6AhpqX81S4lx1gyWTfo/illtwJHkQNcR44RuXNWYl+cn8jxEgsu
	 HCCj1XgL5CtWTgu6kiL1+mDfhCLUD8EpB8UzIbNcIexssceJxMQRVQWDyCBlev9jTz3lS
	 T7t1oWWr8rCKC/C+q4lFqZh/yiGiGC1S2yNLgGksBlKk6FFm7tqilw2eumtZVZ79+UnXa
	 +22akORM82mcErO7nUwsVY/H0WHIwtKiwx7QKB7UmMreB7xc6LiBDVKDdHYS694jQj5GD
	 OfcWTr1GloVDSFM9D7sKtEEcfuzbgjknqTGZ3uS0WLMsafP6hAvb/8EQNmBttI1CdVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759941;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=tmmtkFk05LKUtMR/BOdgFB2LyyMnuTxN0r3lYHml6bg=;
	b=5oWcD96icSPT2tcaRpEVH6hNbUJBAhoKg33Uz6IWdwWqaRqD3HqbX+TKgZOZwHWqQuxF
	 dzOpousHcEyQcAmoBk+mKn92aTKz1aDKTob14qVGEbrXDt2RNSAWml6gETq9I5/6GouyP
	 K9Z3YiU9rSTxYFNzu4RWCWOnKYcT1+ymG9v2EcZz849DUHCRtb0msIGZ1NMgK0Vl2Xx26
	 EDU4Led3GJnsw9kVdG1pZQGvLcXLMP+Y3L3jlW/55qBlps96ZT8jNq94nOgEgwXItTkJC
	 JSmL3k0UNwh/yr/1dTKB2ToPhEDd2ef69SeVfNB0RSZCM8SRdKYe9WDNNDlZcSNlyeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zpb8PXdv;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BBD606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 06:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BBD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zpb8PXdv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795759940; x=1827295940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFWWTWZQTGpyKvikTCdykUKi0eQv027iS6/lCfU1OgU=;
  b=Zpb8PXdvcEjt8ynMOZSd3pNXKWVXc+Zn73oCHCMhyMAh7pWvGN+2dytb
   rD5kNcOPZHyBX1oyUKqIf1wDYaxMIqVZvazq2DqwgXHhmjiYnQNaS67ff
   FdQQ2KxqxCAhjiduIJ2d3CI2blU2aabv7Sin9CizLZ+3pwnXcqQCwIXUQ
   Uhc5OGX/5dsvlyexs94r51k7GbxI6S7iiTIAPzq3CRj8xZrwI8y/PEjMz
   bbUgavnqGO0aSF9SyzTI2krjqrtYA/oterOiBpbjCGSo9RkkhZSY4EHCl
   RGlHNZlonDOZrBfXSlbXH4ct1ttGmMNougPzNH5yozyI1MMndX529H8vi
   A==;
X-CSE-ConnectionGUID: 4UfPk7D9Q2mNTEShl6Vfow==
X-CSE-MsgGUID: 6utpLfcKRCKZu4o7M0qVQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4674104"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4674104"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 22:12:20 -0800
X-CSE-ConnectionGUID: lGZVr0fCReuf1O7uE0JGDA==
X-CSE-MsgGUID: E/9uMiMzRYiJtlXmxBhVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12665515"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2026 22:12:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWpBw-00000001VSM-0FI1;
	Fri, 27 Nov 2026 06:12:16 +0000
Date: Fri, 27 Nov 2026 14:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 05/14] nvme-keyring: link addtional keyring into .nvme
 keyring
Message-ID: <20261127140211.GB7lh0Bk-lkp@intel.com>
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
config: sparc-randconfig-1000-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127140211.GB7lh0Bk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127140211.GB7lh0Bk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261127140211.GB7lh0Bk-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/nvme/host/fabrics.o: in function `nvme_keyring_unlink':
>> fabrics.c:(.text+0x3e00): multiple definition of `nvme_keyring_unlink'; drivers/nvme/host/sysfs.o:sysfs.c:(.text+0x4100): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F140A7E
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Mar 2023 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678095898; x=1709631898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZblurmS2fUPLWDSYyKrubKnKNgjlrxHz70y+bgmebo8=;
  b=aTm5Tj+yKdWnuhDpAGQaiHJlz2yiF9oq/KpymagUHz7tLMZzfg441Uuc
   vpp1XBFiAJCu+SMluJg0NYu2hUGYZEWo1oiG+c9keAClzGRqE7U22byW1
   pAJo8MEiPmwxifjHy1cZp6Dsig5wWeYQS0rd/i//3GtcOv9FyrzVXpyt1
   yOGVoEUxDv/EqBIR3nR/BogGbeEo6jTeLtESKw+osBmd3IN+KczLvsyLm
   xSdUD97RFdOlFZzySX1865o55qniXzUZTey98DoKiXBMdkrVxyLJfLZV8
   jbvdVrkx+Evo7VQ4bABsEP51JBwNoFp3Q96XALiq0scncsMn7ePj62NHT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="398095574"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="398095574"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 01:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="740268901"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="740268901"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Mar 2023 01:44:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ7Oq-0000DT-27;
	Mon, 06 Mar 2023 09:44:56 +0000
Date: Mon, 6 Mar 2023 17:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [sashal-stable:pending-5.15 275/429]
 drivers/iio/light/tsl2563.c:769:8-33: WARNING: Threaded IRQ with no primary
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202303061713.2RJh6q1R-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   7306e5782e166a6d4168af6b32b5878186a69bd3
commit: 3d6cf12071898105e04d79e32c7aa9f416039448 [275/429] iio: light: tsl2563: Do not hardcode interrupt trigger type
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: microblaze-randconfig-c033-20230305 (https://download.01.org/0day-ci/archive/20230306/202303061713.2RJh6q1R-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303061713.2RJh6q1R-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/light/tsl2563.c:769:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

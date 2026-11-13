Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530845;
	b=t9C/Jd73gjfrVodcxDkclvDr7Z+xVrl49OvI+qFeVRk4WxOcuPiUPew/kLXzVhHVyZut
	 09aJeoNOIOKg9ZI7Fe+IbzcceOuSEuNcqa5SPQWQs04hwxBHMUq0wO9oH3J/UK6JQ3SRv
	 qTdixLSs5uAp0pv1x1wLEgoXO72b+os8X9TwYLRrvWKBlKj6EYiTU244qNWM4wLAEH1ab
	 aWNoqW/AupsJmqhy/bVko7fqEpwNF9b3fWSnNKTayxDKvkDi33QPepsufu7mv+1ERpqe8
	 nba/4W0mWws7cdlBtp+B2927kofNE+KxodaAhaXTpz/Tltl1RN+QDS6wy/dpdTJ7kIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530845;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=EDqMBg3/DnHEirOi0YMWc756J4Osq54yRVq1IbM2moM=;
	b=t/4aImGmzAjiTTXYY+EppRR68AAaiyP/5Y2qW7Q9RsNXMTGSJX7BNlSvDD+zKWJVZoOH
	 blcoEv1zeqt+Obl2P18RrnKaJHEQovVVfl+Kvg+W4jfDeiFibJTwJafbvc55lZNEfqGV6
	 I7FR7tN9EGVCoSbTsv+dgMPsgy3d7iDkKgCrFsK+3jkvHdrS2kFE8LABrREVFZPB2bJEJ
	 LJerMorRhXllkCZlxyZFDKOcqu7BUvkyIRozXocutV5WbPmAmb1x5KzaXykCRiPZ4FSp3
	 ILQKuIn2pzAFOETxRosGVk8SefcJReV5TTT+4qmf1+/khOhMVTXVw5n9H0oQSKemUnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WysHyHCe;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA51606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 00:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA51606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WysHyHCe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794530845; x=1826066845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RciVk/jSlwsc/9QSWj+FO4JELM5T9a+BozPq00LMQUM=;
  b=WysHyHCeMGnYNzOR6shCWBFcLZPhAayyFLiHeNDWz5QuZYxoF7PrfEq/
   vG2A20MFMlfiU4QHS0yVE1uSXNqqfH3HPnUbVcknqI/wZcvBt7fWYUovL
   hBTLtT7fZ5dJYY9dJrZbH/zHa824JKRBp+wHKTBnds7QeJCp3aWIyp1mF
   59GZmC8oe6hDm6oZiE8A3ZsIn7Nr4vs1yBzU+U82FnAfO91engUs2Y+QB
   ssshWpMniIFaNenljU8AKv9flajq6Jvdwz1uE6Eo6sRQYjh7723OI9DPM
   PeMKUJ+NOOZ/7tGM81uuL6+BW32YCqOr1eEQIxU0NBuEwJMz6jyGSxPcj
   A==;
X-CSE-ConnectionGUID: q4RCZ/K4Sua9ubcfTg5HeA==
X-CSE-MsgGUID: mToq49IUS3C7OPiy2jAyNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3361811"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3361811"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:47:25 -0800
X-CSE-ConnectionGUID: 9gqJ3BRcR6m9lyP6Q28d2w==
X-CSE-MsgGUID: vJITfE7YS+yhQXqG6e5yVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8724820"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Nov 2026 16:47:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRfRp-000000012G7-47BV;
	Fri, 13 Nov 2026 00:47:21 +0000
Date: Fri, 13 Nov 2026 08:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] spi: zynq-qspi: read flash above 16 MiB via the
 extended address register
Message-ID: <202611130828.KCC0t13G-lkp@intel.com>
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
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261105203734.979168-2-mario.behn@gmail.com>
References: <20261105203734.979168-2-mario.behn@gmail.com>
TO: Mario Behn <mario.behn@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Michal Simek <monstr@monstr.eu>
CC: linux-spi@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Mario Behn <mario.behn@gmail.com>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.3]
[cannot apply to xilinx-xlnx/master broonie-spi/for-next v7.4-rc1 linus/master next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Behn/spi-zynq-qspi-read-flash-above-16-MiB-via-the-extended-address-register/20261105-213733
base:   v7.3
patch link:    https://lore.kernel.org/r/20261105203734.979168-2-mario.behn%40gmail.com
patch subject: [PATCH v1 1/2] spi: zynq-qspi: read flash above 16 MiB via the extended address register
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611130828.KCC0t13G-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130828.KCC0t13G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611130828.KCC0t13G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/spi/spi-zynq-qspi.c:575 expecting prototype for zynq_qspi_exec_mem_op(). Prototype was for zynq_qspi_exec_plain_op() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

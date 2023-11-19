Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B711104
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Nov 2023 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDJ7M0+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700382651; x=1731918651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a8T7bWCGPmvji5PCJTw+lG7+2hQ7nx2QGkhanodZZeg=;
  b=VDJ7M0+5ZUbhUJb5KkUobOoZj2oHyb2f3kPL80l0Tepk1qjTpndgjdUY
   fbk3KysVW/zEoKDR8Is0JLCL/Ion9cNJgrQcq67uP8TXo6mA1DYOQy9Sm
   iQJlsfoPhMeNDd4w5F5xluyFO0tj15h2gGmgeP9Yuw2FA4H7eUC1ahjLV
   gUaXyJkno4fIofpGux8olfiS+ncDjSN8IQ4nfPAzQIqkEIL1kZqMWqCj9
   okDnQFOsfa9wQCANdNy5H8f6Sg6uxyB8p5fv5IEzOum8exnHqOPvCwLu+
   oF61J/daPheNesOddARcAWcvUYtSBHqULFUJKvIvL1uGM/rr/IedpSPnQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="394326299"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="394326299"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 00:30:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="769599490"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="769599490"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Nov 2023 00:30:47 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4dCW-0004qu-0b;
	Sun, 19 Nov 2023 08:30:44 +0000
Date: Sun, 19 Nov 2023 16:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: undefined reference to `crc_ccitt'
Message-ID: <202311191606.cYdy1kzK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ayush Singh <ayushdevel1325@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: ec558bbfea671ac020a6dc6be8bf8f0ee556cce0 greybus: Add BeaglePlay Linux Driver
date:   3 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: parisc-randconfig-r132-20231119 (https://download.01.org/0day-ci/archive/20231119/202311191606.cYdy1kzK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191606.cYdy1kzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311191606.cYdy1kzK-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/greybus/gb-beagleplay.o: in function `hdlc_tx_frames':
>> (.text+0x1e8): undefined reference to `crc_ccitt'
>> hppa-linux-ld: (.text+0x26c): undefined reference to `crc_ccitt'
   hppa-linux-ld: (.text+0x324): undefined reference to `crc_ccitt'
   hppa-linux-ld: drivers/greybus/gb-beagleplay.o: in function `gb_tty_receive':
   (.text+0x91c): undefined reference to `crc_ccitt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A255628
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Nov 2023 00:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIkIUV1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699577367; x=1731113367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B85pbGRLqRXKa913Rb0TlRJ5Pow23K5E6tLr/J4dhks=;
  b=aIkIUV1Rh+JO92yV7ne+xerl7+SsYic7XnU0Mkv4TFx1Q2XUNIfTyVcd
   9BrYHZ6CNE14uMba/wkSGhPXM9tpKSzuDzylKjwibeZcHawG9/NkvvsfZ
   IUHFg7ziPJUGuAlDGx10W9+hpwZzl/6c3u63fnIqVRgNMkSntSzvoeIt9
   4Cu1x0UfF/ebP5DQQhYZPs8m9YdbqKhqnSQjLA8NhPnQUNduZoz9IWqbd
   7jCLNPisoS3ZoyuKnGHo4SsDNNEaPc7keDjbsBHoLKZzxEjUcMq/3WSPe
   5w7/P2zQZG3bRUqzbCUSd8j4Czd16/mgektRLJJVX6oyZErPIt8CuzLyH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380497777"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="380497777"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 16:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="11319551"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2023 16:49:26 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Fi7-0009JG-2J;
	Fri, 10 Nov 2023 00:49:23 +0000
Date: Fri, 10 Nov 2023 08:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/greybus/gb-beagleplay.c:173: undefined reference to
 `crc_ccitt'
Message-ID: <202311100836.JBsBIf8t-lkp@intel.com>
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
head:   a12deb44f9734dc25970c266249b272e44d3d1b5
commit: ec558bbfea671ac020a6dc6be8bf8f0ee556cce0 greybus: Add BeaglePlay Linux Driver
date:   2 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-011-20231110 (https://download.01.org/0day-ci/archive/20231110/202311100836.JBsBIf8t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100836.JBsBIf8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311100836.JBsBIf8t-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `hdlc_append_tx_u8':
>> drivers/greybus/gb-beagleplay.c:173: undefined reference to `crc_ccitt'
>> ld: drivers/greybus/gb-beagleplay.c:173: undefined reference to `crc_ccitt'
>> ld: drivers/greybus/gb-beagleplay.c:173: undefined reference to `crc_ccitt'
   ld: vmlinux.o: in function `hdlc_rx_frame':
   drivers/greybus/gb-beagleplay.c:234: undefined reference to `crc_ccitt'


vim +173 drivers/greybus/gb-beagleplay.c

ec558bbfea671a Ayush Singh 2023-10-17  170  
ec558bbfea671a Ayush Singh 2023-10-17  171  static void hdlc_append_tx_u8(struct gb_beagleplay *bg, u8 value)
ec558bbfea671a Ayush Singh 2023-10-17  172  {
ec558bbfea671a Ayush Singh 2023-10-17 @173  	bg->tx_crc = crc_ccitt(bg->tx_crc, &value, 1);
ec558bbfea671a Ayush Singh 2023-10-17  174  	hdlc_append_escaped(bg, value);
ec558bbfea671a Ayush Singh 2023-10-17  175  }
ec558bbfea671a Ayush Singh 2023-10-17  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

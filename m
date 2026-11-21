Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272562;
	b=axrqbNf8uCpv19GAR3cF9isg4htUgEQ6uX0qcqhYBXMUpk0k7zyvWJmBNyLvUKSgNYAw
	 Rn5QluXG2YJ2/PB0rxaGd1xq1AFFtNAX/Il2albnHGM9+z3z19frPlcmxJfyMaZu3xte7
	 QWgxOAnd3B5gK8qyxqiwPWmzkjywN39ezS0j8O1QSFmO0v/4RSNIW6r+tSKmxGZamkeFw
	 YQBFq7fYUtkmo+vFlmcyOKLwcYtjmkgiK0vTfsJS2G6wFlifRoCIYq1xEcKlFYta0ewjV
	 anR2zpNLr31dk9DJqnfR8ldfm1pqXu/Dgo4cCcHfUVCVyoAv67QNYbZO6uJWmwJfWNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272562;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=jEwafFrLi5dnJi2v9Np1gJOz7xF59nw+q6LvGozZ+n0=;
	b=v21eEU/Qk9nTwzwbVtcn8rYgeJh73fT2NK7h0x5IBrlweRw0Kei1pHnsg3nTRgUmoL+g
	 8ikKcl5vcxS9AmmVmYj931gIE5ofvVn9RIZxhCq1frcjyhwyeg2Kovtn+XrS+WaQi4Sqe
	 aSDhAcl8TvyEyPQxd7TuWrPEG6ouYuGXtMg+mbZ60mPz102Gf5mP2zPm5ImJsbVAIFlrV
	 a9LeIzqLFahZyUTbneGmAK7RM+eAuq9cQqncybxQUHauA2yQPnT4zHh1MCmX7w3GfC+5z
	 4JC1dOtnu8tsPg7CjlUF9clwTcpoHi5T8Qi2QIr0E/vAIFFslg3FNUSsLV9h1i4G1bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tz06WEXL;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3549606A32A
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 14:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3549606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tz06WEXL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795272560; x=1826808560;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lIRZhtJPXtR8ybVt6Cgiuw6UZgJKUuyKerOiWA03R6A=;
  b=Tz06WEXLpYrS3bfHJzDI2JhjlTkx1lVQEmrOoeMT872kzXDjtIaYPHWu
   HhxDZASRuUP0lQeV4Xc6n6Ms0dGas04QRLmczWlR9QvECdkqPdP+2wC/p
   gOq2RXihu0FQxuGlQijiDwhL1W5yrELUfksS3t2CHs4NmbkaYDcWlh+8K
   3hby1iydp8Wvl/XuWu51tQhpxz0DPybqUQXaWyDww7kWXWYLKLv4FNhfB
   ZPvHF2b2QgsYwXFvzqummOlmQfVDVf3y9D+/WENQWOrkEApDUGd5jXOMb
   hFLb+nIzT84aZCSVPNGnhQ3ddgiWOknxvLRtwbQQNJX5sxZGrLXEknRek
   A==;
X-CSE-ConnectionGUID: lSuqHlxySLGgTyYw6bvOiQ==
X-CSE-MsgGUID: a1J6IR/KRouGyZu/Ex9ZyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="3981048"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="3981048"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 06:49:20 -0800
X-CSE-ConnectionGUID: DdKl9VWnTKWzg57+AjPurA==
X-CSE-MsgGUID: kTMZF2zCRVKOfAFHcdRM6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10710901"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Nov 2026 06:49:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUmOy-00000001K9t-2Zgl;
	Sat, 21 Nov 2026 14:49:16 +0000
Date: Sat, 21 Nov 2026 22:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC wireless-next 2/4] wifi: b43: TX descriptor and TX
 status for the AC microcode
Message-ID: <202611212241.PowLQ6wI-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261112175640.40603-3-gonsolo@gmail.com>
References: <20261112175640.40603-3-gonsolo@gmail.com>
TO: Andreas Wendleder <gonsolo@gmail.com>

Hi Andreas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Wendleder/wifi-b43-11ac-chanspec-for-the-AC-microcode/20261112-185637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261112175640.40603-3-gonsolo%40gmail.com
patch subject: [PATCH RFC wireless-next 2/4] wifi: b43: TX descriptor and TX status for the AC microcode
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20261121/202611212241.PowLQ6wI-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611212241.PowLQ6wI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611212241.PowLQ6wI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/broadcom/b43/main.c:44:
   drivers/net/wireless/broadcom/b43/xmit.h: In function 'b43_txhdr_size':
>> drivers/net/wireless/broadcom/b43/xmit.h:202:13: error: implicit declaration of function 'b43_ucode_is_ac' [-Wimplicit-function-declaration]
     202 |         if (b43_ucode_is_ac(dev))
         |             ^~~~~~~~~~~~~~~


vim +/b43_ucode_is_ac +202 drivers/net/wireless/broadcom/b43/xmit.h

6e7ab9ca854ca2 drivers/net/wireless/broadcom/b43/xmit.h Andreas Wendleder 2026-11-12  198  
eb189d8bc9824b drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  199  static inline
eb189d8bc9824b drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  200  size_t b43_txhdr_size(struct b43_wldev *dev)
eb189d8bc9824b drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  201  {
6e7ab9ca854ca2 drivers/net/wireless/broadcom/b43/xmit.h Andreas Wendleder 2026-11-12 @202  	if (b43_ucode_is_ac(dev))
6e7ab9ca854ca2 drivers/net/wireless/broadcom/b43/xmit.h Andreas Wendleder 2026-11-12  203  		return B43_TXH_AC_LEN;
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  204  	switch (dev->fw.hdr_format) {
5d852905561a97 drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  205  	case B43_FW_HDR_598:
5d852905561a97 drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  206  		return 112 + sizeof(struct b43_plcp_hdr6);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  207  	case B43_FW_HDR_410:
eb189d8bc9824b drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  208  		return 104 + sizeof(struct b43_plcp_hdr6);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  209  	case B43_FW_HDR_351:
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  210  		return 100 + sizeof(struct b43_plcp_hdr6);
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  211  	}
efe0249b0fd1e9 drivers/net/wireless/b43/xmit.h          Rafał Miłecki     2011-08-11  212  	return 0;
eb189d8bc9824b drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  213  }
eb189d8bc9824b drivers/net/wireless/b43/xmit.h          Michael Buesch    2008-01-28  214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

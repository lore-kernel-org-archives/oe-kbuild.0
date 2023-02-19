Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43C9A29
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676797483; x=1708333483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lT+7Gua0NzHAyqTgSOk+AAQH2QsiaUZS4avThzb6z2M=;
  b=ln749Dh51iozMEFwL2ZeYCKOkLOCdFoBIP3a2rMp4OkOXoNXTlkHmqCm
   Hi0UbhPUBpfvNtZWnTLWVBzTjROJmeeyPbWooVB+SBRxOlHu5w8SDhcZx
   c9x+qtSzIoj1+P8h2XnCPoz7d8O2qHzS1OaLiR+IvlUicIzze23vTWWNc
   aXG3V9d9wuDBPfH025nY2+KaQz17c+MxMb69kCgSm5YT7VjjVRF+nGGrL
   leXO5hR0h3+0ZhA3UjXUTwgxfil6Fp0DlRvkmoIPzja2uBSlG81lBMVzB
   5RZVeX/9rhGHurYfGgIoGiYTpur8zRLYBizNRq+cHNEk+Aw65nCiUQkoB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="332241397"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="332241397"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 01:04:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="664323962"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="664323962"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Feb 2023 01:04:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTfcV-000DCn-0r;
	Sun, 19 Feb 2023 09:04:31 +0000
Date: Sun, 19 Feb 2023 17:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c:29
 rvu_mcs_set_lmac_bmap() error: uninitialized symbol 'lmac_bmap'.
Message-ID: <202302191621.sVquZwLz-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Geetha sowjanya <gakula@marvell.com>
CC: Vamsi Attunuru <vattunuru@marvell.com>
CC: Sunil Goutham <sgoutham@marvell.com>
CC: Subbaraya Sundeep <sbhatta@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: ca7f49ff884677f97858c3934806e0e666425af0 octeontx2-af: cn10k: Introduce driver for macsec block.
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191621.sVquZwLz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191621.sVquZwLz-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c:29 rvu_mcs_set_lmac_bmap() error: uninitialized symbol 'lmac_bmap'.

vim +/lmac_bmap +29 drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c

ca7f49ff884677 Geetha sowjanya 2022-10-01  15  
ca7f49ff884677 Geetha sowjanya 2022-10-01  16  static void rvu_mcs_set_lmac_bmap(struct rvu *rvu)
ca7f49ff884677 Geetha sowjanya 2022-10-01  17  {
ca7f49ff884677 Geetha sowjanya 2022-10-01  18  	struct mcs *mcs = mcs_get_pdata(0);
ca7f49ff884677 Geetha sowjanya 2022-10-01  19  	unsigned long lmac_bmap;
ca7f49ff884677 Geetha sowjanya 2022-10-01  20  	int cgx, lmac, port;
ca7f49ff884677 Geetha sowjanya 2022-10-01  21  
ca7f49ff884677 Geetha sowjanya 2022-10-01  22  	for (port = 0; port < mcs->hw->lmac_cnt; port++) {
ca7f49ff884677 Geetha sowjanya 2022-10-01  23  		cgx = port / rvu->hw->lmac_per_cgx;
ca7f49ff884677 Geetha sowjanya 2022-10-01  24  		lmac = port % rvu->hw->lmac_per_cgx;
ca7f49ff884677 Geetha sowjanya 2022-10-01  25  		if (!is_lmac_valid(rvu_cgx_pdata(cgx, rvu), lmac))
ca7f49ff884677 Geetha sowjanya 2022-10-01  26  			continue;
ca7f49ff884677 Geetha sowjanya 2022-10-01  27  		set_bit(port, &lmac_bmap);
ca7f49ff884677 Geetha sowjanya 2022-10-01  28  	}
ca7f49ff884677 Geetha sowjanya 2022-10-01 @29  	mcs->hw->lmac_bmap = lmac_bmap;
ca7f49ff884677 Geetha sowjanya 2022-10-01  30  }
ca7f49ff884677 Geetha sowjanya 2022-10-01  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

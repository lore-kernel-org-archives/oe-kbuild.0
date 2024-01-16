Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C7B1C69E
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jan 2024 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuNr7i0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705422704; x=1736958704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dSIjtlKJYNvKNsDlwo9GSWC9jabZbTfD01FBbtYjnaA=;
  b=CuNr7i0OK1a1wQBkdB4RAI4m4ezAZlhC6oImx4fQhCJn6BWjoS5n04Ak
   4lyYjAIAa5+MqUzBbBSH1z/WMInqdXPEBggo2hOn17q+VidQq4rrLQ8P3
   2jsGAIcuVrpczSTjEAlm4kYemVOiVHUQA+b66Mhq8/W9M2j5xsuWn/pjK
   l11mw7DfP761bRodS3JZmrtbKxg58fBzWgMKjfqIvWJ0iHy2IFuaxsoeC
   Nnre6YJN0XVHsQQMZyPaT2hO7GP60yyj6dkOTXMK8Ljg1I8m+ISWwSD/U
   yhC7lt/2UzJwP2XmBNIYv3gkvMEP0W/MXMCOqBNODO3zdJumyj1qoP+lw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6627583"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="6627583"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 08:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="907424152"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="907424152"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jan 2024 08:31:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPmLL-0000wI-22;
	Tue, 16 Jan 2024 16:31:15 +0000
Date: Wed, 17 Jan 2024 00:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [kvalo-ath:ath-qca 50/75]
 drivers/net/wireless/ath/ath11k/mac.c:7620:24-26: WARNING opportunity for
 min()
Message-ID: <202401170009.vwFqcVry-lkp@intel.com>
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
CC: Kalle Valo <kvalo@codeaurora.org>
CC: ath10k@lists.infradead.org
TO: Wen Gong <quic_wgong@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>
CC: Baochen Qiang <quic_bqiang@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
head:   bfd6a61f5e81a9954ba8590a38554f7310155ad2
commit: 6f4e235be6550f67791616d88682fb99f4e670e4 [50/75] wifi: ath11k: add parse of transmit power envelope element
:::::: branch date: 4 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-052-20240116 (https://download.01.org/0day-ci/archive/20240117/202401170009.vwFqcVry-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401170009.vwFqcVry-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath11k/mac.c:7620:24-26: WARNING opportunity for min()
   drivers/net/wireless/ath/ath11k/mac.c:7629:24-26: WARNING opportunity for min()

vim +7620 drivers/net/wireless/ath/ath11k/mac.c

e7495035286aae Carl Huang 2020-08-17  7610  
6f4e235be6550f Wen Gong   2024-01-11  7611  static u8 ath11k_mac_get_tpe_count(u8 txpwr_intrprt, u8 txpwr_cnt)
6f4e235be6550f Wen Gong   2024-01-11  7612  {
6f4e235be6550f Wen Gong   2024-01-11  7613  	switch (txpwr_intrprt) {
6f4e235be6550f Wen Gong   2024-01-11  7614  	/* Refer "Table 9-276-Meaning of Maximum Transmit Power Count subfield
6f4e235be6550f Wen Gong   2024-01-11  7615  	 * if the Maximum Transmit Power Interpretation subfield is 0 or 2" of
6f4e235be6550f Wen Gong   2024-01-11  7616  	 * "IEEE Std 802.11ax 2021".
6f4e235be6550f Wen Gong   2024-01-11  7617  	 */
6f4e235be6550f Wen Gong   2024-01-11  7618  	case IEEE80211_TPE_LOCAL_EIRP:
6f4e235be6550f Wen Gong   2024-01-11  7619  	case IEEE80211_TPE_REG_CLIENT_EIRP:
6f4e235be6550f Wen Gong   2024-01-11 @7620  		txpwr_cnt = txpwr_cnt <= 3 ? txpwr_cnt : 3;
6f4e235be6550f Wen Gong   2024-01-11  7621  		txpwr_cnt = txpwr_cnt + 1;
6f4e235be6550f Wen Gong   2024-01-11  7622  		break;
6f4e235be6550f Wen Gong   2024-01-11  7623  	/* Refer "Table 9-277-Meaning of Maximum Transmit Power Count subfield
6f4e235be6550f Wen Gong   2024-01-11  7624  	 * if Maximum Transmit Power Interpretation subfield is 1 or 3" of
6f4e235be6550f Wen Gong   2024-01-11  7625  	 * "IEEE Std 802.11ax 2021".
6f4e235be6550f Wen Gong   2024-01-11  7626  	 */
6f4e235be6550f Wen Gong   2024-01-11  7627  	case IEEE80211_TPE_LOCAL_EIRP_PSD:
6f4e235be6550f Wen Gong   2024-01-11  7628  	case IEEE80211_TPE_REG_CLIENT_EIRP_PSD:
6f4e235be6550f Wen Gong   2024-01-11  7629  		txpwr_cnt = txpwr_cnt <= 4 ? txpwr_cnt : 4;
6f4e235be6550f Wen Gong   2024-01-11  7630  		txpwr_cnt = txpwr_cnt ? (BIT(txpwr_cnt - 1)) : 1;
6f4e235be6550f Wen Gong   2024-01-11  7631  		break;
6f4e235be6550f Wen Gong   2024-01-11  7632  	}
6f4e235be6550f Wen Gong   2024-01-11  7633  
6f4e235be6550f Wen Gong   2024-01-11  7634  	return txpwr_cnt;
6f4e235be6550f Wen Gong   2024-01-11  7635  }
6f4e235be6550f Wen Gong   2024-01-11  7636  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

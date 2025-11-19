Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373102EA158
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548664; cv=none; b=jjbyRxtuB3oYrM3LQDyBblQCTV1zyPH+Rz2QQAjBo0u55CwgZcQjEYbdKWn8Tofgnu5w9KWOpg2iSdG5vCrRZZId8z/MMzgLTMVYEdWAn5Hok7WRtihvCTrcnftBCWMc4D8qBVa0mx8WjvtEzB0bW6eeXBdmDTskTX6ToMuxuC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548664; c=relaxed/simple;
	bh=fNpxUluKyWmqzu78z9w0HvOCcG+EL6M0SDEZvHdS+Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XIepQv4iWdLz6WroEw/nc+W9sqCSH6zKWF3G+ram37CYcpgcHeNuXiH1pNSOpQlYuHo48UkBd832Tkjst9b0TLF/i9TRVRUa2r7V9NGWMdXkLFtjoDAlohxtxbTGhfLecB04kRSItroQbMamgk4A34pFo2Xi/oDKbVmB2d3irz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QI5eQh5M; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QI5eQh5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763548662; x=1795084662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fNpxUluKyWmqzu78z9w0HvOCcG+EL6M0SDEZvHdS+Vo=;
  b=QI5eQh5Mv81Wwk0wCdGQJyyyPSXo1z1JwkTljG6JU+Mh4CFHkYs2TqI5
   8m6SAr4LqmuKiHomxvZfo3donsu+T4v4wWlwo9z4K+hcJ7wPrmJCy7uKl
   T9PZFGmsDYhlJo9ECmjFpKNq50NM1q0ry9RzbLYZZLHgV6C7/YU+WLIEX
   JAnt2hAv2EYOwa8HGKgw4scz2bGNPZ4/NrGNqGmT0nc5C1ka77I9Vlt6P
   uMyuu4VSmmDRo72X4QyHNClnek0r5raplFAHeTRh22R5uL1cgBYV6YMGW
   AuDfGEHcrqAE0XbJR5Y/d4kToffet5xs3Pmfsm1+/BDwshz43/uWZLIlu
   g==;
X-CSE-ConnectionGUID: E8Zmyr6RQSGLS5YVHQR26A==
X-CSE-MsgGUID: 675AbVetQpiXFbFiM0eAqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64782718"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="64782718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 02:37:37 -0800
X-CSE-ConnectionGUID: IJXLRLH1SAeyXW+wx1p74A==
X-CSE-MsgGUID: SE9IjQd3QIu7lm/g0O3Mfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228366671"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2025 02:37:34 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLfZ5-0002m9-17;
	Wed, 19 Nov 2025 10:37:31 +0000
Date: Wed, 19 Nov 2025 18:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] crypto: sa2ul: Add error handling for DMA metadata
 retrieval
Message-ID: <202511191706.iBCITtX2-lkp@intel.com>
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
In-Reply-To: <20251117023117.90-1-vulab@iscas.ac.cn>
References: <20251117023117.90-1-vulab@iscas.ac.cn>
TO: Haotian Zhang <vulab@iscas.ac.cn>
TO: herbert@gondor.apana.org.au
TO: davem@davemloft.net
CC: linux-crypto@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Haotian Zhang <vulab@iscas.ac.cn>

Hi Haotian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotian-Zhang/crypto-sa2ul-Add-error-handling-for-DMA-metadata-retrieval/20251117-103258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20251117023117.90-1-vulab%40iscas.ac.cn
patch subject: [PATCH v2] crypto: sa2ul: Add error handling for DMA metadata retrieval
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r073-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191706.iBCITtX2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511191706.iBCITtX2-lkp@intel.com/

smatch warnings:
drivers/crypto/sa2ul.c:1064 sa_aes_dma_in_callback() warn: 'mdptr' can also be NULL
drivers/crypto/sa2ul.c:1394 sa_sha_dma_in_callback() warn: 'mdptr' can also be NULL
drivers/crypto/sa2ul.c:1709 sa_aead_dma_in_callback() warn: 'mdptr' can also be NULL

vim +/mdptr +1064 drivers/crypto/sa2ul.c

00c9211f60db2d Peter Ujfalusi 2020-09-23  1038  
7694b6ca649fea Keerthy        2020-07-13  1039  static void sa_aes_dma_in_callback(void *data)
7694b6ca649fea Keerthy        2020-07-13  1040  {
aedf818b1f1965 Yu Zhe         2023-03-17  1041  	struct sa_rx_data *rxd = data;
7694b6ca649fea Keerthy        2020-07-13  1042  	struct skcipher_request *req;
7694b6ca649fea Keerthy        2020-07-13  1043  	u32 *result;
7694b6ca649fea Keerthy        2020-07-13  1044  	__be32 *mdptr;
7694b6ca649fea Keerthy        2020-07-13  1045  	size_t ml, pl;
7694b6ca649fea Keerthy        2020-07-13  1046  	int i;
7694b6ca649fea Keerthy        2020-07-13  1047  
00c9211f60db2d Peter Ujfalusi 2020-09-23  1048  	sa_sync_from_device(rxd);
7694b6ca649fea Keerthy        2020-07-13  1049  	req = container_of(rxd->req, struct skcipher_request, base);
7694b6ca649fea Keerthy        2020-07-13  1050  
7694b6ca649fea Keerthy        2020-07-13  1051  	if (req->iv) {
7694b6ca649fea Keerthy        2020-07-13  1052  		mdptr = (__be32 *)dmaengine_desc_get_metadata_ptr(rxd->tx_in, &pl,
7694b6ca649fea Keerthy        2020-07-13  1053  							       &ml);
90d79e983588a8 Haotian Zhang  2025-11-17  1054  		if (IS_ERR(mdptr)) {
90d79e983588a8 Haotian Zhang  2025-11-17  1055  			dev_err(rxd->ddev, "Failed to get AES RX metadata pointer: %ld\n",
90d79e983588a8 Haotian Zhang  2025-11-17  1056  				PTR_ERR(mdptr));
90d79e983588a8 Haotian Zhang  2025-11-17  1057  			sa_free_sa_rx_data(rxd);
90d79e983588a8 Haotian Zhang  2025-11-17  1058  			skcipher_request_complete(req, PTR_ERR(mdptr));
90d79e983588a8 Haotian Zhang  2025-11-17  1059  			return;
90d79e983588a8 Haotian Zhang  2025-11-17  1060  		}
7694b6ca649fea Keerthy        2020-07-13  1061  		result = (u32 *)req->iv;
7694b6ca649fea Keerthy        2020-07-13  1062  
7694b6ca649fea Keerthy        2020-07-13  1063  		for (i = 0; i < (rxd->enc_iv_size / 4); i++)
7694b6ca649fea Keerthy        2020-07-13 @1064  			result[i] = be32_to_cpu(mdptr[i + rxd->iv_idx]);
7694b6ca649fea Keerthy        2020-07-13  1065  	}
7694b6ca649fea Keerthy        2020-07-13  1066  
00c9211f60db2d Peter Ujfalusi 2020-09-23  1067  	sa_free_sa_rx_data(rxd);
7694b6ca649fea Keerthy        2020-07-13  1068  
7694b6ca649fea Keerthy        2020-07-13  1069  	skcipher_request_complete(req, 0);
7694b6ca649fea Keerthy        2020-07-13  1070  }
7694b6ca649fea Keerthy        2020-07-13  1071  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

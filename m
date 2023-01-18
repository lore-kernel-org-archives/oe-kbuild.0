Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41F03C21
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674062582; x=1705598582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDJ/zN60NB1RG+eZvCLbcggAZjWwPIINV5vvLv38YAA=;
  b=hEql+UbHYARyZf8NNxs9j/Fe9xsIrXRvWCH2i2stWM3G30LnFCzG1TPL
   DxPnjpfCIwP5pPxw9pWJwBzQW5eUVt6Z0WaMbXKPdGW7NFc9QC3fP62y/
   Tg8L2dmbNuGbRtft30iU9E6IWq6AvEG4i2ZKu9Z7eqWglqaNeA/eEM+jF
   hUigifp8Ue48Rfie2xUdz4LfIPoRNHRiVH7YLFvWTM4e4UfAgM6yKzOew
   5ENx66tdhmtIydTy546PwKK3nxbQYr0/3bbBgx6j+zztDQTg+LSOzY/4n
   ynd+YFewoQV1UNI1U3b3CCGfJCyU4fX8+OTc0vcWhRPUzXNZh2iKIJnbt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326306171"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="326306171"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 09:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="690293682"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="690293682"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Jan 2023 09:22:59 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIC9K-0000ZW-2v;
	Wed, 18 Jan 2023 17:22:58 +0000
Date: Thu, 19 Jan 2023 01:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ammarfaizi2-block:kvalo/ath/pending 38/57]
 drivers/net/wireless/ath/ath10k/ce.c:80:19: warning: unused function
 'shadow_dst_wr_ind_addr'
Message-ID: <202301190132.Qut2rBZK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
TO: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://github.com/ammarfaizi2/linux-block kvalo/ath/pending
head:   25844d62c9351ba63242a700097adff33329eeb8
commit: 179340dd4b39932a16f7db59998942494046b5a1 [38/57] wifi: ath10k: Remove the unused function ath10k_ce_shadow_src_ring_write_index_set()
:::::: branch date: 10 hours ago
:::::: commit date: 29 hours ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230119/202301190132.Qut2rBZK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/179340dd4b39932a16f7db59998942494046b5a1
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block kvalo/ath/pending
        git checkout 179340dd4b39932a16f7db59998942494046b5a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/wireless/ath/ath10k/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath10k/ce.c:80:19: warning: unused function 'shadow_dst_wr_ind_addr' [-Wunused-function]
   static inline u32 shadow_dst_wr_ind_addr(struct ath10k *ar,
                     ^
   drivers/net/wireless/ath/ath10k/ce.c:127:1: warning: unused function 'ath10k_get_ring_byte' [-Wunused-function]
   ath10k_get_ring_byte(unsigned int offset,
   ^
   drivers/net/wireless/ath/ath10k/ce.c:441:20: warning: unused function 'ath10k_ce_error_intr_enable' [-Wunused-function]
   static inline void ath10k_ce_error_intr_enable(struct ath10k *ar,
                      ^
   3 warnings generated.


vim +/shadow_dst_wr_ind_addr +80 drivers/net/wireless/ath/ath10k/ce.c

b7ba83f7c414e5 Rakesh Pillai 2018-04-17   79  
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  @80  static inline u32 shadow_dst_wr_ind_addr(struct ath10k *ar,
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   81  					 struct ath10k_ce_pipe *ce_state)
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   82  {
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   83  	u32 ce_id = ce_state->id;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   84  	u32 addr = 0;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   85  
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   86  	switch (ce_id) {
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   87  	case 1:
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   88  		addr = 0x00032034;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   89  		break;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   90  	case 2:
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   91  		addr = 0x00032038;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   92  		break;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   93  	case 5:
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   94  		addr = 0x00032044;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   95  		break;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   96  	case 7:
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   97  		addr = 0x0003204C;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   98  		break;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17   99  	case 8:
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  100  		addr = 0x00032050;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  101  		break;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  102  	case 9:
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  103  		addr = 0x00032054;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  104  		break;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  105  	case 10:
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  106  		addr = 0x00032058;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  107  		break;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  108  	case 11:
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  109  		addr = 0x0003205C;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  110  		break;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  111  	default:
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  112  		ath10k_warn(ar, "invalid CE id: %d", ce_id);
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  113  		break;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  114  	}
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  115  
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  116  	return addr;
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  117  }
b7ba83f7c414e5 Rakesh Pillai 2018-04-17  118  

:::::: The code at line 80 was first introduced by commit
:::::: b7ba83f7c414e583fdf82a1b1b95d2376cdb4b45 ath10k: add support for shadow register for WNC3990

:::::: TO: Rakesh Pillai <pillair@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

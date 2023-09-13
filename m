Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE773803
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 03:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694575875; x=1726111875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jKo6+E1pXt8QrNiBK5Hyqt40VCumaheopCNhpfwOzCs=;
  b=XeF/mwl7IvddyaSX3nUg9eRvP6IainG9xbtNDVzOK6nZq6xzoT7gzofA
   JAks7JlYriSaxNBJejI7jeSjO2yuIG/abMnmg61KAFjL7sfYOOByv98Uw
   LgLV/fnx8Zgk7GZruPqIEmlR7PfkxPAtUK+o8mensodIIzLCc0ZbySwhU
   vKpwH4iEQFXTPi47oyyDlhSi9md6jpwhg3pU9zTFHS71f/RpjEV5lI/jo
   xem7LgJl6e2rY08uNrg8b6PWIJgBTl8kS1yGrCNT9iVllGqXLN5Q3++46
   Z5dUi7Z7n7EaKk6zTap38WeeRRq+hfsMpedDTL2eFJchEJHLSyRQ4Fhcf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444993338"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="444993338"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 20:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737333558"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="737333558"
Received: from lkp-server02.sh.intel.com (HELO e6439d5ea182) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Sep 2023 20:31:01 -0700
Received: from kbuild by e6439d5ea182 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgGag-00001l-2t;
	Wed, 13 Sep 2023 03:30:58 +0000
Date: Wed, 13 Sep 2023 11:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] bus: mhi: host: Add spinlock to protect WP access
 when queueing TREs
Message-ID: <202309131155.OQbvsWhZ-lkp@intel.com>
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
In-Reply-To: <1694426069-74140-2-git-send-email-quic_qianyu@quicinc.com>
References: <1694426069-74140-2-git-send-email-quic_qianyu@quicinc.com>
TO: Qiang Yu <quic_qianyu@quicinc.com>
TO: mani@kernel.org
TO: quic_jhugo@quicinc.com
CC: mhi@lists.linux.dev
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: quic_cang@quicinc.com
CC: quic_mrana@quicinc.com
CC: Bhaumik Bhatt <bbhatt@codeaurora.org>
CC: Qiang Yu <quic_qianyu@quicinc.com>

Hi Qiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc1 next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiang-Yu/bus-mhi-host-Add-spinlock-to-protect-WP-access-when-queueing-TREs/20230912-072349
base:   linus/master
patch link:    https://lore.kernel.org/r/1694426069-74140-2-git-send-email-quic_qianyu%40quicinc.com
patch subject: [PATCH 1/2] bus: mhi: host: Add spinlock to protect WP access when queueing TREs
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131155.OQbvsWhZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309131155.OQbvsWhZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309131155.OQbvsWhZ-lkp@intel.com/

smatch warnings:
drivers/bus/mhi/host/main.c:1249 mhi_gen_tre() warn: inconsistent returns '&mhi_chan->lock'.

vim +1249 drivers/bus/mhi/host/main.c

189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1199  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1200  int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1201  			struct mhi_buf_info *info, enum mhi_flags flags)
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1202  {
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1203  	struct mhi_ring *buf_ring, *tre_ring;
84f5f31f110e5e drivers/bus/mhi/host/main.c Manivannan Sadhasivam 2022-03-01  1204  	struct mhi_ring_element *mhi_tre;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1205  	struct mhi_buf_info *buf_info;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1206  	int eot, eob, chain, bei;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1207  	int ret;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1208  
c8a037317010d5 drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-09-11  1209  	/* Protect accesses for reading and incrementing WP */
c8a037317010d5 drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-09-11  1210  	write_lock_bh(&mhi_chan->lock);
c8a037317010d5 drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-09-11  1211  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1212  	buf_ring = &mhi_chan->buf_ring;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1213  	tre_ring = &mhi_chan->tre_ring;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1214  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1215  	buf_info = buf_ring->wp;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1216  	WARN_ON(buf_info->used);
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1217  	buf_info->pre_mapped = info->pre_mapped;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1218  	if (info->pre_mapped)
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1219  		buf_info->p_addr = info->p_addr;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1220  	else
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1221  		buf_info->v_addr = info->v_addr;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1222  	buf_info->cb_buf = info->cb_buf;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1223  	buf_info->wp = tre_ring->wp;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1224  	buf_info->dir = mhi_chan->dir;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1225  	buf_info->len = info->len;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1226  
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1227  	if (!info->pre_mapped) {
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1228  		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1229  		if (ret)
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1230  			return ret;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1231  	}
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1232  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1233  	eob = !!(flags & MHI_EOB);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1234  	eot = !!(flags & MHI_EOT);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1235  	chain = !!(flags & MHI_CHAIN);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1236  	bei = !!(mhi_chan->intmod);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1237  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1238  	mhi_tre = tre_ring->wp;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1239  	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1240  	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1241  	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1242  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1243  	/* increment WP */
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1244  	mhi_add_ring_element(mhi_cntrl, tre_ring);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1245  	mhi_add_ring_element(mhi_cntrl, buf_ring);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1246  
c8a037317010d5 drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-09-11  1247  	write_unlock_bh(&mhi_chan->lock);
c8a037317010d5 drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-09-11  1248  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20 @1249  	return 0;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1250  }
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

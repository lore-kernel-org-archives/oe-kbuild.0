Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC830315B2
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 17:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tq8yb/3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699377158; x=1730913158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+HkUuqkqCcsGKqmEn82uFaZh7V3F1OS3jhaQJnLrUk=;
  b=Tq8yb/3m20eEfUnC9Mv+qt53IocUpo/bRlzDzPsyK9NBGFZBcD104sjP
   oMSMDVvLPW0gPivhBfw42MmFks9RNQaLDjjPi4eXJ/B2ZuALf7WNXNE5Z
   8a1MC+8WLPxqnSnXgFS96Ar4Lr7igYnpTZw+kSb4LNwTTVr2ZBOOnSLIT
   NMr33otF226DNVUPWMVqoUCQ8eAJPA62GGx+u4a12twOSa2fFUAiQOdhl
   uPPrP+dUAyHt+Ojjkka5/MiWc4G8V6g28T7oJgZ+RgLpDw8hyiLPZirGO
   TPswqKyIHWn4ic+DP3SG8H4wfFkXiQzVpGfjtXiIsPKWpsVeprUe2LqGF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="374593137"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="374593137"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 09:12:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="906484574"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="906484574"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2023 09:12:36 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Pcw-0007Fz-28;
	Tue, 07 Nov 2023 17:12:34 +0000
Date: Wed, 8 Nov 2023 01:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/4] bus: mhi: host: Avoid processing buffer and event
 of a disable channel
Message-ID: <202311080155.MiyREgoQ-lkp@intel.com>
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
In-Reply-To: <1699341365-47737-4-git-send-email-quic_qianyu@quicinc.com>
References: <1699341365-47737-4-git-send-email-quic_qianyu@quicinc.com>
TO: Qiang Yu <quic_qianyu@quicinc.com>
TO: mani@kernel.org
TO: quic_jhugo@quicinc.com
CC: mhi@lists.linux.dev
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: quic_cang@quicinc.com
CC: quic_mrana@quicinc.com
CC: Qiang Yu <quic_qianyu@quicinc.com>

Hi Qiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mani-mhi/mhi-next]
[also build test WARNING on linus/master v6.6 next-20231107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiang-Yu/bus-mhi-host-Add-spinlock-to-protect-WP-access-when-queueing-TREs/20231107-151918
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
patch link:    https://lore.kernel.org/r/1699341365-47737-4-git-send-email-quic_qianyu%40quicinc.com
patch subject: [PATCH v3 3/4] bus: mhi: host: Avoid processing buffer and event of a disable channel
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-161-20231107 (https://download.01.org/0day-ci/archive/20231108/202311080155.MiyREgoQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080155.MiyREgoQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311080155.MiyREgoQ-lkp@intel.com/

smatch warnings:
drivers/bus/mhi/host/main.c:1257 mhi_gen_tre() warn: inconsistent returns '&mhi_chan->lock'.

vim +1257 drivers/bus/mhi/host/main.c

189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1203  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1204  int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1205  			struct mhi_buf_info *info, enum mhi_flags flags)
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1206  {
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1207  	struct mhi_ring *buf_ring, *tre_ring;
84f5f31f110e5e drivers/bus/mhi/host/main.c Manivannan Sadhasivam 2022-03-01  1208  	struct mhi_ring_element *mhi_tre;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1209  	struct mhi_buf_info *buf_info;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1210  	int eot, eob, chain, bei;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1211  	int ret;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1212  
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1213  	/* Protect accesses for reading and incrementing WP */
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1214  	write_lock_bh(&mhi_chan->lock);
6025cde6ecb13c drivers/bus/mhi/host/main.c Qiang Yu              2023-11-07  1215  	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
6025cde6ecb13c drivers/bus/mhi/host/main.c Qiang Yu              2023-11-07  1216  		return -EINVAL;
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1217  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1218  	buf_ring = &mhi_chan->buf_ring;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1219  	tre_ring = &mhi_chan->tre_ring;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1220  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1221  	buf_info = buf_ring->wp;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1222  	WARN_ON(buf_info->used);
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1223  	buf_info->pre_mapped = info->pre_mapped;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1224  	if (info->pre_mapped)
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1225  		buf_info->p_addr = info->p_addr;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1226  	else
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1227  		buf_info->v_addr = info->v_addr;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1228  	buf_info->cb_buf = info->cb_buf;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1229  	buf_info->wp = tre_ring->wp;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1230  	buf_info->dir = mhi_chan->dir;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1231  	buf_info->len = info->len;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1232  
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1233  	if (!info->pre_mapped) {
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1234  		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1235  		if (ret) {
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1236  			write_unlock_bh(&mhi_chan->lock);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1237  			return ret;
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1238  		}
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1239  	}
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1240  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1241  	eob = !!(flags & MHI_EOB);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1242  	eot = !!(flags & MHI_EOT);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1243  	chain = !!(flags & MHI_CHAIN);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1244  	bei = !!(mhi_chan->intmod);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1245  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1246  	mhi_tre = tre_ring->wp;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1247  	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
cd116318803f5e drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  1248  	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1249  	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1250  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1251  	/* increment WP */
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1252  	mhi_add_ring_element(mhi_cntrl, tre_ring);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1253  	mhi_add_ring_element(mhi_cntrl, buf_ring);
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1254  
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1255  	write_unlock_bh(&mhi_chan->lock);
da05b5d43f483c drivers/bus/mhi/host/main.c Bhaumik Bhatt         2023-11-07  1256  
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20 @1257  	return 0;
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1258  }
189ff97cca53e3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  1259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

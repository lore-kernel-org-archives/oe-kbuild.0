Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0586817E2
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 05:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676523680; x=1708059680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1rovy0yx3IkKfuSn+LCiuqe/dSS97Ke0phOdWNUptvQ=;
  b=fVn6L/QVp0RtO6BFkLxKgAAUpvMaU/TbYGGY6rrXMXS17JIR55kq1H1/
   Q3f+U132zo6LYmYzTaWv9k+Ptdq8lmTAHr7qVN7YSAlZW4T6cLViyyDfC
   Vv9Uk1mkyUY+a3EtD/lGVHK3BXWR5zycYIFVKPqLUHR+Pv6JdgU058UoA
   6SQm46yIJur8v0gnIyv8gd0aECLkaQCX+er2kjollwt63iUjPBQoI0w01
   plpBgvHf/1KRtfbyoHgpvB/cfMorlrlktvkwKWI8FCqMM3C2WMQWU80Wt
   0XGtFZQuUzOb1ICdJ8lj6IvEgurbxH7V9bPQfHnfJutEVBELUIyivdyHg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="330266904"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="330266904"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 21:01:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="915537054"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="915537054"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Feb 2023 21:01:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSWOR-000A1Z-2n;
	Thu, 16 Feb 2023 05:01:15 +0000
Date: Thu, 16 Feb 2023 13:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2789
 iwl_mvm_resume_firmware() error: uninitialized symbol 'd3_status'.
Message-ID: <202302161213.Vf1bJpE3-lkp@intel.com>
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
TO: "Haim, Dreyfuss" <haim.dreyfuss@intel.com>
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1c04510f521e853019afeca2a5991a5ef8d6a5b
commit: b75dac847c9453d017d463a97e253416abf93d36 wifi: iwlwifi: mvm: trigger resume flow before wait for notifications
date:   5 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230216/202302161213.Vf1bJpE3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302161213.Vf1bJpE3-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2789 iwl_mvm_resume_firmware() error: uninitialized symbol 'd3_status'.

vim +/d3_status +2789 drivers/net/wireless/intel/iwlwifi/mvm/d3.c

4da46a06d4430a Haim Dreyfuss  2022-09-06  2773  
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2774  static int iwl_mvm_resume_firmware(struct iwl_mvm *mvm, bool test)
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2775  {
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2776  	int ret;
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2777  	enum iwl_d3_status d3_status;
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2778  	struct iwl_host_cmd cmd = {
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2779  			.id = D0I3_END_CMD,
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2780  			.flags = CMD_WANT_SKB | CMD_SEND_IN_D3,
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2781  		};
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2782  	bool reset = fw_has_capa(&mvm->fw->ucode_capa,
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2783  				 IWL_UCODE_TLV_CAPA_CNSLDTD_D3_D0_IMG);
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2784  
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2785  	ret = iwl_trans_d3_resume(mvm->trans, &d3_status, test, !reset);
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2786  	if (ret)
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2787  		return ret;
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2788  
b75dac847c9453 Haim, Dreyfuss 2022-09-06 @2789  	if (d3_status != IWL_D3_STATUS_ALIVE) {
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2790  		IWL_INFO(mvm, "Device was reset during suspend\n");
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2791  		return -ENOENT;
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2792  	}
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2793  
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2794  	/*
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2795  	 * We should trigger resume flow using command only for 22000 family
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2796  	 * AX210 and above don't need the command since they have
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2797  	 * the doorbell interrupt.
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2798  	 */
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2799  	if (mvm->trans->trans_cfg->device_family <= IWL_DEVICE_FAMILY_22000 &&
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2800  	    fw_has_capa(&mvm->fw->ucode_capa, IWL_UCODE_TLV_CAPA_D0I3_END_FIRST)) {
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2801  		ret = iwl_mvm_send_cmd(mvm, &cmd);
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2802  		if (ret < 0)
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2803  			IWL_ERR(mvm, "Failed to send D0I3_END_CMD first (%d)\n",
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2804  				ret);
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2805  	}
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2806  
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2807  	return ret;
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2808  }
b75dac847c9453 Haim, Dreyfuss 2022-09-06  2809  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

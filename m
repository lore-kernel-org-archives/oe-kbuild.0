Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AC67B
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Feb 2023 00:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676419619; x=1707955619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2c/xVWXaJ07imWlISFnV3teD2FpUpWq6Zugvdw7u9w=;
  b=Z2vNudbGB7z7qrf81kchXbvXhQiZHc466WUrxWfF3DnvJQkzmqpTIbiZ
   2n9SEX6YsKex6ZH9IcEw/YFFJ0q6wtpRJkhE5KPeGqTEPQOsuEol/StxV
   s8RvhhgLLV8pDFhFN9BxPe+Li3A+t4AHVKlYinjoCsXCWMfHnHt+uLH44
   Xd7zJlFEaDMVMT2YC7ayrvxWsPISIXVBl9jKvRko38x5M+B/gwR7S3ZK7
   dvuiwaGs53INiXlX8dyfre+sXMB0UqYXOTdoKbv1pMn/I2/gdlRI4yOJj
   27kHfsVz8i7pgYWVSaRM+sibT0ASKPk9uC7Qlw9yuvrDRqGD2KvaFHhqS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="332615003"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="332615003"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 16:06:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699745246"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="699745246"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 16:06:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS5JZ-0008rw-0o;
	Wed, 15 Feb 2023 00:06:25 +0000
Date: Wed, 15 Feb 2023 08:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2789
 iwl_mvm_resume_firmware() error: uninitialized symbol 'd3_status'.
Message-ID: <202302150707.FmnQs6Jt-lkp@intel.com>
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
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230215/202302150707.FmnQs6Jt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302150707.FmnQs6Jt-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2789 iwl_mvm_resume_firmware() error: uninitialized symbol 'd3_status'.

vim +/d3_status +2789 drivers/net/wireless/intel/iwlwifi/mvm/d3.c

4da46a06d4430a1 Haim Dreyfuss  2022-09-06  2773  
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2774  static int iwl_mvm_resume_firmware(struct iwl_mvm *mvm, bool test)
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2775  {
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2776  	int ret;
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2777  	enum iwl_d3_status d3_status;
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2778  	struct iwl_host_cmd cmd = {
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2779  			.id = D0I3_END_CMD,
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2780  			.flags = CMD_WANT_SKB | CMD_SEND_IN_D3,
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2781  		};
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2782  	bool reset = fw_has_capa(&mvm->fw->ucode_capa,
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2783  				 IWL_UCODE_TLV_CAPA_CNSLDTD_D3_D0_IMG);
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2784  
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2785  	ret = iwl_trans_d3_resume(mvm->trans, &d3_status, test, !reset);
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2786  	if (ret)
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2787  		return ret;
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2788  
b75dac847c9453d Haim, Dreyfuss 2022-09-06 @2789  	if (d3_status != IWL_D3_STATUS_ALIVE) {
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2790  		IWL_INFO(mvm, "Device was reset during suspend\n");
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2791  		return -ENOENT;
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2792  	}
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2793  
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2794  	/*
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2795  	 * We should trigger resume flow using command only for 22000 family
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2796  	 * AX210 and above don't need the command since they have
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2797  	 * the doorbell interrupt.
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2798  	 */
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2799  	if (mvm->trans->trans_cfg->device_family <= IWL_DEVICE_FAMILY_22000 &&
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2800  	    fw_has_capa(&mvm->fw->ucode_capa, IWL_UCODE_TLV_CAPA_D0I3_END_FIRST)) {
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2801  		ret = iwl_mvm_send_cmd(mvm, &cmd);
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2802  		if (ret < 0)
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2803  			IWL_ERR(mvm, "Failed to send D0I3_END_CMD first (%d)\n",
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2804  				ret);
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2805  	}
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2806  
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2807  	return ret;
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2808  }
b75dac847c9453d Haim, Dreyfuss 2022-09-06  2809  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50019146C
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 22:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718663058; cv=none; b=o40311G1DjFGwF0VFS+HLKMtGSAE2fF3W0DQ61bHB7CiHCsifAeO2VVOkiaTZBt4xN5Dh2vpyW3ZqWpVPRb84IHxcHIUIepc7Mp34AKNOn3Pf62R7wQcHeJyQIb0VKCxblEpCVWkelYOWGvktAgCeBoK00NWy9FpmfE7XxLDAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718663058; c=relaxed/simple;
	bh=nwKhSBAsVOCDlnPhMhzKX+Q8o048E1Wyd47ztEWBbPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pQbXGfcSIIXZltgBW4SIVSn0eTRTV6u0c0u8yAtYqejRLyOgN1jo7oxnqWHvN1HK2bn1oNdyJoJFHxsrg/zOKv6c/T80z9nxw01G/5lRTlfhAx3tkSQA0AwP5hCZmSQpD67VRxNWyqZJZ1kz8NorVGmYOguyIM03i6aS14ZYEcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0GMUeob; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0GMUeob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718663056; x=1750199056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nwKhSBAsVOCDlnPhMhzKX+Q8o048E1Wyd47ztEWBbPA=;
  b=h0GMUeobTa6p8YPkN0pWqxsT8oQUjHBEKHVsrYLSIoQ8M/3DD42Y2wOv
   VUk7fZQ2n9MV+GfNDUtEuRYtgswi8JjJlAlSeDsPQYZjPY1mn7mPTn59x
   x+yRuDM/5+FNd3l/qvJhgGPrrCb0vLpHmYPYNxQ3DY9cc131Gny36CPOu
   r+6gkKu1Ou1zC2LP9Ov1yleoc6efwUprNl1q/OQUuTRdSsXZT/l+o5a9o
   WbQO+uKyFZSuCCEf+UWh3nOAusDOPbR8IfX9luMCY2TkxGYLcr3T3mVNp
   aYaqIJzDurw/qlvsx/PJNayloHQtIE4mznsHidlfNN/oxtuxIoP3B1kxj
   g==;
X-CSE-ConnectionGUID: ZvYZ8cwbTFmFmUacihB/Hw==
X-CSE-MsgGUID: fhkGPfKxR9+fnu+eQEQz7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15657822"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="15657822"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 15:24:15 -0700
X-CSE-ConnectionGUID: Z96yXUXdTj27G25JGHPFRQ==
X-CSE-MsgGUID: BLyzEbwTQOOwt8wTyrP0mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="46248635"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jun 2024 15:24:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJKln-0004wb-2u;
	Mon, 17 Jun 2024 22:24:11 +0000
Date: Tue, 18 Jun 2024 06:23:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [wireless:main 3/8]
 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:1279 iwl_mvm_stop_roc()
 warn: inconsistent returns '&mvm->mutex'.
Message-ID: <202406180614.46Y2Gxz4-lkp@intel.com>
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
CC: Johannes Berg <johannes@sipsolutions.net>
CC: Kalle Valo <kvalo@kernel.org>
CC: linux-wireless@vger.kernel.org
TO: Shaul Triebitz <shaul.triebitz@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git main
head:   0d9c2beed116e623ac30810d382bd67163650f98
commit: d792011b6c282bfb787eb2893538e5e336d5e982 [3/8] wifi: iwlwifi: mvm: unlock mvm mutex
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20240618 (https://download.01.org/0day-ci/archive/20240618/202406180614.46Y2Gxz4-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406180614.46Y2Gxz4-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:1279 iwl_mvm_stop_roc() warn: inconsistent returns '&mvm->mutex'.

vim +1279 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c

67ac248e4db0a7 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Shaul Triebitz        2023-10-11  1224  
fe959c7b20495f drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1225  void iwl_mvm_stop_roc(struct iwl_mvm *mvm, struct ieee80211_vif *vif)
305d236e83b664 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1226  {
305d236e83b664 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1227  	struct iwl_mvm_vif *mvmvif;
305d236e83b664 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1228  	struct iwl_mvm_time_event_data *te_data;
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/time-event.c       Johannes Berg         2013-01-24  1229  
a1efeb82308402 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Yedidya Benshimol     2024-05-05  1230  	mutex_lock(&mvm->mutex);
a1efeb82308402 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Yedidya Benshimol     2024-05-05  1231  
fe959c7b20495f drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1232  	if (fw_has_capa(&mvm->fw->ucode_capa,
fe959c7b20495f drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1233  			IWL_UCODE_TLV_CAPA_SESSION_PROT_CMD)) {
fe959c7b20495f drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1234  		mvmvif = iwl_mvm_vif_from_mac80211(vif);
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1235  		te_data = &mvmvif->time_event_data;
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1236  
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1237  		if (vif->type == NL80211_IFTYPE_P2P_DEVICE) {
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1238  			if (te_data->id >= SESSION_PROTECT_CONF_MAX_ID) {
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1239  				IWL_DEBUG_TE(mvm,
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1240  					     "No remain on channel event\n");
d792011b6c282b drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Shaul Triebitz        2024-06-05  1241  				mutex_unlock(&mvm->mutex);
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1242  				return;
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1243  			}
fe959c7b20495f drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1244  
1350658373106e drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2023-10-17  1245  			iwl_mvm_cancel_session_protection(mvm, vif,
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1246  							  te_data->id,
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1247  							  te_data->link_id);
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1248  		} else {
67ac248e4db0a7 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Shaul Triebitz        2023-10-11  1249  			iwl_mvm_roc_station_remove(mvm, mvmvif);
77770189921e38 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1250  		}
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1251  		goto cleanup_roc;
fe959c7b20495f drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1252  	}
fe959c7b20495f drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1253  
305d236e83b664 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1254  	te_data = iwl_mvm_get_roc_te(mvm);
305d236e83b664 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1255  	if (!te_data) {
bf5da87f60a920 drivers/net/wireless/iwlwifi/mvm/time-event.c       Matti Gottlieb        2014-11-16  1256  		IWL_WARN(mvm, "No remain on channel event\n");
d792011b6c282b drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Shaul Triebitz        2024-06-05  1257  		mutex_unlock(&mvm->mutex);
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/time-event.c       Johannes Berg         2013-01-24  1258  		return;
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/time-event.c       Johannes Berg         2013-01-24  1259  	}
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/time-event.c       Johannes Berg         2013-01-24  1260  
305d236e83b664 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1261  	mvmvif = iwl_mvm_vif_from_mac80211(te_data->vif);
305d236e83b664 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1262  
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1263  	if (te_data->vif->type == NL80211_IFTYPE_P2P_DEVICE)
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/time-event.c       Johannes Berg         2013-01-24  1264  		iwl_mvm_remove_time_event(mvm, mvmvif, te_data);
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1265  	else
bf5da87f60a920 drivers/net/wireless/iwlwifi/mvm/time-event.c       Matti Gottlieb        2014-11-16  1266  		iwl_mvm_remove_aux_roc_te(mvm, mvmvif, te_data);
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1267  
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1268  cleanup_roc:
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1269  	/*
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1270  	 * In case we get here before the ROC event started,
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1271  	 * (so the status bit isn't set) set it here so iwl_mvm_cleanup_roc will
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1272  	 * cleanup things properly
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1273  	 */
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1274  	set_bit(vif->type == NL80211_IFTYPE_P2P_DEVICE ?
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1275  		IWL_MVM_STATUS_ROC_RUNNING : IWL_MVM_STATUS_ROC_AUX_RUNNING,
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1276  		&mvm->status);
a1efeb82308402 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Yedidya Benshimol     2024-05-05  1277  
a1efeb82308402 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Yedidya Benshimol     2024-05-05  1278  	/* Mutex is released inside this function */
35c1bbd93c4e69 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05 @1279  	iwl_mvm_cleanup_roc(mvm);
a76b57311b1a24 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Avraham Stern         2021-08-19  1280  }
7f0a7c671cdc03 drivers/net/wireless/iwlwifi/mvm/time-event.c       Andrei Otcheretianski 2014-05-04  1281  

:::::: The code at line 1279 was first introduced by commit
:::::: 35c1bbd93c4e6969b3ac238b48a8bdff3e223ed8 wifi: iwlwifi: mvm: remove IWL_MVM_STATUS_NEED_FLUSH_P2P

:::::: TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

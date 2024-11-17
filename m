Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D46CA64
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731860455; cv=none; b=YlPYhaegMxIet+b8t+eCKhcLrOBRuB//Kn9dDDjmH+vYyPO/ybyQH8ERL3adYdDkqtJN2AHdA1J78XDLzjXUHvzw01p+ZlYxyxeOF+1HlVyNKDA4tSbzgbCzgMeVP3ezYgRD/q1DuPkMo9HlwEYMew9DedmZ4+Oc4pYu/x0kOcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731860455; c=relaxed/simple;
	bh=tXigDkXq82p1rhjYNF/netzduIOfVuy7lJO1Brr/k78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWWySZBy8fQhi9oDSoFlVIO+wpTRRV0FQO3W5l9hyT+zMJnkgTUE/Mb2fgf/WUACEoxgwAMPgm7oS1+G6oEycg0j5hht7ev/0O2edozXYoZfln/6CGNuM3hHsnglr6EOJgGuOa3qRUFKO27WSMt5EzWdLf46tFRtGANvJTGyIZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpnpS38z; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpnpS38z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731860453; x=1763396453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tXigDkXq82p1rhjYNF/netzduIOfVuy7lJO1Brr/k78=;
  b=fpnpS38zIcJjT1QTgTudFPgOqiR1U67k9Y1Jjk4ZZU2NVYiWDOYKjZ80
   89Bja/u9UKyAXZ9wRXPsg++jodUfCZ4EzQuh4UASetOK0c86WOhDKn9ab
   KUTKeeVrk4Fr9knqb+l9I2di3hbWZbEC4R9xDETyI0clVvjjL/5cwH/AD
   GswL0awxd5fAO4nH9eyP/S61tDeq18YoPaAZJiin0JKOPdUPs154cS3h9
   aAobMnJrGqfK0iqXY6BU9mPg+FSXCkr8PJF6zmVhZbFlxPxVpi/KJLSMZ
   fmmbikyTWlQEOopjZ2Bz0tDE7rYQB6uX66hMWxTpSnXx56jTyWdL6lqFq
   w==;
X-CSE-ConnectionGUID: YIQE+2xhQI+V9rF7CGsxvg==
X-CSE-MsgGUID: j6Xu8WZuQ8K39983gj8/Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31735097"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31735097"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 08:20:53 -0800
X-CSE-ConnectionGUID: PHMfDTcmRXOB3gdfXhqM+Q==
X-CSE-MsgGUID: L8UtUHNvQSicnQkr7tZVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="88917235"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2024 08:20:51 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCi12-0001uD-25;
	Sun, 17 Nov 2024 16:20:48 +0000
Date: Mon, 18 Nov 2024 00:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:1279
 iwl_mvm_stop_roc() warn: inconsistent returns '&mvm->mutex'.
Message-ID: <202411180041.gtMmo91L-lkp@intel.com>
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
TO: Shaul Triebitz <shaul.triebitz@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a5df37964673effcd9f84041f7423206a5ae5f2
commit: d792011b6c282bfb787eb2893538e5e336d5e982 wifi: iwlwifi: mvm: unlock mvm mutex
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20241115 (https://download.01.org/0day-ci/archive/20241118/202411180041.gtMmo91L-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411180041.gtMmo91L-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:1279 iwl_mvm_stop_roc() warn: inconsistent returns '&mvm->mutex'.

vim +1279 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c

67ac248e4db0a75 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Shaul Triebitz        2023-10-11  1224  
fe959c7b20495fe drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1225  void iwl_mvm_stop_roc(struct iwl_mvm *mvm, struct ieee80211_vif *vif)
305d236e83b664e drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1226  {
305d236e83b664e drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1227  	struct iwl_mvm_vif *mvmvif;
305d236e83b664e drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1228  	struct iwl_mvm_time_event_data *te_data;
8ca151b568b67a7 drivers/net/wireless/iwlwifi/mvm/time-event.c       Johannes Berg         2013-01-24  1229  
a1efeb823084020 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Yedidya Benshimol     2024-05-05  1230  	mutex_lock(&mvm->mutex);
a1efeb823084020 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Yedidya Benshimol     2024-05-05  1231  
fe959c7b20495fe drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1232  	if (fw_has_capa(&mvm->fw->ucode_capa,
fe959c7b20495fe drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1233  			IWL_UCODE_TLV_CAPA_SESSION_PROT_CMD)) {
fe959c7b20495fe drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1234  		mvmvif = iwl_mvm_vif_from_mac80211(vif);
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1235  		te_data = &mvmvif->time_event_data;
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1236  
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1237  		if (vif->type == NL80211_IFTYPE_P2P_DEVICE) {
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1238  			if (te_data->id >= SESSION_PROTECT_CONF_MAX_ID) {
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1239  				IWL_DEBUG_TE(mvm,
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1240  					     "No remain on channel event\n");
d792011b6c282bf drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Shaul Triebitz        2024-06-05  1241  				mutex_unlock(&mvm->mutex);
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1242  				return;
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1243  			}
fe959c7b20495fe drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1244  
1350658373106ea drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2023-10-17  1245  			iwl_mvm_cancel_session_protection(mvm, vif,
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1246  							  te_data->id,
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1247  							  te_data->link_id);
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1248  		} else {
67ac248e4db0a75 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Shaul Triebitz        2023-10-11  1249  			iwl_mvm_roc_station_remove(mvm, mvmvif);
77770189921e385 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1250  		}
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1251  		goto cleanup_roc;
fe959c7b20495fe drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1252  	}
fe959c7b20495fe drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Emmanuel Grumbach     2019-07-11  1253  
305d236e83b664e drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1254  	te_data = iwl_mvm_get_roc_te(mvm);
305d236e83b664e drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1255  	if (!te_data) {
bf5da87f60a9205 drivers/net/wireless/iwlwifi/mvm/time-event.c       Matti Gottlieb        2014-11-16  1256  		IWL_WARN(mvm, "No remain on channel event\n");
d792011b6c282bf drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Shaul Triebitz        2024-06-05  1257  		mutex_unlock(&mvm->mutex);
8ca151b568b67a7 drivers/net/wireless/iwlwifi/mvm/time-event.c       Johannes Berg         2013-01-24  1258  		return;
8ca151b568b67a7 drivers/net/wireless/iwlwifi/mvm/time-event.c       Johannes Berg         2013-01-24  1259  	}
8ca151b568b67a7 drivers/net/wireless/iwlwifi/mvm/time-event.c       Johannes Berg         2013-01-24  1260  
305d236e83b664e drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1261  	mvmvif = iwl_mvm_vif_from_mac80211(te_data->vif);
305d236e83b664e drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Eliad Peller          2015-12-09  1262  
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1263  	if (te_data->vif->type == NL80211_IFTYPE_P2P_DEVICE)
8ca151b568b67a7 drivers/net/wireless/iwlwifi/mvm/time-event.c       Johannes Berg         2013-01-24  1264  		iwl_mvm_remove_time_event(mvm, mvmvif, te_data);
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1265  	else
bf5da87f60a9205 drivers/net/wireless/iwlwifi/mvm/time-event.c       Matti Gottlieb        2014-11-16  1266  		iwl_mvm_remove_aux_roc_te(mvm, mvmvif, te_data);
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1267  
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1268  cleanup_roc:
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1269  	/*
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1270  	 * In case we get here before the ROC event started,
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1271  	 * (so the status bit isn't set) set it here so iwl_mvm_cleanup_roc will
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1272  	 * cleanup things properly
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1273  	 */
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1274  	set_bit(vif->type == NL80211_IFTYPE_P2P_DEVICE ?
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1275  		IWL_MVM_STATUS_ROC_RUNNING : IWL_MVM_STATUS_ROC_AUX_RUNNING,
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05  1276  		&mvm->status);
a1efeb823084020 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Yedidya Benshimol     2024-05-05  1277  
a1efeb823084020 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Yedidya Benshimol     2024-05-05  1278  	/* Mutex is released inside this function */
35c1bbd93c4e696 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Miri Korenblit        2024-02-05 @1279  	iwl_mvm_cleanup_roc(mvm);
a76b57311b1a247 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c Avraham Stern         2021-08-19  1280  }
7f0a7c671cdc039 drivers/net/wireless/iwlwifi/mvm/time-event.c       Andrei Otcheretianski 2014-05-04  1281  

:::::: The code at line 1279 was first introduced by commit
:::::: 35c1bbd93c4e6969b3ac238b48a8bdff3e223ed8 wifi: iwlwifi: mvm: remove IWL_MVM_STATUS_NEED_FLUSH_P2P

:::::: TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

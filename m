Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6EBE6C
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Nov 2024 00:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732150144; cv=none; b=s3jAj17ealcfI1z3pmAbs6QznlEY2wwcyqwzWJOfCJgc1QxZ6xikUQ2hF609M7RTaGM+TQSAeOlmZzuVVXcCrg+94GDK2RkEFIJaTGLL0ce2iGUWgrqq9UKCWmwEUbEbGeF94DPwVh1f36TU//7MVtUPGuptFLz1Luatp8s8CDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732150144; c=relaxed/simple;
	bh=hkzWymLDBAxzdc2l9DLjiOYNpYH26dNh4HwG0qQ48Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MASZbzZRgNCy5gG8n0rjvghpSvEjmt/RSau5/mTq6sjvTFCP0te3AwkZ4aM/ErQT1tEBVqZcrKAhX69MvXqLlBJbF5gkcxILeTXqSBMmgwM9+mIViBn0b3FRuv6IEWzP5FK6NjcF6uUuStOP2WdkPxUdsiY9c8eAlTycN+zNKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdiBLzPu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdiBLzPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732150142; x=1763686142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hkzWymLDBAxzdc2l9DLjiOYNpYH26dNh4HwG0qQ48Yo=;
  b=PdiBLzPugpC7sIu6FKV9JHLlBF/MyNWp+A8BMfvSQg6Coe/mxibhNf3D
   xa2sdyqzj4LhTLmf+jbJzDt2ljvoWbheIe6e69Xi0ao0nfYGBTvoSmR0o
   IQIoSI0jmMMT8ZXcHqrreownQgBnARhykh4hiUcs/Pilq2CGXtvjBpqad
   S1Rw/7j/fh98/RV75xC1K+qHbXtDPnIKehpimbu5I+EcDF/vcRecZLBJA
   Qfi0xL9SsmzzT2y3otjc46b3hYE9EsDDRywkEVZXCPWz0P9BPb+fyQhiS
   wWXYorvLQSNvjJHy5FuyLfrX+6Q6s7B1OrfmLga0EH1cz+Ywme02BVRhY
   Q==;
X-CSE-ConnectionGUID: muH0ayKpRAa9TM+rmKmkPQ==
X-CSE-MsgGUID: hhIgw4S1RoG5i3AVgs5sRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="57638695"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="57638695"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 16:49:01 -0800
X-CSE-ConnectionGUID: t3S39xXJQj+NOc2j6yp8Pg==
X-CSE-MsgGUID: LK5MKzc1TRiKLU3HCwH16g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="90205563"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2024 16:49:00 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDvNR-0001G9-1g;
	Thu, 21 Nov 2024 00:48:57 +0000
Date: Thu, 21 Nov 2024 08:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9320/12380]
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2499
 iwl_mvm_parse_wowlan_info_notif() warn: variable dereferenced before check
 'data' (see line 2497)
Message-ID: <202411210812.0eLaonw3-lkp@intel.com>
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
TO: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac24e26aa08fe026804f678599f805eb13374a5d
commit: 4635e6eaa0fec321409242f99cccedbaf486c5e8 [9320/12380] wifi: iwlwifi: mvm: support new versions of the wowlan APIs
:::::: branch date: 18 hours ago
:::::: commit date: 13 days ago
config: i386-randconfig-141-20241120 (https://download.01.org/0day-ci/archive/20241121/202411210812.0eLaonw3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411210812.0eLaonw3-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2499 iwl_mvm_parse_wowlan_info_notif() warn: variable dereferenced before check 'data' (see line 2497)

vim +/data +2499 drivers/net/wireless/intel/iwlwifi/mvm/d3.c

0c4aa7a12a5a96 Yedidya Benshimol 2023-09-21  2490  
32fed4706d9aca Naftali Goldstein 2022-09-06  2491  static void iwl_mvm_parse_wowlan_info_notif(struct iwl_mvm *mvm,
32fed4706d9aca Naftali Goldstein 2022-09-06  2492  					    struct iwl_wowlan_info_notif *data,
32fed4706d9aca Naftali Goldstein 2022-09-06  2493  					    struct iwl_wowlan_status_data *status,
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2494  					    u32 len)
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2495  {
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2496  	u32 expected_len = sizeof(*data) +
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28 @2497  		data->num_mlo_link_keys * sizeof(status->mlo_keys[0]);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2498  
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28 @2499  	if (!data) {
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2500  		IWL_ERR(mvm, "iwl_wowlan_info_notif data is NULL\n");
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2501  		status = NULL;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2502  		return;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2503  	}
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2504  
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2505  	if (len < expected_len) {
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2506  		IWL_ERR(mvm, "Invalid WoWLAN info notification!\n");
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2507  		status = NULL;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2508  		return;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2509  	}
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2510  
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2511  	if (mvm->fast_resume)
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2512  		return;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2513  
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2514  	iwl_mvm_convert_key_counters_v5(status, &data->gtk[0].sc);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2515  	iwl_mvm_convert_gtk_v3(status, data->gtk);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2516  	iwl_mvm_convert_igtk(status, &data->igtk[0]);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2517  	iwl_mvm_convert_bigtk(status, data->bigtk);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2518  	status->replay_ctr = le64_to_cpu(data->replay_ctr);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2519  	status->pattern_number = le16_to_cpu(data->pattern_number);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2520  	status->tid_offloaded_tx = data->tid_offloaded_tx;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2521  	if (IWL_FW_CHECK(mvm,
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2522  			 data->tid_offloaded_tx >=
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2523  			 ARRAY_SIZE(status->qos_seq_ctr),
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2524  			 "tid_offloaded_tx is out of bound %d\n",
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2525  			 data->tid_offloaded_tx))
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2526  		data->tid_offloaded_tx = 0;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2527  	status->qos_seq_ctr[data->tid_offloaded_tx] =
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2528  		le16_to_cpu(data->qos_seq_ctr);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2529  	status->wakeup_reasons = le32_to_cpu(data->wakeup_reasons);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2530  	status->num_of_gtk_rekeys =
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2531  		le32_to_cpu(data->num_of_gtk_rekeys);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2532  	status->received_beacons = le32_to_cpu(data->received_beacons);
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2533  	status->tid_tear_down = data->tid_tear_down;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2534  
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2535  	if (data->num_mlo_link_keys) {
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2536  		status->num_mlo_keys = data->num_mlo_link_keys;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2537  		if (IWL_FW_CHECK(mvm,
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2538  				 status->num_mlo_keys > WOWLAN_MAX_MLO_KEYS,
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2539  				 "Too many mlo keys: %d, max %d\n",
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2540  				 status->num_mlo_keys, WOWLAN_MAX_MLO_KEYS))
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2541  			status->num_mlo_keys = WOWLAN_MAX_MLO_KEYS;
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2542  		memcpy(status->mlo_keys, data->mlo_gtks,
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2543  		       status->num_mlo_keys * sizeof(status->mlo_keys[0]));
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2544  	}
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2545  }
4635e6eaa0fec3 Emmanuel Grumbach 2024-10-28  2546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0FB137C
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Apr 2023 11:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681557994; x=1713093994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzkJGiB7Vfb3Q8N3oZLA0ov+D+/7KuvYZHRio5t2f7s=;
  b=KdWuugf7d/NIJtR8YK1woMu7lPSIFUFUppUelB4j6HxxPyfc6y3dZ8fd
   Qe50rKPiO8jTvqJthgyjxIc1mgb2MgQC6wQRTfAsuS3D+D0rBTTtWc7uO
   ytL5JZQtmUv90Pd7RuovIfBn0KAUchBohj0Sj/ZCCq/ik9VbMLGOVPWOH
   xjmUr07FgnHST9G6ed5E4wz3EntJf10BE8r5aMv/cG9JQp95wMLhMdequ
   muPtv8CFSFntuj1KdArJZnf0hUSf8l63TD50seOzYEMikSQ9wZv/NP+xf
   wEwPye/1zFLpF6KuGVtOEYSu1WeSHHLWx82n2Ts++taPy4AiV81gRoZre
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="343394618"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="343394618"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 04:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779557825"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="779557825"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Apr 2023 04:26:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pne35-000aw3-1D;
	Sat, 15 Apr 2023 11:26:31 +0000
Date: Sat, 15 Apr 2023 19:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath11k/core.c:1309
 ath11k_core_qmi_firmware_ready() warn: missing unwind goto?
Message-ID: <202304151955.oqAetVFd-lkp@intel.com>
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
TO: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a934f4bd7d6f9da84c8812da3ba42ee10f5778e
commit: 33b67a4b4e64275b6f2cbc4318f1596c70659111 ath11k: Update WBM idle ring HP after FW mode on
date:   12 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 12 months ago
config: openrisc-randconfig-m041-20230414 (https://download.01.org/0day-ci/archive/20230415/202304151955.oqAetVFd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304151955.oqAetVFd-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ath/ath11k/core.c:1309 ath11k_core_qmi_firmware_ready() warn: missing unwind goto?

vim +1309 drivers/net/wireless/ath/ath11k/core.c

ec038c6127fa77 Wen Gong                  2021-12-20  1275  
d5c65159f28953 Kalle Valo                2019-11-23  1276  int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
d5c65159f28953 Kalle Valo                2019-11-23  1277  {
d5c65159f28953 Kalle Valo                2019-11-23  1278  	int ret;
d5c65159f28953 Kalle Valo                2019-11-23  1279  
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1280  	ret = ath11k_core_start_firmware(ab, ATH11K_FIRMWARE_MODE_NORMAL);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1281  	if (ret) {
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1282  		ath11k_err(ab, "failed to start firmware: %d\n", ret);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1283  		return ret;
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1284  	}
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1285  
d5c65159f28953 Kalle Valo                2019-11-23  1286  	ret = ath11k_ce_init_pipes(ab);
d5c65159f28953 Kalle Valo                2019-11-23  1287  	if (ret) {
d5c65159f28953 Kalle Valo                2019-11-23  1288  		ath11k_err(ab, "failed to initialize CE: %d\n", ret);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1289  		goto err_firmware_stop;
d5c65159f28953 Kalle Valo                2019-11-23  1290  	}
d5c65159f28953 Kalle Valo                2019-11-23  1291  
d5c65159f28953 Kalle Valo                2019-11-23  1292  	ret = ath11k_dp_alloc(ab);
d5c65159f28953 Kalle Valo                2019-11-23  1293  	if (ret) {
d5c65159f28953 Kalle Valo                2019-11-23  1294  		ath11k_err(ab, "failed to init DP: %d\n", ret);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1295  		goto err_firmware_stop;
d5c65159f28953 Kalle Valo                2019-11-23  1296  	}
d5c65159f28953 Kalle Valo                2019-11-23  1297  
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1298  	switch (ath11k_crypto_mode) {
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1299  	case ATH11K_CRYPT_MODE_SW:
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1300  		set_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1301  		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1302  		break;
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1303  	case ATH11K_CRYPT_MODE_HW:
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1304  		clear_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1305  		clear_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1306  		break;
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1307  	default:
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1308  		ath11k_info(ab, "invalid crypto_mode: %d\n", ath11k_crypto_mode);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08 @1309  		return -EINVAL;
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1310  	}
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1311  
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1312  	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1313  		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1314  
d5c65159f28953 Kalle Valo                2019-11-23  1315  	mutex_lock(&ab->core_lock);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1316  	ret = ath11k_core_start(ab);
d5c65159f28953 Kalle Valo                2019-11-23  1317  	if (ret) {
d5c65159f28953 Kalle Valo                2019-11-23  1318  		ath11k_err(ab, "failed to start core: %d\n", ret);
d5c65159f28953 Kalle Valo                2019-11-23  1319  		goto err_dp_free;
d5c65159f28953 Kalle Valo                2019-11-23  1320  	}
d5c65159f28953 Kalle Valo                2019-11-23  1321  
d5c65159f28953 Kalle Valo                2019-11-23  1322  	ret = ath11k_core_pdev_create(ab);
d5c65159f28953 Kalle Valo                2019-11-23  1323  	if (ret) {
d5c65159f28953 Kalle Valo                2019-11-23  1324  		ath11k_err(ab, "failed to create pdev core: %d\n", ret);
d5c65159f28953 Kalle Valo                2019-11-23  1325  		goto err_core_stop;
d5c65159f28953 Kalle Valo                2019-11-23  1326  	}
31858805f91ac7 Govind Singh              2020-05-08  1327  	ath11k_hif_irq_enable(ab);
ec038c6127fa77 Wen Gong                  2021-12-20  1328  
ec038c6127fa77 Wen Gong                  2021-12-20  1329  	ret = ath11k_core_rfkill_config(ab);
ec038c6127fa77 Wen Gong                  2021-12-20  1330  	if (ret && ret != -EOPNOTSUPP) {
ec038c6127fa77 Wen Gong                  2021-12-20  1331  		ath11k_err(ab, "failed to config rfkill: %d\n", ret);
ec038c6127fa77 Wen Gong                  2021-12-20  1332  		goto err_core_stop;
ec038c6127fa77 Wen Gong                  2021-12-20  1333  	}
ec038c6127fa77 Wen Gong                  2021-12-20  1334  
d5c65159f28953 Kalle Valo                2019-11-23  1335  	mutex_unlock(&ab->core_lock);
d5c65159f28953 Kalle Valo                2019-11-23  1336  
d5c65159f28953 Kalle Valo                2019-11-23  1337  	return 0;
d5c65159f28953 Kalle Valo                2019-11-23  1338  
d5c65159f28953 Kalle Valo                2019-11-23  1339  err_core_stop:
d5c65159f28953 Kalle Valo                2019-11-23  1340  	ath11k_core_stop(ab);
0366f42640a410 Vasanthakumar Thiagarajan 2019-11-28  1341  	ath11k_mac_destroy(ab);
d5c65159f28953 Kalle Valo                2019-11-23  1342  err_dp_free:
d5c65159f28953 Kalle Valo                2019-11-23  1343  	ath11k_dp_free(ab);
ba47923974fb67 Govindaraj Saminathan     2019-11-27  1344  	mutex_unlock(&ab->core_lock);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1345  err_firmware_stop:
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1346  	ath11k_qmi_firmware_stop(ab);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1347  
d5c65159f28953 Kalle Valo                2019-11-23  1348  	return ret;
d5c65159f28953 Kalle Valo                2019-11-23  1349  }
d5c65159f28953 Kalle Valo                2019-11-23  1350  

:::::: The code at line 1309 was first introduced by commit
:::::: aa2092a9bab3f87c42f9d531b5b2889c6b823658 ath11k: add raw mode and software crypto support

:::::: TO: Venkateswara Naralasetty <vnaralas@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

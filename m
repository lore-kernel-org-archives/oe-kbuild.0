Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782642940B
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 04:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009665; cv=none; b=Wm2uHV7uVzTVUficY1W46/tvhStnTsmFnP+N0C5PZy6mVvkvGTFd5lUZP7kwpypvilBrt2Tgg/S980XMlCIPwm4gsuFETVFU9JHtYs2YU6hjjCKBRM6PwAYj1yGOTG3l0vnGGGUiNpINO27tRgd/bgmyHqMRFogefLj/ywYulS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009665; c=relaxed/simple;
	bh=y2GfP1tlTxDDU+0kFDVowkK5PiYk7GdJC7mdKKOyjwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V1qhpwYIsmw3d/FvXfCz/4U+OG25O6e1fQIafP7s+Kap/pwP2SoZaLnvoav8/XtAblUXRa/eSU4BhwM3Wn45c/YkvMiZymu3mQ1TemSLZNKa9Ok/lIQSt6DKI5BAnTMYRMGhxeWyyiEkWG7WgIRHBQ4MQZCU4A212uDOrrykxMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+NZ9pGV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+NZ9pGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009664; x=1794545664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y2GfP1tlTxDDU+0kFDVowkK5PiYk7GdJC7mdKKOyjwI=;
  b=Z+NZ9pGVAzXx1nqB0ZzIhd2RgYLvVt9CVma0HaeCaSutz99Fh8D5Pd4k
   plcIdE2DpmpGIChRlj+mHJp8vPX2S0X1F8m3lCbOSdewrBRgjX93X0PnO
   TwZHNZsnI4GETj7ITTsvbExZr8ckvoyv6mMQdHfKCrEo+CtiSePe0cPD2
   T+5FSV537w7Wg9GfHRVyLlI8ohFfL5LDIZeuhgAjMfTpDDcfRi3cHuexW
   r3Mq3wqYhLuEKwZ6xD/CHaV1UuNLX/tqwgrsJ+oio8xCGsACIQPLET0b2
   an9r48M7HeYejEjvRG58exvI9wXYIiE7rYDSoZa0ILsFThaH8n6jcCXwL
   A==;
X-CSE-ConnectionGUID: t2LqszNWStqmhdTKkQIVPg==
X-CSE-MsgGUID: d4pPubfaTby6QbnlLoixvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82480160"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="82480160"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:54:24 -0800
X-CSE-ConnectionGUID: BJVr4MqFQrWWFVdBpMzXfg==
X-CSE-MsgGUID: hrdwEyXDRnauL+2AHHEyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189415505"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2025 20:54:22 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPLf-0004uj-2C;
	Thu, 13 Nov 2025 04:54:19 +0000
Date: Thu, 13 Nov 2025 12:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [net-next 10/12] bng_en: Add initial support for ethtool stats
 display
Message-ID: <202511131205.f7BCX6ef-lkp@intel.com>
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
In-Reply-To: <20251111205829.97579-11-bhargava.marreddy@broadcom.com>
References: <20251111205829.97579-11-bhargava.marreddy@broadcom.com>
TO: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: andrew+netdev@lunn.ch
TO: horms@kernel.org
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: michael.chan@broadcom.com
CC: pavan.chebbi@broadcom.com
CC: vsrama-krishna.nemani@broadcom.com
CC: vikas.gupta@broadcom.com
CC: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
CC: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>

Hi Bhargava,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhargava-Marreddy/bng_en-Query-PHY-and-report-link-status/20251112-050616
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251111205829.97579-11-bhargava.marreddy%40broadcom.com
patch subject: [net-next 10/12] bng_en: Add initial support for ethtool stats display
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-161-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131205.f7BCX6ef-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511131205.f7BCX6ef-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c:1543 bnge_hwrm_port_qstats_ext() warn: missing error code? 'rc'

vim +/rc +1543 drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c

345531fc4de01ab Bhargava Marreddy 2025-11-12  1467  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1468  int bnge_hwrm_port_qstats_ext(struct bnge_dev *bd, u8 flags)
345531fc4de01ab Bhargava Marreddy 2025-11-12  1469  {
345531fc4de01ab Bhargava Marreddy 2025-11-12  1470  	struct hwrm_queue_pri2cos_qcfg_output *resp_qc;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1471  	struct bnge_net *bn = netdev_priv(bd->netdev);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1472  	struct hwrm_queue_pri2cos_qcfg_input *req_qc;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1473  	struct hwrm_port_qstats_ext_output *resp_qs;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1474  	struct hwrm_port_qstats_ext_input *req_qs;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1475  	struct bnge_pf_info *pf = &bd->pf;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1476  	u32 tx_stat_size;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1477  	int rc;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1478  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1479  	if (!(bn->flags & BNGE_FLAG_PORT_STATS_EXT))
345531fc4de01ab Bhargava Marreddy 2025-11-12  1480  		return 0;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1481  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1482  	if (flags && !(bd->fw_cap & BNGE_FW_CAP_EXT_HW_STATS_SUPPORTED))
345531fc4de01ab Bhargava Marreddy 2025-11-12  1483  		return -EOPNOTSUPP;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1484  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1485  	rc = bnge_hwrm_req_init(bd, req_qs, HWRM_PORT_QSTATS_EXT);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1486  	if (rc)
345531fc4de01ab Bhargava Marreddy 2025-11-12  1487  		return rc;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1488  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1489  	req_qs->flags = flags;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1490  	req_qs->port_id = cpu_to_le16(pf->port_id);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1491  	req_qs->rx_stat_size = cpu_to_le16(sizeof(struct rx_port_stats_ext));
345531fc4de01ab Bhargava Marreddy 2025-11-12  1492  	req_qs->rx_stat_host_addr =
345531fc4de01ab Bhargava Marreddy 2025-11-12  1493  		cpu_to_le64(bn->rx_port_stats_ext.hw_stats_map);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1494  	tx_stat_size = bn->tx_port_stats_ext.hw_stats ?
345531fc4de01ab Bhargava Marreddy 2025-11-12  1495  		       sizeof(struct tx_port_stats_ext) : 0;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1496  	req_qs->tx_stat_size = cpu_to_le16(tx_stat_size);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1497  	req_qs->tx_stat_host_addr =
345531fc4de01ab Bhargava Marreddy 2025-11-12  1498  		cpu_to_le64(bn->tx_port_stats_ext.hw_stats_map);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1499  	resp_qs = bnge_hwrm_req_hold(bd, req_qs);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1500  	rc = bnge_hwrm_req_send(bd, req_qs);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1501  	if (!rc) {
345531fc4de01ab Bhargava Marreddy 2025-11-12  1502  		bn->fw_rx_stats_ext_size =
345531fc4de01ab Bhargava Marreddy 2025-11-12  1503  			le16_to_cpu(resp_qs->rx_stat_size) / 8;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1504  		bn->fw_tx_stats_ext_size = tx_stat_size ?
345531fc4de01ab Bhargava Marreddy 2025-11-12  1505  			le16_to_cpu(resp_qs->tx_stat_size) / 8 : 0;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1506  	} else {
345531fc4de01ab Bhargava Marreddy 2025-11-12  1507  		bn->fw_rx_stats_ext_size = 0;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1508  		bn->fw_tx_stats_ext_size = 0;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1509  	}
345531fc4de01ab Bhargava Marreddy 2025-11-12  1510  	bnge_hwrm_req_drop(bd, req_qs);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1511  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1512  	if (flags)
345531fc4de01ab Bhargava Marreddy 2025-11-12  1513  		return rc;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1514  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1515  	if (bn->fw_tx_stats_ext_size <=
345531fc4de01ab Bhargava Marreddy 2025-11-12  1516  	    offsetof(struct tx_port_stats_ext, pfc_pri0_tx_duration_us) / 8) {
345531fc4de01ab Bhargava Marreddy 2025-11-12  1517  		bn->pri2cos_valid = 0;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1518  		return rc;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1519  	}
345531fc4de01ab Bhargava Marreddy 2025-11-12  1520  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1521  	rc = bnge_hwrm_req_init(bd, req_qc, HWRM_QUEUE_PRI2COS_QCFG);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1522  	if (rc)
345531fc4de01ab Bhargava Marreddy 2025-11-12  1523  		return rc;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1524  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1525  	req_qc->flags = cpu_to_le32(QUEUE_PRI2COS_QCFG_REQ_FLAGS_IVLAN);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1526  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1527  	resp_qc = bnge_hwrm_req_hold(bd, req_qc);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1528  	rc = bnge_hwrm_req_send(bd, req_qc);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1529  	if (!rc) {
345531fc4de01ab Bhargava Marreddy 2025-11-12  1530  		u8 *pri2cos;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1531  		int i, j;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1532  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1533  		pri2cos = &resp_qc->pri0_cos_queue_id;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1534  		for (i = 0; i < 8; i++) {
345531fc4de01ab Bhargava Marreddy 2025-11-12  1535  			u8 queue_id = pri2cos[i];
345531fc4de01ab Bhargava Marreddy 2025-11-12  1536  			u8 queue_idx;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1537  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1538  			/* Per port queue IDs start from 0, 10, 20, etc */
345531fc4de01ab Bhargava Marreddy 2025-11-12  1539  			queue_idx = queue_id % 10;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1540  			if (queue_idx > BNGE_MAX_QUEUE) {
345531fc4de01ab Bhargava Marreddy 2025-11-12  1541  				bn->pri2cos_valid = false;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1542  				bnge_hwrm_req_drop(bd, req_qc);
345531fc4de01ab Bhargava Marreddy 2025-11-12 @1543  				return rc;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1544  			}
345531fc4de01ab Bhargava Marreddy 2025-11-12  1545  			for (j = 0; j < bd->max_q; j++) {
345531fc4de01ab Bhargava Marreddy 2025-11-12  1546  				if (bd->q_ids[j] == queue_id)
345531fc4de01ab Bhargava Marreddy 2025-11-12  1547  					bn->pri2cos_idx[i] = queue_idx;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1548  			}
345531fc4de01ab Bhargava Marreddy 2025-11-12  1549  		}
345531fc4de01ab Bhargava Marreddy 2025-11-12  1550  		bn->pri2cos_valid = true;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1551  	}
345531fc4de01ab Bhargava Marreddy 2025-11-12  1552  	bnge_hwrm_req_drop(bd, req_qc);
345531fc4de01ab Bhargava Marreddy 2025-11-12  1553  
345531fc4de01ab Bhargava Marreddy 2025-11-12  1554  	return rc;
345531fc4de01ab Bhargava Marreddy 2025-11-12  1555  }
345531fc4de01ab Bhargava Marreddy 2025-11-12  1556  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

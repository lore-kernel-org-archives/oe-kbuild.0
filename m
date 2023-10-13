Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CD463A3
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cu2Rtsfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697186823; x=1728722823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7pB8SQtF36KMlUOYC4MiAY+nyHeqTDXfF9wUEcmhCSw=;
  b=cu2RtsfwbC/2XntsuyLHBA1cj3W5fv4eIY9qpW5OGHjSSofIczPgnT8U
   dys8lclR191z9UCHOr146PwoNA7s53l6IoPRBEiYwlDsvq+rzt2aW7E0v
   vJBy2pWHUme/Xzgn5Zp5x2sSQ1PpMbMGEEm1S25dYFhzkwZ3pF6zxWopE
   1W+JzKLKivlANv2v5RsDzU+YnU6UqKV8pKY3P4Wr4nMMIB1YRdK8HaMDh
   cVT/zLiPhnPwrjg9oA9Ys/PKFhwqMVUf2wUZ4Su58MysVPt0pVORXxqzm
   fcCgu/4dxr1KSY6fUsbovdltEpwnk3tAum08DM1eOLLEQuZSgzyIEZCnd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387985634"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="387985634"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 01:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928335359"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="928335359"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 01:46:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrDot-0004X8-37;
	Fri, 13 Oct 2023 08:46:55 +0000
Date: Fri, 13 Oct 2023 16:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath12k/qmi.c:2384
 ath12k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.
Message-ID: <202310131657.d9AAQSgc-lkp@intel.com>
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
TO: Kalle Valo <quic_kvalo@quicinc.com>
CC: Balamurugan Selvarajan <quic_bselvara@quicinc.com>
CC: Baochen Qiang <quic_bqiang@quicinc.com>
CC: Bhagavathi Perumal S <quic_bperumal@quicinc.com>
CC: Carl Huang <quic_cjhuang@quicinc.com>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>
CC: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
CC: P Praneesh <quic_ppranees@quicinc.com>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
CC: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
CC: Sriram R <quic_srirrama@quicinc.com>
CC: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
CC: Wen Gong <quic_wgong@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   10a6e5feccb877c3c75ad11d27942ad52c24815f
commit: d889913205cf7ebda905b1e62c5867ed4e39f6c2 wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131657.d9AAQSgc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131657.d9AAQSgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310131657.d9AAQSgc-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/qmi.c:2384 ath12k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.
drivers/net/wireless/ath/ath12k/dp.c:210 ath12k_dp_srng_msi_setup() error: uninitialized symbol 'addr_lo'.
drivers/net/wireless/ath/ath12k/dp.c:211 ath12k_dp_srng_msi_setup() error: uninitialized symbol 'addr_hi'.
drivers/net/wireless/ath/ath12k/wmi.c:5522 ath12k_mgmt_rx_event() warn: 'rx_ev.snr + -95' 4294967201 can't fit into 127 'status->signal'
drivers/net/wireless/ath/ath12k/mac.c:1630 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath12k/mac.c:1630 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_160'.
drivers/net/wireless/ath/ath12k/mac.c:1658 ath12k_peer_assoc_h_he() warn: mask and shift to zero: expr='(he_cap->he_cap_elem.mac_cap_info[3] & 24) >> 24'
drivers/net/wireless/ath/ath12k/mac.c:3699 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:4737 ath12k_mac_get_vdev_stats_id() warn: always true condition '(vdev_stats_id <= 255) => (0-255 <= 255)'
drivers/net/wireless/ath/ath12k/ce.c:485 ath12k_ce_srng_msi_ring_params_setup() error: uninitialized symbol 'addr_lo'.
drivers/net/wireless/ath/ath12k/ce.c:486 ath12k_ce_srng_msi_ring_params_setup() error: uninitialized symbol 'addr_hi'.
drivers/net/wireless/ath/ath12k/dp_rx.c:3981 ath12k_dp_rxdma_ring_sel_config_wcn7850() error: uninitialized symbol 'ret'.
drivers/net/wireless/ath/ath12k/dp_mon.c:2434 ath12k_dp_mon_rx_update_user_stats() warn: always true condition '(user_stats->nss <= 8) => (0-7 <= 8)'

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1087 ath12k_mac_op_config() error: uninitialized symbol 'ret'.
drivers/net/wireless/ath/ath12k/mac.c:1632 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath12k/mac.c:3701 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/dp_rx.c:2690 ath12k_dp_rx_process() error: uninitialized symbol 'i'.
drivers/net/wireless/ath/ath12k/dp_mon.c:532 ath12k_dp_mon_parse_he_sig_su() warn: inconsistent indenting
drivers/net/wireless/ath/ath12k/dp_mon.c:623 ath12k_dp_mon_rx_parse_status_tlv() error: buffer overflow 'info' 6 <= 6
drivers/net/wireless/ath/ath12k/dp_mon.c:630 ath12k_dp_mon_rx_parse_status_tlv() error: buffer overflow 'info' 6 <= 6
drivers/net/wireless/ath/ath12k/dp_mon.c:1300 ath12k_dp_mon_buf_replenish() warn: unsigned 'buf_id' is never less than zero.

vim +/ret +2384 drivers/net/wireless/ath/ath12k/qmi.c

d889913205cf7e Kalle Valo 2022-11-28  2301  
d889913205cf7e Kalle Valo 2022-11-28  2302  static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
d889913205cf7e Kalle Valo 2022-11-28  2303  					   const u8 *data, u32 len, u8 type)
d889913205cf7e Kalle Valo 2022-11-28  2304  {
d889913205cf7e Kalle Valo 2022-11-28  2305  	struct qmi_wlanfw_bdf_download_req_msg_v01 *req;
d889913205cf7e Kalle Valo 2022-11-28  2306  	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp;
d889913205cf7e Kalle Valo 2022-11-28  2307  	struct qmi_txn txn = {};
d889913205cf7e Kalle Valo 2022-11-28  2308  	const u8 *temp = data;
d889913205cf7e Kalle Valo 2022-11-28  2309  	int ret;
d889913205cf7e Kalle Valo 2022-11-28  2310  	u32 remaining = len;
d889913205cf7e Kalle Valo 2022-11-28  2311  
d889913205cf7e Kalle Valo 2022-11-28  2312  	req = kzalloc(sizeof(*req), GFP_KERNEL);
d889913205cf7e Kalle Valo 2022-11-28  2313  	if (!req)
d889913205cf7e Kalle Valo 2022-11-28  2314  		return -ENOMEM;
d889913205cf7e Kalle Valo 2022-11-28  2315  	memset(&resp, 0, sizeof(resp));
d889913205cf7e Kalle Valo 2022-11-28  2316  
d889913205cf7e Kalle Valo 2022-11-28  2317  	while (remaining) {
d889913205cf7e Kalle Valo 2022-11-28  2318  		req->valid = 1;
d889913205cf7e Kalle Valo 2022-11-28  2319  		req->file_id_valid = 1;
d889913205cf7e Kalle Valo 2022-11-28  2320  		req->file_id = ab->qmi.target.board_id;
d889913205cf7e Kalle Valo 2022-11-28  2321  		req->total_size_valid = 1;
d889913205cf7e Kalle Valo 2022-11-28  2322  		req->total_size = remaining;
d889913205cf7e Kalle Valo 2022-11-28  2323  		req->seg_id_valid = 1;
d889913205cf7e Kalle Valo 2022-11-28  2324  		req->data_valid = 1;
d889913205cf7e Kalle Valo 2022-11-28  2325  		req->bdf_type = type;
d889913205cf7e Kalle Valo 2022-11-28  2326  		req->bdf_type_valid = 1;
d889913205cf7e Kalle Valo 2022-11-28  2327  		req->end_valid = 1;
d889913205cf7e Kalle Valo 2022-11-28  2328  		req->end = 0;
d889913205cf7e Kalle Valo 2022-11-28  2329  
d889913205cf7e Kalle Valo 2022-11-28  2330  		if (remaining > QMI_WLANFW_MAX_DATA_SIZE_V01) {
d889913205cf7e Kalle Valo 2022-11-28  2331  			req->data_len = QMI_WLANFW_MAX_DATA_SIZE_V01;
d889913205cf7e Kalle Valo 2022-11-28  2332  		} else {
d889913205cf7e Kalle Valo 2022-11-28  2333  			req->data_len = remaining;
d889913205cf7e Kalle Valo 2022-11-28  2334  			req->end = 1;
d889913205cf7e Kalle Valo 2022-11-28  2335  		}
d889913205cf7e Kalle Valo 2022-11-28  2336  
d889913205cf7e Kalle Valo 2022-11-28  2337  		if (type == ATH12K_QMI_FILE_TYPE_EEPROM) {
d889913205cf7e Kalle Valo 2022-11-28  2338  			req->data_valid = 0;
d889913205cf7e Kalle Valo 2022-11-28  2339  			req->end = 1;
d889913205cf7e Kalle Valo 2022-11-28  2340  			req->data_len = ATH12K_QMI_MAX_BDF_FILE_NAME_SIZE;
d889913205cf7e Kalle Valo 2022-11-28  2341  		} else {
d889913205cf7e Kalle Valo 2022-11-28  2342  			memcpy(req->data, temp, req->data_len);
d889913205cf7e Kalle Valo 2022-11-28  2343  		}
d889913205cf7e Kalle Valo 2022-11-28  2344  
d889913205cf7e Kalle Valo 2022-11-28  2345  		ret = qmi_txn_init(&ab->qmi.handle, &txn,
d889913205cf7e Kalle Valo 2022-11-28  2346  				   qmi_wlanfw_bdf_download_resp_msg_v01_ei,
d889913205cf7e Kalle Valo 2022-11-28  2347  				   &resp);
d889913205cf7e Kalle Valo 2022-11-28  2348  		if (ret < 0)
d889913205cf7e Kalle Valo 2022-11-28  2349  			goto out;
d889913205cf7e Kalle Valo 2022-11-28  2350  
d889913205cf7e Kalle Valo 2022-11-28  2351  		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi bdf download req fixed addr type %d\n",
d889913205cf7e Kalle Valo 2022-11-28  2352  			   type);
d889913205cf7e Kalle Valo 2022-11-28  2353  
d889913205cf7e Kalle Valo 2022-11-28  2354  		ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
d889913205cf7e Kalle Valo 2022-11-28  2355  				       QMI_WLANFW_BDF_DOWNLOAD_REQ_V01,
d889913205cf7e Kalle Valo 2022-11-28  2356  				       QMI_WLANFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_LEN,
d889913205cf7e Kalle Valo 2022-11-28  2357  				       qmi_wlanfw_bdf_download_req_msg_v01_ei, req);
d889913205cf7e Kalle Valo 2022-11-28  2358  		if (ret < 0) {
d889913205cf7e Kalle Valo 2022-11-28  2359  			qmi_txn_cancel(&txn);
d889913205cf7e Kalle Valo 2022-11-28  2360  			goto out;
d889913205cf7e Kalle Valo 2022-11-28  2361  		}
d889913205cf7e Kalle Valo 2022-11-28  2362  
d889913205cf7e Kalle Valo 2022-11-28  2363  		ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH12K_QMI_WLANFW_TIMEOUT_MS));
d889913205cf7e Kalle Valo 2022-11-28  2364  		if (ret < 0)
d889913205cf7e Kalle Valo 2022-11-28  2365  			goto out;
d889913205cf7e Kalle Valo 2022-11-28  2366  
d889913205cf7e Kalle Valo 2022-11-28  2367  		if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
d889913205cf7e Kalle Valo 2022-11-28  2368  			ath12k_warn(ab, "qmi BDF download failed, result: %d, err: %d\n",
d889913205cf7e Kalle Valo 2022-11-28  2369  				    resp.resp.result, resp.resp.error);
d889913205cf7e Kalle Valo 2022-11-28  2370  			ret = -EINVAL;
d889913205cf7e Kalle Valo 2022-11-28  2371  			goto out;
d889913205cf7e Kalle Valo 2022-11-28  2372  		}
d889913205cf7e Kalle Valo 2022-11-28  2373  
d889913205cf7e Kalle Valo 2022-11-28  2374  		remaining -= req->data_len;
d889913205cf7e Kalle Valo 2022-11-28  2375  		temp += req->data_len;
d889913205cf7e Kalle Valo 2022-11-28  2376  		req->seg_id++;
d889913205cf7e Kalle Valo 2022-11-28  2377  		ath12k_dbg(ab, ATH12K_DBG_QMI,
d889913205cf7e Kalle Valo 2022-11-28  2378  			   "qmi bdf download request remaining %i\n",
d889913205cf7e Kalle Valo 2022-11-28  2379  			   remaining);
d889913205cf7e Kalle Valo 2022-11-28  2380  	}
d889913205cf7e Kalle Valo 2022-11-28  2381  
d889913205cf7e Kalle Valo 2022-11-28  2382  out:
d889913205cf7e Kalle Valo 2022-11-28  2383  	kfree(req);
d889913205cf7e Kalle Valo 2022-11-28 @2384  	return ret;
d889913205cf7e Kalle Valo 2022-11-28  2385  }
d889913205cf7e Kalle Valo 2022-11-28  2386  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

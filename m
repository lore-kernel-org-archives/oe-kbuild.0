Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468371B7F4
	for <oe-kbuild@lists.linux.dev>; Sat, 11 May 2024 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715447542; cv=none; b=L8/6gCrc1gYLUiHP0KsKq0ZO3TyPZBciwsSJs4zsr5hRz0mNLEflNXKvalNEC6IRxuS4pX2/tMQLLeWRPl6Gs52N3PtmoRvBljYZMIeokhHCGqrw3JS3pqCr485CYQKQIpmQ7KH0LXH4WOth39an8a099PCcSrpzaNclPyrhDq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715447542; c=relaxed/simple;
	bh=3/Lvv9E52JTUO0S6xMMdz7Wu10xMa2U37CXeCEANHdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EC05Tt5rfSqn/sgEaNg/OZR4NqsjyF+ZYmAZFHpdeLQ06Pp/HZUozTJuLognYSYLq7y24mgG5fcWxBgpoP5OZlnzSvso2BCLmGq38rtz3BaMs6h1ZTObgtmJ4gJq9sInkgz6RMr+tOs+EoeSlvEi6bV0eR7vjdg46TVZLEoR1qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzgLw0Ku; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzgLw0Ku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715447540; x=1746983540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/Lvv9E52JTUO0S6xMMdz7Wu10xMa2U37CXeCEANHdw=;
  b=MzgLw0KuIe8y3RUN9uwlcXXy5Nq7tnjFnYfzvdOwafjnmKyN3xzcEADr
   PFYGTA5eFUn8kTKnBjEa0gJl+y3b9Wfhphu/fSdJXrehEmwasfJF3/Sta
   TYIrj3aLoAyhFBhclZM3jDqtBFOhg44OpWdITjQtfci0bG5YhcYyDyg0L
   7iw6Dgkb7OKZt/+5sCIJku7WsIniHiJXS2/S5PQHTjVQAR+n7HfQdR7fo
   dLIaUD0TPJ19FeEe/wqxJwi9SOXMN/gth0mc3TcpfdaX72S2DaL/Udr0a
   TR+UbGYroXGdgQBbBg09EnV8EsGklOWPeHeo4NV4t9M0ihHhQ8NuyICRb
   Q==;
X-CSE-ConnectionGUID: /vwIamF/T3iJRCNYHTLDiA==
X-CSE-MsgGUID: nXs+0xK3Qj+uBEjCuuJCRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="14377851"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="14377851"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 10:12:19 -0700
X-CSE-ConnectionGUID: vjdCJLXKSlmwZO/JBx4TBQ==
X-CSE-MsgGUID: tliW8S5fTg6EwsiiDj9XCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="34604119"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 May 2024 10:12:18 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5qGd-0007ff-1l;
	Sat, 11 May 2024 17:12:15 +0000
Date: Sun, 12 May 2024 01:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] Bluetooth: MGMT: Make MGMT_OP_LOAD_CONN_PARAM update
 existing connection
Message-ID: <202405120027.hpp0g4qH-lkp@intel.com>
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
In-Reply-To: <20240510143645.1408056-1-luiz.dentz@gmail.com>
References: <20240510143645.1408056-1-luiz.dentz@gmail.com>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: linux-bluetooth@vger.kernel.org

Hi Luiz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master linus/master v6.9-rc7 next-20240510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-MGMT-Make-MGMT_OP_LOAD_CONN_PARAM-update-existing-connection/20240510-223834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240510143645.1408056-1-luiz.dentz%40gmail.com
patch subject: [PATCH v3] Bluetooth: MGMT: Make MGMT_OP_LOAD_CONN_PARAM update existing connection
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: i386-randconfig-141-20240511 (https://download.01.org/0day-ci/archive/20240512/202405120027.hpp0g4qH-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405120027.hpp0g4qH-lkp@intel.com/

New smatch warnings:
net/bluetooth/mgmt.c:7922 load_conn_param() error: uninitialized symbol 'i'.
net/bluetooth/mgmt.c:7982 load_conn_param() error: uninitialized symbol 'update'.

Old smatch warnings:
net/bluetooth/mgmt.c:5588 read_local_oob_data_complete() error: 'skb' dereferencing possible ERR_PTR()
net/bluetooth/mgmt.c:5602 read_local_oob_data_complete() error: 'skb' dereferencing possible ERR_PTR()
net/bluetooth/mgmt.c:8149 read_local_oob_ext_data_complete() error: 'skb' dereferencing possible ERR_PTR()
net/bluetooth/mgmt.c:8165 read_local_oob_ext_data_complete() error: 'skb' dereferencing possible ERR_PTR()

vim +/i +7922 net/bluetooth/mgmt.c

a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7888  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7889  static int load_conn_param(struct sock *sk, struct hci_dev *hdev, void *data,
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7890  			   u16 len)
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7891  {
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7892  	struct mgmt_cp_load_conn_param *cp = data;
ba1d6936f6f839 Johan Hedberg          2014-07-03  7893  	const u16 max_param_count = ((U16_MAX - sizeof(*cp)) /
ba1d6936f6f839 Johan Hedberg          2014-07-03  7894  				     sizeof(struct mgmt_conn_param));
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7895  	u16 param_count, expected_len;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7896  	int i;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7897  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7898  	if (!lmp_le_capable(hdev))
a69e8375a134eb Johan Hedberg          2015-03-06  7899  		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_CONN_PARAM,
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7900  				       MGMT_STATUS_NOT_SUPPORTED);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7901  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7902  	param_count = __le16_to_cpu(cp->param_count);
ba1d6936f6f839 Johan Hedberg          2014-07-03  7903  	if (param_count > max_param_count) {
2064ee332e4c1b Marcel Holtmann        2017-10-30  7904  		bt_dev_err(hdev, "load_conn_param: too big param_count value %u",
ba1d6936f6f839 Johan Hedberg          2014-07-03  7905  			   param_count);
a69e8375a134eb Johan Hedberg          2015-03-06  7906  		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_CONN_PARAM,
ba1d6936f6f839 Johan Hedberg          2014-07-03  7907  				       MGMT_STATUS_INVALID_PARAMS);
ba1d6936f6f839 Johan Hedberg          2014-07-03  7908  	}
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7909  
5bec1fb866df8f Gustavo A. R. Silva    2019-03-28  7910  	expected_len = struct_size(cp, params, param_count);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7911  	if (expected_len != len) {
2064ee332e4c1b Marcel Holtmann        2017-10-30  7912  		bt_dev_err(hdev, "load_conn_param: expected %u bytes, got %u bytes",
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7913  			   expected_len, len);
a69e8375a134eb Johan Hedberg          2015-03-06  7914  		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_CONN_PARAM,
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7915  				       MGMT_STATUS_INVALID_PARAMS);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7916  	}
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7917  
181d695352305c Marcel Holtmann        2020-05-06  7918  	bt_dev_dbg(hdev, "param_count %u", param_count);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7919  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7920  	hci_dev_lock(hdev);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7921  
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10 @7922  	if (i > 1)
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7923  		hci_conn_params_clear_disabled(hdev);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7924  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7925  	for (i = 0; i < param_count; i++) {
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7926  		struct mgmt_conn_param *param = &cp->params[i];
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7927  		struct hci_conn_params *hci_param;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7928  		u16 min, max, latency, timeout;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7929  		u8 addr_type;
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7930  		bool update;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7931  
181d695352305c Marcel Holtmann        2020-05-06  7932  		bt_dev_dbg(hdev, "Adding %pMR (type %u)", &param->addr.bdaddr,
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7933  			   param->addr.type);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7934  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7935  		if (param->addr.type == BDADDR_LE_PUBLIC) {
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7936  			addr_type = ADDR_LE_DEV_PUBLIC;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7937  		} else if (param->addr.type == BDADDR_LE_RANDOM) {
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7938  			addr_type = ADDR_LE_DEV_RANDOM;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7939  		} else {
2064ee332e4c1b Marcel Holtmann        2017-10-30  7940  			bt_dev_err(hdev, "ignoring invalid connection parameters");
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7941  			continue;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7942  		}
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7943  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7944  		min = le16_to_cpu(param->min_interval);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7945  		max = le16_to_cpu(param->max_interval);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7946  		latency = le16_to_cpu(param->latency);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7947  		timeout = le16_to_cpu(param->timeout);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7948  
181d695352305c Marcel Holtmann        2020-05-06  7949  		bt_dev_dbg(hdev, "min 0x%04x max 0x%04x latency 0x%04x timeout 0x%04x",
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7950  			   min, max, latency, timeout);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7951  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7952  		if (hci_check_conn_params(min, max, latency, timeout) < 0) {
2064ee332e4c1b Marcel Holtmann        2017-10-30  7953  			bt_dev_err(hdev, "ignoring invalid connection parameters");
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7954  			continue;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7955  		}
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7956  
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7957  		/* Detect when the loading is for an existing parameter then
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7958  		 * attempt to trigger the connection update procedure.
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7959  		 */
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7960  		if (!i && param_count == 1) {
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7961  			hci_param = hci_conn_params_lookup(hdev,
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7962  							   &param->addr.bdaddr,
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7963  							   addr_type);
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7964  			if (hci_param)
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7965  				update = true;
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7966  			else
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7967  				hci_conn_params_clear_disabled(hdev);
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7968  		}
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7969  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7970  		hci_param = hci_conn_params_add(hdev, &param->addr.bdaddr,
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7971  						addr_type);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7972  		if (!hci_param) {
2064ee332e4c1b Marcel Holtmann        2017-10-30  7973  			bt_dev_err(hdev, "failed to add connection parameters");
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7974  			continue;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7975  		}
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7976  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7977  		hci_param->conn_min_interval = min;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7978  		hci_param->conn_max_interval = max;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7979  		hci_param->conn_latency = latency;
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7980  		hci_param->supervision_timeout = timeout;
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7981  
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10 @7982  		if (update) {
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7983  			struct hci_conn *conn;
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7984  
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7985  			conn = hci_conn_hash_lookup_le(hdev, &hci_param->addr,
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7986  						       addr_type);
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7987  			if (conn && conn->role == HCI_ROLE_MASTER &&
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7988  			    (conn->le_conn_min_interval != min ||
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7989  			     conn->le_conn_max_interval != max ||
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7990  			     conn->le_conn_latency != latency ||
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7991  			     conn->le_supv_timeout != timeout))
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7992  				hci_cmd_sync_queue(hdev, conn_update_sync,
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7993  						   hci_param, NULL);
a505b0e17772d4 Luiz Augusto von Dentz 2024-05-10  7994  		}
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7995  	}
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7996  
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7997  	hci_dev_unlock(hdev);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  7998  
2a1afb5ac8d580 Johan Hedberg          2015-03-06  7999  	return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_LOAD_CONN_PARAM, 0,
2a1afb5ac8d580 Johan Hedberg          2015-03-06  8000  				 NULL, 0);
a26f3dcff2cf58 Johan Hedberg          2014-07-02  8001  }
a26f3dcff2cf58 Johan Hedberg          2014-07-02  8002  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

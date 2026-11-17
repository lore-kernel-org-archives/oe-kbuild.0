Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911638;
	b=rE7/5HiIOyNJBhuFqNQ4kbyqoF4Q/NCAyWp+wMntbPAGE7X/Dxc9x1hHr7nad8rYvt+d
	 kFxz03ziZqXsY7as1QL0uqGfKft3hp1Se5CWhU79jFpN/N2AZ1oRREQltjLQbYmqxuKBt
	 /jy7F+8Hbgs7JWLkkUrngaczV7wyFmNNFI0WtfR7e8slht1B5tocSWPM5b6PbNYKD0pD3
	 uR7YjzPnucG86BT/hTlK/txKbJ41Y+JxuiawyKhT8xv7vLfogdSKZPoZAE54UInYw03DA
	 UlLlSnE+n9doPcxTzxsl2k1SW7vL1pciuJbkyB3fbP2ePBQCGwpK3RcXDPjfhZWyQOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911638;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qj+mAjBe3RFGusVaLa+vFcKtymBXdw7Z0KDSk4BZsPw=;
	b=0HGon4gZ0eQM+4VvjMPlmvfk7PbBSiIqsqvWzAjme4AlaXGbgtwGi0Yfb0k+RD7xH6uw
	 mmUB57xrl+xJi/8d3fCplAqsLEJQX2KxOHR9xDwdoH/DzbrMQ6FzMpU72WyyJr89zMASH
	 +VTYz/Srao8dl1vhjforKSClJbpq49TeHBv+HarCCPMmgijP6NhqOUGOWcSleAKAjklkI
	 cFXsdjI6jQH4RYo7THDNUempAsiD/tjQUmkiQu0In0lj1cRQdrQTUi5Qv1HvpuJb7XslN
	 9UzCDGLbmsJsAaF4yuudH8BPoIcPQaffAKTqaKjyZley5doLUY+p9HO3gjfUJzVNEMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hocIumbV;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998BA606A895
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 10:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 998BA606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hocIumbV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794911638; x=1826447638;
  h=date:from:to:cc:subject:message-id;
  bh=QkaD7p2ZU5tg79RBkiOmfl0jk+cHAhTOYlSMqsRW/ms=;
  b=hocIumbVxd5k/19t+hnlWtSVcEGWzxd4vIOYFa2c1U0ZpZnFqzOj8rvU
   0fk/Y0vhruWHT74kx/V/H2aoOeClQ/nSvX0+x8JoromLUfXe9qqOCjWD6
   O9oEY/nN2yxPQB/bzoMMI6i6c/noo4VJDLtgUNXB/wFEIWCU0dtS6OUU0
   wVM+ca8Tsd287EheYgLdrY0SXjcvW5aZRTUgwUWNexzC61lsgh4YozndF
   6LNrL4ewHQdLG8me3o+/DiTWQIBMcDSOJrCWvdQPpLbC9KXKA3YLnPp6M
   fL+SDlozOD5JWXZZSujaryplK6OXX8RR8TsAi0qO/k63giXxmU/wPi/9U
   w==;
X-CSE-ConnectionGUID: tAJPrCMIRJ2YYJqCoBsU1A==
X-CSE-MsgGUID: 5alP8uC6Syi+JWtan/BWSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3759482"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3759482"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:33:57 -0800
X-CSE-ConnectionGUID: Rprv3fd5RE+bgo0EWKGQ2g==
X-CSE-MsgGUID: kF2WPCYORKmORF1sWiFeJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9980422"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2026 02:33:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTGVd-0000000035K-0XjX;
	Tue, 17 Nov 2026 10:33:53 +0000
Date: Tue, 17 Nov 2026 11:33:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4010/7459]
 drivers/firmware/arm/scmi/bus.c:139:18-22: ERROR: reference preceded by free
 on line 113
Message-ID: <20261117112926.VaJ4DrTm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sudeep Holla <sudeep.holla@kernel.org>
CC: Yeoreum Yun <yeoreum.yun@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   749a4de370409464cf8501ec5b2451df45c84eb4
commit: 49c49ca0c4d02848a9576f72c4741c38c5ba09de [4010/7459] firmware: arm: Group interface drivers under arm/
:::::: branch date: 14 hours ago
:::::: commit date: 8 days ago
config: s390-randconfig-r2107-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117112926.VaJ4DrTm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c7014922f5829426952a38d079220c21b0a8ebe8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261117112926.VaJ4DrTm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/arm/scmi/bus.c:139:18-22: ERROR: reference preceded by free on line 113
   drivers/firmware/arm/scmi/bus.c:139:18-22: ERROR: reference preceded by free on line 124
--
>> drivers/firmware/arm/scmi/raw_mode.c:955:8-24: WARNING: scmi_dbg_raw_mode_reset_fops: .write() has stream semantic; safe to change nonseekable_open -> stream_open.

vim +139 drivers/firmware/arm/scmi/bus.c

3b0c8dd5a8d57d drivers/firmware/arm_scmi/bus.c Sudeep Holla     2026-10-05   44  
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   45  /**
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   46   * scmi_protocol_device_request  - Helper to request a device
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   47   *
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   48   * @id_table: A protocol/name pair descriptor for the device to be created.
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   49   *
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   50   * This helper let an SCMI driver request specific devices identified by the
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   51   * @id_table to be created for each active SCMI instance.
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   52   *
21ee965267bcbd drivers/firmware/arm_scmi/bus.c Sudeep Holla     2025-01-31   53   * The requested device name MUST NOT be already existent for this protocol;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   54   * at first the freshly requested @id_table is annotated in the IDR table
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   55   * @scmi_requested_devices and then the requested device is advertised to any
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   56   * registered party via the @scmi_requested_devices_nh notification chain.
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   57   *
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   58   * Return: 0 on Success
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   59   */
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   60  static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   61  {
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   62  	int ret = 0;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   63  	struct list_head *head, *phead = NULL;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   64  	struct scmi_requested_dev *rdev;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   65  
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   66  	pr_debug("Requesting SCMI device (%s) for protocol %x\n",
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   67  		 id_table->name, id_table->protocol_id);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   68  
3b0c8dd5a8d57d drivers/firmware/arm_scmi/bus.c Sudeep Holla     2026-10-05   69  	if (scmi_raw_mode_only()) {
ba80acb0dfca87 drivers/firmware/arm_scmi/bus.c Cristian Marussi 2023-01-18   70  		pr_warn("SCMI Raw mode active. Rejecting '%s'/0x%02X\n",
ba80acb0dfca87 drivers/firmware/arm_scmi/bus.c Cristian Marussi 2023-01-18   71  			id_table->name, id_table->protocol_id);
ba80acb0dfca87 drivers/firmware/arm_scmi/bus.c Cristian Marussi 2023-01-18   72  		return -EINVAL;
ba80acb0dfca87 drivers/firmware/arm_scmi/bus.c Cristian Marussi 2023-01-18   73  	}
ba80acb0dfca87 drivers/firmware/arm_scmi/bus.c Cristian Marussi 2023-01-18   74  
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   75  	/*
21ee965267bcbd drivers/firmware/arm_scmi/bus.c Sudeep Holla     2025-01-31   76  	 * Find the matching protocol rdev list and then search of any
21ee965267bcbd drivers/firmware/arm_scmi/bus.c Sudeep Holla     2025-01-31   77  	 * existent equally named device...fails if any duplicate found.
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   78  	 */
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   79  	mutex_lock(&scmi_requested_devices_mtx);
21ee965267bcbd drivers/firmware/arm_scmi/bus.c Sudeep Holla     2025-01-31   80  	phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
21ee965267bcbd drivers/firmware/arm_scmi/bus.c Sudeep Holla     2025-01-31   81  	if (phead) {
21ee965267bcbd drivers/firmware/arm_scmi/bus.c Sudeep Holla     2025-01-31   82  		head = phead;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   83  		list_for_each_entry(rdev, head, node) {
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   84  			if (!strcmp(rdev->id_table->name, id_table->name)) {
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   85  				pr_err("Ignoring duplicate request [%d] %s\n",
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   86  				       rdev->id_table->protocol_id,
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   87  				       rdev->id_table->name);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   88  				ret = -EINVAL;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   89  				goto out;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   90  			}
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   91  		}
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   92  	}
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   93  
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   94  	/*
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   95  	 * No duplicate found for requested id_table, so let's create a new
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   96  	 * requested device entry for this new valid request.
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   97  	 */
bf4afc53b77aea drivers/firmware/arm_scmi/bus.c Linus Torvalds   2026-02-21   98  	rdev = kzalloc_obj(*rdev);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22   99  	if (!rdev) {
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  100  		ret = -ENOMEM;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  101  		goto out;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  102  	}
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  103  	rdev->id_table = id_table;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  104  
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  105  	/*
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  106  	 * Append the new requested device table descriptor to the head of the
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  107  	 * related protocol list, eventually creating such head if not already
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  108  	 * there.
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  109  	 */
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  110  	if (!phead) {
bf4afc53b77aea drivers/firmware/arm_scmi/bus.c Linus Torvalds   2026-02-21  111  		phead = kzalloc_obj(*phead);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  112  		if (!phead) {
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22 @113  			kfree(rdev);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  114  			ret = -ENOMEM;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  115  			goto out;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  116  		}
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  117  		INIT_LIST_HEAD(phead);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  118  
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  119  		ret = idr_alloc(&scmi_requested_devices, (void *)phead,
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  120  				id_table->protocol_id,
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  121  				id_table->protocol_id + 1, GFP_KERNEL);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  122  		if (ret != id_table->protocol_id) {
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  123  			pr_err("Failed to save SCMI device - ret:%d\n", ret);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  124  			kfree(rdev);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  125  			kfree(phead);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  126  			ret = -EINVAL;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  127  			goto out;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  128  		}
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  129  		ret = 0;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  130  	}
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  131  	list_add(&rdev->node, phead);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  132  
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  133  out:
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  134  	mutex_unlock(&scmi_requested_devices_mtx);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  135  
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  136  	if (!ret)
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  137  		blocking_notifier_call_chain(&scmi_requested_devices_nh,
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  138  					     SCMI_BUS_NOTIFY_DEVICE_REQUEST,
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22 @139  					     (void *)rdev->id_table);
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  140  
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  141  	return ret;
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  142  }
d3cd7c525fd2ec drivers/firmware/arm_scmi/bus.c Cristian Marussi 2022-12-22  143  

:::::: The code at line 139 was first introduced by commit
:::::: d3cd7c525fd2ecce3a6c963f314969a54783d211 firmware: arm_scmi: Refactor protocol device creation

:::::: TO: Cristian Marussi <cristian.marussi@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

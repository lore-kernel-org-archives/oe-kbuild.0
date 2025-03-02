Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846801E9901
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740931425; cv=none; b=T9e1+T6KuFd9Nj26be5P2qZhmurCD+GY8IcbyzOyIVcYGgT1jfusJYAHlPxbZIG+qavoKC2uD9ZiiqlIkfWEoNl565gAWfvS+QhyjqaiMPLROrmYBuTUKIUB2rPUc2VRr8EpoqZA4r9nWHD6+JxLlxJ9rwjcKrSwSkY+p64hzdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740931425; c=relaxed/simple;
	bh=2QjfuZh4O33i22/ALvKzdC+Pq4klQ2Mp/yxgNA1XZPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SCfzMpiVDeaMJD0zWoc0FvFVRZBgsSg1jwNpfXzlkKIgs8W0J97MBtXs/t7zr27t/ZEgP5d5sl7uvZKww4s2fFre5SXPXI625Rd4cIgQ4wNVwJLXhJufTbZUn+Sg/FWe1MHqGcfuljtAtaAaLDbmjTj1SgULsWT7NsfamwPJktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FG9TeTj6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FG9TeTj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740931423; x=1772467423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2QjfuZh4O33i22/ALvKzdC+Pq4klQ2Mp/yxgNA1XZPk=;
  b=FG9TeTj6XAjBsEc+9j7Spp77Fz9aCgfyx1dAwA7I0I4sLKHPy0JmN4oB
   6PYplCkx0F3cXF2xeczJ7i0AcCCyHovWI6qHfEFjKjUHiRvDPhSoxFr28
   pJj+mDB4aaSOJIn/hFE/anoQbk0JPoYONQW/T/KgTpnoEuEhe5jKXfX7n
   lNvHICn4fWt6ArWF7MFR5yZLLwoDB8lXiD/tGC12uLdRseWuW1bA4kpLo
   JqrLwkdLIh6CvXR0qBYO+ouDAPuexUgsgkFOGjSOMVZPC+clS8rp31gZC
   sCLejdhbzmd+SVJD1e0qBT2RRNBeGcHW0QzllH9p47ggoGdl6WJaLwSCE
   A==;
X-CSE-ConnectionGUID: sYuPQR4jRRKfhCHc8x2w4g==
X-CSE-MsgGUID: TTBSbZrJQ+OgW/hqeBx8+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41838188"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="41838188"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 08:03:42 -0800
X-CSE-ConnectionGUID: Wj2+mA12Rh2TzzKIIEfQog==
X-CSE-MsgGUID: L5FMlyh5S+WaMac9SKmS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="122389527"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Mar 2025 08:03:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toln0-000HQc-0e;
	Sun, 02 Mar 2025 16:03:38 +0000
Date: Mon, 3 Mar 2025 00:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1] Bluetooth: btintel_pcie: Add support for device
 coredump
Message-ID: <202503022332.biRVCDMP-lkp@intel.com>
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
In-Reply-To: <20250227102625.20642-1-kiran.k@intel.com>
References: <20250227102625.20642-1-kiran.k@intel.com>
TO: Kiran K <kiran.k@intel.com>
TO: linux-bluetooth@vger.kernel.org
CC: ravishankar.srivatsa@intel.com
CC: chethan.tumkur.narayan@intel.com
CC: chandrashekar.devegowda@intel.com
CC: vijay.satija@intel.com
CC: Kiran K <kiran.k@intel.com>

Hi Kiran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20250228]
[cannot apply to bluetooth/master linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiran-K/Bluetooth-btintel_pcie-Add-support-for-device-coredump/20250227-181131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20250227102625.20642-1-kiran.k%40intel.com
patch subject: [PATCH v1] Bluetooth: btintel_pcie: Add support for device coredump
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sparc-randconfig-r071-20250302 (https://download.01.org/0day-ci/archive/20250302/202503022332.biRVCDMP-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503022332.biRVCDMP-lkp@intel.com/

New smatch warnings:
drivers/bluetooth/btintel_pcie.c:493 btintel_pcie_read_dram_buffers() error: snprintf() is printing too much 100 vs 70

Old smatch warnings:
drivers/bluetooth/btintel_pcie.c:144 btintel_pcie_setup_dbgc() warn: right shifting more than type allows 32 vs 32

vim +493 drivers/bluetooth/btintel_pcie.c

b8cc1a1cce30cc Kiran K 2025-02-27  453  
b8cc1a1cce30cc Kiran K 2025-02-27  454  static int btintel_pcie_read_dram_buffers(struct btintel_pcie_data *data)
b8cc1a1cce30cc Kiran K 2025-02-27  455  {
b8cc1a1cce30cc Kiran K 2025-02-27  456  	u32 offset, prev_size, wr_ptr_status, dump_size, i;
b8cc1a1cce30cc Kiran K 2025-02-27  457  	struct btintel_pcie_dbgc *dbgc = &data->dbgc;
b8cc1a1cce30cc Kiran K 2025-02-27  458  	u8 buf_idx, dump_time_len, fw_build;
b8cc1a1cce30cc Kiran K 2025-02-27  459  	struct hci_dev *hdev = data->hdev;
b8cc1a1cce30cc Kiran K 2025-02-27  460  	struct intel_tlv *tlv;
b8cc1a1cce30cc Kiran K 2025-02-27  461  	struct timespec64 now;
b8cc1a1cce30cc Kiran K 2025-02-27  462  	struct sk_buff *skb;
b8cc1a1cce30cc Kiran K 2025-02-27  463  	struct tm tm_now;
b8cc1a1cce30cc Kiran K 2025-02-27  464  	char buf[100];
b8cc1a1cce30cc Kiran K 2025-02-27  465  	u16 hdr_len;
b8cc1a1cce30cc Kiran K 2025-02-27  466  	int ret;
b8cc1a1cce30cc Kiran K 2025-02-27  467  
b8cc1a1cce30cc Kiran K 2025-02-27  468  	wr_ptr_status = btintel_pcie_rd_dev_mem(data, BTINTEL_PCIE_DBGC_CUR_DBGBUFF_STATUS);
b8cc1a1cce30cc Kiran K 2025-02-27  469  	offset = wr_ptr_status & BTINTEL_PCIE_DBG_OFFSET_BIT_MASK;
b8cc1a1cce30cc Kiran K 2025-02-27  470  
b8cc1a1cce30cc Kiran K 2025-02-27  471  	buf_idx = BTINTEL_PCIE_DBGC_DBG_BUF_IDX(wr_ptr_status);
b8cc1a1cce30cc Kiran K 2025-02-27  472  	if (buf_idx > dbgc->count) {
b8cc1a1cce30cc Kiran K 2025-02-27  473  		bt_dev_warn(hdev, "Buffer index is invalid");
b8cc1a1cce30cc Kiran K 2025-02-27  474  		return -EINVAL;
b8cc1a1cce30cc Kiran K 2025-02-27  475  	}
b8cc1a1cce30cc Kiran K 2025-02-27  476  
b8cc1a1cce30cc Kiran K 2025-02-27  477  	prev_size = buf_idx * BTINTEL_PCIE_DBGC_BUFFER_SIZE;
b8cc1a1cce30cc Kiran K 2025-02-27  478  	if (prev_size + offset >= prev_size)
b8cc1a1cce30cc Kiran K 2025-02-27  479  		data->dmp_hdr.write_ptr = prev_size + offset;
b8cc1a1cce30cc Kiran K 2025-02-27  480  	else
b8cc1a1cce30cc Kiran K 2025-02-27  481  		return -EINVAL;
b8cc1a1cce30cc Kiran K 2025-02-27  482  
b8cc1a1cce30cc Kiran K 2025-02-27  483  	ktime_get_real_ts64(&now);
b8cc1a1cce30cc Kiran K 2025-02-27  484  	time64_to_tm(now.tv_sec, 0, &tm_now);
b8cc1a1cce30cc Kiran K 2025-02-27  485  	dump_time_len = snprintf(buf, sizeof(buf), "Dump Time: %02d-%02d-%04ld %02d:%02d:%02d",
b8cc1a1cce30cc Kiran K 2025-02-27  486  				 tm_now.tm_mday, tm_now.tm_mon + 1, tm_now.tm_year + 1900,
b8cc1a1cce30cc Kiran K 2025-02-27  487  				 tm_now.tm_hour, tm_now.tm_min, tm_now.tm_sec);
b8cc1a1cce30cc Kiran K 2025-02-27  488  
b8cc1a1cce30cc Kiran K 2025-02-27  489  	fw_build = snprintf(buf + dump_time_len, sizeof(buf),
b8cc1a1cce30cc Kiran K 2025-02-27  490  			    "Firmware Timestamp: Year %u WW %02u buildtype %u build %u",
b8cc1a1cce30cc Kiran K 2025-02-27  491  			    2000 + (data->dmp_hdr.fw_timestamp >> 8),
b8cc1a1cce30cc Kiran K 2025-02-27  492  			    data->dmp_hdr.fw_timestamp & 0xff, data->dmp_hdr.fw_build_type,
b8cc1a1cce30cc Kiran K 2025-02-27 @493  			    data->dmp_hdr.fw_build_num);
b8cc1a1cce30cc Kiran K 2025-02-27  494  
b8cc1a1cce30cc Kiran K 2025-02-27  495  	hdr_len = sizeof(*tlv) + sizeof(data->dmp_hdr.cnvi_bt) +
b8cc1a1cce30cc Kiran K 2025-02-27  496  		  sizeof(*tlv) + sizeof(data->dmp_hdr.write_ptr) +
b8cc1a1cce30cc Kiran K 2025-02-27  497  		  sizeof(*tlv) + sizeof(data->dmp_hdr.wrap_ctr) +
b8cc1a1cce30cc Kiran K 2025-02-27  498  		  sizeof(*tlv) + sizeof(data->dmp_hdr.trigger_reason) +
b8cc1a1cce30cc Kiran K 2025-02-27  499  		  sizeof(*tlv) + sizeof(data->dmp_hdr.fw_git_sha1) +
b8cc1a1cce30cc Kiran K 2025-02-27  500  		  sizeof(*tlv) + sizeof(data->dmp_hdr.cnvr_top) +
b8cc1a1cce30cc Kiran K 2025-02-27  501  		  sizeof(*tlv) + sizeof(data->dmp_hdr.cnvi_top) +
b8cc1a1cce30cc Kiran K 2025-02-27  502  		  sizeof(*tlv) + dump_time_len +
b8cc1a1cce30cc Kiran K 2025-02-27  503  		  sizeof(*tlv) + fw_build;
b8cc1a1cce30cc Kiran K 2025-02-27  504  
b8cc1a1cce30cc Kiran K 2025-02-27  505  	dump_size = hdr_len + sizeof(hdr_len);
b8cc1a1cce30cc Kiran K 2025-02-27  506  
b8cc1a1cce30cc Kiran K 2025-02-27  507  	skb = alloc_skb(dump_size, GFP_KERNEL);
b8cc1a1cce30cc Kiran K 2025-02-27  508  	if (!skb)
b8cc1a1cce30cc Kiran K 2025-02-27  509  		return -ENOMEM;
b8cc1a1cce30cc Kiran K 2025-02-27  510  
b8cc1a1cce30cc Kiran K 2025-02-27  511  	/* Add debug buffers data length to dump size */
b8cc1a1cce30cc Kiran K 2025-02-27  512  	dump_size += BTINTEL_PCIE_DBGC_BUFFER_SIZE * dbgc->count;
b8cc1a1cce30cc Kiran K 2025-02-27  513  
b8cc1a1cce30cc Kiran K 2025-02-27  514  	ret = hci_devcd_init(hdev, dump_size);
b8cc1a1cce30cc Kiran K 2025-02-27  515  	if (ret) {
b8cc1a1cce30cc Kiran K 2025-02-27  516  		bt_dev_err(hdev, "Failed to init devcoredump, err %d", ret);
b8cc1a1cce30cc Kiran K 2025-02-27  517  		kfree_skb(skb);
b8cc1a1cce30cc Kiran K 2025-02-27  518  		return ret;
b8cc1a1cce30cc Kiran K 2025-02-27  519  	}
b8cc1a1cce30cc Kiran K 2025-02-27  520  
b8cc1a1cce30cc Kiran K 2025-02-27  521  	skb_put_data(skb, &hdr_len, sizeof(hdr_len));
b8cc1a1cce30cc Kiran K 2025-02-27  522  
b8cc1a1cce30cc Kiran K 2025-02-27  523  	btintel_pcie_copy_tlv(skb, BTINTEL_CNVI_BT, &data->dmp_hdr.cnvi_bt,
b8cc1a1cce30cc Kiran K 2025-02-27  524  			      sizeof(data->dmp_hdr.cnvi_bt));
b8cc1a1cce30cc Kiran K 2025-02-27  525  
b8cc1a1cce30cc Kiran K 2025-02-27  526  	btintel_pcie_copy_tlv(skb, BTINTEL_WRITE_PTR, &data->dmp_hdr.write_ptr,
b8cc1a1cce30cc Kiran K 2025-02-27  527  			      sizeof(data->dmp_hdr.write_ptr));
b8cc1a1cce30cc Kiran K 2025-02-27  528  
b8cc1a1cce30cc Kiran K 2025-02-27  529  	data->dmp_hdr.wrap_ctr = btintel_pcie_rd_dev_mem(data,
b8cc1a1cce30cc Kiran K 2025-02-27  530  							 BTINTEL_PCIE_DBGC_DBGBUFF_WRAP_ARND);
b8cc1a1cce30cc Kiran K 2025-02-27  531  
b8cc1a1cce30cc Kiran K 2025-02-27  532  	btintel_pcie_copy_tlv(skb, BTINTEL_WRAP_CTR, &data->dmp_hdr.wrap_ctr,
b8cc1a1cce30cc Kiran K 2025-02-27  533  			      sizeof(data->dmp_hdr.wrap_ctr));
b8cc1a1cce30cc Kiran K 2025-02-27  534  
b8cc1a1cce30cc Kiran K 2025-02-27  535  	btintel_pcie_copy_tlv(skb, BTINTEL_TRIGGER_REASON, &data->dmp_hdr.trigger_reason,
b8cc1a1cce30cc Kiran K 2025-02-27  536  			      sizeof(data->dmp_hdr.trigger_reason));
b8cc1a1cce30cc Kiran K 2025-02-27  537  
b8cc1a1cce30cc Kiran K 2025-02-27  538  	btintel_pcie_copy_tlv(skb, BTINTEL_FW_SHA, &data->dmp_hdr.fw_git_sha1,
b8cc1a1cce30cc Kiran K 2025-02-27  539  			      sizeof(data->dmp_hdr.fw_git_sha1));
b8cc1a1cce30cc Kiran K 2025-02-27  540  
b8cc1a1cce30cc Kiran K 2025-02-27  541  	btintel_pcie_copy_tlv(skb, BTINTEL_CNVR_TOP, &data->dmp_hdr.cnvr_top,
b8cc1a1cce30cc Kiran K 2025-02-27  542  			      sizeof(data->dmp_hdr.cnvr_top));
b8cc1a1cce30cc Kiran K 2025-02-27  543  
b8cc1a1cce30cc Kiran K 2025-02-27  544  	btintel_pcie_copy_tlv(skb, BTINTEL_CNVI_TOP, &data->dmp_hdr.cnvi_top,
b8cc1a1cce30cc Kiran K 2025-02-27  545  			      sizeof(data->dmp_hdr.cnvi_top));
b8cc1a1cce30cc Kiran K 2025-02-27  546  
b8cc1a1cce30cc Kiran K 2025-02-27  547  	btintel_pcie_copy_tlv(skb, BTINTEL_DUMP_TIME, buf, dump_time_len);
b8cc1a1cce30cc Kiran K 2025-02-27  548  
b8cc1a1cce30cc Kiran K 2025-02-27  549  	btintel_pcie_copy_tlv(skb, BTINTEL_FW_BUILD, buf + dump_time_len, fw_build);
b8cc1a1cce30cc Kiran K 2025-02-27  550  
b8cc1a1cce30cc Kiran K 2025-02-27  551  	ret = hci_devcd_append(hdev, skb);
b8cc1a1cce30cc Kiran K 2025-02-27  552  	if (ret)
b8cc1a1cce30cc Kiran K 2025-02-27  553  		goto exit_err;
b8cc1a1cce30cc Kiran K 2025-02-27  554  
b8cc1a1cce30cc Kiran K 2025-02-27  555  	for (i = 0; i < dbgc->count; i++) {
b8cc1a1cce30cc Kiran K 2025-02-27  556  		ret = btintel_pcie_add_dmp_data(hdev, dbgc->bufs[i].data,
b8cc1a1cce30cc Kiran K 2025-02-27  557  						BTINTEL_PCIE_DBGC_BUFFER_SIZE);
b8cc1a1cce30cc Kiran K 2025-02-27  558  		if (ret)
b8cc1a1cce30cc Kiran K 2025-02-27  559  			break;
b8cc1a1cce30cc Kiran K 2025-02-27  560  	}
b8cc1a1cce30cc Kiran K 2025-02-27  561  
b8cc1a1cce30cc Kiran K 2025-02-27  562  exit_err:
b8cc1a1cce30cc Kiran K 2025-02-27  563  	hci_devcd_complete(hdev);
b8cc1a1cce30cc Kiran K 2025-02-27  564  	return ret;
b8cc1a1cce30cc Kiran K 2025-02-27  565  }
b8cc1a1cce30cc Kiran K 2025-02-27  566  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

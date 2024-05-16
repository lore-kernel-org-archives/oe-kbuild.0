Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F63615CB
	for <oe-kbuild@lists.linux.dev>; Thu, 16 May 2024 20:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715893092; cv=none; b=QnVA+3MteMBe/GjEIlngc3cotWkrsp3oZXwQ01iWmMdzCp8zYryCVv+BUjXkSnCtoH8hydmPrbS0Ku6cEDvOfwJevZ7VLLbT7e0WRK0uKs7q8yMsGIdXPNvdl6lNdLfnI+vgLmRqCtJmcyczyzUDBgZANk8I5c+ricldxoF3Bgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715893092; c=relaxed/simple;
	bh=2fdNiUJCkpazt+41T8aolA4uyww/TSP1P/EfA3zGhCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jlcSPCvw3i/7LlpsQBHaqJmCW35J3fRybJ7YaVUxcXgmqUCIaKfguSKPGAoPBguOZ9OcbxFot60UNvykuXXQ2hhD/ulZf9oo1ZT+KE1UKd8ExmELvMtm0eXhJT5obVr7U0YRHZxUsQ3FIBu1jhgO8Yuhs9G+JCLrFF/sNWtiQZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iY/z3YrD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iY/z3YrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715893091; x=1747429091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2fdNiUJCkpazt+41T8aolA4uyww/TSP1P/EfA3zGhCw=;
  b=iY/z3YrDUFA6R4Uir5G52TLXSVHYV2JSZfMtmk626/NkLlEGDbyCEju+
   pmcXxRx/re4SPOhbtRcJbtgmiInkD4waQBa/H9WuZuyBHP29j9ud3uvvy
   V24GPk2y5ra7S9VpbFoMhHTzDxcGErbopkc4/y+vQwnRMZvf65ltGcLQX
   wsk+RyHFEFy+gbmANxoPBgkVKfkDt5G6CqVMnjJpnhUHIu3KNymndZYt1
   4Zy3yiWnTTgVfw176zMg66I2V6rn3hqy3szTgCl88bVn2qaM3CqKpnCQY
   ca3sgQToKmBSzCE8OMovLSibIT4MJn4r7RhfYgR5RyeP5FVUU2ByzKhvb
   A==;
X-CSE-ConnectionGUID: tvIsTrLTSfytGT4EdtG8pg==
X-CSE-MsgGUID: a3EffRVRTqWKoKOfrc0u5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11890971"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="11890971"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 13:58:10 -0700
X-CSE-ConnectionGUID: ZBK+i9XrRs+kqfqk+4jMCg==
X-CSE-MsgGUID: 5rXg3JArR+SjmrGGXeB9mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="31687982"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 May 2024 13:58:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7iAw-000Emq-2L;
	Thu, 16 May 2024 20:58:06 +0000
Date: Fri, 17 May 2024 04:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/bluetooth/btintel_pcie.c:386 btintel_pcie_recv_frame() warn:
 variable dereferenced before check 'data' (see line 380)
Message-ID: <202405170424.97VIwnBn-lkp@intel.com>
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
TO: Kiran K <kiran.k@intel.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Chandrashekar <chandrashekar.devegowda@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea5f6ad9ad9645733b72ab53a98e719b460d36a6
commit: 6e65a09f927566f257322358d429b267548473eb Bluetooth: btintel_pcie: Add *setup* function to download firmware
date:   2 days ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r081-20240516 (https://download.01.org/0day-ci/archive/20240517/202405170424.97VIwnBn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405170424.97VIwnBn-lkp@intel.com/

smatch warnings:
drivers/bluetooth/btintel_pcie.c:386 btintel_pcie_recv_frame() warn: variable dereferenced before check 'data' (see line 380)

vim +/data +386 drivers/bluetooth/btintel_pcie.c

c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  366  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  367  /* Process the received rx data
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  368   * It check the frame header to identify the data type and create skb
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  369   * and calling HCI API
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  370   */
6e65a09f927566 Kiran K          2024-05-07  371  static int btintel_pcie_recv_frame(struct btintel_pcie_data *data,
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  372  				       struct sk_buff *skb)
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  373  {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  374  	int ret;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  375  	u8 pkt_type;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  376  	u16 plen;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  377  	u32 pcie_pkt_type;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  378  	struct sk_buff *new_skb;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  379  	void *pdata;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07 @380  	struct hci_dev *hdev = data->hdev;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  381  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  382  	spin_lock(&data->hci_rx_lock);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  383  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  384  	/* The first 4 bytes indicates the Intel PCIe specific packet type */
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  385  	pdata = skb_pull_data(skb, BTINTEL_PCIE_HCI_TYPE_LEN);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07 @386  	if (!data) {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  387  		bt_dev_err(hdev, "Corrupted packet received");
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  388  		ret = -EILSEQ;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  389  		goto exit_error;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  390  	}
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  391  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  392  	pcie_pkt_type = get_unaligned_le32(pdata);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  393  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  394  	switch (pcie_pkt_type) {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  395  	case BTINTEL_PCIE_HCI_ACL_PKT:
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  396  		if (skb->len >= HCI_ACL_HDR_SIZE) {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  397  			plen = HCI_ACL_HDR_SIZE + __le16_to_cpu(hci_acl_hdr(skb)->dlen);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  398  			pkt_type = HCI_ACLDATA_PKT;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  399  		} else {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  400  			bt_dev_err(hdev, "ACL packet is too short");
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  401  			ret = -EILSEQ;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  402  			goto exit_error;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  403  		}
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  404  		break;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  405  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  406  	case BTINTEL_PCIE_HCI_SCO_PKT:
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  407  		if (skb->len >= HCI_SCO_HDR_SIZE) {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  408  			plen = HCI_SCO_HDR_SIZE + hci_sco_hdr(skb)->dlen;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  409  			pkt_type = HCI_SCODATA_PKT;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  410  		} else {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  411  			bt_dev_err(hdev, "SCO packet is too short");
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  412  			ret = -EILSEQ;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  413  			goto exit_error;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  414  		}
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  415  		break;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  416  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  417  	case BTINTEL_PCIE_HCI_EVT_PKT:
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  418  		if (skb->len >= HCI_EVENT_HDR_SIZE) {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  419  			plen = HCI_EVENT_HDR_SIZE + hci_event_hdr(skb)->plen;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  420  			pkt_type = HCI_EVENT_PKT;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  421  		} else {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  422  			bt_dev_err(hdev, "Event packet is too short");
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  423  			ret = -EILSEQ;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  424  			goto exit_error;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  425  		}
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  426  		break;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  427  	default:
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  428  		bt_dev_err(hdev, "Invalid packet type received: 0x%4.4x",
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  429  			   pcie_pkt_type);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  430  		ret = -EINVAL;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  431  		goto exit_error;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  432  	}
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  433  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  434  	if (skb->len < plen) {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  435  		bt_dev_err(hdev, "Received corrupted packet. type: 0x%2.2x",
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  436  			   pkt_type);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  437  		ret = -EILSEQ;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  438  		goto exit_error;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  439  	}
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  440  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  441  	bt_dev_dbg(hdev, "pkt_type: 0x%2.2x len: %u", pkt_type, plen);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  442  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  443  	new_skb = bt_skb_alloc(plen, GFP_ATOMIC);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  444  	if (!new_skb) {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  445  		bt_dev_err(hdev, "Failed to allocate memory for skb of len: %u",
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  446  			   skb->len);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  447  		ret = -ENOMEM;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  448  		goto exit_error;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  449  	}
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  450  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  451  	hci_skb_pkt_type(new_skb) = pkt_type;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  452  	skb_put_data(new_skb, skb->data, plen);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  453  	hdev->stat.byte_rx += plen;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  454  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  455  	if (pcie_pkt_type == BTINTEL_PCIE_HCI_EVT_PKT)
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  456  		ret = btintel_recv_event(hdev, new_skb);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  457  	else
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  458  		ret = hci_recv_frame(hdev, new_skb);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  459  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  460  exit_error:
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  461  	if (ret)
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  462  		hdev->stat.err_rx++;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  463  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  464  	spin_unlock(&data->hci_rx_lock);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  465  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  466  	return ret;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  467  }
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  468  

:::::: The code at line 386 was first introduced by commit
:::::: c2b636b3f788d10486a6691ad6dd3ec4c93bd78e Bluetooth: btintel_pcie: Add support for PCIe transport

:::::: TO: Tedd Ho-Jeong An <tedd.an@intel.com>
:::::: CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

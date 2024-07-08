Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED71411E7
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720453442; cv=none; b=h/U4436+HJNcB5J3VJ2lHeNnYXVOHHyGbjR2UMLjSZMuYnY44WQJzqWa+SRUNzCDaUrtVSaz4LNCGN/12GH/q5OmGAElPAPN0V8pT9uYEW/rtBcdIrQqwV+vpTasH0pKQQRxZP1fJ9EbBdzif7WNUqpCpGTDFl2fFuROk962yTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720453442; c=relaxed/simple;
	bh=7sGcaMRkW3mnjgFZzQavnnGKfYAyfhfoQFMU+0im/fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MP66xhNd3jwLNhWsGnmiW26kjKONlIw0fv4wmm3+bQ6yH/8ZH2cLGr9lWlDxPvTzmlJFNBgl8vQ5XTfnpxRLnBTaDeotjvMq/YE3azfsASettqVmjoGT5ywd/PUJDqONnS2B4fbT8NV+eWO05W4ks2F/1QtWbc6QqY9P/h4tbg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YEJmGJoT; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YEJmGJoT"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-703631c4930so1092089a34.1
        for <oe-kbuild@lists.linux.dev>; Mon, 08 Jul 2024 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720453438; x=1721058238; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQ3Mopfr9OFP/Lm4g5Jv5/xOzl15GckJDaSdKSDrqmA=;
        b=YEJmGJoTfUat8fS0Du4wNFk8ic0ez1v6bW6JMERWbRS8P2BDv29gTdmTGU7lnvs2Fj
         AO9JcGUdlNcdWbCK0ID+J+tGm37gyhx39fnAMJdymgnEFs5id9V5Yb79l0yer2AFVXRK
         VjzICFpcEC6/Yt26R+JHeB5ihkFn0op0mROW/OJj9PgqNUrLEFZ2cW2pOL1bEbnC5UwZ
         genOfXoQLh2SfTeiryhkxQPyLglXwKFZGWKEoD0LkZrqdBjKzIiwCzpnySKtri0UvKUL
         iLVaxgqCy/VlpdFG3sOTOeVsixZkp6UpfVcH+6jW/bnHebvMsqhCswXJrnKJ5kqUbvhC
         9JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720453438; x=1721058238;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ3Mopfr9OFP/Lm4g5Jv5/xOzl15GckJDaSdKSDrqmA=;
        b=MVoLOCQKIiSvcrbht5Inn+W86DcbvuTHBl+0oZtZdjlDeDa+bhLr6T16qyi3uKlk52
         7EknFbM5cH9SMNoYFzYtEQPz+vmOkVPoxln31DtR6UlA+gI1mRYCRd5bD0W1Bg9wZMTz
         Gi48DMvwKF3gpW10lbT1ldiQxggEMvYzca7vCBZbVqe+baoDhBh3jnAYICEIGuBbK0F7
         YoeHltKmCKGfmILjBB+IxaCD7+sW1egdDpvENTdk6M2aOi0Jqyd81cYmnd83BDIuz57V
         C5iN7d+3xc9SUSxH/VZdpAKi6qgIOYhDUFGl6wWDb4dacaOWAK8SJ0RMgmW2IsS0OY0/
         5wqw==
X-Gm-Message-State: AOJu0Ywojm78i3ZjcEeU1zO0R0rRzG42aQvrsc9t8t/ckNSYJveP1Sdl
	2KmmZEtMbwt22o2xb7TiMCESOjRFiaFd+YsY9hMWs6XK/qNmBzBayuvNSdZ4ZQ8xDngn28hzELQ
	/
X-Google-Smtp-Source: AGHT+IHB1nTp59rphE0KubXaXngHOqlZNMnZ5LaiKC9tdS8+9G4fsgSB9j/29Qgmh1c3wXrXU94ZDg==
X-Received: by 2002:a9d:561a:0:b0:703:668f:3228 with SMTP id 46e09a7af769-703668f33damr5737309a34.38.1720453438421;
        Mon, 08 Jul 2024 08:43:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6fc:b7f5:4853:aff3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374f78d35sm34537a34.23.2024.07.08.08.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 08:43:57 -0700 (PDT)
Date: Mon, 8 Jul 2024 17:43:56 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Benjamin Berg <benjamin.berg@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes@sipsolutions.net>,
	Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: [wireless-next:main 8/21]
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c:1764 iwl_pcie_get_page_hdr()
 error: uninitialized symbol 'ret'.
Message-ID: <07991b96-08f5-482f-98dd-93f426a57e4f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
head:   1b431ba4ef9a760e7643d6fbc53bf522d59650f3
commit: adc902ceada26add77ad75426805e973a7c67f01 [8/21] wifi: iwlwifi: keep the TSO and workaround pages mapped
config: x86_64-randconfig-161-20240706 (https://download.01.org/0day-ci/archive/20240706/202407062135.NNjnmMdR-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407062135.NNjnmMdR-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:1764 iwl_pcie_get_page_hdr() error: uninitialized symbol 'ret'.

vim +/ret +1764 drivers/net/wireless/intel/iwlwifi/pcie/tx.c

7f5e3038f02902 Benjamin Berg     2024-07-03  1735  static void *iwl_pcie_get_page_hdr(struct iwl_trans *trans,
49101078be769e Johannes Berg     2024-06-05  1736  				   size_t len, struct sk_buff *skb)
49101078be769e Johannes Berg     2024-06-05  1737  {
49101078be769e Johannes Berg     2024-06-05  1738  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
49101078be769e Johannes Berg     2024-06-05  1739  	struct iwl_tso_hdr_page *p = this_cpu_ptr(trans_pcie->txqs.tso_hdr_page);
adc902ceada26a Benjamin Berg     2024-07-03  1740  	struct iwl_tso_page_info *info;
49101078be769e Johannes Berg     2024-06-05  1741  	struct page **page_ptr;
adc902ceada26a Benjamin Berg     2024-07-03  1742  	dma_addr_t phys;
d023a228e927c1 Benjamin Berg     2024-07-03  1743  	void *ret;
49101078be769e Johannes Berg     2024-06-05  1744  
49101078be769e Johannes Berg     2024-06-05  1745  	page_ptr = (void *)((u8 *)skb->cb + trans_pcie->txqs.page_offs);
49101078be769e Johannes Berg     2024-06-05  1746  
49101078be769e Johannes Berg     2024-06-05  1747  	if (WARN_ON(*page_ptr))
49101078be769e Johannes Berg     2024-06-05  1748  		return NULL;
49101078be769e Johannes Berg     2024-06-05  1749  
49101078be769e Johannes Berg     2024-06-05  1750  	if (!p->page)
49101078be769e Johannes Berg     2024-06-05  1751  		goto alloc;
49101078be769e Johannes Berg     2024-06-05  1752  
49101078be769e Johannes Berg     2024-06-05  1753  	/*
49101078be769e Johannes Berg     2024-06-05  1754  	 * Check if there's enough room on this page
49101078be769e Johannes Berg     2024-06-05  1755  	 *
49101078be769e Johannes Berg     2024-06-05  1756  	 * Note that we put a page chaining pointer *last* in the
49101078be769e Johannes Berg     2024-06-05  1757  	 * page - we need it somewhere, and if it's there then we
49101078be769e Johannes Berg     2024-06-05  1758  	 * avoid DMA mapping the last bits of the page which may
49101078be769e Johannes Berg     2024-06-05  1759  	 * trigger the 32-bit boundary hardware bug.
49101078be769e Johannes Berg     2024-06-05  1760  	 *
49101078be769e Johannes Berg     2024-06-05  1761  	 * (see also get_workaround_page() in tx-gen2.c)
49101078be769e Johannes Berg     2024-06-05  1762  	 */
adc902ceada26a Benjamin Berg     2024-07-03  1763  	if (((unsigned long)p->pos & ~PAGE_MASK) + len < IWL_TSO_PAGE_DATA_SIZE) {
adc902ceada26a Benjamin Berg     2024-07-03 @1764  		info = IWL_TSO_PAGE_INFO(page_address(ret));

ret is uninitialized

49101078be769e Johannes Berg     2024-06-05  1765  		goto out;
adc902ceada26a Benjamin Berg     2024-07-03  1766  	}
49101078be769e Johannes Berg     2024-06-05  1767  
49101078be769e Johannes Berg     2024-06-05  1768  	/* We don't have enough room on this page, get a new one. */
adc902ceada26a Benjamin Berg     2024-07-03  1769  	iwl_pcie_free_and_unmap_tso_page(trans, p->page);
49101078be769e Johannes Berg     2024-06-05  1770  
49101078be769e Johannes Berg     2024-06-05  1771  alloc:
49101078be769e Johannes Berg     2024-06-05  1772  	p->page = alloc_page(GFP_ATOMIC);
49101078be769e Johannes Berg     2024-06-05  1773  	if (!p->page)
49101078be769e Johannes Berg     2024-06-05  1774  		return NULL;
49101078be769e Johannes Berg     2024-06-05  1775  	p->pos = page_address(p->page);
adc902ceada26a Benjamin Berg     2024-07-03  1776  
adc902ceada26a Benjamin Berg     2024-07-03  1777  	info = IWL_TSO_PAGE_INFO(page_address(ret));

Here too

adc902ceada26a Benjamin Berg     2024-07-03  1778  
49101078be769e Johannes Berg     2024-06-05  1779  	/* set the chaining pointer to NULL */
adc902ceada26a Benjamin Berg     2024-07-03  1780  	info->next = NULL;
adc902ceada26a Benjamin Berg     2024-07-03  1781  
adc902ceada26a Benjamin Berg     2024-07-03  1782  	/* Create a DMA mapping for the page */
adc902ceada26a Benjamin Berg     2024-07-03  1783  	phys = dma_map_page_attrs(trans->dev, p->page, 0, PAGE_SIZE,
adc902ceada26a Benjamin Berg     2024-07-03  1784  				  DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
adc902ceada26a Benjamin Berg     2024-07-03  1785  	if (unlikely(dma_mapping_error(trans->dev, phys))) {
adc902ceada26a Benjamin Berg     2024-07-03  1786  		__free_page(p->page);
adc902ceada26a Benjamin Berg     2024-07-03  1787  		p->page = NULL;
adc902ceada26a Benjamin Berg     2024-07-03  1788  
adc902ceada26a Benjamin Berg     2024-07-03  1789  		return NULL;
adc902ceada26a Benjamin Berg     2024-07-03  1790  	}
adc902ceada26a Benjamin Berg     2024-07-03  1791  
adc902ceada26a Benjamin Berg     2024-07-03  1792  	/* Store physical address and set use count */
adc902ceada26a Benjamin Berg     2024-07-03  1793  	info->dma_addr = phys;
adc902ceada26a Benjamin Berg     2024-07-03  1794  	refcount_set(&info->use_count, 1);
49101078be769e Johannes Berg     2024-06-05  1795  out:
49101078be769e Johannes Berg     2024-06-05  1796  	*page_ptr = p->page;
adc902ceada26a Benjamin Berg     2024-07-03  1797  	/* Return an internal reference for the caller */
adc902ceada26a Benjamin Berg     2024-07-03  1798  	refcount_inc(&info->use_count);
d023a228e927c1 Benjamin Berg     2024-07-03  1799  	ret = p->pos;
d023a228e927c1 Benjamin Berg     2024-07-03  1800  	p->pos += len;
d023a228e927c1 Benjamin Berg     2024-07-03  1801  
d023a228e927c1 Benjamin Berg     2024-07-03  1802  	return ret;
49101078be769e Johannes Berg     2024-06-05  1803  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


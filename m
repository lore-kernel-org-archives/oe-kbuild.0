Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98AA20013A
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355229; cv=none; b=rd0dEFq3zDd+ogrk0kTrcbtLN+1FXc+T87tPZYgRH5j7fVi1UKr0jNDML9K9R+twJ8uRuvt2rRdx24gaw6hjIMcv0oObkHE8N9GrTTT4kKs92ugGp3qwPonEU3dU0bFLeRCSQLpko/DVVPJgsU8Bug0lXcoLZcoc+vzQkF4alOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355229; c=relaxed/simple;
	bh=E3qrRqty89/tkddVAPv+ISzas4woe9FRB1malaDuEOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hoJCrDh0gRUb9ynEoIew2lnw1x6bZ3+rSHjX1i51Q6/kIW5HNoQAiWtO2BPeKBce6T+k5ZmIETqFlpktC2uJgD9FNZcKQz1575Jo6iOWpWcuJWjSzC+F9xj8gyirl3Hm5VOErr2lyJ9y0nOk6vGqbrSJraE5C2lZz2xnSuQhhW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWQPm/Mo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWQPm/Mo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765355227; x=1796891227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E3qrRqty89/tkddVAPv+ISzas4woe9FRB1malaDuEOo=;
  b=SWQPm/MoxkusBfzy1ih0QQv1K9KzlPJFEWJ80HZzQGw1bjic/MH+UeKt
   QLpKxbeD7i4QGKuYlFa5itWridjvAFamSiHsiU22HsKKj6BiZv8N4x4EK
   IKgzgsra52twTlwKxtC4FOKQfKGs5Ivw1LCZQiwdk9+m2quRKHKKTRFiH
   pmVYGDBquM602VqIOKPiH1mVhYOdi5lYPiiLMn20t35CvZoD7X7/moO8v
   9YBrk2MSdGdSUFDurL3TiqT9zss9Fw2mYJFWTdlD0KMt5B/XHkE73BslX
   t8kxtMkCwAGHe6+HJ/ZWd1JDNFDcym5Nn0G77pHjjwqXhkuo0U1QaUaZM
   Q==;
X-CSE-ConnectionGUID: WDDp+GvyTn6/n2aPpSDJAQ==
X-CSE-MsgGUID: rYxEx5gxSU+lSLVV37i3gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="69911039"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="69911039"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 00:27:04 -0800
X-CSE-ConnectionGUID: Ss/A+Q51RU2OtPuuRr49CA==
X-CSE-MsgGUID: 5Y2+PtrYQH2dw2XmKoKNdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196365918"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2025 00:27:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTFXJ-00000000305-17LE;
	Wed, 10 Dec 2025 08:27:01 +0000
Date: Wed, 10 Dec 2025 16:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlegacy/4965-mac.c:4277
 il4965_rx_handle() warn: variable dereferenced before check 'rxb->page' (see
 line 4249)
Message-ID: <202512101649.Q9JYuWWo-lkp@intel.com>
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
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Zi Yan <ziy@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9b47175e9131118e6f221cc8fb81397d62e7c91
commit: 56d578c1300f7efe9605b75714173dd3fda16fe2 mm: convert page_to_section() to memdesc_section()
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: alpha-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101649.Q9JYuWWo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512101649.Q9JYuWWo-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/intel/iwlegacy/4965-mac.c:4277 il4965_rx_handle() warn: variable dereferenced before check 'rxb->page' (see line 4249)

Old smatch warnings:
drivers/net/wireless/intel/iwlegacy/4965-mac.c:1740 il4965_tx_skb() warn: potential spectre issue 'il->stations[sta_id]->tid' [r] (local cap)
drivers/net/wireless/intel/iwlegacy/4965-mac.c:2822 il4965_hdl_tx() warn: potential spectre issue 'il->stations[sta_id]->tid' [r]
drivers/net/wireless/intel/iwlegacy/4965-mac.c:5388 __il4965_down() warn: mixing irq and irqsave

vim +4277 drivers/net/wireless/intel/iwlegacy/4965-mac.c

be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4198  
35b7fbfc51d61f drivers/net/wireless/intel/iwlegacy/4965-mac.c Lee Jones          2020-08-21  4199  /*
e2ebc8337d116a drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-10-24  4200   * il4965_rx_handle - Main entry function for receiving responses from uCode
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4201   *
d0c72347bece32 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-08-30  4202   * Uses the il->handlers callback function array to invoke
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4203   * the appropriate handlers, including command responses,
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4204   * frame-received notifications, and other notifications.
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4205   */
e7392364fcd100 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-11-15  4206  void
e7392364fcd100 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-11-15  4207  il4965_rx_handle(struct il_priv *il)
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4208  {
b73bb5f13bb607 drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-08-26  4209  	struct il_rx_buf *rxb;
dcae1c641a4d7b drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-08-26  4210  	struct il_rx_pkt *pkt;
46bc8d4b0e73ac drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-10-24  4211  	struct il_rx_queue *rxq = &il->rxq;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4212  	u32 r, i;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4213  	int reclaim;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4214  	unsigned long flags;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4215  	u8 fill_rx = 0;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4216  	u32 count = 8;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4217  	int total_empty;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4218  
0c2c885200057c drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-11-15  4219  	/* uCode's read idx (stored in shared DRAM) indicates the last Rx
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4220  	 * buffer that the driver may process (last buffer filled by ucode). */
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4221  	r = le16_to_cpu(rxq->rb_stts->closed_rb_num) & 0x0FFF;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4222  	i = rxq->read;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4223  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4224  	/* Rx interrupt, but nothing sent from uCode */
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4225  	if (i == r)
58de00a464f1e7 drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-11-15  4226  		D_RX("r = %d, i = %d\n", r, i);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4227  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4228  	/* calculate total frames need to be restock after handling RX */
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4229  	total_empty = r - rxq->write_actual;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4230  	if (total_empty < 0)
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4231  		total_empty += RX_QUEUE_SIZE;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4232  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4233  	if (total_empty > (RX_QUEUE_SIZE / 2))
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4234  		fill_rx = 1;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4235  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4236  	while (i != r) {
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4237  		rxb = rxq->queue[i];
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4238  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4239  		/* If an RXB doesn't have a Rx queue slot associated with it,
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4240  		 * then a bug has been introduced in the queue refilling
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4241  		 * routines -- catch it here */
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4242  		BUG_ON(rxb == NULL);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4243  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4244  		rxq->queue[i] = NULL;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4245  
ebe9e6514b40f8 drivers/net/wireless/intel/iwlegacy/4965-mac.c Christophe JAILLET 2021-08-22  4246  		dma_unmap_page(&il->pci_dev->dev, rxb->page_dma,
46bc8d4b0e73ac drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-10-24  4247  			       PAGE_SIZE << il->hw_params.rx_page_order,
ebe9e6514b40f8 drivers/net/wireless/intel/iwlegacy/4965-mac.c Christophe JAILLET 2021-08-22  4248  			       DMA_FROM_DEVICE);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21 @4249  		pkt = rxb_addr(rxb);
8e67427aca2f0d drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2014-02-19  4250  		reclaim = il_need_reclaim(il, pkt);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4251  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4252  		/* Based on type of command response or notification,
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4253  		 *   handle those that need handling via function in
d0c72347bece32 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-08-30  4254  		 *   handlers table.  See il4965_setup_handlers() */
d0c72347bece32 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-08-30  4255  		if (il->handlers[pkt->hdr.cmd]) {
e7392364fcd100 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-11-15  4256  			D_RX("r = %d, i = %d, %s, 0x%02x\n", r, i,
e7392364fcd100 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-11-15  4257  			     il_get_cmd_string(pkt->hdr.cmd), pkt->hdr.cmd);
d0c72347bece32 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-08-30  4258  			il->isr_stats.handlers[pkt->hdr.cmd]++;
d0c72347bece32 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-08-30  4259  			il->handlers[pkt->hdr.cmd] (il, rxb);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4260  		} else {
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4261  			/* No handling needed */
e7392364fcd100 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-11-15  4262  			D_RX("r %d i %d No handler needed for %s, 0x%02x\n", r,
e7392364fcd100 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-11-15  4263  			     i, il_get_cmd_string(pkt->hdr.cmd), pkt->hdr.cmd);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4264  		}
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4265  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4266  		/*
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4267  		 * XXX: After here, we should always check rxb->page
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4268  		 * against NULL before touching it or its virtual
d0c72347bece32 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-08-30  4269  		 * memory (pkt). Because some handler might have
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4270  		 * already taken or freed the pages.
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4271  		 */
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4272  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4273  		if (reclaim) {
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4274  			/* Invoke any callbacks, transfer the buffer to caller,
e2ebc8337d116a drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-10-24  4275  			 * and fire off the (possibly) blocking il_send_cmd()
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4276  			 * as we reclaim the driver command queue */
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21 @4277  			if (rxb->page)
46bc8d4b0e73ac drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-10-24  4278  				il_tx_cmd_complete(il, rxb);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4279  			else
9406f79775a537 drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-08-18  4280  				IL_WARN("Claim null rxb?\n");
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4281  		}
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4282  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4283  		/* Reuse the page if possible. For notification packets and
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4284  		 * SKBs that fail to Rx correctly, add them back into the
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4285  		 * rx_free list for reuse later. */
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4286  		spin_lock_irqsave(&rxq->lock, flags);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4287  		if (rxb->page != NULL) {
e7392364fcd100 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2011-11-15  4288  			rxb->page_dma =
ebe9e6514b40f8 drivers/net/wireless/intel/iwlegacy/4965-mac.c Christophe JAILLET 2021-08-22  4289  			    dma_map_page(&il->pci_dev->dev, rxb->page, 0,
ebe9e6514b40f8 drivers/net/wireless/intel/iwlegacy/4965-mac.c Christophe JAILLET 2021-08-22  4290  					 PAGE_SIZE << il->hw_params.rx_page_order,
ebe9e6514b40f8 drivers/net/wireless/intel/iwlegacy/4965-mac.c Christophe JAILLET 2021-08-22  4291  					 DMA_FROM_DEVICE);
96ebbe8d019ab5 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2013-01-30  4292  
ebe9e6514b40f8 drivers/net/wireless/intel/iwlegacy/4965-mac.c Christophe JAILLET 2021-08-22  4293  			if (unlikely(dma_mapping_error(&il->pci_dev->dev,
96ebbe8d019ab5 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2013-01-30  4294  						       rxb->page_dma))) {
96ebbe8d019ab5 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2013-01-30  4295  				__il_free_pages(il, rxb->page);
96ebbe8d019ab5 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2013-01-30  4296  				rxb->page = NULL;
96ebbe8d019ab5 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2013-01-30  4297  				list_add_tail(&rxb->list, &rxq->rx_used);
96ebbe8d019ab5 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2013-01-30  4298  			} else {
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4299  				list_add_tail(&rxb->list, &rxq->rx_free);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4300  				rxq->free_count++;
96ebbe8d019ab5 drivers/net/wireless/iwlegacy/4965-mac.c       Stanislaw Gruszka  2013-01-30  4301  			}
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4302  		} else
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4303  			list_add_tail(&rxb->list, &rxq->rx_used);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4304  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4305  		spin_unlock_irqrestore(&rxq->lock, flags);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4306  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4307  		i = (i + 1) & RX_QUEUE_MASK;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4308  		/* If there are a lot of unused frames,
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4309  		 * restock the Rx queue so ucode wont assert. */
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4310  		if (fill_rx) {
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4311  			count++;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4312  			if (count >= 8) {
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4313  				rxq->read = i;
46bc8d4b0e73ac drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-10-24  4314  				il4965_rx_replenish_now(il);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4315  				count = 0;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4316  			}
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4317  		}
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4318  	}
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4319  
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4320  	/* Backtrack one entry */
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4321  	rxq->read = i;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4322  	if (fill_rx)
46bc8d4b0e73ac drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-10-24  4323  		il4965_rx_replenish_now(il);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4324  	else
46bc8d4b0e73ac drivers/net/wireless/iwlegacy/iwl4965-base.c   Stanislaw Gruszka  2011-10-24  4325  		il4965_rx_queue_restock(il);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4326  }
be663ab67077fa drivers/net/wireless/iwlegacy/iwl4965-base.c   Wey-Yi Guy         2011-02-21  4327  

:::::: The code at line 4277 was first introduced by commit
:::::: be663ab67077fac8e23eb8e231a8c1c94cb32e54 iwlwifi: split the drivers for agn and legacy devices 3945/4965

:::::: TO: Wey-Yi Guy <wey-yi.w.guy@intel.com>
:::::: CC: Wey-Yi Guy <wey-yi.w.guy@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

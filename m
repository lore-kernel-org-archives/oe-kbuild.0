Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05AF33984A
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765957645; cv=none; b=oQCsVBjmY/gsdvKw9j1Jvl1DRwyGFufe+tt1dguxlhC3+J1cgKk/kA1zdZRZ7/uDMypaFojjXm2TFmUXDC8/gDKoDVnOYyGsXnSa9uQLg+UfygJ0kWhXOV7l42vKyvD35XI6onpbB8eSHAmPYjkkbwEAn+Aa1HXxRb+jrsb4kKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765957645; c=relaxed/simple;
	bh=YjqLla3ck2J37wZvrGb6RLm+pmvUULWXRxtftMrEDfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lEz6SdtHLE9J15eZXPb7dXAtZHmUD4Ks4mpqI6bAFNuN0JKLk2u0iLxbWMYZrv9CoZFUGcwI2mIn3QnGcOs03prlMgXAlEeog0q5n6C1AhRyypXrM+UZO7YRDUoTzjd8nRoQzahYvMR7IDjONNjU1LG8qjgb2owblNfXCzyXN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUhwLczx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUhwLczx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765957641; x=1797493641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjqLla3ck2J37wZvrGb6RLm+pmvUULWXRxtftMrEDfk=;
  b=lUhwLczxap3Mqsr0m6J4yPvfMQ33lUxjgWsraN4I7xQe0G4vzC8e3KKm
   Z73pl0UPGA9KtzrnCvmFtpyj1FXnlYrHdfZtLySeVQV6KfdabBzG2T6l6
   qT8KD2c4II8d7GL9jzaMos3aeBB+i/WpozehJSP+VxvdsJaf4VmUs4Ius
   9gJSU0dHjFwz2DAEKdEz56TDwMudjZiCzA/dJjvL+OEjD5l9WGht9nCKE
   EcEQW8fR/DpQwoieuX3uBVWUbnxKYXm8jnoOzg+EtE4pp35meNiTgwX7r
   JLf+mlh1+eEIsvRFz686nzhlwULhfFSHGBSS3afZhAYxy70pYZYFgK7hQ
   g==;
X-CSE-ConnectionGUID: mO563ospS0iTwQbOZF9+qg==
X-CSE-MsgGUID: 2U0RJEITRVmpiB3vbZZaig==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71746155"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="71746155"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 23:47:20 -0800
X-CSE-ConnectionGUID: mrvcBk2ZSMu90TNhXdaEgQ==
X-CSE-MsgGUID: xDEkpCQrQ86qWKtohI4R4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="199043119"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2025 23:47:19 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVmFg-000000000B9-3ASA;
	Wed, 17 Dec 2025 07:47:16 +0000
Date: Wed, 17 Dec 2025 15:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mailbox/mailbox-mchp-ipc-sbi.c:187
 mchp_ipc_cluster_aggr_isr() error: uninitialized symbol 'hartid'.
Message-ID: <202512171533.CDLdScMY-lkp@intel.com>
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
TO: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>

Hi Valentina,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: c1382852330ee2e78d884bab2da25b880488fa1c riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-r071-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171533.CDLdScMY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512171533.CDLdScMY-lkp@intel.com/

New smatch warnings:
drivers/mailbox/mailbox-mchp-ipc-sbi.c:187 mchp_ipc_cluster_aggr_isr() error: uninitialized symbol 'hartid'.

Old smatch warnings:
drivers/mailbox/mailbox-mchp-ipc-sbi.c:422 mchp_ipc_probe() warn: passing zero to 'dev_err_probe'

vim +/hartid +187 drivers/mailbox/mailbox-mchp-ipc-sbi.c

e4b1d67e71419c Valentina Fernandez 2024-12-17  168  
e4b1d67e71419c Valentina Fernandez 2024-12-17  169  static irqreturn_t mchp_ipc_cluster_aggr_isr(int irq, void *data)
e4b1d67e71419c Valentina Fernandez 2024-12-17  170  {
e4b1d67e71419c Valentina Fernandez 2024-12-17  171  	struct mbox_chan *chan;
e4b1d67e71419c Valentina Fernandez 2024-12-17  172  	struct mchp_ipc_sbi_chan *chan_info;
e4b1d67e71419c Valentina Fernandez 2024-12-17  173  	struct mchp_ipc_sbi_mbox *ipc = (struct mchp_ipc_sbi_mbox *)data;
e4b1d67e71419c Valentina Fernandez 2024-12-17  174  	struct mchp_ipc_msg ipc_msg;
e4b1d67e71419c Valentina Fernandez 2024-12-17  175  	struct mchp_ipc_status status_msg;
e4b1d67e71419c Valentina Fernandez 2024-12-17  176  	int ret;
e4b1d67e71419c Valentina Fernandez 2024-12-17  177  	unsigned long hartid;
e4b1d67e71419c Valentina Fernandez 2024-12-17  178  	u32 i, chan_index, chan_id;
e4b1d67e71419c Valentina Fernandez 2024-12-17  179  
e4b1d67e71419c Valentina Fernandez 2024-12-17  180  	/* Find out the hart that originated the irq */
e4b1d67e71419c Valentina Fernandez 2024-12-17  181  	for_each_online_cpu(i) {
e4b1d67e71419c Valentina Fernandez 2024-12-17  182  		hartid = cpuid_to_hartid_map(i);
e4b1d67e71419c Valentina Fernandez 2024-12-17  183  		if (irq == ipc->cluster_cfg[hartid].irq)
e4b1d67e71419c Valentina Fernandez 2024-12-17  184  			break;
e4b1d67e71419c Valentina Fernandez 2024-12-17  185  	}
e4b1d67e71419c Valentina Fernandez 2024-12-17  186  
e4b1d67e71419c Valentina Fernandez 2024-12-17 @187  	status_msg.cluster = hartid;
e4b1d67e71419c Valentina Fernandez 2024-12-17  188  	memcpy(ipc->cluster_cfg[hartid].buf_base, &status_msg, sizeof(struct mchp_ipc_status));
e4b1d67e71419c Valentina Fernandez 2024-12-17  189  
e4b1d67e71419c Valentina Fernandez 2024-12-17  190  	ret = mchp_ipc_sbi_send(SBI_EXT_IPC_STATUS, ipc->cluster_cfg[hartid].buf_base_addr);
e4b1d67e71419c Valentina Fernandez 2024-12-17  191  	if (ret < 0) {
e4b1d67e71419c Valentina Fernandez 2024-12-17  192  		dev_err_ratelimited(ipc->dev, "could not get IHC irq status ret=%d\n", ret);
e4b1d67e71419c Valentina Fernandez 2024-12-17  193  		return IRQ_HANDLED;
e4b1d67e71419c Valentina Fernandez 2024-12-17  194  	}
e4b1d67e71419c Valentina Fernandez 2024-12-17  195  
e4b1d67e71419c Valentina Fernandez 2024-12-17  196  	memcpy(&status_msg, ipc->cluster_cfg[hartid].buf_base, sizeof(struct mchp_ipc_status));
e4b1d67e71419c Valentina Fernandez 2024-12-17  197  
e4b1d67e71419c Valentina Fernandez 2024-12-17  198  	/*
e4b1d67e71419c Valentina Fernandez 2024-12-17  199  	 * Iterate over each bit set in the IHC interrupt status register (IRQ_STATUS) to identify
e4b1d67e71419c Valentina Fernandez 2024-12-17  200  	 * the channel(s) that have a message to be processed/acknowledged.
e4b1d67e71419c Valentina Fernandez 2024-12-17  201  	 * The bits are organized in alternating format, where each pair of bits represents
e4b1d67e71419c Valentina Fernandez 2024-12-17  202  	 * the status of the message present and message clear interrupts for each cluster/hart
e4b1d67e71419c Valentina Fernandez 2024-12-17  203  	 * (from hart 0 to hart 5). Each cluster can have up to 5 fixed channels associated.
e4b1d67e71419c Valentina Fernandez 2024-12-17  204  	 */
e4b1d67e71419c Valentina Fernandez 2024-12-17  205  
e4b1d67e71419c Valentina Fernandez 2024-12-17  206  	for_each_set_bit(i, (unsigned long *)&status_msg.status, IRQ_STATUS_BITS) {
e4b1d67e71419c Valentina Fernandez 2024-12-17  207  		/* Find out the destination hart that triggered the interrupt */
e4b1d67e71419c Valentina Fernandez 2024-12-17  208  		chan_index = i / 2;
e4b1d67e71419c Valentina Fernandez 2024-12-17  209  
e4b1d67e71419c Valentina Fernandez 2024-12-17  210  		/*
e4b1d67e71419c Valentina Fernandez 2024-12-17  211  		 * The IP has no loopback channels, so we need to decrement the index when
e4b1d67e71419c Valentina Fernandez 2024-12-17  212  		 * the target hart has a greater index than our own
e4b1d67e71419c Valentina Fernandez 2024-12-17  213  		 */
e4b1d67e71419c Valentina Fernandez 2024-12-17  214  		if (chan_index >= status_msg.cluster)
e4b1d67e71419c Valentina Fernandez 2024-12-17  215  			chan_index--;
e4b1d67e71419c Valentina Fernandez 2024-12-17  216  
e4b1d67e71419c Valentina Fernandez 2024-12-17  217  		/*
e4b1d67e71419c Valentina Fernandez 2024-12-17  218  		 * Calculate the channel id given the hart and channel index. Channel IDs
e4b1d67e71419c Valentina Fernandez 2024-12-17  219  		 * are unique across all clusters of an IPC, and iterate contiguously
e4b1d67e71419c Valentina Fernandez 2024-12-17  220  		 * across all clusters.
e4b1d67e71419c Valentina Fernandez 2024-12-17  221  		 */
e4b1d67e71419c Valentina Fernandez 2024-12-17  222  		chan_id = status_msg.cluster * (NUM_CHANS_PER_CLUSTER + chan_index);
e4b1d67e71419c Valentina Fernandez 2024-12-17  223  
e4b1d67e71419c Valentina Fernandez 2024-12-17  224  		chan = &ipc->chans[chan_id];
e4b1d67e71419c Valentina Fernandez 2024-12-17  225  		chan_info = (struct mchp_ipc_sbi_chan *)chan->con_priv;
e4b1d67e71419c Valentina Fernandez 2024-12-17  226  
e4b1d67e71419c Valentina Fernandez 2024-12-17  227  		if (i % 2 == 0) {
e4b1d67e71419c Valentina Fernandez 2024-12-17  228  			mchp_ipc_prepare_receive_req(chan);
e4b1d67e71419c Valentina Fernandez 2024-12-17  229  			ret = mchp_ipc_sbi_chan_send(SBI_EXT_IPC_RECEIVE, chan_id,
e4b1d67e71419c Valentina Fernandez 2024-12-17  230  						     chan_info->buf_base_rx_addr);
e4b1d67e71419c Valentina Fernandez 2024-12-17  231  			if (ret < 0)
e4b1d67e71419c Valentina Fernandez 2024-12-17  232  				continue;
e4b1d67e71419c Valentina Fernandez 2024-12-17  233  
e4b1d67e71419c Valentina Fernandez 2024-12-17  234  			mchp_ipc_process_received_data(chan, &ipc_msg);
e4b1d67e71419c Valentina Fernandez 2024-12-17  235  			mbox_chan_received_data(&ipc->chans[chan_id], (void *)&ipc_msg);
e4b1d67e71419c Valentina Fernandez 2024-12-17  236  
e4b1d67e71419c Valentina Fernandez 2024-12-17  237  		} else {
e4b1d67e71419c Valentina Fernandez 2024-12-17  238  			ret = mchp_ipc_sbi_chan_send(SBI_EXT_IPC_RECEIVE, chan_id,
e4b1d67e71419c Valentina Fernandez 2024-12-17  239  						     chan_info->buf_base_rx_addr);
e4b1d67e71419c Valentina Fernandez 2024-12-17  240  			mbox_chan_txdone(&ipc->chans[chan_id], ret);
e4b1d67e71419c Valentina Fernandez 2024-12-17  241  		}
e4b1d67e71419c Valentina Fernandez 2024-12-17  242  	}
e4b1d67e71419c Valentina Fernandez 2024-12-17  243  	return IRQ_HANDLED;
e4b1d67e71419c Valentina Fernandez 2024-12-17  244  }
e4b1d67e71419c Valentina Fernandez 2024-12-17  245  

:::::: The code at line 187 was first introduced by commit
:::::: e4b1d67e71419c4af581890ecea84b04920d4116 mailbox: add Microchip IPC support

:::::: TO: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
:::::: CC: Jassi Brar <jassisinghbrar@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

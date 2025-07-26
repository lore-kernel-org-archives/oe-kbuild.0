Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0C12264C5
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Jul 2025 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753547343; cv=none; b=BCgR5pQ40EiDhtCsdHvkWnrdOfFUvvkJVDpJ9CwObrlMqPWydEv19yoYYVlnNsGZb9sIBx0VMKE3y3xViQNoFl2lkVSgdVjZeO0pSYccSMlL4DpFqtUNb1GbG5M3r2vpYtIQ2ilqEEULRmeXNDT5jvd3Us3mi6N5KJdWS0sdimo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753547343; c=relaxed/simple;
	bh=XfWlTl77jUEb37voHMy99MMUupNuLRUQZWOSdEO948k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M+BhhCbjtjd3nkmCNBQ8TUXRavyGE4lvg1/75+c63oiXEW/CbJiPoDYDxXmJ75+NmSHsLPIdwCFhQ1JZq4AwTICIG3xYXCuvb7qozVWc3LqNR2OpQK89fDyp6RyvqJKbEYi3dIYf78pF0lOq2fLrhr1Gof0erMgi3sgOFcryD74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muVPp+dy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muVPp+dy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753547341; x=1785083341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XfWlTl77jUEb37voHMy99MMUupNuLRUQZWOSdEO948k=;
  b=muVPp+dySP1+GV8PIGJI1XFPVXgRJVSDm5cyF9Qmf6TN9wzME3mjLETe
   HfbsKwKn4y8vvsv4Z+ARxeNKgqBJ2dr/iNuTyJLemL15jFfelxUWODR9P
   fF8/baerViCZ0SLsaUml6+oKRVv4jXK6qmBp2KlB5IkW2zDKAc6dAuKWC
   1nvuYtRLADDkwTFdMNZESBWm31W4Rlh60sxGz+2UJxjzIFayGrc5vbq19
   gabJncsdBmFEmPSwCrjHvhdRkDvP6IpyiAv/orRli3Hlqs8jAx+biFNM1
   gIs1OWOzsCTGz8UMdJDPSurGImjvBfcKP4h1uWOPVPD4f7TemmRwgh0/S
   Q==;
X-CSE-ConnectionGUID: uQtQnTDURHGOicdzk4purA==
X-CSE-MsgGUID: LswDVXbPTeu52RoNdmKKoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55714696"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55714696"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 09:29:01 -0700
X-CSE-ConnectionGUID: W/Ey3iQvSHSKberdvxk/6w==
X-CSE-MsgGUID: AzXJjGmVS9WOpO150J6QgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161748612"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jul 2025 09:28:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufhlY-000M6N-2d;
	Sat, 26 Jul 2025 16:28:56 +0000
Date: Sun, 27 Jul 2025 00:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 03/11] net: qrtr: fit node ID + port number
 combination into unsigned long
Message-ID: <202507270040.z4mru6Go-lkp@intel.com>
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
In-Reply-To: <c60cc5f238873f72ef6f49582fb87ae7122853d5.1753312999.git.ionic@ionic.de>
References: <c60cc5f238873f72ef6f49582fb87ae7122853d5.1753312999.git.ionic@ionic.de>
TO: Mihai Moldovan <ionic@ionic.de>
TO: linux-arm-msm@vger.kernel.org
TO: Manivannan Sadhasivam <mani@kernel.org>
CC: Eric Dumazet <edumazet@google.com>
CC: Kuniyuki Iwashima <kuniyu@google.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Willem de Bruijn <willemb@google.com>
CC: "David S . Miller" <davem@davemloft.net>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Simon Horman <horms@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org

Hi Mihai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mani-mhi/mhi-next]
[also build test WARNING on net-next/main net/main linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mihai-Moldovan/net-qrtr-ns-validate-msglen-before-ctrl_pkt-use/20250724-073030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
patch link:    https://lore.kernel.org/r/c60cc5f238873f72ef6f49582fb87ae7122853d5.1753312999.git.ionic%40ionic.de
patch subject: [PATCH v3 03/11] net: qrtr: fit node ID + port number combination into unsigned long
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250726 (https://download.01.org/0day-ci/archive/20250727/202507270040.z4mru6Go-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507270040.z4mru6Go-lkp@intel.com/

smatch warnings:
net/qrtr/af_qrtr.c:301 qrtr_tx_wait() warn: impossible condition '(dest_node < ((-1) - ((((~(0)) >> ((8 * 8) >> 1))) >> 1))) => (s32min-s32max < s32min)'
net/qrtr/af_qrtr.c:303 qrtr_tx_wait() warn: impossible condition '(dest_port < ((-1) - ((((~(0)) >> ((8 * 8) >> 1))) >> 1))) => (s32min-s32max < s32min)'
net/qrtr/af_qrtr.c:374 qrtr_tx_flow_failed() warn: impossible condition '(dest_node < ((-1) - ((((~(0)) >> ((8 * 8) >> 1))) >> 1))) => (s32min-s32max < s32min)'
net/qrtr/af_qrtr.c:376 qrtr_tx_flow_failed() warn: impossible condition '(dest_port < ((-1) - ((((~(0)) >> ((8 * 8) >> 1))) >> 1))) => (s32min-s32max < s32min)'

vim +301 net/qrtr/af_qrtr.c

5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  277  
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  278  /**
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  279   * qrtr_tx_wait() - flow control for outgoing packets
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  280   * @node:	qrtr_node that the packet is to be send to
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  281   * @dest_node:	node id of the destination
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  282   * @dest_port:	port number of the destination
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  283   * @type:	type of message
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  284   *
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  285   * The flow control scheme is based around the low and high "watermarks". When
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  286   * the low watermark is passed the confirm_rx flag is set on the outgoing
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  287   * message, which will trigger the remote to send a control message of the type
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  288   * QRTR_TYPE_RESUME_TX to reset the counter. If the high watermark is hit
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  289   * further transmision should be paused.
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  290   *
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  291   * Return: 1 if confirm_rx should be set, 0 otherwise or errno failure
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  292   */
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  293  static int qrtr_tx_wait(struct qrtr_node *node, int dest_node, int dest_port,
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  294  			int type)
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  295  {
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  296  	unsigned long key = 0;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  297  	struct qrtr_tx_flow *flow;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  298  	int confirm_rx = 0;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  299  	int ret;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  300  
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24 @301  	if (dest_node < QRTR_INDEX_HALF_SIGNED_MIN ||
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  302  	    dest_node > QRTR_INDEX_HALF_SIGNED_MAX ||
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24 @303  	    dest_port < QRTR_INDEX_HALF_SIGNED_MIN ||
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  304  	    dest_port > QRTR_INDEX_HALF_SIGNED_MAX)
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  305  		return -EINVAL;
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  306  
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  307  	key = ((unsigned long)(dest_node) << QRTR_INDEX_HALF_BITS) |
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  308  	      ((unsigned long)(dest_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  309  
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  310  	/* Never set confirm_rx on non-data packets */
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  311  	if (type != QRTR_TYPE_DATA)
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  312  		return 0;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  313  
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  314  	mutex_lock(&node->qrtr_tx_lock);
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  315  	flow = radix_tree_lookup(&node->qrtr_tx_flow, key);
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  316  	if (!flow) {
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  317  		flow = kzalloc(sizeof(*flow), GFP_KERNEL);
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  318  		if (flow) {
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  319  			init_waitqueue_head(&flow->resume_tx);
8a03dd925786bd net/qrtr/qrtr.c    Loic Poulain    2021-03-30  320  			if (radix_tree_insert(&node->qrtr_tx_flow, key, flow)) {
8a03dd925786bd net/qrtr/qrtr.c    Loic Poulain    2021-03-30  321  				kfree(flow);
8a03dd925786bd net/qrtr/qrtr.c    Loic Poulain    2021-03-30  322  				flow = NULL;
8a03dd925786bd net/qrtr/qrtr.c    Loic Poulain    2021-03-30  323  			}
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  324  		}
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  325  	}
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  326  	mutex_unlock(&node->qrtr_tx_lock);
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  327  
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  328  	/* Set confirm_rx if we where unable to find and allocate a flow */
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  329  	if (!flow)
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  330  		return 1;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  331  
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  332  	spin_lock_irq(&flow->resume_tx.lock);
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  333  	ret = wait_event_interruptible_locked_irq(flow->resume_tx,
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  334  						  flow->pending < QRTR_TX_FLOW_HIGH ||
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  335  						  flow->tx_failed ||
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  336  						  !node->ep);
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  337  	if (ret < 0) {
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  338  		confirm_rx = ret;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  339  	} else if (!node->ep) {
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  340  		confirm_rx = -EPIPE;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  341  	} else if (flow->tx_failed) {
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  342  		flow->tx_failed = 0;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  343  		confirm_rx = 1;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  344  	} else {
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  345  		flow->pending++;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  346  		confirm_rx = flow->pending == QRTR_TX_FLOW_LOW;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  347  	}
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  348  	spin_unlock_irq(&flow->resume_tx.lock);
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  349  
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  350  	return confirm_rx;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  351  }
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  352  
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  353  /**
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  354   * qrtr_tx_flow_failed() - flag that tx of confirm_rx flagged messages failed
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  355   * @node:	qrtr_node that the packet is to be send to
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  356   * @dest_node:	node id of the destination
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  357   * @dest_port:	port number of the destination
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  358   *
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  359   * Signal that the transmission of a message with confirm_rx flag failed. The
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  360   * flow's "pending" counter will keep incrementing towards QRTR_TX_FLOW_HIGH,
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  361   * at which point transmission would stall forever waiting for the resume TX
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  362   * message associated with the dropped confirm_rx message.
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  363   * Work around this by marking the flow as having a failed transmission and
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  364   * cause the next transmission attempt to be sent with the confirm_rx.
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  365   *
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  366   * Return: 0 on success; negative error code on failure
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  367   */
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  368  static int qrtr_tx_flow_failed(struct qrtr_node *node, int dest_node,
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  369  			       int dest_port)
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  370  {
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  371  	unsigned long key = 0;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  372  	struct qrtr_tx_flow *flow;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  373  
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24 @374  	if (dest_node < QRTR_INDEX_HALF_SIGNED_MIN ||
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  375  	    dest_node > QRTR_INDEX_HALF_SIGNED_MAX ||
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24 @376  	    dest_port < QRTR_INDEX_HALF_SIGNED_MIN ||
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  377  	    dest_port > QRTR_INDEX_HALF_SIGNED_MAX)
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  378  		return -EINVAL;
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  379  
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  380  	key = ((unsigned long)(dest_node) << QRTR_INDEX_HALF_BITS) |
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  381  	      ((unsigned long)(dest_port) & QRTR_INDEX_HALF_UNSIGNED_MAX);
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  382  
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  383  	rcu_read_lock();
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  384  	flow = radix_tree_lookup(&node->qrtr_tx_flow, key);
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  385  	rcu_read_unlock();
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  386  	if (flow) {
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  387  		spin_lock_irq(&flow->resume_tx.lock);
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  388  		flow->tx_failed = 1;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  389  		spin_unlock_irq(&flow->resume_tx.lock);
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  390  	}
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  391  
e92239648a9190 net/qrtr/af_qrtr.c Mihai Moldovan  2025-07-24  392  	return 0;
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  393  }
5fdeb0d372ab33 net/qrtr/qrtr.c    Bjorn Andersson 2020-01-13  394  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

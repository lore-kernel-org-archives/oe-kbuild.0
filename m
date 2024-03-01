Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F587E1
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Mar 2024 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709297520; cv=none; b=i5DRYx3c/0mqD9mNkPCG26W2//+ut/uVS2aFgydKP50aRE4MHU+xiBkn6qvOKzi1ZSWKSbwIcY9ELumZsfKvFRX6T7QqSOcR6nfbc8DfPXgPwJQXXbbtjMggG9Dd/SJ7GzxoDBlRI4dO950ZRh/+Ui5FLPHKAVUOxD8NuGN6CYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709297520; c=relaxed/simple;
	bh=UwOt5bCgZeOwh3E0jekzlJLXAzC4NXbH0Zb39F69beA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gH3W/rWdJsKmG6TAssRon1BR4EagrwKlGnSBAih5FTsfA0Ko+kTEmkKSsOmWXsvRAKuyuTRYJfzgJGXw6jRdMNFnBKKhP9iskGsT/9VKhCPjAX2Q65nRxmcBTxp5lNIn0cXWM/BEtcRrbk1wOzlHbKlSCWMok7eqgfdcX6DBurM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhyGWiqb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhyGWiqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709297518; x=1740833518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UwOt5bCgZeOwh3E0jekzlJLXAzC4NXbH0Zb39F69beA=;
  b=mhyGWiqbi4kCrw2FHOITwxMiwELwrm+9ZROA1bFwEPJyDdUqxtsWwI4t
   WSRl6hsgd5p/FZNmVnSOwoFQ1KQDq9X03i+pZQEyCHpZIhrYGDj10DgNW
   iBEi8qO+kIdngPO/iXRaPBd1kfD0Y78fgYQQz7jr1Tp6EWOucG2cyoq4R
   +q3L3gkwk8NLpHFnjqr5X3tjuHs5wEqVh7qv8/x2ey4PGC/6GmetxSJSL
   yH6qHXcHqH4WboDCFKFw5kWou8FJ9RjnM+iumnpiK3YHSXYSNh9Qz1hhI
   khlfD8xXDkDL7ZfRrueW1ujmiht2x9nIzVp8hUiuIppBdF7yOjXVGYx9e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="6785031"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="6785031"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 04:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="39204828"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Mar 2024 04:51:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg2Mg-000Dqx-2t;
	Fri, 01 Mar 2024 12:51:51 +0000
Date: Fri, 1 Mar 2024 20:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:rxrpc-iothread 24/24] net/rxrpc/output.c:486
 rxrpc_tstamp_data_packets() error: uninitialized symbol 'serial'.
Message-ID: <202403012020.3164BhlP-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   ca6f236e32ce19f9c0c477e133c58134e122134b
commit: ca6f236e32ce19f9c0c477e133c58134e122134b [24/24] rxrpc: Send jumbo DATA packets
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20240301 (https://download.01.org/0day-ci/archive/20240301/202403012020.3164BhlP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403012020.3164BhlP-lkp@intel.com/

smatch warnings:
net/rxrpc/output.c:486 rxrpc_tstamp_data_packets() error: uninitialized symbol 'serial'.

vim +/serial +486 net/rxrpc/output.c

44125d5aaddadf David Howells 2024-01-26  465  
44125d5aaddadf David Howells 2024-01-26  466  /*
2cd274cfeb88fe David Howells 2024-01-31  467   * Set timeouts after transmitting a packet.
44125d5aaddadf David Howells 2024-01-26  468   */
ca6f236e32ce19 David Howells 2024-01-26  469  static void rxrpc_tstamp_data_packets(struct rxrpc_call *call, struct rxrpc_txbuf *txb, int n)
44125d5aaddadf David Howells 2024-01-26  470  {
ca6f236e32ce19 David Howells 2024-01-26  471  	rxrpc_serial_t serial;
2cd274cfeb88fe David Howells 2024-01-31  472  	ktime_t now = ktime_get_real();
2cd274cfeb88fe David Howells 2024-01-31  473  	bool ack_requested = txb->flags & RXRPC_REQUEST_ACK;
ca6f236e32ce19 David Howells 2024-01-26  474  	int i;
44125d5aaddadf David Howells 2024-01-26  475  
2cd274cfeb88fe David Howells 2024-01-31  476  	call->tx_last_sent = now;
ca6f236e32ce19 David Howells 2024-01-26  477  
ca6f236e32ce19 David Howells 2024-01-26  478  	for (i = 0; i < n; i++) {
2cd274cfeb88fe David Howells 2024-01-31  479  		txb->last_sent = now;
ca6f236e32ce19 David Howells 2024-01-26  480  		ack_requested |= txb->flags & RXRPC_REQUEST_ACK;
ca6f236e32ce19 David Howells 2024-01-26  481  		serial = txb->serial;
ca6f236e32ce19 David Howells 2024-01-26  482  		txb = list_next_entry(txb, call_link);
ca6f236e32ce19 David Howells 2024-01-26  483  	}
2cd274cfeb88fe David Howells 2024-01-31  484  
2cd274cfeb88fe David Howells 2024-01-31  485  	if (ack_requested) {
ca6f236e32ce19 David Howells 2024-01-26 @486  		rxrpc_begin_rtt_probe(call, serial, now, rxrpc_rtt_tx_data);
2cd274cfeb88fe David Howells 2024-01-31  487  
2cd274cfeb88fe David Howells 2024-01-31  488  		call->peer->rtt_last_req = now;
2cd274cfeb88fe David Howells 2024-01-31  489  		if (call->peer->rtt_count > 1) {
2cd274cfeb88fe David Howells 2024-01-31  490  			ktime_t delay = rxrpc_get_rto_backoff(call->peer, false);
2cd274cfeb88fe David Howells 2024-01-31  491  
2cd274cfeb88fe David Howells 2024-01-31  492  			call->ack_lost_at = ktime_add(now, delay);
2cd274cfeb88fe David Howells 2024-01-31  493  			trace_rxrpc_timer_set(call, delay, rxrpc_timer_trace_lost_ack);
2cd274cfeb88fe David Howells 2024-01-31  494  		}
2cd274cfeb88fe David Howells 2024-01-31  495  	}
2cd274cfeb88fe David Howells 2024-01-31  496  
2cd274cfeb88fe David Howells 2024-01-31  497  	if (!test_and_set_bit(RXRPC_CALL_BEGAN_RX_TIMER, &call->flags)) {
2cd274cfeb88fe David Howells 2024-01-31  498  		ktime_t delay = ms_to_ktime(READ_ONCE(call->next_rx_timo));
2cd274cfeb88fe David Howells 2024-01-31  499  
2cd274cfeb88fe David Howells 2024-01-31  500  		call->expect_rx_by = ktime_add(now, delay);
2cd274cfeb88fe David Howells 2024-01-31  501  		trace_rxrpc_timer_set(call, delay, rxrpc_timer_trace_expect_rx);
2cd274cfeb88fe David Howells 2024-01-31  502  	}
44125d5aaddadf David Howells 2024-01-26  503  
2cd274cfeb88fe David Howells 2024-01-31  504  	rxrpc_set_keepalive(call, now);
44125d5aaddadf David Howells 2024-01-26  505  }
44125d5aaddadf David Howells 2024-01-26  506  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

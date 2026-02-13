Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7273835A925
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770989973; cv=none; b=H6TSFXKv1Fg2SAYAaGugCVu9bBTdvYIlHRzNFp6HPonrVGQSResPMD/97dwDN4l32SSZXzaZ1F3EEGXcfh4Hzzbzwe73ih/ixEg+jR5KDjcJz7Cvv27KYy+CBE46MreteNDym/Z0bgKvPhaZclJ9JEBeWbI9HMmm3DVJM32dtH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770989973; c=relaxed/simple;
	bh=1jYk2z4pRZuiJ48bjIhql22VG6EaZV8KgXesD1cn1uM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ucwAU71VEnfbdAKcUD2HfLlyNrtPi50+jAPYGq9lwaCQkDFDNqMlffIflMTMCAbOlGPB4bks3xsJTWMaHw9HicRdPpmHjSB9+wHnFOThqKhHWirYGkPOdK9RRtwfiBuvv1uTlp9WSWSkH0grQwBJR3eJpGCbkdQ6imBAaquiO3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCej8KN2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCej8KN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770989971; x=1802525971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1jYk2z4pRZuiJ48bjIhql22VG6EaZV8KgXesD1cn1uM=;
  b=MCej8KN2mYcx9AHgrPCw8BHYjU8KkvsGLvOzZT5CdWViNQzvX6Ve+lKP
   SAcoz1NdZ1s3Bwt7u+pSoVvmXCGEAJd4+XV3GyzSZpw0phrFahg3QI4KM
   uyv+GRirb6gaUmWadAbI8Wf5FIsxNGof3q3TD/c6oEVIszb6d2XPw+bQB
   JAoN2Rich9y8LZBBuvGXG7VhiUvPO+F2FnUiRrOFxbdaDhwqplqi7Vz+J
   DpymiUxJrtxVxJ/jTldZT/9xcWDc10tf0ZQuFMlY5escHvf+he41pSafL
   oPShlTmg+Om1cFMi0KB1XNbVNkzpoK/dCXcnnngc/C36ObMoEoEOivb3J
   g==;
X-CSE-ConnectionGUID: 6hSTjtePR/eyBL5kvRew6w==
X-CSE-MsgGUID: j8t/deWlQO2b38jldWoAOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="89585842"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="89585842"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 05:39:30 -0800
X-CSE-ConnectionGUID: smccBbg6QPyBStWtvNw4fw==
X-CSE-MsgGUID: 0VTd7TDwTUC/jIcB1LaU2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="242337129"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2026 05:39:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqtOI-00000000vOK-01PK;
	Fri, 13 Feb 2026 13:39:26 +0000
Date: Fri, 13 Feb 2026 21:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net v1] kcm: fix zero-frag skb in frag_list on partial
 sendmsg error
Message-ID: <202602132158.nPDgggYY-lkp@intel.com>
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
In-Reply-To: <20260213061232.338244-1-jiayuan.chen@linux.dev>
References: <20260213061232.338244-1-jiayuan.chen@linux.dev>
TO: Jiayuan Chen <jiayuan.chen@linux.dev>
TO: netdev@vger.kernel.org
CC: jiayuan.chen@linux.dev
CC: Jiayuan Chen <jiayuan.chen@shopee.com>
CC: syzbot+52624bdfbf2746d37d70@syzkaller.appspotmail.com
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Michal Luczaj <mhal@rbox.co>
CC: Sven Stegemann <sven@stegemann.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Tom Herbert <tom@herbertland.com>
CC: linux-kernel@vger.kernel.org

Hi Jiayuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiayuan-Chen/kcm-fix-zero-frag-skb-in-frag_list-on-partial-sendmsg-error/20260213-141421
base:   net/main
patch link:    https://lore.kernel.org/r/20260213061232.338244-1-jiayuan.chen%40linux.dev
patch subject: [PATCH net v1] kcm: fix zero-frag skb in frag_list on partial sendmsg error
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: sparc-randconfig-r073-20260213 (https://download.01.org/0day-ci/archive/20260213/202602132158.nPDgggYY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602132158.nPDgggYY-lkp@intel.com/

smatch warnings:
net/kcm/kcmsock.c:945 kcm_sendmsg() error: we previously assumed 'head' could be null (see line 787)

vim +/head +945 net/kcm/kcmsock.c

ab7ac4eb9832e3 Tom Herbert       2016-03-07  747  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  748  static int kcm_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
ab7ac4eb9832e3 Tom Herbert       2016-03-07  749  {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  750  	struct sock *sk = sock->sk;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  751  	struct kcm_sock *kcm = kcm_sk(sk);
3d264f513af54f Jiayuan Chen      2026-02-13  752  	struct sk_buff *skb = NULL, *head = NULL, *frag_prev = NULL;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  753  	size_t copy, copied = 0;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  754  	long timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  755  	int eor = (sock->type == SOCK_DGRAM) ?
ab7ac4eb9832e3 Tom Herbert       2016-03-07  756  		  !(msg->msg_flags & MSG_MORE) : !!(msg->msg_flags & MSG_EOR);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  757  	int err = -EPIPE;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  758  
807067bf014d4a Kuniyuki Iwashima 2024-08-15  759  	mutex_lock(&kcm->tx_mutex);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  760  	lock_sock(sk);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  761  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  762  	/* Per tcp_sendmsg this should be in poll */
ab7ac4eb9832e3 Tom Herbert       2016-03-07  763  	sk_clear_bit(SOCKWQ_ASYNC_NOSPACE, sk);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  764  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  765  	if (sk->sk_err)
ab7ac4eb9832e3 Tom Herbert       2016-03-07  766  		goto out_error;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  767  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  768  	if (kcm->seq_skb) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  769  		/* Previously opened message */
ab7ac4eb9832e3 Tom Herbert       2016-03-07  770  		head = kcm->seq_skb;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  771  		skb = kcm_tx_msg(head)->last_skb;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  772  		goto start;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  773  	}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  774  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  775  	/* Call the sk_stream functions to manage the sndbuf mem. */
ab7ac4eb9832e3 Tom Herbert       2016-03-07  776  	if (!sk_stream_memory_free(sk)) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  777  		kcm_push(kcm);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  778  		set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  779  		err = sk_stream_wait_memory(sk, &timeo);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  780  		if (err)
ab7ac4eb9832e3 Tom Herbert       2016-03-07  781  			goto out_error;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  782  	}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  783  
98e3862ca2b1ae WANG Cong         2017-02-07  784  	if (msg_data_left(msg)) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  785  		/* New message, alloc head skb */
ab7ac4eb9832e3 Tom Herbert       2016-03-07  786  		head = alloc_skb(0, sk->sk_allocation);
ab7ac4eb9832e3 Tom Herbert       2016-03-07 @787  		while (!head) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  788  			kcm_push(kcm);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  789  			err = sk_stream_wait_memory(sk, &timeo);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  790  			if (err)
ab7ac4eb9832e3 Tom Herbert       2016-03-07  791  				goto out_error;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  792  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  793  			head = alloc_skb(0, sk->sk_allocation);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  794  		}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  795  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  796  		skb = head;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  797  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  798  		/* Set ip_summed to CHECKSUM_UNNECESSARY to avoid calling
ab7ac4eb9832e3 Tom Herbert       2016-03-07  799  		 * csum_and_copy_from_iter from skb_do_copy_data_nocache.
ab7ac4eb9832e3 Tom Herbert       2016-03-07  800  		 */
ab7ac4eb9832e3 Tom Herbert       2016-03-07  801  		skb->ip_summed = CHECKSUM_UNNECESSARY;
98e3862ca2b1ae WANG Cong         2017-02-07  802  	}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  803  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  804  start:
ab7ac4eb9832e3 Tom Herbert       2016-03-07  805  	while (msg_data_left(msg)) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  806  		bool merge = true;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  807  		int i = skb_shinfo(skb)->nr_frags;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  808  		struct page_frag *pfrag = sk_page_frag(sk);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  809  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  810  		if (!sk_page_frag_refill(sk, pfrag))
ab7ac4eb9832e3 Tom Herbert       2016-03-07  811  			goto wait_for_memory;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  812  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  813  		if (!skb_can_coalesce(skb, i, pfrag->page,
ab7ac4eb9832e3 Tom Herbert       2016-03-07  814  				      pfrag->offset)) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  815  			if (i == MAX_SKB_FRAGS) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  816  				struct sk_buff *tskb;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  817  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  818  				tskb = alloc_skb(0, sk->sk_allocation);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  819  				if (!tskb)
ab7ac4eb9832e3 Tom Herbert       2016-03-07  820  					goto wait_for_memory;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  821  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  822  				if (head == skb)
ab7ac4eb9832e3 Tom Herbert       2016-03-07  823  					skb_shinfo(head)->frag_list = tskb;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  824  				else
ab7ac4eb9832e3 Tom Herbert       2016-03-07  825  					skb->next = tskb;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  826  
3d264f513af54f Jiayuan Chen      2026-02-13  827  				frag_prev = skb;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  828  				skb = tskb;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  829  				skb->ip_summed = CHECKSUM_UNNECESSARY;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  830  				continue;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  831  			}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  832  			merge = false;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  833  		}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  834  
2b03bcae66c7b2 David Howells     2023-05-31  835  		if (msg->msg_flags & MSG_SPLICE_PAGES) {
2b03bcae66c7b2 David Howells     2023-05-31  836  			copy = msg_data_left(msg);
2b03bcae66c7b2 David Howells     2023-05-31  837  			if (!sk_wmem_schedule(sk, copy))
2b03bcae66c7b2 David Howells     2023-05-31  838  				goto wait_for_memory;
2b03bcae66c7b2 David Howells     2023-05-31  839  
25489a4f556414 Michal Luczaj     2025-07-02  840  			err = skb_splice_from_iter(skb, &msg->msg_iter, copy);
2b03bcae66c7b2 David Howells     2023-05-31  841  			if (err < 0) {
2b03bcae66c7b2 David Howells     2023-05-31  842  				if (err == -EMSGSIZE)
2b03bcae66c7b2 David Howells     2023-05-31  843  					goto wait_for_memory;
2b03bcae66c7b2 David Howells     2023-05-31  844  				goto out_error;
2b03bcae66c7b2 David Howells     2023-05-31  845  			}
2b03bcae66c7b2 David Howells     2023-05-31  846  
2b03bcae66c7b2 David Howells     2023-05-31  847  			copy = err;
2b03bcae66c7b2 David Howells     2023-05-31  848  			skb_shinfo(skb)->flags |= SKBFL_SHARED_FRAG;
2b03bcae66c7b2 David Howells     2023-05-31  849  			sk_wmem_queued_add(sk, copy);
2b03bcae66c7b2 David Howells     2023-05-31  850  			sk_mem_charge(sk, copy);
2b03bcae66c7b2 David Howells     2023-05-31  851  
2b03bcae66c7b2 David Howells     2023-05-31  852  			if (head != skb)
2b03bcae66c7b2 David Howells     2023-05-31  853  				head->truesize += copy;
2b03bcae66c7b2 David Howells     2023-05-31  854  		} else {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  855  			copy = min_t(int, msg_data_left(msg),
ab7ac4eb9832e3 Tom Herbert       2016-03-07  856  				     pfrag->size - pfrag->offset);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  857  			if (!sk_wmem_schedule(sk, copy))
ab7ac4eb9832e3 Tom Herbert       2016-03-07  858  				goto wait_for_memory;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  859  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  860  			err = skb_copy_to_page_nocache(sk, &msg->msg_iter, skb,
ab7ac4eb9832e3 Tom Herbert       2016-03-07  861  						       pfrag->page,
ab7ac4eb9832e3 Tom Herbert       2016-03-07  862  						       pfrag->offset,
ab7ac4eb9832e3 Tom Herbert       2016-03-07  863  						       copy);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  864  			if (err)
ab7ac4eb9832e3 Tom Herbert       2016-03-07  865  				goto out_error;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  866  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  867  			/* Update the skb. */
ab7ac4eb9832e3 Tom Herbert       2016-03-07  868  			if (merge) {
2b03bcae66c7b2 David Howells     2023-05-31  869  				skb_frag_size_add(
2b03bcae66c7b2 David Howells     2023-05-31  870  					&skb_shinfo(skb)->frags[i - 1], copy);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  871  			} else {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  872  				skb_fill_page_desc(skb, i, pfrag->page,
ab7ac4eb9832e3 Tom Herbert       2016-03-07  873  						   pfrag->offset, copy);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  874  				get_page(pfrag->page);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  875  			}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  876  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  877  			pfrag->offset += copy;
2b03bcae66c7b2 David Howells     2023-05-31  878  		}
2b03bcae66c7b2 David Howells     2023-05-31  879  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  880  		copied += copy;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  881  		if (head != skb) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  882  			head->len += copy;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  883  			head->data_len += copy;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  884  		}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  885  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  886  		continue;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  887  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  888  wait_for_memory:
ab7ac4eb9832e3 Tom Herbert       2016-03-07  889  		kcm_push(kcm);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  890  		err = sk_stream_wait_memory(sk, &timeo);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  891  		if (err)
ab7ac4eb9832e3 Tom Herbert       2016-03-07  892  			goto out_error;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  893  	}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  894  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  895  	if (eor) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  896  		bool not_busy = skb_queue_empty(&sk->sk_write_queue);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  897  
98e3862ca2b1ae WANG Cong         2017-02-07  898  		if (head) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  899  			/* Message complete, queue it on send buffer */
ab7ac4eb9832e3 Tom Herbert       2016-03-07  900  			__skb_queue_tail(&sk->sk_write_queue, head);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  901  			kcm->seq_skb = NULL;
cd6e111bf5be5c Tom Herbert       2016-03-07  902  			KCM_STATS_INCR(kcm->stats.tx_msgs);
98e3862ca2b1ae WANG Cong         2017-02-07  903  		}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  904  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  905  		if (msg->msg_flags & MSG_BATCH) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  906  			kcm->tx_wait_more = true;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  907  		} else if (kcm->tx_wait_more || not_busy) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  908  			err = kcm_write_msgs(kcm);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  909  			if (err < 0) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  910  				/* We got a hard error in write_msgs but have
ab7ac4eb9832e3 Tom Herbert       2016-03-07  911  				 * already queued this message. Report an error
ab7ac4eb9832e3 Tom Herbert       2016-03-07  912  				 * in the socket, but don't affect return value
ab7ac4eb9832e3 Tom Herbert       2016-03-07  913  				 * from sendmsg
ab7ac4eb9832e3 Tom Herbert       2016-03-07  914  				 */
ab7ac4eb9832e3 Tom Herbert       2016-03-07  915  				pr_warn("KCM: Hard failure on kcm_write_msgs\n");
ab7ac4eb9832e3 Tom Herbert       2016-03-07  916  				report_csk_error(&kcm->sk, -err);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  917  			}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  918  		}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  919  	} else {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  920  		/* Message not complete, save state */
ab7ac4eb9832e3 Tom Herbert       2016-03-07  921  partial_message:
cd27b96bc13841 WANG Cong         2017-02-13  922  		if (head) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  923  			kcm->seq_skb = head;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  924  			kcm_tx_msg(head)->last_skb = skb;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  925  		}
cd27b96bc13841 WANG Cong         2017-02-13  926  	}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  927  
cd6e111bf5be5c Tom Herbert       2016-03-07  928  	KCM_STATS_ADD(kcm->stats.tx_bytes, copied);
cd6e111bf5be5c Tom Herbert       2016-03-07  929  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  930  	release_sock(sk);
807067bf014d4a Kuniyuki Iwashima 2024-08-15  931  	mutex_unlock(&kcm->tx_mutex);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  932  	return copied;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  933  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  934  out_error:
ab7ac4eb9832e3 Tom Herbert       2016-03-07  935  	kcm_push(kcm);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  936  
3d264f513af54f Jiayuan Chen      2026-02-13  937  	/* When MAX_SKB_FRAGS was reached, a new skb was allocated and
3d264f513af54f Jiayuan Chen      2026-02-13  938  	 * linked into the frag_list before data copy. If the copy
3d264f513af54f Jiayuan Chen      2026-02-13  939  	 * subsequently failed, this skb has zero frags. Remove it from
3d264f513af54f Jiayuan Chen      2026-02-13  940  	 * the frag_list to prevent kcm_write_msgs from later hitting
3d264f513af54f Jiayuan Chen      2026-02-13  941  	 * WARN_ON(!skb_shinfo(skb)->nr_frags).
3d264f513af54f Jiayuan Chen      2026-02-13  942  	 */
3d264f513af54f Jiayuan Chen      2026-02-13  943  	if (frag_prev && !skb_shinfo(skb)->nr_frags) {
3d264f513af54f Jiayuan Chen      2026-02-13  944  		if (head == frag_prev)
3d264f513af54f Jiayuan Chen      2026-02-13 @945  			skb_shinfo(head)->frag_list = NULL;
3d264f513af54f Jiayuan Chen      2026-02-13  946  		else
3d264f513af54f Jiayuan Chen      2026-02-13  947  			frag_prev->next = NULL;
3d264f513af54f Jiayuan Chen      2026-02-13  948  		kfree_skb(skb);
3d264f513af54f Jiayuan Chen      2026-02-13  949  		/* Update skb as it may be saved in partial_message via goto */
3d264f513af54f Jiayuan Chen      2026-02-13  950  		skb = frag_prev;
3d264f513af54f Jiayuan Chen      2026-02-13  951  	}
3d264f513af54f Jiayuan Chen      2026-02-13  952  
a22730b1b4bf43 Kuniyuki Iwashima 2023-09-11  953  	if (sock->type == SOCK_SEQPACKET) {
ab7ac4eb9832e3 Tom Herbert       2016-03-07  954  		/* Wrote some bytes before encountering an
ab7ac4eb9832e3 Tom Herbert       2016-03-07  955  		 * error, return partial success.
ab7ac4eb9832e3 Tom Herbert       2016-03-07  956  		 */
a22730b1b4bf43 Kuniyuki Iwashima 2023-09-11  957  		if (copied)
ab7ac4eb9832e3 Tom Herbert       2016-03-07  958  			goto partial_message;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  959  		if (head != kcm->seq_skb)
ab7ac4eb9832e3 Tom Herbert       2016-03-07  960  			kfree_skb(head);
a22730b1b4bf43 Kuniyuki Iwashima 2023-09-11  961  	} else {
a22730b1b4bf43 Kuniyuki Iwashima 2023-09-11  962  		kfree_skb(head);
a22730b1b4bf43 Kuniyuki Iwashima 2023-09-11  963  		kcm->seq_skb = NULL;
a22730b1b4bf43 Kuniyuki Iwashima 2023-09-11  964  	}
ab7ac4eb9832e3 Tom Herbert       2016-03-07  965  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  966  	err = sk_stream_error(sk, msg->msg_flags, err);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  967  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  968  	/* make sure we wake any epoll edge trigger waiter */
ab7ac4eb9832e3 Tom Herbert       2016-03-07  969  	if (unlikely(skb_queue_len(&sk->sk_write_queue) == 0 && err == -EAGAIN))
ab7ac4eb9832e3 Tom Herbert       2016-03-07  970  		sk->sk_write_space(sk);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  971  
ab7ac4eb9832e3 Tom Herbert       2016-03-07  972  	release_sock(sk);
807067bf014d4a Kuniyuki Iwashima 2024-08-15  973  	mutex_unlock(&kcm->tx_mutex);
ab7ac4eb9832e3 Tom Herbert       2016-03-07  974  	return err;
ab7ac4eb9832e3 Tom Herbert       2016-03-07  975  }
ab7ac4eb9832e3 Tom Herbert       2016-03-07  976  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

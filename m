Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBC21CCB40
	for <oe-kbuild@lists.linux.dev>; Sun, 25 May 2025 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748167357; cv=none; b=AEs02+i7dqNR3OvB6pK3WKFJEb/uImEIIN8vbK1WfFU0CiUWpriaA3KHV1zAEK0zCdc0idXUWkedZkf4Lbykv060r3keqkHBXPClmGiydtSUNfmB68zbDgPHZ+5xJuNJVueCZLR/kqNXu3CPT64iKqq2AzIX4peTEB14xQUTwCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748167357; c=relaxed/simple;
	bh=H2/5AphTukTppgEiE72ElODX0lIKq5htCdCoUJ+s3tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X209qwfosThCh4LByFgajXePlreZNRQb/62IvDo5UPBa1N03VAOhwAKp21UlMgSRtIxSEktvdNBRQOFA7iQ8k3q1gvgrPdxPOEdKKBCwLvs2+sd1q/ygzE6MK+wJ7d3vLqiTcCYtE4Ic1KbKsP/ZDtLrpeLYtvGJyrO9Og+m1P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLLmE7Fn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLLmE7Fn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748167357; x=1779703357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2/5AphTukTppgEiE72ElODX0lIKq5htCdCoUJ+s3tM=;
  b=DLLmE7FncCkSqLKuPH3+VBKTOKciIQdpaAV0+3maF1YX8cWbT/aAJLQa
   U4jYFzeTbJLPcJ7SDWgy7xAr+HVlp9CXfd5BlzKj06ftHLJYQxTm5CSOM
   dRkF1xXGnl7pYcDfgfziPsOf6B3c4hnG2afhykVEmfZnWu6RUq8LL9o6w
   UtydIjHA7VnRGUpsCr+Uhfc1ri66w5ebJ18k/cd+kt2nmjAuwddALq3Co
   JiOn+1DzKDyUFCSOVcAflxiOhUBl0syt01FeGp+VNNW6ZTBY9cIsdwFvn
   27mxbMNTSyT12sb0Hp3l4Uuw/D+DwHYU646RzIh8dida0ZRoJJrioe+Iu
   w==;
X-CSE-ConnectionGUID: BjtHCQu9T12N6MVpbc13iw==
X-CSE-MsgGUID: niw/iqrZSwqlFXa89R36Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50042938"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="50042938"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 03:02:36 -0700
X-CSE-ConnectionGUID: JWH28zU3TCCd8ycl2J7wbQ==
X-CSE-MsgGUID: DIK39OT7RsWADALRsmB6Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="146742575"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 May 2025 03:02:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ8Bb-000Rk4-0f;
	Sun, 25 May 2025 10:02:31 +0000
Date: Sun, 25 May 2025 18:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH]    net: ipv6: sanitize RPL SRH cmpre/cmpre fields to fix
 taint issue
Message-ID: <202505251717.YSYmRdLZ-lkp@intel.com>
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
In-Reply-To: <20250524055159.32982-1-rafalbilkowski@gmail.com>
References: <20250524055159.32982-1-rafalbilkowski@gmail.com>
TO: Rafal Bilkowski <rafalbilkowski@gmail.com>
TO: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: dsahern@kernel.org
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: Rafal Bilkowski <rafalbilkowski@gmail.com>

Hi Rafal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on klassert-ipsec/master]
[also build test WARNING on net/main net-next/main linus/master v6.15-rc7 next-20250523]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafal-Bilkowski/net-ipv6-sanitize-RPL-SRH-cmpre-cmpre-fields-to-fix-taint-issue/20250524-135351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git master
patch link:    https://lore.kernel.org/r/20250524055159.32982-1-rafalbilkowski%40gmail.com
patch subject: [PATCH]    net: ipv6: sanitize RPL SRH cmpre/cmpre fields to fix taint issue
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: parisc-randconfig-r072-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251717.YSYmRdLZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505251717.YSYmRdLZ-lkp@intel.com/

smatch warnings:
net/ipv6/exthdrs.c:511 ipv6_rpl_srh_rcv() error: uninitialized symbol 'hdr'.
net/ipv6/exthdrs.c:547 ipv6_rpl_srh_rcv() warn: impossible condition '(hdr->cmpri > 15) => (0-15 > 15)'
net/ipv6/exthdrs.c:547 ipv6_rpl_srh_rcv() warn: impossible condition '(hdr->cmpre > 15) => (0-15 > 15)'
net/ipv6/exthdrs.c:550 ipv6_rpl_srh_rcv() warn: impossible condition '(hdr->pad > 15) => (0-15 > 15)'
net/ipv6/exthdrs.c:555 ipv6_rpl_srh_rcv() warn: 'n' unsigned <= 0

vim +/hdr +511 net/ipv6/exthdrs.c

1ababeba4a21f3 David Lebrun        2016-11-08  481  
8610c7c6e3bd64 Alexander Aring     2020-03-27  482  static int ipv6_rpl_srh_rcv(struct sk_buff *skb)
8610c7c6e3bd64 Alexander Aring     2020-03-27  483  {
8610c7c6e3bd64 Alexander Aring     2020-03-27  484  	struct ipv6_rpl_sr_hdr *hdr, *ohdr, *chdr;
8610c7c6e3bd64 Alexander Aring     2020-03-27  485  	struct inet6_skb_parm *opt = IP6CB(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  486  	struct net *net = dev_net(skb->dev);
8610c7c6e3bd64 Alexander Aring     2020-03-27  487  	struct inet6_dev *idev;
8610c7c6e3bd64 Alexander Aring     2020-03-27  488  	struct ipv6hdr *oldhdr;
8610c7c6e3bd64 Alexander Aring     2020-03-27  489  	unsigned char *buf;
8610c7c6e3bd64 Alexander Aring     2020-03-27  490  	int accept_rpl_seg;
8610c7c6e3bd64 Alexander Aring     2020-03-27  491  	int i, err;
8610c7c6e3bd64 Alexander Aring     2020-03-27  492  	u64 n = 0;
8610c7c6e3bd64 Alexander Aring     2020-03-27  493  	u32 r;
8610c7c6e3bd64 Alexander Aring     2020-03-27  494  
8610c7c6e3bd64 Alexander Aring     2020-03-27  495  	idev = __in6_dev_get(skb->dev);
8610c7c6e3bd64 Alexander Aring     2020-03-27  496  
8610c7c6e3bd64 Alexander Aring     2020-03-27  497  	accept_rpl_seg = net->ipv6.devconf_all->rpl_seg_enabled;
8610c7c6e3bd64 Alexander Aring     2020-03-27  498  	if (accept_rpl_seg > idev->cnf.rpl_seg_enabled)
8610c7c6e3bd64 Alexander Aring     2020-03-27  499  		accept_rpl_seg = idev->cnf.rpl_seg_enabled;
8610c7c6e3bd64 Alexander Aring     2020-03-27  500  
8610c7c6e3bd64 Alexander Aring     2020-03-27  501  	if (!accept_rpl_seg) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  502  		kfree_skb(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  503  		return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  504  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  505  
8610c7c6e3bd64 Alexander Aring     2020-03-27  506  looped_back:
045bd21f380952 Rafal Bilkowski     2025-05-24  507  
045bd21f380952 Rafal Bilkowski     2025-05-24  508  	if (!pskb_may_pull(skb, skb_transport_offset(skb) + sizeof(struct ipv6_rpl_sr_hdr)))
045bd21f380952 Rafal Bilkowski     2025-05-24  509  		goto error;
045bd21f380952 Rafal Bilkowski     2025-05-24  510  	// Check if there is enough memory available for the header and hdrlen is in valid range
045bd21f380952 Rafal Bilkowski     2025-05-24 @511  	if (skb_tailroom(skb) < ((hdr->hdrlen + 1) << 3) ||
045bd21f380952 Rafal Bilkowski     2025-05-24  512  	    hdr->hdrlen == 0 ||
045bd21f380952 Rafal Bilkowski     2025-05-24  513  	    hdr->hdrlen > U8_MAX)
045bd21f380952 Rafal Bilkowski     2025-05-24  514  		goto error;
045bd21f380952 Rafal Bilkowski     2025-05-24  515  
8610c7c6e3bd64 Alexander Aring     2020-03-27  516  	hdr = (struct ipv6_rpl_sr_hdr *)skb_transport_header(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  517  
8610c7c6e3bd64 Alexander Aring     2020-03-27  518  	if (hdr->segments_left == 0) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  519  		if (hdr->nexthdr == NEXTHDR_IPV6) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  520  			int offset = (hdr->hdrlen + 1) << 3;
8610c7c6e3bd64 Alexander Aring     2020-03-27  521  
8610c7c6e3bd64 Alexander Aring     2020-03-27  522  			skb_postpull_rcsum(skb, skb_network_header(skb),
8610c7c6e3bd64 Alexander Aring     2020-03-27  523  					   skb_network_header_len(skb));
ac9d8a66e41d55 Kuniyuki Iwashima   2023-06-14  524  			skb_pull(skb, offset);
8610c7c6e3bd64 Alexander Aring     2020-03-27  525  			skb_postpull_rcsum(skb, skb_transport_header(skb),
8610c7c6e3bd64 Alexander Aring     2020-03-27  526  					   offset);
8610c7c6e3bd64 Alexander Aring     2020-03-27  527  
8610c7c6e3bd64 Alexander Aring     2020-03-27  528  			skb_reset_network_header(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  529  			skb_reset_transport_header(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  530  			skb->encapsulation = 0;
8610c7c6e3bd64 Alexander Aring     2020-03-27  531  
8610c7c6e3bd64 Alexander Aring     2020-03-27  532  			__skb_tunnel_rx(skb, skb->dev, net);
8610c7c6e3bd64 Alexander Aring     2020-03-27  533  
8610c7c6e3bd64 Alexander Aring     2020-03-27  534  			netif_rx(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  535  			return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  536  		}
8610c7c6e3bd64 Alexander Aring     2020-03-27  537  
8610c7c6e3bd64 Alexander Aring     2020-03-27  538  		opt->srcrt = skb_network_header_len(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  539  		opt->lastopt = opt->srcrt;
8610c7c6e3bd64 Alexander Aring     2020-03-27  540  		skb->transport_header += (hdr->hdrlen + 1) << 3;
8610c7c6e3bd64 Alexander Aring     2020-03-27  541  		opt->nhoff = (&hdr->nexthdr) - skb_network_header(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  542  
8610c7c6e3bd64 Alexander Aring     2020-03-27  543  		return 1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  544  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  545  
045bd21f380952 Rafal Bilkowski     2025-05-24  546  	// Check if cmpri and cmpre are valid and do not exceed 15
045bd21f380952 Rafal Bilkowski     2025-05-24 @547  	if (hdr->cmpri > 15 || hdr->cmpre > 15)
045bd21f380952 Rafal Bilkowski     2025-05-24  548  		goto error;
045bd21f380952 Rafal Bilkowski     2025-05-24  549  	// Check if pad value is valid and does not exceed 15
045bd21f380952 Rafal Bilkowski     2025-05-24 @550  	if (hdr->pad > 15)
045bd21f380952 Rafal Bilkowski     2025-05-24  551  		goto error;
045bd21f380952 Rafal Bilkowski     2025-05-24  552  
8610c7c6e3bd64 Alexander Aring     2020-03-27  553  	n = (hdr->hdrlen << 3) - hdr->pad - (16 - hdr->cmpre);
045bd21f380952 Rafal Bilkowski     2025-05-24  554  	// Check if n is non-negative
045bd21f380952 Rafal Bilkowski     2025-05-24 @555  	if (n <= 0)
045bd21f380952 Rafal Bilkowski     2025-05-24  556  		goto error;
045bd21f380952 Rafal Bilkowski     2025-05-24  557  
8610c7c6e3bd64 Alexander Aring     2020-03-27  558  	r = do_div(n, (16 - hdr->cmpri));
8610c7c6e3bd64 Alexander Aring     2020-03-27  559  	/* checks if calculation was without remainder and n fits into
8610c7c6e3bd64 Alexander Aring     2020-03-27  560  	 * unsigned char which is segments_left field. Should not be
8610c7c6e3bd64 Alexander Aring     2020-03-27  561  	 * higher than that.
8610c7c6e3bd64 Alexander Aring     2020-03-27  562  	 */
8610c7c6e3bd64 Alexander Aring     2020-03-27  563  	if (r || (n + 1) > 255) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  564  		kfree_skb(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  565  		return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  566  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  567  
8610c7c6e3bd64 Alexander Aring     2020-03-27  568  	if (hdr->segments_left > n + 1) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  569  		__IP6_INC_STATS(net, idev, IPSTATS_MIB_INHDRERRORS);
8610c7c6e3bd64 Alexander Aring     2020-03-27  570  		icmpv6_param_prob(skb, ICMPV6_HDR_FIELD,
8610c7c6e3bd64 Alexander Aring     2020-03-27  571  				  ((&hdr->segments_left) -
8610c7c6e3bd64 Alexander Aring     2020-03-27  572  				   skb_network_header(skb)));
8610c7c6e3bd64 Alexander Aring     2020-03-27  573  		return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  574  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  575  
8610c7c6e3bd64 Alexander Aring     2020-03-27  576  	hdr->segments_left--;
8610c7c6e3bd64 Alexander Aring     2020-03-27  577  	i = n - hdr->segments_left;
8610c7c6e3bd64 Alexander Aring     2020-03-27  578  
6f3934576853a4 Gustavo A. R. Silva 2020-06-22  579  	buf = kcalloc(struct_size(hdr, segments.addr, n + 2), 2, GFP_ATOMIC);
8610c7c6e3bd64 Alexander Aring     2020-03-27  580  	if (unlikely(!buf)) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  581  		kfree_skb(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  582  		return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  583  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  584  
8610c7c6e3bd64 Alexander Aring     2020-03-27  585  	ohdr = (struct ipv6_rpl_sr_hdr *)buf;
8610c7c6e3bd64 Alexander Aring     2020-03-27  586  	ipv6_rpl_srh_decompress(ohdr, hdr, &ipv6_hdr(skb)->daddr, n);
8610c7c6e3bd64 Alexander Aring     2020-03-27  587  	chdr = (struct ipv6_rpl_sr_hdr *)(buf + ((ohdr->hdrlen + 1) << 3));
8610c7c6e3bd64 Alexander Aring     2020-03-27  588  
6facbca52da2c2 Kuniyuki Iwashima   2023-06-14  589  	if (ipv6_addr_is_multicast(&ohdr->rpl_segaddr[i])) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  590  		kfree_skb(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  591  		kfree(buf);
8610c7c6e3bd64 Alexander Aring     2020-03-27  592  		return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  593  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  594  
8610c7c6e3bd64 Alexander Aring     2020-03-27  595  	err = ipv6_chk_rpl_srh_loop(net, ohdr->rpl_segaddr, n + 1);
8610c7c6e3bd64 Alexander Aring     2020-03-27  596  	if (err) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  597  		icmpv6_send(skb, ICMPV6_PARAMPROB, 0, 0);
8610c7c6e3bd64 Alexander Aring     2020-03-27  598  		kfree_skb(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  599  		kfree(buf);
8610c7c6e3bd64 Alexander Aring     2020-03-27  600  		return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  601  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  602  
5ee6ad1dcae8be Guo Zhengkui        2022-04-12  603  	swap(ipv6_hdr(skb)->daddr, ohdr->rpl_segaddr[i]);
8610c7c6e3bd64 Alexander Aring     2020-03-27  604  
8610c7c6e3bd64 Alexander Aring     2020-03-27  605  	ipv6_rpl_srh_compress(chdr, ohdr, &ipv6_hdr(skb)->daddr, n);
8610c7c6e3bd64 Alexander Aring     2020-03-27  606  
8610c7c6e3bd64 Alexander Aring     2020-03-27  607  	oldhdr = ipv6_hdr(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  608  
8610c7c6e3bd64 Alexander Aring     2020-03-27  609  	skb_pull(skb, ((hdr->hdrlen + 1) << 3));
8610c7c6e3bd64 Alexander Aring     2020-03-27  610  	skb_postpull_rcsum(skb, oldhdr,
8610c7c6e3bd64 Alexander Aring     2020-03-27  611  			   sizeof(struct ipv6hdr) + ((hdr->hdrlen + 1) << 3));
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  612  	if (unlikely(!hdr->segments_left)) {
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  613  		if (pskb_expand_head(skb, sizeof(struct ipv6hdr) + ((chdr->hdrlen + 1) << 3), 0,
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  614  				     GFP_ATOMIC)) {
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  615  			__IP6_INC_STATS(net, ip6_dst_idev(skb_dst(skb)), IPSTATS_MIB_OUTDISCARDS);
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  616  			kfree_skb(skb);
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  617  			kfree(buf);
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  618  			return -1;
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  619  		}
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  620  
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  621  		oldhdr = ipv6_hdr(skb);
a2f4c143d76b1a Kuniyuki Iwashima   2023-06-05  622  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  623  	skb_push(skb, ((chdr->hdrlen + 1) << 3) + sizeof(struct ipv6hdr));
8610c7c6e3bd64 Alexander Aring     2020-03-27  624  	skb_reset_network_header(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  625  	skb_mac_header_rebuild(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  626  	skb_set_transport_header(skb, sizeof(struct ipv6hdr));
8610c7c6e3bd64 Alexander Aring     2020-03-27  627  
8610c7c6e3bd64 Alexander Aring     2020-03-27  628  	memmove(ipv6_hdr(skb), oldhdr, sizeof(struct ipv6hdr));
8610c7c6e3bd64 Alexander Aring     2020-03-27  629  	memcpy(skb_transport_header(skb), chdr, (chdr->hdrlen + 1) << 3);
8610c7c6e3bd64 Alexander Aring     2020-03-27  630  
8610c7c6e3bd64 Alexander Aring     2020-03-27  631  	ipv6_hdr(skb)->payload_len = htons(skb->len - sizeof(struct ipv6hdr));
8610c7c6e3bd64 Alexander Aring     2020-03-27  632  	skb_postpush_rcsum(skb, ipv6_hdr(skb),
8610c7c6e3bd64 Alexander Aring     2020-03-27  633  			   sizeof(struct ipv6hdr) + ((chdr->hdrlen + 1) << 3));
8610c7c6e3bd64 Alexander Aring     2020-03-27  634  
8610c7c6e3bd64 Alexander Aring     2020-03-27  635  	kfree(buf);
8610c7c6e3bd64 Alexander Aring     2020-03-27  636  
8610c7c6e3bd64 Alexander Aring     2020-03-27  637  	ip6_route_input(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  638  
8610c7c6e3bd64 Alexander Aring     2020-03-27  639  	if (skb_dst(skb)->error) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  640  		dst_input(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  641  		return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  642  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  643  
8610c7c6e3bd64 Alexander Aring     2020-03-27  644  	if (skb_dst(skb)->dev->flags & IFF_LOOPBACK) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  645  		if (ipv6_hdr(skb)->hop_limit <= 1) {
8610c7c6e3bd64 Alexander Aring     2020-03-27  646  			__IP6_INC_STATS(net, idev, IPSTATS_MIB_INHDRERRORS);
8610c7c6e3bd64 Alexander Aring     2020-03-27  647  			icmpv6_send(skb, ICMPV6_TIME_EXCEED,
8610c7c6e3bd64 Alexander Aring     2020-03-27  648  				    ICMPV6_EXC_HOPLIMIT, 0);
8610c7c6e3bd64 Alexander Aring     2020-03-27  649  			kfree_skb(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  650  			return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  651  		}
8610c7c6e3bd64 Alexander Aring     2020-03-27  652  		ipv6_hdr(skb)->hop_limit--;
8610c7c6e3bd64 Alexander Aring     2020-03-27  653  
8610c7c6e3bd64 Alexander Aring     2020-03-27  654  		skb_pull(skb, sizeof(struct ipv6hdr));
8610c7c6e3bd64 Alexander Aring     2020-03-27  655  		goto looped_back;
8610c7c6e3bd64 Alexander Aring     2020-03-27  656  	}
8610c7c6e3bd64 Alexander Aring     2020-03-27  657  
8610c7c6e3bd64 Alexander Aring     2020-03-27  658  	dst_input(skb);
8610c7c6e3bd64 Alexander Aring     2020-03-27  659  
8610c7c6e3bd64 Alexander Aring     2020-03-27  660  	return -1;
045bd21f380952 Rafal Bilkowski     2025-05-24  661  
045bd21f380952 Rafal Bilkowski     2025-05-24  662  error:
045bd21f380952 Rafal Bilkowski     2025-05-24  663  	return -1;
8610c7c6e3bd64 Alexander Aring     2020-03-27  664  }
8610c7c6e3bd64 Alexander Aring     2020-03-27  665  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

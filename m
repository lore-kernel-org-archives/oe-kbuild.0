Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD5C1643E
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Mar 2024 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709538532; cv=none; b=IxrN5oVeKQucDYrs+mwt3l4Q9pPHu3FgK2aoXFxaK6557fNnxRDYjslXdnqeCunLrjdE/e59pV9L3yhagZjgWzGvN06uK8dpZdS7LbRlu/BefGgjgNzQN2igMViUNFfstKE7VPHZpOHuOW/RNZQs4SIeoZ9ujfyt5yn8MKV++zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709538532; c=relaxed/simple;
	bh=gyHutrvT+lgMkYQ3B+KLFrvfzB/SY5n/eWESlE5b/hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mBgBQ3uGdbwIh3zR83JY08NNQnrYNPuuoOayLrqVanxy8YY0Hc3EwYjyK3XCzapmBwl1CU8yiTlWMlC38Ua3EdqzX7pBchxIJGftfE6PnGFjOtvDAm4W3Hqj7ONtRrdtdXGbYoH61L0shgo2j2dTEZvRjiBbOUC/mVot4YD4hKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzW8mnGH; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzW8mnGH"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d23d301452so45498391fa.1
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Mar 2024 23:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709538528; x=1710143328; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ck1YjRUTdq+SPxCxIZW1DakmowBsy0nO/TisXYi88Z8=;
        b=mzW8mnGHQLiR1lDGlbvasTOw2kNSar0Dc0Rn3dJ11keSKnedZr7+x7Cvo5u72bsJz9
         QBgqtzmXVutyurz74afpTX4hG3iW9rEOYa1mrBR1hRwGmys15HhHNlsaZXRdmwPqjzCy
         75RZQAg2Lq7yHRE/NdKLmPwImtuwdsvVXRtA/h0CMvy2rbTbgloU7KMFiELC5WNRBoCJ
         v6OmEfeWG6E/p2lZE+KK4kakCGYxwvHNhvhWkhFOStIJaFuOLI9FgRM59ezZ+cc8hhOT
         5lht+z3C0QT1doHUHHC2VpCau6SM723oDKIca3EGFlpZvepVKIKV00XBA2tPkP/s32Jj
         hlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709538528; x=1710143328;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck1YjRUTdq+SPxCxIZW1DakmowBsy0nO/TisXYi88Z8=;
        b=TGvnV9k8NZR2INYRLWYnDhO0Rsf7eJ4d5geFWtm5m29wTY/DS2TU0I/9gttwMZTO55
         eA8wkkVxGLylNKYSYsjyOFWUnyeRT2BxsrKsoUqh/Mx6KTaNdKri9fBnnZJ34UdwGHbY
         S9k4QNC4sTP3vx8mMyqc/KHDXulCchDOSKa2ZHc0/EFk1lpQRFdvW7j7gESib+B7CGZa
         r1EtBexpBbq7WZnKudlx0i1aoWrxEC417vADs+DKWKpKvYBvM97KcS/MrjaMRiRZznFX
         aYvATA9dYAQ/yWTJ6y3ZkS9aswivDEqJ5jL4/DGJOCzRCwsJSwCOfKVvBcByxqfi1f35
         DITg==
X-Gm-Message-State: AOJu0Yz0pdbD2X8596ph8gnjv/zuFKNTUfWjgMEx6T+y3gjyvy/GwJda
	cv0VnvPibKwyUngD+CXe42nx4F84hPc0foQkE7kMaX6PkvzDeEJ01eFPFzKuDaHxi1uUOoWGNWE
	O
X-Google-Smtp-Source: AGHT+IFiv7ye8gtQUToJaHtLt2NUCp7xfwVzXQd7e0Dgjah/jPUQnG33pcRTUmkTdWU8bRYe8ajt1g==
X-Received: by 2002:a05:651c:224:b0:2d2:bd9:f100 with SMTP id z4-20020a05651c022400b002d20bd9f100mr5469192ljn.20.1709538528107;
        Sun, 03 Mar 2024 23:48:48 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id t11-20020a05600c198b00b00412c8117a34sm10081674wmq.47.2024.03.03.23.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 23:48:47 -0800 (PST)
Date: Mon, 4 Mar 2024 10:48:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, jasperwang@tencent.com, kaixuxia@tencent.com,
	frankjpliu@tencent.com, kasong@tencent.com, sagazchen@tencent.com,
	kernelxing@tencent.com, aurelianliu@tencent.com,
	jason.zeng@intel.com, wu.zheng@intel.com, yingbao.jia@intel.com,
	pei.p.jia@intel.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 25/98] net/ipv6/ip6_input.c:197 ip6_rcv_core()
 error: we previously assumed 'dev' could be null (see line 163)
Message-ID: <a1ecf637-0c7c-4895-8d9c-232e84e3783c@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: d9324ddd538a0b57dbee8623806ff9b9f7811202 [25/98] net: dev ipv4/v6 stat
config: x86_64-randconfig-161-20240302 (https://download.01.org/0day-ci/archive/20240303/202403031604.Upli769L-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403031604.Upli769L-lkp@intel.com/

smatch warnings:
net/ipv6/ip6_input.c:197 ip6_rcv_core() error: we previously assumed 'dev' could be null (see line 163)

vim +/dev +197 net/ipv6/ip6_input.c

d8269e2cbf908f Edward Cree              2018-07-05  149  static struct sk_buff *ip6_rcv_core(struct sk_buff *skb, struct net_device *dev,
d8269e2cbf908f Edward Cree              2018-07-05  150  				    struct net *net)
^1da177e4c3f41 Linus Torvalds           2005-04-16  151  {
4daf841a2ef3b2 Menglong Dong            2022-04-13  152  	enum skb_drop_reason reason;
b71d1d426d263b Eric Dumazet             2011-04-22  153  	const struct ipv6hdr *hdr;
^1da177e4c3f41 Linus Torvalds           2005-04-16  154  	u32 pkt_len;
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  155  	struct inet6_dev *idev;
^1da177e4c3f41 Linus Torvalds           2005-04-16  156  
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  157  	if (skb->pkt_type == PACKET_OTHERHOST) {
794c24e9921f32 Jeffrey Ji               2022-04-06  158  		dev_core_stats_rx_otherhost_dropped_inc(skb->dev);
4daf841a2ef3b2 Menglong Dong            2022-04-13  159  		kfree_skb_reason(skb, SKB_DROP_REASON_OTHERHOST);
d8269e2cbf908f Edward Cree              2018-07-05  160  		return NULL;
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  161  	}
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  162  
d9324ddd538a0b Hongbo Li                2023-11-16 @163  	if (dev) {
                                                                    ^^^
I think this check is unnecessary

d9324ddd538a0b Hongbo Li                2023-11-16  164  		__SNMP_INC_STATS(dev->mib.dev_statistics, DEV_MIB_IPV6_RX_PKTS);
d9324ddd538a0b Hongbo Li                2023-11-16  165  		__SNMP_ADD_STATS(dev->mib.dev_statistics, DEV_MIB_IPV6_RX_BYTES,
d9324ddd538a0b Hongbo Li                2023-11-16  166  				 skb->len);
d9324ddd538a0b Hongbo Li                2023-11-16  167  	}
d9324ddd538a0b Hongbo Li                2023-11-16  168  
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  169  	rcu_read_lock();
^1da177e4c3f41 Linus Torvalds           2005-04-16  170  
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  171  	idev = __in6_dev_get(skb->dev);
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  172  
c2005eb01044e8 Eric Dumazet             2016-04-27  173  	__IP6_UPD_PO_STATS(net, idev, IPSTATS_MIB_IN, skb->len);
^1da177e4c3f41 Linus Torvalds           2005-04-16  174  
4daf841a2ef3b2 Menglong Dong            2022-04-13  175  	SKB_DR_SET(reason, NOT_SPECIFIED);
778d80be526995 YOSHIFUJI Hideaki        2008-06-28  176  	if ((skb = skb_share_check(skb, GFP_ATOMIC)) == NULL ||
778d80be526995 YOSHIFUJI Hideaki        2008-06-28  177  	    !idev || unlikely(idev->cnf.disable_ipv6)) {
1d0155035918aa Eric Dumazet             2016-04-27  178  		__IP6_INC_STATS(net, idev, IPSTATS_MIB_INDISCARDS);
0339d25a2807d9 Eric Dumazet             2022-04-13  179  		if (idev && unlikely(idev->cnf.disable_ipv6))
4daf841a2ef3b2 Menglong Dong            2022-04-13  180  			SKB_DR_SET(reason, IPV6DISABLED);
71f6f6dfdf7c7a Jesper Nilsson           2009-03-27  181  		goto drop;
^1da177e4c3f41 Linus Torvalds           2005-04-16  182  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  183  
6b7fdc3ae18a05 Guillaume Chazarain      2006-07-24  184  	memset(IP6CB(skb), 0, sizeof(struct inet6_skb_parm));
6b7fdc3ae18a05 Guillaume Chazarain      2006-07-24  185  
^1da177e4c3f41 Linus Torvalds           2005-04-16  186  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  187  	 * Store incoming device index. When the packet will
^1da177e4c3f41 Linus Torvalds           2005-04-16  188  	 * be queued, we cannot refer to skb->dev anymore.
^1da177e4c3f41 Linus Torvalds           2005-04-16  189  	 *
^1da177e4c3f41 Linus Torvalds           2005-04-16  190  	 * BTW, when we send a packet for our own local address on a
^1da177e4c3f41 Linus Torvalds           2005-04-16  191  	 * non-loopback interface (e.g. ethX), it is being delivered
de3cb747ffac5f Daniel Lezcano           2007-09-25  192  	 * via the loopback interface (lo) here; skb->dev = loopback_dev.
^1da177e4c3f41 Linus Torvalds           2005-04-16  193  	 * It, however, should be considered as if it is being
^1da177e4c3f41 Linus Torvalds           2005-04-16  194  	 * arrived via the sending interface (ethX), because of the
^1da177e4c3f41 Linus Torvalds           2005-04-16  195  	 * nature of scoping architecture. --yoshfuji
^1da177e4c3f41 Linus Torvalds           2005-04-16  196  	 */
48fb6b55450191 Wei-Chun Chao            2015-07-22 @197  	IP6CB(skb)->iif = skb_valid_dst(skb) ? ip6_dst_idev(skb_dst(skb))->dev->ifindex : dev->ifindex;
                                                                                                                                                  ^^^^^^^^^^^^
The rest of the function dereferences it without checking.

^1da177e4c3f41 Linus Torvalds           2005-04-16  198  
2889139a6acd29 Herbert Xu               2006-06-30  199  	if (unlikely(!pskb_may_pull(skb, sizeof(*hdr))))
^1da177e4c3f41 Linus Torvalds           2005-04-16  200  		goto err;
^1da177e4c3f41 Linus Torvalds           2005-04-16  201  
0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25  202  	hdr = ipv6_hdr(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  203  
4daf841a2ef3b2 Menglong Dong            2022-04-13  204  	if (hdr->version != 6) {
4daf841a2ef3b2 Menglong Dong            2022-04-13  205  		SKB_DR_SET(reason, UNHANDLED_PROTO);
^1da177e4c3f41 Linus Torvalds           2005-04-16  206  		goto err;
4daf841a2ef3b2 Menglong Dong            2022-04-13  207  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  208  
1d0155035918aa Eric Dumazet             2016-04-27  209  	__IP6_ADD_STATS(net, idev,
1f07d03e2069df Eric Dumazet             2013-08-06  210  			IPSTATS_MIB_NOECTPKTS +
1f07d03e2069df Eric Dumazet             2013-08-06  211  				(ipv6_get_dsfield(hdr) & INET_ECN_MASK),
1f07d03e2069df Eric Dumazet             2013-08-06  212  			max_t(unsigned short, 1, skb_shinfo(skb)->gso_segs));
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  213  	/*
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  214  	 * RFC4291 2.5.3
0aa8c13eb51282 Florian Westphal         2017-04-14  215  	 * The loopback address must not be used as the source address in IPv6
0aa8c13eb51282 Florian Westphal         2017-04-14  216  	 * packets that are sent outside of a single node. [..]
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  217  	 * A packet received on an interface with a destination address
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  218  	 * of loopback must be dropped.
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  219  	 */
0aa8c13eb51282 Florian Westphal         2017-04-14  220  	if ((ipv6_addr_loopback(&hdr->saddr) ||
0aa8c13eb51282 Florian Westphal         2017-04-14  221  	     ipv6_addr_loopback(&hdr->daddr)) &&
3ede0bbcdfc94c Robert Shearman          2018-09-19  222  	    !(dev->flags & IFF_LOOPBACK) &&
3ede0bbcdfc94c Robert Shearman          2018-09-19  223  	    !netif_is_l3_master(dev))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


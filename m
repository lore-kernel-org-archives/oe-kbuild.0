Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1503142652
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717490318; cv=none; b=FYoHEV0gkv/PNRpGRqXBl4ipmIwt/aFtVyMPNYBa76BUKEUL5qJfuoISz/gg9U35CdcXaDGCZ0TtjQWjvwKg212AJTrGa7OuJcJ7Dv+M4qXpsPjBT/hGU9oHxhiGodoO9btPGHsWuqWXgXzdXzlj63e5WjczQqt2RsJmQDB5ijk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717490318; c=relaxed/simple;
	bh=iVEzWua6t3a4C9Y5QWB3RXbHhzjxxfN/lzWCoi6fkq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FvFGIk2EU6k24sdsProQsEAxfJ7MdacDQOd7XiL7BE6Xq1mW8aFh7a4vcebQn12sFhSymqSjudwquuPOAGwx8SIXm6vJJSwfim7Z/1iDKdjFtuvEvhKzU4+CV3N2Vwo7wVTcKyfTUiG7XeArGjp4tbNBnAad7yHMotJXoMfeh1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcrFnQgR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcrFnQgR"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a696cde86a4so26133466b.1
        for <oe-kbuild@lists.linux.dev>; Tue, 04 Jun 2024 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717490314; x=1718095114; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zXkaGaClQ8yNva6DWovxLeQK+QFUrMN8MuX/+g8LwB8=;
        b=pcrFnQgRmAUIuok95wwNEz85h2QbZI1PFOCUvtG852u5UDgQw5MiTKP/XOBlUx1Tvn
         9P76J+XpF2hTT/leukFLrND4VFNuJtdS5hokHCJzROsYq4sq1DJHIfoz+1DN/+BNvYKC
         hVRjbuHpsJEDJKFURr0jSlUbxSpAPjOqKf6tmbVviPEzpA8p4S3/nY9Kp1JoEvpcfAx1
         8ND1pqrhBVNYhiCHvljio04pXxCAXV62DHIoKY5/jpHp/OeyUE0VX8mlgi9/j7AgbyMe
         PsrqxVQb4rKNT2+0XRA4EhhPiJtu2oL+euDJpgoizHuM7q7nfBoludJVc0mKeMpZS4GJ
         ZV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717490314; x=1718095114;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXkaGaClQ8yNva6DWovxLeQK+QFUrMN8MuX/+g8LwB8=;
        b=QUJfqoBRvTe07SwJsfLwvtV0wMyZ+yu9c6ArIeWaR6J+ZOOcEN+5KS8fMNwWbctHf7
         TVlmjfX3inX9tZTngyVwswGu7d1RWjBp4upXzGG5KzPx+HKVJZmWEQftT2dqGBqAFveV
         WKS9c1VhbGsrYXyqMujmDuRHtaTYhE3L5dKcLz3fV3ICUgs7Y0ViaipswRwWEH10RTk9
         AzBejWwFfAIQZTWRak4ua4H3D5TaJIthMnoCtJSzDtXVzSaphir/HGNlwoIasaUagWE0
         0kIcdSiI3n9mVJ2XdU1YTFAFUjRakeaCXNh6RNhfTwXRAjK9FYYVLfrc9bUe6432L7to
         R7zw==
X-Gm-Message-State: AOJu0YyGcKKAZL/Ztb4BjiYDMRMOeGTryPyOXSXKYcOJ7FvYvpHavHSA
	eI/ooIXDXj1kVKIoUSMiILDqthGTYWLXhYsCGP2neFwEJld2jT7iYIpMUN4tBlP3NdFOENITrV/
	J
X-Google-Smtp-Source: AGHT+IE2RIkDYAo2dSjEcdrs4JDDbftRXBGu6vD87K1mhtK5xowkmPXLN0Iviq9oSk8IuQNFJwjsEQ==
X-Received: by 2002:a17:906:2b51:b0:a68:cc6f:cb5a with SMTP id a640c23a62f3a-a68cc6fcc2emr447172966b.68.1717490313265;
        Tue, 04 Jun 2024 01:38:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b5e8b0fasm453013266b.214.2024.06.04.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:38:32 -0700 (PDT)
Date: Tue, 4 Jun 2024 11:38:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yan Zhai <yan@cloudflare.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 4/6] tcp: pass rx socket on rcv drops
Message-ID: <c71ff259-603c-42d5-b5e4-c53026c70403@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48392b4d422dd64cb8e76822737928c189b2b4d2.1717105215.git.yan@cloudflare.com>

Hi Yan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhai/net-add-kfree_skb_for_sk-function/20240531-055120
base:   net-next/main
patch link:    https://lore.kernel.org/r/48392b4d422dd64cb8e76822737928c189b2b4d2.1717105215.git.yan%40cloudflare.com
patch subject: [RFC net-next 4/6] tcp: pass rx socket on rcv drops
config: i386-randconfig-141-20240601 (https://download.01.org/0day-ci/archive/20240601/202406011539.jhwBd7DX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406011539.jhwBd7DX-lkp@intel.com/

New smatch warnings:
net/ipv4/tcp_ipv4.c:2379 tcp_v4_rcv() error: uninitialized symbol 'sk'.
net/ipv6/tcp_ipv6.c:1947 tcp_v6_rcv() error: uninitialized symbol 'sk'.

vim +/sk +2379 net/ipv4/tcp_ipv4.c

^1da177e4c3f41 Linus Torvalds           2005-04-16  2171  int tcp_v4_rcv(struct sk_buff *skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2172  {
3b24d854cb3538 Eric Dumazet             2016-04-01  2173  	struct net *net = dev_net(skb->dev);
643b622b51f1f0 Menglong Dong            2022-02-20  2174  	enum skb_drop_reason drop_reason;
3fa6f616a7a4d0 David Ahern              2017-08-07  2175  	int sdif = inet_sdif(skb);
534322ca3daf56 David Ahern              2019-12-30  2176  	int dif = inet_iif(skb);
eddc9ec53be2ec Arnaldo Carvalho de Melo 2007-04-20  2177  	const struct iphdr *iph;
cf533ea53ebfae Eric Dumazet             2011-10-21  2178  	const struct tcphdr *th;
3b24d854cb3538 Eric Dumazet             2016-04-01  2179  	bool refcounted;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2180  	struct sock *sk;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2181  	int ret;
41eecbd712b73f Eric Dumazet             2024-04-07  2182  	u32 isn;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2183  
85125597419aec Menglong Dong            2022-01-09  2184  	drop_reason = SKB_DROP_REASON_NOT_SPECIFIED;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2185  	if (skb->pkt_type != PACKET_HOST)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2186  		goto discard_it;

sk not initliazed here.

^1da177e4c3f41 Linus Torvalds           2005-04-16  2187  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2188  	/* Count it even if it's bad */
90bbcc608369a1 Eric Dumazet             2016-04-27  2189  	__TCP_INC_STATS(net, TCP_MIB_INSEGS);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2190  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2191  	if (!pskb_may_pull(skb, sizeof(struct tcphdr)))
^1da177e4c3f41 Linus Torvalds           2005-04-16  2192  		goto discard_it;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2193  
ea1627c20c3462 Eric Dumazet             2016-05-13  2194  	th = (const struct tcphdr *)skb->data;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2195  
85125597419aec Menglong Dong            2022-01-09  2196  	if (unlikely(th->doff < sizeof(struct tcphdr) / 4)) {
85125597419aec Menglong Dong            2022-01-09  2197  		drop_reason = SKB_DROP_REASON_PKT_TOO_SMALL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2198  		goto bad_packet;
85125597419aec Menglong Dong            2022-01-09  2199  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2200  	if (!pskb_may_pull(skb, th->doff * 4))
^1da177e4c3f41 Linus Torvalds           2005-04-16  2201  		goto discard_it;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2202  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2203  	/* An explanation is required here, I think.
^1da177e4c3f41 Linus Torvalds           2005-04-16  2204  	 * Packet length and doff are validated by header prediction,
caa20d9abe810b Stephen Hemminger        2005-11-10  2205  	 * provided case of th->doff==0 is eliminated.
^1da177e4c3f41 Linus Torvalds           2005-04-16  2206  	 * So, we defer the checks. */
ed70fcfcee953a Tom Herbert              2014-05-02  2207  
ed70fcfcee953a Tom Herbert              2014-05-02  2208  	if (skb_checksum_init(skb, IPPROTO_TCP, inet_compute_pseudo))
6a5dc9e598fe90 Eric Dumazet             2013-04-29  2209  		goto csum_error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2210  
ea1627c20c3462 Eric Dumazet             2016-05-13  2211  	th = (const struct tcphdr *)skb->data;
eddc9ec53be2ec Arnaldo Carvalho de Melo 2007-04-20  2212  	iph = ip_hdr(skb);
4bdc3d66147b3a Eric Dumazet             2015-10-13  2213  lookup:
4461568aa4e565 Kuniyuki Iwashima        2022-09-07  2214  	sk = __inet_lookup_skb(net->ipv4.tcp_death_row.hashinfo,
4461568aa4e565 Kuniyuki Iwashima        2022-09-07  2215  			       skb, __tcp_hdrlen(th), th->source,
3fa6f616a7a4d0 David Ahern              2017-08-07  2216  			       th->dest, sdif, &refcounted);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2217  	if (!sk)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2218  		goto no_tcp_socket;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2219  
bb134d5d9580fc Eric Dumazet             2010-03-09  2220  	if (sk->sk_state == TCP_TIME_WAIT)
bb134d5d9580fc Eric Dumazet             2010-03-09  2221  		goto do_time_wait;
bb134d5d9580fc Eric Dumazet             2010-03-09  2222  
079096f103faca Eric Dumazet             2015-10-02  2223  	if (sk->sk_state == TCP_NEW_SYN_RECV) {
079096f103faca Eric Dumazet             2015-10-02  2224  		struct request_sock *req = inet_reqsk(sk);
e0f9759f530bf7 Eric Dumazet             2018-02-13  2225  		bool req_stolen = false;
7716682cc58e30 Eric Dumazet             2016-02-18  2226  		struct sock *nsk;
079096f103faca Eric Dumazet             2015-10-02  2227  
079096f103faca Eric Dumazet             2015-10-02  2228  		sk = req->rsk_listener;
6f0012e35160cd Eric Dumazet             2022-06-23  2229  		if (!xfrm4_policy_check(sk, XFRM_POLICY_IN, skb))
6f0012e35160cd Eric Dumazet             2022-06-23  2230  			drop_reason = SKB_DROP_REASON_XFRM_POLICY;
6f0012e35160cd Eric Dumazet             2022-06-23  2231  		else
0a3a809089eb1d Dmitry Safonov           2023-10-23  2232  			drop_reason = tcp_inbound_hash(sk, req, skb,
7bbb765b734966 Dmitry Safonov           2022-02-23  2233  						       &iph->saddr, &iph->daddr,
1330b6ef3313fc Jakub Kicinski           2022-03-07  2234  						       AF_INET, dif, sdif);
1330b6ef3313fc Jakub Kicinski           2022-03-07  2235  		if (unlikely(drop_reason)) {
e65c332de8a0c9 Eric Dumazet             2016-08-24  2236  			sk_drops_add(sk, skb);
729235554d805c Eric Dumazet             2016-02-11  2237  			reqsk_put(req);
729235554d805c Eric Dumazet             2016-02-11  2238  			goto discard_it;
729235554d805c Eric Dumazet             2016-02-11  2239  		}
4fd44a98ffe0d0 Frank van der Linden     2018-06-12  2240  		if (tcp_checksum_complete(skb)) {
4fd44a98ffe0d0 Frank van der Linden     2018-06-12  2241  			reqsk_put(req);
4fd44a98ffe0d0 Frank van der Linden     2018-06-12  2242  			goto csum_error;
4fd44a98ffe0d0 Frank van der Linden     2018-06-12  2243  		}
7716682cc58e30 Eric Dumazet             2016-02-18  2244  		if (unlikely(sk->sk_state != TCP_LISTEN)) {
d4f2c86b2b7e2e Kuniyuki Iwashima        2021-06-12  2245  			nsk = reuseport_migrate_sock(sk, req_to_sk(req), skb);
d4f2c86b2b7e2e Kuniyuki Iwashima        2021-06-12  2246  			if (!nsk) {
f03f2e154f52fd Eric Dumazet             2015-10-14  2247  				inet_csk_reqsk_queue_drop_and_put(sk, req);
4bdc3d66147b3a Eric Dumazet             2015-10-13  2248  				goto lookup;
4bdc3d66147b3a Eric Dumazet             2015-10-13  2249  			}
d4f2c86b2b7e2e Kuniyuki Iwashima        2021-06-12  2250  			sk = nsk;
d4f2c86b2b7e2e Kuniyuki Iwashima        2021-06-12  2251  			/* reuseport_migrate_sock() has already held one sk_refcnt
d4f2c86b2b7e2e Kuniyuki Iwashima        2021-06-12  2252  			 * before returning.
d4f2c86b2b7e2e Kuniyuki Iwashima        2021-06-12  2253  			 */
d4f2c86b2b7e2e Kuniyuki Iwashima        2021-06-12  2254  		} else {
3b24d854cb3538 Eric Dumazet             2016-04-01  2255  			/* We own a reference on the listener, increase it again
3b24d854cb3538 Eric Dumazet             2016-04-01  2256  			 * as we might lose it too soon.
3b24d854cb3538 Eric Dumazet             2016-04-01  2257  			 */
7716682cc58e30 Eric Dumazet             2016-02-18  2258  			sock_hold(sk);
d4f2c86b2b7e2e Kuniyuki Iwashima        2021-06-12  2259  		}
3b24d854cb3538 Eric Dumazet             2016-04-01  2260  		refcounted = true;
1f3b359f1004bd Eric Dumazet             2017-09-08  2261  		nsk = NULL;
eeea10b83a1394 Eric Dumazet             2017-12-03  2262  		if (!tcp_filter(sk, skb)) {
eeea10b83a1394 Eric Dumazet             2017-12-03  2263  			th = (const struct tcphdr *)skb->data;
eeea10b83a1394 Eric Dumazet             2017-12-03  2264  			iph = ip_hdr(skb);
eeea10b83a1394 Eric Dumazet             2017-12-03  2265  			tcp_v4_fill_cb(skb, iph, th);
e0f9759f530bf7 Eric Dumazet             2018-02-13  2266  			nsk = tcp_check_req(sk, skb, req, false, &req_stolen);
255f9034d3050f Menglong Dong            2022-02-20  2267  		} else {
255f9034d3050f Menglong Dong            2022-02-20  2268  			drop_reason = SKB_DROP_REASON_SOCKET_FILTER;
eeea10b83a1394 Eric Dumazet             2017-12-03  2269  		}
079096f103faca Eric Dumazet             2015-10-02  2270  		if (!nsk) {
079096f103faca Eric Dumazet             2015-10-02  2271  			reqsk_put(req);
e0f9759f530bf7 Eric Dumazet             2018-02-13  2272  			if (req_stolen) {
e0f9759f530bf7 Eric Dumazet             2018-02-13  2273  				/* Another cpu got exclusive access to req
e0f9759f530bf7 Eric Dumazet             2018-02-13  2274  				 * and created a full blown socket.
e0f9759f530bf7 Eric Dumazet             2018-02-13  2275  				 * Try to feed this packet to this socket
e0f9759f530bf7 Eric Dumazet             2018-02-13  2276  				 * instead of discarding it.
e0f9759f530bf7 Eric Dumazet             2018-02-13  2277  				 */
e0f9759f530bf7 Eric Dumazet             2018-02-13  2278  				tcp_v4_restore_cb(skb);
e0f9759f530bf7 Eric Dumazet             2018-02-13  2279  				sock_put(sk);
e0f9759f530bf7 Eric Dumazet             2018-02-13  2280  				goto lookup;
e0f9759f530bf7 Eric Dumazet             2018-02-13  2281  			}
7716682cc58e30 Eric Dumazet             2016-02-18  2282  			goto discard_and_relse;
079096f103faca Eric Dumazet             2015-10-02  2283  		}
6f0012e35160cd Eric Dumazet             2022-06-23  2284  		nf_reset_ct(skb);
079096f103faca Eric Dumazet             2015-10-02  2285  		if (nsk == sk) {
079096f103faca Eric Dumazet             2015-10-02  2286  			reqsk_put(req);
eeea10b83a1394 Eric Dumazet             2017-12-03  2287  			tcp_v4_restore_cb(skb);
ee01defe25bad0 Jason Xing               2024-02-26  2288  		} else {
ee01defe25bad0 Jason Xing               2024-02-26  2289  			drop_reason = tcp_child_process(sk, nsk, skb);
ee01defe25bad0 Jason Xing               2024-02-26  2290  			if (drop_reason) {
120391ef9ca8fe Jason Xing               2024-04-25  2291  				enum sk_rst_reason rst_reason;
120391ef9ca8fe Jason Xing               2024-04-25  2292  
120391ef9ca8fe Jason Xing               2024-04-25  2293  				rst_reason = sk_rst_convert_drop_reason(drop_reason);
120391ef9ca8fe Jason Xing               2024-04-25  2294  				tcp_v4_send_reset(nsk, skb, rst_reason);
7716682cc58e30 Eric Dumazet             2016-02-18  2295  				goto discard_and_relse;
ee01defe25bad0 Jason Xing               2024-02-26  2296  			}
7716682cc58e30 Eric Dumazet             2016-02-18  2297  			sock_put(sk);
079096f103faca Eric Dumazet             2015-10-02  2298  			return 0;
079096f103faca Eric Dumazet             2015-10-02  2299  		}
079096f103faca Eric Dumazet             2015-10-02  2300  	}
14834c4f4eb3c8 Eric Dumazet             2021-10-25  2301  
d13b05962369ba Eric Dumazet             2024-04-11  2302  process:
020e71a3cf7f50 Eric Dumazet             2021-10-25  2303  	if (static_branch_unlikely(&ip4_min_ttl)) {
14834c4f4eb3c8 Eric Dumazet             2021-10-25  2304  		/* min_ttl can be changed concurrently from do_ip_setsockopt() */
14834c4f4eb3c8 Eric Dumazet             2021-10-25  2305  		if (unlikely(iph->ttl < READ_ONCE(inet_sk(sk)->min_ttl))) {
02a1d6e7a6bb02 Eric Dumazet             2016-04-27  2306  			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
2798e36dc233a4 Eric Dumazet             2023-02-01  2307  			drop_reason = SKB_DROP_REASON_TCP_MINTTL;
d218d11133d888 Stephen Hemminger        2010-01-11  2308  			goto discard_and_relse;
6cce09f87a0479 Eric Dumazet             2010-03-07  2309  		}
020e71a3cf7f50 Eric Dumazet             2021-10-25  2310  	}
d218d11133d888 Stephen Hemminger        2010-01-11  2311  
255f9034d3050f Menglong Dong            2022-02-20  2312  	if (!xfrm4_policy_check(sk, XFRM_POLICY_IN, skb)) {
255f9034d3050f Menglong Dong            2022-02-20  2313  		drop_reason = SKB_DROP_REASON_XFRM_POLICY;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2314  		goto discard_and_relse;
255f9034d3050f Menglong Dong            2022-02-20  2315  	}
9ea88a153001ff Dmitry Popov             2014-08-07  2316  
0a3a809089eb1d Dmitry Safonov           2023-10-23  2317  	drop_reason = tcp_inbound_hash(sk, NULL, skb, &iph->saddr, &iph->daddr,
0a3a809089eb1d Dmitry Safonov           2023-10-23  2318  				       AF_INET, dif, sdif);
1330b6ef3313fc Jakub Kicinski           2022-03-07  2319  	if (drop_reason)
9ea88a153001ff Dmitry Popov             2014-08-07  2320  		goto discard_and_relse;
9ea88a153001ff Dmitry Popov             2014-08-07  2321  
895b5c9f206eb7 Florian Westphal         2019-09-29  2322  	nf_reset_ct(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2323  
85125597419aec Menglong Dong            2022-01-09  2324  	if (tcp_filter(sk, skb)) {
364df53c081d93 Menglong Dong            2022-01-27  2325  		drop_reason = SKB_DROP_REASON_SOCKET_FILTER;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2326  		goto discard_and_relse;
85125597419aec Menglong Dong            2022-01-09  2327  	}
ac6e780070e30e Eric Dumazet             2016-11-10  2328  	th = (const struct tcphdr *)skb->data;
ac6e780070e30e Eric Dumazet             2016-11-10  2329  	iph = ip_hdr(skb);
eeea10b83a1394 Eric Dumazet             2017-12-03  2330  	tcp_v4_fill_cb(skb, iph, th);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2331  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2332  	skb->dev = NULL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2333  
e994b2f0fb9229 Eric Dumazet             2015-10-02  2334  	if (sk->sk_state == TCP_LISTEN) {
e994b2f0fb9229 Eric Dumazet             2015-10-02  2335  		ret = tcp_v4_do_rcv(sk, skb);
e994b2f0fb9229 Eric Dumazet             2015-10-02  2336  		goto put_and_return;
e994b2f0fb9229 Eric Dumazet             2015-10-02  2337  	}
e994b2f0fb9229 Eric Dumazet             2015-10-02  2338  
e994b2f0fb9229 Eric Dumazet             2015-10-02  2339  	sk_incoming_cpu_update(sk);
e994b2f0fb9229 Eric Dumazet             2015-10-02  2340  
c63661848581a9 Ingo Molnar              2006-07-03  2341  	bh_lock_sock_nested(sk);
a44d6eacdaf56f Martin KaFai Lau         2016-03-14  2342  	tcp_segs_in(tcp_sk(sk), skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2343  	ret = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2344  	if (!sock_owned_by_user(sk)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  2345  		ret = tcp_v4_do_rcv(sk, skb);
8b27dae5a2e89a Eric Dumazet             2019-03-22  2346  	} else {
7a26dc9e7b43f5 Menglong Dong            2022-02-20  2347  		if (tcp_add_backlog(sk, skb, &drop_reason))
6b03a53a5ab7cc Zhu Yi                   2010-03-04  2348  			goto discard_and_relse;
6b03a53a5ab7cc Zhu Yi                   2010-03-04  2349  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2350  	bh_unlock_sock(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2351  
e994b2f0fb9229 Eric Dumazet             2015-10-02  2352  put_and_return:
3b24d854cb3538 Eric Dumazet             2016-04-01  2353  	if (refcounted)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2354  		sock_put(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2355  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2356  	return ret;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2357  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2358  no_tcp_socket:
85125597419aec Menglong Dong            2022-01-09  2359  	drop_reason = SKB_DROP_REASON_NO_SOCKET;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2360  	if (!xfrm4_policy_check(NULL, XFRM_POLICY_IN, skb))
^1da177e4c3f41 Linus Torvalds           2005-04-16  2361  		goto discard_it;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2362  
eeea10b83a1394 Eric Dumazet             2017-12-03  2363  	tcp_v4_fill_cb(skb, iph, th);
eeea10b83a1394 Eric Dumazet             2017-12-03  2364  
12e25e1041d044 Eric Dumazet             2015-06-03  2365  	if (tcp_checksum_complete(skb)) {
6a5dc9e598fe90 Eric Dumazet             2013-04-29  2366  csum_error:
85125597419aec Menglong Dong            2022-01-09  2367  		drop_reason = SKB_DROP_REASON_TCP_CSUM;
709c0314239992 Jakub Kicinski           2021-05-14  2368  		trace_tcp_bad_csum(skb);
90bbcc608369a1 Eric Dumazet             2016-04-27  2369  		__TCP_INC_STATS(net, TCP_MIB_CSUMERRORS);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2370  bad_packet:
90bbcc608369a1 Eric Dumazet             2016-04-27  2371  		__TCP_INC_STATS(net, TCP_MIB_INERRS);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2372  	} else {
120391ef9ca8fe Jason Xing               2024-04-25  2373  		tcp_v4_send_reset(NULL, skb, sk_rst_convert_drop_reason(drop_reason));
^1da177e4c3f41 Linus Torvalds           2005-04-16  2374  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2375  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2376  discard_it:
f8319dfd1b3b3b Menglong Dong            2022-05-13  2377  	SKB_DR_OR(drop_reason, NOT_SPECIFIED);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2378  	/* Discard frame. */
ba5a91847cf5d8 Yan Zhai                 2024-05-30 @2379  	kfree_skb_for_sk(skb, sk, drop_reason);
                                                                                      ^^
Uninitialized.

^1da177e4c3f41 Linus Torvalds           2005-04-16  2380  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2381  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2382  discard_and_relse:
532182cd610782 Eric Dumazet             2016-04-01  2383  	sk_drops_add(sk, skb);
3b24d854cb3538 Eric Dumazet             2016-04-01  2384  	if (refcounted)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2385  		sock_put(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2386  	goto discard_it;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2387  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2388  do_time_wait:
^1da177e4c3f41 Linus Torvalds           2005-04-16  2389  	if (!xfrm4_policy_check(NULL, XFRM_POLICY_IN, skb)) {
255f9034d3050f Menglong Dong            2022-02-20  2390  		drop_reason = SKB_DROP_REASON_XFRM_POLICY;
9469c7b4aa210c YOSHIFUJI Hideaki        2006-10-10  2391  		inet_twsk_put(inet_twsk(sk));
^1da177e4c3f41 Linus Torvalds           2005-04-16  2392  		goto discard_it;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2393  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2394  
eeea10b83a1394 Eric Dumazet             2017-12-03  2395  	tcp_v4_fill_cb(skb, iph, th);
eeea10b83a1394 Eric Dumazet             2017-12-03  2396  
6a5dc9e598fe90 Eric Dumazet             2013-04-29  2397  	if (tcp_checksum_complete(skb)) {
6a5dc9e598fe90 Eric Dumazet             2013-04-29  2398  		inet_twsk_put(inet_twsk(sk));
6a5dc9e598fe90 Eric Dumazet             2013-04-29  2399  		goto csum_error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2400  	}
41eecbd712b73f Eric Dumazet             2024-04-07  2401  	switch (tcp_timewait_state_process(inet_twsk(sk), skb, th, &isn)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  2402  	case TCP_TW_SYN: {
4461568aa4e565 Kuniyuki Iwashima        2022-09-07  2403  		struct sock *sk2 = inet_lookup_listener(net,
4461568aa4e565 Kuniyuki Iwashima        2022-09-07  2404  							net->ipv4.tcp_death_row.hashinfo,
4461568aa4e565 Kuniyuki Iwashima        2022-09-07  2405  							skb, __tcp_hdrlen(th),
da5e36308d9f71 Tom Herbert              2013-01-22  2406  							iph->saddr, th->source,
eddc9ec53be2ec Arnaldo Carvalho de Melo 2007-04-20  2407  							iph->daddr, th->dest,
3fa6f616a7a4d0 David Ahern              2017-08-07  2408  							inet_iif(skb),
3fa6f616a7a4d0 David Ahern              2017-08-07  2409  							sdif);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2410  		if (sk2) {
dbe7faa4045ea8 Eric Dumazet             2015-07-08  2411  			inet_twsk_deschedule_put(inet_twsk(sk));
^1da177e4c3f41 Linus Torvalds           2005-04-16  2412  			sk = sk2;
eeea10b83a1394 Eric Dumazet             2017-12-03  2413  			tcp_v4_restore_cb(skb);
3b24d854cb3538 Eric Dumazet             2016-04-01  2414  			refcounted = false;
41eecbd712b73f Eric Dumazet             2024-04-07  2415  			__this_cpu_write(tcp_tw_isn, isn);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2416  			goto process;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2417  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2418  	}
fcfd6dfab97006 Gustavo A. R. Silva      2017-10-16  2419  		/* to ACK */
a8eceea84a3a35 Joe Perches              2020-03-12  2420  		fallthrough;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2421  	case TCP_TW_ACK:
^1da177e4c3f41 Linus Torvalds           2005-04-16  2422  		tcp_v4_timewait_ack(sk, skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2423  		break;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2424  	case TCP_TW_RST:
22a32557758a71 Jason Xing               2024-05-10  2425  		tcp_v4_send_reset(sk, skb, SK_RST_REASON_TCP_TIMEWAIT_SOCKET);
271c3b9b7bdae0 Florian Westphal         2015-12-21  2426  		inet_twsk_deschedule_put(inet_twsk(sk));
271c3b9b7bdae0 Florian Westphal         2015-12-21  2427  		goto discard_it;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2428  	case TCP_TW_SUCCESS:;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2429  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2430  	goto discard_it;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2431  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


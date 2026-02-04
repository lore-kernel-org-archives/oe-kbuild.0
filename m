Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23B53E8C5F
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201840; cv=none; b=ORs6jhLPnNPuYZlQ9PH7e0wyqORtS10NYVYDgVMHc6yyyQOpwvKwh1j1Dtp1yd+FGRkUix8woUmt1fDMVAIusuxsRtysbTSlSZMvI/N90DMTxwssApvO9IminjWhRPzi9eULyoeQPwn7Mv7gRpYzxAwXkAqZzQLbVf583RvUSPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201840; c=relaxed/simple;
	bh=cSF6mdvnT5UqtTigDJthvVFWvRO7GA+0pE43Dg9E5vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QDhk2yUNk2KEin0NJBWhn8DLm3v7Se40lncQDgIOfdTAEzpZgEzDAMAcz2rY7rEJ8gzmJhGnmdFtV3KVb7sDFzqwGJTjSodDQfddg/+NmyHRoBVG6aGoPviKBnYpDy8SFbNKO0mxClKmEFL/R09xBZJ07lykHtf2i1lx5ePaJCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJ63PME2; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJ63PME2"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso56283645e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 04 Feb 2026 02:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770201838; x=1770806638; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvTOmVmu+lvq9yzlWgHrX6HFhSnTR3vCCgg6jZG10Kc=;
        b=jJ63PME2fmf7yb0gTye0yKomC04Ot8Xjv9giIROp+H1g2tA3EY8CU3Q6T0KRvhcPYn
         ar+sWko7O8TQSYKOnbt0coi2vWtMoI5QhCBfvnwYPg+SJ+IVopXH1z5Oo6QhLzZg4z5H
         f3CXkboVtWZjIuDFzq9HRaNFghqrvWyR62QzpKYIb6CLm3P8DyFbVckC9O0KyMzCtxDx
         objjN6QStk9yVlH88BPmlSxNPxR0L8xkS5PUrumDRR32fbzp+gvAWRzy+eurs8eeFx29
         ORohsNZCJMBatOl8/F7D9+8UEGZgVUHpcCug0J2lsZ1bXsGbuUogGNFjdE+w/bndM5wZ
         wECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201838; x=1770806638;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bvTOmVmu+lvq9yzlWgHrX6HFhSnTR3vCCgg6jZG10Kc=;
        b=gSUt653AWZLTrEWd2iVjUgbNmrNkJc9ovySeTYVKG57OgjE4KqSRJ/CLN/CiNH297p
         RE32M4CU039CTCpfjXAOArMaM6Q8z8+mTK+0e96s8QhJCQiJptPlfcWQcacNlKagH7Gw
         fxu33+WE1Du3ZEPo17ZgEm62eCz6OCXImENKGs9mqXys61SBZOafmlztDbiOryUmFELV
         vXZz3bMKeh2NFYObljbazMTpV8KHQpGCbKxnXLh4JToCMSD/YEQlGzXcQrzktbTVp5Cy
         Jtt63X0YLzaAkwy/D0NqveT1r4TOanRGsm/mJr1qh7PwzbGRFGiZO+geuQkXwyWKt4jQ
         fwsw==
X-Gm-Message-State: AOJu0Yxlsl/xqxU43CU8uFPh77ZESiGcQvByP+oJCDTursBnSfohmiVQ
	1axO72ybjkwgsXkolx98iemCs8cWdwWbX5JkF0LJdlfpPkWm7ZbEsmDDZ0jd3UaH0Rxd3aQcs0w
	nevMmsEtSCA==
X-Gm-Gg: AZuq6aJTEvkxrEItg4a/8EqQqa7ggiyHIUJFqQHGRi+I5kQsv0OGDlQed36AfRXctaa
	/d1Y0SkeLnkpRqGoyqdzP4jnXXsN3lnn7uhtzGmRMhBSroAZFe6BQzBuwKh0CkfauTiDR6ed7aY
	MaU8TT3hX94rdjA+ktd4AxYweQIc/GLFCui5H2Cu2fZEYNrnzFbjQLW8o1nAz22zBlEisbzMGGJ
	9Lmn7WCOQe2vMqIv1JUvRkDvTgpxqiFcYfs9E8uz/oeu4CBmfLNS0VeUOY7Uwr7jHq7MMjLdknB
	Ar9FZda8kgJxJOrQwJ8kkMZjEGqCCjtAmGlCwr1WZVkbBbhO4ZbEwMvgsWWdmrvqBM+U7ke4qpH
	c3JrX5btDrMjm+RJzFa4pJ2oLZ5T7b+VeTTSPL/Y7gJ8cpste7XwIqz0A7Xe9vQNBO56qtHehhf
	zdAQmchlr+azK0UbC4
X-Received: by 2002:a05:600c:8b30:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-4830e96d513mr31480795e9.23.1770201837738;
        Wed, 04 Feb 2026 02:43:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618064813sm5653046f8f.38.2026.02.04.02.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:43:57 -0800 (PST)
Date: Wed, 4 Feb 2026 13:43:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
Subject: [linux-next:master 11349/11582] net/ipv4/tcp_output.c:754
 tcp_options_write() error: we previously assumed 'tp' could be null (see
 line 722)
Message-ID: <202602041310.ZBuXDXC5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260204104354.p4EcT6ah6GhtxcrfXcdEZcuOlVsCHIPIbHOaVO2-v40@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5c009020744fe129e4728e71c44a6c7816c9105e
commit: 1247fb19cafee6f9fa350ae378e4e1e9965cc253 [11349/11582] tcp: accecn: detect loss ACK w/ AccECN option and add TCP_ACCECN_OPTION_PERSIST
config: s390-randconfig-r071-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041310.ZBuXDXC5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602041310.ZBuXDXC5-lkp@intel.com/

smatch warnings:
net/ipv4/tcp_output.c:754 tcp_options_write() error: we previously assumed 'tp' could be null (see line 722)

vim +/tp +754 net/ipv4/tcp_output.c

7425627b2b2cd6 Nathan Chancellor     2023-11-06  634  static void tcp_options_write(struct tcphdr *th, struct tcp_sock *tp,
7425627b2b2cd6 Nathan Chancellor     2023-11-06  635  			      const struct tcp_request_sock *tcprsk,
7425627b2b2cd6 Nathan Chancellor     2023-11-06  636  			      struct tcp_out_options *opts,
7425627b2b2cd6 Nathan Chancellor     2023-11-06  637  			      struct tcp_key *key)
7425627b2b2cd6 Nathan Chancellor     2023-11-06  638  {
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  639  	u8 leftover_highbyte = TCPOPT_NOP; /* replace 1st NOP if avail */
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  640  	u8 leftover_lowbyte = TCPOPT_NOP;  /* replace 2nd NOP in succession */
7425627b2b2cd6 Nathan Chancellor     2023-11-06  641  	__be32 *ptr = (__be32 *)(th + 1);
7425627b2b2cd6 Nathan Chancellor     2023-11-06  642  	u16 options = opts->options;	/* mungable copy */
7425627b2b2cd6 Nathan Chancellor     2023-11-06  643  
7425627b2b2cd6 Nathan Chancellor     2023-11-06  644  	if (tcp_key_is_md5(key)) {
7425627b2b2cd6 Nathan Chancellor     2023-11-06  645  		*ptr++ = htonl((TCPOPT_NOP << 24) | (TCPOPT_NOP << 16) |
7425627b2b2cd6 Nathan Chancellor     2023-11-06  646  			       (TCPOPT_MD5SIG << 8) | TCPOLEN_MD5SIG);
7425627b2b2cd6 Nathan Chancellor     2023-11-06  647  		/* overload cookie hash location */
7425627b2b2cd6 Nathan Chancellor     2023-11-06  648  		opts->hash_location = (__u8 *)ptr;
7425627b2b2cd6 Nathan Chancellor     2023-11-06  649  		ptr += 4;
7425627b2b2cd6 Nathan Chancellor     2023-11-06  650  	} else if (tcp_key_is_ao(key)) {
7425627b2b2cd6 Nathan Chancellor     2023-11-06  651  		ptr = process_tcp_ao_options(tp, tcprsk, opts, key, ptr);
33ad798c924b4a Adam Langley          2008-07-19  652  	}
fd6149d332973b Ilpo Järvinen         2008-10-23  653  	if (unlikely(opts->mss)) {
fd6149d332973b Ilpo Järvinen         2008-10-23  654  		*ptr++ = htonl((TCPOPT_MSS << 24) |
fd6149d332973b Ilpo Järvinen         2008-10-23  655  			       (TCPOLEN_MSS << 16) |
fd6149d332973b Ilpo Järvinen         2008-10-23  656  			       opts->mss);
fd6149d332973b Ilpo Järvinen         2008-10-23  657  	}
fd6149d332973b Ilpo Järvinen         2008-10-23  658  
bd0388ae770750 William Allen Simpson 2009-12-02  659  	if (likely(OPTION_TS & options)) {
bd0388ae770750 William Allen Simpson 2009-12-02  660  		if (unlikely(OPTION_SACK_ADVERTISE & options)) {
33ad798c924b4a Adam Langley          2008-07-19  661  			*ptr++ = htonl((TCPOPT_SACK_PERM << 24) |
33ad798c924b4a Adam Langley          2008-07-19  662  				       (TCPOLEN_SACK_PERM << 16) |
33ad798c924b4a Adam Langley          2008-07-19  663  				       (TCPOPT_TIMESTAMP << 8) |
33ad798c924b4a Adam Langley          2008-07-19  664  				       TCPOLEN_TIMESTAMP);
bd0388ae770750 William Allen Simpson 2009-12-02  665  			options &= ~OPTION_SACK_ADVERTISE;
33ad798c924b4a Adam Langley          2008-07-19  666  		} else {
496c98dff8e353 YOSHIFUJI Hideaki     2006-10-10  667  			*ptr++ = htonl((TCPOPT_NOP << 24) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  668  				       (TCPOPT_NOP << 16) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  669  				       (TCPOPT_TIMESTAMP << 8) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  670  				       TCPOLEN_TIMESTAMP);
40efc6fa179f44 Stephen Hemminger     2006-01-03  671  		}
33ad798c924b4a Adam Langley          2008-07-19  672  		*ptr++ = htonl(opts->tsval);
33ad798c924b4a Adam Langley          2008-07-19  673  		*ptr++ = htonl(opts->tsecr);
33ad798c924b4a Adam Langley          2008-07-19  674  	}
33ad798c924b4a Adam Langley          2008-07-19  675  
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  676  	if (OPTION_ACCECN & options) {
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  677  		const u32 *ecn_bytes = opts->use_synack_ecn_bytes ?
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  678  				       synack_ecn_bytes :
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  679  				       tp->received_ecn_bytes;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  680  		const u8 ect0_idx = INET_ECN_ECT_0 - 1;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  681  		const u8 ect1_idx = INET_ECN_ECT_1 - 1;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  682  		const u8 ce_idx = INET_ECN_CE - 1;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  683  		u32 e0b;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  684  		u32 e1b;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  685  		u32 ceb;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  686  		u8 len;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  687  
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  688  		e0b = ecn_bytes[ect0_idx] + TCP_ACCECN_E0B_INIT_OFFSET;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  689  		e1b = ecn_bytes[ect1_idx] + TCP_ACCECN_E1B_INIT_OFFSET;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  690  		ceb = ecn_bytes[ce_idx] + TCP_ACCECN_CEB_INIT_OFFSET;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  691  		len = TCPOLEN_ACCECN_BASE +
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  692  		      opts->num_accecn_fields * TCPOLEN_ACCECN_PERFIELD;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  693  
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  694  		if (opts->num_accecn_fields == 2) {
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  695  			*ptr++ = htonl((TCPOPT_ACCECN1 << 24) | (len << 16) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  696  				       ((e1b >> 8) & 0xffff));
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  697  			*ptr++ = htonl(((e1b & 0xff) << 24) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  698  				       (ceb & 0xffffff));
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  699  		} else if (opts->num_accecn_fields == 1) {
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  700  			*ptr++ = htonl((TCPOPT_ACCECN1 << 24) | (len << 16) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  701  				       ((e1b >> 8) & 0xffff));
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  702  			leftover_highbyte = e1b & 0xff;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  703  			leftover_lowbyte = TCPOPT_NOP;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  704  		} else if (opts->num_accecn_fields == 0) {
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  705  			leftover_highbyte = TCPOPT_ACCECN1;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  706  			leftover_lowbyte = len;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  707  		} else if (opts->num_accecn_fields == 3) {
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  708  			*ptr++ = htonl((TCPOPT_ACCECN1 << 24) | (len << 16) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  709  				       ((e1b >> 8) & 0xffff));
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  710  			*ptr++ = htonl(((e1b & 0xff) << 24) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  711  				       (ceb & 0xffffff));
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  712  			*ptr++ = htonl(((e0b & 0xffffff) << 8) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  713  				       TCPOPT_NOP);
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  714  		}
aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  715  		if (tp) {

tp can be NULL here

b5e74132dfbe60 Ilpo Järvinen         2025-09-16  716  			tp->accecn_minlen = 0;
aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  717  			tp->accecn_opt_tstamp = tp->tcp_mstamp;
1247fb19cafee6 Chia-Yu Chang         2026-01-31  718  			tp->accecn_opt_sent_w_dsack = tp->rx_opt.dsack;
aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  719  			if (tp->accecn_opt_demand)
aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  720  				tp->accecn_opt_demand--;
aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  721  		}
1247fb19cafee6 Chia-Yu Chang         2026-01-31 @722  	} else if (tp) {

And here

1247fb19cafee6 Chia-Yu Chang         2026-01-31  723  		tp->accecn_opt_sent_w_dsack = 0;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  724  	}
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  725  
bd0388ae770750 William Allen Simpson 2009-12-02  726  	if (unlikely(OPTION_SACK_ADVERTISE & options)) {
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  727  		*ptr++ = htonl((leftover_highbyte << 24) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  728  			       (leftover_lowbyte << 16) |
33ad798c924b4a Adam Langley          2008-07-19  729  			       (TCPOPT_SACK_PERM << 8) |
33ad798c924b4a Adam Langley          2008-07-19  730  			       TCPOLEN_SACK_PERM);
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  731  		leftover_highbyte = TCPOPT_NOP;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  732  		leftover_lowbyte = TCPOPT_NOP;
33ad798c924b4a Adam Langley          2008-07-19  733  	}
33ad798c924b4a Adam Langley          2008-07-19  734  
bd0388ae770750 William Allen Simpson 2009-12-02  735  	if (unlikely(OPTION_WSCALE & options)) {
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  736  		u8 highbyte = TCPOPT_NOP;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  737  
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  738  		/* Do not split the leftover 2-byte to fit into a single
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  739  		 * NOP, i.e., replace this NOP only when 1 byte is leftover
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  740  		 * within leftover_highbyte.
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  741  		 */
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  742  		if (unlikely(leftover_highbyte != TCPOPT_NOP &&
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  743  			     leftover_lowbyte == TCPOPT_NOP)) {
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  744  			highbyte = leftover_highbyte;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  745  			leftover_highbyte = TCPOPT_NOP;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  746  		}
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  747  		*ptr++ = htonl((highbyte << 24) |
33ad798c924b4a Adam Langley          2008-07-19  748  			       (TCPOPT_WINDOW << 16) |
33ad798c924b4a Adam Langley          2008-07-19  749  			       (TCPOLEN_WINDOW << 8) |
33ad798c924b4a Adam Langley          2008-07-19  750  			       opts->ws);
33ad798c924b4a Adam Langley          2008-07-19  751  	}
33ad798c924b4a Adam Langley          2008-07-19  752  
33ad798c924b4a Adam Langley          2008-07-19  753  	if (unlikely(opts->num_sack_blocks)) {
33ad798c924b4a Adam Langley          2008-07-19 @754  		struct tcp_sack_block *sp = tp->rx_opt.dsack ?

Unchecked dereference

33ad798c924b4a Adam Langley          2008-07-19  755  			tp->duplicate_sack : tp->selective_acks;
40efc6fa179f44 Stephen Hemminger     2006-01-03  756  		int this_sack;
40efc6fa179f44 Stephen Hemminger     2006-01-03  757  
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  758  		*ptr++ = htonl((leftover_highbyte << 24) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  759  			       (leftover_lowbyte << 16) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  760  			       (TCPOPT_SACK <<  8) |
33ad798c924b4a Adam Langley          2008-07-19  761  			       (TCPOLEN_SACK_BASE + (opts->num_sack_blocks *
40efc6fa179f44 Stephen Hemminger     2006-01-03  762  						     TCPOLEN_SACK_PERBLOCK)));
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  763  		leftover_highbyte = TCPOPT_NOP;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  764  		leftover_lowbyte = TCPOPT_NOP;
2de979bd7da9c8 Stephen Hemminger     2007-03-08  765  
33ad798c924b4a Adam Langley          2008-07-19  766  		for (this_sack = 0; this_sack < opts->num_sack_blocks;
33ad798c924b4a Adam Langley          2008-07-19  767  		     ++this_sack) {
40efc6fa179f44 Stephen Hemminger     2006-01-03  768  			*ptr++ = htonl(sp[this_sack].start_seq);
40efc6fa179f44 Stephen Hemminger     2006-01-03  769  			*ptr++ = htonl(sp[this_sack].end_seq);
40efc6fa179f44 Stephen Hemminger     2006-01-03  770  		}
2de979bd7da9c8 Stephen Hemminger     2007-03-08  771  
40efc6fa179f44 Stephen Hemminger     2006-01-03  772  		tp->rx_opt.dsack = 0;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  773  	} else if (unlikely(leftover_highbyte != TCPOPT_NOP ||
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  774  			    leftover_lowbyte != TCPOPT_NOP)) {
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  775  		*ptr++ = htonl((leftover_highbyte << 24) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  776  			       (leftover_lowbyte << 16) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  777  			       (TCPOPT_NOP << 8) |
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  778  			       TCPOPT_NOP);
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  779  		leftover_highbyte = TCPOPT_NOP;
b5e74132dfbe60 Ilpo Järvinen         2025-09-16  780  		leftover_lowbyte = TCPOPT_NOP;
40efc6fa179f44 Stephen Hemminger     2006-01-03  781  	}
2100c8d2d9db23 Yuchung Cheng         2012-07-19  782  
2100c8d2d9db23 Yuchung Cheng         2012-07-19  783  	if (unlikely(OPTION_FAST_OPEN_COOKIE & options)) {
2100c8d2d9db23 Yuchung Cheng         2012-07-19  784  		struct tcp_fastopen_cookie *foc = opts->fastopen_cookie;
7f9b838b71eb78 Daniel Lee            2015-04-06  785  		u8 *p = (u8 *)ptr;
7f9b838b71eb78 Daniel Lee            2015-04-06  786  		u32 len; /* Fast Open option length */
2100c8d2d9db23 Yuchung Cheng         2012-07-19  787  
7f9b838b71eb78 Daniel Lee            2015-04-06  788  		if (foc->exp) {
7f9b838b71eb78 Daniel Lee            2015-04-06  789  			len = TCPOLEN_EXP_FASTOPEN_BASE + foc->len;
7f9b838b71eb78 Daniel Lee            2015-04-06  790  			*ptr = htonl((TCPOPT_EXP << 24) | (len << 16) |
2100c8d2d9db23 Yuchung Cheng         2012-07-19  791  				     TCPOPT_FASTOPEN_MAGIC);
7f9b838b71eb78 Daniel Lee            2015-04-06  792  			p += TCPOLEN_EXP_FASTOPEN_BASE;
7f9b838b71eb78 Daniel Lee            2015-04-06  793  		} else {
7f9b838b71eb78 Daniel Lee            2015-04-06  794  			len = TCPOLEN_FASTOPEN_BASE + foc->len;
7f9b838b71eb78 Daniel Lee            2015-04-06  795  			*p++ = TCPOPT_FASTOPEN;
7f9b838b71eb78 Daniel Lee            2015-04-06  796  			*p++ = len;
7f9b838b71eb78 Daniel Lee            2015-04-06  797  		}
2100c8d2d9db23 Yuchung Cheng         2012-07-19  798  
7f9b838b71eb78 Daniel Lee            2015-04-06  799  		memcpy(p, foc->val, foc->len);
7f9b838b71eb78 Daniel Lee            2015-04-06  800  		if ((len & 3) == 2) {
7f9b838b71eb78 Daniel Lee            2015-04-06  801  			p[foc->len] = TCPOPT_NOP;
7f9b838b71eb78 Daniel Lee            2015-04-06  802  			p[foc->len + 1] = TCPOPT_NOP;
2100c8d2d9db23 Yuchung Cheng         2012-07-19  803  		}
7f9b838b71eb78 Daniel Lee            2015-04-06  804  		ptr += (len + 3) >> 2;
2100c8d2d9db23 Yuchung Cheng         2012-07-19  805  	}
60e2a7780793ba Ursula Braun          2017-10-25  806  
60e2a7780793ba Ursula Braun          2017-10-25  807  	smc_options_write(ptr, &options);
eda7acddf8080b Peter Krystad         2020-01-21  808  
ea66758c1795ce Paolo Abeni           2022-05-04  809  	mptcp_options_write(th, ptr, tp, opts);
60e2a7780793ba Ursula Braun          2017-10-25  810  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A533A9D9A
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041626; cv=none; b=MkH5sREACcs+zcmOqq8hrl4lnyrZupOfMH99HvxjjKpwi59EfRCc6v41qmgxmPJ+dZ/VB4TXz7QXbh85GNm+nevm9psKd7bbHDIVNemDTxg7MisaUJlQwBs27Bpl13X6I4h76Fbzp9guV2EFepzLb3od2Kv0Fob5FlouKIPX8Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041626; c=relaxed/simple;
	bh=zYlVntXwhdlUnW5vAlvjPe38i7azvGS2GlqNP0KOc+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WkWy3ZewbPF2sTul6POAQUYDwUaaGpLBSbcGq5ZdUF9HbF0IpaBUaBdvKXVM+4esVsqOFE0Cha5JoLIMV+7qjPVVC95GVJv0G+RiNkqD3+cw27rxwIoBoQmV0EEqRk1ij80e5AO4gI4OAZGVIJzm5fjcsWk+QgD+n+8UPSRWke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPj4s1nn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPj4s1nn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49039a8851fso79973075e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780041623; x=1780646423; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsWWYwHWwiKpmV/6esUQv13E1pN3/bXaI09Fv/IDkuU=;
        b=UPj4s1nncATBc6eY3L9yu9XdytykEInb7JTdtsMdpSyMGOfLGi3psQBLfkqBdB88Yx
         4V4RM6ko6b26CTq89dyQrdbkpIqF+WX4Dp86AovFfO6CexWM3NVdvOHIvV0O7264j3u7
         ufoTRaca6cuXTSMUdL08Ay2KJipgSLu9t/Es693BBGty4nbc0qpoyc1FFw3NIIYK1Ugj
         IcqCxQZdOKFaJymL8w3mSBWpwbVnvQRrXqWYTm0KgRMI3IevxW/+fQPZa9PNb20FK0BS
         wn20UdtbB1BfWfm6jbrnqxvtyUY311uXMirfQjYmwbptMG3qjmWTNTI/3iuTRPdt+RLk
         wCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041623; x=1780646423;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsWWYwHWwiKpmV/6esUQv13E1pN3/bXaI09Fv/IDkuU=;
        b=OZ7qKHb1vYAurA/4tJwnWu2V1AxnXagWyYXQzaDLW3C0EWaP4LzYGRMqKs2NteNKl7
         QQYKFSJyW10z7wm6gAxrgOwtNDRNjdX3Ay2YpwmtaUkt8hM0BCacoFiqjlBElTFTQWee
         6RPe8fsdY0e6hzsSLkDtujMaQ0F3ZC1FScSxFcNn3WCH2CRYhgsG++Fr3AbrPujSuIad
         OlEf+SQ7gdDN/KhB4KccNhNnAAjDCYqF+KFY89Nv6kRYhnZuTuur7Gxp+A+1YhlSZzmu
         eYHTEjJf1gR9jtxww5p+lvMCstRsdlRzxOlPNEgPTej8VvQjD6T8TCp4g8ctMclOVfbx
         NcDA==
X-Gm-Message-State: AOJu0YxFRXZ9o9sZWd610nfJkXfvmOggx3qhB/0d6SgGEyaNYZgcdYfv
	VarFXYRWU8zCaZI/eFt8tHkLShOxlDQZjdxL9Dr6nMc0YWHSBQfgYzBojdJCbSGe
X-Gm-Gg: Acq92OFhfP2rZSdKvn2vxdfA4mDEjPY1RozszHpkQZEPE8kUNsA3WYqDVJuQaskkTXf
	R9W3op2tXEqmiIDCDNcUCTVi4//3AsnR6hhniCSyvduI5sYr6E9cx3vGbonBqdazfvx1Ik8ZBjo
	qia0In6GtgksdvCEl6AiwJ8/v/X0O/BPShMTdhv2HnhYcRAYgLRjg74KPbApLL55CJHNRtHLnX/
	EDHYcWzFFZFbHivK/O1CqqINzx55xnkoGXC4+/F/03UjZ07fLHN9xaXaOdmeQMZUNLXm7qG0bhJ
	kCT92+gmNMA+GHoTO3IO4eh+IAOV7h4h8rb0hSM/QfeJDBfhBILQkxylwaoOS2jpsalhWiGNf9L
	nj1PYH1jzgDVIWja4y6ltlHX4wWvtSZV1D9HBMaiFNXDigQDldHx6blPY5pbW0jssnr8+kuSWlb
	QwqFEy85nag6UE+YJgvNJZgfNn0S+mqbkCfN6xN45mv3ch
X-Received: by 2002:a05:600c:4b1e:b0:490:4973:91a0 with SMTP id 5b1f17b1804b1-4909c082d1cmr18777105e9.10.1780041622797;
        Fri, 29 May 2026 01:00:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3563cb9sm1728778f8f.29.2026.05.29.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:00:22 -0700 (PDT)
Date: Fri, 29 May 2026 11:00:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:b4/hsr_ptp 3/9] net/hsr/hsr_forward.c:381
 hsr_create_tagged_frame() error: use kfree_skb() here instead of kfree(skb)
Message-ID: <202605291505.4v18xVW0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260529080019.6F3YdemfEGUNFwKYd312E_sSny_c09wbUZB5djVazQA@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git b4/hsr_ptp
head:   faf1318dad835e0286f66a9a91a329ccb8f7c001
commit: 0acc81038697434eef72adb295def2c53faff66b [3/9] hsr: Use skb_clone() while adding the HSR header
config: x86_64-randconfig-161-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291505.4v18xVW0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605291505.4v18xVW0-lkp@intel.com/

smatch warnings:
net/hsr/hsr_forward.c:381 hsr_create_tagged_frame() error: use kfree_skb() here instead of kfree(skb)

vim +381 net/hsr/hsr_forward.c

451d8123f89791 Murali Karicheri          2020-07-22  331  struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
f266a683a4804d Arvid Brodin              2014-07-04  332  					struct hsr_port *port)
f266a683a4804d Arvid Brodin              2014-07-04  333  {
f266a683a4804d Arvid Brodin              2014-07-04  334  	unsigned char *dst, *src;
f266a683a4804d Arvid Brodin              2014-07-04  335  	struct sk_buff *skb;
451d8123f89791 Murali Karicheri          2020-07-22  336  	int movelen;
451d8123f89791 Murali Karicheri          2020-07-22  337  
451d8123f89791 Murali Karicheri          2020-07-22  338  	if (frame->skb_hsr) {
451d8123f89791 Murali Karicheri          2020-07-22  339  		struct hsr_ethhdr *hsr_ethhdr =
451d8123f89791 Murali Karicheri          2020-07-22  340  			(struct hsr_ethhdr *)skb_mac_header(frame->skb_hsr);
451d8123f89791 Murali Karicheri          2020-07-22  341  
451d8123f89791 Murali Karicheri          2020-07-22  342  		/* set the lane id properly */
b2c26c82f7a94e Felix Maurer              2025-11-11  343  		hsr_set_path_id(frame, hsr_ethhdr, port);
451d8123f89791 Murali Karicheri          2020-07-22  344  		return skb_clone(frame->skb_hsr, GFP_ATOMIC);
451d8123f89791 Murali Karicheri          2020-07-22  345  	}
f266a683a4804d Arvid Brodin              2014-07-04  346  
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  347  	skb = skb_clone(frame->skb_std, GFP_ATOMIC);
05ca6e644dc9b7 Murali Karicheri          2019-04-05  348  	if (!skb)
f266a683a4804d Arvid Brodin              2014-07-04  349  		return NULL;
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  350  
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  351  	if (port->dev->features & NETIF_F_HW_HSR_TAG_INS)
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  352  		return skb;
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  353  
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  354  	/* Ensure the cloned skb has enough headroom to fit the HSR tag */
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  355  	if (skb_cow_head(skb, HSR_HLEN))
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  356  		goto err;
f266a683a4804d Arvid Brodin              2014-07-04  357  
f266a683a4804d Arvid Brodin              2014-07-04  358  	if (skb->ip_summed == CHECKSUM_PARTIAL)
f266a683a4804d Arvid Brodin              2014-07-04  359  		skb->csum_start += HSR_HLEN;
f266a683a4804d Arvid Brodin              2014-07-04  360  
f266a683a4804d Arvid Brodin              2014-07-04  361  	movelen = ETH_HLEN;
f266a683a4804d Arvid Brodin              2014-07-04  362  	if (frame->is_vlan)
f266a683a4804d Arvid Brodin              2014-07-04  363  		movelen += VLAN_HLEN;
f266a683a4804d Arvid Brodin              2014-07-04  364  
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  365  	/* The entire header area needs to be linear */
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  366  	if (!pskb_may_pull(skb, HSR_HLEN + movelen))
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  367  		goto err;
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  368  
f266a683a4804d Arvid Brodin              2014-07-04  369  	src = skb_mac_header(skb);
f266a683a4804d Arvid Brodin              2014-07-04  370  	dst = skb_push(skb, HSR_HLEN);
f266a683a4804d Arvid Brodin              2014-07-04  371  	memmove(dst, src, movelen);
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  372  	skb_set_network_header(skb, ETH_HLEN + HSR_HLEN);
f266a683a4804d Arvid Brodin              2014-07-04  373  	skb_reset_mac_header(skb);
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  374  	skb_reset_mac_len(skb);
f266a683a4804d Arvid Brodin              2014-07-04  375  
5d93518e06b210 Murali Karicheri          2020-07-20  376  	/* skb_put_padto free skb on error and hsr_fill_tag returns NULL in
5d93518e06b210 Murali Karicheri          2020-07-20  377  	 * that case
5d93518e06b210 Murali Karicheri          2020-07-20  378  	 */
5d93518e06b210 Murali Karicheri          2020-07-20  379  	return hsr_fill_tag(skb, frame, port, port->hsr->prot_version);
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  380  err:
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19 @381  	kfree(skb);

This should be kfree_skb()

0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  382  	return NULL;
f266a683a4804d Arvid Brodin              2014-07-04  383  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


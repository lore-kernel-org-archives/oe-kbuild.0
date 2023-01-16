Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4217C1C06
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 10:13:46 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id az20so47806185ejc.1
        for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 02:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Oy+gx4o16WqqwDqFRZ1XOqJI2ojaSbO4NuHKCxSkBZ0=;
        b=gj8dpUTwrCNnsB4dG2HSc8IH+mXSewxscAJGtBgLaElzCEft9fjWCqPojBvkKpnJ++
         rXqAmfSbBRRQmD/sc2yWUWvkc8j9K5ZYN2SyYp5CPb3ymm3FTmbFn92h36+LtUuSmYyW
         JIEtjRhX0Gm/QoU+z2H656r/2Sxzzc+C0nvyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oy+gx4o16WqqwDqFRZ1XOqJI2ojaSbO4NuHKCxSkBZ0=;
        b=ACJB9lWWz3//EJI1nQDnxQFlza4YWagRDnPrJSP+sdbAifK4/sboLzhkIUVLaZjudF
         NnzDwRQRlxOejnT4m5gSDBNnJSLDXR1v7wmndvX5De3vSiMp+qhcOmfl5R3jG/vmV/hg
         2kS3iFmvcf1BKq+NikYZ+VocZbRCXFKdeeX8FaPkG/0HPh7msEfNCLMWzuvrM3nBnDXl
         Zik+77qWE4fi6kC4LmJB4lOGpa1HJbOY303H8qPQBLJkMUBk6Unge/WLbTIKpNYtyfYX
         0n6TNNXVPzSj53tXiQjh0MSAapdsabTFaKQLgTu+RNLwWWlZ4bG9t0P0TF0WBapm2uFv
         +rvQ==
X-Gm-Message-State: AFqh2kpbCnT9Xr6cIuLgs4hk2blLkLzX1vadD2tz2aqtdHYMV/KSwBa8
	xAFmE8IKqmFCMnX96I6oI983Sg==
X-Google-Smtp-Source: AMrXdXsJI3OpwhbQqxhJCnW/9RCdaABAmebvyY6Tfte42X0AJF/lXJ/AKfg+Z8Gt7pb+4OK/QeS3EQ==
X-Received: by 2002:a17:907:1c07:b0:86f:2819:2760 with SMTP id nc7-20020a1709071c0700b0086f28192760mr6487743ejc.41.1673864024464;
        Mon, 16 Jan 2023 02:13:44 -0800 (PST)
Received: from cloudflare.com (79.184.151.107.ipv4.supernova.orange.pl. [79.184.151.107])
        by smtp.gmail.com with ESMTPSA id q1-20020a17090676c100b007c0d4d3a0c1sm11707096ejn.32.2023.01.16.02.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 02:13:43 -0800 (PST)
References: <20230113-sockmap-fix-v1-1-d3cad092ee10@cloudflare.com>
 <202301141018.w4fQc4gd-lkp@intel.com>
User-agent: mu4e 1.6.10; emacs 28.2
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, netdev@vger.kernel.org, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, kernel-team@cloudflare.com, John Fastabend
 <john.fastabend@gmail.com>, Eric Dumazet <edumazet@google.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 syzbot+04c21ed96d861dccc5cd@syzkaller.appspotmail.com
Subject: Re: [PATCH bpf 1/3] bpf, sockmap: Check for any of tcp_bpf_prots
 when cloning a listener
Date: Mon, 16 Jan 2023 11:09:02 +0100
In-reply-to: <202301141018.w4fQc4gd-lkp@intel.com>
Message-ID: <87sfgayeg9.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Dan,

On Sat, Jan 14, 2023 at 11:04 AM +03, Dan Carpenter wrote:
> Hi Jakub,
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Sitnicki/bpf-sockmap-Check-for-any-of-tcp_bpf_prots-when-cloning-a-listener/20230113-230728
> base:   e7895f017b79410bf4591396a733b876dc1e0e9d
> patch link:    https://lore.kernel.org/r/20230113-sockmap-fix-v1-1-d3cad092ee10%40cloudflare.com
> patch subject: [PATCH bpf 1/3] bpf, sockmap: Check for any of tcp_bpf_prots when cloning a listener
> config: i386-randconfig-m021
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
>
> smatch warnings:
> net/ipv4/tcp_bpf.c:644 tcp_bpf_clone() error: buffer overflow 'tcp_bpf_prots' 2 <= 2
>
> vim +/tcp_bpf_prots +644 net/ipv4/tcp_bpf.c
>
> 604326b41a6fb9 Daniel Borkmann 2018-10-13  634  
> e80251555f0bef Jakub Sitnicki  2020-02-18  635  /* If a child got cloned from a listening socket that had tcp_bpf
> e80251555f0bef Jakub Sitnicki  2020-02-18  636   * protocol callbacks installed, we need to restore the callbacks to
> e80251555f0bef Jakub Sitnicki  2020-02-18  637   * the default ones because the child does not inherit the psock state
> e80251555f0bef Jakub Sitnicki  2020-02-18  638   * that tcp_bpf callbacks expect.
> e80251555f0bef Jakub Sitnicki  2020-02-18  639   */
> e80251555f0bef Jakub Sitnicki  2020-02-18  640  void tcp_bpf_clone(const struct sock *sk, struct sock *newsk)
> e80251555f0bef Jakub Sitnicki  2020-02-18  641  {
> e80251555f0bef Jakub Sitnicki  2020-02-18  642  	struct proto *prot = newsk->sk_prot;
> e80251555f0bef Jakub Sitnicki  2020-02-18  643  
> c2e74657613125 Jakub Sitnicki  2023-01-13 @644  	if (tcp_bpf_prots[0] <= prot && prot < tcp_bpf_prots[ARRAY_SIZE(tcp_bpf_prots)])
>                                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> What?  Also I suspect this might cause a compile error for Clang builds.

Can't say I see a problem B-)

tcp_bpf_prots is a 2D array:

static struct proto tcp_bpf_prots[TCP_BPF_NUM_PROTS][TCP_BPF_NUM_CFGS];

... so tcp_bpf_prots[0] is the base address of the first array, while
tcp_bpf_prots[ARRAY_SIZE(tcp_bpf_prots)] is the base address of the
array one past the last one.

Smatch doesn't seem to graps the 2D array concept here. We can make it
happy by being explicit but harder on the eyes:

	if (&tcp_bpf_prots[0][0] <= prot && prot < &tcp_bpf_prots[ARRAY_SIZE(tcp_bpf_prots)][0])
		newsk->sk_prot = sk->sk_prot_creator;

Clang can do pointer arithmetic on 2D arrays just fine :-)

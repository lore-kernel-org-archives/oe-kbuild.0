Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094E7C;
	Sat, 14 Jan 2023 08:04:39 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t5so18550244wrq.1;
        Sat, 14 Jan 2023 00:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lHZQ2hGE5tQqLLlrk57f+PWvOdohWM9w0ISXr/YQTJc=;
        b=Rp96LEhjTK+z5jwJsA+7KkIDJBpo7Do/IKJP03oTAFtrtY8xnGKoGXUuBe0LYIfzx6
         uaDMoKOdIXsYYDAjBP07hdcKUHig+9kHCRG5+LIs+cEHppviJlc0jcvyRvvx2MMBDjzb
         DAdX9y8dlIBiHijmmjM0n0NzeqSMbsSzln1MvRROg/eevrM1wfa61BXEiCoBizEDU9tX
         T14deYfFEDgaLzZMnZxtZVt78Lxz/Ii4+ww6HAFIr0FUbj/U1oAHNNAFvcz/uGf/X9YJ
         r8FqL0sMeF9asXJo19GjPmARdoX3JKgAUhxYpdV9qKEO2Ax60QP6Dwq31GkmIwiuaVGI
         +EPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHZQ2hGE5tQqLLlrk57f+PWvOdohWM9w0ISXr/YQTJc=;
        b=gSeWY8siI4zz6peSNDkIFjwiiojZVBtefErY73sqQPxRJ7vdrwsQGlUXH7YOfbxDI8
         ZNJoFZzhB/F+zcCazid9eJ2dKkNtbgVThIgciF/pe5erJdSlCRGvaaA8N5NIaDkFEIxa
         yepc5mBME7rTL1/RsqEGDAQpt2QhGSj6pwTTGoGHYwS+JSGNykTf14M96IMFbklFvJ+Z
         1H9n0e7Scor7pcI4xu4UWXSbcQcXBJqMxk1ZEkuYO9WZqNT6BlH9vMJJz6d+oL9WYopv
         pWp8TxA/1pomAlBYLHY8M/sqiGDtFlbm3z5X2G7jUBc3wfcMOWBEFFs7EmfvU1LQPmEZ
         TjTQ==
X-Gm-Message-State: AFqh2koqGp+qzPj6CrT7G2vAviQpXGzoLi36mB8mZgzb6XM9kFM9tTwo
	5vZkgn4cT6haNDiS7cb3GHhh2OiE900Pnw==
X-Google-Smtp-Source: AMrXdXt0naN/ojcZur1ITIamzJ2KdLIy1fmO7i0+dcJvZ+yKx9Bw0fAVWBylcu5iiuv5oMLQvZsKGg==
X-Received: by 2002:a5d:488b:0:b0:242:5563:c3b with SMTP id g11-20020a5d488b000000b0024255630c3bmr51055844wrq.59.1673683477382;
        Sat, 14 Jan 2023 00:04:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w4-20020a5d4b44000000b002366dd0e030sm20571606wrs.68.2023.01.14.00.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 00:04:36 -0800 (PST)
Date: Sat, 14 Jan 2023 11:04:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jakub Sitnicki <jakub@cloudflare.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	kernel-team@cloudflare.com,
	John Fastabend <john.fastabend@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	syzbot+04c21ed96d861dccc5cd@syzkaller.appspotmail.com
Subject: Re: [PATCH bpf 1/3] bpf, sockmap: Check for any of tcp_bpf_prots
 when cloning a listener
Message-ID: <202301141018.w4fQc4gd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113-sockmap-fix-v1-1-d3cad092ee10@cloudflare.com>
Message-ID: <20230114080430.IM9irflYyqWMMgWZ7uypkD_-0v9dP26iQUhtD7qGT08@z>

Hi Jakub,

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Sitnicki/bpf-sockmap-Check-for-any-of-tcp_bpf_prots-when-cloning-a-listener/20230113-230728
base:   e7895f017b79410bf4591396a733b876dc1e0e9d
patch link:    https://lore.kernel.org/r/20230113-sockmap-fix-v1-1-d3cad092ee10%40cloudflare.com
patch subject: [PATCH bpf 1/3] bpf, sockmap: Check for any of tcp_bpf_prots when cloning a listener
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
net/ipv4/tcp_bpf.c:644 tcp_bpf_clone() error: buffer overflow 'tcp_bpf_prots' 2 <= 2

vim +/tcp_bpf_prots +644 net/ipv4/tcp_bpf.c

604326b41a6fb9 Daniel Borkmann 2018-10-13  634  
e80251555f0bef Jakub Sitnicki  2020-02-18  635  /* If a child got cloned from a listening socket that had tcp_bpf
e80251555f0bef Jakub Sitnicki  2020-02-18  636   * protocol callbacks installed, we need to restore the callbacks to
e80251555f0bef Jakub Sitnicki  2020-02-18  637   * the default ones because the child does not inherit the psock state
e80251555f0bef Jakub Sitnicki  2020-02-18  638   * that tcp_bpf callbacks expect.
e80251555f0bef Jakub Sitnicki  2020-02-18  639   */
e80251555f0bef Jakub Sitnicki  2020-02-18  640  void tcp_bpf_clone(const struct sock *sk, struct sock *newsk)
e80251555f0bef Jakub Sitnicki  2020-02-18  641  {
e80251555f0bef Jakub Sitnicki  2020-02-18  642  	struct proto *prot = newsk->sk_prot;
e80251555f0bef Jakub Sitnicki  2020-02-18  643  
c2e74657613125 Jakub Sitnicki  2023-01-13 @644  	if (tcp_bpf_prots[0] <= prot && prot < tcp_bpf_prots[ARRAY_SIZE(tcp_bpf_prots)])
                                                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
What?  Also I suspect this might cause a compile error for Clang builds.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


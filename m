Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574971C07;
	Mon, 16 Jan 2023 11:53:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id l8so2675062wms.3;
        Mon, 16 Jan 2023 03:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDrC1xEu4/QiEti9zG/HWQlO7iw2abAFiSH/grktSW0=;
        b=ZaHiLfnBwTqxUG3c7wxl3yfHeSJobGv6sY/9cNKNLyLn9A2SM8gYFsKZSLfmED0VbY
         wMvn7I9Y9Cp39XRfO3FbMQ8XF2gCQMJHIHtgHROlqJvx/OxwYQOc2dYZ6mjQH6Qtdj9K
         denLgs1vpUoGLWgMwDWVNxIUo+/pnpKZP1bWtW9ndbLPKeyf4bgc/+bgqPkK2kLhcFBD
         E5+gAEK23GIWEINEOIi4TYf8YW+7LYFcJcQ3KlqK9yTKs3Ra5ExRzYTqokWt/WScBJMc
         ZJRmg3sE7XqsN2yswkznvBTqRJydCkaFsLk1ac+wkPcak76w0pq+KaXBKfHiu8TObvkk
         VkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDrC1xEu4/QiEti9zG/HWQlO7iw2abAFiSH/grktSW0=;
        b=E3S3Muu7sPXkHlgPu/W82+WXMkTVZjh/GUKqIbtyC2Ryak1xYhPmCZxdlaUz23y/VB
         z0ES8b2v6dtu0ys2cTuaaKBU64TcwfSau7KqnqpAMsuQarmWHGkKQVZ9GcWG8UfM/nG5
         aCgURxssq1JUHsMmQQyc1CRaKg/U6poX9u0CEtOXW6kj7YyRA7ylvCj13BKAUb6C2j1o
         NUkwetohJNbiM+FBGTj5/ISO0urozqcQYlXNs4hPfnB8H8Xv4IvL7zTRIVT4K/btrdCT
         ZhzNx8ONGrpTg/cHaERWoOA4g3EIA8rCXoGE78/t4otmOY4SaouUPaINXBgQzBIE5z0E
         Of/A==
X-Gm-Message-State: AFqh2krwmyixf1Ym2ED/HmPUx/gRC6hT/LSZ4Pqk2nMjiGMPu+eyq2wO
	dMTXQmVZu4g2XSIykryLoe4=
X-Google-Smtp-Source: AMrXdXvN3+98vLOKHjimne/NAZlOHql3hg8wVhFkDE7T30nmT6wEMMveM8+6vpcjPn/H3V+G3JJEWg==
X-Received: by 2002:a05:600c:35c7:b0:3d3:5d0f:6dfc with SMTP id r7-20020a05600c35c700b003d35d0f6dfcmr66930655wmq.30.1673869992531;
        Mon, 16 Jan 2023 03:53:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k30-20020a05600c1c9e00b003d9b89a39b2sm37355701wms.10.2023.01.16.03.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:53:12 -0800 (PST)
Date: Mon, 16 Jan 2023 14:53:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: oe-kbuild@lists.linux.dev, netdev@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, kernel-team@cloudflare.com,
	John Fastabend <john.fastabend@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	syzbot+04c21ed96d861dccc5cd@syzkaller.appspotmail.com
Subject: Re: [PATCH bpf 1/3] bpf, sockmap: Check for any of tcp_bpf_prots
 when cloning a listener
Message-ID: <Y8U6pd6Ox8fDXZc0@kadam>
References: <20230113-sockmap-fix-v1-1-d3cad092ee10@cloudflare.com>
 <202301141018.w4fQc4gd-lkp@intel.com>
 <87sfgayeg9.fsf@cloudflare.com>
 <Y8UxRmxdqGv92Szw@kadam>
 <87h6wqyaq6.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6wqyaq6.fsf@cloudflare.com>

On Mon, Jan 16, 2023 at 12:31:11PM +0100, Jakub Sitnicki wrote:
> >> Clang can do pointer arithmetic on 2D arrays just fine :-)
> >
> > Heh.  I must have an older version of Clang.
> >
> >   CC      net/ipv4/tcp_bpf.o
> > net/ipv4/tcp_bpf.c:644:41: warning: array index 2 is past the end of the array (that has type 'struct proto[2][4]') [-Warray-bounds]
> >         if (tcp_bpf_prots[0] <= prot && prot < tcp_bpf_prots[ARRAY_SIZE(tcp_bpf_prots)])
> >                                                ^             ~~~~~~~~~~~~~~~~~~~~~~~~~
> > net/ipv4/tcp_bpf.c:544:1: note: array 'tcp_bpf_prots' declared here
> > static struct proto tcp_bpf_prots[TCP_BPF_NUM_PROTS][TCP_BPF_NUM_CFGS];
> > ^
> > 1 warning generated.
> 
> FWIW, I've checked against:
> 
> $ clang --version
> clang version 15.0.6 (Fedora 15.0.6-2.fc37)
> 
> Gotta keep it fresh to be able to build bpf selftests ;-)
> But I sure don't want to break builds with older Clangs.

I'm actually on a newer 16.x something version from git.

Btw, it made me outrageously happy that Clang was one for one bug
compatible with Smatch on this.

With this kind of warning you could either print a warning when there is
a read but that's not what either Smatch or Clang do.  Smatch looks at
the offset and then checks to see if the code is just doing pointer
math to find the &(array + 1) address.

So Smatch checks is the offset known to be exactly ARRAY_SIZE() and are
we taking the address of that.  I have updated that check.

regards,
dan carpenter

Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B87A1C33
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 11:31:08 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id qx13so8995147ejb.13
        for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 03:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=SAOnHwXPVdXtwryZfI27E5TBP69wt16pOek6ktQQ6k4=;
        b=YPSxKdyv0vemU3n3JeBYbWHou1RxJV+ZCMpOJ7hPMdx5tZtYicYHOui+jxhh+tyP2u
         rKfjR+NYG6nJKaWYJ2nHV9ka5Ocuuq9vHvAX7MnwHVc5t73GJ500oA4u6OhnUmaIGxxy
         h2uVA7B5bKCEz67iqSKGh23bdiu5Ty3Cu0VrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAOnHwXPVdXtwryZfI27E5TBP69wt16pOek6ktQQ6k4=;
        b=LJOQzEbcwN/xue8j7mNyQvsbDanTeoOfyzkiy79kZ+uGGMRzUdjgbBEzuzKWlIO9Jy
         LI3wWxKgxsva8vOW0WdWsmdiCJm/jJ4TRYK040DyA6zJUwg4TDYeyM5j1s6pcGtKXaWX
         POJ2Imdfn2O6avmMeD+NFB+84S/DgbpSzEOPa1IOM6mOfBetRnDGsPRf/bvv3l1PqC5C
         IufywqUdA/yrtwK4uOK0W+hV+ZhN8XLYoFjPcwcABGr98Xn8bETTKmxIzuzlm/YrVV+o
         Ji6mWoU+FQcNYywVqBtFQ/Wn8cihNpkIKIwsPkD7j8YdtJg6s8o0iYT6WPeZNAxFU1T1
         ZT8w==
X-Gm-Message-State: AFqh2kpnPPkh94kjFgjCsf18WWqA+TbAUCppqOJmOJa3KKm/KINwPpNa
	4mbTREM7IU/2UVkIbOZtAnanhg==
X-Google-Smtp-Source: AMrXdXszUtRHn1sJvd2uIBJcBgsvnMr1m2Iqr0V4lqgHz6GwPtmxkNqKtoaZku1DmjVLfTfNQEOeGg==
X-Received: by 2002:a17:906:3687:b0:86b:914a:571 with SMTP id a7-20020a170906368700b0086b914a0571mr10054431ejc.5.1673868666301;
        Mon, 16 Jan 2023 03:31:06 -0800 (PST)
Received: from cloudflare.com (79.184.151.107.ipv4.supernova.orange.pl. [79.184.151.107])
        by smtp.gmail.com with ESMTPSA id p21-20020a056402045500b0048aff8b5b70sm11257374edw.67.2023.01.16.03.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:31:05 -0800 (PST)
References: <20230113-sockmap-fix-v1-1-d3cad092ee10@cloudflare.com>
 <202301141018.w4fQc4gd-lkp@intel.com> <87sfgayeg9.fsf@cloudflare.com>
 <CANn89iLanM-OJu8hThK__G_gQj0z39Rnj-5Fk=kQEmbhs2OPfA@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 28.2
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
 netdev@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 kernel-team@cloudflare.com, John Fastabend <john.fastabend@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov
 <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 syzbot+04c21ed96d861dccc5cd@syzkaller.appspotmail.com
Subject: Re: [PATCH bpf 1/3] bpf, sockmap: Check for any of tcp_bpf_prots
 when cloning a listener
Date: Mon, 16 Jan 2023 12:27:10 +0100
In-reply-to: <CANn89iLanM-OJu8hThK__G_gQj0z39Rnj-5Fk=kQEmbhs2OPfA@mail.gmail.com>
Message-ID: <87lem2yavb.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 16, 2023 at 11:39 AM +01, Eric Dumazet wrote:
> We might add a generic helper to make all this a bit more clear ?
>
> +#define is_insidevar(PTR, VAR) (                       \
> +       ((void *)(PTR) <= (void *)(VAR)) &&             \
> +       ((void *)(PTR) <= (void *)(VAR) + sizeof(VAR)))
> +
>
>
> ...
>
> if (is_insidevar(prot, tcp_bpf_prots))
>      newsk->sk_prot = sk->sk_prot_creator;

Sure can do. Thanks for the suggestion. I adjusted it a bit:
 - added cast to char * so we don't offend -Wpointer-arith,
 - fixed the lower and upper bound check.

Final form would look like:

#define is_insidevar(ptr, var)						\
	((void *)(ptr) >= (void *)(var)) &&				\
	((void *)(ptr) <  (void *)((char *)(var) + sizeof(var)))

Not sure where to stuff it. I propose include/linux/util_macros.h.

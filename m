Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13031C07
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 11:34:12 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id v13so6199821eda.11
        for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 03:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=musiU/xa+beV5wDQ+48J+naON4JvwF6zzi8se9Hs4H8=;
        b=GDWE2ZkJ1iQzUoNKqyzh3ULBoNfQV2zOsFJTiUgf7xglDzXrJPons73dgXabJICmRR
         Qiiw05I6DwZoglyT8q8Mgy0c4jXXQUrTV5vxrUL1CFpBNCSR96ZsykrAyRN338svAsTn
         01/h+Exdhl1hGM3yHasawzVPtKmoVArpB1iI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=musiU/xa+beV5wDQ+48J+naON4JvwF6zzi8se9Hs4H8=;
        b=IkaXHmksv5nyqOGrh/g/W1/8mmGQys4hvBNJlvZANzpfpEhtl359JXdW2WdSSrrQdo
         dznTOdoEW3fCjGwXUWZVqsivPKfCs8s4qma/kcnV7AyCUz5u6Yox3QvWbnWoXNLvnlDT
         fIVXwOkbzo3k5B/RHQHV9sHDCZvp/ALJzLHNUQVRF7PW82j93IEb1t/at0rvCtAwolR2
         +jEqwb8TcoWXUbISI/rHF6nAxF4rIGhZKQYrglOurArt3vxzOGfUiMaGEyzF2pHHeKNX
         mg5MvhRKj7Jv6z5KPgOfhUFkT2D5v69jicALZv0icEsuYq4ENFw69DnjCpBJXMlnz3VS
         Geeg==
X-Gm-Message-State: AFqh2kqY2vzpgIvJER8NadDsBUGCdzq7cm9d8vPns0HvaOPdlSE29tLO
	T0ACmqWHYnMSFoSYefJCySgYRQ==
X-Google-Smtp-Source: AMrXdXsq9l0PKkMRmShnI9epkwxkBKszmh/AV9Wan3qmM5TCqZMCQeMSkTSAUPyWaAekGUl6xN0Bgg==
X-Received: by 2002:aa7:c716:0:b0:479:8313:3008 with SMTP id i22-20020aa7c716000000b0047983133008mr9172281edq.0.1673868850923;
        Mon, 16 Jan 2023 03:34:10 -0800 (PST)
Received: from cloudflare.com (79.184.151.107.ipv4.supernova.orange.pl. [79.184.151.107])
        by smtp.gmail.com with ESMTPSA id da11-20020a056402176b00b0049b5c746df7sm4838006edb.0.2023.01.16.03.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:34:10 -0800 (PST)
References: <20230113-sockmap-fix-v1-1-d3cad092ee10@cloudflare.com>
 <202301141018.w4fQc4gd-lkp@intel.com> <87sfgayeg9.fsf@cloudflare.com>
 <Y8UxRmxdqGv92Szw@kadam>
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
Date: Mon, 16 Jan 2023 12:31:11 +0100
In-reply-to: <Y8UxRmxdqGv92Szw@kadam>
Message-ID: <87h6wqyaq6.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 16, 2023 at 02:13 PM +03, Dan Carpenter wrote:
> On Mon, Jan 16, 2023 at 11:09:02AM +0100, Jakub Sitnicki wrote:

[...]

>> Smatch doesn't seem to graps the 2D array concept here. We can make it
>> happy by being explicit but harder on the eyes:
>> 
>> 	if (&tcp_bpf_prots[0][0] <= prot && prot < &tcp_bpf_prots[ARRAY_SIZE(tcp_bpf_prots)][0])
>> 		newsk->sk_prot = sk->sk_prot_creator;
>
> Huh.  I can silence this false positive in Smatch...  It never even
> occured to me that this was a two dimensional array (I only have the
> information in the email).
>

No need. Eric's macro helper makes Smatch happy. I'll use it in v2.

>> 
>> Clang can do pointer arithmetic on 2D arrays just fine :-)
>
> Heh.  I must have an older version of Clang.
>
>   CC      net/ipv4/tcp_bpf.o
> net/ipv4/tcp_bpf.c:644:41: warning: array index 2 is past the end of the array (that has type 'struct proto[2][4]') [-Warray-bounds]
>         if (tcp_bpf_prots[0] <= prot && prot < tcp_bpf_prots[ARRAY_SIZE(tcp_bpf_prots)])
>                                                ^             ~~~~~~~~~~~~~~~~~~~~~~~~~
> net/ipv4/tcp_bpf.c:544:1: note: array 'tcp_bpf_prots' declared here
> static struct proto tcp_bpf_prots[TCP_BPF_NUM_PROTS][TCP_BPF_NUM_CFGS];
> ^
> 1 warning generated.

FWIW, I've checked against:

$ clang --version
clang version 15.0.6 (Fedora 15.0.6-2.fc37)

Gotta keep it fresh to be able to build bpf selftests ;-)
But I sure don't want to break builds with older Clangs.

Thanks for pointing it out.

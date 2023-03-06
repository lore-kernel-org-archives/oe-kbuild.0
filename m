Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3BB320E;
	Mon,  6 Mar 2023 15:20:35 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id ec29so9239525edb.6;
        Mon, 06 Mar 2023 07:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678116034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8VgPmc8W3tK/lgmMLfngjFrRCF3KcOXcMcMxTBLd0Hg=;
        b=Jmags/GMYu0MvYM1crEa41W+kqwASLRBXKVdGf0PB6vQyYzWUx2ohwybiTeHtGwCMe
         RVbtbeHrWQEaQKbpUCpRsNswmy/6TZsO6bQM+LgOPe6ncn/LXxKDgQSZBZ1uupWeHWBA
         iKRjsAWUy8F4LLOtdg5KOWUV+Tg1djNYmC+74tzKApfRMe5bF1mrjkp4TGgirBel/bVd
         q0D1dSy4pshjfiWJnFXqlUtp2KC+slAbV85WQu4yZQq9mT97bAwZjK/BX9qOiV697dU2
         VwJoOHA01OWCkaWgVHpJQAMSurB82K72hw2qknCCF6i4mI6JJERvLkjn9SHSMGvDlEBp
         n4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678116034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VgPmc8W3tK/lgmMLfngjFrRCF3KcOXcMcMxTBLd0Hg=;
        b=vPSwaqzUSW5k9huMIn6A+y3+2XbWo0xD/OfAvylofHIwcKleACLN+jBwqoyD2mv6Sx
         +TtKlo5ga3guRyWhW49OXgB2GaSA0xKorYcXuFiBwi4Xv5tHq6u04bmKzHPH8QnmTZwj
         wAFRTV4eDO+juHK/RUvyRbNsir3zXDcmOUecBPNUKe36gYTYfE2GbNpVtsuWJawz0OsJ
         SEWpFQBetUOD9+fCvCC5MwtaZM4Q4irUa1Snimlx6tYW8Oex4WjGHKH0jJHgO6zz4qXu
         Zwd0TG39VJYCXa8z6aqgc1Z8VCR2R9hL0ZGbK95sBORFFKegZpJHnUuNJdB4N8H/dtu3
         csng==
X-Gm-Message-State: AO0yUKUkQ/NVPHEFqc9kPe/RfYpbKf8CBcMJcccEM7ESfVMHNdWQVZED
	u/4IwRWPYQZB1d8iU6I/bkH8woR7heU=
X-Google-Smtp-Source: AK7set+T4TaUuHsLu+EDYDkCOAWdbnAwJuxXIEvl9Uv5Atb0+fqayCMKft7QlvlWF4Y9wuTKkurSHQ==
X-Received: by 2002:a17:906:af62:b0:8d9:383a:be39 with SMTP id os2-20020a170906af6200b008d9383abe39mr13056594ejb.41.1678116033817;
        Mon, 06 Mar 2023 07:20:33 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 24-20020a170906301800b008f883765c9asm4687624ejz.136.2023.03.06.07.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 07:20:33 -0800 (PST)
Date: Mon, 6 Mar 2023 18:20:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [cel:topic-rpc-with-tls-upcall 1/18] net/handshake/netlink.c:187
 handshake_nl_accept_doit() error: uninitialized symbol 'req'.
Message-ID: <ac949db1-92ce-43c9-b03e-718685709e3c@kili.mountain>
References: <85ee6966-32b0-4ff2-8af0-2678ecf77609@kili.mountain>
 <55614170-7D09-4865-9EA8-E9532D3E3F73@oracle.com>
 <9cbf9852-e58d-451d-9911-484112a92d6c@kili.mountain>
 <C2F28F13-B7A5-4F5A-8109-0E7B1C510697@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C2F28F13-B7A5-4F5A-8109-0E7B1C510697@oracle.com>

On Mon, Mar 06, 2023 at 03:19:38PM +0000, Chuck Lever III wrote:
> 
> 
> > On Mar 6, 2023, at 10:17 AM, Dan Carpenter <error27@gmail.com> wrote:
> > 
> > On Mon, Mar 06, 2023 at 03:11:23PM +0000, Chuck Lever III wrote:
> >> 
> >> 
> >>> On Mar 6, 2023, at 5:01 AM, Dan Carpenter <error27@gmail.com> wrote:
> >>> 
> >>> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
> >>> head:   88897fb973ffb2448e3452ca4e9283908bd257f6
> >>> commit: d166e9ec5e3800de085444eca5883ce1738f6cb3 [1/18] net/handshake: Create a NETLINK service for handling handshake requests
> >>> config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230306/202303061707.ICwrtQsr-lkp@intel.com/config)
> >>> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> >>> 
> >>> If you fix the issue, kindly add following tag where applicable
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Reported-by: Dan Carpenter <error27@gmail.com>
> >>> | Link: https://lore.kernel.org/r/202303061707.ICwrtQsr-lkp@intel.com/
> >>> 
> >>> smatch warnings:
> >>> net/handshake/netlink.c:187 handshake_nl_accept_doit() error: uninitialized symbol 'req'.
> >>> net/handshake/netlink.c:240 handshake_nl_done_doit() error: uninitialized symbol 'req'.
> >>> net/handshake/request.c:193 handshake_complete() warn: test_and_set_bit() takes a bit number
> >>> net/handshake/request.c:236 handshake_req_cancel() warn: test_and_set_bit() takes a bit number
> > 
> > Thanks Chuck, but don't forget about these as well.  I haven't looked
> > at the code but I suspect that it's passing BIT(x) to test_bit() instead
> > of just passing x.
> 
> Yep, fixed those up too.

Awesome.

regards,
dan carpenter


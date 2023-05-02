Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01AE259D
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 13:02:33 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3062c1e7df8so1621340f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 02 May 2023 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683032552; x=1685624552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yI7es7d2+0DIqALlHq+/W7rD8zTxU/feFIO70XrkNew=;
        b=WQL0w2zNAPoWWf1Ytr5s/LPoPDCGZRh1yXeq9jgG5ixrkDjypRR0XEgQd5p1tu6QRc
         ts34Q+Vs+g0dOesHjXjf5zSJ2gyPZu88qGFHaiDdq0dybcZO6jXeugQ+jeXpw7XHmb2K
         FsNyomyMfnY0q4qQwZq3SKxGU05wFEUaqdI9+vb09QGo49x/65sacDTVKdWgpv4yBxwX
         M6Dvk2fIkeXYoi7jwPVHCJ+VvJXZSyhhxueenxJCIcgUIL7QmRWQV96ASU7lzDEqkTA1
         K9EtrJD8eAmhtE9K91JqYHBkOhnkPasveZNjz2OYa2GZ8i92tuIeaCKvF5YFlqwlBdyC
         dP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683032552; x=1685624552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yI7es7d2+0DIqALlHq+/W7rD8zTxU/feFIO70XrkNew=;
        b=YoXv1mqoswvpzGa23onSgyonjWnb+H6QkwnHWZlyixICWzNEYnQ84+BZxMLlYtkqKX
         omwIpDQAWy9TIiBt8l8N4B4NKfEQ0N6QEmc9RdsWDbLEUqDKr9nzph4JOlgjDsCiK6v/
         klFX5PNKWUHYSCWWwW6HHUtG4twLf8bybE2L715lRJz3e5JwEl0TsVKCWrb32wu/jSI+
         zgHCihten6sWA8BTj/02lxniojOu6mUUb1am6i69aF+wj8al3CBmMVnlidkqxmSuBTOr
         QdGT8Zfiet6TtXTcsvwkGumSCIq71/WCNo3QJy9lZtsDvf0iZh4tLHEtEogiXQ8Y6Vjc
         a1iQ==
X-Gm-Message-State: AC+VfDzk97vK2TGHQwuVq67Buc8ZKiUFXbyvfo4vBmohwA4OOIZPbDI6
	EunTB1/xWsh9qFK8Nwyvz6zTcQ==
X-Google-Smtp-Source: ACHHUZ4N347G7AswAWEOp4Mu/8D6KX6stNUpFZBYx1KITgol32+f2NcGbP3VUDX9zsLA3ut4wuV0lg==
X-Received: by 2002:a05:6000:1:b0:306:26d7:3805 with SMTP id h1-20020a056000000100b0030626d73805mr6604084wrx.63.1683032552086;
        Tue, 02 May 2023 06:02:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h3-20020a5d5043000000b002c70ce264bfsm30894846wrt.76.2023.05.02.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 06:02:30 -0700 (PDT)
Date: Tue, 2 May 2023 16:02:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild@lists.linux.dev, Takashi Iwai <tiwai@suse.de>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/gpu/drm/udl/udl_main.c:259 udl_get_urb_locked() warn:
 can 'unode' even be NULL?
Message-ID: <5ca02484-8a71-4b8c-b679-11ec11b7eef4@kili.mountain>
References: <e35cd818-d2f7-4d5e-abf8-b3448ca224aa@kili.mountain>
 <542af717-b889-3eea-a819-1d2a2cf4729d@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <542af717-b889-3eea-a819-1d2a2cf4729d@suse.de>

On Tue, May 02, 2023 at 01:38:11PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.05.23 um 13:19 schrieb Dan Carpenter:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2caeeb9d4a1bccd923b7918427f9e9ef7151ddd8
> > commit: c5c354a3a4728045e1342166394c615d75d45377 drm/udl: Fix inconsistent urbs.count value during udl_free_urb_list()
> > config: parisc-randconfig-m031-20230421 (https://download.01.org/0day-ci/archive/20230423/202304230801.ncoG1XDr-lkp@intel.com/config)
> > compiler: hppa-linux-gcc (GCC) 12.1.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Link: https://lore.kernel.org/r/202304230801.ncoG1XDr-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/gpu/drm/udl/udl_main.c:259 udl_get_urb_locked() warn: can 'unode' even be NULL?
> 
> It can't. Send a fix, if you like. OTOH it's not much of a problem either.
> 

Sure, I sent a patch.  This one is harmless, but we recently had a few
bugs that should have generated bogus NULL check warnings.

CVE-2023-1073: b12fece4c648 ("HID: check empty report_list in hid_validate_values()")
CVE-2023-1075: ffe2a2256244 ("net/tls: tls_is_tx_ready() checked list_entry")
CVE-2023-1077: 7c4a5b89a0b5 ("sched/rt: pick_next_rt_entity(): check list_entry")
CVE-2023-1078: f753a68980cf ("rds: rds_rm_zerocopy_callback() use list_first_entry()")

Although CVE-2023-1073 and CVE-2023-1077 are hard to warn about without
generating too many false positives.

regards,
dan carpenter


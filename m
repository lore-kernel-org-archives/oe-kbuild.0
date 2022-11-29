Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107A0639;
	Tue, 29 Nov 2022 05:20:01 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id fy37so31032893ejc.11;
        Mon, 28 Nov 2022 21:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXhLkvl9mT7mKRkV8vx3Vb7GaoPXJW8rE5+MuKgpncU=;
        b=YJZnT+Q+gtiHQLYcIQpWqwSr/afnkJANtHwNnyZcQ/1Qpq/enfTfr3GytaalM0Y14X
         K2aroP8fGEsp3MKZwRKRuMyh4Jn/wVhOzHvFGeRApxPrdi3ksSwRrkTW0BXbZCLddL/e
         96FpeTAuWEelRoMOlbSLUZPK9fcKaagn0AdMV6ErG/ywYGazN01dCktCWW60MvL2T7to
         j0OmXOfB8YZEPWfU7Nkj8w/WDZhqWhgEUtDN/IKhE36cRKyks20Ql5XxF+IzkEQi8apm
         DSi4ySmtX4zZ769b187LIeFvBiEBbCKRFXJlA5jAroII2zqFYGZaPMuk76XH14CgN3H1
         p/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXhLkvl9mT7mKRkV8vx3Vb7GaoPXJW8rE5+MuKgpncU=;
        b=pi8bC/vtHA4dRnKitOdippatewS9bMW2iwkNLLbCSihAmu1ljfoGw7kUbXFS+p54sA
         BbVlXJ8krF3grVOlnLWKnHzRiObxOJEl+YBk4Q/gXzXvsjce0bRUXljPbWcGe5za4WEw
         Z0MEk5j5WbETq19t6NZJtAVC9lhZl6zWCnhwsZtKBq5kOUV/T24slIKlCceWeQbgsFEX
         pnbdSSE+Y5rpGO5I/HRpyze6AEHk5NJIiOaa/vI/GIevty7SncopzwykXhLpu3TinBeo
         0IucWL4SReL+ikSyVAPPxrplBdFX4rpfr+YuvqUBEwCtdZyICK73QtCiD6wtocGjdN6e
         MrAA==
X-Gm-Message-State: ANoB5plWoT8rd8sO2cPKa9tL5fOm2KFqlj+1Q335mYObslST01CvglAI
	+M9GsNeCWHtjXot5qggWcAM=
X-Google-Smtp-Source: AA0mqf4UL9YksDFiGpmsDgyAZa1VFZDA6uKp8fDlbaTiUaCCnWL/QpbYzd2Wwxwc4B8VHea0UXjEOA==
X-Received: by 2002:a17:906:3784:b0:7aa:ffd0:b738 with SMTP id n4-20020a170906378400b007aaffd0b738mr47439914ejc.122.1669699200177;
        Mon, 28 Nov 2022 21:20:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f5-20020a056402150500b0045723aa48ccsm5783579edw.93.2022.11.28.21.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 21:19:59 -0800 (PST)
Date: Tue, 29 Nov 2022 08:19:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Anup Patel <anup@brainfault.org>, oe-kbuild@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: drivers/cpuidle/cpuidle-riscv-sbi.c:506 sbi_genpd_probe() warn:
 missing error code 'ret'
Message-ID: <Y4WWfMhC8Mba35+F@kadam>
References: <202211220541.Ck9NkitJ-lkp@intel.com>
 <CAAhSdy2A26U5gF_WSfzcdT7v-Fg9aaKXLyT4M=4ba_=WboupzA@mail.gmail.com>
 <Y39zJaTMWQk376zN@wendy>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y39zJaTMWQk376zN@wendy>

On Thu, Nov 24, 2022 at 01:35:33PM +0000, Conor Dooley wrote:
> Hey Anup,
> 
> On Tue, Nov 22, 2022 at 01:43:38PM +0530, Anup Patel wrote:
> > On Tue, Nov 22, 2022 at 12:41 PM Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
> > > commit: f81f7861ee2aaa6f652f18e8f622547bdd379724 cpuidle: riscv: support non-SMP config
> > > date:   7 months ago
> > > config: riscv-randconfig-m031-20221121
> > > compiler: riscv64-linux-gcc (GCC) 12.1.0
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > >
> > > smatch warnings:
> > > drivers/cpuidle/cpuidle-riscv-sbi.c:506 sbi_genpd_probe() warn: missing error code 'ret'
> > >
> > > vim +/ret +506 drivers/cpuidle/cpuidle-riscv-sbi.c
> > >
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  481  static int sbi_genpd_probe(struct device_node *np)
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  482  {
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  483       struct device_node *node;
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  484       int ret = 0, pd_count = 0;
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  485
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  486       if (!np)
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  487               return -ENODEV;
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  488
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  489       /*
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  490        * Parse child nodes for the "#power-domain-cells" property and
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  491        * initialize a genpd/genpd-of-provider pair when it's found.
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  492        */
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  493       for_each_child_of_node(np, node) {
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  494               if (!of_find_property(node, "#power-domain-cells", NULL))
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  495                       continue;
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  496
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  497               ret = sbi_pd_init(node);
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  498               if (ret)
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  499                       goto put_node;
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  500
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  501               pd_count++;
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  502       }
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  503
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  504       /* Bail out if not using the hierarchical CPU topology. */
> > > 6abf32f1d9c500 Anup Patel 2022-02-10  505       if (!pd_count)
> > > 6abf32f1d9c500 Anup Patel 2022-02-10 @506               goto no_pd;
> > >
> > > Error code?
> > 
> > Yes, we intentionally "return 0" when there are no
> > generic power-domains defined for the CPUs, the
> > sbi_cpuidle_probe() continue further and try traditional
> > DT cpuidle states.
> 
> Happened upon this when looking for our other cpuidle conversation on
> lore earlier, would it not make more sense from a readability PoV to
> just return zero here?

I am always in favor of direct returns over a do nothing return because
of the ambiguity about error codes.  Also I just published a new Smatch
check where "return ret;" and "return 0;" are equivalent.

	ret = frob();
	if (ret)
		return ret;

	if (something else)
		return ret;

I have a different unpublished check for:

	ret = frob();
	if (!ret)
		return ret;

The bug I'm looking for here is that once or twice a year the !
character is unintentional.

regards,
dan carpenter


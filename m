Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA682597;
	Thu, 24 Nov 2022 13:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669297031; x=1700833031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jQQPQduFTRGPE6LuYI/cCbmJH48WxAJL8qGvr7aICxI=;
  b=P5YsjxYElbV0M/pdpn+ktO3z5N6g9Nz0+A0HUSG8IjShN5oJ+s44QF0Q
   JR9e0LrfxaRfhk2BpRTXBbwQDv6IzLdnLV/osRbZ0lt95YYl1hfXhT0XO
   G2Znz5Sk0vGs2e6rwCVmkdO7B1aNQxMQAJ7nUJmX+QfYN/CYFfSHEF979
   hHqlWGVKAzhFaxLHEBwaXy7bvLrp2fT/ko0c0zOU5ch4LAEv2aTtLceUu
   aMhPXAfF4JJsWlTVU55ewgW0cqWZqrOJ1dHYOXtdIQ/x1zlj5FNEQFxui
   5ipGUNcwYkcME6ycOFaHzKyjHqeh2BE9AyF3zLJh4yn2C7sCk2fdiIYPm
   A==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="124960126"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2022 06:36:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 06:35:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 06:35:51 -0700
Date: Thu, 24 Nov 2022 13:35:33 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <anup@brainfault.org>
CC: Dan Carpenter <error27@gmail.com>, <oe-kbuild@lists.linux.dev>, Randy
 Dunlap <rdunlap@infradead.org>, <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@rivosinc.com>
Subject: Re: drivers/cpuidle/cpuidle-riscv-sbi.c:506 sbi_genpd_probe() warn:
 missing error code 'ret'
Message-ID: <Y39zJaTMWQk376zN@wendy>
References: <202211220541.Ck9NkitJ-lkp@intel.com>
 <CAAhSdy2A26U5gF_WSfzcdT7v-Fg9aaKXLyT4M=4ba_=WboupzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAAhSdy2A26U5gF_WSfzcdT7v-Fg9aaKXLyT4M=4ba_=WboupzA@mail.gmail.com>

Hey Anup,

On Tue, Nov 22, 2022 at 01:43:38PM +0530, Anup Patel wrote:
> On Tue, Nov 22, 2022 at 12:41 PM Dan Carpenter <error27@gmail.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
> > commit: f81f7861ee2aaa6f652f18e8f622547bdd379724 cpuidle: riscv: support non-SMP config
> > date:   7 months ago
> > config: riscv-randconfig-m031-20221121
> > compiler: riscv64-linux-gcc (GCC) 12.1.0
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> >
> > smatch warnings:
> > drivers/cpuidle/cpuidle-riscv-sbi.c:506 sbi_genpd_probe() warn: missing error code 'ret'
> >
> > vim +/ret +506 drivers/cpuidle/cpuidle-riscv-sbi.c
> >
> > 6abf32f1d9c500 Anup Patel 2022-02-10  481  static int sbi_genpd_probe(struct device_node *np)
> > 6abf32f1d9c500 Anup Patel 2022-02-10  482  {
> > 6abf32f1d9c500 Anup Patel 2022-02-10  483       struct device_node *node;
> > 6abf32f1d9c500 Anup Patel 2022-02-10  484       int ret = 0, pd_count = 0;
> > 6abf32f1d9c500 Anup Patel 2022-02-10  485
> > 6abf32f1d9c500 Anup Patel 2022-02-10  486       if (!np)
> > 6abf32f1d9c500 Anup Patel 2022-02-10  487               return -ENODEV;
> > 6abf32f1d9c500 Anup Patel 2022-02-10  488
> > 6abf32f1d9c500 Anup Patel 2022-02-10  489       /*
> > 6abf32f1d9c500 Anup Patel 2022-02-10  490        * Parse child nodes for the "#power-domain-cells" property and
> > 6abf32f1d9c500 Anup Patel 2022-02-10  491        * initialize a genpd/genpd-of-provider pair when it's found.
> > 6abf32f1d9c500 Anup Patel 2022-02-10  492        */
> > 6abf32f1d9c500 Anup Patel 2022-02-10  493       for_each_child_of_node(np, node) {
> > 6abf32f1d9c500 Anup Patel 2022-02-10  494               if (!of_find_property(node, "#power-domain-cells", NULL))
> > 6abf32f1d9c500 Anup Patel 2022-02-10  495                       continue;
> > 6abf32f1d9c500 Anup Patel 2022-02-10  496
> > 6abf32f1d9c500 Anup Patel 2022-02-10  497               ret = sbi_pd_init(node);
> > 6abf32f1d9c500 Anup Patel 2022-02-10  498               if (ret)
> > 6abf32f1d9c500 Anup Patel 2022-02-10  499                       goto put_node;
> > 6abf32f1d9c500 Anup Patel 2022-02-10  500
> > 6abf32f1d9c500 Anup Patel 2022-02-10  501               pd_count++;
> > 6abf32f1d9c500 Anup Patel 2022-02-10  502       }
> > 6abf32f1d9c500 Anup Patel 2022-02-10  503
> > 6abf32f1d9c500 Anup Patel 2022-02-10  504       /* Bail out if not using the hierarchical CPU topology. */
> > 6abf32f1d9c500 Anup Patel 2022-02-10  505       if (!pd_count)
> > 6abf32f1d9c500 Anup Patel 2022-02-10 @506               goto no_pd;
> >
> > Error code?
> 
> Yes, we intentionally "return 0" when there are no
> generic power-domains defined for the CPUs, the
> sbi_cpuidle_probe() continue further and try traditional
> DT cpuidle states.

Happened upon this when looking for our other cpuidle conversation on
lore earlier, would it not make more sense from a readability PoV to
just return zero here?

ret has to be zero at this point since:
	ret = sbi_pd_init(node);
	if (ret)
		goto put_node;
and the `goto no_pd` does not do any cleanup.

Certainly, it'd look more intentional that way, no?


> > 6abf32f1d9c500 Anup Patel 2022-02-10  507
> > 6abf32f1d9c500 Anup Patel 2022-02-10  508       /* Link genpd masters/subdomains to model the CPU topology. */
> > 6abf32f1d9c500 Anup Patel 2022-02-10  509       ret = dt_idle_pd_init_topology(np);
> > 6abf32f1d9c500 Anup Patel 2022-02-10  510       if (ret)
> > 6abf32f1d9c500 Anup Patel 2022-02-10  511               goto remove_pd;
> > 6abf32f1d9c500 Anup Patel 2022-02-10  512
> > 6abf32f1d9c500 Anup Patel 2022-02-10  513       return 0;
> > 6abf32f1d9c500 Anup Patel 2022-02-10  514
> > 6abf32f1d9c500 Anup Patel 2022-02-10  515  put_node:
> > 6abf32f1d9c500 Anup Patel 2022-02-10  516       of_node_put(node);
> > 6abf32f1d9c500 Anup Patel 2022-02-10  517  remove_pd:
> > 6abf32f1d9c500 Anup Patel 2022-02-10  518       sbi_pd_remove();
> > 6abf32f1d9c500 Anup Patel 2022-02-10  519       pr_err("failed to create CPU PM domains ret=%d\n", ret);

I do find this cleanup a bit confusing though.
It's probably just me not following, but I'd usually expect the teardown
to get more complicated the later you leave the function, not simpler.

How come, if sbi_od_init() fails, you need to call sbi_pd_remove()?
Does it not clean up after itself, or is calling sbi_pd_remove() always
a safe thing to do, even if, say, dt_idle_pd_alloc() failed?

Similarly, how come the of_node_put() in the later failure cases?
IIUC for_each_child_of_node() will leave us with a dangling of_node
reference except if sbi_pd_init() fails.

I'm probably missing something here, but it was at least non-obvious
from the code. If I have missing something, and I probably have, please
let me know what it is, I'd appreciate it!

Thanks,
Conor.

> > 6abf32f1d9c500 Anup Patel 2022-02-10  520  no_pd:
> > 6abf32f1d9c500 Anup Patel 2022-02-10  521       return ret;
> > 6abf32f1d9c500 Anup Patel 2022-02-10  522  }


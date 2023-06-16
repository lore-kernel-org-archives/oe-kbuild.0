Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E3163B4
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 07:10:54 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-666b20700deso407278b3a.1
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686899454; x=1689491454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=799naZKQ3HRrAvxy793FowyiPnNWWqQPTaWEuQ8SNj4=;
        b=frJkLom/h+1rdUdyDfac+fWDBvicYt7N1hwoHHSjy1OXQDJf7guLgVCmpcI9Lnu3QB
         RD6hOxlugNTjQljzpCFv1wz5J8y6d2E8h9q53B0yOEFdfcRPg4GZHMcGdIRZwRGq8xJ4
         NKDazwx2oNxnRHg0Mgk2Ya45GjRqyVUFpW6YXUeBXx6vGOAnf8aKYWsRm7uRCWdNwThM
         STpm+NZ1vLmEeTD6y+9PKmIU8TViLNKz1kERM/4hWzSoVLjA4g+eB1CyZZ7+kN1VLRWE
         CaSFFpkIdvNFAYNr7QJ1cmqT5PPt2VvwsYYmmZSUItBJwrsW+8+V1hssTbkEI9SGTxOj
         3NXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686899454; x=1689491454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=799naZKQ3HRrAvxy793FowyiPnNWWqQPTaWEuQ8SNj4=;
        b=KQFeOx+kuRVrh3kk2eAYV7hSEfTtpxeTPyswms8gbyy39R7FIczEpIfQWflnMDDguy
         jyMqvWh6eaKLzW3VykAdF5so6pX8gVRir6VCnSs5jT/060eP1YigwBoB6jqyde+f9bjk
         EApVcY6xmy7dPrRfZTl8w8jhDi9/84A+lChnYP9VjjFz0NGzViYf0R5I0uQKkbLGFfvM
         DiXkjUt/gMO9nthIlRzpnJJvR77XIYsNs8gxawv1pY2JmRzr26sujKoX6yQyL0hhFRlN
         CTkdT2cZ0g+K0oq1uUlmRfLSiozSeLeH269M+PZFPS35/LVkD49Sdnp3EF9erk5myv2R
         GeQg==
X-Gm-Message-State: AC+VfDx20FTUz0LaF6i1KqMYaEsQBZ4zbS4qSWjkNPt2H/glvdds/8Ga
	3QdCbpN2X/5YRGgpgYVPqnHQBA==
X-Google-Smtp-Source: ACHHUZ6EbyB+kZx1jqGRBo0dQDGCJO78RMXAmOHS4v5RLCPHc/GR8FZwMvI9Y7L4J48swzExTQy+3Q==
X-Received: by 2002:a05:6a21:118c:b0:119:5af7:7cd2 with SMTP id oj12-20020a056a21118c00b001195af77cd2mr1294070pzb.24.1686899454038;
        Fri, 16 Jun 2023 00:10:54 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902a3c900b001ae5d21f760sm6549044plb.146.2023.06.16.00.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 00:10:53 -0700 (PDT)
Date: Fri, 16 Jun 2023 12:40:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9802/10326] drivers/opp/core.c:2710
 dev_pm_opp_xlate_performance_state() warn: variable dereferenced before
 check 'src_table' (see line 2698)
Message-ID: <20230616071046.moywwqcnd7oyrdnb@vireshk-i7>
References: <50eb1321-f9ae-4f14-8586-9aa6dc61e6bd@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50eb1321-f9ae-4f14-8586-9aa6dc61e6bd@kadam.mountain>

On 16-06-23, 10:05, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
> commit: 5437756c65c79f9520886bc54321d39c022c8638 [9802/10326] OPP: pstate is only valid for genpd OPP tables
> config: i386-randconfig-m021-20230614 (https://download.01.org/0day-ci/archive/20230616/202306160347.AahnsjDj-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202306160347.AahnsjDj-lkp@intel.com/
> 
> smatch warnings:
> drivers/opp/core.c:2710 dev_pm_opp_xlate_performance_state() warn: variable dereferenced before check 'src_table' (see line 2698)

Already fixed in my branch this morning. Should show up soon in
linux-next. Thanks.

-- 
viresh

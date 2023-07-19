Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71F3156F0
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 15:24:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-316f589549cso4153286f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689780255; x=1690385055;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5GgaVhEQ9YvIKWzZ/TLpYM+aKxNg1984FV2335cjvQw=;
        b=bHk71LjOWdTQmFztley07YBOBCMf8Vpo8LWOUjIvoDaFwTocAm8wAKPDh/jP8kQp/b
         Ozprf7TSh0nCuLYFprxBqqf28y2CJC7XB5HSeZ8fPj34O9S0qxDlpVnEhF1d+HBPFshW
         rjEilf0gRX4rwEkB32Ay4pXW04tdAzfK3uHvIGOTc2wZWyn6oVvST4IHTNT8rU6vzMeG
         qODLpRWozPB751KHKznvJQ2yzSKq8QhYcVaLd+Gn/u6/uo2eVF7CBdR3t3VVbQnyJPoU
         Hn3WU9mGlHXHijVDOrhYzWw6wIAlogP2oNmE9V36CsHcjj1B8Um5WiEZAfEHNAayotii
         qh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689780255; x=1690385055;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5GgaVhEQ9YvIKWzZ/TLpYM+aKxNg1984FV2335cjvQw=;
        b=Xy/IemFjBHPUgULguuwEKtGYRoSFjbyfHDfOW58DF1PIX6aKO666sbxoCE0gU5ciku
         +Z3krUEya8/HSF+CTSu0hjItUFUtU+UpBFGyHyt2myJtraIbdxY4qVVwoPEMl9QRqy18
         GWjfHBt98dbTKRurtpucESeQmBquOAyhDyB0YcUiQ8oCb6Rd9KdsJCw+R0gx3xJ4NsTl
         5gK3+e385Ur2saVDRpleqzjCRcD740SsvoTIA6VSP0YOcY1D5bGgjROwXkx3gvMOFlnJ
         291zFv5RTE5QomNkU5H4bhewPeHzymOjcD7i+Ke0ulo3H90sAKteUPNrwS1urvDoXum1
         y+6w==
X-Gm-Message-State: ABy/qLbp2aebOfK2ifRFpnC5eQDTgZI2U7xPRIc25+rktJ8kZGyiFto3
	dYiRK6WrelEAg93tS7uRZE1t+wcFhnuCD0olBMQ=
X-Google-Smtp-Source: APBJJlEO4wkEMiX3mT+CatwZ2Ay1ZE70ISKdDxHAeGQ6yZG0M/D9fI2GVGWsXbg0Zoa9FIQ8fmYiZA==
X-Received: by 2002:adf:f38e:0:b0:313:e9dc:44d5 with SMTP id m14-20020adff38e000000b00313e9dc44d5mr135418wro.61.1689780255007;
        Wed, 19 Jul 2023 08:24:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a24-20020a05600c225800b003fbfa6066acsm1915112wmm.40.2023.07.19.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 08:24:13 -0700 (PDT)
Date: Wed, 19 Jul 2023 18:24:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [ardb:acomp-zswap-cleanup 4/21] net/xfrm/xfrm_ipcomp.c:258
 ipcomp_free_reqs() warn: iterator used outside loop: 'pos'
Message-ID: <075d634d-2cdd-46af-9692-eb45587f09ba@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git acomp-zswap-cleanup
head:   d0a9c8530b6b8659bc8b126638f5d2c907cfe5ee
commit: 0e06a41b2635783fddeff405a37a0d6e7a997815 [4/21] net: ipcomp: Migrate to acomp API from deprecated comp API
config: i386-randconfig-m021-20230717 (https://download.01.org/0day-ci/archive/20230719/202307192356.By9AmaYX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192356.By9AmaYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307192356.By9AmaYX-lkp@intel.com/

smatch warnings:
net/xfrm/xfrm_ipcomp.c:258 ipcomp_free_reqs() warn: iterator used outside loop: 'pos'

vim +/pos +258 net/xfrm/xfrm_ipcomp.c

0e06a41b263578 Ard Biesheuvel 2023-07-14  246  static void ipcomp_free_reqs(struct acomp_req * __percpu *reqs)
6fccab671f2f0a Herbert Xu     2008-07-25  247  {
0e06a41b263578 Ard Biesheuvel 2023-07-14  248  	struct ipcomp_reqs *pos;
6fccab671f2f0a Herbert Xu     2008-07-25  249  	int cpu;
6fccab671f2f0a Herbert Xu     2008-07-25  250  
0e06a41b263578 Ard Biesheuvel 2023-07-14  251  	list_for_each_entry(pos, &ipcomp_reqs_list, list) {
0e06a41b263578 Ard Biesheuvel 2023-07-14  252  		if (pos->reqs == reqs)
6fccab671f2f0a Herbert Xu     2008-07-25  253  			break;
6fccab671f2f0a Herbert Xu     2008-07-25  254  	}
6fccab671f2f0a Herbert Xu     2008-07-25  255  
0e06a41b263578 Ard Biesheuvel 2023-07-14  256  	WARN_ON(list_entry_is_head(pos, &ipcomp_reqs_list, list));

If you wrote this as:

	if (WARN_ON(list_entry_is_head(pos, &ipcomp_reqs_list, list)))
		return;

then it would make the checker happy.  But it doesn't matter either way.

6fccab671f2f0a Herbert Xu     2008-07-25  257  
6fccab671f2f0a Herbert Xu     2008-07-25 @258  	if (--pos->users)
6fccab671f2f0a Herbert Xu     2008-07-25  259  		return;
6fccab671f2f0a Herbert Xu     2008-07-25  260  
6fccab671f2f0a Herbert Xu     2008-07-25  261  	list_del(&pos->list);
6fccab671f2f0a Herbert Xu     2008-07-25  262  	kfree(pos);
6fccab671f2f0a Herbert Xu     2008-07-25  263  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


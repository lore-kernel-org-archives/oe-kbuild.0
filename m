Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569011607A1
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720705544; cv=none; b=f+8bTdZ6SUafv0ngro/xovwLUvQNjmL+PmXNLa++M8N4P/dfHAZru27dwPMYGSyXu9mTGbOcgVzYEJMp/ATvsGSuwEDE3dUJyhs0x4GIuyFIWWMrX0hWYi/KLNjwQA6sgye5J+Hu3viupdAQnYWrm903pVghQOnEeLIjZfl/VVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720705544; c=relaxed/simple;
	bh=+Iln7HlV/GOtTEfShLuR5S0RfTCYfT7FF7RGjj6Tpk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ipftjegzT9YFeK9TP/sXkOUIduhTJkN1YIz7I0ct19R+074lo+wvkKf17IrLmpC8Dgixm0QgVC4THDuRNcsnIeanaItZzitJAI/6njwUfYvYLPzbWOfBoANjPyq0OsX/jHupaqV4B9LFh6lSuI5ai3lw1eIHqH0VfjiuHA51UD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WdhiuuvY; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WdhiuuvY"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c9cc681e4fso480101b6e.0
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720705542; x=1721310342; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9pw18vyJbqNAo1pIzaMMMtkVUEAEszNwURxGl/x8r70=;
        b=WdhiuuvYdKACU62ejpt6Nx/6BqcfsEsVZ8wp6qsRNJk6h0BoaopU0VL7hWBgV5WJlH
         R5BsfvXqQLpCTsF93Z1IAoHpxUYt/k5ZySGmLjduNeWbXvW3KrzpSM5l5ZCsrzLpvRgB
         PTsrMhL08ucvDD/byoxtP6BBKxPFKRla2bpVVKeG9un/6JSzfryZ6anGngZR5ySZIDcF
         +ALQjuY+bQEXburxI22m9wYThYYkXPRmt2yupbVhVnXUjpLxc4dw9JBRJzBGNgr3LBc9
         4yF7R5c1pOeRrkQVcB9KE0QrwexSD+4ODcFUZKK0j37hPaynH9M7vojHB6JosLdB+oze
         w9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720705542; x=1721310342;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pw18vyJbqNAo1pIzaMMMtkVUEAEszNwURxGl/x8r70=;
        b=aMW2AapRd0U+2uIML3DIaiU7AhrWwodqB6xFxZ0cEu5+FHPF+5ZRGhQb0w/2kLG2T7
         V+XN4HFtpJL3TdupH16V5j4gAug/YcNZUA3qpUtCe8p3ynXwm9jpXTPVEgvQ28CwHc/o
         WF2SqJMr0CAQ0XwAe5drG4CHjKrlsXSpnnHTJXGP0A8VwTtVAEADm5vagbn/zFbbSOlY
         XI1uE9aBKOGNxxeefhHDRwzEMFlTNmA79g9pWr11FylUneocep2C2+dJbsefQYHWb7IU
         RDWrEbv/hsaq1C3C7gzfJB/cBlMZYW3J99xIP05TdQFS5kBATxkuH1WmXy8NTy+HzH3A
         k6bg==
X-Gm-Message-State: AOJu0YzJ/qk5xHVcF/y4D94h59AGuCxe6xj4GPKlMErq65IxAWI1JOz8
	PdYzWJrR33ZjzTQ9raJK2nV53SRvvfj0U2yxb8raIlgKdzN8vZKMwW+WQbJfQc+O/yrg87zbtZy
	Z
X-Google-Smtp-Source: AGHT+IHuSStKyv1vw4rebrVR41VqJjg4gYw0bG9v8vovrkdDDfnPzTbo9SMxFA2uD7kTzQ26icTzAg==
X-Received: by 2002:a05:6808:30a2:b0:3d9:245c:422e with SMTP id 5614622812f47-3d93c00f60fmr8805699b6e.21.1720705541942;
        Thu, 11 Jul 2024 06:45:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:931f:6bae:9ea3:382e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d93ad13711sm1080412b6e.17.2024.07.11.06.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 06:45:41 -0700 (PDT)
Date: Thu, 11 Jul 2024 08:45:40 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 2/3] cxl: Calculate region bandwidth of targets with
 shared upstream link
Message-ID: <1da3d82d-aff3-41b0-9a88-772280794f54@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710222716.797267-3-dave.jiang@intel.com>

Hi Dave,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/cxl-Preserve-the-CDAT-access_coordinate-for-an-endpoint/20240711-092210
base:   v6.10-rc6
patch link:    https://lore.kernel.org/r/20240710222716.797267-3-dave.jiang%40intel.com
patch subject: [PATCH v7 2/3] cxl: Calculate region bandwidth of targets with shared upstream link
config: i386-randconfig-141-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111927.7Q2PF9i0-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407111927.7Q2PF9i0-lkp@intel.com/

smatch warnings:
drivers/cxl/core/cdat.c:785 cxl_switch_gather_bandwidth() error: uninitialized symbol 'is_root'.

vim +/is_root +785 drivers/cxl/core/cdat.c

dfbcea34995e70 Dave Jiang 2024-07-10  749  static struct xarray *cxl_switch_gather_bandwidth(struct cxl_region *cxlr,
dfbcea34995e70 Dave Jiang 2024-07-10  750  						  struct xarray *input_xa,
dfbcea34995e70 Dave Jiang 2024-07-10  751  						  bool *gp_is_root)
dfbcea34995e70 Dave Jiang 2024-07-10  752  {
dfbcea34995e70 Dave Jiang 2024-07-10  753  	struct xarray *res_xa __free(free_perf_xa) =
dfbcea34995e70 Dave Jiang 2024-07-10  754  		kzalloc(sizeof(*res_xa), GFP_KERNEL);
dfbcea34995e70 Dave Jiang 2024-07-10  755  	struct access_coordinate coords[ACCESS_COORDINATE_MAX];
dfbcea34995e70 Dave Jiang 2024-07-10  756  	struct cxl_perf_ctx *ctx, *us_ctx;
dfbcea34995e70 Dave Jiang 2024-07-10  757  	unsigned long index, us_index;
dfbcea34995e70 Dave Jiang 2024-07-10  758  	int dev_count = 0;
dfbcea34995e70 Dave Jiang 2024-07-10  759  	int gp_count = 0;
dfbcea34995e70 Dave Jiang 2024-07-10  760  	void *ptr;
dfbcea34995e70 Dave Jiang 2024-07-10  761  	int rc;
dfbcea34995e70 Dave Jiang 2024-07-10  762  
dfbcea34995e70 Dave Jiang 2024-07-10  763  	if (!res_xa)
dfbcea34995e70 Dave Jiang 2024-07-10  764  		return ERR_PTR(-ENOMEM);
dfbcea34995e70 Dave Jiang 2024-07-10  765  	xa_init(res_xa);
dfbcea34995e70 Dave Jiang 2024-07-10  766  
dfbcea34995e70 Dave Jiang 2024-07-10  767  	xa_for_each(input_xa, index, ctx) {
dfbcea34995e70 Dave Jiang 2024-07-10  768  		struct device *dev = (struct device *)index;
dfbcea34995e70 Dave Jiang 2024-07-10  769  		struct cxl_port *port = ctx->port;
dfbcea34995e70 Dave Jiang 2024-07-10  770  		struct cxl_port *parent_port = to_cxl_port(port->dev.parent);
dfbcea34995e70 Dave Jiang 2024-07-10  771  		struct cxl_port *gp_port = to_cxl_port(parent_port->dev.parent);
dfbcea34995e70 Dave Jiang 2024-07-10  772  		struct cxl_dport *dport = port->parent_dport;
dfbcea34995e70 Dave Jiang 2024-07-10  773  		bool is_root;

needs to be initialized to false

dfbcea34995e70 Dave Jiang 2024-07-10  774  
dfbcea34995e70 Dave Jiang 2024-07-10  775  		dev_count++;
dfbcea34995e70 Dave Jiang 2024-07-10  776  		if (is_cxl_root(gp_port)) {
dfbcea34995e70 Dave Jiang 2024-07-10  777  			is_root = true;
dfbcea34995e70 Dave Jiang 2024-07-10  778  			gp_count++;
dfbcea34995e70 Dave Jiang 2024-07-10  779  		}
dfbcea34995e70 Dave Jiang 2024-07-10  780  
dfbcea34995e70 Dave Jiang 2024-07-10  781  		/*
dfbcea34995e70 Dave Jiang 2024-07-10  782  		 * If the grandparent is cxl root, then index is the root port,
dfbcea34995e70 Dave Jiang 2024-07-10  783  		 * otherwise it's the parent switch upstream device.
dfbcea34995e70 Dave Jiang 2024-07-10  784  		 */
dfbcea34995e70 Dave Jiang 2024-07-10 @785  		if (is_root)
dfbcea34995e70 Dave Jiang 2024-07-10  786  			us_index = (unsigned long)port->parent_dport->dport_dev;
dfbcea34995e70 Dave Jiang 2024-07-10  787  		else
dfbcea34995e70 Dave Jiang 2024-07-10  788  			us_index = (unsigned long)parent_port->uport_dev;
dfbcea34995e70 Dave Jiang 2024-07-10  789  
dfbcea34995e70 Dave Jiang 2024-07-10  790  		us_ctx = xa_load(res_xa, us_index);
dfbcea34995e70 Dave Jiang 2024-07-10  791  		if (!us_ctx) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


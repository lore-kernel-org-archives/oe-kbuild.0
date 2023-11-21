Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31616FDA;
	Tue, 21 Nov 2023 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8v0psqV"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-677a12f1362so21372946d6.1;
        Tue, 21 Nov 2023 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700591889; x=1701196689; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ScTPp3sX0TUL7PQUCNo7NyPJe0CjkT3omGPMiA9YMj4=;
        b=V8v0psqVaLYr2zjVFw+p3aAt3H3dtx0ZZV+UTv7gnnhx4hO/mkkr7Vef8YBcKjCcve
         crekmUvrUnDlMxmFaLDeOXykY5eiHv/vTirsyD+xrILUoe7fpM2vBb+kR2w/y3TjMhxs
         TxhUSDJIoTkIASJEeZ+r7I9PFbd92ZFa+kiUTKYaDLcoK0wuLvlYeYlJBMxvStx7U5eI
         q6gO8yt5ijAy5GNvaWc9+KImXUmmONoBtmXdI0AhiavUcNKUECXf4C82T2obU+h4ddKo
         6gNqRkxiM9HgWdRutZiM6CnpAsBJI+YQFtnEClq62Bp09V/60muvDtfF02gJM+5XREw7
         vBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700591889; x=1701196689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScTPp3sX0TUL7PQUCNo7NyPJe0CjkT3omGPMiA9YMj4=;
        b=pJ/K67iRQPwCOQiJpcNbNrIoEjSXBfI1n6Yy82k+C/VoZ7l9JxZ9AHsX1KQcbH1wDN
         PO6TI6ScEPT1ENX79y1+8J3Yi36K7DVJu+P0KhSXG3ZK3VpoWK+7UJgTALLWR8mmIXKi
         eNnURsAwHMHAmJqUgAhRh2fKLfH90JR+HkCM8m7ux6YDW5Na189V30NXrv+wFgZlA8as
         qth6ebfLCu87Zdnt/ePZ8PPPLiGF87I75En9B4htXH1juo4EPhWsEbd8RMZ06oMlvSAg
         K4Kj41LQ1d23j78Ia5ezsv05TeUo+Y90hjtg6bIsrmuL9J12J74lX+3jOarRCNpa3iNr
         40mQ==
X-Gm-Message-State: AOJu0YznU++2kMWZgCl8FzjUqJ42dzNabdWS661U9u9/NU3S06QFZeBq
	r7IWaTJeKDsDNePsaYxLphA=
X-Google-Smtp-Source: AGHT+IHlP2gWQsqh9GhsUJISQv6hM6y/tzxbmUtD3EHUrZoXwsj/8zywC+R+i4JbLSuZsacFUWprNw==
X-Received: by 2002:a05:6214:5018:b0:679:e783:92eb with SMTP id jo24-20020a056214501800b00679e78392ebmr5763157qvb.23.1700591888606;
        Tue, 21 Nov 2023 10:38:08 -0800 (PST)
Received: from erthalion.local (dslb-178-005-231-183.178.005.pools.vodafone-ip.de. [178.5.231.183])
        by smtp.gmail.com with ESMTPSA id u6-20020a0562141c0600b00679d9324ff2sm2179791qvc.77.2023.11.21.10.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 10:38:08 -0800 (PST)
Date: Tue, 21 Nov 2023 19:34:26 +0100
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next] bpf: Relax tracing prog recursive attach
 rules
Message-ID: <20231121183426.5odgh5q5aukpbdtw@erthalion.local>
References: <20231114084118.11095-1-9erthalion6@gmail.com>
 <f03d7ce6-e603-4ead-8a67-8d424a4420d6@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f03d7ce6-e603-4ead-8a67-8d424a4420d6@suswa.mountain>

> On Mon, Nov 20, 2023 at 08:41:10AM -0500, Dan Carpenter wrote:
> Hi Dmitrii,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Dmitrii-Dolgov/bpf-Relax-tracing-prog-recursive-attach-rules/20231114-164631
> base:   100888fb6d8a185866b1520031ee7e3182b173de
> patch link:    https://lore.kernel.org/r/20231114084118.11095-1-9erthalion6%40gmail.com
> patch subject: [RFC PATCH bpf-next] bpf: Relax tracing prog recursive attach rules
> config: i386-randconfig-141-20231119 (https://download.01.org/0day-ci/archive/20231119/202311191719.Pa8d0Ly9-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191719.Pa8d0Ly9-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202311191719.Pa8d0Ly9-lkp@intel.com/
>
> smatch warnings:
> kernel/bpf/syscall.c:3241 bpf_tracing_prog_attach() error: we previously assumed 'tgt_prog' could be null (see line 3186)
>
> vim +/tgt_prog +3241 kernel/bpf/syscall.c

Right, my mistake, thanks for letting me know. Looks like the condition
branch where tgt_prog is assigned covers only reattachment, and it will
blow when using old raw_tracepoint API. I'm going to send a new version
of the patch soon.

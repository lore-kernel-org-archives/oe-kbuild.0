Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6669F4C93
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 16:15:36 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40078c4855fso24140235e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 08 Sep 2023 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694189734; x=1694794534; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NdY+Hi7Z5IsSCFidZsYVzGby7mhpfwXXWQqVcfLwpC4=;
        b=pEVKjqMyYJ0RsezhT8cP41UZUicRMWV4XxltQnrNj2qaPJHixVvu6aJfXeClfbs6l4
         n8vJ1ikrGZ+hzLqvyHjNNuZDwdiiPlxdipPQl+8+20VRIO9cb5Ad0cWX7nfNExPJPgal
         wdy/25tITz5corG+rc7b2CaKS9BREZUPNAzTTV5gZ0bAjn4yGY16sL9cdaCI+rXZaEUl
         S+/28pXqXGwKu2CJI06/chRE4oJIcyitc137ac0EzSonDEfhxpj16BvUNoMNMS1ELiEi
         TA84blxzRubTplYfLNdUF/WeqfBQdmFcYNBJFTCtJfjrMbxb80MlZwM6FgrYBepfsQlT
         /47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694189734; x=1694794534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdY+Hi7Z5IsSCFidZsYVzGby7mhpfwXXWQqVcfLwpC4=;
        b=TOZQuY/pMEmpOUeMDCr6z036aozBjEAEcZA8WRWcT9r218Z32bkTSd9aiMik9jXaxd
         X2bXF6VRPmx38N9HC+h+DzsTHVIXNNBMw+Ccj5Uz+HyLPLW0tvM5wj8XLrZ1oZINIbYO
         e+eDJh8+/rOzLBXNZWZxoJqK12JoNg+y483CJLdmHZJycEgsEfUnnolc0Ep6RGeQQ7ec
         RuOPO04QPBcaJOGM/pW0o/LjZ1KPy/nkhbtpA5fVRLbQVwhyirK/i8IUECOVOQf4+Itq
         UZYWBJLVwiZIsvOiCXFK6A17RHD0xpnskX4Xc/HaX20JDxFmbxG4ID9pXvFMbiLz7Xam
         TEBQ==
X-Gm-Message-State: AOJu0YyOnzCFO1YBhQOqoMUY3+9PqEi5rzhCjN0BOx2EfT7pca8tG0oM
	go2IKjX1XOw46OshYf1oUnqANw==
X-Google-Smtp-Source: AGHT+IHX6AY4vhEX2QTvLHk6NT4JT6LAvRkwmSIN4QaO6rIoRIOguCBZO9n3eeVHULGrTtBE/kAzEw==
X-Received: by 2002:a7b:c7d5:0:b0:3fb:a102:6d7a with SMTP id z21-20020a7bc7d5000000b003fba1026d7amr2503328wmk.28.1694189734535;
        Fri, 08 Sep 2023 09:15:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t20-20020a1c7714000000b003fbc9d178a8sm5643477wmi.4.2023.09.08.09.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 09:15:34 -0700 (PDT)
Date: Fri, 8 Sep 2023 19:15:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild@lists.linux.dev, John Ogness <john.ogness@linutronix.de>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [rt-devel:linux-6.1.y-rt-rebase 21/51]
 kernel/printk/printk.c:2468 __alloc_atomic_data() warn: returning -1 instead
 of -ENOMEM is sloppy
Message-ID: <3e2976e8-57c7-47eb-97a5-8fd5254c89e9@kadam.mountain>
References: <a6fa0763-b82f-4eff-9e50-06519db5722d@kadam.mountain>
 <20230908151924.S37nvge4@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230908151924.S37nvge4@linutronix.de>

On Fri, Sep 08, 2023 at 05:19:24PM +0200, Sebastian Andrzej Siewior wrote:
> On 2023-09-05 12:43:35 [+0300], Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.1.y-rt-rebase
> > head:   90d96fee668dc306dd748393383c0fc74b798eee
> > commit: cf8dd889ea20ae7091d3b27029b07bef13298291 [21/51] serial: 8250: implement write_atomic
> > config: i386-randconfig-141-20230828 (https://download.01.org/0day-ci/archive/20230828/202308281100.1LIdaKaP-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281100.1LIdaKaP-lkp@intel.com/reproduce)
> 
> Now that I looked again at it. The 6.1 is outdated and no longer
> updated. The -1 vs -ENOMEM is not present in the v6.5 series which
> current so I can't fix it there…
> 
> The 6.1 tree itself is stable maintained. If you want this fixed in the
> stable tree for 6.1
> 	https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git
> 
> and I assume it is there, then I would send Clark a patch…

Forget about it.  This doesn't matter at all.  I thought since kbuild
was reporting it then the code was new.  Sorry for the noise.

regards,
dan carpenter


Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BE817E0
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Nov 2022 08:52:05 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-369426664f9so12196437b3.12
        for <oe-kbuild@lists.linux.dev>; Thu, 17 Nov 2022 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j2G6VBye6lDfLZBX/Rq6Nfy8Zgdvty8GsJtEgoNE0HA=;
        b=rjUr5CoEUTXBpV7aP93AQn0oX1Gd3rBF/MKGrUpJJlz99hkwPIJpRisu1+uiwlXZzO
         3i4JG9z1rZROt46taUBHM9kVz+WkMWciD+WxOU3R2NE0sq286ArlkcumxasoduflsEH2
         IQTe4qGlMH+p9vu/YpdB3JCNssKIz+jDF8CKg7YSrrJdPyWGYDipm7O+7+4hRnZ7XV3J
         hj8u+qv36gApKMCkCgH+pUBICqIhmctekozkQUFInW4t1zj7w6ckWyFhsdh7En3BYJrP
         +v0+pZE1UWrbFA770uaTZVwQKKuY/I0ocZgQOSEfUCr/qIhDPPS3CWie5CAcuPCdTS74
         SnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2G6VBye6lDfLZBX/Rq6Nfy8Zgdvty8GsJtEgoNE0HA=;
        b=kTzk7TRFPNb6Xt4UCH6vgib/yCd1+qjzMq0CoqX9j+PY+uC6toC/gvp3l9XflmN4Fd
         YpRATaWqurkvjnXAduPWGGThGHgwO26/U0YnWRGeWk6DOUVJl/fGWV3YjgmUu6UWHbI9
         keWMS3eki3YxJWNaoC75btz+l4RpLifBZ4Q9MxwJtgM6TMdN8UV6ssfLmgHYu5zN3IYk
         ywo+cRkl5j1yN7JAKFaFn0EqPDrkanUmoBSQpYRnsTfy+S2gaG1+EwqBK4518CrTWbcK
         hoXndxXFaITHtWXOXq75SISctIJ4348tQhAeKFlVRTwh4Yj41bjefeuRjL1laeVXisVw
         QI5Q==
X-Gm-Message-State: ANoB5pnrVDmwW06p49GbXiOVkR1ukgFIwezrOdDqvAqfn5iLVdD2OGTt
	1cCBY2VNxHr0AqzTPew2yDRfKL5rT9QZBuSpBFLERg==
X-Google-Smtp-Source: AA0mqf6Y1V66zw5MMGW4qwLYY9m3hKPynVMp6SDwKLFvSieTFR+rYli2nIOyCEB/lAlcUQN2jiM2KAsILaRWEUnm/48=
X-Received: by 2002:a0d:e601:0:b0:356:d0ed:6a79 with SMTP id
 p1-20020a0de601000000b00356d0ed6a79mr1056006ywe.489.1668675124095; Thu, 17
 Nov 2022 00:52:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202211171520.UF5VyYSH-lkp@intel.com>
In-Reply-To: <202211171520.UF5VyYSH-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 17 Nov 2022 00:51:53 -0800
Message-ID: <CANn89i+va1YaFBk=3WYX0Qt1FEfz8oSnuAx2N8OxKfcAWwE6HA@mail.gmail.com>
Subject: Re: [net-next:master 25/27] net/core/dev.c:6409 napi_disable() error:
 uninitialized symbol 'new'.
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 16, 2022 at 11:36 PM Dan Carpenter <error27@gmail.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git master
> head:   d82303df06481235fe7cbaf605075e0c2c87e99b
> commit: 4ffa1d1c6842a97e84cfbe56bfcf70edb23608e2 [25/27] net: adopt try_cmpxchg() in napi_{enable|disable}()
> config: i386-randconfig-m021
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
>
> New smatch warnings:
> net/core/dev.c:6409 napi_disable() error: uninitialized symbol 'new'.

Thanks, I will take care of this.

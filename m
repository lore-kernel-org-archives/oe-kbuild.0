Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276BD8F63;
	Fri, 23 Dec 2022 16:21:55 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so3864521wms.2;
        Fri, 23 Dec 2022 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hI2AAVr0GajMn6R38dDdetCgvikhxBGvAxzi6T7wg0k=;
        b=dKMhvPsIEPUzoTnSdzSjitUM9MyhEDdt1DRMWa6rATPUveG38LwbqZbzfbilPnfYAS
         QB3uHYH7tC3JTz2ZkWc0V9Idq8vxuz0FYSCybrP91h/UZzUL2mg5Jr557+PsdoS7VqzX
         XitIerrhDf4YB8JIeW2oySG+bQ3uXAnO7hFwHIB5NNxSa9RrtcHxUnpMmtz8966m60fg
         TE0J3FXayCITuJRn6pYEjzxyvaNi95AZCqs7SLiuooH4TuMvzy/fogS3YgYe7oN8GqMr
         PY9aGsK1ITqcFQy+s81WvDiN119e7t6DV10U2HJIQnH1Tf08FJwQchAI0gfLnlJfeVH3
         pqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hI2AAVr0GajMn6R38dDdetCgvikhxBGvAxzi6T7wg0k=;
        b=tp7JGxZX5dTo4UCiyGofO6uGT2nt9b1R8vcsbqbFCC3UL5zBBWvlwEaEXBzct9Sc8G
         tC4EOniNIphBbiUJ3fE4ym4eF95xJxMC9JJhXnRcdByiMieHw3wcmEHosO2BsTC12CFl
         75W3PYOuPyY/eoO/vQyz2lG7T7OVP3PheP3ARfP3esY/16wqVCFci917AltvP8rawsdA
         50o0yeQDpnCKKWxHsTvCpihhCNTLa91Rjh1d0gNho5YjsWU0OvkqKzRdTcLit54R1BdD
         HGKDfLlZSC34i8vSeUaHXdskOgLXZfrnnMdo/8uoRCZwDtFj+3HLW2bNA7ZNJMRevVaE
         38EA==
X-Gm-Message-State: AFqh2ko/dRMdlU1CGtPJfsNJFxyxZ5H4amTb8QFYdv3YoeNBUMCLZ1+c
	AjFBBseoAyD5dG7NTa4Gjgg=
X-Google-Smtp-Source: AMrXdXvcv7aKaagigLS48DwM5czqYbY//VUKgxMMwbvv/+ONNDRe6/3C7KVWfc17NL49kXOVZ0OtZg==
X-Received: by 2002:a1c:19c4:0:b0:3d1:ebdf:d592 with SMTP id 187-20020a1c19c4000000b003d1ebdfd592mr7529261wmz.22.1671812513280;
        Fri, 23 Dec 2022 08:21:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w20-20020a1cf614000000b003cf4d99fd2asm4895248wmc.6.2022.12.23.08.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 08:21:52 -0800 (PST)
Date: Fri, 23 Dec 2022 19:21:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/nvme/host/auth.c:950 nvme_auth_init_ctrl() warn: missing
 error code? 'ret'
Message-ID: <Y6XVnWCNx6cB7Itw@kadam>
References: <202212222333.vrYfUBqM-lkp@intel.com>
 <20221223154754.GA30339@lst.de>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223154754.GA30339@lst.de>

On Fri, Dec 23, 2022 at 04:47:54PM +0100, Christoph Hellwig wrote:
> diff --git a/drivers/nvme/host/auth.c b/drivers/nvme/host/auth.c
> index bb0abbe4491cdc..c808652966a94f 100644
> --- a/drivers/nvme/host/auth.c
> +++ b/drivers/nvme/host/auth.c
> @@ -943,16 +943,19 @@ int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl)
>  	INIT_WORK(&ctrl->dhchap_auth_work, nvme_ctrl_auth_work);
>  	if (!ctrl->opts)
>  		return 0;
> -	ret = nvme_auth_generate_key(ctrl->opts->dhchap_secret,
> -			&ctrl->host_key);
> -	if (ret)
> -		return ret;
> -	ret = nvme_auth_generate_key(ctrl->opts->dhchap_ctrl_secret,
> -			&ctrl->ctrl_key);
> -	if (ret)
> +
> +	ctrl->host_key = nvme_auth_generate_key(ctrl->opts->dhchap_secret);
> +	if (IS_ERR(ctrl->host_key)) {
> +		ret = PTR_ERR(ctrl->host_key);
> +		goto out;
> +	}
> +	ctrl->ctrl_key = nvme_auth_generate_key(ctrl->opts->dhchap_ctrl_secret);
> +	if (IS_ERR(ctrl->ctrl_key)) {
> +		ret = PTR_ERR(ctrl->ctrl_key);
>  		goto err_free_dhchap_secret;
> +	}
>  
> -	if (!ctrl->opts->dhchap_secret && !ctrl->opts->dhchap_ctrl_secret)
> +	if (!ctrl->host_key && !ctrl->ctrl_key)
>  		return ret;

ret is uninitialized now.

regards,
dan carpenter


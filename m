Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED43662F;
	Sun, 25 Dec 2022 10:36:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id i7so8131849wrv.8;
        Sun, 25 Dec 2022 02:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EchhkTTeWj/l3b3OSWkA05dF2p08TbkhmMoG0JUIzmI=;
        b=RfGGsBWzS5YxyaKU+87sQ0VO7DJo4iZlNXVsdk57CF1S0AHUJcOk4/ZPAXug7t3j+6
         t5ScT0waRV9hyDctt3Fw3BIYpzAUUCLBA+kWW03jYBXD9mtm6uqOrJxwc80M8s72WQJg
         x2fpvLL62XCGYB9gFn3XQGExYY2gXYbPxEcI5j16njak6uMIWvM5sam6kk2uEPf7YHVl
         v0YJO7XsxblWO3pyRiiYJH24mMFEVz2DFOWJjjS2eKpq/5PJqYwwd4OmQZCXPLhLCF8O
         8M75QeHllSOb7b6Y777WCrgCR0SENYHHhxhU76RA3J9QndZd3IY07uaRUnMpS0AP+DOp
         24+g==
X-Gm-Message-State: AFqh2kpcGYYeZnmq8hpGq8S0tGTfNzT785o46M6b/7Jhv9J8rZCMpiKB
	3vuvRN1fpeyGgYC6SC0b4+c=
X-Google-Smtp-Source: AMrXdXsZq0rGK2qT91H/thFx92Zy0/jrCMOZJYqtAFXAt1xuzx3RGwe+7pwKbhV7MjxXHLdnch9mYg==
X-Received: by 2002:a5d:4008:0:b0:242:17d3:a9fc with SMTP id n8-20020a5d4008000000b0024217d3a9fcmr9668380wrp.30.1671964569227;
        Sun, 25 Dec 2022 02:36:09 -0800 (PST)
Received: from [192.168.64.177] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id b2-20020adff242000000b0023662245d3csm7619890wrp.95.2022.12.25.02.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Dec 2022 02:36:08 -0800 (PST)
Message-ID: <594b768a-9311-da86-1619-5435d3f720f5@grimberg.me>
Date: Sun, 25 Dec 2022 12:36:07 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: drivers/nvme/host/auth.c:950 nvme_auth_init_ctrl() warn: missing
 error code? 'ret'
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <202212222333.vrYfUBqM-lkp@intel.com>
 <20221223154754.GA30339@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221223154754.GA30339@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/23/22 17:47, Christoph Hellwig wrote:
> Based on the code in nvme_auth_generate_key I assume this is intentional,
> but the code looks really confusing.
> 
> Hannes, Sagi, what do you think of something like this:
> 
> 
> diff --git a/drivers/nvme/common/auth.c b/drivers/nvme/common/auth.c
> index d90e4f0c08b7b9..a07eb4cd9ce173 100644
> --- a/drivers/nvme/common/auth.c
> +++ b/drivers/nvme/common/auth.c
> @@ -455,28 +455,18 @@ int nvme_auth_gen_shared_secret(struct crypto_kpp *dh_tfm,
>   }
>   EXPORT_SYMBOL_GPL(nvme_auth_gen_shared_secret);
>   
> -int nvme_auth_generate_key(u8 *secret, struct nvme_dhchap_key **ret_key)
> +struct nvme_dhchap_key *nvme_auth_generate_key(u8 *secret)
>   {
> -	struct nvme_dhchap_key *key;
>   	u8 key_hash;
>   
> -	if (!secret) {
> -		*ret_key = NULL;
> -		return 0;
> -	}
> +	if (!secret)
> +		return NULL;
>   
>   	if (sscanf(secret, "DHHC-1:%hhd:%*s:", &key_hash) != 1)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>   
>   	/* Pass in the secret without the 'DHHC-1:XX:' prefix */
> -	key = nvme_auth_extract_key(secret + 10, key_hash);
> -	if (IS_ERR(key)) {
> -		*ret_key = NULL;
> -		return PTR_ERR(key);
> -	}
> -
> -	*ret_key = key;
> -	return 0;
> +	return nvme_auth_extract_key(secret + 10, key_hash);
>   }
>   EXPORT_SYMBOL_GPL(nvme_auth_generate_key);
>   
> diff --git a/drivers/nvme/host/auth.c b/drivers/nvme/host/auth.c
> index bb0abbe4491cdc..c808652966a94f 100644
> --- a/drivers/nvme/host/auth.c
> +++ b/drivers/nvme/host/auth.c
> @@ -943,16 +943,19 @@ int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl)
>   	INIT_WORK(&ctrl->dhchap_auth_work, nvme_ctrl_auth_work);
>   	if (!ctrl->opts)
>   		return 0;
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

nvme_auth_generate_key can return NULL, so in this case we should avoid
calling it if the secret is null here.

Other than that, this looks good.
Although I think that for this specific report, we should do a simple
fix and then make the code look better.

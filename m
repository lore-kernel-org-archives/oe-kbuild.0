Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E829A5;
	Thu, 13 Apr 2023 09:05:29 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q6so2015764wrc.3;
        Thu, 13 Apr 2023 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681376727; x=1683968727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ImWRhaeP829MMe3bVHuIUkeNGlk1jSLzhOBi573HFgk=;
        b=Ycw4JPyIfNKtPZtIde4fHG7FAZBd9ZIC+ZvGTAMrYzk+wYu7yIfkJRTLL020C6Ke+m
         99RG8djJ9b4XI9BtEZqHkTV304oJJweBmNoNv3YQ9bFlxK469KbOyITyeWGfkBCGUkNb
         J0R1PDZUMyzyBe3r3QsYd2q8KIt9BFXAlIvkIgh5Iz1dwf7NOOxNT0R2EzMx/UuRSr9w
         CPtz2l5ofFsWk81M/q3HQ40k571mQEtJ89lmo5HJsOWDKinI43900eBxAEqYOTuFSjCJ
         pNDvWl2i/gher+yBo9UnWZMScjX54wCGI8EfJCGFzUz6H4uh82z+8kpuKLjjvWmJwHla
         rgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681376727; x=1683968727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImWRhaeP829MMe3bVHuIUkeNGlk1jSLzhOBi573HFgk=;
        b=FOqmXMtn7r6Hc+jvWg3dNX/w9wLdcesGvvX88RKSO925K6VC7/JMZVBEfv3YmYg4jb
         gn7i5FGcKMRfNzubf3Q7hGnszMwbwmzd4di4loTiS/1eV12IHXzcErL+eZnxFU1Hzwj9
         WraNEbQLMr87av0ni9IiWGpxKvrM09kNt8CVOYQVN0Wg2HS5nEJH3bHu17ORlLEROY7K
         slMNdiqEBqbmCohFXsmY6MCl+5GzTcJYMN8BSNIiKYGI1a5IyolOwEL2anR0DQwotNVD
         MjhNYyNv7RMuTnhLPTmyj8p3GguD0DCysVzXEYtiYSpBUPvqvrZqx0BEkfEERGRRLhgC
         K5VA==
X-Gm-Message-State: AAQBX9cYxrQYIo//E8vueBii3cIWLmc/zHP5BAqKpa/lqWp90aplLuqY
	akhV3H/BvlLg+iHxlje7uOo=
X-Google-Smtp-Source: AKy350aon0w/1oZncdiNRHi7M6V9LfV3ybEK+J3KQURj7VtQ18YP10O9ijr3/WSeiDvR2EX6QjWXHQ==
X-Received: by 2002:adf:f40a:0:b0:2ef:bbbc:de7d with SMTP id g10-20020adff40a000000b002efbbbcde7dmr884152wro.46.1681376727451;
        Thu, 13 Apr 2023 02:05:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f20-20020a1c6a14000000b003eae73f0fc1sm1259165wmc.18.2023.04.13.02.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:05:26 -0700 (PDT)
Date: Thu, 13 Apr 2023 12:05:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 8309/10976] drivers/gpu/host1x/context.c:82
 host1x_memory_context_list_init() warn: missing error code 'err'
Message-ID: <70bab86b-d705-4815-8100-3cce0cbf25e8@kili.mountain>
References: <ac98d66d-8735-4963-8cdb-be891d134cb3@kili.mountain>
 <ZDfEEOEoMA55t4ol@orome>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDfEEOEoMA55t4ol@orome>

On Thu, Apr 13, 2023 at 10:57:52AM +0200, Thierry Reding wrote:
> On Thu, Apr 13, 2023 at 08:06:08AM +0300, Dan Carpenter wrote:
> > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  69  
> > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  70  		err = of_dma_configure_id(&ctx->dev, node, true, &i);
> > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  71  		if (err) {
> > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  72  			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
> > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  73  				i, err);
> > 55879dad0f3ae8 Yang Yingliang  2022-11-26  74  			device_unregister(&ctx->dev);
> > 55879dad0f3ae8 Yang Yingliang  2022-11-26  75  			goto unreg_devices;
> > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  76  		}
> > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  77  
> > 9026ba722360ce Thierry Reding  2022-11-17  78  		if (!tegra_dev_iommu_get_stream_id(&ctx->dev, &ctx->stream_id) ||
> > 9026ba722360ce Thierry Reding  2022-11-17  79  		    !device_iommu_mapped(&ctx->dev)) {
> > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  80  			dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
> > 55879dad0f3ae8 Yang Yingliang  2022-11-26  81  			device_unregister(&ctx->dev);
> > 55879dad0f3ae8 Yang Yingliang  2022-11-26 @82  			goto unreg_devices;
> > 
> > error code?
> 
> We don't actually want this to be a fatal failure, so err = 0 is what we
> want here. Should we set err = 0 explicitly here to appease smatch?

Yes, please.

regards,
dan carpenter


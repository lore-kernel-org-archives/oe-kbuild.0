Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B1015B2
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jun 2023 05:18:13 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so2203599e87.2
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Jun 2023 22:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687238291; x=1689830291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y7PuqpyqHE/HUVu8CRaW9WlThpzPBfO6+875ZQx+jnA=;
        b=jZfGp0eU/AOpdTm+87nfzlpGDHlwXLBmjppSrvDNvh22D+l8sFwKzh6IYrYtdh/eev
         pXDy01aznntXR9LrWluM1kBdIEa4xv+zEVjuKhzoKhbvNNLu5XoM3qQ++VXPXkLJWMws
         dI1iqdhVNTh39yrm7W/kqR7PGN0nYEH7MLi3vMPnjr+HDX1NakyioZjvJnX2QbR6ADSt
         DuwkypSuG55eN+mHdsdelQf33HTDRmBKnheMUpl8mAndtLTTLJH1EbImdMX1XuTYaS+R
         lJaZFVfrjMW+40G2iGwTukbPUvrmFny1jnryn+unYl8kqmXPDRBnfRJErWVhEJwmMujX
         3XcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687238291; x=1689830291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7PuqpyqHE/HUVu8CRaW9WlThpzPBfO6+875ZQx+jnA=;
        b=XMNPvrMAc+bOEsfpDiEIkePxHi6IIqk2aRDVr7iPw/qKe79rk3Woa5nekCH7+YN9Br
         slEsMmlwoN1YrHzRFwzND5SEHkq+SwG7jIPNTFRz1k9pJxKn+FP+Gjunv2mpZlnEoshs
         Dhl6iXA7XOcfvqVqIIwmA/b0+fZxq67QbD6uGkkcPMvgd8ArXNjhDD8mt5UiWTmQSHuU
         aF/STZbDhADVJpvs8IeHxZo/FT0OdvZae52WMbjn8/N6YhmOqNhcu4nUUbI8ZwQZgWtR
         L7YRRm20p0nc0BsRIfSavvdrKBIwEWQY/7SVudamVjR1V1tSPH0wm8Zi41Y27iVxVrdO
         yHew==
X-Gm-Message-State: AC+VfDxF8xVeeOZsXAy2iOBufpCtkBc8uOUEa2Ech3W945K5M43aPMHA
	0Owi0sw1axBEnKERVAvTfq+glg==
X-Google-Smtp-Source: ACHHUZ5ccBcWPxcFeRk9KZTmk2iY37jAco/koAiv37L1FuAnmeROZMwkEffaczENJYwJooQ+gl1ReA==
X-Received: by 2002:a2e:95c4:0:b0:2b4:6a20:f12d with SMTP id y4-20020a2e95c4000000b002b46a20f12dmr4718664ljh.43.1687238288311;
        Mon, 19 Jun 2023 22:18:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z8-20020a05600c220800b003f9b12b1598sm4395724wml.22.2023.06.19.22.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 22:18:05 -0700 (PDT)
Date: Tue, 20 Jun 2023 08:18:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prathu Baronia <prathubaronia2011@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v6 1/2] axis-fifo: use devm_kasprintf() for allocating
 formatted strings
Message-ID: <e118d13a-d36e-4417-9fe5-68d46472c09a@kadam.mountain>
References: <ZI/5H+GZU6/2osGT@redkillpc>
 <20230619162246.33007-1-prathubaronia2011@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619162246.33007-1-prathubaronia2011@gmail.com>

On Mon, Jun 19, 2023 at 09:52:44PM +0530, Prathu Baronia wrote:
> In various places, string buffers of a fixed size are allocated, and
> filled using snprintf() with the same fixed size, which is error-prone.
> 
> Replace this by calling devm_kasprintf() instead, which always uses the
> appropriate size.
> 
> Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
> ---
> V5 -> V6: Split into api change and name change commits
> V4 -> V5: Remove the dev_info() and use a unique identifier for dev name
> V3 -> V4: Split into warning fixing and cleanup commits
> V2 -> V3: Fix smatch warnings from kernel test robot
> V1 -> V2: Split into logical commits and fix commit message
> 

> -	snprintf(device_name, 32, "%s_%pa", DRIVER_NAME, &r_mem->start);
                                      ^^^

> +	device_name = devm_kasprintf(dev, GFP_KERNEL, "%s_%p", DRIVER_NAME, &r_mem->start);
                                                          ^^

This is a sneaky fix which Greg already kind of complained about if I
remember correctly...

regards,
dan carpenter


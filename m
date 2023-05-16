Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F5F23C3
	for <oe-kbuild@lists.linux.dev>; Tue, 16 May 2023 07:06:01 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so13655205e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 16 May 2023 00:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684220760; x=1686812760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tj9w7Aq6+c/DbgNsWpbFH46xdrrTXuub6+RO8bXaBBE=;
        b=vPJ4xhdBXK61FbYOVS7+zV5j/S+DviYb+hfmdn4Ff4GS6LkS1fMjrVx4lC3fuFt9nK
         hYhylWIF8rNRlKcUUvD+U1bmqtOUBj4EaAuXS0o66NrWyrhKQTpN5Og8jnFCE15fuWM6
         Zgau6Isy+zflYzDpLBeUYJr5q0/TmNHpJp7joXBnSrSUD9X/5wpvi0lkXh5U2LYNWJ+d
         nSc3hEGQRN1bLj6LjGjNbvIP+OzEV3IW3Ez5zOzgpBrRZMg82HRmrEAw4SfB9q/wgemu
         tDsV5LVIMIzF5z9R2r6MtodMitjHEWCdD+9pKTjAV+btOUx8cMEJs/kmT6k56ySdpwPZ
         Lf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684220760; x=1686812760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tj9w7Aq6+c/DbgNsWpbFH46xdrrTXuub6+RO8bXaBBE=;
        b=j3wWlB7tYuQAbAE4rWmamxQg7uasL00KLBg/010vsDL8uQror/LsMQMlPFfgwv9dpT
         r3XJc0icAyMk/AwNqTZBhF1a0f+iyDTVESGP+bJONdF8xOUiJlDLS0SGU7Ji8BFCPEV4
         4zlcwFj+o1dapVxV8mIJP7ieQtpIIpGrQUSemZW6ehP+douo6FjtMC3DQzrS0YOVjGNQ
         5HuXhAufY3BFkRnQZwIEjoFBuNWtqBxDBFgpX0Y2vnweLi3QHTfHJO0JXu0nSKsPjmCR
         1/y888yWCS02Lq/rlKf4tlXPa+nV/Q1EFLoStCdJ3QJXoSWwd0AEYutZbfTWtUyA5zro
         /ymw==
X-Gm-Message-State: AC+VfDzmEgnNJ1qeEztxovJJIyF7NBlhwGBNiqhM3mPAzr4OS7kyJm35
	XqS4sW7MnoSJOH0L4r8XPYI0+Q==
X-Google-Smtp-Source: ACHHUZ5FKyFZMyl+BDOoNUY2sRmKi/mGvQ3ZODa/hydez+q4/H8tK7Qoi0QDUQPxfzR4xAyojR0hkQ==
X-Received: by 2002:a05:600c:4444:b0:3f3:284d:8cec with SMTP id v4-20020a05600c444400b003f3284d8cecmr26193079wmn.2.1684220760107;
        Tue, 16 May 2023 00:06:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r7-20020adff107000000b003012030a0c6sm1493932wro.18.2023.05.16.00.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 00:05:58 -0700 (PDT)
Date: Tue, 16 May 2023 10:05:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [joelgranados:jag/sysctl-testing-for-0day 2/6]
 drivers/parport/procfs.c:502 parport_proc_register() warn: possible memory
 leak of 't'
Message-ID: <98df279e-4558-40e7-ab96-0ab45ba5a16f@kili.mountain>
References: <CGME20230515073454eucas1p13d3f249160454d835f3cefce3fa7a0eb@eucas1p1.samsung.com>
 <819e68aa-8c11-4f4d-9dcb-d20ef136fe0f@kili.mountain>
 <20230515185917.sdxy2mszhmjyngn3@localhost>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515185917.sdxy2mszhmjyngn3@localhost>

On Mon, May 15, 2023 at 08:59:17PM +0200, Joel Granados wrote:
> On Mon, May 15, 2023 at 10:34:44AM +0300, Dan Carpenter wrote:
> > 3756e44223c286 Joel Granados        2023-05-12  504  	if (register_sysctl(tmp_dir_path, t->device_dir) == NULL)
> > 3756e44223c286 Joel Granados        2023-05-12  505  		/*
> > 3756e44223c286 Joel Granados        2023-05-12  506  		 * We keep the original behavior of parport where failure to register
> > 3756e44223c286 Joel Granados        2023-05-12  507  		 * does not return error.
> > 3756e44223c286 Joel Granados        2023-05-12  508  		 */
> > 3756e44223c286 Joel Granados        2023-05-12 @509  		goto  exit_free_tmp_dir_path;
> > 
> > Smatch wants a error code for this error path.
> > 
> > The comments say that we are doing the wrong thing deliberately to
> > maintain backwards compatibility and avoid breaking stuff.  Fortunately,
> > (LOL), no one is checking the returns from parport_proc_register() so we
> > are free to return a correct error code without any worry about breakage.
> Sigh. Indeed, the only place were this function is called is from
> parport/share.c. Should we just change the function return value to
> void?

I feel like we should return errors and not check for them.

Hopefully, some day in the future someone will be able to test this code
and add checks.  (This seems more optimistic than realistic).

regards,
dan carpenter


Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC69A38;
	Thu,  5 Jan 2023 09:16:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id h16so35425251wrz.12;
        Thu, 05 Jan 2023 01:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gdx1VB1MP6vu1U58bug5TPxe7ZJ7PJPdJtqyvvNdwMc=;
        b=fEyhgPd8PxU1+QfT3sDm/c+5XX1PlH9iz9U4HHe6X3tgc9+EQ3RzeoKxF6hGP+5kb0
         WGS1sp2lyuBPuOIzrDlsAey4nYuVL843IWXRGqlviRGheaND1I7Mkx7jtn072bZ6eAkt
         V0KzYb/TEjZTA4Z+FqqwDk0ctFNW6oTyFYX1vBWTiXUkSVO+yISopaUJ3Rg2HCzB/sul
         Qd7CojBhsqy76Rrk1dgi+lWZGB/dxuod6bimps7LtOrjVTiyTT4X50tLadnPOr74afav
         Ngp+UMmd7XAlRnTfm6jXogmCn3jMZSD2eM6J0HF4IV4158qtajG+BnB6/ATVOfV69Sh/
         ZetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdx1VB1MP6vu1U58bug5TPxe7ZJ7PJPdJtqyvvNdwMc=;
        b=Oejpw/vcMrnCeZaU1vxU9TCxCu3fvc0P/ulglDZODzRWKN1Lj0LIW2To5GOerns5kp
         uLXOFFEKEk51gevBOdC/R1jOO28xJCn5hXgdngCarwEHs6QyunbzGs0KPDMUvGL6LGIV
         dK/mJ8O77DuZY6y1lHrcYA7heAw2WIhzLZrapSrZkJXF/exN9B3SxvamCJ0WZ+4z8e0L
         PyWzaC80R0vIdUFrItq2EnFzH46Kc6rt2Cu8kWe8PdY89G0075hQtOTx5uq7AGcZp+S7
         b6UdMoOCc0pIaUiBKIl48+9evSPXw6INy33KBeuW1/0HMUm78iukeUGpPQkV08/RGslR
         eUMg==
X-Gm-Message-State: AFqh2krul6vvM/1Oct88u9c6UUgedKKYquB4f16QXEY1hSGS9uJlWrKB
	2LL0Y8/65cOBYvvABle2/+M=
X-Google-Smtp-Source: AMrXdXs6LfSPH8BJw2Mp/mEKNBSIp+BAge+t0tE4187YR25uRPeU36i9JRPz+wLQpwnOBRIYkZs7Yg==
X-Received: by 2002:a5d:660c:0:b0:273:92ee:a0a with SMTP id n12-20020a5d660c000000b0027392ee0a0amr26026648wru.50.1672910201311;
        Thu, 05 Jan 2023 01:16:41 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bj11-20020a0560001e0b00b002a6f329203esm3302975wrb.61.2023.01.05.01.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 01:16:40 -0800 (PST)
Date: Thu, 5 Jan 2023 12:16:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [sudeep-holla:for-next/scmi 23/30]
 drivers/firmware/arm_scmi/driver.c:2531 scmi_debugfs_common_setup() error:
 uninitialized symbol 'c_ptr'.
Message-ID: <Y7aVcs7GlU5EYHF1@kadam>
References: <202301050721.xSWIWpwP-lkp@intel.com>
 <Y7aJtuRuT9dyoH5G@e120937-lin>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7aJtuRuT9dyoH5G@e120937-lin>

On Thu, Jan 05, 2023 at 08:26:30AM +0000, Cristian Marussi wrote:
> > vim +/c_ptr +2531 drivers/firmware/arm_scmi/driver.c
> > 
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2512  static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2513  {
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2514  	int ret;
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2515  	const char *c_ptr;
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2516  	char top_dir[16];
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2517  	struct dentry *trans, *top_dentry;
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2518  	struct scmi_debug_info *dbg;
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2519  
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2520  	dbg = devm_kzalloc(info->dev, sizeof(*dbg), GFP_KERNEL);
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2521  	if (!dbg)
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2522  		return NULL;
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2523  
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2524  	dbg->name = kstrdup(of_node_full_name(info->dev->of_node), GFP_KERNEL);
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2525  	if (!dbg->name) {
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2526  		devm_kfree(info->dev, dbg);
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2527  		return ERR_PTR(-ENOMEM);
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2528  	}
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2529  
> > 0868ff68bdf60d Cristian Marussi 2022-12-29  2530  	of_property_read_string(info->dev->of_node, "compatible", &c_ptr);
> > 0868ff68bdf60d Cristian Marussi 2022-12-29 @2531  	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
> > 
> > My instinct is to agree with the checker on this and say that it does
> > feel like we should check if of_property_read_string() read something.
> > 
> 
> Well I could have, but I avoided it because this .compatible is related
> to the device node attached to info->dev which is the platform device
> itself which is being probed by this driver and from it is exactly from
> that probe path, indeed, that this same function is called here: so the
> property cannot be empty or non-existent here since it is the very
> reason we are in this code path.

I feel like that requires knowledge outside of just the function?  For
these emails, I only see the function itself with no context.

> 
> ... but, for peace of mind, I could add simply 'c_ptr = NULL;' upfront
> and let kstrdup trigger the fail path when called with a NULL
> c_ptr...this indeed has basically no cost and it is more future-proof
> probably...
> 
> Thoughts ?

Yes.  That sounds good to me.  It likely will not even affect the built
code for most distro kernels because these days we tend to zero out
stack data by default to avoid undefine behavior and security issues
with unintialized data.

regards,
dan carpenter


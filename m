Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B35A2F7AAC
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807778; cv=none; b=tdgCDpnIX2dOxolXSh1oowLzPEU10U4D/V+Z4omYnHIfZWsSfvlmRsYD2A2bvK73QNbz6bAzGxIQDMV578LdZp+gDVoA1gVoHRAuFZUMP5J45SuoRum5J3TjYukvjJVbhD84vw1iCFj+TPbXQCqlabKYnBsxEtslMAduUR/uVhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807778; c=relaxed/simple;
	bh=ELKdBUiZqG263/3lZkDLMx0y4CP0vUOU4SIjdjAFa5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTsxzFR2waDGKDeAdannfa/tDSmAQq0ltBEBIQ0FEE33JMH3QK1z4+NRzOe9q25mbzhfUogtpdh5ep8MQD/rkcQu9qK5C3SL92FSVQ8e5bi/dDcC/5TeeKlhLu91kusG66QuN1FYsBmkFmXvbK75F7ljIty1fNMuc1l1WM5sF78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=alRWZdNR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="alRWZdNR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d2670932so3155177f8f.2
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 23:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768807775; x=1769412575; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ddflimAih1d9IJylDLhOmD5P0ocN9EdagogBb49LvO0=;
        b=alRWZdNRTkS+lQjZjJ8S2sW6MFAM9cflBXTE1PIsRyuhxQciY/PMcXyJeqT2BgMmyT
         0jKzGlxXEoDOSONVqdeeSNgZisOCwr9M9eTbQulwFj0Q1+SzUWvKybbqdbTjaEr9GM9W
         mKZOwrePAwjy3/LvOmOEkY4NIiohTocBGCdMbACu0Rx64nwe5nvMGLjCwmXvsXcD1Geh
         +GN35NhwqTCiRE4LeN254qOeVgrgbMIccPOevSyJQjjXJLTT2lGSBQH0HGl81/qQ4z9F
         nMlegQwXMvoHkJiUMenTABcfgfmDJZQItwmuO4krjqJTY4WZVWzRNQm0VBbMYCAGpIWM
         VQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768807775; x=1769412575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddflimAih1d9IJylDLhOmD5P0ocN9EdagogBb49LvO0=;
        b=UYHKvF2hdTiYltsRGvb51h3VioFBS5i54ybZ9H6q7Q6cJTi9qMwCqK9XG89RiEx4yN
         sS7W/rKR6R1Hdzz5OGsksKOfkfv77mou263IBBGogl3OwI+/9iOP4WeWMTfYYjTTZCZE
         yI2vLdWY4CDkPsovXZhO3ZsGpIsLRM1QGQGRmtbXpOaAb1WoUz5IRZ0AuIxLjcIepqk3
         KwyDim9ofIC0xyiKKXbwcTtpToGWRNuVfGqYLBdilwzdpEoWRNYPIBF+hCDP1OlKjKVL
         x3pWy4X1ArVX2AFlpjg5WX8xjVU81prv9yLYsX9Ngm6/uMmTQi64udVleCEk6s8MbFu0
         vSNQ==
X-Gm-Message-State: AOJu0Yyxkv07n0qy6GP3/Ueyw5J6Ritk46hgtM0DgdQJlNZis+YiNEOa
	xXTblHs0vd1CeOS15D8juRCIU+AAN/3Cb38T7Wvg/ap3xkLjjB5NInUGgkXXhY6xrpg=
X-Gm-Gg: AY/fxX7MPdqUixcu3CqmAUpEf6FxrkH2GMpabE9E3NCU2r2Ea7+9tbePXx9JjWXQHFu
	Lzvvp5tHs7D1dkq1C7zvnEQTx2LIiH9QzlfLp1gNDUwMjoHu5uv+Qx5oal9QhUBcNTRILEFEcj2
	/af9GUq3xSLNDNRJmO8J6cVz+M0esHZvGp5gzkPP4pl/V4WV5fSZHem6zZflCOmK+Ij0OAmYf+I
	hW9erX5O83OtDjk7VlNdrIiPYt6psmYk6EIXeW+9OcyybNGrtJH0NSAqVHGgw7Z6nIqIpbt2TKR
	8UUaM3bagqrHODAon/0nNpr8PSGQHBicMApaAzu0PR0cIs2aWt40Ec1Z04EDAcdt10gDEnhrltd
	TFIVyjuQAqTKNIdJHungObXzv/1JkyyYsaQ5bdDKtsogiyWbnBCqOUcMtAGylLxRc8gYgtM2H4o
	ZS55l/3GRsqRgYzRWk
X-Received: by 2002:a05:6000:40e0:b0:431:2ff:1289 with SMTP id ffacd0b85a97d-43569998e7emr12469349f8f.16.1768807775396;
        Sun, 18 Jan 2026 23:29:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e79asm21425229f8f.33.2026.01.18.23.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:29:35 -0800 (PST)
Date: Mon, 19 Jan 2026 10:29:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	"fdmanana@kernel.org" <fdmanana@kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
	"lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH] btrfs: use the btrfs_block_group_end() helper everywhere
Message-ID: <aW3dXIsPHSbg8i6l@stanley.mountain>
References: <202601170636.WsePMV5H-lkp@intel.com>
 <9398ca7c-f114-47f9-ac22-8fd8f67214a7@wdc.com>
 <aW3c_HzQw-dfQUeg@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW3c_HzQw-dfQUeg@stanley.mountain>

On Mon, Jan 19, 2026 at 10:27:56AM +0300, Dan Carpenter wrote:
> On Mon, Jan 19, 2026 at 06:49:34AM +0000, Johannes Thumshirn wrote:
> > On 1/19/26 7:40 AM, Dan Carpenter wrote:
> > > d4452bc526c431 Chris Mason     2014-05-19  1202  	u64 start, extent_start, extent_end, len;
> > > 7fc5a6968403c7 Filipe Manana   2026-01-16 @1203  	const u64 block_group_end = btrfs_block_group_end(block_group);
> > >                                                                                                            ^^^^^^^^^^^^
> > > Dereferenced.
> > >
> > > d4452bc526c431 Chris Mason     2014-05-19  1204  	struct extent_io_tree *unpin = NULL;
> > > d4452bc526c431 Chris Mason     2014-05-19  1205  	int ret;
> > > 43be21462d8c26 Josef Bacik     2011-04-01  1206
> > > 5349d6c3ffead2 Miao Xie        2014-06-19 @1207  	if (!block_group)
> > >                                                               ^^^^^^^^^^^
> > > Too late.
> > 
> > I _think_ this check is bogus.
> > 
> > On one hand  write_pinned_extent_entries() gets called by 
> > __btrfs_write_out_cache(), which has the following comment at the top:
> > 
> > /*
> >   * Write out cached info to an inode.
> >   *
> >   * @inode:       freespace inode we are writing out
> >   * @ctl:         free space cache we are going to write out
> >   * @block_group: block_group for this cache if it belongs to a block_group
> > 
> > but then __btrfs_write_out_cache() is only called by 
> > btrfs_write_out_cache() which looks like this:
> > 
> >      ret = __btrfs_write_out_cache(inode, ctl, block_group,
> >                        &block_group->io_ctl, trans);
> > 
> > so iff block_group really is NULL, we'd have a NULL pointer dereference 
> > when accessing block_group::io_ctl.
> > 
> > 
> > Same for all the if (block_group) constructs in __btrfs_write_out_cache().
> > 
> 
> The zero day bot can't use cross function analysis because it doesn't
> scale to the number of trees which the bot tests...  Otherwise, sure,
> Smatch would silence this warning.
> 
> If we remove the NULL check here, should we also remove the NULL checking
> in __btrfs_write_out_cache()?  Otherwise there is still a potential that

s/__btrfs_write_out_cache/write_cache_extent_entries/

Sorry.

Anyway, you were too quick for me and have already done this.

regards,
dan carpenter

> something will complain about inconsistent NULL checking.
> 
> regards,
> dan carpenter
> 

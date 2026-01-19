Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2AA3502A1
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812962; cv=none; b=UuaLWUG24G2xF7BuZ1vYJug6whLJqbyCzunCnQOGb1vTi9SIJgrAAsjvX/Vo60let+DsUdMUPZfiWU9M04XtEYiv9RE8yE0zFp/MRJtKy5zAsIO+K/qilaSA4IgEVYk8LyibvzV/0b70jhCu2Y6zPQmLSdF5YlCF3y6OMyg/yiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812962; c=relaxed/simple;
	bh=yuzk4HCkmCLSzrI3p4aqbiLdRuxIs3CtoWGhU33hNLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6sNhi0NiMh+zg789ShRawyR9K6EHpsNEg8zKhiKOsJiaGCntkuwvoAYr9/glYDIlrJcFBjAz3J9JjVo0R0MjXiWVAQALSeHKWFRZc86AS46PpP5o6E/l3U5V5Sc+HzTCw6qFduMCpcYqsoftJqJP9RqpoHwOIIxecyX+sGzRi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DT0lr5TG; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DT0lr5TG"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-430f57cd471so2010323f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 00:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768812959; x=1769417759; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ltjz/smMzvjpsohpXR7hQ21/EDxVXQBbnheqC1Ei6f0=;
        b=DT0lr5TG13ED19DXFd1zF9GfiEd0CPYwd9hXh9lgETSvpX0Jmnq4n88vMSMOGpT2eu
         qgt1KngceRadeW3OtbcEWt79AgS3SZoRFxp6kJG9SGo9RhH3Gi/rYeImp29uba7ffKOu
         HoPZwp/ze8qnI8yYR3rhDluPStpWVzl6i4M7SII7y7Syzh6DgloHsPNX2MkAo1CozBc/
         /lRCQFDArrjrbRC7qv4EJmPTEqjrwqRXV56XBCMFDSHrgMlZcosAyJOhNQXeNiUzqPz9
         UVRjcpR2q8HP8RVQs56mwiX9fDw2KjUOI5OwPvl98tjryly3bkxo5X1muGY0uELsHQri
         8R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812959; x=1769417759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ltjz/smMzvjpsohpXR7hQ21/EDxVXQBbnheqC1Ei6f0=;
        b=uditvRUQAncLPhrlPHUxlLufZZClmsMCy1r1v8DgaByZbqWVAlFaKmZWYlEFOObmLn
         twXPicI8rFhIzfIAAE6oHtoe+XUl1V2oYL8Sx/odp1qvZHJpIsffeZELOB/nshXNlxPV
         zUklVjTX5KN96WVBYwzITVuaWybvd4TZaU/ngfy/G5re6kxG7vLrWtpGyIIP6uqMFpwv
         L3y1Zwl75X1nS9oN1GMqEEEZ04kS3Jyh6wpnAr58byGwU1JcXEwFPQsqiUA2rsptKIqx
         zbqTu3kSwiIeG1+oHyo0CLCdbtivF+YyBBKEatgVZe58Bc0jl9Gi2Fv8vvZj4PsXZawd
         Atew==
X-Gm-Message-State: AOJu0YxVdY5BdfRXYOccV0aKTf1mwpoOeQ1oqPnsW3427yhMBaWtyPnY
	82xzCOjgU5vCJPndTpy1+8B7145T9DMOu/bX0e1+LwntjPu9KXP5lW4B4gydOkao3Rk=
X-Gm-Gg: AZuq6aLm2pFg2glA7q7iJjsOmwXwRwlnzFiMB2t/E9vL6gUXezxFkfC35KtlmMA1tye
	f8m2vBQ5jOuKpC+oa/zavdyz8ZUz5m7JfXJdaGMz/8/s/OzWCHwMfrw9Ev09ItfmuVQRJSBXZac
	lwZpPrDw5Kqj4DFIfN7SssiT4gkQoQqwOKtFXpIz/5TixBQpgyD3yUfb737ypapiPSokruYML59
	c1EV1rHDvcaV389RWBsy6p0hoaHuDp97m/dH3BSuQrNuED6NeVU5o4XkMRu54oLvAlSiq81M9Ei
	ztvmVJDio4RBcUbxDr1FFmlaf6D3bgGa2BCrDgT2JydUJjdRDGpOJytD+KkTQtrplP/WdiJ2mfn
	pmSsQlnI2qRXLjFv8GHCzT4tcVr/V5sOjkXTlDiMQ684tVCbARZlCYkBRxOyRFOinuHL4Qwhtt9
	k2RlDheZSCuR/J1Fr7
X-Received: by 2002:a05:6000:2505:b0:42f:f627:3aa7 with SMTP id ffacd0b85a97d-4356a0298d8mr13122462f8f.16.1768812959229;
        Mon, 19 Jan 2026 00:55:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996e2d8sm21807525f8f.28.2026.01.19.00.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:55:58 -0800 (PST)
Date: Mon, 19 Jan 2026 11:55:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Antony Antony <antony@phenome.org>
Cc: oe-kbuild@lists.linux.dev, Antony Antony <antony.antony@secunet.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chiachang Wang <chiachangwang@google.com>,
	Yan Yan <evitayan@google.com>, devel@linux-ipsec.org,
	Simon Horman <horms@kernel.org>, Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org,
	selinux@vger.kernel.org
Subject: Re: [devel-ipsec] Re: [PATCH ipsec-next v2 4/4] xfrm: add
 XFRM_MSG_MIGRATE_STATE for single SA migration
Message-ID: <aW3xmwA9tTsWImwr@stanley.mountain>
References: <951cb30ac3866c6075bc7359d0997dbffc3ce6da.1768679141.git.antony.antony@secunet.com>
 <202601190605.ZVkgcUYl-lkp@intel.com>
 <aW3pnybMNWNlIRH7@Antony2201.local>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW3pnybMNWNlIRH7@Antony2201.local>

On Mon, Jan 19, 2026 at 09:21:51AM +0100, Antony Antony wrote:
> Hi Dan,
> 
> On Mon, Jan 19, 2026 at 08:27:25AM +0300, Dan Carpenter via Devel wrote:
> > Hi Antony,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Antony-Antony/xfrm-remove-redundant-assignments/20260118-041031
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
> > patch link:    https://lore.kernel.org/r/951cb30ac3866c6075bc7359d0997dbffc3ce6da.1768679141.git.antony.antony%40secunet.com
> > patch subject: [PATCH ipsec-next v2 4/4] xfrm: add XFRM_MSG_MIGRATE_STATE for single SA migration
> > config: hexagon-randconfig-r072-20260118 (https://download.01.org/0day-ci/archive/20260119/202601190605.ZVkgcUYl-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> > smatch version: v0.5.0-8985-g2614ff1a
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202601190605.ZVkgcUYl-lkp@intel.com/
> > 
> > New smatch warnings:
> > net/xfrm/xfrm_user.c:3299 xfrm_do_migrate_state() warn: missing error code? 'err'
> 
> Looking at this more closely, xfrm_user_state_lookup() always sets *errp 
> when it returns NULL.
> 
> > Old smatch warnings:
> > net/xfrm/xfrm_user.c:1024 xfrm_add_sa() warn: missing error code? 'err'
> > net/xfrm/xfrm_user.c:2248 xfrm_add_policy() warn: missing error code? 'err'
> > net/xfrm/xfrm_user.c:3018 xfrm_add_acquire() warn: missing error code 'err'
> 
> Also, as the "Old smatch warnings" show, this same pattern exists elsewhere
> in the file, most of the calls to xfrm_user_state_lookup().
> 
> I'm inclined to leave it as is rather than change a pattern that's 
> consistent throughout the file. Does smatch follow the code doing
> cross-function analysis? In this case, look into xfrm_user_state_lookup()
> and further down to see that *errp is set when NULL is returned?
> 

Ah, right.  Sorry about that.  Yes, of course, it shouldn't be
changed.

The zero day bot can't do cross function analysis because it doesn't
scale for the number of trees the bot tests...

regards,
dan carpenter



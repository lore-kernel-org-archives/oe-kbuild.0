Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC002EAF1;
	Sun, 22 Dec 2024 04:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734841096; cv=none; b=sy/noUIoi4f/nxVkVx0kYeGqApTjFa8PY/LaWuaWgDFtJ1zdTgcSpq3tTIAg9mIEwl6x/FtIpLSGxYPpf42slnNfkk0+CYE59ZKml3fGR4VIKyXjB+COrbxA0eOso95QSzXvRAqdkC6UIzn03WSCBh++p82A52ZRtTMtocNecg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734841096; c=relaxed/simple;
	bh=nHdT6ksks15eM1wm1Ux7TyHNRnsXf2HpPRbRj9HC37k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWqgxQbAdMxBTu1dG4rquu0/CCuwXGRtmpRZoqtAXvaKrnVT9m/58dsAZjeukymyrjFP5l79XDiBk+ywOBsPutPrSysqEog2SLcC9PPLoNNEeMCJ1MCRiHSGDDwrM2ugKXpd7+NUiP66wA+DKnqpHRdU/f7gZgPX+DMsfhzrQpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=LU2ZYV+Y; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="LU2ZYV+Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=D3IlLqcsq6XxJXELjtF4AW0cjaCnldl/H5v0AtIL0bQ=; b=LU2ZYV+YLatV7pW0SMya0TMGVV
	FPqkfcrFZONzHDge2tL02DGuI67YmXNxSVMwqvhqIG+4aT+zDOzGBVM31dnHRoiFc2lEby4BaqiYv
	Lld0TH0+W6d4giMrAAWso8EVFIY8JIAU5xcWlgZd2cZ1BUZRp8WJvnYWml8qTdDW5npDD25qzdrcm
	55LjxshNf7SuWOU9ALE7PvoADvNTimMwmU6oP6DyS9YB3iGF61gCsnosECITLsouLLBUkrdupwDkK
	d+p0lR6QNTfPrA8S2vHtd6gl7PTmfmdndMErtPFLSsggjTBuZ59AlU1W3W/8Y6ksPuJbjtsJznmzz
	oAh9vBRQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tPDCs-002UeG-0Q;
	Sun, 22 Dec 2024 12:18:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 22 Dec 2024 12:18:02 +0800
Date: Sun, 22 Dec 2024 12:18:02 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Akhil R <akhilrajeev@nvidia.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/crypto/tegra/tegra-se-aes.c:1596 tegra_cmac_do_one_req()
 error: uninitialized symbol 'ret'.
Message-ID: <Z2eS-r-HGWIR9gNj@gondor.apana.org.au>
References: <134e89a8-49a0-4675-8e07-4f257828f51d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <134e89a8-49a0-4675-8e07-4f257828f51d@stanley.mountain>

On Mon, Dec 09, 2024 at 09:24:49AM +0300, Dan Carpenter wrote:
>
> vim +/ret +1596 drivers/crypto/tegra/tegra-se-aes.c
> 
> 0880bb3b00c855f Akhil R 2024-04-03  1577  static int tegra_cmac_do_one_req(struct crypto_engine *engine, void *areq)
> 0880bb3b00c855f Akhil R 2024-04-03  1578  {
> 0880bb3b00c855f Akhil R 2024-04-03  1579  	struct ahash_request *req = ahash_request_cast(areq);
> 0880bb3b00c855f Akhil R 2024-04-03  1580  	struct tegra_cmac_reqctx *rctx = ahash_request_ctx(req);
> 0880bb3b00c855f Akhil R 2024-04-03  1581  	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
> 0880bb3b00c855f Akhil R 2024-04-03  1582  	struct tegra_cmac_ctx *ctx = crypto_ahash_ctx(tfm);
> 0880bb3b00c855f Akhil R 2024-04-03  1583  	struct tegra_se *se = ctx->se;
> 0880bb3b00c855f Akhil R 2024-04-03  1584  	int ret;
> 0880bb3b00c855f Akhil R 2024-04-03  1585  
> 0880bb3b00c855f Akhil R 2024-04-03  1586  	if (rctx->task & SHA_UPDATE) {
> 0880bb3b00c855f Akhil R 2024-04-03  1587  		ret = tegra_cmac_do_update(req);
> 0880bb3b00c855f Akhil R 2024-04-03  1588  		rctx->task &= ~SHA_UPDATE;
> 0880bb3b00c855f Akhil R 2024-04-03  1589  	}
> 0880bb3b00c855f Akhil R 2024-04-03  1590  
> 0880bb3b00c855f Akhil R 2024-04-03  1591  	if (rctx->task & SHA_FINAL) {
> 0880bb3b00c855f Akhil R 2024-04-03  1592  		ret = tegra_cmac_do_final(req);
> 0880bb3b00c855f Akhil R 2024-04-03  1593  		rctx->task &= ~SHA_FINAL;
> 0880bb3b00c855f Akhil R 2024-04-03  1594  	}
> 
> Is it possible for both SHA_UPDATE and SHA_FINAL to be clear?

I don't think so.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

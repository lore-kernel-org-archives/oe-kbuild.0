Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7119E21ABB4;
	Thu, 27 Feb 2025 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740652660; cv=none; b=TIYFyzG/3hbg+tIJddMb1M6WykoWxrfJ6Ejfs5Q662nnd5abluOphPwWLzr55oABoaARhmG7iVPhzyDIIaA7rD1MD2+CgCtS4gmgAQMv61NrRXfppVDEtmd5eXoX5YcArh0S34bSVdoAbfoGyqDV1reuJ1EXEHWw4KqBP+BDl3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740652660; c=relaxed/simple;
	bh=I9dKklxyFNF664Md3N2jWwyJHWcJwi2FHXhsKRO/MQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IomR+KZrwZh/6lNFRsp2Iwdq7IR+ddBSjXO6pMPT4al6w8QD9aa0hInAmQKHPKuM4L1FLD39G64/CHqG5QLXO1y/vf2QmmLGiUA/bA/lDmj7luszFJK8PSJwGbhezq9w5uayYnGvxr1vkHkHoDk+JEs4ybRnpU2eNlfHORkytu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CXXn/3r3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CXXn/3r3"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CC81B40E0200;
	Thu, 27 Feb 2025 10:37:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vNwpZb4ZqAF2; Thu, 27 Feb 2025 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1740652643; bh=EA2Jb7uHXeSEuvShYtviN4YfA7Xtkmqe/buArVOKHoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXXn/3r3LZ1bmmwiGE7szDOhyAEMqsiGtfJZaa+OkxYMH8trBrIuQGA7qB84Ur4R7
	 gm+SHIB/V/GkByBC+/TZKvGa9oz+oUklXFQMKKK/HeyD8P9vo9VOYf30zTHp35hGFB
	 SjvVuc4j64gMF4mXIED9f4lZclBErhNGW8MtzGdT1R9cfch/RzKrxavMV3WKGNRADx
	 4NZjmcE+M5fYAfLX+7OO/z6LrAZB1u7tcuEjJfjlKyrxlUOairrlORn1T2C1cYLvK9
	 DzP/fvekaxKHyAzVRmWW6vpmE5qgIw7B8xbgZBVvjWWF2tN7AhX0sLtaBbscRESJY5
	 IGG8g/C+yP15yoj87jqWb/jBt4Mo6Y4TW+Z1sapc93wpMBh8ypoMg9eVXPtlzsuUuS
	 Ffayk7n3fM+BSEhkVZO7C8P7/XHe+ybGOlREPk4dymSJzJxQGzI4zoXzRayFmD5CJr
	 sYRDKVkmh0wfvf2p3Gpl+epsB1BezCpvi/3MI4TLogIoO5urFAH1GfXQBOLwKrc9rD
	 LNWnehkE0D+SnqgMhDM5CPvCZB+HYzQuZDsbMkv8Wl/Ifafq1qIifcWSxd3ygz036g
	 VqVRFzpDSVOFQwD940+ofbo+IvdTZduD2h5hTYlAWfADLRVpKNuJf7HPunZZ/1G0CJ
	 Jrpk1G827pfHEbH1XTmocxlw=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0403A40E01AE;
	Thu, 27 Feb 2025 10:37:16 +0000 (UTC)
Date: Thu, 27 Feb 2025 11:37:11 +0100
From: Borislav Petkov <bp@alien8.de>
To: Shiju Jose <shiju.jose@huawei.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	"oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [bp:edac-cxl 2/5] drivers/edac/edac_device.c:705
 edac_dev_register() error: uninitialized symbol 'ret'.
Message-ID: <20250227103711.GAZ8BAV21Q5hVg_5uC@fat_crate.local>
References: <6036787e-1322-46ae-bd56-4a1e0d9966b9@stanley.mountain>
 <20250225145343.GAZ73Zd05zHax2bL02@fat_crate.local>
 <c07debded8ee4b60ab3408cdb83ff128@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c07debded8ee4b60ab3408cdb83ff128@huawei.com>

On Tue, Feb 25, 2025 at 06:27:42PM +0000, Shiju Jose wrote:
> Tested fine in the edac-cxl2 branch + following fix for the allmodconfig-x86_64-clang
> build error reported in the other thread.
> 
> diff --git a/drivers/edac/mem_repair.c b/drivers/edac/mem_repair.c index cbe5a722715d..6f4a9dfcd7da 100755
> --- a/drivers/edac/mem_repair.c
> +++ b/drivers/edac/mem_repair.c
> @@ -322,8 +322,8 @@ static int mem_repair_create_desc(struct device *dev,
>                 return -ENOMEM;
>  
>         for (i = 0; i < MR_MAX_ATTRS; i++) {
> -               memcpy(&ctx->mem_repair_dev_attr[i].dev_attr,
> -                      &dev_attr[i], sizeof(dev_attr[i]));
> +               memcpy(&ctx->mem_repair_dev_attr[i], &dev_attr[i],
> +                      sizeof(dev_attr[i]));
>                 ctx->mem_repair_attrs[i] =
>                         &ctx->mem_repair_dev_attr[i].dev_attr.attr;
>         }
>   

All fixes merged and branch pushed out.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

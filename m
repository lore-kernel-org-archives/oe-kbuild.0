Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3652149C42;
	Mon,  6 Jan 2025 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184034; cv=none; b=Jk+gqiMYgQqB9bB5eQbbOMaNvriaxsDw37nXuCpTlayY0JVaXItmOkxeR+VoPo0rJXqste8sVbu45M1OePYrzhE0I/+jYBpV6pi7UBJlt612zNR270KfOvKCyldwbjlYKAePjGAzxfNS31a9gUDzCkT6wCSrKBxAcU8u69y0t00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184034; c=relaxed/simple;
	bh=IEpcYaMf56C9Sf07BJdYcx7X3nhqLd4LLJNoDGAh5xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IWCv3LPc22DAJ5JQikzYRuJNLoFV0E0vcQNq15FbOAWrt42aC6B88Tm+szeE4YZNYvg8N+KgATZ4XEF1XPQyw1bYZdX++RpvhhViBe+u985J0/2oj/XjzPC2pnR9bfgeZi01r/CbpoX6bfYkQ0XeZiJtX8vGBqG/eJkaLf66Nwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=t16FDDu+; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="t16FDDu+"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 69CA1A06F3;
	Mon,  6 Jan 2025 18:20:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=T85dDHQcmfjuBtiWjIc3
	9bFlaSzOVCbF4UVEp+0Psck=; b=t16FDDu+lf+xIeulbOGCgYc/jrIFotdvmX0H
	mwSkvIJPpKf7TtvqJBNe/THAMQgEAP5yMpnRzfoVBmSbbuKamiAQyNcjbEZIL6IZ
	04jrBrDRzPoXrGW/UoV0OyARlK4Gig+KciOmNyLJiNXJlLsaKIDTzroEIDepB+iL
	+YnlsBJliWo2lCqKm2t2j8CT0ifXrtkm8WS8/1eiIt+SUOWT0mL/B5EZHOvCiTCR
	Sr7ide7oTrZXHdggaGc91mbHoE459yM02rmwOBsh5PGCgRbPO+A2ojfpmNbSujfr
	ZL0GaAg8YpCMBtLSx30x2t8ZEXCvsz4MuLpwQoju9Hhc/G+o3wapWxsnH/lvkTMS
	34Fc10IqLVFi7nxNPOwi8hWJm/ePlUNQTjJsZhGAeS5lUqXO9sVmHk4t6TmwBoz3
	tABO58GDqYV5y2EFDB9nEwLFfwGYMBCJCcDwiJ2xOQW//eo1AGv0l4tQtRMPWFR3
	hbbUbiZHpHaZ9w30A2PZkazJea6Lv6mR6nJWXg3Ooy4qZnkTGBlYcrcPWpw5bzDG
	Jbd3i0ZdlMY/7YfAwy7zLQoii3leO0bYvovynvxgdoAUzCiKSZ9S4G8WdAPKM7+0
	K3SATY/cn+qL95gFadUaO7L0AYejZXSgu+xJ+FAnjXW7Wbh9rEYNtv3Xwi4p9wDs
	bmHpZb4=
Message-ID: <f42ab0c9-2822-446a-9650-23372810de01@prolan.hu>
Date: Mon, 6 Jan 2025 18:20:26 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3636/5236] drivers/spi/atmel-quadspi.c:1282
 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'
To: Dan Carpenter <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>,
	Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Mark Brown
	<broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
References: <f3b27d32-1440-4585-9a78-cbd2fd47a992@stanley.mountain>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <f3b27d32-1440-4585-9a78-cbd2fd47a992@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852657067

Hi,

On 2025. 01. 06. 10:32, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> commit: 5af42209a4d23adc9a09e59e586d1b47fef3cc86 [3636/5236] spi: atmel-quadspi: Add support for sama7g5 QSPI

> smatch warnings:
> drivers/spi/atmel-quadspi.c:1282 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'
> 
> vim +/PTR_ERR +1282 drivers/spi/atmel-quadspi.c
> 
> 5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1274  static int atmel_qspi_dma_init(struct spi_controller *ctrl)
> 5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1275  {
> 5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1276  	struct atmel_qspi *aq = spi_controller_get_devdata(ctrl);
> 5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1277  	int ret;
> 5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1278
> 5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1279  	aq->rx_chan = dma_request_chan(&aq->pdev->dev, "rx");
> 5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1280  	if (IS_ERR(aq->rx_chan)) {
> 5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1281  		aq->rx_chan = NULL;
> 5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28 @1282  		return dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
>                                                                                                                                               ^^^^^^^^^^^
> The error code was over-written with NULL on the previous line.

It would appear so. I already have a patch that cleans up this section, 
but it is dependent on [1] and [2].

[1] 
https://lore.kernel.org/dmaengine/0d77f2cc-53e2-4aad-97f5-5dd449691944@prolan.hu/T/
[2] 
https://lore.kernel.org/linux-spi/20250106155416.1959803-1-csokas.bence@prolan.hu/T/

Bence

P.S. it seems Krzysztof has also patched this: [3]

[3] 
https://lore.kernel.org/linux-spi/20250104205437.184782-2-krzysztof.kozlowski@linaro.org/


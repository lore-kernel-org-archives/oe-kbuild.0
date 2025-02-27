Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995D622D4D3;
	Thu, 27 Feb 2025 12:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658075; cv=none; b=sht5p2yCykHIsiuRbKG5IVlH6XtDpJScZOaFoVi+oWBtgIlEkzs2oTEKV3zin4yoQDMlnI0OBXPaIG8+HYIgdwJjX9SbUf5HhlQuefNWS3ACZUT3vG4DbNR0RhLRYTgbOR9v77etCcCDyArGOqpvf/xLOXzDnwgetSzrOAL8JMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658075; c=relaxed/simple;
	bh=wPIMB12iOMQtN3E/WBhBs9pXJkQq87PCyFRceHGRt7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbO6CM+mYYGY6qeIz3yq9mnS2nX04D7G9goYR+eLzKcm3LXfOQm7BMA25i26G2ca5VEPxdv+mZXQsqOUUEdpgTmC5wo0e7gwerphmmlBTkyaXk0EU0n0l1ZulwdN14lO1gZdzfT2jarDDFMwz8Loz7Q175a2bOZYI99GbYIYDIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UQwCip14; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UQwCip14"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 916AD40E015D;
	Thu, 27 Feb 2025 12:07:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nj7oy8whuNSk; Thu, 27 Feb 2025 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1740658063; bh=19fFcoLskPNO+vmV6MKSx7gNSLQK6ZosgjjVMuy7UCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQwCip14AuLq5Wurzs+6KYy4EotFpJ5z0QK//pTC7wQHibG8ozIjeCyLhKz0/su/X
	 xdPRkTH3xic+pS4K1+tH2oQyEGmqoqMUligjwFa7MCb6VDmx20MYhqQqwreSglQxoA
	 j8V08KH6yy25JuvAZNy3lndWUh0sY/zYRbMfiagY6jwfH+OJ0MIvVtVTZrjjfFFjPh
	 RsQDKje0n+daHhQWqDGqJ97Sego1eC94AD5DJ6tvGRkum8GNlE60n2658hjFZRD2+7
	 HqBFQZxET3gT+m7bwxtGyf5mGAwPoM/YAJluKHiYqggKOSiHPTLuaz9PIOgX+/+rzL
	 fCBGqfInd6bAHL+6OBpY1Gz1SZfPKxbxfDLKrlOJwZst9sXdELnG9gldV9R2rTFTDU
	 snaY/kFpgQNHcr/3ZGXXXqpQMK9JmzMJ65xz6fLxD3MT77RI2gmJU2mH+RidwAUXOm
	 IucwImkquSCH6AfcyHNilKuod+1E/I/PFGXu5hzrhna9LkTxbKV7sAz+FoRmkgPTR9
	 xBJNyRHpSXREcZdL2yAPP8koAeWFag1h3cvdg4bKf7uS8qqiRxvJv8UQEGrpySdk4h
	 4ond0R86mtYwEpyQAIVChDpIbTE7KapDMvdIgmzqsvJBRYp1KhXJNiSQ/dcvLYtZg3
	 O61E01zguspeL2pEi+oEod9M=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E104940E01A1;
	Thu, 27 Feb 2025 12:07:36 +0000 (UTC)
Date: Thu, 27 Feb 2025 13:07:35 +0100
From: Borislav Petkov <bp@alien8.de>
To: Shiju Jose <shiju.jose@huawei.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	"oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [bp:edac-cxl 2/5] drivers/edac/edac_device.c:705
 edac_dev_register() error: uninitialized symbol 'ret'.
Message-ID: <20250227120735.GCZ8BVh3_eZo_WgcdR@fat_crate.local>
References: <6036787e-1322-46ae-bd56-4a1e0d9966b9@stanley.mountain>
 <20250225145343.GAZ73Zd05zHax2bL02@fat_crate.local>
 <c07debded8ee4b60ab3408cdb83ff128@huawei.com>
 <20250227103711.GAZ8BAV21Q5hVg_5uC@fat_crate.local>
 <dce8f7b973ff484c8a854fbb093a9e4f@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dce8f7b973ff484c8a854fbb093a9e4f@huawei.com>

On Thu, Feb 27, 2025 at 11:57:40AM +0000, Shiju Jose wrote:
> Thanks Boris. Looks like the above fix in the drivers/edac/mem_repair.c is
> not yet in the edac-cxl2 branch.

https://web.git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git/log/?h=edac-cxl

This is the official RAS repo of Tony and me where stuff gets staged.

The URLs I was giving you were my repo which is used only for testing out
things.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

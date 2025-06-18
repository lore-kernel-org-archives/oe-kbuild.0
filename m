Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27462EBBAD;
	Wed, 18 Jun 2025 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750271751; cv=none; b=LKYm0VAfc5H5c7V2B3dk1OCvs107KbCHJjv6d2sNVN/Y9yAwHIPvmi/rCJI4Ca1WoboaLunlXI7FU00Wces1nNtBPnSm8RYdWmKREXIrbn2TnwyVBd0r6jl8Xe+6iZSk8QKfXaAw62wmc88vQzQ+l9Dl4CuL1xyS1SM2c8ux4fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750271751; c=relaxed/simple;
	bh=J7M5jNlhStqkykWnwfxVLYzGZgw20yphigNT3C4pwsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M1lKGWe+TjyOsvNHRox9CE+n2Mv+tdHwKbWzz3LdsjrvQOdsZHmv9/gHFRU/Mu3siOPyU9hG0Tj+OKTf6T5qCpVC9fBTYEMexgKei5mSgMJUEqxCtgjbiPZLx3fAZ75ZJyvZBRC8pKDPTBOTK5zawgfuDUxaWtoMI5FooN32hRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhPSwY+/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhPSwY+/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13360C4CEE7;
	Wed, 18 Jun 2025 18:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750271751;
	bh=J7M5jNlhStqkykWnwfxVLYzGZgw20yphigNT3C4pwsQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GhPSwY+/x/oQMolURdGQwDt2MhD44XD3QSnEbVuVDmghHyFbHpiBfLvHEjXZZVi0K
	 cDBZ8BxwPN+gJqAwwGc+ei8HXvJFwtT3IFsH8LGGpQauz5wa2mHzXOyx7ynwXb/ZJQ
	 U5p5xpQTTqoZmy2aV1ye6TGtFCTVIJUEsEnvWGkO8v8gAhM4Ec4DKwIBtsX/nB3RFV
	 tCxYEorhK/dK7FpKU5/gFOM/eKHly8uoJ3Q6wlRUF++SNlPz/hY5P2oen6U3kfXynp
	 2pLCDtweEXWQikGiIhKilmCIl9SZWKra5XisoWr1v1cBej7dBHBFn8Zxy0D9zs6xJY
	 yRfR+jK0zkEtA==
Date: Wed, 18 Jun 2025 11:35:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 4/9] net: ethtool: add dedicated callbacks for
 getting and setting rxfh fields
Message-ID: <20250618113550.3033f500@kernel.org>
In-Reply-To: <b6f46ab5-ea6e-4e4b-a308-0bd18f2777a7@suswa.mountain>
References: <20250611145949.2674086-5-kuba@kernel.org>
	<b6f46ab5-ea6e-4e4b-a308-0bd18f2777a7@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Jun 2025 20:25:24 +0300 Dan Carpenter wrote:
> 65107e14ebb8971 net/ethtool/ioctl.c Jakub Kicinski  2025-06-11 @1530  	if ((!ops->get_rxnfc && !ops->get_rxfh_fields) || !ops->set_rxfh)
>                                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Imagine ops->get_rxnfc is NULL but ops->get_rxfh_fields is not
> and also ops->set_rxfh is not.  Seems unlikely...

> 3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1591  	rx_rings.cmd = ETHTOOL_GRXRINGS;
> 3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21 @1592  	ret = ops->get_rxnfc(dev, &rx_rings, NULL);
> 
> Then this would be a NULL dereference.  There is no way we succeed
> when ops->get_rxnfc is NULL.

Ack, thanks! There is some compat code here that will be gone once 
I convert all the drivers (hopefully by Friday). I'll fix it when
removing the compat.

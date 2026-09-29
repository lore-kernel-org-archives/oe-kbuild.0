Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E669569F1D;
	Tue, 29 Sep 2026 19:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711315; cv=none; b=NBu1EjV7gTD861B1HAlfbgfdOW1D5m4Ww86FNWp4yW2AY9TKLtBVX8q7O2eIc5y7eqq3GKes1Gv8qkgk+E5kLkASzHQUqau5vE2kkBWIOWBc3h2hCZShdlIkNbB9oHgh/MVHWyCftni7RBGbGKLDzOpA5IKIiqAZ/CVHOPj+vQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711315; c=relaxed/simple;
	bh=x2HBXj7BphhLV/5zf9OMiBld4v5xmycaFT6YzFzXDOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRLfDYA8ogRdZbCf8xDem830UJTqbxewmPQt15AagCXYxf5FBjqC5H+SuBH/BOfletzb5n+LGIWKaWnpq3JFjfb6hMOToNHQWz30TQUVGaNkArXKWpC4xx6/Lpa5NoQ3u68j8w2Oa4gP9IQBwPr2P4rH1wo5/0ONQSomzs7bZYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=nMcl27hm; arc=none smtp.client-ip=212.27.42.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="nMcl27hm"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:fd38:7b91:be5e:6aee])
	(Authenticated sender: vjardin@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 800125FFB1;
	Tue, 29 Sep 2026 21:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1790711303;
	bh=x2HBXj7BphhLV/5zf9OMiBld4v5xmycaFT6YzFzXDOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMcl27hma7267u99G1Xm803mZveu0PybXpBS8ey/9gh6wValqug61FOMWGalr5wSx
	 L2enfpZwvY7WQ3vPjyXHO1wo56MPFtU2LQcW+cTizbhfZtqLa0oL+UUPL59IZD3/1k
	 E6r1fkQuC5e+SwCdU0D+8Ovxi4L2QZ8RUGKQnr/ewJDmgvIgJHbJyIZpUaNllThOe1
	 CDkJ/BYyaG1m0gxaW0VHtLRnzm0BXcENk7bf5gUyvw16wSAYDdaRjCnpWv/f2IEaUi
	 Q11e/sBTsKEinpRdYUArHUyPaEIaEG96SroLxWPqHNFRwR674B4rvz5MIKn63/Djh+
	 6Qjl/ucclF32A==
Date: Tue, 29 Sep 2026 21:48:18 +0200
From: Vincent Jardin <vjardin@free.fr>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev
Subject: Re: [frank-li:imx/dt64 65/103]
 arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtb: gpio@2310000
 (fsl,ls2080a-gpio): 'pltrst-hog' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <arwWAqkwvlf79z45@L30177.local>
References: <202609291726.iogWKGg7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609291726.iogWKGg7-lkp@intel.com>

On Tue, Sep 29, 2026 at 05:36:04PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
> head:   8c40f32361d566c0882e9d92abab36256b268291
> commit: 565b6713a460126874d15654fe24d995a57c822b [65/103] arm64: dts: freescale: add Nodebox v3 CPU Module
[...]
> >> arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtb: gpio@2310000 (fsl,ls2080a-gpio): 'pltrst-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
>        from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml

It is the dependency mentioned in the cover letter: the gpio-hog child
nodes are allowed by

  78c0baf85cd0 ("dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes")

which Bartosz applied to gpio/for-next, not to imx/dt64. The warning goes
away once both trees are merged for v7.4-rc1, so nothing is needed on the
imx side.

Best regards,
  Vincent

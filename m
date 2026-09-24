Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202C2470426
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248114; cv=none; b=sXREDxHfD3di/NbL4u77GLm6A+YSzXtcnE9I+nUoB3HqLOrKxBRyUrHQZ/WdvFuCx67cKx4vo4xqUSXl2tA8220noAurZo0zASqZ7IxzU9Fp6HwN8HX7i0eFANK2/nUnKR98JyTQEyZdd5kZoHgAX3UsNrEE1AdCMS8BY1If1S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248114; c=relaxed/simple;
	bh=kFbSDumNJTXlL81TTN1kiojN7qGyUYFrDLAscfk5BQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcwsprQ4YO+jvpSWi4OI8sycbwMMNRDaMo11VbOMfe3ozb0VxunNBUgOLws7lfhVnA479Sr411drkvlDSBwL9X/XVLTUGp9QtT15gZpKLVVpz6p95qkq4nCNUFlSdcdqNVdq7tI8H2vK+k6xY1pHx3bH4fjlraDDHaEZSF6mc4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zCgkQ3ZP; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zCgkQ3ZP"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CEBDF1FB47;
	Thu, 24 Sep 2026 13:08:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790248110;
	bh=Jwvwsq8/X2Egsod1sWS+QXfvybmFWaO6PtP2ky21CRA=; h=From:To:Subject;
	b=zCgkQ3ZPIXHtE1efIS0wACoD7Nk5+ugSaprSn7fVsfeTmirNYMZVFYdONR+aeBhTH
	 BypmlXVf6qm22za6IqRxR4HUzG64i0f7dU4J+1leI57JXB31RxFWmDdVnXZpjUMjDj
	 4ARNW9BNYje/BLE45AgM5ZwONXQTJB1eE7H15KsuZ09LmTNUcW4hVaR+plvZrqOr4x
	 RQRUT62HLSj+qJvKsbXB72tfZjpmqo8zM7ir1HKx2+GtCpag20CEITQv5xUqjzbM7s
	 Okp6hHhCbDwz5xt3lnSAmCFfcvCJCnd5n0mA5HVTHc5FASECeG/JFRScTLTYf31v7d
	 4PXTcZS7FCY7w==
Date: Thu, 24 Sep 2026 13:08:25 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: kernel test robot <lkp@intel.com>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p5-verdin: build zinnia dtbs
Message-ID: <20260924110825.GA59943@francesco-nb>
References: <202609240500.IrPqcYL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609240500.IrPqcYL6-lkp@intel.com>

Nishanth, Vignesh

On Thu, Sep 24, 2026 at 05:07:54AM +0200, kernel test robot wrote:

[...]

> dtcheck warnings: (new ones prefixed by >>)
>    	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
> >> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dtb: memory@9c800000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)

This is coming from k3-am62p-ti-ipc-firmware.dtsi, it just happen to
be noticed on this board for the first time because it was not build
by the bot before.

Francesco


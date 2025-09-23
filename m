Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE631E888;
	Tue, 23 Sep 2025 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758618439; cv=none; b=B4K1O9YJU/VvwAACarINLD7ZfNmAL0QpHiTlRqzAls+rKrh5W03JZ7DIPlmvEMdX8vkZ+DwckiMeqYk9juxgNHWJ2mItx95e9LjMKluByY2/vMLcVsf/wQUxQ+VXvKyRkSfrkGgQrpW8nX85oy712Ld1vv8N4qxKS1xlB0DtfYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758618439; c=relaxed/simple;
	bh=dhXEPgsBK+GvW9IrpnbQ/Olpln40iiFo0p9WPqLhTGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckwuknTBF/AcGJMLbf5o+CTpywAdO1PlwgN02I1mreBSkQVmMe462jGYO/VfzEDmZFeECfQeNpWLLZTfTBpB6AKBifMKmxj5PPyAh1i0HLm3AKfjeKEQIjZFF/bT/NPM83KOApM2XOIWou4BWr442Pv5xy+Fvek9rqQ//lMfO0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAJgVe3z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAJgVe3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1382C4CEF5;
	Tue, 23 Sep 2025 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758618439;
	bh=dhXEPgsBK+GvW9IrpnbQ/Olpln40iiFo0p9WPqLhTGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gAJgVe3zzA14Z10X9t6nDnxyUAbX04WAM5naygnt3UAF6HSiiiLjhdr8lurR8vncD
	 z7X8tX38EYXvBTVjpTuhYGlqIt9mT6AW2bBhcXmFcUIbyZCnvSZe8Nn2F9R8yRERYK
	 nkFnobjcPiPQFgEd/0OfLAhl7XG+PwznugZIIni36fGlpRON++fsQ/kFiC+/eMUpRo
	 ucpwci7rXNdoYRdrIRzJbeHhZ9ByRIPKOxD5EpD2PGlyg7CqCMcaFKv8od/f7/Q+n3
	 q6hr01vJL1miVBWG/S8GqQj2agGY3HBNqYD8PbZUXp694JX2BRsLDfGL7exeLg75h4
	 jHPeTpW9XVGpg==
Date: Tue, 23 Sep 2025 10:07:14 +0100
From: Will Deacon <will@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <aNJjQkj70kCArFf1@willie-the-truck>
References: <202509231223.gZsX6Eio-lkp@intel.com>
 <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
 <aNJZ6SqYvBfjZlrZ@stanley.mountain>
 <aNJbxj55fEgutUPn@willie-the-truck>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNJbxj55fEgutUPn@willie-the-truck>

On Tue, Sep 23, 2025 at 09:35:18AM +0100, Will Deacon wrote:
> On Tue, Sep 23, 2025 at 11:27:21AM +0300, Dan Carpenter wrote:
> > On Tue, Sep 23, 2025 at 12:55:01AM -0700, Ilkka Koskinen wrote:
> > > That's cleary a bug and I don't know how I missed it.
> > 
> > Because we disabled uninitialized variable warnings for GCC and because
> > everyone has CONFIG_INIT_STACK_ALL_ZERO set so it wouldn't show up in
> > testing either.
> 
> The more annoying thing is that I run smatch on my tree before pushing
> but somehow I didn't notice this. I'll run it again to see whether it
> detected it in the first place...

bah, there it is:

+drivers/perf/dwc_pcie_pmu.c:418 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'. [smatch]

so not sure why I missed this. Maybe I used the wrong .config (this
driver isn't enabled in defconfig).

Will

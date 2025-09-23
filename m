Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C2F2701CF;
	Tue, 23 Sep 2025 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616523; cv=none; b=oLN4pTUdx+fpcRNiE89szriwdVnSKJyLYjkKWGOTyEJ0Cd/K8iBDhctnt5LN1yxnk8r/Pyhi2PpNQ4TsvyKCnBKti3dtyuzv6FHoABd3bzxn4iF78AwOYBHwgZa/ljs6RMn7k7+PFj4KIO5MRw+WHgvswMbD6g60J8p6+dK6hHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616523; c=relaxed/simple;
	bh=+rRxUkZspQylYOU643PlOSIkzkgXe3gEa5Qgh0Ams44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OP3UuGIc0mwhApu9kVZv56h9F28CT9jkTKiDlqfKBCMRnjFlCcjvqICLYT+M6ZMQSiwAwTiH45NNGBE9zzqMkWMcmy3+DSWij0MTO2aZpaTbbRdRziCqVueos+j/AOM7fAn4cimaMk1VlExx9bd62J3baga7ckhwa8HjmaQ/R1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHGYI3Ew; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHGYI3Ew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A21C4CEF5;
	Tue, 23 Sep 2025 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758616522;
	bh=+rRxUkZspQylYOU643PlOSIkzkgXe3gEa5Qgh0Ams44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHGYI3EwrOgfDnYsZPAngBO4cZRbkx31coOrmnbE/GCrRy1EpezDwwo4hz2F8r+4M
	 mfxCehwPJKRDFVZmUoB58RWgDNM/6D1Z7odutzxs3uBHCy1nT5uWrEQDIZ+NDdaLMa
	 ZbrfcPYysvXSdnMJpJewzOd+LAZXc8PPv2GUDJ/6qMuW7R/BF0eCYaonj66B4x6vj4
	 BrSrrKvN7X3K7PH6fcohh+wdBHLyuRO7vyl+MkG29isHid4fX/skSscxm9hplK+HgB
	 WZD/J2infr5N74WE5hXtEWrFY/AimcxV3M1kgmk9er7iwhXnTio5xVLsEtsxTScvwz
	 w2ikAQHpZVQdQ==
Date: Tue, 23 Sep 2025 09:35:18 +0100
From: Will Deacon <will@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <aNJbxj55fEgutUPn@willie-the-truck>
References: <202509231223.gZsX6Eio-lkp@intel.com>
 <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
 <aNJZ6SqYvBfjZlrZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNJZ6SqYvBfjZlrZ@stanley.mountain>

On Tue, Sep 23, 2025 at 11:27:21AM +0300, Dan Carpenter wrote:
> On Tue, Sep 23, 2025 at 12:55:01AM -0700, Ilkka Koskinen wrote:
> > That's cleary a bug and I don't know how I missed it.
> 
> Because we disabled uninitialized variable warnings for GCC and because
> everyone has CONFIG_INIT_STACK_ALL_ZERO set so it wouldn't show up in
> testing either.

The more annoying thing is that I run smatch on my tree before pushing
but somehow I didn't notice this. I'll run it again to see whether it
detected it in the first place...

Will

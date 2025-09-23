Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D88A31CA5A;
	Tue, 23 Sep 2025 08:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616197; cv=none; b=AZ7MeIiEKhlkmdk4L+fqlZbqQSa2dLunNDl8u71Z/13zBEFv/iNZpF7Zo8vYzMdL+kvX87zwY0uSsiwCi06xKqhF+Eh3DbvBZ9X5ojYY1wl4DqanYRzePqzgQ3h1Nz0ZYCqHlf0M5Mf5z5/dHEwiV6oZfS2m1kpfbAxmDNHTxic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616197; c=relaxed/simple;
	bh=CKqFdA8GHYXfFUOGldnkZyW68C95ycj/6y4+MPEn6QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJrc8tRE/BN8fW8sYvqLuQQKNPU3+DGg3fx8Id0qM2c9j5zGLz3TxiedGFVCKVgAjtyDI4TXQ9Q72VXjVI4aHgKUoGrdePFgVUSbCkRfsKMRGwCR5llVCQM/VB6ucNHjDFW8EanIksWPB6eFiGkuQjgPgMnx6U9KV1Z+bPZBGFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6kdpA/8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6kdpA/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954B6C4CEF5;
	Tue, 23 Sep 2025 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758616196;
	bh=CKqFdA8GHYXfFUOGldnkZyW68C95ycj/6y4+MPEn6QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6kdpA/8R69LG8IHWPX0RCknKW1LmJSlhB9gYPcB6Nm8mLNv8djI5Vf23hKcWY9UY
	 Q8rucrPzn/VXJb7lVBeGkarBlb/LdFqly7R1BXRnMYAhBCErj60ohHgZIbsFHq0Icw
	 PrBsSkQjboPTHoFPklVBneY/Px+oNwbpo2Z0TSfGVCTex0SowlHfoekWbm2oCIi9mR
	 Ur22S8z5ylr8l+YfHMnauz8bt4VnjQ4MoyhcRoZmLXdftDiLsoWsb4zh0nXnGKXGpJ
	 bLJrWdMn5sHwMvkouzEM9ZJCgyZJdzFUS3rd0CwGAQJD2a7mqFMVW5PmkyxAJPju+q
	 otGiBTH96Pcvw==
Date: Tue, 23 Sep 2025 09:29:52 +0100
From: Will Deacon <will@kernel.org>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <aNJagMeldVo6cML4@willie-the-truck>
References: <202509231223.gZsX6Eio-lkp@intel.com>
 <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>

On Tue, Sep 23, 2025 at 12:55:01AM -0700, Ilkka Koskinen wrote:
> That's cleary a bug and I don't know how I missed it.

Don't worry, these things happen. As Dan pointed out, it's hard to catch
this in practice anyway (and the robot is doing its job for us).

> I can submit a new version or a separate patch to fix it in the morning.
> Which one do you prefer?

Please just send fixes on top of for-next/perf, as that is a
non-rebasing branch.

Will

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF472FC02F;
	Fri, 16 Jan 2026 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576520; cv=none; b=i1v8YhWjSa+RXzU1VTInXEjCaG8r3DnJso8RE6kW1gcNZX24/zol6ZoM1O0UIHtilxq/KYXMDGPsVQSuacmOBWJsMtYM6tdPoWlk5Ey0JJELZR2xcXH/eo+pMrt14xhunGFc5wXwdBiNLsWY3Uvc3Mv4wfjq25JdNREQNTHc9pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576520; c=relaxed/simple;
	bh=m5fqoUV7+zi5SIzMYxR79fyX75qr1dY3dNkiNSMu6cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chydTBeYm9TsvJfWw2njuoCHuj4TwKtP1C4RoxLuCoM/bcJCnpN6vgFeoloA6+z9iaWkHG0b1xOnFjq0TfVTJBGEQqPV3nPwJh1VArnP4E6kffwyOyHWBgOYxu8S/JtvHjxUtwBCgx4ZWqbTG4HepZOhFERLNBE2njw24AJ+3Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W1NOzyRQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W1NOzyRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4E5C116C6;
	Fri, 16 Jan 2026 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768576519;
	bh=m5fqoUV7+zi5SIzMYxR79fyX75qr1dY3dNkiNSMu6cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1NOzyRQxyrf2nRHSku4jC1Mf27g8UQ8tZCSwZhjJRUnZYwBUwdFbmCJefTEE5B+/
	 oz/JGpsNLmuVoqIRtAt9tBPU4iM4D40Ya7BZZOIu1QTXTE/u304lwof2DOXdTv5gFb
	 LHGnPTbOrwvLgM0QQIEXQNWgNxtJcPPDtyUNwwTw=
Date: Fri, 16 Jan 2026 16:15:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: dan.carpenter@linaro.org, oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] uio: Add SVA support for PCI devices via
 uio_pci_generic_sva.c
Message-ID: <2026011643-coastline-playtime-0ac5@gregkh>
References: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>

On Tue, Dec 23, 2025 at 12:54:09PM +0800, Yaxing Guo wrote:
> This patch introduces a new UIO driver, uio_pci_generic_sva, which
> extends the functionality of uio_pci_generic by adding support for
> Shared Virtual Addressing (SVA) when IOMMU is enabled in the system.
> 
> The key enhancement allows PCI devices to directly use user-space virtual
> addresses for DMA operations, eliminating the need for bounce buffers or
> explicit IOVA mapping. This is achieved by leveraging the kernel's IOMMU-SVA
> subsystem, including process address space attachment, page fault handling,
> and shared context management between CPU and device.
> 
> With this driver, userspace applications can perform zero-copy DMA using
> native pointers:
> 
>    void *addr = malloc(N);
>    set_dma_addr((uint64_t)addr);  // Passing user VA directly
>    start_dma();
> 
> The device can now access 'addr' through the IOMMU's PASID-based translation,
> provided that the underlying IOMMU hardware (e.g., Intel VT-d 3.1+, AMD-Vi,
> ARM SMMU, RISCV IOMMU) and platform support SVA.
> 
> Dependencies:
> - CONFIG_IOMMU_SVA must be enabled.
> - The platform must support PRI (Page Request Interface) and PASID.
> - Device drivers/userspace must handle page faults if demand-paging is used.
> 
> The implementation reuses core logic from uio_pci_generic.c while adding
> PASID setting, and integration with the IOMMU SVA APIs.
> 
> Also, add a read-only sysfs attribute 'pasid' to expose the Process Address
> Space ID assigned by IOMMU driver when binding an SVA-enabled device.
> For details, refer to the ABI documentation for uio_pci_sva driver sysfs attribute
> (Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid).
> 
> Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
> ---
> Changes in v4:
>  -- Fix the errors about 'udev' could be null and double free that
>     reported by: kernel test robot <lkp@intel.com> and Dan Carpenter <dan.carpenter@linaro.org>
>     error report: https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/

Where is the changes from previous versions?

> +++ b/Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid
> @@ -0,0 +1,29 @@
> +What:		/sys/bus/pci/drivers/uio_pci_sva/<pci_dev>/pasid
> +Date:		September 2025

It's not September anymore :)

> +module_pci_driver(uio_pci_generic_sva_driver);
> +MODULE_VERSION("0.0.01");

No need for a module version.

Ah, these are all just minor things, let me go queue this up now, can
you send a follow-on patch to make these 2 changes?

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81166242D9D;
	Mon, 19 Jan 2026 06:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804754; cv=none; b=Yte60rTT1Mx5TFv7FxgKLaponbAY/TkJ+mwcV5QnMVLTDfGiE3HWAMizKrmi0SKqwC9QobXjz1jjAN3ggp+lcdD9TPd/4kZFDgwKtyRQI9MYSduXgFmKZyyCIfyr0VT1o5ImFKkTWSmLvzBC4A9ZLhpHctBt3TQXb+4o0owaF1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804754; c=relaxed/simple;
	bh=IgQG4JO5+xJM4DwRXkVjippDTRc20JSs8PVcf6pgJoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKjtxqN6J6n9ldwULspFUfd891WoF3aZFvgJkDb88ZJbPmIdEymW2jq89+06GNtEnU52hPlvY6XT+i9BPZ1R29fPNJxLmL6jw/ofBnQ6Qgp+HUNq5sr7bEeNaUwyqUf74LM8jvfT2PSe2V3Maj/y/ZMolVaJy9gdrwA+VBAKsI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KTGuJnt2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KTGuJnt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E3EC116C6;
	Mon, 19 Jan 2026 06:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768804754;
	bh=IgQG4JO5+xJM4DwRXkVjippDTRc20JSs8PVcf6pgJoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTGuJnt2WYf+n6ioXznpDtogqFQZE0kPaA4zfhaM57pIOa+abEmmjjKeNYOn8b+Np
	 GIfP4CTuqDo94pjNCz/eaH1LvhSbMudVfjnRFshZ2FYAJmnNlMk4gGo+D6Z/bfaGLo
	 BkY3acKLpVt48PhYwQ2UipLRatSGHX2JUabIJXsg=
Date: Mon, 19 Jan 2026 07:39:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: yaxing guo <guoyaxing@bosc.ac.cn>
Cc: dan.carpenter@linaro.org, oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] uio: Add SVA support for PCI devices via
 uio_pci_generic_sva.c
Message-ID: <2026011942-print-impending-ab86@gregkh>
References: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>
 <2026011643-coastline-playtime-0ac5@gregkh>
 <2026011603-dorsal-unblessed-cdb2@gregkh>
 <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>

On Mon, Jan 19, 2026 at 02:16:21PM +0800, yaxing guo wrote:
> 
> 
> 在 2026/1/16 23:16, Greg KH 写道:
> > On Fri, Jan 16, 2026 at 04:15:17PM +0100, Greg KH wrote:
> > > On Tue, Dec 23, 2025 at 12:54:09PM +0800, Yaxing Guo wrote:
> > > > This patch introduces a new UIO driver, uio_pci_generic_sva, which
> > > > extends the functionality of uio_pci_generic by adding support for
> > > > Shared Virtual Addressing (SVA) when IOMMU is enabled in the system.
> > > > 
> > > > The key enhancement allows PCI devices to directly use user-space virtual
> > > > addresses for DMA operations, eliminating the need for bounce buffers or
> > > > explicit IOVA mapping. This is achieved by leveraging the kernel's IOMMU-SVA
> > > > subsystem, including process address space attachment, page fault handling,
> > > > and shared context management between CPU and device.
> > > > 
> > > > With this driver, userspace applications can perform zero-copy DMA using
> > > > native pointers:
> > > > 
> > > >     void *addr = malloc(N);
> > > >     set_dma_addr((uint64_t)addr);  // Passing user VA directly
> > > >     start_dma();
> > > > 
> > > > The device can now access 'addr' through the IOMMU's PASID-based translation,
> > > > provided that the underlying IOMMU hardware (e.g., Intel VT-d 3.1+, AMD-Vi,
> > > > ARM SMMU, RISCV IOMMU) and platform support SVA.
> > > > 
> > > > Dependencies:
> > > > - CONFIG_IOMMU_SVA must be enabled.
> > > > - The platform must support PRI (Page Request Interface) and PASID.
> > > > - Device drivers/userspace must handle page faults if demand-paging is used.
> > > > 
> > > > The implementation reuses core logic from uio_pci_generic.c while adding
> > > > PASID setting, and integration with the IOMMU SVA APIs.
> > > > 
> > > > Also, add a read-only sysfs attribute 'pasid' to expose the Process Address
> > > > Space ID assigned by IOMMU driver when binding an SVA-enabled device.
> > > > For details, refer to the ABI documentation for uio_pci_sva driver sysfs attribute
> > > > (Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid).
> > > > 
> > > > Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
> > > > ---
> > > > Changes in v4:
> > > >   -- Fix the errors about 'udev' could be null and double free that
> > > >      reported by: kernel test robot <lkp@intel.com> and Dan Carpenter <dan.carpenter@linaro.org>
> > > >      error report: https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/
> > > 
> > > Where is the changes from previous versions?
> > > 
> > > > +++ b/Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid
> > > > @@ -0,0 +1,29 @@
> > > > +What:		/sys/bus/pci/drivers/uio_pci_sva/<pci_dev>/pasid
> > > > +Date:		September 2025
> > > 
> > > It's not September anymore :)
> > > 
> > > > +module_pci_driver(uio_pci_generic_sva_driver);
> > > > +MODULE_VERSION("0.0.01");
> > > 
> > > No need for a module version.
> > > 
> > > Ah, these are all just minor things, let me go queue this up now, can
> > > you send a follow-on patch to make these 2 changes?
> > 
> > Wait, I already took this a while ago, why was this resent?
> > 
> After the v3 patch submission, I received error reports from Dan Carpenter
> dan.carpenter@linaro.org and the kernel test robot lkp@intel.com (see:
> https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/).
> In response, I’ve submitted a new version (v4) of the same patch, which
> primarily addresses the issues highlighted in that report (as described in
> the "changes in v4" section of the cover letter).
> If there’s anything improper in this process—such as resubmitting instead of
> replying with fixes or other procedural concerns—please let me know, and
> I’ll be happy to correct it accordingly.

Yes, please submit fixes for your original commit that was accepted.

thanks,

greg k-h

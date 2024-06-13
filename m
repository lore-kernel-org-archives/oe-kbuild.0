Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D10137C2F;
	Thu, 13 Jun 2024 06:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718259487; cv=none; b=oJo5VGDHyAWK1WwPWBOxPwlRKQt1bOlsprpX8uPJmhE1NhIgLVw1uNW+Ap4OS2kOG2pDEpHpfKlqjQ8c1AzdaYADKMHdbkeV0lNoCVAczfCAmNU48m7qCfbffs2wguEl0vPT+hpWoExBA3qR4dCMCzdk3sfx38Be0iz5rtWxt+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718259487; c=relaxed/simple;
	bh=MTy9hwhmGCWEt2iGEMq2oefZrzkfkI/BuA+ZwXLoKMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qitbz4SYfLq//cFg4+YBWEQ2g57w9j9fFaY7CyIpHRqhZ7Vos5VFZnwgWEt416/umNpxvujmDmPnujmZxicFcZ/gfarFmNLp5VbYiurBTCkGSZKB1vUgCDM/Zcl68cq9AGm/9s1MDkPwncpUNa4oltdha8p8gJxVpOdiGi3O1E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o7FXV2OF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o7FXV2OF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C4BC4AF50;
	Thu, 13 Jun 2024 06:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718259487;
	bh=MTy9hwhmGCWEt2iGEMq2oefZrzkfkI/BuA+ZwXLoKMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7FXV2OF8Oy2mRJ1+OVqnNFPJ3qi+pucSFNjTZzd4FYNnY9fhLvtnV4YwoG/9aHQy
	 sYndyak5EqzKitAm9Px53LSCN53fY8BaQiDiKeVihZiL6z8y+r2j1ThPMiYG4f2onJ
	 TjQjZ3iBaOz2rGt+Vq31Thjsw/q7WDwyWS07snu0=
Date: Thu, 13 Jun 2024 08:18:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, devel@driverdev.osuosl.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [driver-core:const_driver 12/12] drivers/usb/core/driver.c:80
 store_id() error: uninitialized symbol 'usb_dynid'.
Message-ID: <2024061328-unifier-hesitancy-48b2@gregkh>
References: <5cd22783-8150-4101-9dc5-c556d94fce22@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cd22783-8150-4101-9dc5-c556d94fce22@moroto.mountain>

On Thu, Jun 13, 2024 at 08:57:13AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
> head:   be520b87ec28aa3b5c908a859501fb601bd8b322
> commit: be520b87ec28aa3b5c908a859501fb601bd8b322 [12/12] USB: move dynamic ids out of usb driver structures
> config: i386-randconfig-141-20240613 (https://download.01.org/0day-ci/archive/20240613/202406130740.HIr25kIC-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406130740.HIr25kIC-lkp@intel.com/
> 
> smatch warnings:
> drivers/usb/core/driver.c:80 store_id() error: uninitialized symbol 'usb_dynid'.
> 
> vim +/usb_dynid +80 drivers/usb/core/driver.c
> 
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11  70  static int store_id(const struct device_driver *driver, const struct usb_device_id *id)
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11  71  {
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11  72  	struct usb_dynids *u;
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11  73  	struct usb_dynid *usb_dynid;
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11  74  
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11  75  	u = usb_find_dynids(driver);
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11  76  	if (!u) {
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11  77  		/* This driver has not stored any ids yet, so make a new entry for it */
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11  78  		u = kmalloc(sizeof(*u), GFP_KERNEL);
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11  79  		if (!u) {
> be520b87ec28aa Greg Kroah-Hartman 2024-06-11 @80  			kfree(usb_dynid);
> 
> Delete the kfree()

Ugh, thanks, missed that.

And you are now testing random branches in my tree, nice!  Note, I
haven't even booted this one yet, it barely builds :)

thanks,

greg k-h

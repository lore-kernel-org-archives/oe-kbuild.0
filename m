Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3AD136E39;
	Thu, 13 Jun 2024 06:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718260641; cv=none; b=B5x/emBWWQ5M61apYonQT/jECn8jDGJadY4nwGLF6IuVvWRhOS9H1Ca4OpEZpEuPEhTq7EmEYZUIq9o+CIQj/j08CCNfOeCUGyrOA3vT5uFq5aEex0pkiDVuMaroXzqXk8tUTmVhQ2NxTXFCyiHH+RUz/bgrbVXf8v4L7n4f2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718260641; c=relaxed/simple;
	bh=5PKoGPa6jsIRpn97KuuxlUikZJJ/lsquk2okH3PUFVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDPjhmWAHDu64TTRtFSlqeo9Agv4MyQG1G1YtC55AbYJreYK+JNp4VvxfK1kEbPN6EBC/ALB5s2Njv6x8MmIltdKDK472e7zNcrUUYAb6SwmxD2Ccj1YwewHUpxWOptfWioq3qUMmAdpBg3gx0t7Mwfeg88X3G4mP3GgT1/Nx9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tYy2VhXK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tYy2VhXK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF96C2BBFC;
	Thu, 13 Jun 2024 06:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718260641;
	bh=5PKoGPa6jsIRpn97KuuxlUikZJJ/lsquk2okH3PUFVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYy2VhXK4Zd7vtC6VdWu8wCd5+CWlwdiJwUyjcQtCRTyPKsG+ObcbjvgCOyRYXvQv
	 Dc4W55MMQgqm4UVlZTtGT/QGIGq99OzqwVD4IQmSRxci3l0VSdD+SVIL0q+TunH8uM
	 WwUCFYBIn8SUVOOy5kz9HS06diuRK8QiZAiExS9o=
Date: Thu, 13 Jun 2024 08:37:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: devel@driverdev.osuosl.org, oe-kbuild@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [driver-core:const_driver 12/12] drivers/usb/core/driver.c:80
 store_id() error: uninitialized symbol 'usb_dynid'.
Message-ID: <2024061319-griminess-unicorn-6093@gregkh>
References: <5cd22783-8150-4101-9dc5-c556d94fce22@moroto.mountain>
 <2024061328-unifier-hesitancy-48b2@gregkh>
 <aa6f5023-745f-4116-8dc9-2f155bf14832@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6f5023-745f-4116-8dc9-2f155bf14832@moroto.mountain>

On Thu, Jun 13, 2024 at 09:31:36AM +0300, Dan Carpenter wrote:
> On Thu, Jun 13, 2024 at 08:18:04AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Jun 13, 2024 at 08:57:13AM +0300, Dan Carpenter wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
> > > head:   be520b87ec28aa3b5c908a859501fb601bd8b322
> > > commit: be520b87ec28aa3b5c908a859501fb601bd8b322 [12/12] USB: move dynamic ids out of usb driver structures
> > > config: i386-randconfig-141-20240613 (https://download.01.org/0day-ci/archive/20240613/202406130740.HIr25kIC-lkp@intel.com/config)
> > > compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > | Closes: https://lore.kernel.org/r/202406130740.HIr25kIC-lkp@intel.com/
> > > 
> > > smatch warnings:
> > > drivers/usb/core/driver.c:80 store_id() error: uninitialized symbol 'usb_dynid'.
> > > 
> > > vim +/usb_dynid +80 drivers/usb/core/driver.c
> > > 
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  70  static int store_id(const struct device_driver *driver, const struct usb_device_id *id)
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  71  {
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  72  	struct usb_dynids *u;
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  73  	struct usb_dynid *usb_dynid;
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  74  
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  75  	u = usb_find_dynids(driver);
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  76  	if (!u) {
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  77  		/* This driver has not stored any ids yet, so make a new entry for it */
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  78  		u = kmalloc(sizeof(*u), GFP_KERNEL);
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  79  		if (!u) {
> > > be520b87ec28aa Greg Kroah-Hartman 2024-06-11 @80  			kfree(usb_dynid);
> > > 
> > > Delete the kfree()
> > 
> > Ugh, thanks, missed that.
> > 
> > And you are now testing random branches in my tree, nice!  Note, I
> > haven't even booted this one yet, it barely builds :)
> 
> These are zero day bot stuff.  The zero day bot is always out there
> automatically slurping up any git repository it can find.  There is a
> way to opt-out but I can't remember what it is...

No, I want zero-day to test this branch (I use it as my "build on all
arches test") and it found a bunch of issues already that I will be
queueing up later today.

For some reason I thought you were testing this on your own, nevermind,
it's just a side affect of 0-day's testing.  No objection from me!

thanks,

greg k-h

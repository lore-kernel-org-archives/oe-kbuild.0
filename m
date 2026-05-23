Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307B348445;
	Sat, 23 May 2026 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779534114; cv=none; b=qOdAVqeJ6YsnEnKpmEoarh4UpH8T53mUHttpUmhTHYwmtYUUX02gi3QjlvRKVMigUCgIKaFebDZTRT5DmrWfi4ylfYf0bJ8F+gmENfWltGt47D/zx0XgfpPA1mGl4ZaFwKnmo/MJ2jjn76yy7TLmN8BgSzijHrTQOVcrlUwGlJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779534114; c=relaxed/simple;
	bh=Xxwkmr/khopmm2Raht/m/NWZOKnUQ+iYBah0EdqKPwg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tst9qNE52o/5BiC3PF+Pmev9LCWSXIWrOlA0BS4h09AsfWvX+B4ClIryJnzixyDxPyUnbIogvqsUzxBSrzYQEgPYfQ3KvvkXXoCSxeLTlFRts9iWT+J9muZSZkexKTkmTAgdFyetPLJWqV6TjDUNS6P0riBHKtnefHHev/PJ7DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Jaxl5tBG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Jaxl5tBG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CEA794E42D35;
	Sat, 23 May 2026 11:01:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8948F60733;
	Sat, 23 May 2026 11:01:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 746DE10811C77;
	Sat, 23 May 2026 13:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779534108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hRJHjpOo1odM3aD4t7qAj5bu++g87CoD36ZKyryNayk=;
	b=Jaxl5tBG8wFg7jTlUHXRPJ4LdNdy8DX4sNnKSFEKANHxf/yImnhlbBjAhWGNDjaK9i/B3I
	XkDhSNZNXanIH/5UvhvNRzX74Zysc2XHutfpY8DR8RSs7KwKygSb/sLXMbgogvhkOJWISp
	RpiAvnVEHHvfJS7kXt/p+A1urq/cm7yP21Ff5vi5ZP87fpzX1rhbLwNK1FVSDf5UpQCi7c
	xcRIOkEnRld/L+jXtRkyT57QQYYyLGWqFyKR8fzQ2W++hzXrwTLQlqtAbwbIoKk/Cqf0TJ
	NX/B6zMof0gVIJoumcGlSiIC+6+yvJoxJWxcdywQoMJnRVHXJlx40NKa92OQxQ==
Date: Sat, 23 May 2026 13:01:42 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Saravana Kannan <saravanak@google.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [driver-core:driver-core-testing 12/18] drivers/base/core.c:286
 fw_devlink_refresh_fwnode() error: we previously assumed 'dev' could be
 null (see line 270)
Message-ID: <20260523130142.5efe048d@bootlin.com>
In-Reply-To: <202605230211.567ddMEp-lkp@intel.com>
References: <202605230211.567ddMEp-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Dan,

On Sat, 23 May 2026 12:46:14 +0300
Dan Carpenter <error27@gmail.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
> head:   024480bf8d75bd16894c5b0eb6082b6e6dae4970
> commit: 81e7c6befa36cecdcbf7244393bd67e8f8c59bf5 [12/18] of: dynamic: Fix overlayed devices not probing because of fw_devlink
> config: arm-randconfig-r071-20260523 (https://download.01.org/0day-ci/archive/20260523/202605230211.567ddMEp-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> smatch: v0.5.0-9185-gbcc58b9c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202605230211.567ddMEp-lkp@intel.com/
> 
> New smatch warnings:
> drivers/base/core.c:286 fw_devlink_refresh_fwnode() error: we previously assumed 'dev' could be null (see line 270)
> 
> vim +/dev +286 drivers/base/core.c
> 
> 81e7c6befa36ce Saravana Kannan 2026-05-11  256  void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
> 81e7c6befa36ce Saravana Kannan 2026-05-11  257  {
> 81e7c6befa36ce Saravana Kannan 2026-05-11  258  	struct device *dev;
> 81e7c6befa36ce Saravana Kannan 2026-05-11  259  
> 81e7c6befa36ce Saravana Kannan 2026-05-11  260  	/*
> 81e7c6befa36ce Saravana Kannan 2026-05-11  261  	 * Find the closest ancestor fwnode that has been converted to a device
> 81e7c6befa36ce Saravana Kannan 2026-05-11  262  	 * that can bind to a driver (bus device).
> 81e7c6befa36ce Saravana Kannan 2026-05-11  263  	 */
> 81e7c6befa36ce Saravana Kannan 2026-05-11  264  	fwnode_handle_get(fwnode);
> 81e7c6befa36ce Saravana Kannan 2026-05-11  265  	do {
> 81e7c6befa36ce Saravana Kannan 2026-05-11  266  		if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
> 81e7c6befa36ce Saravana Kannan 2026-05-11  267  			continue;
> 81e7c6befa36ce Saravana Kannan 2026-05-11  268  
> 81e7c6befa36ce Saravana Kannan 2026-05-11  269  		dev = get_dev_from_fwnode(fwnode);
> 81e7c6befa36ce Saravana Kannan 2026-05-11 @270  		if (!dev)
> 81e7c6befa36ce Saravana Kannan 2026-05-11  271  			continue;
> 
> Smatch doesn't like how this code tests for NULL and but then later
> we dereference "dev" without testing.
> 
> get_dev_from_fwnode() can only return NULL if "fwnode" is NULL which
> it can't be.  We can just remove this test.

No so sure.
  --- 8< ---
  struct device *get_dev_from_fwnode(struct fwnode_handle *fwnode)
  {
	return get_device((fwnode)->dev);
  }
  EXPORT_SYMBOL_GPL(get_dev_from_fwnode);
  --- 8< ---

get_dev_from_fwnode() returns NULL if no device is attached to the
given fwnode. This is what we test here.

At line 286, when dev is derefenced (dev->links.status), it cannot be NULL.

> 
> 81e7c6befa36ce Saravana Kannan 2026-05-11  272  
> 81e7c6befa36ce Saravana Kannan 2026-05-11  273  		if (dev->bus)
> 81e7c6befa36ce Saravana Kannan 2026-05-11  274  			break;
> 81e7c6befa36ce Saravana Kannan 2026-05-11  275  
> 81e7c6befa36ce Saravana Kannan 2026-05-11  276  		put_device(dev);
> 81e7c6befa36ce Saravana Kannan 2026-05-11  277  	} while ((fwnode = fwnode_get_next_parent(fwnode)));

We go out of the while() loop here either :
 - because dev->bus is not NULL (the break in the loop) and so dev is not
   NULL in that case (tested just before)
or
 - because fwnode is NULL

> 81e7c6befa36ce Saravana Kannan 2026-05-11  278  
> 81e7c6befa36ce Saravana Kannan 2026-05-11  279  	/*
> 81e7c6befa36ce Saravana Kannan 2026-05-11  280  	 * If none of the ancestor fwnodes have (yet) been converted to a device
> 81e7c6befa36ce Saravana Kannan 2026-05-11  281  	 * that can bind to a driver, there's nothing to fix up.
> 81e7c6befa36ce Saravana Kannan 2026-05-11  282  	 */
> 81e7c6befa36ce Saravana Kannan 2026-05-11  283  	if (!fwnode)
> 81e7c6befa36ce Saravana Kannan 2026-05-11  284  		return;

The case fwnode == NULL is handled here.
At this point dev cannot be NULL. Indeed, the loop has been exited because
dev->bus was not NULL (the break).

> 81e7c6befa36ce Saravana Kannan 2026-05-11  285  
> 81e7c6befa36ce Saravana Kannan 2026-05-11 @286  	WARN(device_is_bound(dev) && dev->links.status != DL_DEV_DRIVER_BOUND,
>                                                                                      ^^^^^^^^^^^^^^^^^
> 
> 81e7c6befa36ce Saravana Kannan 2026-05-11  287  	     "Don't multithread overlaying and probing the same device!\n");
> 81e7c6befa36ce Saravana Kannan 2026-05-11  288  
> 81e7c6befa36ce Saravana Kannan 2026-05-11  289  	/*
> 81e7c6befa36ce Saravana Kannan 2026-05-11  290  	 * If the device has already bound to a driver, then we need to redo
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

I don't understand why smatch reported a problem.
Do I miss something?

Best regards,
Hervé

Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29713049E;
	Wed,  3 Jul 2024 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719995318; cv=none; b=cbMKA9IXw5u5ctCnwfTCXUjRmC3VGp5EKmZYLAHAh/RvRZetxpFPvL5oBB7lv9DfOI59CDQ15ytLIRjdQfeXs83JT8gWD2s0ARUZyHeE4vIlZZfKB0kzBqvqDc5GbZxh21DoM7gqs4uiC2jyzIXd8ZyB9OO/+AW3ffgowhmlutA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719995318; c=relaxed/simple;
	bh=E1Sumh/rbAIGDn0zfjoqhN+Hsw2Jwbgn2kH//D8PKQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c4ZxiOpHRk5JbzGq1hwMA31theRUH8aLx85Vy5d5NEPHpEOxaTd7uTj7tWAIL1VYiiaglGCb40ubETHsAhM5GfVilrj0qEOWF+bH2sRb+jhlxwix9kqKt6uLwDe38vyjZAhrCTK0UP/ikv2wWjAdDnbFyC1Net7V8vA1l6oVfyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e8ySOPjG; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e8ySOPjG"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E20E41C0006;
	Wed,  3 Jul 2024 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719995313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFDYJeWJKDb7tc7tqQAQN+ZXfpWS7cqIrZOttn8z5+I=;
	b=e8ySOPjGAF11GH1XlETDVJe02Qnp6XAu75TLF0wi83aWEXzTASUH05eedfla35x/VWutpF
	73OS5myStObrYtNWpheWYv5n5N8Ry9uQAG4+JSUpBTt3M6l+deeKRL43P9gDi9wQmdPtUg
	Uz/hpkNc5bBuKLk9ucbuVolWSjMw1Ssb4CWgJ/sIVjiphw/jDrwjwn6zamwavGIfonlqdX
	6zIbvrMDAGYGX7/R+P/P6Poz5kVyEnIp7XxVaZhtbAhmXJny2ANtN5yVnC029Rxf1cojlS
	lGtiIQdxrFOpdxg6uL72u9AlVNFug3zvkdEhS8+V7o0EfGNB+bHOHBv3v+E/fw==
Date: Wed, 3 Jul 2024 10:28:32 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v14 12/13] net: ethtool: strset: Allow querying
 phy stats by index
Message-ID: <20240703102832.09a37c7c@fedora-2.home>
In-Reply-To: <188ab8d6-ac91-4613-a67f-231d1217b3b5@suswa.mountain>
References: <20240701131801.1227740-13-maxime.chevallier@bootlin.com>
	<188ab8d6-ac91-4613-a67f-231d1217b3b5@suswa.mountain>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello Dan,

On Wed, 3 Jul 2024 04:56:22 +0200
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Hi Maxime,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Introduce-ethernet-link-topology-representation/20240701-223116
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20240701131801.1227740-13-maxime.chevallier%40bootlin.com
> patch subject: [PATCH net-next v14 12/13] net: ethtool: strset: Allow querying phy stats by index
> config: i386-randconfig-141-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030529.aOYGI0u2-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202407030529.aOYGI0u2-lkp@intel.com/
> 
> smatch warnings:
> net/ethtool/strset.c:295 strset_prepare_data() warn: variable dereferenced before check 'info' (see line 283)
> 
> vim +/info +295 net/ethtool/strset.c
> 
> 71921690f9745fe Michal Kubecek    2019-12-27  276  static int strset_prepare_data(const struct ethnl_req_info *req_base,
> 71921690f9745fe Michal Kubecek    2019-12-27  277  			       struct ethnl_reply_data *reply_base,
> f946270d05c2604 Jakub Kicinski    2023-08-14  278  			       const struct genl_info *info)
> 71921690f9745fe Michal Kubecek    2019-12-27  279  {
> 71921690f9745fe Michal Kubecek    2019-12-27  280  	const struct strset_req_info *req_info = STRSET_REQINFO(req_base);
> 71921690f9745fe Michal Kubecek    2019-12-27  281  	struct strset_reply_data *data = STRSET_REPDATA(reply_base);
> 71921690f9745fe Michal Kubecek    2019-12-27  282  	struct net_device *dev = reply_base->dev;
> a0400b1b08fea15 Maxime Chevallier 2024-07-01 @283  	struct nlattr **tb = info->attrs;
> 
> Unchecked dereference
> 
> a0400b1b08fea15 Maxime Chevallier 2024-07-01  284  	struct phy_device *phydev;
> 71921690f9745fe Michal Kubecek    2019-12-27  285  	unsigned int i;
> 71921690f9745fe Michal Kubecek    2019-12-27  286  	int ret;
> 71921690f9745fe Michal Kubecek    2019-12-27  287  
> 71921690f9745fe Michal Kubecek    2019-12-27  288  	BUILD_BUG_ON(ARRAY_SIZE(info_template) != ETH_SS_COUNT);
> 71921690f9745fe Michal Kubecek    2019-12-27  289  	memcpy(&data->sets, &info_template, sizeof(data->sets));
> 71921690f9745fe Michal Kubecek    2019-12-27  290  
> 71921690f9745fe Michal Kubecek    2019-12-27  291  	if (!dev) {
> 71921690f9745fe Michal Kubecek    2019-12-27  292  		for (i = 0; i < ETH_SS_COUNT; i++) {
> 71921690f9745fe Michal Kubecek    2019-12-27  293  			if ((req_info->req_ids & (1U << i)) &&
> 71921690f9745fe Michal Kubecek    2019-12-27  294  			    data->sets[i].per_dev) {
> 71921690f9745fe Michal Kubecek    2019-12-27 @295  				if (info)
>                                                                                 ^^^^^^^^
> Check for NULL.  Hopefully it can be deleted?

Ah yes I had the same report from Simon Horma :

https://lore.kernel.org/netdev/20240702105411.GF598357@kernel.org/

I'm currently assessing if we can indeed safely remove that check,
which would effectively discard that smatch warning.

Thanks,

Maxime

Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011CE171A7
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 03:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720065341; cv=none; b=Y5IkrAZqVrfe2UB3fTHFmIUot8khZ6jNTOiLZVdZAdlH7iXSafmWrq7mibH/tbQczxjGeCoIzhdslorGh0eC5LUQzFsXnUYntMJSjJz9wnJ+ArOvYGqDl7buP65meYlHsT3rC4Q68284y734kPFOJ+AWZFzcjceHJN9dKR4RnTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720065341; c=relaxed/simple;
	bh=laa069NPYIRy6qdM3BQdN7QRDS/S3P+6GLm9TuHvYJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REJNHN+p2VWWe7rKVzV4C3B66yMp0Y9c3iyzsqAOXQeXGgbfip6/uQHBi8bn6qXROUxFvDTS4bcv1P7dq8+Mc4K3Re/lh2cKXHAZBFtzJX8lEZiF+5sjBhomYQ0npCC5sK3a3HiwamNMPM0O/zG6vPPMmIcDc00NJR0+cWKxBp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 0DB2B3000A46C;
	Thu,  4 Jul 2024 05:55:29 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E9D8053D9B; Thu,  4 Jul 2024 05:55:28 +0200 (CEST)
Date: Thu, 4 Jul 2024 05:55:28 +0200
From: Lukas Wunner <lukas@wunner.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: [l1k:cma_v2 16/18] lib/spdm/req-sysfs.c:561 (null)() warn:
 (struct ctl_table)->procname cannot be NULL. Expression :
 spdm_ctl_table[1]->procname
Message-ID: <ZoYdMA1I8MStYcwE@wunner.de>
References: <202407030953.sCqcnOH7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407030953.sCqcnOH7-lkp@intel.com>

On Wed, Jul 03, 2024 at 10:08:59AM +0800, kernel test robot wrote:
> smatch warnings:
> lib/spdm/req-sysfs.c:561 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : spdm_ctl_table[1]->procname
> lib/spdm/req-sysfs.c:561 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : spdm_ctl_table[1]->proc_handler
[...]
> 2e6ee6670a5d45 Lukas Wunner 2024-06-22 @561  static struct ctl_table spdm_ctl_table[] = {
> 2e6ee6670a5d45 Lukas Wunner 2024-06-22  562  	{
> 2e6ee6670a5d45 Lukas Wunner 2024-06-22  563  		.procname	= "max_signatures_size",
[...]
> 2e6ee6670a5d45 Lukas Wunner 2024-06-22  574  	},
> 2e6ee6670a5d45 Lukas Wunner 2024-06-22  575  	{ }
> 2e6ee6670a5d45 Lukas Wunner 2024-06-22  576  };

Understood, no sentinel needed anymore since commit 53f3811dfd5e
("sysctl: Use ctl_table_size as stopping criteria for list").

I'll amend my development branch.

Thanks,

Lukas

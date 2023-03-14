Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20B9A939;
	Tue, 14 Mar 2023 18:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678819420; x=1710355420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HcDoA6lnkNndAAvLyrmktLzn4ToTWYKaGtwl/HFFUFk=;
  b=UktC0TMTICYs2x/9ZrAa1GjF7LKx8IOHkk0xaqq7MUG1Hj/V60+IQ43v
   FXhQc2Lkt0T4MHwpfFnmeYtismGwRq1tFAYS98Dxwnk/kU5gR0Pz669AZ
   fT3DJ6qHRmVAqaMiN9C9sP0vw5ALKUThll7uUXXr9K/4wIH/eSeN/w6OZ
   wgJd2cfw09UtwgKawYSUztMZNFgKtvoZ/pD8JRUxyoWqwipJuuLcmHPk1
   rVm9l9M34dDU3BG1Imh9TYyId7fJUwQEKg9F7bUWMXkpb6oMoCz9AwHzs
   MjyFySE3zGDwVBp7wE7ntpo1FI706Ok4JPvmt0ErfrKlGKVI8q88RMt4J
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365185420"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="365185420"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 11:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="802973476"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="802973476"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 14 Mar 2023 11:43:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pc9cO-003NLi-0Q;
	Tue, 14 Mar 2023 20:43:28 +0200
Date: Tue, 14 Mar 2023 20:43:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <ZBDAT4MJO+fBy61n@smile.fi.intel.com>
References: <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
 <d057ac5c-5947-41e1-abc7-9428fbd2fbe2@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d057ac5c-5947-41e1-abc7-9428fbd2fbe2@kili.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Mar 11, 2023 at 04:54:32PM +0300, Dan Carpenter wrote:

> 059b4a086017fb Mika Westerberg 2023-03-10  246  			unsigned long type = resource_type(r);
> 999ed65ad12e37 Rene Herman     2008-07-25  247  
> 059b4a086017fb Mika Westerberg 2023-03-10 @248  			if (type != IORESOURCE_IO || type != IORESOURCE_MEM ||
>                                                                                                   ^^
> This || needs to be &&.  This loop will always hit the continue path
> without doing anything.
> 
> 059b4a086017fb Mika Westerberg 2023-03-10  249  			    resource_size(r) == 0)
> 0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  250  				continue;

Thanks, I'll fix in v5.

-- 
With Best Regards,
Andy Shevchenko



Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA0D16403
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 07:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mkMbJSdN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-331733acbacso348586f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 23:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700724268; x=1701329068; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=glDIJBHGxZ+W4YAgV26CnXbvxUmxQYnGxfvLbwvG8mM=;
        b=mkMbJSdNFhUUc3QBd1HNMxQ6qkrZvrHWWAy2DkiLumtg3c8UjTaaF1LvVV6BIWoIuG
         XP/ahcWN4j5Vt3F/UkpWQXUTWRPtCp4W3ky2wjpsmTlBlXR62HKM4r8G8i8lF96XTSgH
         mno7FLL57WDkz7we/Wp/LDPGyMHqIZzSDzN29KnIIYrCR71i4HuA/orIbl1ZB+hgpuhC
         P88XgY/uhylfiNuv07eaZwbEb2TgVmhdE5dtIKcvIjm9LmPXN88d8jWxzCNJdhAdiUkl
         siNj/gY6Jg3u/tU+2zoEUAylpMsGhGv/XrnF6x6z8Z6Yfb174SpsrOnoYOZ+NfoAlAjC
         tLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700724268; x=1701329068;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glDIJBHGxZ+W4YAgV26CnXbvxUmxQYnGxfvLbwvG8mM=;
        b=Sy3KT9nuZXj83xy2ZtO3+cHM1fJA+ZUTfD1ES1uFvC8FCsz0hjIsFtGLCGi/dJnVWA
         gwHpt8tJSbOzINWxLlvHGo9IHxqX2gz2sJ1i6AIfVn7TZGxz4+EUmpxTtTmhGArZibCM
         o136aTauatuyiLPJKyP8zUM2yhrrrXpfG3B2+nfJyh8DbjOyV5L9F+YJUPWI5DFxUDqf
         Xss2wGoKwMEPZH+KdSDCZPwjVIkdpMCKYd/YTjwRHkwp0BmWnH0Yp2jDVMK8haaUa4UN
         jtHX8AmAlql6cNnUuGdWt+Lzm/uoNVMW7NXUeBvzgFB2CaV4pt5Wfk0ExGL+Fgx/gan2
         JQ2Q==
X-Gm-Message-State: AOJu0YzXVswB5ewUw/EQ6xINZSTnjtY/yE0lhZ7k/d48TYRa25rQrKOu
	ooY0Lr8yYngGWASx6d/+W7jtiBmYYz9ox8sWRV34ifjS
X-Google-Smtp-Source: AGHT+IEKgSAvwU+quZwntLL8CoIH9KhcpaTa8/JJZaDNw1Vw3y6oWRpa7BZZ0Za9QkIuhpqBWf+L6Q==
X-Received: by 2002:a5d:5885:0:b0:332:d504:c138 with SMTP id n5-20020a5d5885000000b00332d504c138mr2189978wrf.1.1700724268131;
        Wed, 22 Nov 2023 23:24:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d500b000000b0032d2489a399sm778289wrt.49.2023.11.22.23.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 23:24:27 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Nov 2023 10:24:24 +0300
To: oe-kbuild@lists.linux.dev, Tony Lindgren <tony@atomide.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 3/3] serial: core: Move console character device
 handling from printk
Message-ID: <6933c98f-7f76-4955-ba0f-89ea340b672d@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121113203.61341-4-tony@atomide.com>

Hi Tony,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/printk-Save-console-options-for-add_preferred_console_match/20231121-193809
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231121113203.61341-4-tony%40atomide.com
patch subject: [PATCH v3 3/3] serial: core: Move console character device handling from printk
config: parisc-randconfig-r081-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221437.5Gil0Pml-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221437.5Gil0Pml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311221437.5Gil0Pml-lkp@intel.com/

smatch warnings:
drivers/tty/serial/serial_base_bus.c:266 serial_base_add_preferred_console() error: uninitialized symbol 'nmbr_match'.
drivers/tty/serial/serial_base_bus.c:265 serial_base_add_preferred_console() error: uninitialized symbol 'char_match'.

vim +/nmbr_match +266 drivers/tty/serial/serial_base_bus.c

e4ebdcd790e0f3 Tony Lindgren 2023-11-21  261  int serial_base_add_preferred_console(struct uart_driver *drv,
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  262  				      struct uart_port *port)
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  263  {
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  264  	const char *port_match __free(kfree);
b1b8726ec3f40b Tony Lindgren 2023-11-21 @265  	const char *char_match __free(kfree);
b1b8726ec3f40b Tony Lindgren 2023-11-21 @266  	const char *nmbr_match __free(kfree);

These need to be initialized to NULL.

	const char *char_match __free(kfree) = NULL;

e4ebdcd790e0f3 Tony Lindgren 2023-11-21  267  	int ret;
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  268  
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  269  	port_match = kasprintf(GFP_KERNEL, "%s:%i.%i", dev_name(port->dev),
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  270  			       port->ctrl_id, port->port_id);
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  271  	if (!port_match)
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  272  		return -ENOMEM;

Otherwise in this error path we'll call kfree(char_match) and
kfree(nmbr_match) when the haven't been initialized.

e4ebdcd790e0f3 Tony Lindgren 2023-11-21  273  
b1b8726ec3f40b Tony Lindgren 2023-11-21  274  	char_match = kasprintf(GFP_KERNEL, "%s%i", drv->dev_name, port->line);
b1b8726ec3f40b Tony Lindgren 2023-11-21  275  	if (!char_match)
b1b8726ec3f40b Tony Lindgren 2023-11-21  276  		return -ENOMEM;
b1b8726ec3f40b Tony Lindgren 2023-11-21  277  
b1b8726ec3f40b Tony Lindgren 2023-11-21  278  	/* Handle ttyS specific options */
b1b8726ec3f40b Tony Lindgren 2023-11-21  279  	if (!strncmp(drv->dev_name, "ttyS", 4)) {
b1b8726ec3f40b Tony Lindgren 2023-11-21  280  		/* No name, just a number */
b1b8726ec3f40b Tony Lindgren 2023-11-21  281  		nmbr_match = kasprintf(GFP_KERNEL, "%i", port->line);
b1b8726ec3f40b Tony Lindgren 2023-11-21  282  		if (!nmbr_match)
b1b8726ec3f40b Tony Lindgren 2023-11-21  283  			return -ENODEV;
b1b8726ec3f40b Tony Lindgren 2023-11-21  284  
b1b8726ec3f40b Tony Lindgren 2023-11-21  285  		ret = add_preferred_console_match(nmbr_match, drv->dev_name,
b1b8726ec3f40b Tony Lindgren 2023-11-21  286  						  port->line);
b1b8726ec3f40b Tony Lindgren 2023-11-21  287  		if (ret && ret != -ENOENT)
b1b8726ec3f40b Tony Lindgren 2023-11-21  288  			return ret;
b1b8726ec3f40b Tony Lindgren 2023-11-21  289  
b1b8726ec3f40b Tony Lindgren 2023-11-21  290  		/* Sparc ttya and ttyb */
b1b8726ec3f40b Tony Lindgren 2023-11-21  291  		ret = serial_base_add_sparc_console(drv, port);
b1b8726ec3f40b Tony Lindgren 2023-11-21  292  		if (ret)
b1b8726ec3f40b Tony Lindgren 2023-11-21  293  			return ret;
b1b8726ec3f40b Tony Lindgren 2023-11-21  294  	}
b1b8726ec3f40b Tony Lindgren 2023-11-21  295  
b1b8726ec3f40b Tony Lindgren 2023-11-21  296  	/* Handle the traditional character device name style console=ttyS0 */
b1b8726ec3f40b Tony Lindgren 2023-11-21  297  	ret = add_preferred_console_match(char_match, drv->dev_name, port->line);
b1b8726ec3f40b Tony Lindgren 2023-11-21  298  	if (ret && ret != -ENOENT)
b1b8726ec3f40b Tony Lindgren 2023-11-21  299  		return ret;
b1b8726ec3f40b Tony Lindgren 2023-11-21  300  
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  301  	/* Translate a hardware addressing style console=DEVNAME:0.0 */
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  302  	ret = add_preferred_console_match(port_match, drv->dev_name, port->line);
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  303  	if (ret && ret != -ENOENT)
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  304  		return ret;
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  305  
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  306  	return 0;
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  307  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


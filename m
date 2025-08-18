Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7527876E
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755501590; cv=none; b=ez6GRhRBY9atTIcBcRbMHgr09ewG/W+fMHHAhyvIy6H6jimqhtgipXxEF6bLY8kY0JndoXTKP8izl4kpM/naj3nVH9xas+nsHLeBnWyd+dD0OHHBsAE3iTJAvACePcIMtVo4dKe2KrAc1pD8Nz2pG2jnj5u274dfp4yHIOgYKrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755501590; c=relaxed/simple;
	bh=FQTwmlOpSlpiDox1C07+RYr3g+cTRJXiQ5qNfxI4FSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZOTFl/K8PgDRYuH0/JA1ouz1wYy04Boy9rnvRmLlQLhA41hmlbmlPEUq/N0X8sjeaR8Pipbr5hm152SqECpVqz2pMNaC9a9F/VYn4TsPHBtRshNLtsQaHj6nZkKYguiHV5a5ZtG2ofTQa8BOotGIYjcijBXVqoJgn8igvOAl3nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RxoPXBTE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RxoPXBTE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b0cd668so18561175e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755501585; x=1756106385; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3zFG+ph3piKAY7MCJLonbSvB1EXUkHi8G1gdERzBPH0=;
        b=RxoPXBTEjs8vRvX0CZZUCCMmayH/0i7uE9r/Bph1HRh0MMr3JvkU7F9ty3cjWsLJfB
         i/I6nmojrops3DscUOdfYKKaR4mvdPAP+ibIRK7j8rHoFigX9OxgdNdMiNrwEWBSBiKU
         H5lOUEPuwCqtV1yL37hWaRNiIAZtOBjbJniRnp4MaVc3zg0dn71azhkKBgqiLhypSS8A
         jdTK8BIoC+MpuARg4QQz/91499Kjdj8v0+F20Xg7jPLHiaHQF9LishSypETkWdZC1vXR
         ZoYMa3XWMRpn3/ft1PZm5Y5066ziuV8UDkQue+I9EeidHS3sO6zMRhR/PgxNVdSEEfwG
         yo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755501585; x=1756106385;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zFG+ph3piKAY7MCJLonbSvB1EXUkHi8G1gdERzBPH0=;
        b=mX457UfPihCKe8E06tN+X5Vj/jbMuIU2sxf8CiKz5sDijJtNc5hoNWkaQAhhzcSoxM
         OYDjPV3ERF2dqxNJD3UzHFQU1r6lr6I32Vuz0B5OAUFx1pzMvoWD0izjmRf+RJy1Fphq
         PRlGy+u55Na1Q3zaiDmtE0/2SCIC0P8kt5aCR4D2HQ8VDumDe06+MM6x2NdvKe3fY/ox
         G/WoamxyaU0kd11/w8bB8qgatXOOgj94fuAzZhfE+UxhqOiJjRZ3nW1l7Yba3qwXa9ID
         UuQYH1X8CpUZc5Il5S6BqggfyOVzI4djS0dflQd1npyE1pyY2hRRl095QeRkznTICQFM
         eLKw==
X-Gm-Message-State: AOJu0Yw/bJqPLK4jsjMe3y1r4ro3+8yfjT8J0r3EtLesZk5ifh5LPxw8
	Bd8zfRjdVrzwA3uRC7Rfb4C8KhDBPtYdZLgHfx6978fcq6hr207Log3gMHmNWynu43930VvdN9v
	LHGQ2
X-Gm-Gg: ASbGncs2BF/it2kWpHQVxrxZ8HnTYvCPepfDEj+XXb4HUd//ptlHc7VVI4CX/axVwCd
	raXGsN9NnBOpp0v60VV/wKwB0kesWdb6KFBXypQwY+HQDNV4enUYV5yz0WxAj4wxQEMUgOhQmHo
	YENMwqQzQ1rIOkUzKtxSJ/l6F+hE4gOqnlGrv3mW2jQsOSmQdSrmzBYtMGocLoMHDriANxff4pZ
	cil8hWfVE9b1u5tMRaa3sfwFFlJs6LFGZm7Sl2wnvfvVDpS9tPG5FPnDSKh7vMkqH7+Bno0Tfsy
	HTVMNu9NXmG7Jq8uvyI2vCzt3gYuX3vTJ6VbaWKoHWBiVhMOivqjt3RUohAD8PhPCbq/Gd7bI+2
	2it8I0FoGeqO5l/ON2RJ7yJmhPQ4QVG3NqcyzAg==
X-Google-Smtp-Source: AGHT+IHM4h5TvUroAVFtgE7l1uKXONfdURffdRsQdfk8r4Doc4NPI78w6r1cZehK5yFOkTP2w9cGBA==
X-Received: by 2002:a05:600c:3594:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-45a218095camr84039995e9.11.1755501585402;
        Mon, 18 Aug 2025 00:19:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a209c25a1sm131087915e9.22.2025.08.18.00.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 00:19:44 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:19:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mohammad Gomaa <midomaxgomaa@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	kenalba@google.com, hbarnor@chromium.org, rayxu@google.com,
	Mohammad Gomaa <midomaxgomaa@gmail.com>
Subject: Re: [PATCH WIP v2] i2c: add tracepoints to aid debugging in
 i2c-core-base
Message-ID: <202508181525.GKAXMVYv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>
Message-ID: <20250818071941.GU7ijMdNUZceoj_9UksDn7Reo6B5fqxLTd6k25qzeS0@z>

Hi Mohammad,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Mohammad-Gomaa/i2c-add-tracepoints-to-aid-debugging-in-i2c-core-base/20250817-155936
base:   7e161a991ea71e6ec526abc8f40c6852ebe3d946
patch link:    https://lore.kernel.org/r/20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e%40gmail.com
patch subject: [PATCH WIP v2] i2c: add tracepoints to aid debugging in i2c-core-base
config: x86_64-randconfig-161-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181525.GKAXMVYv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508181525.GKAXMVYv-lkp@intel.com/

smatch warnings:
drivers/i2c/i2c-core-base.c:535 i2c_device_probe() error: uninitialized symbol 'err_reason'.

vim +/err_reason +535 drivers/i2c/i2c-core-base.c

f37dd80ac2a67e4 drivers/i2c/i2c-core.c      David Brownell           2007-02-13  491  static int i2c_device_probe(struct device *dev)
^1da177e4c3f415 drivers/i2c/i2c-core.c      Linus Torvalds           2005-04-16  492  {
5763a474c887d4a drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  493  	struct fwnode_handle	*fwnode = dev_fwnode(dev);
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  494  	struct i2c_client	*client = i2c_verify_client(dev);
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  495  	struct i2c_driver	*driver;
79ece9b292af6b0 drivers/i2c/i2c-core-base.c Ricardo Ribalda          2022-11-14  496  	bool do_power_on;
50c3304a5e1e521 drivers/i2c/i2c-core.c      Hans Verkuil             2008-03-12  497  	int status;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  498  	int err_reason;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  499  	bool has_id_table, has_acpi_match, has_of_match;
7b4fbc50fabb810 drivers/i2c/i2c-core.c      David Brownell           2007-05-01  500  
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  501  	if (!client)
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  502  		return 0;
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  503  
6e76cb7dfd34a2e drivers/i2c/i2c-core-base.c Charles Keepax           2019-06-27  504  	client->irq = client->init_irq;
6e76cb7dfd34a2e drivers/i2c/i2c-core-base.c Charles Keepax           2019-06-27  505  
0c2a34937f7e4c4 drivers/i2c/i2c-core-base.c Wolfram Sang             2020-06-30  506  	if (!client->irq) {
845c877009cf014 drivers/i2c/i2c-core.c      Mika Westerberg          2015-05-06  507  		int irq = -ENOENT;
845c877009cf014 drivers/i2c/i2c-core.c      Mika Westerberg          2015-05-06  508  
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  509  		if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  510  			dev_dbg(dev, "Using Host Notify IRQ\n");
72bfcee11cf8950 drivers/i2c/i2c-core-base.c Jarkko Nikula            2019-04-30  511  			/* Keep adapter active when Host Notify is required */
72bfcee11cf8950 drivers/i2c/i2c-core-base.c Jarkko Nikula            2019-04-30  512  			pm_runtime_get_sync(&client->adapter->dev);
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  513  			irq = i2c_smbus_host_notify_to_irq(client);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  514  			err_reason = I2C_TRACE_REASON_HOST_NOTIFY;
5763a474c887d4a drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  515  		} else if (is_of_node(fwnode)) {
5d9424b00b577b6 drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  516  			irq = fwnode_irq_get_byname(fwnode, "irq");
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  517  			if (irq == -EINVAL || irq == -ENODATA)
5d9424b00b577b6 drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  518  				irq = fwnode_irq_get(fwnode, 0);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  519  			err_reason = I2C_TRACE_REASON_FROM_OF;
5763a474c887d4a drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  520  		} else if (is_acpi_device_node(fwnode)) {
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  521  			bool wake_capable;
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  522  
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  523  			irq = i2c_acpi_get_irq(client, &wake_capable);
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  524  			if (irq > 0 && wake_capable)
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  525  				client->flags |= I2C_CLIENT_WAKE;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  526  			err_reason = I2C_TRACE_REASON_FROM_ACPI;
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  527  		}

err_reason not set on else { path.

3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  528  		if (irq == -EPROBE_DEFER) {
5c52473b4496b35 drivers/i2c/i2c-core-base.c Xu Yang                  2025-05-07  529  			status = dev_err_probe(dev, irq, "can't get irq\n");
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  530  			err_reason = I2C_TRACE_REASON_EPROBE_DEFER_IRQ;
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  531  			goto put_sync_adapter;
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  532  		}
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  533  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  534  		if (irq < 0) {
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17 @535  			trace_i2c_device_probe_debug(dev, err_reason);
                                                                                                                                          ^^^^^^^^^^

6f34be7400c68d3 drivers/i2c/i2c-core.c      Geert Uytterhoeven       2014-11-17  536  			irq = 0;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  537  		}
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  538  
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  539  		client->irq = irq;
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  540  	}
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  541  
0c2a34937f7e4c4 drivers/i2c/i2c-core-base.c Wolfram Sang             2020-06-30  542  	driver = to_i2c_driver(dev->driver);
0c2a34937f7e4c4 drivers/i2c/i2c-core-base.c Wolfram Sang             2020-06-30  543  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  544  	has_id_table = driver->id_table;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


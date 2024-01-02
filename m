Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A0A1426C
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jan 2024 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2eZ122y"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so6221299f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 02 Jan 2024 06:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704204384; x=1704809184; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GeuSBJ4NRsOQvgljA4+5PVaR3yqbK0REG/oik1vcoTs=;
        b=S2eZ122ye5oZz4CbXCQxs5Dgm6h7zWdG8oiArFxgVe83CcKl8oE5epP6NcK4E/msdH
         JBlh2fyZpD3p5ySl7Cfi4Rh5JCbhF7qUNisgtd1XwymwzdMNBskdHadrUtA65+DwX0zB
         x/NLwOpOXKDcmCDK72iyfY9g2Je9Dwc7TDo+ydVqA7OkzIfFsMHPoXO4vWDtaTnRaQ8P
         pWZwm7qlOFm83LTdlqETdvy73E26JmtLi5Z9aSRkjvvHSVwSqKqoaed/cPshzIKsbl85
         4+PgLng33UZPZ8URgzLFRet/aCxliX5Nmp01rJK+877EiUXb0RWPgzg+bdf9btIP8nWv
         jkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704204384; x=1704809184;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeuSBJ4NRsOQvgljA4+5PVaR3yqbK0REG/oik1vcoTs=;
        b=dWUz952zG+IanVH8zE5lHIx4+mFLKFu/3O+WPxEvYgNmG/TaFqXV1Et37AwcmMqxff
         Ry5TokcGf8lZl9DtNjW3giT0qFinf/wOry8NZ4Z0vVzJPb2r8K5HpN//q3E0IYBFtlr/
         oATgIJRm/tKtdJbZeu/xwj1+whVKLGrzVwicwmxBQaIBOr94xI8enlYIzbjRH0/Xabi1
         TH4wWNhAnLM4AqbNRBwg2PeVxicAQUKjJHz83oU6pMNXfx1ajQ2jLO1V2yP0Qe/YXmWy
         365jPU8qsVaSbPepWUt9b2J9idklT8ub6YdmFi9AYDmev9w7TXATu3bGVo+Utvhd73mI
         v2Mg==
X-Gm-Message-State: AOJu0YxsDf8uMKNAi+KfCW3Qf2wySsPNgELxvjv/d97MU6N1sBUDndLQ
	CIv0N8KEJIdo0RXgYFSQoB2PzomAPd8NRrFvULs9rR7deWg=
X-Google-Smtp-Source: AGHT+IGk6b7xxbrOOdBOhoJZTfY5o2MxcgOf7EHNUFLzzXCVFaBSNQcBJgEQ81jRR1EiHtDu86iDWQ==
X-Received: by 2002:a5d:4bd0:0:b0:336:7790:6a36 with SMTP id l16-20020a5d4bd0000000b0033677906a36mr9667662wrt.129.1704204383955;
        Tue, 02 Jan 2024 06:06:23 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id a7-20020a5d4d47000000b00333404e9935sm28651254wru.54.2024.01.02.06.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:06:23 -0800 (PST)
Date: Tue, 2 Jan 2024 17:06:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rengarajan S <rengarajan.s@microchip.com>,
	kumaravel.thiagarajan@microchip.com,
	tharunkumar.pasumarthi@microchip.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, keescook@chromium.org, gustavoars@kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	unglinuxdriver@microchip.com
Subject: Re: [PATCH v1 tty-next 4/4] 8250: microchip: pci1xxxx: Add Burst
 mode transmission support in uart driver for reading from FIFO
Message-ID: <5d46ad8f-6537-4c53-8a81-85dca7bfbd9e@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215151123.41812-5-rengarajan.s@microchip.com>

Hi Rengarajan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rengarajan-S/8250-microchip-pci1xxxx-Rearranging-the-structure-declarations/20231215-234606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231215151123.41812-5-rengarajan.s%40microchip.com
patch subject: [PATCH v1 tty-next 4/4] 8250: microchip: pci1xxxx: Add Burst mode transmission support in uart driver for reading from FIFO
config: i386-randconfig-141-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161205.f6EpLZln-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312161205.f6EpLZln-lkp@intel.com/

smatch warnings:
drivers/tty/serial/8250/8250_pci1xxxx.c:395 pci1xxxx_process_write_data() warn: should this be 'valid_burst_count == -1'

vim +395 drivers/tty/serial/8250/8250_pci1xxxx.c

eeaa9176002041 Rengarajan S 2023-12-15  351  static void pci1xxxx_process_write_data(struct uart_port *port,
eeaa9176002041 Rengarajan S 2023-12-15  352  					struct circ_buf *xmit,
eeaa9176002041 Rengarajan S 2023-12-15  353  					int *data_empty_count,
eeaa9176002041 Rengarajan S 2023-12-15  354  					u32 *valid_byte_count)
eeaa9176002041 Rengarajan S 2023-12-15  355  {
eeaa9176002041 Rengarajan S 2023-12-15  356  	u32 valid_burst_count = *valid_byte_count / UART_BURST_SIZE;
eeaa9176002041 Rengarajan S 2023-12-15  357  
eeaa9176002041 Rengarajan S 2023-12-15  358  	/*
eeaa9176002041 Rengarajan S 2023-12-15  359  	 * Each transaction transfers data in DWORDs. If there are less than
eeaa9176002041 Rengarajan S 2023-12-15  360  	 * four remaining valid_byte_count to transfer or if the circular
eeaa9176002041 Rengarajan S 2023-12-15  361  	 * buffer has insufficient space for a DWORD, the data is transferred
eeaa9176002041 Rengarajan S 2023-12-15  362  	 * one byte at a time.
eeaa9176002041 Rengarajan S 2023-12-15  363  	 */
eeaa9176002041 Rengarajan S 2023-12-15  364  	while (valid_burst_count--) {

This loop ends with valid_burst_count set to -1.  (Post operation).

eeaa9176002041 Rengarajan S 2023-12-15  365  		if (*data_empty_count - UART_BURST_SIZE < 0)
eeaa9176002041 Rengarajan S 2023-12-15  366  			break;
eeaa9176002041 Rengarajan S 2023-12-15  367  		if (xmit->tail > (UART_XMIT_SIZE - UART_BURST_SIZE))
eeaa9176002041 Rengarajan S 2023-12-15  368  			break;
eeaa9176002041 Rengarajan S 2023-12-15  369  		writel(*(unsigned int *)&xmit->buf[xmit->tail],
eeaa9176002041 Rengarajan S 2023-12-15  370  		       port->membase + UART_TX_BURST_FIFO);
eeaa9176002041 Rengarajan S 2023-12-15  371  		*valid_byte_count -= UART_BURST_SIZE;
eeaa9176002041 Rengarajan S 2023-12-15  372  		*data_empty_count -= UART_BURST_SIZE;
eeaa9176002041 Rengarajan S 2023-12-15  373  		xmit->tail = (xmit->tail + UART_BURST_SIZE) &
eeaa9176002041 Rengarajan S 2023-12-15  374  			     (UART_XMIT_SIZE - 1);
eeaa9176002041 Rengarajan S 2023-12-15  375  	}
eeaa9176002041 Rengarajan S 2023-12-15  376  
eeaa9176002041 Rengarajan S 2023-12-15  377  	while (*valid_byte_count--) {
eeaa9176002041 Rengarajan S 2023-12-15  378  		if (*data_empty_count - UART_BYTE_SIZE < 0)
eeaa9176002041 Rengarajan S 2023-12-15  379  			break;
eeaa9176002041 Rengarajan S 2023-12-15  380  		writeb(xmit->buf[xmit->tail], port->membase +
eeaa9176002041 Rengarajan S 2023-12-15  381  		       UART_TX_BYTE_FIFO);
eeaa9176002041 Rengarajan S 2023-12-15  382  		*data_empty_count -= UART_BYTE_SIZE;
eeaa9176002041 Rengarajan S 2023-12-15  383  
eeaa9176002041 Rengarajan S 2023-12-15  384  		/*
eeaa9176002041 Rengarajan S 2023-12-15  385  		 * When the tail of the circular buffer is reached, the next
eeaa9176002041 Rengarajan S 2023-12-15  386  		 * byte is transferred to the beginning of the buffer.
eeaa9176002041 Rengarajan S 2023-12-15  387  		 */
eeaa9176002041 Rengarajan S 2023-12-15  388  		xmit->tail = (xmit->tail + UART_BYTE_SIZE) &
eeaa9176002041 Rengarajan S 2023-12-15  389  			     (UART_XMIT_SIZE - 1);
eeaa9176002041 Rengarajan S 2023-12-15  390  
eeaa9176002041 Rengarajan S 2023-12-15  391  		/*
eeaa9176002041 Rengarajan S 2023-12-15  392  		 * If there are any pending burst count, data is handled by
eeaa9176002041 Rengarajan S 2023-12-15  393  		 * transmitting DWORDs at a time.
eeaa9176002041 Rengarajan S 2023-12-15  394  		 */
eeaa9176002041 Rengarajan S 2023-12-15 @395  		if (valid_burst_count && (xmit->tail <
                                                            ^^^^^^^^^^^^^^^^^
So this test should be if valid_burst_count != -1.  Or if
valid_burst_count != UINT_MAX because it's unsigned...

eeaa9176002041 Rengarajan S 2023-12-15  396  		   (UART_XMIT_SIZE - UART_BURST_SIZE)))
eeaa9176002041 Rengarajan S 2023-12-15  397  			break;
eeaa9176002041 Rengarajan S 2023-12-15  398  	}
eeaa9176002041 Rengarajan S 2023-12-15  399  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


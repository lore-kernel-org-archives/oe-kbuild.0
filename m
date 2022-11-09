Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41923CE;
	Wed,  9 Nov 2022 07:18:06 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 1DF672800B3C2;
	Wed,  9 Nov 2022 08:08:55 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 11E081000D; Wed,  9 Nov 2022 08:08:55 +0100 (CET)
Date: Wed, 9 Nov 2022 08:08:55 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [tty:tty-next 10/67] drivers/tty/serial/8250/8250_omap.c:825
 omap8250_rs485_config() warn: bitwise AND condition is false here
Message-ID: <20221109070855.GA4264@wunner.de>
References: <202211070440.8hWunFUN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211070440.8hWunFUN-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Nov 07, 2022 at 03:40:41PM +0300, Dan Carpenter wrote:
> New smatch warnings:
> drivers/tty/serial/8250/8250_omap.c:825 omap8250_rs485_config() warn: bitwise AND condition is false here
[...]
> vim +825 drivers/tty/serial/8250/8250_omap.c
[...]
> 801954d1210a89 Lukas Wunner              2022-10-16 @825  		if (priv->mdr1 & UART_OMAP_MDR1_16X_MODE)
> 
> This should be:
> 
> 	if (priv->mdr1 == UART_OMAP_MDR1_16X_MODE)

Thanks for the heads-up Dan, I've just submitted a fix:

https://lore.kernel.org/linux-serial/7d5b04da13d89b8708b9543a0b125f2b6062a77b.1667977259.git.lukas@wunner.de/

As always your reports are greatly appreciated.

Lukas

Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18B419892;
	Fri,  4 Aug 2023 16:48:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49CAEC0003;
	Fri,  4 Aug 2023 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691167683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cU9ENbCHDNBrym2EhNzJUF5RqsANfxJ7c9bMDP5JSI=;
	b=fFOxVYzN2JXmoVot41WaWR9E/3J8gerDMdVwjmar/38qNZZahpgnWUSjaxd6CZFJN3UfbV
	oTmAIpNW1Q6Sva0KK4o30tXpF6bPn0WdVoK7ZDsURfPH4YMfo3l0mDc6JB1NYA71vHJart
	qOYjZ4t/FRfstSaaYPmv3/02q3kSG9gvlBZ7DAJlk21XaKoh6mHLDqubJV0qkyWL1df6NM
	Z/bGs5pj7+G8GjOsKGDDYhNhNWAN872VVlclEBjUPhv6Zdw4XxmNw4XWQd3sOLAxdRYj/n
	2ASyWV/e72pza8asQs3FB6mGgSdwz01nG07/tcoMUiuaTUAOCxpaFGEE7yFKVQ==
Date: Fri, 4 Aug 2023 18:47:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Robert Marko <robert.marko@sartura.hr>,
 Luka Perkov <luka.perkov@sartura.hr>, Michael Walle <michael@walle.cc>,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH v7 5/7] nvmem: core: Rework layouts to become platform
 devices
Message-ID: <20230804184757.66bc6abe@xps-13>
In-Reply-To: <3a4aa779-f8b8-4178-8d65-b6aae9183fb7@kadam.mountain>
References: <20230801182132.1058707-6-miquel.raynal@bootlin.com>
	<b9040273-aca8-432a-83aa-b0d6b1b88529@kadam.mountain>
	<20230804173903.2b298cd3@xps-13>
	<20230804174625.4c27fe9a@xps-13>
	<3a4aa779-f8b8-4178-8d65-b6aae9183fb7@kadam.mountain>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Dan,

dan.carpenter@linaro.org wrote on Fri, 4 Aug 2023 19:05:20 +0300:

> On Fri, Aug 04, 2023 at 05:46:25PM +0200, Miquel Raynal wrote:
> > Actually of_nvmem_layout_get_container() already returns NULL if
> > CONFIG_OF is not defined. This helper returns either a valid pointer of
> > NULL. Where can it return an error pointer? =20
>=20
> This is from linux-next.

Ah! Ok I missed that one, we don't need this double implementation, as
of_nvmem_layout_get_container just calls a function that already has a
static inline counterpart in the of.h header, which returns NULL. I'll
make the change, thanks for the pointer.

>=20
> include/linux/nvmem-consumer.h
>    256  static inline struct device_node *
>    257  of_nvmem_layout_get_container(struct nvmem_device *nvmem)
>    258  {
>    259          return ERR_PTR(-EOPNOTSUPP);
>    260  }
>    261  #endif /* CONFIG_NVMEM && CONFIG_OF */
>=20
> regards,
> dan carpenter


Thanks,
Miqu=C3=A8l

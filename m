Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FA617AC1;
	Fri, 18 Aug 2023 13:33:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4ED321BF207;
	Fri, 18 Aug 2023 13:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692365601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XUSBAmZKqea45tgmsPtCsKHT8kHVr/qm5VJCtBhaXkY=;
	b=KBjw2bfWLtCn+iB3ds2FAjC9N/sGBNzJgoiDzs08itibNfMqkiC4k+sLFk2/8ZE0jI5U3L
	h8CCo/srx3nVqLViQiowg7CzIE+4BUi4rVkHu4iLq+Wip1AIh9iZcbYj04/vmwhkfYpKVo
	LeNeUerfHw6PdDoMORqiNRWKnRAPpWzpigoNHtu3RzabYQ9837qrfhh1DgEsO1cgJm341u
	Zn3U1Fc6fSaAG9WiCs31tfUDPspokwxkrmaCD0Gsn9cQLp1owEg8QsLomGWpf4RPltZtLc
	KobaEVWkSgYBy/pjmBx0izRML9A9U7Y38huxxVmcOIX+SCz8MkxnKQxEDIyM/w==
Date: Fri, 18 Aug 2023 15:33:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, <lkp@intel.com>,
 <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 1937/6910]
 drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error:
 uninitialized symbol 'ret'.
Message-ID: <20230818153319.4f2ca354@xps-13>
In-Reply-To: <4b8607e8-4df8-3b15-693f-7d7478caedac@quicinc.com>
References: <7ad1160b-5f8c-47af-a1c5-51b34f656fab@kadam.mountain>
	<20230804184550.0cb12369@xps-13>
	<3604e2ed-8d30-4f7b-9e56-7af5b23b2ac5@kadam.mountain>
	<20230804190750.3367a044@xps-13>
	<20230805065510.GA18650@thinkpad>
	<db088950-c25b-f0c0-851a-c5d56611c7c9@quicinc.com>
	<908ee5e8-6213-5685-7094-8c4b1282015c@quicinc.com>
	<20230807211458.3de7c627@xps-13>
	<4b8607e8-4df8-3b15-693f-7d7478caedac@quicinc.com>
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

Hi Sricharan,

quic_srichara@quicinc.com wrote on Tue, 8 Aug 2023 10:46:14 +0530:

> <..>
>=20
> >>    With this series applied on linux-next, started seeing the below
> >>    messages flooded on console while doing mtd r/w.
> >>    "xxx "Opcode not supported: 0"
> >>
> >>    opcode '0' corresponds to NAND_CMD_READ0. This command inturn was
> >>    invoked from qcom_nandc.c driver from below places. For read/write_=
page
> >>    driver does not use the exec ops. Hence these calls just ends up
> >>    being -ENOTSUPP and ignored. So removed their invocations.
> >>    If this is fine, can this be added to your series ? (will send
> >>    git-format patch to add to your cleanup series). So far, tested
> >>    mtd raw/block read/writes and all works fine. Will do further tests
> >>    as well. =20
> >=20
> > Unless I really don't understand the controller, this is non sense.
> > nand_read_page_op() is precisely what allows your NAND to perform a
> > read. Removing this call cannot work.
> >=20
> > What you need is a proper ->exec_op() implementation, and repeating
> > this becomes slightly annoying.
> >=20
> > Look at your qcom_op_cmd_mapping, you don't even have a path for reads.
> > I bet something along:
> > 	CMD_READ0:
> > 		ret =3D XXX_OPCODE_READ;
> > 		break;
> > will make it work.
> >=20
> > Please fix the driver and test with nandbiterrs -i. If this test works,
> > it is encouraging. Otherwise it is still broken. =20
>=20
>   ok understand. Will fix this up.

This is urgent now. The driver in -next is broken, shall I revert
everything or will you test the above fix quickly?

Thanks,
Miqu=C3=A8l

Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F1817AC1;
	Fri, 18 Aug 2023 14:03:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 165DE1C0008;
	Fri, 18 Aug 2023 14:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692367390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFfVfaVAy9TwArZdxGs4Kb/msSx2kAmyz1Q+/vbxkDc=;
	b=HnOn9x9NB+W2kg/lWDBBJQWlWtI1Mbk6u3j7fftlbh+Hh3vvU7P8Mv8mB3RAy2A97cmCmO
	ylie8eR9cvypELuPRG0RZ83CDNotDLZQYBOgDr4pVjRr4+p6DsLmzjDjmCVS12K264R0ys
	hb2b8ZwMuVvJhjLtn7cUsQnjLeGsP9wXFwFi1LQgwgyDeaEFFQzgYQtRElONc81BuyknV+
	aXcwxSw1vcYVWMi/aHAe5vpwNfqYVgGrTiw1SBqFBKH7VphO3G1uQItyZIAXSfJMNfi+OB
	IcpYf3XgDqQCGqEjMgABUbGR3VPlmHWjmEuil8hZm6jVurCcVZhqGzo1pVXnXw==
Date: Fri, 18 Aug 2023 16:03:08 +0200
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
Message-ID: <20230818160308.261088fb@xps-13>
In-Reply-To: <2fd50bec-b689-738a-297c-e0f9ad3cc402@quicinc.com>
References: <7ad1160b-5f8c-47af-a1c5-51b34f656fab@kadam.mountain>
	<20230804184550.0cb12369@xps-13>
	<3604e2ed-8d30-4f7b-9e56-7af5b23b2ac5@kadam.mountain>
	<20230804190750.3367a044@xps-13>
	<20230805065510.GA18650@thinkpad>
	<db088950-c25b-f0c0-851a-c5d56611c7c9@quicinc.com>
	<908ee5e8-6213-5685-7094-8c4b1282015c@quicinc.com>
	<20230807211458.3de7c627@xps-13>
	<4b8607e8-4df8-3b15-693f-7d7478caedac@quicinc.com>
	<20230818153319.4f2ca354@xps-13>
	<2fd50bec-b689-738a-297c-e0f9ad3cc402@quicinc.com>
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

quic_srichara@quicinc.com wrote on Fri, 18 Aug 2023 19:21:04 +0530:

> Hi Miquel,
>=20
> On 8/18/2023 7:03 PM, Miquel Raynal wrote:
> > Hi Sricharan,
> >=20
> > quic_srichara@quicinc.com wrote on Tue, 8 Aug 2023 10:46:14 +0530:
> >  =20
> >> <..>
> >> =20
> >>>>     With this series applied on linux-next, started seeing the below
> >>>>     messages flooded on console while doing mtd r/w.
> >>>>     "xxx "Opcode not supported: 0"
> >>>>
> >>>>     opcode '0' corresponds to NAND_CMD_READ0. This command inturn was
> >>>>     invoked from qcom_nandc.c driver from below places. For read/wri=
te_page
> >>>>     driver does not use the exec ops. Hence these calls just ends up
> >>>>     being -ENOTSUPP and ignored. So removed their invocations.
> >>>>     If this is fine, can this be added to your series ? (will send
> >>>>     git-format patch to add to your cleanup series). So far, tested
> >>>>     mtd raw/block read/writes and all works fine. Will do further te=
sts
> >>>>     as well. =20
> >>>
> >>> Unless I really don't understand the controller, this is non sense.
> >>> nand_read_page_op() is precisely what allows your NAND to perform a
> >>> read. Removing this call cannot work.
> >>>
> >>> What you need is a proper ->exec_op() implementation, and repeating
> >>> this becomes slightly annoying.
> >>>
> >>> Look at your qcom_op_cmd_mapping, you don't even have a path for read=
s.
> >>> I bet something along:
> >>> 	CMD_READ0:
> >>> 		ret =3D XXX_OPCODE_READ;
> >>> 		break;
> >>> will make it work.
> >>>
> >>> Please fix the driver and test with nandbiterrs -i. If this test work=
s,
> >>> it is encouraging. Otherwise it is still broken. =20
> >>
> >>    ok understand. Will fix this up. =20
> >=20
> > This is urgent now. The driver in -next is broken, shall I revert
> > everything or will you test the above fix quickly?
> >  =20
>=20
>    While we are able to reproduce the issue, add path for
>    CMD_READ0/READ_START for IPQ platforms. All mtd tests including
>    nandbiterrs works fine.  But we are not able to get hold of a SDX
>    device where we could reproduce the issue to debug. We are working
>    offline with Manivannan for the SDX remote debug. Will keep you
>    updated here and if we are not able to solve this on SDX in next
>    couple of days, only way looks like revert and re-apply it for 6.7.

If the READ path works on IPQ platforms it's already a huge step
forward, please send the fix on top of Mannivan series.

Now, what is the issue with SDX?

Thanks,
Miqu=C3=A8l

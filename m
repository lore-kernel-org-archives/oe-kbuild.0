Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4ED107B6;
	Mon,  7 Aug 2023 19:15:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56C7D20003;
	Mon,  7 Aug 2023 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691435702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yRj+biPMMEewkac6Mh9a3dsWTbsGp7QJKvi4ppoOr4E=;
	b=e7NedBUz8FCKyn34LBafArR+xm10mVJf1SCtEIdVi7y/spS2KC83Lhirwvo21f7Z9Zit+p
	QS0O7spXvHzkVxORccCm4/neMeVHTyt2HIrlRZx1AGyqIDNvtwqFuWzO6toul7RrNvkVKK
	fYthc6uWWSWHz++PugRhl+Xxgi8ocDUKVt2GNVcFXke1gWSlavGYBtiGUEJ/sXQkPe/jDc
	lKLWfPcFhAC3eL7lahNAFTFPWtl8Lvxtd82ch+WoMlS5n4SL1zVJZ+0hMu0YQtGIw8otFY
	ikTEhTohN4frpXRf4Ks5uAOD9JPWwCyXAR++0x0L0+jUcV5vOIqnO3Iug/khCA==
Date: Mon, 7 Aug 2023 21:14:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>, "Md Sadre Alam"
 <quic_mdalam@quicinc.com>, <lkp@intel.com>,
 <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 1937/6910]
 drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error:
 uninitialized symbol 'ret'.
Message-ID: <20230807211458.3de7c627@xps-13>
In-Reply-To: <908ee5e8-6213-5685-7094-8c4b1282015c@quicinc.com>
References: <7ad1160b-5f8c-47af-a1c5-51b34f656fab@kadam.mountain>
	<20230804184550.0cb12369@xps-13>
	<3604e2ed-8d30-4f7b-9e56-7af5b23b2ac5@kadam.mountain>
	<20230804190750.3367a044@xps-13>
	<20230805065510.GA18650@thinkpad>
	<db088950-c25b-f0c0-851a-c5d56611c7c9@quicinc.com>
	<908ee5e8-6213-5685-7094-8c4b1282015c@quicinc.com>
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

quic_srichara@quicinc.com wrote on Tue, 8 Aug 2023 00:24:08 +0530:

> Hi Mani/Miquel,
>=20
> On 8/6/2023 1:28 PM, Sricharan Ramabadhran wrote:
> > Hi Miquel/Mani/Dan,
> >=20
> > <..>
> >=20
> >>>>> The || should be &&, otherwise it cannot work, or am I missing
> >>>>> something?
> >>>>
> >>>> Yeah.=C2=A0 That's how this bug normally looks like.=C2=A0 NAND_OP_C=
MD_INSTR
> >>>> always returns -ENOTSUPP.
> >>>>
> >>
> >> Yes, this is a bug.
> >>
> >> I didn't get a chance to review the exec_op conversion series (blame >=
> myself).
> >> Now I see scope for a cleaup series :/
> >>
> >> Let me spin something by the end of today.
> >>
> >  =C2=A0 Thanks a lot Mani for the quick fixes. Will test it.
> >  =C2=A0 Sorry it was a holiday for us past few days, so just checked th=
is.
> >=20
> > Regards,
> >  =C2=A0Sricharan
>=20
>   With this series applied on linux-next, started seeing the below
>   messages flooded on console while doing mtd r/w.
>   "xxx "Opcode not supported: 0"
>=20
>   opcode '0' corresponds to NAND_CMD_READ0. This command inturn was
>   invoked from qcom_nandc.c driver from below places. For read/write_page
>   driver does not use the exec ops. Hence these calls just ends up
>   being -ENOTSUPP and ignored. So removed their invocations.
>   If this is fine, can this be added to your series ? (will send
>   git-format patch to add to your cleanup series). So far, tested
>   mtd raw/block read/writes and all works fine. Will do further tests
>   as well.

Unless I really don't understand the controller, this is non sense.
nand_read_page_op() is precisely what allows your NAND to perform a
read. Removing this call cannot work.

What you need is a proper ->exec_op() implementation, and repeating
this becomes slightly annoying.=20

Look at your qcom_op_cmd_mapping, you don't even have a path for reads.
I bet something along:
	CMD_READ0:
		ret =3D XXX_OPCODE_READ;
		break;
will make it work.

Please fix the driver and test with nandbiterrs -i. If this test works,
it is encouraging. Otherwise it is still broken.
=20
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -1470,7 +1470,6 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct=
 nand_chip *chip,
>          int ret, reg_off =3D FLASH_BUF_ACC, read_loc =3D 0;
>          int raw_cw =3D cw;
>=20
> -       nand_read_page_op(chip, page, 0, NULL, 0);
>          host->use_ecc =3D false;
>=20
>          if (nandc->props->qpic_v2)
> @@ -1890,7 +1889,6 @@ static int qcom_nandc_read_page(struct nand_chip *c=
hip, u8 *buf,
>          if (host->nr_boot_partitions)
>                  qcom_nandc_codeword_fixup(host, page);
>=20
> -       nand_read_page_op(chip, page, 0, NULL, 0);
>          nandc->buf_count =3D 0;
>          nandc->buf_start =3D 0;
>          host->use_ecc =3D true;
> @@ -1965,8 +1963,6 @@ static int qcom_nandc_write_page(struct nand_chip *=
chip, const u8 *buf,
>          if (host->nr_boot_partitions)
>                  qcom_nandc_codeword_fixup(host, page);
>=20
> -       nand_prog_page_begin_op(chip, page, 0, NULL, 0);
> -
>          set_address(host, 0, page);
>          nandc->buf_count =3D 0;
>          nandc->buf_start =3D 0;
> @@ -2039,7 +2035,6 @@ static int qcom_nandc_write_page_raw(struct nand_ch=
ip *chip,
>          if (host->nr_boot_partitions)
>                  qcom_nandc_codeword_fixup(host, page);
>=20
> -       nand_prog_page_begin_op(chip, page, 0, NULL, 0);
>          clear_read_regs(nandc);
>          clear_bam_transaction(nandc);
>=20
>=20
> Regards,
>   Sricharan


Miqu=C3=A8l

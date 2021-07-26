Content-Type: multipart/mixed; boundary="===============8095443935524919210=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master 1517/2389] sound/pci/als4000.c:930 snd_card_als4000_probe() warn: 'pci' not released on lines: 852, 872.
Date: Mon, 26 Jul 2021 15:45:15 +0300
Message-ID: <20210726124515.GJ25548@kadam>
In-Reply-To: <s5hr1fqjp88.wl-tiwai@suse.de>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8095443935524919210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 06:19:19PM +0200, Takashi Iwai wrote:
> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  827  =

> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  828  	/* enable PCI device */
> > 0e175f665960c7 Takashi Iwai    2021-07-15  829  	err =3D pcim_enable_de=
vice(pci);
> > 61ea06e8a88163 Takashi Iwai    2021-06-08  830  	if (err < 0)
> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  831  		return err;
> > 61ea06e8a88163 Takashi Iwai    2021-06-08  832  =

> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  833  	/* check, if we can re=
strict PCI DMA transfers to 24 bits */
> > 669f65eaeb969e Takashi Iwai    2021-01-14  834  	if (dma_set_mask_and_c=
oherent(&pci->dev, DMA_BIT_MASK(24))) {
> > d85d878efb3047 Takashi Iwai    2014-02-25  835  		dev_err(&pci->dev, "a=
rchitecture does not support 24bit PCI busmaster DMA\n");
> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  836  		return -ENXIO;
> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  837  	}
> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  838  =

> > 61ea06e8a88163 Takashi Iwai    2021-06-08  839  	err =3D pci_request_re=
gions(pci, "ALS4000");
> >                                                         ^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 0e175f665960c7 Takashi Iwai    2021-07-15  840  	if (err < 0)
> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  841  		return err;
> > c0874449849175 Andreas Mohr    2008-08-20  842  	iobase =3D pci_resourc=
e_start(pci, 0);
> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  843  =

> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  844  	pci_read_config_word(p=
ci, PCI_COMMAND, &word);
> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  845  	pci_write_config_word(=
pci, PCI_COMMAND, word | PCI_COMMAND_IO);
> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  846  	pci_set_master(pci);
> > ^1da177e4c3f41 Linus Torvalds  2005-04-16  847  	=

> > 0e175f665960c7 Takashi Iwai    2021-07-15  848  	err =3D snd_devm_card_=
new(&pci->dev, index[dev], id[dev], THIS_MODULE,
> > e58de7baf7de11 Takashi Iwai    2008-12-28  849  				sizeof(*acard) /* p=
rivate_data: acard */,
> > e58de7baf7de11 Takashi Iwai    2008-12-28  850  				&card);
> > 0e175f665960c7 Takashi Iwai    2021-07-15  851  	if (err < 0)
> > e58de7baf7de11 Takashi Iwai    2008-12-28  852  		return err;
> >                                                                 ^^^^^^^=
^^^
> > Smatch complains because there is no error handling.  Maybe the other
> > error paths use devm_ magic?  Or more likely Smatch just isn't smart
> > enough...
> =

> I believe those are false-positive.
> =

> When the PCI device is already managed via pcim_enable_device(), all
> resources (even the ones without pcim_ or devm_) are freed
> automagically.

Thanks!  I've marked everything after pcim_enable_device or
pci_enable_device() as managed (will push later).

regards,
dan carpenter

--===============8095443935524919210==--


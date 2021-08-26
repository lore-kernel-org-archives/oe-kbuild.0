Content-Type: multipart/mixed; boundary="===============2480309912614324767=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [cxl-cxl:pending 39/40] drivers/cxl/core/bus.c:501 devm_cxl_add_decoder() warn: variable dereferenced before check 'cxld' (see line 497)
Date: Thu, 26 Aug 2021 15:50:21 +0300
Message-ID: <20210826125020.GA7722@kadam>
In-Reply-To: <202108250714.GDy2jUg2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2480309912614324767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 25, 2021 at 10:12:32AM +0300, Dan Carpenter wrote:
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  494  int d=
evm_cxl_add_decoder(struct device *host, struct cxl_decoder *cxld,
> 574d46ed53b527 drivers/cxl/core/bus.c Dan Williams 2021-08-24  495  			 i=
nt *target_map)
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  496  {
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24 @497  	stru=
ct cxl_port *port =3D to_cxl_port(cxld->dev.parent);
>                                                                          =
                                   ^^^^^^^^^^^^^^^^
> Dereference
> =

> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  498  	stru=
ct device *dev;
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  499  	int =
rc =3D 0, i;
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  500  =

> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24 @501  	if (=
!cxld)
>                                                                          =
   ^^^^^
> Checked too late.
> =

> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  502  		ret=
urn -EINVAL;
> 574d46ed53b527 drivers/cxl/core/bus.c Dan Williams 2021-08-24  503  =

> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  504  	if (=
IS_ERR(cxld))
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  505  		ret=
urn PTR_ERR(cxld);
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  506  =

> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  507  	if (=
cxld->interleave_ways < 1) {
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  508  		rc =
=3D -EINVAL;
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  509  		got=
o err;
> =

> "dev" not initialized at this point.
> =

> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  510  	}
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  511  =

> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  512  	devi=
ce_lock(&port->dev);
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  513  	if (=
list_empty(&port->dports))
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  514  		rc =
=3D -EINVAL;
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  515  =

> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  516  	for =
(i =3D 0; rc =3D=3D 0 && target_map && i < cxld->nr_targets; i++) {
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  517  		str=
uct cxl_dport *dport =3D find_dport(port, target_map[i]);
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  518  =

> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  519  		if =
(!dport) {
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  520  			rc=
 =3D -ENXIO;
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  521  			br=
eak;
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  522  		}
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  523  		dev=
_dbg(host, "%s: target: %d\n", dev_name(dport->dport), i);
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  524  		cxl=
d->target[i] =3D dport;
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  525  	}
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  526  	devi=
ce_unlock(&port->dev);
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  527  	if (=
rc)
> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  528  		got=
o err;
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  529  =

> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  530  	dev =
=3D &cxld->dev;
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  531  	rc =
=3D dev_set_name(dev, "decoder%d.%d", port->id, cxld->id);
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  532  	if (=
rc)
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  533  		got=
o err;
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  534  =

> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  535  	rc =
=3D device_add(dev);
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  536  	if (=
rc)
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  537  		got=
o err;
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  538  =

> b7ca54b6255144 drivers/cxl/core/bus.c Dan Williams 2021-08-24  539  	retu=
rn devm_add_action_or_reset(host, unregister_cxl_dev, dev);
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09  540  err:
> 40ba17afdfabb0 drivers/cxl/core.c     Dan Williams 2021-06-09 @541  	put_=
device(dev);
> =

> Should be:
> =

> 	put_device(&cxld->dev);
> =

> But it feels like a layering violation to drop a reference that was
> aquired by the caller.

This code hit linux-next yesterday so I reviewed it in context.  The
put_device() should just be removed.  It leads to a use after free.

regards,
dan carpenter

--===============2480309912614324767==--


Content-Type: multipart/mixed; boundary="===============5976430925277228849=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] i2c: virtio: add a virtio i2c frontend driver
Date: Mon, 14 Sep 2020 18:47:27 +0300
Message-ID: <20200914154726.GE18329@kadam>
In-Reply-To: <20200914152455.GI3956970@smile.fi.intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5976430925277228849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2020 at 06:24:55PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 14, 2020 at 05:48:07PM +0300, Dan Carpenter wrote:
> > Hi Jie,
> > =

> > url:    https://github.com/0day-ci/linux/commits/Jie-Deng/i2c-virtio-ad=
d-a-virtio-i2c-frontend-driver/20200911-115013 =

> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git  =
i2c/for-next
> > config: parisc-randconfig-m031-20200913 (attached as .config)
> > compiler: hppa-linux-gcc (GCC) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > drivers/i2c/busses/i2c-virtio.c:160 virtio_i2c_xfer() error: we previou=
sly assumed 'vmsg' could be null (see line 137)
> > =

> =

> It's quite possible a false positive. Look at 122. But I agree that for-l=
oop is
> not the best for such things to understand. Perhaps switching to do {} wh=
ile ()
> will make it better.
> =


Smatch is assuming that virtqueue_get_buf() can return NULL on the last
iteration through the loop.

regards,
dan carpenter


> > # https://github.com/0day-ci/linux/commit/0a54ec771966748fcbc86256b830b=
5f786168b7d =

> > git remote add linux-review https://github.com/0day-ci/linux =

> > git fetch --no-tags linux-review Jie-Deng/i2c-virtio-add-a-virtio-i2c-f=
rontend-driver/20200911-115013
> > git checkout 0a54ec771966748fcbc86256b830b5f786168b7d
> > vim +/vmsg +160 drivers/i2c/busses/i2c-virtio.c
> > =

> > 0a54ec77196674 Jie Deng 2020-09-11  109  static int virtio_i2c_xfer(str=
uct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > 0a54ec77196674 Jie Deng 2020-09-11  110  {
> > 0a54ec77196674 Jie Deng 2020-09-11  111  	struct virtio_i2c *vi =3D i2c=
_get_adapdata(adap);
> > 0a54ec77196674 Jie Deng 2020-09-11  112  	struct virtqueue *vq =3D vi->=
vq;
> > 0a54ec77196674 Jie Deng 2020-09-11  113  	struct virtio_i2c_msg *vmsg;
> > 0a54ec77196674 Jie Deng 2020-09-11  114  	unsigned long time_left;
> > 0a54ec77196674 Jie Deng 2020-09-11  115  	int len, i, ret =3D 0;
> > 0a54ec77196674 Jie Deng 2020-09-11  116  =

> > 0a54ec77196674 Jie Deng 2020-09-11  117  	mutex_lock(&vi->i2c_lock);
> > 0a54ec77196674 Jie Deng 2020-09-11  118  	vmsg =3D &vi->vmsg;
> > 0a54ec77196674 Jie Deng 2020-09-11  119  	vmsg->buf =3D NULL;
> > 0a54ec77196674 Jie Deng 2020-09-11  120  =

> > 0a54ec77196674 Jie Deng 2020-09-11  121  	for (i =3D 0; i < num; i++) {
> > 0a54ec77196674 Jie Deng 2020-09-11  122  		ret =3D virtio_i2c_add_msg(v=
q, vmsg, &msgs[i]);
> > 0a54ec77196674 Jie Deng 2020-09-11  123  		if (ret) {
> > 0a54ec77196674 Jie Deng 2020-09-11  124  			dev_err(&adap->dev, "failed=
 to add msg[%d] to virtqueue.\n", i);
> > 0a54ec77196674 Jie Deng 2020-09-11  125  			break;
> > 0a54ec77196674 Jie Deng 2020-09-11  126  		}
> > 0a54ec77196674 Jie Deng 2020-09-11  127  =

> > 0a54ec77196674 Jie Deng 2020-09-11  128  		virtqueue_kick(vq);
> > 0a54ec77196674 Jie Deng 2020-09-11  129  =

> > 0a54ec77196674 Jie Deng 2020-09-11  130  		time_left =3D wait_for_compl=
etion_timeout(&vi->completion, adap->timeout);
> > 0a54ec77196674 Jie Deng 2020-09-11  131  		if (!time_left) {
> > 0a54ec77196674 Jie Deng 2020-09-11  132  			dev_err(&adap->dev, "msg[%d=
]: addr=3D0x%x timeout.\n", i, msgs[i].addr);
> > 0a54ec77196674 Jie Deng 2020-09-11  133  			break;
> > 0a54ec77196674 Jie Deng 2020-09-11  134  		}
> > 0a54ec77196674 Jie Deng 2020-09-11  135  =

> > 0a54ec77196674 Jie Deng 2020-09-11  136  		vmsg =3D (struct virtio_i2c_=
msg *)virtqueue_get_buf(vq, &len);
> > 0a54ec77196674 Jie Deng 2020-09-11 @137  		if (vmsg) {
> >                                                             ^^^^
> > Check for NULL.
> > =

> > 0a54ec77196674 Jie Deng 2020-09-11  138  			/* vmsg should point to the=
 same address with &vi->vmsg */
> > 0a54ec77196674 Jie Deng 2020-09-11  139  			if (vmsg !=3D &vi->vmsg) {
> > 0a54ec77196674 Jie Deng 2020-09-11  140  				dev_err(&adap->dev, "msg[%=
d]: addr=3D0x%x virtqueue error.\n",
> > 0a54ec77196674 Jie Deng 2020-09-11  141  					i, le16_to_cpu(vmsg->hdr.=
addr));
> > 0a54ec77196674 Jie Deng 2020-09-11  142  				break;
> > 0a54ec77196674 Jie Deng 2020-09-11  143  			}
> > 0a54ec77196674 Jie Deng 2020-09-11  144  			if (vmsg->status !=3D VIRTI=
O_I2C_MSG_OK) {
> > 0a54ec77196674 Jie Deng 2020-09-11  145  				dev_err(&adap->dev, "msg[%=
d]: addr=3D0x%x error=3D%d.\n",
> > 0a54ec77196674 Jie Deng 2020-09-11  146  					i, le16_to_cpu(vmsg->hdr.=
addr), vmsg->status);
> > 0a54ec77196674 Jie Deng 2020-09-11  147  				break;
> > 0a54ec77196674 Jie Deng 2020-09-11  148  			}
> > 0a54ec77196674 Jie Deng 2020-09-11  149  			if ((msgs[i].flags & I2C_M_=
RD) && msgs[i].len)
> > 0a54ec77196674 Jie Deng 2020-09-11  150  				memcpy(msgs[i].buf, vmsg->=
buf, msgs[i].len);
> > 0a54ec77196674 Jie Deng 2020-09-11  151  =

> > 0a54ec77196674 Jie Deng 2020-09-11  152  			kfree(vmsg->buf);
> > 0a54ec77196674 Jie Deng 2020-09-11  153  			vmsg->buf =3D NULL;
> > 0a54ec77196674 Jie Deng 2020-09-11  154  		}
> > 0a54ec77196674 Jie Deng 2020-09-11  155  =

> > 0a54ec77196674 Jie Deng 2020-09-11  156  		reinit_completion(&vi->compl=
etion);
> > 0a54ec77196674 Jie Deng 2020-09-11  157  	}
> > 0a54ec77196674 Jie Deng 2020-09-11  158  =

> > 0a54ec77196674 Jie Deng 2020-09-11  159  	mutex_unlock(&vi->i2c_lock);
> > 0a54ec77196674 Jie Deng 2020-09-11 @160  	kfree(vmsg->buf);
> >                                                       ^^^^^^^^^
> > Unchecked dereference.
> > =

> > 0a54ec77196674 Jie Deng 2020-09-11  161  	return ((ret < 0) ? ret : i);
> > 0a54ec77196674 Jie Deng 2020-09-11  162  }
> > =

> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

> =

> =

> =

> -- =

> With Best Regards,
> Andy Shevchenko
>=20
--===============5976430925277228849==--


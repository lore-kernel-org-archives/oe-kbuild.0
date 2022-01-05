Content-Type: multipart/mixed; boundary="===============2398252752054012525=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] gnss: add USB support
Date: Thu, 06 Jan 2022 01:20:13 +0800
Message-ID: <202201060110.w9bLWwnW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2398252752054012525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211220111901.23206-2-johan@kernel.org>
References: <20211220111901.23206-2-johan@kernel.org>
TO: Johan Hovold <johan@kernel.org>

Hi Johan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on johan-usb-serial/usb-next]
[also build test WARNING on usb/usb-testing linus/master balbi-usb/testing/=
next peter-chen-usb/for-usb-next v5.16-rc8]
[cannot apply to next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Johan-Hovold/gnss-add-USB-=
support/20211220-192005
base:   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.gi=
t usb-next
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: parisc-randconfig-m031-20220105 (https://download.01.org/0day-ci/ar=
chive/20220106/202201060110.w9bLWwnW-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gnss/usb.c:155 gnss_usb_probe() warn: missing error code 'ret'

vim +/ret +155 drivers/gnss/usb.c

8b66a253fbf538 Johan Hovold 2021-12-20  116  =

8b66a253fbf538 Johan Hovold 2021-12-20  117  static int gnss_usb_probe(stru=
ct usb_interface *intf, const struct usb_device_id *id)
8b66a253fbf538 Johan Hovold 2021-12-20  118  {
8b66a253fbf538 Johan Hovold 2021-12-20  119  	struct usb_device *udev =3D i=
nterface_to_usbdev(intf);
8b66a253fbf538 Johan Hovold 2021-12-20  120  	struct usb_endpoint_descripto=
r *in, *out;
8b66a253fbf538 Johan Hovold 2021-12-20  121  	struct gnss_device *gdev;
8b66a253fbf538 Johan Hovold 2021-12-20  122  	struct gnss_usb *gusb;
8b66a253fbf538 Johan Hovold 2021-12-20  123  	struct urb *urb;
8b66a253fbf538 Johan Hovold 2021-12-20  124  	size_t buf_len;
8b66a253fbf538 Johan Hovold 2021-12-20  125  	void *buf;
8b66a253fbf538 Johan Hovold 2021-12-20  126  	int ret;
8b66a253fbf538 Johan Hovold 2021-12-20  127  =

8b66a253fbf538 Johan Hovold 2021-12-20  128  	ret =3D usb_find_common_endpo=
ints(intf->cur_altsetting, &in, &out, NULL,
8b66a253fbf538 Johan Hovold 2021-12-20  129  			NULL);
8b66a253fbf538 Johan Hovold 2021-12-20  130  	if (ret)
8b66a253fbf538 Johan Hovold 2021-12-20  131  		return ret;
8b66a253fbf538 Johan Hovold 2021-12-20  132  =

8b66a253fbf538 Johan Hovold 2021-12-20  133  	gusb =3D kzalloc(sizeof(*gusb=
), GFP_KERNEL);
8b66a253fbf538 Johan Hovold 2021-12-20  134  	if (!gusb)
8b66a253fbf538 Johan Hovold 2021-12-20  135  		return -ENOMEM;
8b66a253fbf538 Johan Hovold 2021-12-20  136  =

8b66a253fbf538 Johan Hovold 2021-12-20  137  	gdev =3D gnss_allocate_device=
(&intf->dev);
8b66a253fbf538 Johan Hovold 2021-12-20  138  	if (!gdev) {
8b66a253fbf538 Johan Hovold 2021-12-20  139  		ret =3D -ENOMEM;
8b66a253fbf538 Johan Hovold 2021-12-20  140  		goto err_free_gusb;
8b66a253fbf538 Johan Hovold 2021-12-20  141  	}
8b66a253fbf538 Johan Hovold 2021-12-20  142  =

8b66a253fbf538 Johan Hovold 2021-12-20  143  	gdev->ops =3D &gnss_usb_gnss_=
ops;
8b66a253fbf538 Johan Hovold 2021-12-20  144  	gdev->type =3D GNSS_TYPE_NMEA;
8b66a253fbf538 Johan Hovold 2021-12-20  145  	gnss_set_drvdata(gdev, gusb);
8b66a253fbf538 Johan Hovold 2021-12-20  146  =

8b66a253fbf538 Johan Hovold 2021-12-20  147  	urb =3D usb_alloc_urb(0, GFP_=
KERNEL);
8b66a253fbf538 Johan Hovold 2021-12-20  148  	if (!urb)
8b66a253fbf538 Johan Hovold 2021-12-20  149  		goto err_put_gdev;
8b66a253fbf538 Johan Hovold 2021-12-20  150  =

8b66a253fbf538 Johan Hovold 2021-12-20  151  	buf_len =3D max(usb_endpoint_=
maxp(in), GNSS_USB_READ_BUF_LEN);
8b66a253fbf538 Johan Hovold 2021-12-20  152  =

8b66a253fbf538 Johan Hovold 2021-12-20  153  	buf =3D kzalloc(buf_len, GFP_=
KERNEL);
8b66a253fbf538 Johan Hovold 2021-12-20  154  	if (!buf)
8b66a253fbf538 Johan Hovold 2021-12-20 @155  		goto err_free_urb;
8b66a253fbf538 Johan Hovold 2021-12-20  156  =

8b66a253fbf538 Johan Hovold 2021-12-20  157  	usb_fill_bulk_urb(urb, udev,
8b66a253fbf538 Johan Hovold 2021-12-20  158  			usb_rcvbulkpipe(udev, usb_e=
ndpoint_num(in)),
8b66a253fbf538 Johan Hovold 2021-12-20  159  			buf, buf_len, gnss_usb_rx_c=
omplete, gusb);
8b66a253fbf538 Johan Hovold 2021-12-20  160  =

8b66a253fbf538 Johan Hovold 2021-12-20  161  	gusb->intf =3D intf;
8b66a253fbf538 Johan Hovold 2021-12-20  162  	gusb->udev =3D udev;
8b66a253fbf538 Johan Hovold 2021-12-20  163  	gusb->gdev =3D gdev;
8b66a253fbf538 Johan Hovold 2021-12-20  164  	gusb->read_urb =3D urb;
8b66a253fbf538 Johan Hovold 2021-12-20  165  	gusb->write_pipe =3D usb_sndb=
ulkpipe(udev, usb_endpoint_num(out));
8b66a253fbf538 Johan Hovold 2021-12-20  166  =

8b66a253fbf538 Johan Hovold 2021-12-20  167  	ret =3D gnss_register_device(=
gdev);
8b66a253fbf538 Johan Hovold 2021-12-20  168  	if (ret)
8b66a253fbf538 Johan Hovold 2021-12-20  169  		goto err_free_buf;
8b66a253fbf538 Johan Hovold 2021-12-20  170  =

8b66a253fbf538 Johan Hovold 2021-12-20  171  	usb_set_intfdata(intf, gusb);
8b66a253fbf538 Johan Hovold 2021-12-20  172  =

8b66a253fbf538 Johan Hovold 2021-12-20  173  	return 0;
8b66a253fbf538 Johan Hovold 2021-12-20  174  =

8b66a253fbf538 Johan Hovold 2021-12-20  175  err_free_buf:
8b66a253fbf538 Johan Hovold 2021-12-20  176  	kfree(buf);
8b66a253fbf538 Johan Hovold 2021-12-20  177  err_free_urb:
8b66a253fbf538 Johan Hovold 2021-12-20  178  	usb_free_urb(urb);
8b66a253fbf538 Johan Hovold 2021-12-20  179  err_put_gdev:
8b66a253fbf538 Johan Hovold 2021-12-20  180  	gnss_put_device(gdev);
8b66a253fbf538 Johan Hovold 2021-12-20  181  err_free_gusb:
8b66a253fbf538 Johan Hovold 2021-12-20  182  	kfree(gusb);
8b66a253fbf538 Johan Hovold 2021-12-20  183  =

8b66a253fbf538 Johan Hovold 2021-12-20  184  	return ret;
8b66a253fbf538 Johan Hovold 2021-12-20  185  }
8b66a253fbf538 Johan Hovold 2021-12-20  186  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2398252752054012525==--


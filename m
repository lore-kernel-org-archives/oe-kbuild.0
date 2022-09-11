Content-Type: multipart/mixed; boundary="===============0527874199170362944=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gnss/usb.c:120:41: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 12 Sep 2022 07:02:39 +0800
Message-ID: <202209120618.Yi3jFKZV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0527874199170362944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
nss/usb.c:120:41: warning: use of uninitialized value '<unknown>' [CWE-457]=
 [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b96fbd602d35739b5cdb49baa02048f2c41fdab1
commit: ee4736e50ba261944ddae75469b3eb47a9e2847d gnss: add USB support
date:   9 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220906 (https://download.01.org/0day-ci/archi=
ve/20220912/202209120618.Yi3jFKZV-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dee4736e50ba261944ddae75469b3eb47a9e2847d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee4736e50ba261944ddae75469b3eb47a9e2847d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/gnss/usb.c: In function 'gnss_usb_probe':
>> drivers/gnss/usb.c:120:41: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     120 |         struct usb_endpoint_descriptor *in, *out;
         |                                         ^~
     'gnss_usb_probe': event 1
       |
       |  120 |         struct usb_endpoint_descriptor *in, *out;
       |      |                                         ^~
       |      |                                         |
       |      |                                         (1) use of uninitia=
lized value '<unknown>' here
       |
   drivers/gnss/usb.c:120:46: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     120 |         struct usb_endpoint_descriptor *in, *out;
         |                                              ^~~
     'gnss_usb_probe': event 1
       |
       |  120 |         struct usb_endpoint_descriptor *in, *out;
       |      |                                              ^~~
       |      |                                              |
       |      |                                              (1) use of uni=
nitialized value '<unknown>' here
       |

vim +120 drivers/gnss/usb.c

ee4736e50ba261 Johan Hovold 2021-12-20  116  =

ee4736e50ba261 Johan Hovold 2021-12-20  117  static int gnss_usb_probe(stru=
ct usb_interface *intf, const struct usb_device_id *id)
ee4736e50ba261 Johan Hovold 2021-12-20  118  {
ee4736e50ba261 Johan Hovold 2021-12-20  119  	struct usb_device *udev =3D i=
nterface_to_usbdev(intf);
ee4736e50ba261 Johan Hovold 2021-12-20 @120  	struct usb_endpoint_descripto=
r *in, *out;
ee4736e50ba261 Johan Hovold 2021-12-20  121  	struct gnss_device *gdev;
ee4736e50ba261 Johan Hovold 2021-12-20  122  	struct gnss_usb *gusb;
ee4736e50ba261 Johan Hovold 2021-12-20  123  	struct urb *urb;
ee4736e50ba261 Johan Hovold 2021-12-20  124  	size_t buf_len;
ee4736e50ba261 Johan Hovold 2021-12-20  125  	void *buf;
ee4736e50ba261 Johan Hovold 2021-12-20  126  	int ret;
ee4736e50ba261 Johan Hovold 2021-12-20  127  =

ee4736e50ba261 Johan Hovold 2021-12-20  128  	ret =3D usb_find_common_endpo=
ints(intf->cur_altsetting, &in, &out, NULL,
ee4736e50ba261 Johan Hovold 2021-12-20  129  			NULL);
ee4736e50ba261 Johan Hovold 2021-12-20  130  	if (ret)
ee4736e50ba261 Johan Hovold 2021-12-20  131  		return ret;
ee4736e50ba261 Johan Hovold 2021-12-20  132  =

ee4736e50ba261 Johan Hovold 2021-12-20  133  	gusb =3D kzalloc(sizeof(*gusb=
), GFP_KERNEL);
ee4736e50ba261 Johan Hovold 2021-12-20  134  	if (!gusb)
ee4736e50ba261 Johan Hovold 2021-12-20  135  		return -ENOMEM;
ee4736e50ba261 Johan Hovold 2021-12-20  136  =

ee4736e50ba261 Johan Hovold 2021-12-20  137  	gdev =3D gnss_allocate_device=
(&intf->dev);
ee4736e50ba261 Johan Hovold 2021-12-20  138  	if (!gdev) {
ee4736e50ba261 Johan Hovold 2021-12-20  139  		ret =3D -ENOMEM;
ee4736e50ba261 Johan Hovold 2021-12-20  140  		goto err_free_gusb;
ee4736e50ba261 Johan Hovold 2021-12-20  141  	}
ee4736e50ba261 Johan Hovold 2021-12-20  142  =

ee4736e50ba261 Johan Hovold 2021-12-20  143  	gdev->ops =3D &gnss_usb_gnss_=
ops;
ee4736e50ba261 Johan Hovold 2021-12-20  144  	gdev->type =3D GNSS_TYPE_NMEA;
ee4736e50ba261 Johan Hovold 2021-12-20  145  	gnss_set_drvdata(gdev, gusb);
ee4736e50ba261 Johan Hovold 2021-12-20  146  =

ee4736e50ba261 Johan Hovold 2021-12-20  147  	urb =3D usb_alloc_urb(0, GFP_=
KERNEL);
ee4736e50ba261 Johan Hovold 2021-12-20  148  	if (!urb) {
ee4736e50ba261 Johan Hovold 2021-12-20  149  		ret =3D -ENOMEM;
ee4736e50ba261 Johan Hovold 2021-12-20  150  		goto err_put_gdev;
ee4736e50ba261 Johan Hovold 2021-12-20  151  	}
ee4736e50ba261 Johan Hovold 2021-12-20  152  =

ee4736e50ba261 Johan Hovold 2021-12-20  153  	buf_len =3D max(usb_endpoint_=
maxp(in), GNSS_USB_READ_BUF_LEN);
ee4736e50ba261 Johan Hovold 2021-12-20  154  =

ee4736e50ba261 Johan Hovold 2021-12-20  155  	buf =3D kzalloc(buf_len, GFP_=
KERNEL);
ee4736e50ba261 Johan Hovold 2021-12-20  156  	if (!buf) {
ee4736e50ba261 Johan Hovold 2021-12-20  157  		ret =3D -ENOMEM;
ee4736e50ba261 Johan Hovold 2021-12-20  158  		goto err_free_urb;
ee4736e50ba261 Johan Hovold 2021-12-20  159  	}
ee4736e50ba261 Johan Hovold 2021-12-20  160  =

ee4736e50ba261 Johan Hovold 2021-12-20  161  	usb_fill_bulk_urb(urb, udev,
ee4736e50ba261 Johan Hovold 2021-12-20  162  			usb_rcvbulkpipe(udev, usb_e=
ndpoint_num(in)),
ee4736e50ba261 Johan Hovold 2021-12-20  163  			buf, buf_len, gnss_usb_rx_c=
omplete, gusb);
ee4736e50ba261 Johan Hovold 2021-12-20  164  =

ee4736e50ba261 Johan Hovold 2021-12-20  165  	gusb->intf =3D intf;
ee4736e50ba261 Johan Hovold 2021-12-20  166  	gusb->udev =3D udev;
ee4736e50ba261 Johan Hovold 2021-12-20  167  	gusb->gdev =3D gdev;
ee4736e50ba261 Johan Hovold 2021-12-20  168  	gusb->read_urb =3D urb;
ee4736e50ba261 Johan Hovold 2021-12-20  169  	gusb->write_pipe =3D usb_sndb=
ulkpipe(udev, usb_endpoint_num(out));
ee4736e50ba261 Johan Hovold 2021-12-20  170  =

ee4736e50ba261 Johan Hovold 2021-12-20  171  	ret =3D gnss_register_device(=
gdev);
ee4736e50ba261 Johan Hovold 2021-12-20  172  	if (ret)
ee4736e50ba261 Johan Hovold 2021-12-20  173  		goto err_free_buf;
ee4736e50ba261 Johan Hovold 2021-12-20  174  =

ee4736e50ba261 Johan Hovold 2021-12-20  175  	usb_set_intfdata(intf, gusb);
ee4736e50ba261 Johan Hovold 2021-12-20  176  =

ee4736e50ba261 Johan Hovold 2021-12-20  177  	return 0;
ee4736e50ba261 Johan Hovold 2021-12-20  178  =

ee4736e50ba261 Johan Hovold 2021-12-20  179  err_free_buf:
ee4736e50ba261 Johan Hovold 2021-12-20  180  	kfree(buf);
ee4736e50ba261 Johan Hovold 2021-12-20  181  err_free_urb:
ee4736e50ba261 Johan Hovold 2021-12-20  182  	usb_free_urb(urb);
ee4736e50ba261 Johan Hovold 2021-12-20  183  err_put_gdev:
ee4736e50ba261 Johan Hovold 2021-12-20  184  	gnss_put_device(gdev);
ee4736e50ba261 Johan Hovold 2021-12-20  185  err_free_gusb:
ee4736e50ba261 Johan Hovold 2021-12-20  186  	kfree(gusb);
ee4736e50ba261 Johan Hovold 2021-12-20  187  =

ee4736e50ba261 Johan Hovold 2021-12-20  188  	return ret;
ee4736e50ba261 Johan Hovold 2021-12-20  189  }
ee4736e50ba261 Johan Hovold 2021-12-20  190  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0527874199170362944==--


Content-Type: multipart/mixed; boundary="===============1721735354523329859=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] USB: hub: add module parameters to usbcore for port init retries
Date: Sun, 19 Jun 2022 14:57:07 +0800
Message-ID: <202206191456.FfS44rox-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1721735354523329859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220617102256.3253019-1-raychi@google.com>
References: <20220617102256.3253019-1-raychi@google.com>
TO: Ray Chi <raychi@google.com>
TO: corbet(a)lwn.net
TO: gregkh(a)linuxfoundation.org
CC: linux-doc(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-usb(a)vger.kernel.org
CC: albertccwang(a)google.com
CC: Ray Chi <raychi@google.com>

Hi Ray,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ray-Chi/USB-hub-add-=
module-parameters-to-usbcore-for-port-init-retries/20220617-182442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-m031-20220619 (https://download.01.org/0day-ci/ar=
chive/20220619/202206191456.FfS44rox-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/core/hub.c:3061 hub_port_reset() error: uninitialized symbol 's=
tatus'.

vim +/status +3061 drivers/usb/core/hub.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  2955  =

75d7cf72ab9fa0 Andiry Xu         2011-09-13  2956  /* Handle port reset and=
 port warm(BH) reset (for USB3 protocol ports) */
75d7cf72ab9fa0 Andiry Xu         2011-09-13  2957  static int hub_port_rese=
t(struct usb_hub *hub, int port1,
75d7cf72ab9fa0 Andiry Xu         2011-09-13  2958  			struct usb_device *ud=
ev, unsigned int delay, bool warm)
5e467f6ebab151 Andiry Xu         2011-04-27  2959  {
75d7cf72ab9fa0 Andiry Xu         2011-09-13  2960  	int i, status;
a24a6078754f28 Sarah Sharp       2012-11-01  2961  	u16 portchange, portsta=
tus;
d99f6b41308779 Dan Williams      2014-05-20  2962  	struct usb_port *port_d=
ev =3D hub->ports[port1 - 1];
781f0766cc41a9 Kai-Heng Feng     2018-10-19  2963  	int reset_recovery_time;
5e467f6ebab151 Andiry Xu         2011-04-27  2964  =

5e467f6ebab151 Andiry Xu         2011-04-27  2965  	if (!hub_is_superspeed(=
hub->hdev)) {
0fe51aa5eee51d Sarah Sharp       2012-11-01  2966  		if (warm) {
75d7cf72ab9fa0 Andiry Xu         2011-09-13  2967  			dev_err(hub->intfdev,=
 "only USB3 hub support "
75d7cf72ab9fa0 Andiry Xu         2011-09-13  2968  						"warm reset\n");
5e467f6ebab151 Andiry Xu         2011-04-27  2969  			return -EINVAL;
5e467f6ebab151 Andiry Xu         2011-04-27  2970  		}
0fe51aa5eee51d Sarah Sharp       2012-11-01  2971  		/* Block EHCI CF initi=
alization during the port reset.
0fe51aa5eee51d Sarah Sharp       2012-11-01  2972  		 * Some companion cont=
rollers don't like it when they mix.
0fe51aa5eee51d Sarah Sharp       2012-11-01  2973  		 */
0fe51aa5eee51d Sarah Sharp       2012-11-01  2974  		down_read(&ehci_cf_por=
t_reset_rwsem);
d3b9d7a9051d70 Sarah Sharp       2012-11-01  2975  	} else if (!warm) {
d3b9d7a9051d70 Sarah Sharp       2012-11-01  2976  		/*
d3b9d7a9051d70 Sarah Sharp       2012-11-01  2977  		 * If the caller hasn'=
t explicitly requested a warm reset,
d3b9d7a9051d70 Sarah Sharp       2012-11-01  2978  		 * double check and se=
e if one is needed.
d3b9d7a9051d70 Sarah Sharp       2012-11-01  2979  		 */
f061f43d7418cb Michael Grzeschik 2022-06-07  2980  		if (usb_hub_port_statu=
s(hub, port1, &portstatus,
f061f43d7418cb Michael Grzeschik 2022-06-07  2981  					&portchange) =3D=3D=
 0)
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  2982  			if (hub_port_warm_res=
et_required(hub, port1,
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  2983  							portstatus))
d3b9d7a9051d70 Sarah Sharp       2012-11-01  2984  				warm =3D true;
75d7cf72ab9fa0 Andiry Xu         2011-09-13  2985  	}
3cd12f91514da6 Dan Williams      2014-05-29  2986  	clear_bit(port1, hub->w=
arm_reset_bits);
5e467f6ebab151 Andiry Xu         2011-04-27  2987  =

75d7cf72ab9fa0 Andiry Xu         2011-09-13  2988  	/* Reset the port */
079a8b75b95ac4 Ray Chi           2022-06-17  2989  	for (i =3D 0; i < port_=
reset_tries; i++) {
75d7cf72ab9fa0 Andiry Xu         2011-09-13  2990  		status =3D set_port_fe=
ature(hub->hdev, port1, (warm ?
75d7cf72ab9fa0 Andiry Xu         2011-09-13  2991  					USB_PORT_FEAT_BH_PO=
RT_RESET :
75d7cf72ab9fa0 Andiry Xu         2011-09-13  2992  					USB_PORT_FEAT_RESET=
));
e9e88fb7bca9f5 Alan Stern        2013-03-27  2993  		if (status =3D=3D -ENO=
DEV) {
e9e88fb7bca9f5 Alan Stern        2013-03-27  2994  			;	/* The hub is gone =
*/
e9e88fb7bca9f5 Alan Stern        2013-03-27  2995  		} else if (status) {
d99f6b41308779 Dan Williams      2014-05-20  2996  			dev_err(&port_dev->de=
v,
d99f6b41308779 Dan Williams      2014-05-20  2997  					"cannot %sreset (er=
r =3D %d)\n",
d99f6b41308779 Dan Williams      2014-05-20  2998  					warm ? "warm " : ""=
, status);
75d7cf72ab9fa0 Andiry Xu         2011-09-13  2999  		} else {
75d7cf72ab9fa0 Andiry Xu         2011-09-13  3000  			status =3D hub_port_w=
ait_reset(hub, port1, udev, delay,
75d7cf72ab9fa0 Andiry Xu         2011-09-13  3001  								warm);
e9e88fb7bca9f5 Alan Stern        2013-03-27  3002  			if (status && status =
!=3D -ENOTCONN && status !=3D -ENODEV)
75d7cf72ab9fa0 Andiry Xu         2011-09-13  3003  				dev_dbg(hub->intfdev,
75d7cf72ab9fa0 Andiry Xu         2011-09-13  3004  						"port_wait_reset: =
err =3D %d\n",
75d7cf72ab9fa0 Andiry Xu         2011-09-13  3005  						status);
5e467f6ebab151 Andiry Xu         2011-04-27  3006  		}
5e467f6ebab151 Andiry Xu         2011-04-27  3007  =

c89686118c786a Kai-Heng Feng     2022-01-20  3008  		/*
c89686118c786a Kai-Heng Feng     2022-01-20  3009  		 * Check for disconnec=
t or reset, and bail out after several
c89686118c786a Kai-Heng Feng     2022-01-20  3010  		 * reset attempts to a=
void warm reset loop.
c89686118c786a Kai-Heng Feng     2022-01-20  3011  		 */
c89686118c786a Kai-Heng Feng     2022-01-20  3012  		if (status =3D=3D 0 ||=
 status =3D=3D -ENOTCONN || status =3D=3D -ENODEV ||
079a8b75b95ac4 Ray Chi           2022-06-17  3013  		    (status =3D=3D -EB=
USY && i =3D=3D port_reset_tries - 1)) {
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3014  			usb_clear_port_featur=
e(hub->hdev, port1,
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3015  					USB_PORT_FEAT_C_RES=
ET);
a24a6078754f28 Sarah Sharp       2012-11-01  3016  =

a24a6078754f28 Sarah Sharp       2012-11-01  3017  			if (!hub_is_superspee=
d(hub->hdev))
75d7cf72ab9fa0 Andiry Xu         2011-09-13  3018  				goto done;
a24a6078754f28 Sarah Sharp       2012-11-01  3019  =

fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3020  			usb_clear_port_featur=
e(hub->hdev, port1,
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3021  					USB_PORT_FEAT_C_BH_=
PORT_RESET);
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3022  			usb_clear_port_featur=
e(hub->hdev, port1,
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3023  					USB_PORT_FEAT_C_POR=
T_LINK_STATE);
22454b79e6de05 Dennis Wassenberg 2018-11-13  3024  =

22454b79e6de05 Dennis Wassenberg 2018-11-13  3025  			if (udev)
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3026  				usb_clear_port_featu=
re(hub->hdev, port1,
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3027  					USB_PORT_FEAT_C_CON=
NECTION);
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3028  =

a24a6078754f28 Sarah Sharp       2012-11-01  3029  			/*
a24a6078754f28 Sarah Sharp       2012-11-01  3030  			 * If a USB 3.0 devic=
e migrates from reset to an error
a24a6078754f28 Sarah Sharp       2012-11-01  3031  			 * state, re-issue th=
e warm reset.
a24a6078754f28 Sarah Sharp       2012-11-01  3032  			 */
f061f43d7418cb Michael Grzeschik 2022-06-07  3033  			if (usb_hub_port_stat=
us(hub, port1,
a24a6078754f28 Sarah Sharp       2012-11-01  3034  					&portstatus, &portc=
hange) < 0)
a24a6078754f28 Sarah Sharp       2012-11-01  3035  				goto done;
a24a6078754f28 Sarah Sharp       2012-11-01  3036  =

3cd12f91514da6 Dan Williams      2014-05-29  3037  			if (!hub_port_warm_re=
set_required(hub, port1,
3cd12f91514da6 Dan Williams      2014-05-29  3038  					portstatus))
a24a6078754f28 Sarah Sharp       2012-11-01  3039  				goto done;
a24a6078754f28 Sarah Sharp       2012-11-01  3040  =

a24a6078754f28 Sarah Sharp       2012-11-01  3041  			/*
a24a6078754f28 Sarah Sharp       2012-11-01  3042  			 * If the port is in =
SS.Inactive or Compliance Mode, the
a24a6078754f28 Sarah Sharp       2012-11-01  3043  			 * hot or warm reset =
failed.  Try another warm reset.
a24a6078754f28 Sarah Sharp       2012-11-01  3044  			 */
a24a6078754f28 Sarah Sharp       2012-11-01  3045  			if (!warm) {
d99f6b41308779 Dan Williams      2014-05-20  3046  				dev_dbg(&port_dev->d=
ev,
d99f6b41308779 Dan Williams      2014-05-20  3047  						"hot reset failed,=
 warm reset\n");
a24a6078754f28 Sarah Sharp       2012-11-01  3048  				warm =3D true;
a24a6078754f28 Sarah Sharp       2012-11-01  3049  			}
75d7cf72ab9fa0 Andiry Xu         2011-09-13  3050  		}
5e467f6ebab151 Andiry Xu         2011-04-27  3051  =

d99f6b41308779 Dan Williams      2014-05-20  3052  		dev_dbg(&port_dev->dev,
d99f6b41308779 Dan Williams      2014-05-20  3053  				"not enabled, trying=
 %sreset again...\n",
d99f6b41308779 Dan Williams      2014-05-20  3054  				warm ? "warm " : "");
75d7cf72ab9fa0 Andiry Xu         2011-09-13  3055  		delay =3D HUB_LONG_RES=
ET_TIME;
75d7cf72ab9fa0 Andiry Xu         2011-09-13  3056  	}
5e467f6ebab151 Andiry Xu         2011-04-27  3057  =

d99f6b41308779 Dan Williams      2014-05-20  3058  	dev_err(&port_dev->dev,=
 "Cannot enable. Maybe the USB cable is bad?\n");
5e467f6ebab151 Andiry Xu         2011-04-27  3059  =

75d7cf72ab9fa0 Andiry Xu         2011-09-13  3060  done:
fb6d1f7df5d252 Robert Schlabbach 2015-05-26 @3061  	if (status =3D=3D 0) {
aa071a92bbf09d Nicolas Boichat   2018-05-28  3062  		if (port_dev->quirks &=
 USB_PORT_QUIRK_FAST_ENUM)
aa071a92bbf09d Nicolas Boichat   2018-05-28  3063  			usleep_range(10000, 1=
2000);
781f0766cc41a9 Kai-Heng Feng     2018-10-19  3064  		else {
781f0766cc41a9 Kai-Heng Feng     2018-10-19  3065  			/* TRSTRCY =3D 10 ms;=
 plus some extra */
781f0766cc41a9 Kai-Heng Feng     2018-10-19  3066  			reset_recovery_time =
=3D 10 + 40;
781f0766cc41a9 Kai-Heng Feng     2018-10-19  3067  =

781f0766cc41a9 Kai-Heng Feng     2018-10-19  3068  			/* Hub needs extra de=
lay after resetting its port. */
781f0766cc41a9 Kai-Heng Feng     2018-10-19  3069  			if (hub->hdev->quirks=
 & USB_QUIRK_HUB_SLOW_RESET)
781f0766cc41a9 Kai-Heng Feng     2018-10-19  3070  				reset_recovery_time =
+=3D 100;
781f0766cc41a9 Kai-Heng Feng     2018-10-19  3071  =

781f0766cc41a9 Kai-Heng Feng     2018-10-19  3072  			msleep(reset_recovery=
_time);
781f0766cc41a9 Kai-Heng Feng     2018-10-19  3073  		}
aa071a92bbf09d Nicolas Boichat   2018-05-28  3074  =

fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3075  		if (udev) {
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3076  			struct usb_hcd *hcd =
=3D bus_to_hcd(udev->bus);
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3077  =

fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3078  			update_devnum(udev, 0=
);
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3079  			/* The xHC may think =
the device is already reset,
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3080  			 * so ignore the stat=
us.
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3081  			 */
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3082  			if (hcd->driver->rese=
t_device)
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3083  				hcd->driver->reset_d=
evice(hcd, udev);
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3084  =

fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3085  			usb_set_device_state(=
udev, USB_STATE_DEFAULT);
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3086  		}
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3087  	} else {
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3088  		if (udev)
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3089  			usb_set_device_state(=
udev, USB_STATE_NOTATTACHED);
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3090  	}
fb6d1f7df5d252 Robert Schlabbach 2015-05-26  3091  =

0fe51aa5eee51d Sarah Sharp       2012-11-01  3092  	if (!hub_is_superspeed(=
hub->hdev))
75d7cf72ab9fa0 Andiry Xu         2011-09-13  3093  		up_read(&ehci_cf_port_=
reset_rwsem);
5e467f6ebab151 Andiry Xu         2011-04-27  3094  =

75d7cf72ab9fa0 Andiry Xu         2011-09-13  3095  	return status;
5e467f6ebab151 Andiry Xu         2011-04-27  3096  }
5e467f6ebab151 Andiry Xu         2011-04-27  3097  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1721735354523329859==--


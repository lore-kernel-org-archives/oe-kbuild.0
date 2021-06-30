Content-Type: multipart/mixed; boundary="===============3491033000533267628=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 14450/15358] drivers/usb/host/xhci-mtk-sch.c:83:2: warning: %d in format string (no. 7) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Thu, 01 Jul 2021 06:33:31 +0800
Message-ID: <202107010613.mhkgMrcX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3491033000533267628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   e7fd97a9db5fa15cbdf7d93ec30726e4362b1fb1
commit: 6c5dbd50cb0a10ba33dad42a54e1d6bac7b6e1bc [14450/15358] UPSTREAM: us=
b: xhci-mtk: print debug info of endpoint interval
:::::: branch date: 4 hours ago
:::::: commit date: 9 days ago
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +83 drivers/usb/host/xhci-mtk-sch.c

0cbd4b34cda9df Chunfeng Yun 2015-11-24  66  =

6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  67  static const char *
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  68  decode_ep(struct usb_host_endpo=
int *ep, enum usb_device_speed speed)
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  69  {
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  70  	static char buf[DBG_BUF_EN];
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  71  	struct usb_endpoint_descriptor=
 *epd =3D &ep->desc;
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  72  	unsigned int interval;
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  73  	const char *unit;
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  74  =

6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  75  	interval =3D usb_decode_interv=
al(epd, speed);
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  76  	if (interval % 1000) {
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  77  		unit =3D "us";
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  78  	} else {
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  79  		unit =3D "ms";
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  80  		interval /=3D 1000;
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  81  	}
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  82  =

6c5dbd50cb0a10 Chunfeng Yun 2021-03-08 @83  	snprintf(buf, DBG_BUF_EN, "%s =
ep%d%s %s, mpkt:%d, interval:%d/%d%s\n",
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  84  		 usb_speed_string(speed), usb=
_endpoint_num(epd),
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  85  		 usb_endpoint_dir_in(epd) ? "=
in" : "out",
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  86  		 usb_ep_type_string(usb_endpo=
int_type(epd)),
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  87  		 usb_endpoint_maxp(epd), epd-=
>bInterval, interval, unit);
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  88  =

6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  89  	return buf;
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  90  }
6c5dbd50cb0a10 Chunfeng Yun 2021-03-08  91  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3491033000533267628==--


Content-Type: multipart/mixed; boundary="===============3024272998380427126=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/usb/etas_es58x/es58x_fd.c:174:8: warning: Uninitialized variable: rx_event_msg [uninitvar]
Date: Tue, 03 Aug 2021 03:31:10 +0800
Message-ID: <202108030307.ryURmLNU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3024272998380427126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>
CC: Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c7d102232649226a69dddd58a4942cf13cff4f7c
commit: c664e2137a27680922d8aeb64fb10313416b254f can: etas_es58x: add suppo=
rt for the ETAS ES58X_FD CAN USB interfaces
date:   4 months ago
:::::: branch date: 3 days ago
:::::: commit date: 4 months ago
compiler: mips-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/net/can/usb/etas_es58x/es58x_fd.c:
>> drivers/net/can/usb/etas_es58x/es58x_fd.c:174:8: warning: Uninitialized =
variable: rx_event_msg [uninitvar]
    ret =3D es58x_check_msg_len(es58x_dev->dev, *rx_event_msg, msg_len);
          ^

vim +174 drivers/net/can/usb/etas_es58x/es58x_fd.c

c664e2137a2768 Vincent Mailhol 2021-04-10  165  =

c664e2137a2768 Vincent Mailhol 2021-04-10  166  static int es58x_fd_rx_even=
t_msg(struct net_device *netdev,
c664e2137a2768 Vincent Mailhol 2021-04-10  167  				 const struct es58x_fd_=
urb_cmd *es58x_fd_urb_cmd)
c664e2137a2768 Vincent Mailhol 2021-04-10  168  {
c664e2137a2768 Vincent Mailhol 2021-04-10  169  	struct es58x_device *es58x=
_dev =3D es58x_priv(netdev)->es58x_dev;
c664e2137a2768 Vincent Mailhol 2021-04-10  170  	u16 msg_len =3D get_unalig=
ned_le16(&es58x_fd_urb_cmd->msg_len);
c664e2137a2768 Vincent Mailhol 2021-04-10  171  	const struct es58x_fd_rx_e=
vent_msg *rx_event_msg;
c664e2137a2768 Vincent Mailhol 2021-04-10  172  	int ret;
c664e2137a2768 Vincent Mailhol 2021-04-10  173  =

c664e2137a2768 Vincent Mailhol 2021-04-10 @174  	ret =3D es58x_check_msg_le=
n(es58x_dev->dev, *rx_event_msg, msg_len);
c664e2137a2768 Vincent Mailhol 2021-04-10  175  	if (ret)
c664e2137a2768 Vincent Mailhol 2021-04-10  176  		return ret;
c664e2137a2768 Vincent Mailhol 2021-04-10  177  =

c664e2137a2768 Vincent Mailhol 2021-04-10  178  	rx_event_msg =3D &es58x_fd=
_urb_cmd->rx_event_msg;
c664e2137a2768 Vincent Mailhol 2021-04-10  179  =

c664e2137a2768 Vincent Mailhol 2021-04-10  180  	return es58x_rx_err_msg(ne=
tdev, rx_event_msg->error_code,
c664e2137a2768 Vincent Mailhol 2021-04-10  181  				rx_event_msg->event_cod=
e,
c664e2137a2768 Vincent Mailhol 2021-04-10  182  				get_unaligned_le64(&rx_=
event_msg->timestamp));
c664e2137a2768 Vincent Mailhol 2021-04-10  183  }
c664e2137a2768 Vincent Mailhol 2021-04-10  184  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3024272998380427126==--


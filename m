Content-Type: multipart/mixed; boundary="===============1373884174161478547=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: drivers/usb/gadget/udc/max3420_udc.c:1065:5-6: ERROR: invalid reference to the index variable of the iterator on line 1057
Date: Sat, 11 Apr 2020 21:16:57 +0800
Message-ID: <202004112142.dzTiKNcH%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1373884174161478547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jassi Brar <jaswinder.singh@linaro.org>
CC: Felipe Balbi <balbi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5b8b9d0c6d0e0f1993c6c56deaf9646942c49d94
commit: 48ba02b2e2b1a1c80718e93fefe99c8319597c4a usb: gadget: add udc drive=
r for max3420
date:   4 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/usb/gadget/udc/max3420_udc.c:1065:5-6: ERROR: invalid reference =
to the index variable of the iterator on line 1057

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D48ba02b2e2b1a1c80718e93fefe99c8319597c4a
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 48ba02b2e2b1a1c80718e93fefe99c8319597c4a
vim +1065 drivers/usb/gadget/udc/max3420_udc.c

48ba02b2e2b1a1c Jassi Brar 2020-01-21  1047  =

48ba02b2e2b1a1c Jassi Brar 2020-01-21  1048  static int max3420_ep_dequeue(=
struct usb_ep *_ep, struct usb_request *_req)
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1049  {
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1050  	struct max3420_req *t, *req =
=3D to_max3420_req(_req);
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1051  	struct max3420_ep *ep =3D to_=
max3420_ep(_ep);
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1052  	unsigned long flags;
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1053  =

48ba02b2e2b1a1c Jassi Brar 2020-01-21  1054  	spin_lock_irqsave(&ep->lock, =
flags);
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1055  =

48ba02b2e2b1a1c Jassi Brar 2020-01-21  1056  	/* Pluck the descriptor from =
queue */
48ba02b2e2b1a1c Jassi Brar 2020-01-21 @1057  	list_for_each_entry(t, &ep->q=
ueue, queue)
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1058  		if (t =3D=3D req) {
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1059  			list_del_init(&req->queue);
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1060  			break;
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1061  		}
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1062  =

48ba02b2e2b1a1c Jassi Brar 2020-01-21  1063  	spin_unlock_irqrestore(&ep->l=
ock, flags);
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1064  =

48ba02b2e2b1a1c Jassi Brar 2020-01-21 @1065  	if (t =3D=3D req)
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1066  		max3420_req_done(req, -ECONN=
RESET);
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1067  =

48ba02b2e2b1a1c Jassi Brar 2020-01-21  1068  	return 0;
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1069  }
48ba02b2e2b1a1c Jassi Brar 2020-01-21  1070  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1373884174161478547==--


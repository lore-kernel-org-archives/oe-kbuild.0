Content-Type: multipart/mixed; boundary="===============5689161324638298832=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/core/devio.c:1155 do_proc_control() error: copy_from_user() 'tbuf' too small (4096 vs 8192)
Date: Sun, 24 Jan 2021 23:50:15 +0800
Message-ID: <202101242357.atnl19AZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5689161324638298832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e1ae4b0be15891faf46d390e9f3dc9bd71a8cae1
commit: c17536d0abde2fd24afca542e3bb73b45a299633 usb: usbfs: stop using com=
pat_alloc_user_space
date:   6 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 months ago
config: arc-randconfig-m031-20210124 (attached as .config)
compiler: arceb-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/usb/core/devio.c:1155 do_proc_control() error: copy_from_user() 'tb=
uf' too small (4096 vs 8192)

Old smatch warnings:
arch/arc/include/asm/thread_info.h:65 current_thread_info() error: uninitia=
lized symbol 'sp'.

vim +/tbuf +1155 drivers/usb/core/devio.c

^1da177e4c3f4152 Linus Torvalds     2005-04-16  1104  =

c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1105  static int do_proc_co=
ntrol(struct usb_dev_state *ps,
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1106  		struct usbdevfs_ctr=
ltransfer *ctrl)
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1107  {
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1108  	struct usb_device *d=
ev =3D ps->dev;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1109  	unsigned int tmo;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1110  	unsigned char *tbuf;
ff66e3ce35241251 Andrew Morton      2008-03-12  1111  	unsigned wLength;
4c6e8971cbe01480 Alan Stern         2009-06-29  1112  	int i, pipe, ret;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1113  =

c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1114  	ret =3D check_ctrlre=
cip(ps, ctrl->bRequestType, ctrl->bRequest,
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1115  			      ctrl->wIndex=
);
04e482ffd81437e7 Greg Kroah-Hartman 2008-01-30  1116  	if (ret)
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1117  		return ret;
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1118  	wLength =3D ctrl->wL=
ength;	/* To suppress 64k PAGE_SIZE warning */
ff66e3ce35241251 Andrew Morton      2008-03-12  1119  	if (wLength > PAGE_S=
IZE)
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1120  		return -EINVAL;
add1aaeabe6b08ed Alan Stern         2011-11-17  1121  	ret =3D usbfs_increa=
se_memory_usage(PAGE_SIZE + sizeof(struct urb) +
add1aaeabe6b08ed Alan Stern         2011-11-17  1122  			sizeof(struct usb_=
ctrlrequest));
add1aaeabe6b08ed Alan Stern         2011-11-17  1123  	if (ret)
add1aaeabe6b08ed Alan Stern         2011-11-17  1124  		return ret;
04e482ffd81437e7 Greg Kroah-Hartman 2008-01-30  1125  	tbuf =3D (unsigned c=
har *)__get_free_page(GFP_KERNEL);
add1aaeabe6b08ed Alan Stern         2011-11-17  1126  	if (!tbuf) {
add1aaeabe6b08ed Alan Stern         2011-11-17  1127  		ret =3D -ENOMEM;
add1aaeabe6b08ed Alan Stern         2011-11-17  1128  		goto done;
add1aaeabe6b08ed Alan Stern         2011-11-17  1129  	}
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1130  	tmo =3D ctrl->timeou=
t;
0880aef49e40abd1 Chris Frey         2010-01-26  1131  	snoop(&dev->dev, "co=
ntrol urb: bRequestType=3D%02x "
0880aef49e40abd1 Chris Frey         2010-01-26  1132  		"bRequest=3D%02x wV=
alue=3D%04x "
0880aef49e40abd1 Chris Frey         2010-01-26  1133  		"wIndex=3D%04x wLen=
gth=3D%04x\n",
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1134  		ctrl->bRequestType,=
 ctrl->bRequest, ctrl->wValue,
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1135  		ctrl->wIndex, ctrl-=
>wLength);
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1136  	if (ctrl->bRequestTy=
pe & 0x80) {
4c6e8971cbe01480 Alan Stern         2009-06-29  1137  		pipe =3D usb_rcvctr=
lpipe(dev, 0);
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1138  		snoop_urb(dev, NULL=
, pipe, ctrl->wLength, tmo, SUBMIT, NULL, 0);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1139  =

^1da177e4c3f4152 Linus Torvalds     2005-04-16  1140  		usb_unlock_device(d=
ev);
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1141  		i =3D usb_control_m=
sg(dev, pipe, ctrl->bRequest,
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1142  				    ctrl->bReques=
tType, ctrl->wValue, ctrl->wIndex,
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1143  				    tbuf, ctrl->w=
Length, tmo);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1144  		usb_lock_device(dev=
);
0880aef49e40abd1 Chris Frey         2010-01-26  1145  		snoop_urb(dev, NULL=
, pipe, max(i, 0), min(i, 0), COMPLETE,
9d02b42614149ebc Michal Sojka       2011-03-15  1146  			  tbuf, max(i, 0));
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1147  		if ((i > 0) && ctrl=
->wLength) {
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1148  			if (copy_to_user(c=
trl->data, tbuf, i)) {
52fb743d3aa7ee27 Alan Stern         2011-11-17  1149  				ret =3D -EFAULT;
52fb743d3aa7ee27 Alan Stern         2011-11-17  1150  				goto done;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1151  			}
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1152  		}
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1153  	} else {
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1154  		if (ctrl->wLength) {
c17536d0abde2fd2 Christoph Hellwig  2020-07-22 @1155  			if (copy_from_user=
(tbuf, ctrl->data, ctrl->wLength)) {
52fb743d3aa7ee27 Alan Stern         2011-11-17  1156  				ret =3D -EFAULT;
52fb743d3aa7ee27 Alan Stern         2011-11-17  1157  				goto done;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1158  			}
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1159  		}
4c6e8971cbe01480 Alan Stern         2009-06-29  1160  		pipe =3D usb_sndctr=
lpipe(dev, 0);
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1161  		snoop_urb(dev, NULL=
, pipe, ctrl->wLength, tmo, SUBMIT,
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1162  			tbuf, ctrl->wLengt=
h);
4c6e8971cbe01480 Alan Stern         2009-06-29  1163  =

^1da177e4c3f4152 Linus Torvalds     2005-04-16  1164  		usb_unlock_device(d=
ev);
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1165  		i =3D usb_control_m=
sg(dev, usb_sndctrlpipe(dev, 0), ctrl->bRequest,
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1166  				    ctrl->bReques=
tType, ctrl->wValue, ctrl->wIndex,
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1167  				    tbuf, ctrl->w=
Length, tmo);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1168  		usb_lock_device(dev=
);
0880aef49e40abd1 Chris Frey         2010-01-26  1169  		snoop_urb(dev, NULL=
, pipe, max(i, 0), min(i, 0), COMPLETE, NULL, 0);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1170  	}
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1171  	if (i < 0 && i !=3D =
-EPIPE) {
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1172  		dev_printk(KERN_DEB=
UG, &dev->dev, "usbfs: USBDEVFS_CONTROL "
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1173  			   "failed cmd %s =
rqt %u rq %u len %u ret %d\n",
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1174  			   current->comm, =
ctrl->bRequestType, ctrl->bRequest,
c17536d0abde2fd2 Christoph Hellwig  2020-07-22  1175  			   ctrl->wLength, =
i);
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1176  	}
52fb743d3aa7ee27 Alan Stern         2011-11-17  1177  	ret =3D i;
52fb743d3aa7ee27 Alan Stern         2011-11-17  1178   done:
52fb743d3aa7ee27 Alan Stern         2011-11-17  1179  	free_page((unsigned =
long) tbuf);
add1aaeabe6b08ed Alan Stern         2011-11-17  1180  	usbfs_decrease_memor=
y_usage(PAGE_SIZE + sizeof(struct urb) +
add1aaeabe6b08ed Alan Stern         2011-11-17  1181  			sizeof(struct usb_=
ctrlrequest));
52fb743d3aa7ee27 Alan Stern         2011-11-17  1182  	return ret;
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1183  }
^1da177e4c3f4152 Linus Torvalds     2005-04-16  1184  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5689161324638298832==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
w/gPqJv7uMEuAQA=
--===============5689161324638298832==--


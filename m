Content-Type: multipart/mixed; boundary="===============2327364356820406100=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/xen/xenbus/xenbus_probe.c:755 xenbus_probe() warn: should 'xen_store_gfn << 12' be a 64 bit type?
Date: Mon, 30 May 2022 14:49:36 +0800
Message-ID: <202205301452.1z1n4SBS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2327364356820406100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Luca Miccio <lucmiccio@gmail.com>
CC: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b00ed48bb0a7c295facf9036135a573a5cdbe7de
commit: 5b3353949e89d48b4faf54a9cc241ee5d70df615 xen: add support for initi=
alizing xenstore later as HVM domain
date:   11 days ago
:::::: branch date: 12 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-m021-20220530 (https://download.01.org/0day-ci/arch=
ive/20220530/202205301452.1z1n4SBS-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/xen/xenbus/xenbus_probe.c:755 xenbus_probe() warn: should 'xen_stor=
e_gfn << 12' be a 64 bit type?
drivers/xen/xenbus/xenbus_probe.c:1064 xenbus_init() warn: 'xen_store_inter=
face' from ioremap() not released on lines: 1025.

Old smatch warnings:
drivers/xen/xenbus/xenbus_probe.c:1012 xenbus_init() warn: should 'xen_stor=
e_gfn << 12' be a 64 bit type?

vim +755 drivers/xen/xenbus/xenbus_probe.c

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  749  =

c4295ab0b485b8 Julien Grall        2021-02-10  750  static void xenbus_prob=
e(void)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  751  {
a947f0f8f7012a Stefano Stabellini  2010-10-04  752  	xenstored_ready =3D 1;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  753  =

5b3353949e89d4 Luca Miccio         2022-05-13  754  	if (!xen_store_interfa=
ce) {
5b3353949e89d4 Luca Miccio         2022-05-13 @755  		xen_store_interface =
=3D xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
5b3353949e89d4 Luca Miccio         2022-05-13  756  						XEN_PAGE_SIZE);
5b3353949e89d4 Luca Miccio         2022-05-13  757  		/*
5b3353949e89d4 Luca Miccio         2022-05-13  758  		 * Now it is safe to =
free the IRQ used for xenstore late
5b3353949e89d4 Luca Miccio         2022-05-13  759  		 * initialization. No=
 need to unbind: it is about to be
5b3353949e89d4 Luca Miccio         2022-05-13  760  		 * bound again from x=
b_init_comms. Note that calling
5b3353949e89d4 Luca Miccio         2022-05-13  761  		 * unbind_from_irqhan=
dler now would result in xen_evtchn_close()
5b3353949e89d4 Luca Miccio         2022-05-13  762  		 * being called and t=
he event channel not being enabled again
5b3353949e89d4 Luca Miccio         2022-05-13  763  		 * afterwards, result=
ing in missed event notifications.
5b3353949e89d4 Luca Miccio         2022-05-13  764  		 */
5b3353949e89d4 Luca Miccio         2022-05-13  765  		free_irq(xs_init_irq,=
 &xb_waitq);
5b3353949e89d4 Luca Miccio         2022-05-13  766  	}
5b3353949e89d4 Luca Miccio         2022-05-13  767  =

3499ba8198cad4 David Woodhouse     2021-01-13  768  	/*
3499ba8198cad4 David Woodhouse     2021-01-13  769  	 * In the HVM case, xe=
nbus_init() deferred its call to
3499ba8198cad4 David Woodhouse     2021-01-13  770  	 * xs_init() in case c=
allbacks were not operational yet.
3499ba8198cad4 David Woodhouse     2021-01-13  771  	 * So do it now.
3499ba8198cad4 David Woodhouse     2021-01-13  772  	 */
3499ba8198cad4 David Woodhouse     2021-01-13  773  	if (xen_store_domain_t=
ype =3D=3D XS_HVM)
3499ba8198cad4 David Woodhouse     2021-01-13  774  		xs_init();
3499ba8198cad4 David Woodhouse     2021-01-13  775  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  776  	/* Notify others that =
xenstore is up */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  777  	blocking_notifier_call=
_chain(&xenstore_chain, 0, NULL);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  778  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  779  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2327364356820406100==--


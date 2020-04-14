Content-Type: multipart/mixed; boundary="===============7895779798060148828=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [leon-rdma:rdma-next 94/94] drivers/infiniband/ulp/srp/ib_srp.c:4202 srp_add_one() error: dereferencing freed memory 'srp_dev'
Date: Tue, 14 Apr 2020 10:34:59 +0300
Message-ID: <20200414073410.GB14722@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7895779798060148828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jason Gunthorpe <jgg@mellanox.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git=
 rdma-next
head:   ebf91e681f9ddd176c30210aa0a6140e6dbf14f1
commit: ebf91e681f9ddd176c30210aa0a6140e6dbf14f1 [94/94] RDMA: Allow ib_cli=
ent's to fail when add() is called
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/infiniband/ulp/srp/ib_srp.c:4202 srp_add_one() error: dereferencing=
 freed memory 'srp_dev'
net/rds/ib.c:194 rds_ib_add_one() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/infiniband/ulp/srp/ib_srp.c:2585 srp_cm_rep_handler() error: we pre=
viously assumed 'ch->rx_ring' could be null (see line 2578)
net/rds/ib.c:210 rds_ib_add_one() warn: passing zero to 'PTR_ERR'
net/rds/ib.c:218 rds_ib_add_one() warn: passing zero to 'PTR_ERR'
net/rds/ib.c:334 rds_ib_conn_info_visitor() error: we previously assumed 'i=
c' could be null (see line 324)
net/rds/ib.c:372 rds6_ib_conn_info_visitor() error: we previously assumed '=
ic' could be null (see line 361)

# https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commi=
t/?id=3Debf91e681f9ddd176c30210aa0a6140e6dbf14f1
git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/le=
on/linux-rdma.git
git remote update leon-rdma
git checkout ebf91e681f9ddd176c30210aa0a6140e6dbf14f1
vim +/srp_dev +4202 drivers/infiniband/ulp/srp/ib_srp.c

f071777f9cbd7 Christoph Hellwig 2016-09-05  4180  	if (never_register || !r=
egister_always ||
5f071777f9cbd7 Christoph Hellwig 2016-09-05  4181  	    (!srp_dev->has_fmr =
&& !srp_dev->has_fr))
5f071777f9cbd7 Christoph Hellwig 2016-09-05  4182  		flags |=3D IB_PD_UNSAF=
E_GLOBAL_RKEY;
5f071777f9cbd7 Christoph Hellwig 2016-09-05  4183  =

5cfb17828d877a Bart Van Assche   2014-05-20  4184  	if (srp_dev->use_fast_r=
eg) {
5cfb17828d877a Bart Van Assche   2014-05-20  4185  		srp_dev->max_pages_per=
_mr =3D
5cfb17828d877a Bart Van Assche   2014-05-20  4186  			min_t(u32, srp_dev->m=
ax_pages_per_mr,
042dd765bdf401 Bart Van Assche   2016-11-21  4187  			      attr->max_fast_=
reg_page_list_len);
5cfb17828d877a Bart Van Assche   2014-05-20  4188  	}
52ede08f00ebfc Bart Van Assche   2014-05-20  4189  	srp_dev->mr_max_size	=
=3D srp_dev->mr_page_size *
52ede08f00ebfc Bart Van Assche   2014-05-20  4190  				   srp_dev->max_page=
s_per_mr;
4a061b287b1eb5 Or Gerlitz        2015-12-18  4191  	pr_debug("%s: mr_page_s=
hift =3D %d, device->max_mr_size =3D %#llx, device->max_fast_reg_page_list_=
len =3D %u, max_pages_per_mr =3D %d, mr_max_size =3D %#x\n",
6c8541118bd53b Jason Gunthorpe   2018-09-20  4192  		 dev_name(&device->dev=
), mr_page_shift, attr->max_mr_size,
042dd765bdf401 Bart Van Assche   2016-11-21  4193  		 attr->max_fast_reg_pa=
ge_list_len,
52ede08f00ebfc Bart Van Assche   2014-05-20  4194  		 srp_dev->max_pages_pe=
r_mr, srp_dev->mr_max_size);
f5358a172f79e3 Roland Dreier     2006-06-17  4195  =

f5358a172f79e3 Roland Dreier     2006-06-17  4196  	INIT_LIST_HEAD(&srp_dev=
->dev_list);
f5358a172f79e3 Roland Dreier     2006-06-17  4197  =

f5358a172f79e3 Roland Dreier     2006-06-17  4198  	srp_dev->dev =3D device;
5f071777f9cbd7 Christoph Hellwig 2016-09-05  4199  	srp_dev->pd  =3D ib_all=
oc_pd(device, flags);
ebf91e681f9ddd Jason Gunthorpe   2020-03-03  4200  	if (IS_ERR(srp_dev->pd)=
) {
ebf91e681f9ddd Jason Gunthorpe   2020-03-03  4201  		kfree(srp_dev);
                                                                      ^^^^^=
^^
Free

ebf91e681f9ddd Jason Gunthorpe   2020-03-03 @4202  		return PTR_ERR(srp_dev=
->pd);
                                                                           =
    ^^^^^^^^^^^
Dereference

ebf91e681f9ddd Jason Gunthorpe   2020-03-03  4203  	}
f5358a172f79e3 Roland Dreier     2006-06-17  4204  =

cee687b68dbc71 Bart Van Assche   2017-10-11  4205  	if (flags & IB_PD_UNSAF=
E_GLOBAL_RKEY) {

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7895779798060148828==--


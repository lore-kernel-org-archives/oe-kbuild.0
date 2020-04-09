Content-Type: multipart/mixed; boundary="===============8527311605932224757=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [leon-rdma:rdma-next 94/94] drivers/infiniband/ulp/srp/ib_srp.c:4202 srp_add_one() error: dereferencing freed memory 'srp_dev'
Date: Fri, 10 Apr 2020 00:45:56 +0800
Message-ID: <202004100055.WNeiF2U4%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8527311605932224757==
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

dc1435c00fcd10 Leon Romanovsky   2019-05-17  4134  =

ebf91e681f9ddd Jason Gunthorpe   2020-03-03  4135  static int srp_add_one(s=
truct ib_device *device)
aef9ec39c47f0c Roland Dreier     2005-11-02  4136  {
f5358a172f79e3 Roland Dreier     2006-06-17  4137  	struct srp_device *srp_=
dev;
042dd765bdf401 Bart Van Assche   2016-11-21  4138  	struct ib_device_attr *=
attr =3D &device->attrs;
aef9ec39c47f0c Roland Dreier     2005-11-02  4139  	struct srp_host *host;
ea1075edcbab7d Jason Gunthorpe   2019-02-12  4140  	int mr_page_shift;
ea1075edcbab7d Jason Gunthorpe   2019-02-12  4141  	unsigned int p;
52ede08f00ebfc Bart Van Assche   2014-05-20  4142  	u64 max_pages_per_mr;
5f071777f9cbd7 Christoph Hellwig 2016-09-05  4143  	unsigned int flags =3D =
0;
aef9ec39c47f0c Roland Dreier     2005-11-02  4144  =

249f06561fc333 Bart Van Assche   2016-06-03  4145  	srp_dev =3D kzalloc(siz=
eof(*srp_dev), GFP_KERNEL);
f5358a172f79e3 Roland Dreier     2006-06-17  4146  	if (!srp_dev)
ebf91e681f9ddd Jason Gunthorpe   2020-03-03  4147  		return -ENOMEM;
f5358a172f79e3 Roland Dreier     2006-06-17  4148  =

f5358a172f79e3 Roland Dreier     2006-06-17  4149  	/*
f5358a172f79e3 Roland Dreier     2006-06-17  4150  	 * Use the smallest pag=
e size supported by the HCA, down to a
8f26c9ff9cd031 David Dillow      2011-01-14  4151  	 * minimum of 4096 byte=
s. We're unlikely to build large sglists
8f26c9ff9cd031 David Dillow      2011-01-14  4152  	 * out of smaller entri=
es.
f5358a172f79e3 Roland Dreier     2006-06-17  4153  	 */
042dd765bdf401 Bart Van Assche   2016-11-21  4154  	mr_page_shift		=3D max(=
12, ffs(attr->page_size_cap) - 1);
52ede08f00ebfc Bart Van Assche   2014-05-20  4155  	srp_dev->mr_page_size	=
=3D 1 << mr_page_shift;
52ede08f00ebfc Bart Van Assche   2014-05-20  4156  	srp_dev->mr_page_mask	=
=3D ~((u64) srp_dev->mr_page_size - 1);
042dd765bdf401 Bart Van Assche   2016-11-21  4157  	max_pages_per_mr	=3D at=
tr->max_mr_size;
52ede08f00ebfc Bart Van Assche   2014-05-20  4158  	do_div(max_pages_per_mr=
, srp_dev->mr_page_size);
509c5f33f4f6dc Bart Van Assche   2016-05-12  4159  	pr_debug("%s: %llu / %u=
 =3D %llu <> %u\n", __func__,
042dd765bdf401 Bart Van Assche   2016-11-21  4160  		 attr->max_mr_size, sr=
p_dev->mr_page_size,
509c5f33f4f6dc Bart Van Assche   2016-05-12  4161  		 max_pages_per_mr, SRP=
_MAX_PAGES_PER_MR);
52ede08f00ebfc Bart Van Assche   2014-05-20  4162  	srp_dev->max_pages_per_=
mr =3D min_t(u64, SRP_MAX_PAGES_PER_MR,
52ede08f00ebfc Bart Van Assche   2014-05-20  4163  					  max_pages_per_mr);
835ee624c99d0b Bart Van Assche   2016-05-12  4164  =

3023a1e93656c0 Kamal Heib        2018-12-10  4165  	srp_dev->has_fmr =3D (d=
evice->ops.alloc_fmr &&
3023a1e93656c0 Kamal Heib        2018-12-10  4166  			    device->ops.deall=
oc_fmr &&
3023a1e93656c0 Kamal Heib        2018-12-10  4167  			    device->ops.map_p=
hys_fmr &&
3023a1e93656c0 Kamal Heib        2018-12-10  4168  			    device->ops.unmap=
_fmr);
042dd765bdf401 Bart Van Assche   2016-11-21  4169  	srp_dev->has_fr =3D (at=
tr->device_cap_flags &
835ee624c99d0b Bart Van Assche   2016-05-12  4170  			   IB_DEVICE_MEM_MGT_=
EXTENSIONS);
c222a39f0d2652 Bart Van Assche   2016-05-12  4171  	if (!never_register && =
!srp_dev->has_fmr && !srp_dev->has_fr) {
835ee624c99d0b Bart Van Assche   2016-05-12  4172  		dev_warn(&device->dev,=
 "neither FMR nor FR is supported\n");
c222a39f0d2652 Bart Van Assche   2016-05-12  4173  	} else if (!never_regis=
ter &&
042dd765bdf401 Bart Van Assche   2016-11-21  4174  		   attr->max_mr_size >=
=3D 2 * srp_dev->mr_page_size) {
835ee624c99d0b Bart Van Assche   2016-05-12  4175  		srp_dev->use_fast_reg =
=3D (srp_dev->has_fr &&
835ee624c99d0b Bart Van Assche   2016-05-12  4176  					 (!srp_dev->has_fmr=
 || prefer_fr));
835ee624c99d0b Bart Van Assche   2016-05-12  4177  		srp_dev->use_fmr =3D !=
srp_dev->use_fast_reg && srp_dev->has_fmr;
509c5f33f4f6dc Bart Van Assche   2016-05-12  4178  	}
835ee624c99d0b Bart Van Assche   2016-05-12  4179  =

5f071777f9cbd7 Christoph Hellwig 2016-09-05  4180  	if (never_register || !=
register_always ||
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
ebf91e681f9ddd Jason Gunthorpe   2020-03-03 @4202  		return PTR_ERR(srp_dev=
->pd);
ebf91e681f9ddd Jason Gunthorpe   2020-03-03  4203  	}
f5358a172f79e3 Roland Dreier     2006-06-17  4204  =

cee687b68dbc71 Bart Van Assche   2017-10-11  4205  	if (flags & IB_PD_UNSAF=
E_GLOBAL_RKEY) {
cee687b68dbc71 Bart Van Assche   2017-10-11  4206  		srp_dev->global_rkey =
=3D srp_dev->pd->unsafe_global_rkey;
cee687b68dbc71 Bart Van Assche   2017-10-11  4207  		WARN_ON_ONCE(srp_dev->=
global_rkey =3D=3D 0);
cee687b68dbc71 Bart Van Assche   2017-10-11  4208  	}
f5358a172f79e3 Roland Dreier     2006-06-17  4209  =

ea1075edcbab7d Jason Gunthorpe   2019-02-12  4210  	rdma_for_each_port (dev=
ice, p) {
f5358a172f79e3 Roland Dreier     2006-06-17  4211  		host =3D srp_add_port(=
srp_dev, p);
aef9ec39c47f0c Roland Dreier     2005-11-02  4212  		if (host)
f5358a172f79e3 Roland Dreier     2006-06-17  4213  			list_add_tail(&host->=
list, &srp_dev->dev_list);
aef9ec39c47f0c Roland Dreier     2005-11-02  4214  	}
aef9ec39c47f0c Roland Dreier     2005-11-02  4215  =

f5358a172f79e3 Roland Dreier     2006-06-17  4216  	ib_set_client_data(devi=
ce, &srp_client, srp_dev);
ebf91e681f9ddd Jason Gunthorpe   2020-03-03  4217  	return 0;
aef9ec39c47f0c Roland Dreier     2005-11-02  4218  }
aef9ec39c47f0c Roland Dreier     2005-11-02  4219  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8527311605932224757==--

